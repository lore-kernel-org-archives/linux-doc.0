Return-Path: <SRS0=zh9o=6G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9FCC55186
	for <linux-doc@archiver.kernel.org>; Wed, 22 Apr 2020 08:57:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF1F12071E
	for <linux-doc@archiver.kernel.org>; Wed, 22 Apr 2020 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587545876;
	bh=T0Ecqqeogwc64+Z8FIbFGpj/DiG493zt5bD02Mb3brc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=1FTaLIHxmFI0zGSoC9vYbrn7ew3MdnnnmZWPvHWwxviOB2QZAf7Z1xf8rrJH1TQyv
	 dbi3lJLLJ4j5zi1I9N508aAwv4yLvQDu4Uv0i1pbu5p6vaYWLN+vkyQ1g1Pb3VYBMO
	 Tv2EecIdT8D2TEBzT5dOIGWoMbjVH3f5XqKV7/WU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgDVI5z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Apr 2020 04:57:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:55314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbgDVI5z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 Apr 2020 04:57:55 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DABAE206A2;
        Wed, 22 Apr 2020 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587545874;
        bh=T0Ecqqeogwc64+Z8FIbFGpj/DiG493zt5bD02Mb3brc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nSMt9SDpMsJRavYAIqOApPIPawVlznHQBsc6WBO+L8tOWEbynMVRE9Zgon4V+aLRz
         h5eC5DmX4LYgGBms4/HyyuCTuF7SZGL4sB2Y2ZyVN2g+eHCmWmJmsdfI8FDYr/qMeZ
         5+zd1zbbX06T2zQQmMXEofiJzQosy9Xey5hLb4pk=
Date:   Wed, 22 Apr 2020 10:57:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: Path troubles when using SPHINXDIRS option
Message-ID: <20200422105750.4fed3717@coco.lan>
In-Reply-To: <dbc22720-79fe-e7a8-b88c-46108ba5ccf9@darmarit.de>
References: <20200421103814.4e0fa4c3@coco.lan>
        <dbc22720-79fe-e7a8-b88c-46108ba5ccf9@darmarit.de>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 21 Apr 2020 12:52:42 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Hi Mauro,
> 
> Am 21.04.20 um 10:38 schrieb Mauro Carvalho Chehab:
> > 
> > Hi,
> > 
> > While building from v5.7-rc2 + media, I noticed that SPHINXDIRS option
> > stopped working.
> > 
> > What happens is that, if we don't pass this option, Sphinx assumes that
> > the "absolute" path is "Documentation/". So, include options like this:
> > 
> > 	.. include:: /ABI/stable/firewire-cdev
> > 	    :literal:
> > 
> > 
> > would be evaluated as Documentation/ABI/stable/firewire-cdev if built
> > without SPHINXDIRS. However, if we do SPHINXDIRS=driver-api, then
> > the "absolute" patch would be "Documentation/driver-api", causing this
> > error:
> > 
> > 	Sphinx parallel build error:
> > 	docutils.utils.SystemMessage: /devel/v4l/patchwork/Documentation/driver-api/firewire.rst:22: (SEVERE/4) Problems with "include" directive path:
> > 
> > This is specially bad for build jobs (like one we have on jenkins that
> > is meant to test media patches), as, due to some Sphinx bug, prevents
> > sphinx-build to stop, making the toolset to run forever.
> > 
> > I suspect that some change at conf.py could address the path issue.
> > 
> > I'll try to investigate further.
> > 
> > Just to be 100% sure that this is not some version-specific bad
> > behavior, I tested (using the latest patch version) Sphinx from
> > version 1.7.9 up to 2.4.4. The same two errors happen on all
> > versions.
> > 
> > Markus,
> > 
> > Maybe you may have some idea about how to fix those issues.
> > 
> > The parallel build error would likely require fixing something
> > inside Sphinx code, making it abort if it gets a "SEVERE" error.
> > 
> > Regards,
> > Mauro
> >   
> 
> I fixed it with the patch shown below.  Some words about: The use
> of the :doc: rule should be replaced by a :ref:.  The path names
> of include directives should always relative to the .rst file.

There are lots of place already using :doc: directive, on both
relative and absolute ways:

	$ git grep ':doc:'|wc -l
	382

Replacing all of them to :ref: will be painful. Also, IMHO, :doc: fits
better on most needs, as it makes easier for people working with
just plain texts to find to what file a ref points.

