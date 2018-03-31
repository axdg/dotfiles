#!/usr/bin/env node

const { promisify } = require('util')
const fs = require('fs')
const path = require('path')
const cp = require('child_process')

const SCRIPT_PREFIX = '[dotfiles]:'
const LOCATIONS = path.resolve(__dirname, '../', './file_locations.txt')

const logger = {
  log: message => console.log(`${SCRIPT_PREFIX} ${message}`),
  error: message => console.log(`${SCRIPT_PREFIX} ${message}`)
}

const readFile = promisify(fs.readFile)

const exec = function (str) {
  return new Promise(function (resolve, reject) {
    cp.exec(str, function (err, stdout, stderr) {
      if (err) reject(err)
      return resolve([stdout, stderr])
    })
  })
}

const getConfigs = async function () {
  const list = await readFile(LOCATIONS, 'utf8')
  return list.split('\n').filter(l => !!l.trim()).reduce(function (previous, current) {
    const [descriptor, location] =  current.split(']: ')
    const filename = descriptor === '[' ? path.basename(location) : descriptor.slice(1)
    previous.push([filename, location])
    return previous
  }, [])
}

const copyFile = async function (filename, location) {
  try {
    await exec(`cp "${location}" ${path.resolve(__dirname, '../', './dotfiles', filename)}`)
  } catch (err) {
    throw err
  }
}

const pullConfigs = async function () {
  const configs = await getConfigs()

  for (let i = 0; i < configs.length; i++) {
    const [filename, location] = configs[i]
    logger.log(`Copying ${filename}`)
    try {
      await copyFile(filename, location)
    } catch (err) {
      logger.error(`Failed to copy ${filename}`)
    }
  }
}

pullConfigs().then(str => logger.log('Done.')).catch(str => str && logger.error(str))
