Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC70C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 22:06:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6FC0610FB
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 22:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234735AbhDOWHF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 18:07:05 -0400
Received: from ms.lwn.net ([45.79.88.28]:59254 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234654AbhDOWHF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 18:07:05 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 83C94304D;
        Thu, 15 Apr 2021 22:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 83C94304D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618524401; bh=WuuucvL2Pttw87eRa95FTdaE2LiUVf/8Gkb0QPKl3AY=;
        h=From:To:Cc:Subject:Date:From;
        b=TxeW11wiAYrtabRfjYxNS15XCTEaJ+VTOhQyBs4rCeE0jQzuIOxiaaMXpVe/MjNsA
         ZubY7YfvH04UioRuugh+voOIbCTDGEmp+oCS1o12IfwO9EJJYnMTTeyHOw0JBrKJNp
         c1MzFGAtvxFBUeE22DH8hnvxDnt4YgF+H/3foE6J4KsGlb5Mkau9uMB827pyMj3XDH
         TETh9eAfhlh0tfy4QvoU3lioa7aVDNX6guTnKwe9ucCneSoIBUObEEmkiI3evBvKBf
         zvtGJgYEGge4AdweSzDnk7IvSUES3FyOtcS4Pjwlrz6BLZvHzXT7rjxqz50AFSBk7v
         tYDL+8lh4H1tg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH] docs: sphinx-pre-install: don't barf on beta Sphinx releases
Date:   Thu, 15 Apr 2021 16:06:41 -0600
Message-ID: <87tuo7gq32.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sphinx-pre-install is picky when it comes to parsing sphinx versions; it
fails, killing the docs build, when run with sphinx 4.0.0b1.  Tweak the
regex to tolerate a trailing "bN" on the version number.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
The good news is that this appears to be the only thing that explodes
with Sphinx 4.0...

 scripts/sphinx-pre-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index b5f9fd5b2880..fe92020d67e3 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -259,7 +259,7 @@ sub get_sphinx_version($)
 
 	open IN, "$cmd --version 2>&1 |";
 	while (<IN>) {
-		if (m/^\s*sphinx-build\s+([\d\.]+)(\+\/[\da-f]+)?$/) {
+		if (m/^\s*sphinx-build\s+([\d\.]+)((\+\/[\da-f]+)|(b\d+))?$/) {
 			$ver=$1;
 			last;
 		}
-- 
2.30.2

