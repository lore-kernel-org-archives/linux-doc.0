Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F47C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 15:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 481D461059
	for <linux-doc@archiver.kernel.org>; Fri,  3 Sep 2021 15:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349813AbhICP1U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Sep 2021 11:27:20 -0400
Received: from rosenzweig.io ([138.197.143.207]:45794 "EHLO rosenzweig.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349776AbhICP1J (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 3 Sep 2021 11:27:09 -0400
X-Greylist: delayed 460 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 Sep 2021 11:27:09 EDT
From:   Alyssa Rosenzweig <alyssa@rosenzweig.io>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, Takashi Iwai <tiwai@suse.de>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@protonmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH] docs: kernel-hacking: Remove inappropriate text
Date:   Fri,  3 Sep 2021 11:18:26 -0400
Message-Id: <20210903151826.6300-1-alyssa@rosenzweig.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove inappropriate sexual (and ableist) text from the locking
documentation, aligning it with the kernel code-of-conduct. As the text
was unrelated to locking, this change streamlines the document and
improves readability.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 Documentation/kernel-hacking/locking.rst | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index ed1284c6f078..3e1f71608f11 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -94,16 +94,10 @@ primitives, but I'll pretend they don't exist.
 Locking in the Linux Kernel
 ===========================
 
-If I could give you one piece of advice: never sleep with anyone crazier
-than yourself. But if I had to give you advice on locking: **keep it
-simple**.
+If I could give you one piece of advice on locking: **keep it simple**.
 
 Be reluctant to introduce new locks.
 
-Strangely enough, this last one is the exact reverse of my advice when
-you **have** slept with someone crazier than yourself. And you should
-think about getting a big dog.
-
 Two Main Types of Kernel Locks: Spinlocks and Mutexes
 -----------------------------------------------------
 
-- 
2.30.2

