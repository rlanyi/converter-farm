job "transcode" {
  type        = "batch"
  datacenters = ["ams2"]

  meta {
    input   = ""
  }

  # The new "parameterized" stanza that marks a job as dispatchable. In this
  # example, there are two pieces of metadata (see above). The "input"
  # parameter is required, but the "profile" parameter is optional and defaults
  # to "small" if left unspecified when dispatching the job.
  parameterized {
    meta_required = ["input"]
  }

  task "tc" {
    driver = "exec"

    config {
      command = "docker"
      args    = ["run", "opencoconut/ffmpeg", "-i", "${NOMAD_META_INPUT}", "-f", "webm", "-c:v", "libvpx", "-c:a", "libvorbis", "-", ">", "test.webm"]
    }
  }
}
