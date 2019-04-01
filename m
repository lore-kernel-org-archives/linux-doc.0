Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 222FC7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Apr 2019 06:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbfDAGMG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Apr 2019 02:12:06 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42433 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfDAGMG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Apr 2019 02:12:06 -0400
Received: by mail-pf1-f196.google.com with SMTP id r15so3992708pfn.9
        for <linux-doc@vger.kernel.org>; Sun, 31 Mar 2019 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=utxswtJJ+dRCea30iGSLjFY6Yy31vkXkff+lFsqPnHs=;
        b=Pt0dwQqwNRuXwhXvPPakZs/qkwhGEjATPk3qrc+v+4V+NrDN9hCnQiqv0bw47dKj3B
         oFP4WyNH2XP8+c2w6kTxOuvos79Jv+6GCaZ1GD5HANUTJAsnYHM5xtVt+f2uJpmMUXkl
         lG/5II65nHX6L0qgzGfYxJjnsbEolNnno8BrTp6TCLlqf/Qjjlj4SJ697xnlMOXQhQ1j
         naeg7qEYNtQ76Xye+d6f4OyyGRMt59i048eUcZeHsLPW3IDxDy1KopxtHipMTkzVK/tu
         /qEs7H332HqPtu8Mi/szooQEh0oD6HPyP6LTob/PENNDVIE+4YJeBK86/lFG8IHyVPY2
         kpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=utxswtJJ+dRCea30iGSLjFY6Yy31vkXkff+lFsqPnHs=;
        b=ZG7K6faQXNjZAtS5scHKgws3miyFLSmks1WVFN7QGelpYvVYlm/9pVm0Jt3Wyy/6bu
         nLcoLXFXwDTQw7VoeSZmCeBCY0AHaiYpe+uujYysTzSj5rzyatmE/LcNQWxTtCSJTMA0
         P3BsniYFbMDLyvmvztZhzv2cgnuDNNPFmSwDREhITDv6TQwvrf14+VENXR+mqC8+kbg6
         HYIRy7/LmDQKHgOENY9dRnn28coIAAJqT7Z0s5usmKwPDlcqFdji398+WMykdL+d77uN
         kRVs+yZwgqwzct2KCHBlFW3tBwfvVoOqDzxBOi1YdLqff1YdVgM14X10rxc5qoXPm/tF
         qj3Q==
X-Gm-Message-State: APjAAAVQAepLkwBqFqqVlZ0S7QkOTjCK98cqYJvMb05zVbjT4kEeGwfs
        oSx59nLpN04a8kEPs8S9/Wl7vVn9
X-Google-Smtp-Source: APXvYqzOwFNqiYRFhdtUDcIVxvJoVtRUMeMwtUGesVDp9UUsBGZXGjJoN1QMoeg5dXhnv3r3p+qrkw==
X-Received: by 2002:a63:6fcd:: with SMTP id k196mr46906200pgc.238.1554099125427;
        Sun, 31 Mar 2019 23:12:05 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
        by smtp.gmail.com with ESMTPSA id a129sm26783916pfa.152.2019.03.31.23.12.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Mar 2019 23:12:04 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation); Mon, 01 Apr 2019 16:41:59 +1030
From:   Joel Stanley <joel@jms.id.au>
To:     Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: powerpc: Expand the DAWR acronym
Date:   Mon,  1 Apr 2019 16:41:56 +1030
Message-Id: <20190401061156.31366-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Those not of us not drowning in POWER might not know what this means.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/powerpc/DAWR-POWER9.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/powerpc/DAWR-POWER9.txt b/Documentation/powerpc/DAWR-POWER9.txt
index 2feaa6619658..f6c24e54ce83 100644
--- a/Documentation/powerpc/DAWR-POWER9.txt
+++ b/Documentation/powerpc/DAWR-POWER9.txt
@@ -1,10 +1,10 @@
 DAWR issues on POWER9
 ============================
 
-On POWER9 the DAWR can cause a checkstop if it points to cache
-inhibited (CI) memory. Currently Linux has no way to disinguish CI
-memory when configuring the DAWR, so (for now) the DAWR is disabled by
-this commit:
+On POWER9 the Data Address Watchpoint Register (DAWR) can cause a checkstop
+if it points to cache inhibited (CI) memory. Currently Linux has no way to
+disinguish CI memory when configuring the DAWR, so (for now) the DAWR is
+disabled by this commit:
 
     commit 9654153158d3e0684a1bdb76dbababdb7111d5a0
     Author: Michael Neuling <mikey@neuling.org>
-- 
2.20.1

