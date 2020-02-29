Return-Path: <SRS0=c74n=4R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD90C3F2CD
	for <linux-doc@archiver.kernel.org>; Sat, 29 Feb 2020 19:46:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E0EF2468A
	for <linux-doc@archiver.kernel.org>; Sat, 29 Feb 2020 19:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9+7onl+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgB2Tqt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 Feb 2020 14:46:49 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43453 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgB2Tqt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Feb 2020 14:46:49 -0500
Received: by mail-pf1-f193.google.com with SMTP id s1so3486268pfh.10
        for <linux-doc@vger.kernel.org>; Sat, 29 Feb 2020 11:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JCesXVwgXHb5ysMOKa3arGKHG24qGlhlxiB/OtEgvZ8=;
        b=O9+7onl+8Ln649LKaJ960xJjzwy8r6D1JVvKic42Vt90mZI5POrix2k+Ab2F93X6EU
         6+NqRcrDpz6Xbq5w+v7b3KmohuetV7n/O9f4+IdjUCX4TP6H8rIFgKmHLQpK2ir1QN8p
         hNVjisxiodJElMbLepZ5IPcJEJwgfeB2koTRDcq+dQUice1mHjx/N1f1MEVnLvq3Ud39
         yv6+FyAAsujpKg8tHzgPPNdJrUr74JImtMSXcofUXb8MqFmyj97QGrvYq0/2ZRnXJeCa
         +VUjwI+RLkxdV+v5fB6V6XSrSO6JK/MJnlcm3wYebfmNBtbybfMOhe2oDkj8baF7mT6m
         O53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JCesXVwgXHb5ysMOKa3arGKHG24qGlhlxiB/OtEgvZ8=;
        b=Uo7EfB2PSqmRRua+ypPxJS9iacVAZhJVOjHbtI5Z/+riIttgDiIboKlY6s/YbBfvDo
         kPzdXZBEPSWQqRxLqzW3RiFre2XfgHzscUBawgpned9f/HchflYuQqJuitGqfYJibJ/r
         nK1tGUqCgBbxNUj+CF98+NiuId8faqpIBzHfhHg3yS/zrYIJKEUGyN+orMAfzZwBtqqD
         J0NExfs9y7Btl+A7t0lXjPneJieSaOMOCuRqJVbAMPI8dLrWryLbVrGMASL+iF5iqggR
         MAIRqSXied9qgK1BjCLLoGwr9o+zy94Q2Pkhhipd98f3CXCktG8uoG9I4Ymzcs0CCoN/
         ZmBg==
X-Gm-Message-State: APjAAAVyioJvaqXmo+4HeUa56FAnkaUQvnOAO9SLxcdC+vxJQB4SPsCH
        +ol3RAtVIs6DzKyoc1WrFaU0Skj2ZRS8Xk5E
X-Google-Smtp-Source: APXvYqwX47HOpGvO+VLPfoF5otPSelYJv3E7fKGp9enh2mko5B+3TkHUczUfvDYUv0QTigC5wCbdWA==
X-Received: by 2002:a63:78c4:: with SMTP id t187mr10959911pgc.88.1583005608288;
        Sat, 29 Feb 2020 11:46:48 -0800 (PST)
Received: from localhost.localdomain ([103.118.34.152])
        by smtp.gmail.com with ESMTPSA id j12sm450707pga.78.2020.02.29.11.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 11:46:47 -0800 (PST)
From:   Pawan Kumar Meena <pawank1804@gmail.com>
To:     josh@joshtriplett.org, rostedt@goodmis.org,
        mathieu.desnoyers@efficios.com, corbet@lwn.net,
        joel@joelfernandes.org
Cc:     linux-doc@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Pawan Kumar Meena <pawank1804@gmail.com>
Subject: [PATCH] Documentation: RCU: lockdep.txt: Convert to lockdep.rst
Date:   Sun,  1 Mar 2020 01:16:36 +0530
Message-Id: <20200229194636.11494-1-pawank1804@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch converts lockdep.txt to lockdep.rst and adds it to index.rst.

Signed-off-by: Pawan Kumar Meena <pawank1804@gmail.com>
---
 Documentation/RCU/index.rst                    | 1 +
 Documentation/RCU/{lockdep.txt => lockdep.rst} | 2 ++
 2 files changed, 3 insertions(+)
 rename Documentation/RCU/{lockdep.txt => lockdep.rst} (99%)

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 81a0a1e5f767..109dea13f165 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -10,6 +10,7 @@ RCU concepts
    arrayRCU
    rcubarrier
    rcu_dereference
+   lockdep
    whatisRCU
    rcu
    listRCU
diff --git a/Documentation/RCU/lockdep.txt b/Documentation/RCU/lockdep.rst
similarity index 99%
rename from Documentation/RCU/lockdep.txt
rename to Documentation/RCU/lockdep.rst
index 89db949eeca0..4e71f77bdd28 100644
--- a/Documentation/RCU/lockdep.txt
+++ b/Documentation/RCU/lockdep.rst
@@ -1,3 +1,5 @@
+.. _lockdep_doc:
+
 RCU and lockdep checking
 
 All flavors of RCU have lockdep checking available, so that lockdep is
-- 
2.17.1

