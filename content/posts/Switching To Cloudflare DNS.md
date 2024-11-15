+++
title = "Switching to Cloudflare DNS"
date = "2024-11-15"
author = "Ryan Porter"
authorTwitter = "" #do not include @
cover = ""
tags = ["Cloudflare", "WordPress", "DNS"]
keywords = ["", ""]
description = "I have switched my DNS from WordPress.com to Cloudflare!"
showFullContent = false
readingTime = true
hideComments = false
color = "" #color from the theme settings
draft = false
+++
In an effort to reduce expenses and enhance my web presence, I have switched to Cloudflare DNS. I will be saving about $10 on domain registration and close to $50 annually when I wind down my WordPress blog, which I haven't updated in over a year. 

[Cloudflare has excellent instructions](https://blog.cloudflare.com/a-step-by-step-guide-to-transferring-domains-to-cloudflare/) for transferring domains to their DNS service, and [WordPress has a similarly useful article](https://wordpress.com/support/domains/transfer-domain-registration/), but I thought I'd share the specific steps I took to transfer techno-literate.org away from WordPress.com. I regret neglecting to take screenshots of the process, but I'll describe it here for you.

1. Make note of your existing DNS records on WordPress.com. Cloudflare can scan for DNS records, but when I did this it completely missed my "resume" subdomain, and I had to manually add it later.
3. On WordPress.com, go to Upgrades > Domains and select the domain you are transferring. On the right, under "Transfer this domain", click "Transfer".
4. Click the toggle switch to disable the transfer lock. This is a feature that helps prevent people from accidentally transferring away their domains.
5. Click the button to get your authorization code. Without this code, you will be unable to finalize the transfer with Cloudflare. The code will be sent to the email address on your WordPress.com account, and will take 15-30 minutes to arrive. **Keep this tab open.**
6. On another tab, go to [cloudflare.com](cloudflare.com) and create a Cloudflare account, if you don't already have one.
7. Go to the Cloudflare dashboard ([https://dash.cloudflare.com/](https://dash.cloudflare.com/)) and click "+ Add a Domain". Follow the prompts; I found this part of the process to be very straightforward. There is an option to automatically detect your existing DNS records, and I recommend using that and then taking note of any records that it might have missed. The free plan was good enough for my purposes. **Note: The plan you are selecting now is not your domain registration plan!** You are selecting what level of DNS services you want here. You will pay for domain registration through Cloudflare later.
8. Cloudflare will assign you two nameservers. On your WordPress.com tab, go to Upgrades > Domains and open the Nameservers section. Paste in the two nameservers from Cloudflare. This step is important because within a short while Cloudflare can start hosting DNS requests for your domain _before the transfer is complete._ If you don't do this, you could experience disruption in access while the transfer goes through.
9. Once Cloudflare detects that the nameservers for your domain have been updated, you can go to the [Transfer Domains page](https://dash.cloudflare.com/?to=/:account/domains/transfer) to initiate the domain transfer process. You will be prompted to select your domain and paste in your transfer authorization code that you received in an email from WordPress.com.
10. Select a payment method and pay your registration fee.
11. You will receive an email from WordPress.com with the subject line, "Transfer away request for the domain techno-literate.com". There is a link to the Transfer Management Page for your domain; click this link and then click the "Accept Transfer" button to approve the transfer request.
12. You are done! Cloudflare will send you a helpful email to confirm that your transfer is complete.

Being totally honest, I have never transferred a domain to a new registrar before, and expected the process to be much more involved. Thanks to a lot of good documentation by both WordPress.com and Cloudflare, it was a breeze.