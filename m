Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B513C54FC9
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 11:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3653720656
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 11:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgDULCF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 07:02:05 -0400
Received: from smtp3-1.goneo.de ([85.220.129.38]:57372 "EHLO smtp3-1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDULCF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 07:02:05 -0400
X-Greylist: delayed 557 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Apr 2020 07:02:03 EDT
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 8E1DE23F802;
        Tue, 21 Apr 2020 12:52:44 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id egPUiPqAAhuj; Tue, 21 Apr 2020 12:52:42 +0200 (CEST)
Received: from [192.168.1.127] (dyndsl-091-096-138-038.ewe-ip-backbone.de [91.96.138.38])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 9656F23F3C5;
        Tue, 21 Apr 2020 12:52:42 +0200 (CEST)
Subject: Re: Path troubles when using SPHINXDIRS option
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <20200421103814.4e0fa4c3@coco.lan>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <dbc22720-79fe-e7a8-b88c-46108ba5ccf9@darmarit.de>
Date:   Tue, 21 Apr 2020 12:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421103814.4e0fa4c3@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

Am 21.04.20 um 10:38 schrieb Mauro Carvalho Chehab:
> 
> Hi,
> 
> While building from v5.7-rc2 + media, I noticed that SPHINXDIRS option
> stopped working.
> 
> What happens is that, if we don't pass this option, Sphinx assumes that
> the "absolute" path is "Documentation/". So, include options like this:
> 
> 	.. include:: /ABI/stable/firewire-cdev
> 	    :literal:
> 
> 
> would be evaluated as Documentation/ABI/stable/firewire-cdev if built
> without SPHINXDIRS. However, if we do SPHINXDIRS=driver-api, then
> the "absolute" patch would be "Documentation/driver-api", causing this
> error:
> 
> 	Sphinx parallel build error:
> 	docutils.utils.SystemMessage: /devel/v4l/patchwork/Documentation/driver-api/firewire.rst:22: (SEVERE/4) Problems with "include" directive path:
> 
> This is specially bad for build jobs (like one we have on jenkins that
> is meant to test media patches), as, due to some Sphinx bug, prevents
> sphinx-build to stop, making the toolset to run forever.
> 
> I suspect that some change at conf.py could address the path issue.
> 
> I'll try to investigate further.
> 
> Just to be 100% sure that this is not some version-specific bad
> behavior, I tested (using the latest patch version) Sphinx from
> version 1.7.9 up to 2.4.4. The same two errors happen on all
> versions.
> 
> Markus,
> 
> Maybe you may have some idea about how to fix those issues.
> 
> The parallel build error would likely require fixing something
> inside Sphinx code, making it abort if it gets a "SEVERE" error.
> 
> Regards,
> Mauro
> 

I fixed it with the patch shown below.  Some words about: The use
of the :doc: rule should be replaced by a :ref:.  The path names
of include directives should always relative to the .rst file.

To go further ... with patch below:

    $ make SPHINXDIRS="driver-api" htmldocs

shows some " WARNING: undefined label: ..." messages.  To close
such links (addressing objects outside of the SPHINXDIR) we need
to activate intersphinx [1].

If we activate intersphinx we have to wait one release cycle to
get a objects.inv file at:

    https://www.kernel.org/doc/html/latest/

When the objects.inv file is available, the warnings are
disappear.  

If the process of intersphinx is unclear, please ask.


-- Markus --

[1] https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html

----

diff --git a/Documentation/driver-api/firewire.rst b/Documentation/driver-api/firewire.rst
index 94a2d7f01d99..67741aeae5e8 100644
--- a/Documentation/driver-api/firewire.rst
+++ b/Documentation/driver-api/firewire.rst
@@ -19,16 +19,16 @@ of kernel interfaces is available via exported symbols in `firewire-core` module
 Firewire char device data structures
 ====================================
 
-.. include:: /ABI/stable/firewire-cdev
+.. include:: ../ABI/stable/firewire-cdev
     :literal:
 
-.. kernel-doc:: include/uapi/linux/firewire-cdev.h
+.. kernel-doc:: /include/uapi/linux/firewire-cdev.h
     :internal:
 
 Firewire device probing and sysfs interfaces
 ============================================
 
-.. include:: /ABI/stable/sysfs-bus-firewire
+.. include:: ../ABI/stable/sysfs-bus-firewire
     :literal:
 
 .. kernel-doc:: drivers/firewire/core-device.c
diff --git a/Documentation/driver-api/gpio/using-gpio.rst b/Documentation/driver-api/gpio/using-gpio.rst
index dda069444032..f2bd1e72af4e 100644
--- a/Documentation/driver-api/gpio/using-gpio.rst
+++ b/Documentation/driver-api/gpio/using-gpio.rst
@@ -15,7 +15,7 @@ For any kind of mass produced system you want to support, such as servers,
 laptops, phones, tablets, routers, and any consumer or office or business goods
 using appropriate kernel drivers is paramount. Submit your code for inclusion
 in the upstream Linux kernel when you feel it is mature enough and you will get
-help to refine it, see :doc:`../../process/submitting-patches`.
+help to refine it, see :ref:`submittingpatches`.
 
 In Linux GPIO lines also have a userspace ABI.
 
diff --git a/Documentation/driver-api/ioctl.rst b/Documentation/driver-api/ioctl.rst
index c455db0e1627..ad91db68ba89 100644
--- a/Documentation/driver-api/ioctl.rst
+++ b/Documentation/driver-api/ioctl.rst
@@ -34,7 +34,7 @@ _IO/_IOR/_IOW/_IOWR
 
 type
    An 8-bit number, often a character literal, specific to a subsystem
-   or driver, and listed in :doc:`../userspace-api/ioctl/ioctl-number`
+   or driver, and listed in :ref:`ioctl numbers`
 
 nr
   An 8-bit number identifying the specific command, unique for a give
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 52bf58417653..09647516ca52 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -1,3 +1,5 @@
+.. _ioctl numbers:
+
 =============
 Ioctl Numbers
 =============

