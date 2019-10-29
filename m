Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CC7BD7DBD4
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 14:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389531AbfJ2On4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 10:43:56 -0400
Received: from ms.lwn.net ([45.79.88.28]:45098 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388712AbfJ2On4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Oct 2019 10:43:56 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BC2282B4;
        Tue, 29 Oct 2019 14:43:54 +0000 (UTC)
Date:   Tue, 29 Oct 2019 08:43:49 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     hector.oron@gmail.com
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix warnings for unused files in toctree
Message-ID: <20191029084349.509d360b@lwn.net>
In-Reply-To: <20191029134445.28323-1-hector.oron@gmail.com>
References: <20191029134445.28323-1-hector.oron@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Oct 2019 14:44:45 +0100
hector.oron@gmail.com wrote:

> From: Héctor Orón Martínez <hector.oron@gmail.com>
> 
> There are a bunch of warnings for missing files in the toctree,
> and there are files that have been removed.
> 
> The following change fix those warnings.
> 
> Signed-off-by: Héctor Orón Martínez <hector.oron@gmail.com>
> ---
>  Documentation/admin-guide/device-mapper/index.rst | 1 +
>  Documentation/admin-guide/perf/index.rst          | 1 +
>  Documentation/gpu/i915.rst                        | 9 ---------
>  Documentation/misc-devices/index.rst              | 1 -
>  Documentation/usb/index.rst                       | 2 --
>  Documentation/usb/text_files.rst                  | 6 ------
>  6 files changed, 2 insertions(+), 18 deletions(-)

OK, we're getting closer, but there are still some learning opportunites
here...:)  The first of these is that it would be best to split these into
independent patches so that they can be considered separately; we'll see
why.

> diff --git a/Documentation/admin-guide/device-mapper/index.rst b/Documentation/admin-guide/device-mapper/index.rst
> index 4872fb6d2952..2545e4eaf6e5 100644
> --- a/Documentation/admin-guide/device-mapper/index.rst
> +++ b/Documentation/admin-guide/device-mapper/index.rst
> @@ -20,6 +20,7 @@ Device Mapper
>      dm-service-time
>      dm-uevent
>      dm-zoned
> +    dm-clone
>      era
>      kcopyd
>      linear

This one is good.

> diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
> index 47c99f40cc16..0795994865e0 100644
> --- a/Documentation/admin-guide/perf/index.rst
> +++ b/Documentation/admin-guide/perf/index.rst
> @@ -15,3 +15,4 @@ Performance monitor support
>     xgene-pmu
>     arm_dsu_pmu
>     thunderx2-pmu
> +   imx-ddr

This one is already fixed in docs-next.

> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 3415255ad3dc..7d1f65612856 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -358,15 +358,6 @@ Batchbuffer Parsing
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_cmd_parser.c
>     :internal:
>  
> -Batchbuffer Pools
> ------------------
> -
> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_batch_pool.c
> -   :doc: batch pool
> -
> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_batch_pool.c
> -   :internal:
> -
>  User Batchbuffer Execution
>  --------------------------

This one, instead, is fixed in the DRM tree; you would have seen that had
you looked in linux-next.  That's one of the challenges of the docs
"subsystem" - it gets touched from all over.

> diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
> index f11c5daeada5..a57f92dfe49a 100644
> --- a/Documentation/misc-devices/index.rst
> +++ b/Documentation/misc-devices/index.rst
> @@ -20,4 +20,3 @@ fit into other categories.
>     isl29003
>     lis3lv02d
>     max6875
> -   xilinx_sdfec

The correct fix here was to add the missing document; that was done in
docs-next a couple of weeks or so ago.

> diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
> index e55386a4abfb..36b6ebd9a9d9 100644
> --- a/Documentation/usb/index.rst
> +++ b/Documentation/usb/index.rst
> @@ -22,11 +22,9 @@ USB support
>      misc_usbsevseg
>      mtouchusb
>      ohci
> -    rio
>      usbip_protocol
>      usbmon
>      usb-serial
> -    wusb-design-overview
>  
>      usb-help
>      text_files

This one seems good.  But it's always worth doing a bit of digging to
figure out how something came to be...in this case, the rio driver was
deleted and wusbcore went into staging:

	015664d15270 USB: rio500: Remove Rio 500 kernel driver
	71ed79b0e4be USB: Move wusbcore and UWB to staging as it is obsolete

Submitting those separately with Fixes: tags would be good.

> diff --git a/Documentation/usb/text_files.rst b/Documentation/usb/text_files.rst
> index 6a8d3fcf64b6..1c18c05c3920 100644
> --- a/Documentation/usb/text_files.rst
> +++ b/Documentation/usb/text_files.rst
> @@ -16,12 +16,6 @@ USB devfs drop permissions source
>  .. literalinclude:: usbdevfs-drop-permissions.c
>      :language: c
>  
> -WUSB command line script to manipulate auth credentials
> --------------------------------------------------------
> -
> -.. literalinclude:: wusb-cbaf
> -   :language: shell
> -
>  Credits
>  -------

This goes with the wusb change as well.

I do appreciate your working to make the documentation better, sorry it can
be so painful to get started...

Thanks,

jon
