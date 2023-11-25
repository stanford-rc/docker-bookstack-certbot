Hello!  This is a container image based on the
[LinuxServer.io](https://linuxserver.io) [Bookstack
container](https://docs.linuxserver.io/images/docker-bookstack).  It has been
modified to include Certbot.

With this image, you can have a Bookstack installation that automatically keeps
its server certificate up-to-date.  Data (certs and logs) are kept in the
`/config` path you already use.

## Usage

To use this container, you should follow the [Bookstack Usage
instructions](https://docs.linuxserver.io/images/docker-bookstack#usage), but
with the following changes:

### Container Image

You should pull your container image from here, instead of from Bookstack

### Variables

When you launch your Bookstack container, you will need to include two
additional environment variables:

* `LETS_ENCRYPT_CONTACT`: This must be set to an email address.  This email
  address will be sent important notifications from Let's Encrypt.  For
  example, in 2022 Let's Encrypt revoked a number of certificates; the
  certificates were revoked [after only a 5-day
  notice](https://community.letsencrypt.org/t/2022-01-25-issue-with-tls-alpn-01-validation-method/170450).
  In instances like that, Let's Encrypt will use this email address to notify
  you.

* `LETS_ENCRYPT_TOS_AGREE`: This must be set to the string `yes`.  Setting this
  to `yes` indicates that you accept the [Let's Encrypt Terms of
  Service](https://community.letsencrypt.org/tos).

Also, the following existing variables have changed:

* `APP_URL`: This **must** be an HTTPS URL.  Also, forward-slashes are not
  allowed (though port numbers are allowed).  In other words, your URL must
  point to the root of a domain.

  For example, `https://example.com` and `https://example.com:8080` are valid;
  but `https://example.com/`, `https://example.com:8080/`,
  `https://example.com/app`, and `https://example.com:8080/app` are not
  allowed.

## Config Changes

With this container, several new things appear in your `/config` directory:

* **Let's Encrypt Logs**: In `/config/logs/letsencrypt`, you will find
  Certbot's logs.  These will be log-rotated automatically.

* **TBD**: In `/config/TBD`, you will find the TLS private key and certificate
  chain for your site.  **Do not mess with these!**

## Copyright & License

This contents of this repo are © The Board of Trustees of the Leland Stanford
Junior University.  They were written by the contributors you see in the Git
history.

The contents of this repo are licensed via the [GNU General Public License,
version 3](https://www.gnu.org/licenses/gpl-3.0.html), the same license (at
least, at time of commit) as the LinuxServer.io Bookstack container.
