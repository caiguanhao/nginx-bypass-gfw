nginx-bypass-gfw
================

If you live in China, you can't visit Google, Twitter, Facebook and many
websites directly because of the Great FireWall. Usually, you may use VPN
or proxy thing like SOCKS. VPN is good, but sometimes is slow and hard to
connect to.

I found that [greatfire](https://github.com/greatfire/wiki) makes websites
that serve google.com for users in China to use. You can visit these sites
as if you are visiting Google directly. But they don't tell you how to make
them and I don't want my search history visible to them. So I started to
make these sites by my own.

This repository contains nginx configuration files that use `proxy_pass`
directive to set up a proxy server and use `subs_filter` to modify links in
the web page so that it makes no errors when loading.

Cost
----

* a VPS outside China, for digitalocean about $5 per month
* a domain name so that you can request a cert, about $8 per year
* request a free SSL cert from StartSSL

You can make your sites without certs, but because they are not encrypted,
you sometimes may fail to reach these sites since the URL keyword-censorship
system in China will reset your connection.

Pros
----

* Fast.
* Easy to set up.

Cons
----

* Not every website works.
* Only for browsers. Not for apps. Because you are using your own domain name.

Usage
-----

* Edit configs in `install.sh`.
* Run `./install.sh`.
* Copy config files in the `generated` directory to your nginx directory.

### Facebook

Since it is difficult to fix the log in problem for facebook, I would rather
copy the Cookie string in your Chrome, after you have successfully logged in
facebook, to the facebook nginx config file. Therefore, every one can see
your facebook, so we use auth_basic to secure the site.
