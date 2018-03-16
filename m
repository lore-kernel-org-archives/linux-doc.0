Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6DEDB7E6B7
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 15:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932823AbeCPP5g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 11:57:36 -0400
Received: from mout01.posteo.de ([185.67.36.65]:44670 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934128AbeCPP5f (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 11:57:35 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 4E00020E5E
        for <linux-doc@vger.kernel.org>; Fri, 16 Mar 2018 16:57:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1521215853; bh=N5lXkWJ1OAYGP26OlMrQ+J/aqkI2Iu/Xxl+oveH7WuQ=;
        h=From:To:Cc:Subject:Date:From;
        b=RXb9Z3Gv//UE3xPwk1gWni6/EXKL6oBJF00J2iNr133dyCknvaN09dEHArcs39OAO
         1ZbipVzGqB+R7PP455jCSu/6jvVexx6UBo2/F1fpFa0zOBXsa1A5whY8v9EjRse1n8
         SIdj3iZVWcvcfZ9k7KJATN6JKWY7GvjHx8bvk69h7Tiy2NEy6lPTP1BsINIME/CTcr
         Epo4xXYeDATGuIYWkIWhvvsM02XNYykhAyS0LxJFEEj1Yk+y0A/cAGQvllJJFzqpm5
         ZQJ3J7xvHFeZo6Ju9pQv3Pwowgcm2k689HepBxySh9GsdcYFsfgP4DPl6tdcVIYY23
         SncyBw2x8jydA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 402qq03xKbz9rxX;
        Fri, 16 Mar 2018 16:57:32 +0100 (CET)
From:   Martin Kepplinger <martink@posteo.de>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH] README: Improve documentation descriptions
Date:   Fri, 16 Mar 2018 16:57:07 +0100
Message-Id: <20180316155707.28426-1-martink@posteo.de>
X-Mailer: git-send-email 2.14.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"This file" indeed was moved once, but at some point "this file", the
top-level README, becomes a file in itself. Now that time has come :)

Let's describe how things are, and suggest reading "this file" first,
"this file" simply being a the admin-guide README file, not a file that
was once moved.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

That's at least my opinion :)

thanks
                         martin


 README | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/README b/README
index b2ba4aaa3a71..12b4674a483c 100644
--- a/README
+++ b/README
@@ -1,10 +1,9 @@
 Linux kernel
 ============
 
-This file was moved to Documentation/admin-guide/README.rst
-
-Please notice that there are several guides for kernel developers and users.
-These guides can be rendered in a number of formats, like HTML and PDF.
+There are several guides for kernel developers and users. These guides can
+be rendered in a number of formats, like HTML and PDF. Please read
+Documentation/admin-guide/README.rst first.
 
 In order to build the documentation, use ``make htmldocs`` or
 ``make pdfdocs``.
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
