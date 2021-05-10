Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53D5C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8364B61921
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhEJKcd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 06:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231716AbhEJKah (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 May 2021 06:30:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC2B06191B;
        Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620642443;
        bh=WcxroFtZr1e4TuhJOkqTwxZysaSMNSQlGqNc1/W2LME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jmMpoOyXSxvXbiW3NVOz1xmsf1qch4xwOmpAguGmc27zObBw38SeK7WTtEYkRRZHe
         2MOrlea5r5x0A3Kq7ldqwysWZeKM06pnuiBYGapDOh4V1HwieIaAYFRrxt0B3R+m8i
         R8kk5EVYwiIOfwhX0K2x7iZy9zo4qm5cSzSv8XpGrx6jSpPBrAPeHY2U94VUBsXVl9
         dksEUtUtnJO0s/19xoHxoeohsOUvkaeGi978YATNugJ0UQPVEm0LYBbAN8nuSOjEQ8
         n5frd91cfh00vxTFsxyhHQ4tbg09vL+8vlx3adfNIZYgKyHtsC//d9N7qWKwArbGFi
         4ChdyfHm+5cuQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lg38D-000UQ4-Kp; Mon, 10 May 2021 12:27:21 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, Chao Yu <chao@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org
Subject: [PATCH 27/53] docs: filesystems: f2fs.rst: avoid using UTF-8 chars
Date:   Mon, 10 May 2021 12:26:39 +0200
Message-Id: <c320db751bc326efbd1d619c0f8007d9965a32ab.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While UTF-8 characters can be used at the Linux documentation,
the best is to use them only when ASCII doesn't offer a good replacement.
So, replace the occurences of the following UTF-8 characters:

	- U+2013 ('–'): EN DASH
	- U+201c ('“'): LEFT DOUBLE QUOTATION MARK
	- U+201d ('”'): RIGHT DOUBLE QUOTATION MARK

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/f2fs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 992bf91eeec8..19d2cf477fc3 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -42,7 +42,7 @@ areas on disk for fast writing, we divide  the log into segments and use a
 segment cleaner to compress the live information from heavily fragmented
 segments." from Rosenblum, M. and Ousterhout, J. K., 1992, "The design and
 implementation of a log-structured file system", ACM Trans. Computer Systems
-10, 1, 26–52.
+10, 1, 26-52.
 
 Wandering Tree Problem
 ----------------------
@@ -86,8 +86,8 @@ Flash Awareness
 
 Wandering Tree Problem
 ----------------------
-- Use a term, “node”, that represents inodes as well as various pointer blocks
-- Introduce Node Address Table (NAT) containing the locations of all the “node”
+- Use a term, "node", that represents inodes as well as various pointer blocks
+- Introduce Node Address Table (NAT) containing the locations of all the "node"
   blocks; this will cut off the update propagation.
 
 Cleaning Overhead
-- 
2.30.2

