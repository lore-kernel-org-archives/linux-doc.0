Return-Path: <SRS0=OmAX=5X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46862C2D0EC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 22:36:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0823C2063A
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 22:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciz2o5YZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgDGWgL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Apr 2020 18:36:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40458 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDGWgL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Apr 2020 18:36:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id a81so3483725wmf.5
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2020 15:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lIggZ3AIIJYx0Ug+IFvoSzD1JKMo6JtpcMCwZQxAPqU=;
        b=ciz2o5YZ76OjqR6KDzbC0DNEgnSAUENrCFNTpq9uJCi08CXX4Pm5/sSAzvjmuJuVyE
         EzedSWgaeOiYmrTcM/F1zjvjyRDUFVxt9QpfwHdRFYT31j1ybckQII3GqrpLwjjljerY
         IDrAI7N62tXgIy1DIiTaqkdD8Q8taHHp/kVZnOF2Q3ouEUwOC+YcxWhPTypKvRuKDDWl
         XqJ/4jlEytDz3henbkeJsbpje/70jRaA6D/ralw+S8jUqtGoEopN6Qvd2WY3xmdiXlm6
         f0Mc+k9noSGtA0I+QqyJXk0F17avgPqZCX+5YlPVevBqOHl7uvalAUqKzLJjf/YgKXBi
         XQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lIggZ3AIIJYx0Ug+IFvoSzD1JKMo6JtpcMCwZQxAPqU=;
        b=HK2EfgM0gUQ+1uTRq1S7fat2ZXhfo/8uTaG38SkjbN2ZPL0ilrg0/qnfvV9kK8H4cX
         VWt0POTAjaGPihtrg7qdLcU/iKwX29kQmtc370QD4vbx9u9cezY2fH64xLWdqx7q5rKO
         07mw9qwGlMaP/+n9b02ZYxKrZxEdwfuqFzDNzeLjXl3+Lt8m+BkFruETgek2sErU4/YZ
         2cA2/VdypRH/OyVMwegkjU8sLdjH1BHY5TeQur0PH0nHQwMGdXS428SyIWD0qY4cUrJR
         gIEfy+LiShTV1lYQAyATEpphzdxGnqJqOvicZcmQOQaWWJ11oxcvVBeEvIvXwzJ3d8W/
         dSZA==
X-Gm-Message-State: AGi0PuZvh1o5bVjZ+MXJ9azb9R39wOhALCzy7BBQGGqvq0cHZpbzMV/7
        X2Fs3pztSuvILvHxe2tCbFY=
X-Google-Smtp-Source: APiQypJ7PlxPIRhY0nX1hET2jXkQGOWMdvNUdorx6NReG6RBwoiOc9gZNQg/+PmSStzzGdjy1vgf/Q==
X-Received: by 2002:a1c:9ecb:: with SMTP id h194mr1561700wme.49.1586298970168;
        Tue, 07 Apr 2020 15:36:10 -0700 (PDT)
Received: from de0709bef958.v.cablecom.net ([185.104.184.118])
        by smtp.gmail.com with ESMTPSA id k84sm4277366wmk.2.2020.04.07.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 15:36:09 -0700 (PDT)
From:   Lothar Rubusch <l.rubusch@gmail.com>
To:     corbet@lwn.net, rdunlap@infradead.org
Cc:     linux-doc@vger.kernel.org, Lothar Rubusch <l.rubusch@gmail.com>
Subject: [PATCH v2] Documentation: memory - fix warning
Date:   Tue,  7 Apr 2020 22:34:55 +0000
Message-Id: <20200407223455.14027-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Running Sphinx v1.8.4 the following warning can be seen.

$ make htmldocs &> htmldocs.log
(...)
writing output... [ 16%] block/request .. crypto/api-akcipher
./include/linux/slab.h:503: WARNING: undefined label: memory-allocation
 (if the link has no caption the label must precede a section header)
writing output... [ 19%] crypto/api-digest .. driver-api/dmaengine/client
(...)

This patch fixes the above warning.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 include/linux/slab.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 03a389358562..6d454886bcaf 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -501,7 +501,7 @@ static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
  * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
  *
  * The recommended usage of the @flags is described at
- * :ref:`Documentation/core-api/memory-allocation.rst <memory-allocation>`
+ * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
  *
  * Below is a brief outline of the most useful GFP flags
  *
-- 
2.20.1

