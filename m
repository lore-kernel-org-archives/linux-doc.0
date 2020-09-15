Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7CFC433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:31:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2AA62078D
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2+TLwFZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbgIPAbT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgIONot (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:44:49 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB29DC061223;
        Tue, 15 Sep 2020 06:32:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bg9so1351062plb.2;
        Tue, 15 Sep 2020 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ujXDcUsh4pOosE/dQkInO9T/Bumr5MmUhC/Hryc6hyw=;
        b=a2+TLwFZRBieQ4kF8d8NqKmakcGel05UdOV21sp8n0omsrQRLmb4wdGxRPAvU+uRSC
         bO3SKzrnAdS0H5i+k1Y9xT2Sjt/bAUsrB+2u2vgI5BZmwKwZT2GH4xvgUvHnl+ZPIkqX
         Rdxxfw6b82vVnC8CQ/9y4HNzU9YZ7VpfHSV7QohBrNfeeS3BYVogkjhb8BI6qh6QHt+q
         11u8UD9qrZl7tVd2X4evkEFMgNEhMdc9mxKFaQftfmsOSkual4HDMIMg12CCwNK5MMtU
         r/eKz+lPMX5ZAn2T/p0XJh6Hwd/7PDK1Jyaqn1TBQZz+GQxuy0Mv1VEOAwcUtpx/NqGt
         Plhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ujXDcUsh4pOosE/dQkInO9T/Bumr5MmUhC/Hryc6hyw=;
        b=YaRvwgdTZV8Wq3odenjBQuuDjF2IJfmk8I7uDnrZCbK8RyPjfI8s/fdYeL8fvSMIul
         zawL5ZWx2LrtZrJykECf3v6ywDIp5RU+17u8anRdMPUdeC9q4zy5gcj1wntsvhsc9y0Y
         uPYVZWj75bT8V2pa2ou29IqGnbdHLjMSTFi2JzC7pKOGm1GRUY69nBEP52/u2ATNKa3O
         uyR+mjOt1B6rBtoHDNEXBwWBTrC+sMNgVTkYGSkt5Lrw0VTpzGV+3VMgLCBnHYid1ZsA
         sJvAjhtemiT4KmIxWBkQEhyuIWchfXZ+RIz8CzLXBPIFl0FAhXgql7kx8acwPi7GIRgg
         CQNg==
X-Gm-Message-State: AOAM532JIUyn9cxM0l8hHo9MHiwIc4+/SXu1oPydqdgJnYYU3Z98rZDi
        zDnjFJHK//1uuoc0IOigNj4=
X-Google-Smtp-Source: ABdhPJxElAnP2O0/CYpmJeLhGlwT9dk8xTOOoeBLxlYjPU/u57i+0YVaDDTAByuz6oLcQj1azLuqHA==
X-Received: by 2002:a17:90a:db05:: with SMTP id g5mr4350446pjv.22.1600176759148;
        Tue, 15 Sep 2020 06:32:39 -0700 (PDT)
Received: from localhost.localdomain (sau-465d4-or.servercontrol.com.au. [43.250.207.1])
        by smtp.gmail.com with ESMTPSA id l14sm12110178pjy.1.2020.09.15.06.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 06:32:37 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     b.zolnierkie@samsung.com, linux-fbdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, rdunlap@infradead.org, gregkh@linuxfoundation.org,
        daniel@ffwll.ch, yuanmingbuaa@gmail.com, w@1wt.eu,
        nopitydays@gmail.com, zhangyunhai@nsfocus.com, luto@amacapital.net,
        torvalds@linux-foundation.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] docs: fb:  Remove scrollback option
Date:   Tue, 15 Sep 2020 18:57:36 +0530
Message-Id: <20200915132736.5264-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


This patch remove the scrollback option under boot option.
Plus readjust the numbers for the options in that section.

This is the effect of these commits:

973c096(vgacon: remove software scrollback support)
5014547(fbcon: remove soft scrollback code)

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/fb/fbcon.rst | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
index e57a3d1d085a..328f6980698c 100644
--- a/Documentation/fb/fbcon.rst
+++ b/Documentation/fb/fbcon.rst
@@ -87,15 +87,8 @@ C. Boot options
 	Note, not all drivers can handle font with widths not divisible by 8,
 	such as vga16fb.
 
-2. fbcon=scrollback:<value>[k]
 
-	The scrollback buffer is memory that is used to preserve display
-	contents that has already scrolled past your view.  This is accessed
-	by using the Shift-PageUp key combination.  The value 'value' is any
-	integer. It defaults to 32KB.  The 'k' suffix is optional, and will
-	multiply the 'value' by 1024.
-
-3. fbcon=map:<0123>
+2. fbcon=map:<0123>
 
 	This is an interesting option. It tells which driver gets mapped to
 	which console. The value '0123' is a sequence that gets repeated until
@@ -116,7 +109,7 @@ C. Boot options
 	Later on, when you want to map the console the to the framebuffer
 	device, you can use the con2fbmap utility.
 
-4. fbcon=vc:<n1>-<n2>
+3. fbcon=vc:<n1>-<n2>
 
 	This option tells fbcon to take over only a range of consoles as
 	specified by the values 'n1' and 'n2'. The rest of the consoles
@@ -127,7 +120,7 @@ C. Boot options
 	is typically located on the same video card.  Thus, the consoles that
 	are controlled by the VGA console will be garbled.
 
-5. fbcon=rotate:<n>
+4. fbcon=rotate:<n>
 
 	This option changes the orientation angle of the console display. The
 	value 'n' accepts the following:
@@ -152,21 +145,21 @@ C. Boot options
 	Actually, the underlying fb driver is totally ignorant of console
 	rotation.
 
-6. fbcon=margin:<color>
+5. fbcon=margin:<color>
 
 	This option specifies the color of the margins. The margins are the
 	leftover area at the right and the bottom of the screen that are not
 	used by text. By default, this area will be black. The 'color' value
 	is an integer number that depends on the framebuffer driver being used.
 
-7. fbcon=nodefer
+6. fbcon=nodefer
 
 	If the kernel is compiled with deferred fbcon takeover support, normally
 	the framebuffer contents, left in place by the firmware/bootloader, will
 	be preserved until there actually is some text is output to the console.
 	This option causes fbcon to bind immediately to the fbdev device.
 
-8. fbcon=logo-pos:<location>
+7. fbcon=logo-pos:<location>
 
 	The only possible 'location' is 'center' (without quotes), and when
 	given, the bootup logo is moved from the default top-left corner
@@ -174,7 +167,7 @@ C. Boot options
 	displayed due to multiple CPUs, the collected line of logos is moved
 	as a whole.
 
-9. fbcon=logo-count:<n>
+8. fbcon=logo-count:<n>
 
 	The value 'n' overrides the number of bootup logos. 0 disables the
 	logo, and -1 gives the default which is the number of online CPUs.
-- 
2.26.2

