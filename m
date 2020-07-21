Return-Path: <SRS0=huOA=BA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2911EC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jul 2020 10:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0627B20714
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jul 2020 10:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsqVPXMd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgGUKXh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Jul 2020 06:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGUKXh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Jul 2020 06:23:37 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DC6C061794
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2020 03:23:37 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o22so1455454pjw.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2020 03:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JitXdpgaCEbiRRe4XIqiHkLHaDJOBuXgtdCGdHmiHlA=;
        b=IsqVPXMdWNupYnWXusQkjJBUIh02V9g993mgrBjAn9cmjOC08zwk8waHxbrvOVmbnt
         dIrdiqbAxI0rE/B1Dr0AOXCOXkj5CJbj9EsBiCxoArPrTRJVRObwr7yG035J0kY6MKvY
         wggHwKZSQVn7t6I5qFsmaJTMvvpodpT130EMgtJ4fji4s77pqQ9iOHD7uma9jrACK5Zh
         3Bwnw9xkk7xogRVGPdkYnHXoiJ8naPbru6IF+zdGZP1ixG4/xMxYzcBAkrmrRjUjmMpB
         DrLJhwPMTecGS9UYpTWZJWCElEBOPvGvxTmeb7K1PoQ8DtppVpUBHPiV8vWTfa2ewdIP
         ZmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JitXdpgaCEbiRRe4XIqiHkLHaDJOBuXgtdCGdHmiHlA=;
        b=Jpa3aBIT43M3AI9WDirwhMi0tA2v1OJudQJh++DLUd+fqUejRFKJNYICKI8ZmlV6ct
         v9GUwY1o7or5+pyI91qrTITlwj9sIq+2PvxlC680nn7M1iKYm4RRTNFWG5FGNOG96NJ0
         SrDYdP2SfkmaUdyVoa40VBDfAYhKNWVN2HwlHzs7OPUhjKD/qGIyfaCtDKXv6c6qhKXv
         06j2hrqzCQDWJe8zMmT9Y4PRKu3i6a9QWZ332iZTeOod7eCmuDosDFRxA0tXXBI6EIhH
         PO9COEx2Pf+pQfjBCS4n8aoroNqzMYYq+A6SkDRb4l1q61OHXlQWMw/cjFn2RA9T9Tkh
         46lA==
X-Gm-Message-State: AOAM533Yvu7twlf7jihWvZs+iWlaNi9LP2I3DdTkLOVDs8fiDF/x7FGu
        6RZuBH308lZ49ClO+Pl3T1M=
X-Google-Smtp-Source: ABdhPJxRDMhQ9ApoqY3dVCZeKTXflxvWY7fxGTEUYcqyQgZFvL6mYjUSH4uelK9EKgIu61cK1vC5UA==
X-Received: by 2002:a17:90b:3010:: with SMTP id hg16mr4089704pjb.69.1595327016785;
        Tue, 21 Jul 2020 03:23:36 -0700 (PDT)
Received: from localhost.localdomain ([185.156.175.94])
        by smtp.gmail.com with ESMTPSA id y11sm19071037pfp.73.2020.07.21.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 03:23:35 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     rppt@linux.vnet.ibm.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] Made single word change in fourth paragraph for right sentence construction
Date:   Tue, 21 Jul 2020 15:49:34 +0530
Message-Id: <20200721101933.32500-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
Mike/Jon,
 it is nit ...but catch my eyes while reading...so the patch.

 Documentation/admin-guide/mm/concepts.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/concepts.rst b/Documentation/admin-guide/mm/concepts.rst
index c2531b14bf46..fa0974fbeae7 100644
--- a/Documentation/admin-guide/mm/concepts.rst
+++ b/Documentation/admin-guide/mm/concepts.rst
@@ -35,7 +35,7 @@ physical memory (demand paging) and provides a mechanism for the
 protection and controlled sharing of data between processes.
 
 With virtual memory, each and every memory access uses a virtual
-address. When the CPU decodes the an instruction that reads (or
+address. When the CPU decodes an instruction that reads (or
 writes) from (or to) the system memory, it translates the `virtual`
 address encoded in that instruction to a `physical` address that the
 memory controller can understand.
-- 
2.26.2

