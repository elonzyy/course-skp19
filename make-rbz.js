const {promisify} = require('util')
const fs = require('fs')
const mkdir = promisify(fs.mkdir)
const path = require('path')
const archiver = require('archiver')

const output_path = path.resolve(__dirname + '/rbz/op_course_helpers.rbz')

async function run() {
  try { await mkdir(path.dirname(output_path)) }
  catch(e) { if (e.code !== 'EEXIST') throw e }

  const output = fs.createWriteStream(output_path)
  const archive = archiver('zip')

  output.on('close', () => {
    console.log(archive.pointer() + ' total bytes')
    console.log('archiver has been finalized and the output file descriptor has closed.')
  })

  output.on('end', () => console.log('Data has been drained'))

  archive.on('warning', console.log)
  archive.on('error', console.log)

  archive.pipe(output);

  archive.file('dist/op_course_helpers.rb', { name: 'op_course_helpers.rb' });
  archive.directory('dist/op_course_helpers', 'op_course_helpers');

  archive.finalize();
}

run().then(console.log).catch(console.error)
