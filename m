Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B64277D919
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 20:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbfGIUIO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 16:08:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33741 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729563AbfGIUIO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 16:08:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so20815799ljg.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2019 13:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eng.ucsd.edu; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d34BftXccSkkOw2k0/u/K3U+2xht36SrSsHp8EGBSb8=;
        b=aSPSgNcj8+aoFw+MkMG+Y3WZF4Ms2Wf+ZCFugavP2SmUYzN18znBtTzsUvUqXyO2cF
         RxyASWunQ5+xt+43YmhLB2c4vaF17HpYQQXDfHEsCWv+8vgr8cQd8nvUwNtqcYESIUuV
         ZxwZnUN5F2y0JeF8zsbPvFD+EOOTVbsq4nhs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d34BftXccSkkOw2k0/u/K3U+2xht36SrSsHp8EGBSb8=;
        b=kSVnuxewihT6dgsiOOAky8O9GYINWE2GWVl/ziyHsGiX5ST6vjQZ49qEGaP9EyfKBN
         e8sTKiGipmIOWsvKxQe1R4yHZdkDaZKXW+Miudfwrgc3qLQo/rLpxl9Njfz39WIJZdAR
         rr0CDNUNinpkbfht6Q2aEjXN3t68U6fQODA5i0ACo9vseU4svkCwPAG7PRr1W8k5ZAb5
         FfR11f7+qc4Q6IE7XJc1jg5JnGLtvOWr/nv9lVOHnZY7LR8kGz8vYi0tfvFiqyQT2C3U
         sEhgbVzcfZqlNSJDi+aPCMdZhxK1kX9F/gLUUwbcJmUCH+coSQyatK0Oh1vDXb+WWTIL
         tFpw==
X-Gm-Message-State: APjAAAXdh4z/tHem+pMwGnTrAB4gBVgVNDNmrGISQ3A3ctn7Ghgd1Vyr
        GpekHKAzcQantbpwDcHNX3v+Rw==
X-Google-Smtp-Source: APXvYqwNtgr6wAYFjFx5JnikxkEur/7m5rEnOML8Wr1tKMxcssDUYfH1+3ffnlzRHWL0zEedERWnLQ==
X-Received: by 2002:a2e:959a:: with SMTP id w26mr14985838ljh.150.1562702892320;
        Tue, 09 Jul 2019 13:08:12 -0700 (PDT)
Received: from luke-XPS-13.home (159-205-76-204.adsl.inetia.pl. [159.205.76.204])
        by smtp.gmail.com with ESMTPSA id f1sm4489ljk.86.2019.07.09.13.08.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 13:08:11 -0700 (PDT)
From:   Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
X-Google-Original-From: Luke Nowakowski-Krijger <lnowakow@neg.ucsd.edu>
To:     linux-kernel-mentees@lists.linuxfoundation.org
Cc:     Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>,
        pbonzini@redhat.com, rkrcmar@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Documentation: virtual: Convert paravirt_ops.txt to .rst
Date:   Tue,  9 Jul 2019 13:07:20 -0700
Message-Id: <20190709200721.16991-3-lnowakow@neg.ucsd.edu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709200721.16991-1-lnowakow@neg.ucsd.edu>
References: <20190709200721.16991-1-lnowakow@neg.ucsd.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>

Convert paravirt_opts.txt to .rst format to be able to be parsed by
sphinx.

Made some minor spacing and formatting corrections to make defintions
much more clear and easy to read. Added default kernel license to the
document.

Signed-off-by: Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>
---
 Changes since v2:
 none
 Changes since v1:
 + Converted doc to .rst format

 .../{paravirt_ops.txt => paravirt_ops.rst}    | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)
 rename Documentation/virtual/{paravirt_ops.txt => paravirt_ops.rst} (65%)

diff --git a/Documentation/virtual/paravirt_ops.txt b/Documentation/virtual/paravirt_ops.rst
similarity index 65%
rename from Documentation/virtual/paravirt_ops.txt
rename to Documentation/virtual/paravirt_ops.rst
index d4881c00e339..6b789d27cead 100644
--- a/Documentation/virtual/paravirt_ops.txt
+++ b/Documentation/virtual/paravirt_ops.rst
@@ -1,3 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============
 Paravirt_ops
 ============
 
@@ -18,15 +21,15 @@ at boot time.
 pv_ops operations are classified into three categories:
 
 - simple indirect call
-  These operations correspond to high level functionality where it is
-  known that the overhead of indirect call isn't very important.
+   These operations correspond to high level functionality where it is
+   known that the overhead of indirect call isn't very important.
 
 - indirect call which allows optimization with binary patch
-  Usually these operations correspond to low level critical instructions. They
-  are called frequently and are performance critical. The overhead is
-  very important.
+   Usually these operations correspond to low level critical instructions. They
+   are called frequently and are performance critical. The overhead is
+   very important.
 
 - a set of macros for hand written assembly code
-  Hand written assembly codes (.S files) also need paravirtualization
-  because they include sensitive instructions or some of code paths in
-  them are very performance critical.
+   Hand written assembly codes (.S files) also need paravirtualization
+   because they include sensitive instructions or some of code paths in
+   them are very performance critical.
-- 
2.20.1

