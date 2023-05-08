Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60F4C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  8 May 2023 05:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbjEHF7h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 May 2023 01:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbjEHF7e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 May 2023 01:59:34 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B263213854;
        Sun,  7 May 2023 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=1dCjcKAEnQ411omHCOVFyvsOwdZaZO9UpsrQTgMf9e0=; b=eydKThLigQoQiMyZT/8tq81SNv
        nIGZonbM26SPCm8H2q/RTyXQlQa48evbD1At0CF6B5ErjHJTrUeOLHTYnszQwQw4Swz7sL2hBtlbu
        wUibt1d0iVdlWNFSJu0FJP9Z2xsvBTDcukFZqIKkXfyMQtiimEPdtDkIknaAOcLj0N4Ee2UdrMBAC
        M0wGVGrfUyzWFlc/5viiI+Oi3B//dNCoVQvSPzByjAHmwe7mnwG72iK4rdGzF1Tqb+7c8nOOo/2XU
        EA5MD9SN8gNTMbMUUhUiy4t6IIMiKH18MMZ5cxrUcwwlfpV+wJFymqJRgv+mTU8vXHOL0PGp1tygE
        P6gUT57Q==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pvtuC-00HLfV-2y;
        Mon, 08 May 2023 05:59:29 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        linux-fsdevel@vger.kernel.org, Rob Landley <rob@landley.net>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] Documentation/filesystems: ramfs-rootfs-initramfs: use :Author:
Date:   Sun,  7 May 2023 22:59:28 -0700
Message-Id: <20230508055928.3548-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use the :Author: markup instead of making it a chapter heading.
This cleans up the table of contents for this file.

Fixes: 7f46a240b0a1 ("[PATCH] ramfs, rootfs, and initramfs docs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: Rob Landley <rob@landley.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 Documentation/filesystems/ramfs-rootfs-initramfs.rst |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -- a/Documentation/filesystems/ramfs-rootfs-initramfs.rst b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
--- a/Documentation/filesystems/ramfs-rootfs-initramfs.rst
+++ b/Documentation/filesystems/ramfs-rootfs-initramfs.rst
@@ -6,8 +6,7 @@ Ramfs, rootfs and initramfs
 
 October 17, 2005
 
-Rob Landley <rob@landley.net>
-=============================
+:Author: Rob Landley <rob@landley.net>
 
 What is ramfs?
 --------------
