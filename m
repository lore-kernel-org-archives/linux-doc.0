Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C0D347E3D1
	for <lwn-linux-doc@archive.lwn.net>; Tue,  7 Aug 2018 16:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388987AbeHGSnL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 7 Aug 2018 14:43:11 -0400
Received: from merlin.infradead.org ([205.233.59.134]:49906 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730869AbeHGSnL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Aug 2018 14:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Q0mn1OMmHOBMFh+uMVpRzMBHi87fQH990d7mXf7cDWw=; b=DmHRcrp04eyCHQl8ddYsh0FkYN
        Bx1hOgXrkUqamBATXQioQu2iXo0HhTKWR+bqrkqoVBYurlP8H80J9f2xeTbvRz0Qo2xdkxLU/7Q4J
        zn4paPvBGwzOp6cQFuWMQSYrWbEd4nwPIbvzrjO5D7mN1PuJweE2UC+Kb+y+uuvH+QUXaF+icUg9J
        aS9CSQEbeePMVya+eAr1dEyjy8aVqstzvSbOp6RQpw2rwNzPCYSdUbZ66OFj8wPDoImTg9pfIg/fG
        b20inOuwxsNTsrHVR4hrzAyrx2wYP7cpkq9H9F+dq7ecbbxeAgPlU66FNFlBx/YSoyWusI0eT+2BK
        a0BZGiMQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fn4pt-0001Eb-Qw; Tue, 07 Aug 2018 16:27:53 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Antonino Daplas <adaplas@pol.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation/fb: corrections for fbcon.txt
Message-ID: <74fe20d7-0200-fb2b-c765-63da788456be@infradead.org>
Date:   Tue, 7 Aug 2018 09:27:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix grammar, spacing, indentation, and Kconfig menu locations
in fbcon.txt.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Antonino Daplas <adaplas@pol.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/fb/fbcon.txt |   29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

--- lnx-418-rc8.orig/Documentation/fb/fbcon.txt
+++ lnx-418-rc8/Documentation/fb/fbcon.txt
@@ -18,9 +18,10 @@ made available by the underlying graphic
 A. Configuration
 
 	The framebuffer console can be enabled by using your favorite kernel
-configuration tool.  It is under Device Drivers->Graphics Support->Support for
-framebuffer devices->Framebuffer Console Support. Select 'y' to compile
-support statically, or 'm' for module support.  The module will be fbcon.
+configuration tool.  It is under Device Drivers->Graphics Support->Frame
+buffer Devices->Console display driver support->Framebuffer Console Support.
+Select 'y' to compile support statically or 'm' for module support.  The
+module will be fbcon.
 
 	In order for fbcon to activate, at least one framebuffer driver is
 required, so choose from any of the numerous drivers available. For x86
@@ -29,10 +30,10 @@ always be available. However, using a ch
 more speed and features, such as the ability to change the video mode
 dynamically.
 
-	To display the penguin logo, choose any logo available in Logo
-Configuration->Boot up logo.
+	To display the penguin logo, choose any logo available in Graphics
+support->Bootup logo.
 
-	Also, you will need to select at least one compiled-in fonts, but if
+	Also, you will need to select at least one compiled-in font, but if
 you don't do anything, the kernel configuration tool will select one for you,
 usually an 8x16 font.
 
@@ -135,16 +136,16 @@ C. Boot options
 
 	The angle can be changed anytime afterwards by 'echoing' the same
 	numbers to any one of the 2 attributes found in
-	 /sys/class/graphics/fbcon
+	/sys/class/graphics/fbcon:
 
 		rotate     - rotate the display of the active console
 		rotate_all - rotate the display of all consoles
 
-	Console rotation will only become available if Console Rotation
-	Support is compiled in your kernel.
+	Console rotation will only become available if Framebuffer Console
+	Rotation support is compiled in your kernel.
 
 	NOTE: This is purely console rotation.  Any other applications that
-	use the framebuffer will remain at their 'normal'orientation.
+	use the framebuffer will remain at their 'normal' orientation.
 	Actually, the underlying fb driver is totally ignorant of console
 	rotation.
 
@@ -157,7 +158,7 @@ C. Boot options
 
 C. Attaching, Detaching and Unloading
 
-Before going on how to attach, detach and unload the framebuffer console, an
+Before going on to how to attach, detach and unload the framebuffer console, an
 illustration of the dependencies may help.
 
 The console layer, as with most subsystems, needs a driver that interfaces with
@@ -175,7 +176,7 @@ because fbcon is an intermediate layer b
 
 console ---> fbcon ---> fbdev drivers ---> hardware
 
-The fbdev drivers cannot be unloaded if it's bound to fbcon, and fbcon cannot
+The fbdev drivers cannot be unloaded if bound to fbcon, and fbcon cannot
 be unloaded if it's bound to the console layer.
 
 So to unload the fbdev drivers, one must first unbind fbcon from the console,
@@ -225,7 +226,7 @@ restored properly. The following is one
        echo 0 > /sys/class/vtconsole/vtcon1/bind
 
 6. That's it, you're back to VGA mode. And if you compiled fbcon as a module,
-   you can unload it by 'rmmod fbcon'
+   you can unload it by 'rmmod fbcon'.
 
 7. To reattach fbcon:
 
@@ -283,7 +284,7 @@ Samples:
 ========
 
 Here are 2 sample bash scripts that you can use to bind or unbind the
-framebuffer console driver if you are in an X86 box:
+framebuffer console driver if you are on an X86 box:
 
 ---------------------------------------------------------------------------
 #!/bin/bash


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
