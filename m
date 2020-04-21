Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD92AC54FCC
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 16:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2B2D2070B
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587488237;
	bh=ZMjic/kHoTu9aQuYEPSO0wAqwNOZUSDBn1RybeMf048=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=xkHECn4CdGMBnFo5xlFkHt8PCndmvDF1ORWGTMad7UUTtYAJd0eUlyJWvU1s/A9ii
	 1RbiLFxKCFknhBd1BFOZ8BYVh6JDFEzE8pI2nE71hFlmoucp6KGWFY3hxWB0eftUEn
	 WKYohEbJKJj68URKdzvhUPeYy1mrNUT8lP85851c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgDUQ5Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 12:57:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729003AbgDUQyq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 12:54:46 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44CC12076E;
        Tue, 21 Apr 2020 16:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587488084;
        bh=ZMjic/kHoTu9aQuYEPSO0wAqwNOZUSDBn1RybeMf048=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y5bR3LMiOAcD1WrP8uT5evU7aboDnxD22jeCIYBY6c+73QQpd/3Gw6fWsAGC5vl3S
         iFn0XpD61TM7ytaYLLfusRkpk2qxEFy7ZMxlDxt8Q4JsmE9et82G8Ho4YoKZKbGGZF
         B5tmLNHBpoZo28jA27qw/9nftbhemd6MUliDO39I=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jQwAU-00CmEW-Hq; Tue, 21 Apr 2020 18:54:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 15/29] docs: filesystems: convert fuse-io.txt to ReST
Date:   Tue, 21 Apr 2020 18:54:26 +0200
Message-Id: <b32ab688aa4f3392939f5d24666ea96ed2bf456c.1587487612.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587487612.git.mchehab+huawei@kernel.org>
References: <cover.1587487612.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Add a SPDX header;
- Add a document title;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/{fuse-io.txt => fuse-io.rst} | 6 ++++++
 Documentation/filesystems/index.rst                    | 1 +
 2 files changed, 7 insertions(+)
 rename Documentation/filesystems/{fuse-io.txt => fuse-io.rst} (95%)

diff --git a/Documentation/filesystems/fuse-io.txt b/Documentation/filesystems/fuse-io.rst
similarity index 95%
rename from Documentation/filesystems/fuse-io.txt
rename to Documentation/filesystems/fuse-io.rst
index 07b8f73f100f..255a368fe534 100644
--- a/Documentation/filesystems/fuse-io.txt
+++ b/Documentation/filesystems/fuse-io.rst
@@ -1,3 +1,9 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============
+Fuse I/O Modes
+==============
+
 Fuse supports the following I/O modes:
 
 - direct-io
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index a996d880025e..844e8065ac82 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -85,6 +85,7 @@ Documentation for filesystem implementations.
    hfsplus
    hpfs
    fuse
+   fuse-io
    inotify
    isofs
    nilfs2
-- 
2.25.2

