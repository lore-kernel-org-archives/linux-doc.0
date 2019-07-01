Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 57ED67D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Jul 2019 00:34:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfGAAe2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 30 Jun 2019 20:34:28 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41524 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfGAAe1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Jun 2019 20:34:27 -0400
Received: by mail-ot1-f66.google.com with SMTP id o101so11375769ota.8
        for <linux-doc@vger.kernel.org>; Sun, 30 Jun 2019 17:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aWbgPH3XonMN6owsynXwhWMSFd28BasNvZgJRxwbjCA=;
        b=gAWXjF/zZP2nDoNBCKDbxu0ZKE1myZqjwwhAoiK5LFfqnezKC91BUzjmSzeMs7mzF/
         YDTYDxEmMbdArvcsJ6nBPsLKsTklirJVH48rUdcxwGdcB/pBbv1jcvXt0QG4kJxk8ngt
         CdqWr8gHs+RDqRf2nnNCJXxALDmKH3A5YgbBU1N1Rj75RAfvmIawet1yvK7eCSRzNhec
         nFEUPfT9+YjlcL2V9inKKIAdW1C8u2A/JqwvUf0UdkJXpUDkYkMJGF0byeHkHN9UxQdO
         uNFCJR83FgoIS66NhaAAw3YDj8pXvu9uiZjMPWCwbyHKPTKaYbc8BK+HWqVZoPZjKMkm
         HVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=aWbgPH3XonMN6owsynXwhWMSFd28BasNvZgJRxwbjCA=;
        b=CIXFKx0ZbgjYdzh4EQWaRbGC8EmEbf081vMTnBacYzFeql8yIyDDuHGNsFjJAw+E5H
         KWRxsVKEK2iZM+SOeELgayrgYJfkjINpsOGGQdywBIWfdfRBrfedBsOhBLqKS/avEQ6h
         NN+7YDvCSNfhFQmzOjNcTF0QWYc/ucPWHJ5t+QA7TFiHuyJkar2T5n8aUpnbxF48AoOE
         80Pwz2APRaN6JWWk+hxBqJTV2Z0lPU/k9T8GgwDhbbR/QgMcUD+X4knBTvGsHAfrORvC
         W2cE8nMJNz6tP5fA+n8GnRFCNyOVFLbt9SvN2X2I5ORE0If6yLTEmaZF5q9S6Osf66rQ
         Ec2w==
X-Gm-Message-State: APjAAAW0dwAY4blTVpBhvs+uE3FaDcTsChgys0VQG3TNbVv8WTAxi5cp
        0RTSen++/hKbx9yty31/s9HF6A==
X-Google-Smtp-Source: APXvYqw/VoWTpq7cSJ49D3dkrN3RFZeu2+nmdSBNztS+jNhP7YBmoZnXr6rwTRVOH/CylnrqB0RjsQ==
X-Received: by 2002:a9d:7a45:: with SMTP id z5mr18421274otm.197.1561941266143;
        Sun, 30 Jun 2019 17:34:26 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:9997:a955:13ad:73b])
        by smtp.gmail.com with ESMTPSA id z20sm737199oic.31.2019.06.30.17.34.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jun 2019 17:34:25 -0700 (PDT)
Date:   Sun, 30 Jun 2019 19:34:23 -0500
From:   Corey Minyard <cminyard@mvista.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Asmaa Mnebhi <Asmaa@mellanox.com>, vadimp@mellanox.com
Subject: Re: [PATCH] docs: ipmb: place it at driver-api and convert to ReST
Message-ID: <20190701003423.GA5041@minyard.net>
Reply-To: cminyard@mvista.com
References: <d23c36ca65fe6ad56af1723bf70f7a7f4154c410.1561804596.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d23c36ca65fe6ad56af1723bf70f7a7f4154c410.1561804596.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 29, 2019 at 07:36:46AM -0300, Mauro Carvalho Chehab wrote:
> No new doc should be added at the main Documentation/ directory.
> 
> Instead, new docs should be added as ReST files, within the
> Kernel documentation body.

Got it, thanks.

-corey

