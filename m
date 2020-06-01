Return-Path: <SRS0=fuR8=7O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457FFC433DF
	for <linux-doc@archiver.kernel.org>; Mon,  1 Jun 2020 10:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E410206A4
	for <linux-doc@archiver.kernel.org>; Mon,  1 Jun 2020 10:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgFAKFy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Jun 2020 06:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgFAKFy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Jun 2020 06:05:54 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 01 Jun 2020 03:05:54 PDT
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA2FC061A0E
        for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2020 03:05:54 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:ad3e:d8bd:2f43:60f1])
        by laurent.telenet-ops.be with bizsmtp
        id lm0q2200H0bKQxm01m0qKQ; Mon, 01 Jun 2020 12:00:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jfhFS-0005Qi-LU; Mon, 01 Jun 2020 12:00:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jfhFS-0008W4-JP; Mon, 01 Jun 2020 12:00:50 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Joe Perches <joe@perches.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] Documentation/CodingStyle: Fix duplicate "are" typo
Date:   Mon,  1 Jun 2020 12:00:49 +0200
Message-Id: <20200601100049.32240-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The improved paragraph about line lengths contains a sentence with a
duplicate word: there is one "are" at the end of a line, followed by a
second one at the beginning of the next line.

Drop the first one, as that one is part of the longest line.

Fixes: bdc48fa11e46f867 ("checkpatch/coding-style: deprecate 80-column warning")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Perhaps we should aim for no line length limit at all, to make such
typos easier to catch? ;-)
---
 Documentation/process/coding-style.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 17a8e584f15f6ccf..2657a55c6f120d1c 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -90,7 +90,7 @@ Statements longer than 80 columns should be broken into sensible chunks,
 unless exceeding 80 columns significantly increases readability and does
 not hide information.
 
-Descendants are always substantially shorter than the parent and are
+Descendants are always substantially shorter than the parent and
 are placed substantially to the right.  A very commonly used style
 is to align descendants to a function open parenthesis.
 
-- 
2.17.1