Btw, not sure why, but, when doing some conversions I got broken
references when using :ref:. So, I ended using :doc: instead.

> 
> To go further ... with patch below:
> 
>     $ make SPHINXDIRS="driver-api" htmldocs
> 
> shows some " WARNING: undefined label: ..." messages.  To close
> such links (addressing objects outside of the SPHINXDIR) we need
> to activate intersphinx [1].
> 
> If we activate intersphinx we have to wait one release cycle to
> get a objects.inv file at:
> 
>     https://www.kernel.org/doc/html/latest/
> 
> When the objects.inv file is available, the warnings are
> disappear.  

Yeah, interphinx would help a lot to solve broken references.

Not sure, however, if it is worth using it (at least for html).

I mean, IMHO, the big reason why someone would use SPHINXDIRS is to
speedup the process of testing if a documentation patch did the right
thing.

Anyway, it is up to Jon to decide about enabling intersphinx or not.

> 
> If the process of intersphinx is unclear, please ask.
> 
> 
> -- Markus --
> 
> [1] https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html
> 
> ----
> 
> diff --git a/Documentation/driver-api/firewire.rst b/Documentation/driver-api/firewire.rst
> index 94a2d7f01d99..67741aeae5e8 100644
> --- a/Documentation/driver-api/firewire.rst
> +++ b/Documentation/driver-api/firewire.rst
> @@ -19,16 +19,16 @@ of kernel interfaces is available via exported symbols in `firewire-core` module
>  Firewire char device data structures
>  ====================================
>  
> -.. include:: /ABI/stable/firewire-cdev
> +.. include:: ../ABI/stable/firewire-cdev
>      :literal:

Hmm... I remember I tried that. It worked now on my local machine.

Yet, the big issue here is that we can't ensure that developers
will always use relative paths. We need somehow convince Sphinx to
always use a fixed base path (/Documentation), even when building
part of a big document.

>  -.. kernel-doc:: include/uapi/linux/firewire-cdev.h
> +.. kernel-doc:: /include/uapi/linux/firewire-cdev.h
>      :internal:

This is not needed. Probably because both conf.py and Makefile
passes a kerneldoc source directory:

	$ grep kerneldoc_ Documentation/conf.py
	kerneldoc_bin = '../scripts/kernel-doc'
	kerneldoc_srctree = '..'
	$ grep kerneldoc_ Documentation/Makefile 
	KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)

>  
>  Firewire device probing and sysfs interfaces
>  ============================================
>  
> -.. include:: /ABI/stable/sysfs-bus-firewire
> +.. include:: ../ABI/stable/sysfs-bus-firewire
>      :literal:
>  
>  .. kernel-doc:: drivers/firewire/core-device.c
> diff --git a/Documentation/driver-api/gpio/using-gpio.rst b/Documentation/driver-api/gpio/using-gpio.rst
> index dda069444032..f2bd1e72af4e 100644
> --- a/Documentation/driver-api/gpio/using-gpio.rst
> +++ b/Documentation/driver-api/gpio/using-gpio.rst
> @@ -15,7 +15,7 @@ For any kind of mass produced system you want to support, such as servers,
>  laptops, phones, tablets, routers, and any consumer or office or business goods
>  using appropriate kernel drivers is paramount. Submit your code for inclusion
>  in the upstream Linux kernel when you feel it is mature enough and you will get
> -help to refine it, see :doc:`../../process/submitting-patches`.
> +help to refine it, see :ref:`submittingpatches`.
>  
>  In Linux GPIO lines also have a userspace ABI.
>  
> diff --git a/Documentation/driver-api/ioctl.rst b/Documentation/driver-api/ioctl.rst
> index c455db0e1627..ad91db68ba89 100644
> --- a/Documentation/driver-api/ioctl.rst
> +++ b/Documentation/driver-api/ioctl.rst
> @@ -34,7 +34,7 @@ _IO/_IOR/_IOW/_IOWR
>  
>  type
>     An 8-bit number, often a character literal, specific to a subsystem
> -   or driver, and listed in :doc:`../userspace-api/ioctl/ioctl-number`
> +   or driver, and listed in :ref:`ioctl numbers`
>  
>  nr
>    An 8-bit number identifying the specific command, unique for a give
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 52bf58417653..09647516ca52 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -1,3 +1,5 @@
> +.. _ioctl numbers:
> +
>  =============
>  Ioctl Numbers
>  =============
> 



Thanks,
Mauro
