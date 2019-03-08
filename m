Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E65B87D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 11:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfCHLnQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Mar 2019 06:43:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:44434 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725789AbfCHLnQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Mar 2019 06:43:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 7D564AD93;
        Fri,  8 Mar 2019 11:43:14 +0000 (UTC)
From:   Juergen Gross <jgross@suse.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     x86@kernel.org, corbet@lwn.net, hpa@zytor.com, bp@alien8.de,
        mingo@redhat.com, tglx@linutronix.de, konrad.wilk@oracle.com,
        mfleming@suse.com, ross.philipson@oracle.com,
        daniel.kiper@oracle.com, Juergen Gross <jgross@suse.com>
Subject: [PATCH] doc: add boot protocol 2.13 description to Documentation/x86/boot.txt
Date:   Fri,  8 Mar 2019 12:43:10 +0100
Message-Id: <20190308114310.25041-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation/x86/boot.txt is missing protocol 2.13 description.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Documentation/x86/boot.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/x86/boot.txt b/Documentation/x86/boot.txt
index f4c2a97bfdbd..223e484a1304 100644
--- a/Documentation/x86/boot.txt
+++ b/Documentation/x86/boot.txt
@@ -61,6 +61,10 @@ Protocol 2.12:	(Kernel 3.8) Added the xloadflags field and extension fields
 		to struct boot_params for loading bzImage and ramdisk
 		above 4G in 64bit.
 
+Protocol 2.13:	(Kernel 3.14) Support 32- and 64-bit flags being set in
+		xloadflags to support booting a 64-bit kernel from 32-bit
+		EFI
+
 **** MEMORY LAYOUT
 
 The traditional memory map for the kernel loader, used for Image or
-- 
2.16.4

