Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4020DEB64DA
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 23:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjF3Xdb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 19:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjF3Xda (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 19:33:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1DB2683;
        Fri, 30 Jun 2023 16:33:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 28BAA617A2;
        Fri, 30 Jun 2023 23:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B52CC433C8;
        Fri, 30 Jun 2023 23:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688168008;
        bh=wdXvIBgn1eGmE8h6DFbUHlgk1I7I6DDYfxIPFTNXd3A=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=YU7Eg+Ga36QQjMRUaRU8a3Vw337utJjr48orn4ggxTHq2CG+59LHfEQDV9Z9rOanN
         xsaI2ZtkWvfXaw2tXWqLVQT7gEfAinwl7nMHk/8n/TMYoEY/5G97RoFcTYkKQ4IuJ9
         a1CD2tmAXeMMQu9aYOmRCihBeU4oQ8xAR//I39toUW1OImgar63fvenF5MxmxurCkm
         sUI+jw7l34dHH7samaWjC1xskVFgo+EJ7XjyqpHibVQ4Ry2myCXoBv5F7aqsKNhCmP
         TTAoRTixcHpy5gefgWZjalfUah839YWLhYRnpeN3rsG4N5Gx8m5HWyR7PERoqF9HNn
         Ydzh72Ua5hIgA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 2AE91CE0DEA; Fri, 30 Jun 2023 16:33:28 -0700 (PDT)
Date:   Fri, 30 Jun 2023 16:33:28 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     mtk.manpages@gmail.com
Cc:     mhiramat@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        ndesaulniers@google.com, vbabka@suse.cz, hannes@cmpxchg.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] proc.5: Clarify that boot arguments can be embedded in image
Message-ID: <433d742b-743b-4335-878f-1ca0f45698f7@paulmck-laptop>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With the advent of the CONFIG_BOOT_CONFIG Kconfig option, kernel boot
arguments can now be embedded in the kernel image, either attached
to the end of initramfs or embedded in the kernel itself.  Document
this possibility in the /proc/cmdline entry of proc.5.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Johannes Weiner <hannes@cmpxchg.org>

diff --git a/man5/proc.5 b/man5/proc.5
index c6684620e..141a2983c 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -3100,6 +3100,9 @@ Often done via a boot manager such as
 .BR lilo (8)
 or
 .BR grub (8).
+Any arguments embedded in the kernel image or initramfs via 
+.B CONFIG_BOOT_CONFIG
+will also be displayed.
 .TP
 .IR /proc/config.gz " (since Linux 2.6)"
 This file exposes the configuration options that were used