> 
> Fixes: 51bd6f291583 ("Add support for IPMB driver")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/driver-api/index.rst            |  1 +
>  .../{IPMB.txt => driver-api/ipmb.rst}         | 62 ++++++++++---------
>  2 files changed, 33 insertions(+), 30 deletions(-)
>  rename Documentation/{IPMB.txt => driver-api/ipmb.rst} (71%)
> 
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index e33849b948c7..e49c34bf16c0 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -75,6 +75,7 @@ available subsections can be seen below.
>     dell_rbu
>     edid
>     eisa
> +   ipmb
>     isa
>     isapnp
>     generic-counter
> diff --git a/Documentation/IPMB.txt b/Documentation/driver-api/ipmb.rst
> similarity index 71%
> rename from Documentation/IPMB.txt
> rename to Documentation/driver-api/ipmb.rst
> index cd20c9764705..3ec3baed84c4 100644
> --- a/Documentation/IPMB.txt
> +++ b/Documentation/driver-api/ipmb.rst
> @@ -32,11 +32,11 @@ This driver works with the I2C driver and a userspace
>  program such as OpenIPMI:
>  
>  1) It is an I2C slave backend driver. So, it defines a callback
> -function to set the Satellite MC as an I2C slave.
> -This callback function handles the received IPMI requests.
> +   function to set the Satellite MC as an I2C slave.
> +   This callback function handles the received IPMI requests.
>  
>  2) It defines the read and write functions to enable a user
> -space program (such as OpenIPMI) to communicate with the kernel.
> +   space program (such as OpenIPMI) to communicate with the kernel.
>  
>  
>  Load the IPMB driver
> @@ -48,34 +48,35 @@ CONFIG_IPMB_DEVICE_INTERFACE=y
>  
>  1) If you want the driver to be loaded at boot time:
>  
> -a) Add this entry to your ACPI table, under the appropriate SMBus:
> +a) Add this entry to your ACPI table, under the appropriate SMBus::
>  
> -Device (SMB0) // Example SMBus host controller
> -{
> -  Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
> -  Name (_UID, 0) // Unique ID of particular host controller
> -  :
> -  :
> -    Device (IPMB)
> -    {
> -      Name (_HID, "IPMB0001") // IPMB device interface
> -      Name (_UID, 0) // Unique device identifier
> -    }
> -}
> +     Device (SMB0) // Example SMBus host controller
> +     {
> +     Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
> +     Name (_UID, 0) // Unique ID of particular host controller
> +     :
> +     :
> +       Device (IPMB)
> +       {
> +         Name (_HID, "IPMB0001") // IPMB device interface
> +         Name (_UID, 0) // Unique device identifier
> +       }
> +     }
>  
> -b) Example for device tree:
> +b) Example for device tree::
>  
> -&i2c2 {
> -         status = "okay";
> +     &i2c2 {
> +            status = "okay";
>  
> -         ipmb@10 {
> -                 compatible = "ipmb-dev";
> -                 reg = <0x10>;
> -         };
> -};
> +            ipmb@10 {
> +                    compatible = "ipmb-dev";
> +                    reg = <0x10>;
> +            };
> +     };
>  
> -2) Manually from Linux:
> -modprobe ipmb-dev-int
> +2) Manually from Linux::
> +
> +     modprobe ipmb-dev-int
>  
>  
>  Instantiate the device
> @@ -86,15 +87,16 @@ described in 'Documentation/i2c/instantiating-devices.rst'.
>  If you have multiple BMCs, each connected to your Satellite MC via
>  a different I2C bus, you can instantiate a device for each of
>  those BMCs.
> +
>  The name of the instantiated device contains the I2C bus number
> -associated with it as follows:
> +associated with it as follows::
>  
> -BMC1 ------ IPMB/I2C bus 1 ---------|   /dev/ipmb-1
> +  BMC1 ------ IPMB/I2C bus 1 ---------|   /dev/ipmb-1
>  				Satellite MC
> -BMC1 ------ IPMB/I2C bus 2 ---------|   /dev/ipmb-2
> +  BMC1 ------ IPMB/I2C bus 2 ---------|   /dev/ipmb-2
>  
>  For instance, you can instantiate the ipmb-dev-int device from
> -user space at the 7 bit address 0x10 on bus 2:
> +user space at the 7 bit address 0x10 on bus 2::
>  
>    # echo ipmb-dev 0x1010 > /sys/bus/i2c/devices/i2c-2/new_device
>  
> -- 
> 2.21.0
> 
