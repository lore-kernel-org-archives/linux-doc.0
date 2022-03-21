Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90D5C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 21 Mar 2022 22:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbiCUWua (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Mar 2022 18:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiCUWuQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Mar 2022 18:50:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CACEB370C8C
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647901809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EAE8HCtpjM+jUc1ApTBvyoxBSZREVuBpm/2ip+JPuvw=;
        b=g3xaE9ts4I5zA/pQyhDUnSj3damHaMO3Yj9chLDNMvrH0e4NOKUF3iUbtuNf6CqkKXgZtK
        j8zBKaRtV6GeN1vxq6huZ+ZdiS5vq2kVllc363sMkny7Kd5myoo45YoycskZUUshOq7F6G
        DZwpPHvPWgQKAGFpdrSVai7A8CLpndg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-x7dkvXqyNu2Ix8rmMfkvhg-1; Mon, 21 Mar 2022 18:04:24 -0400
X-MC-Unique: x7dkvXqyNu2Ix8rmMfkvhg-1
Received: by mail-qt1-f199.google.com with SMTP id t26-20020ac8739a000000b002e06aa03d4cso10247181qtp.13
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 15:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EAE8HCtpjM+jUc1ApTBvyoxBSZREVuBpm/2ip+JPuvw=;
        b=1aEoXWJgGmcKZa3D4p9WVqTdie06IwQRkh2RxRPpj/40LlonJ3ytIZpoalVHkbKrl8
         vgxhUBarx7iKfGsV/BjS5Zm3SePl+ivlmD27maL7vu5QU8xN7eiTSQirL3vT33a1VhYc
         6OAvL4AAbVAvnDDfHOho5wtUulvAbdWT56Bl5DgE8G5W6FYP5E6FmFPMvGAexMfHZPOi
         L74EoaF50KQRB+Qe0/KMk1xROH8i1yoJR63dJCgDKXuaoM+iE6YnGhCG2oHeLKevDOys
         4JdvIPsJLuQCTPFEIbY1toNX0/k1s8p0YlzJUNXqgoXHWaQKd8eEE1E2o/YThHvARXhp
         RYxQ==
X-Gm-Message-State: AOAM531Lp1iuiGi3jAwlKjmRYBWzg5c/vP0o2kl3MrLLi9YgB+ek/Laj
        gYOSD6NwT1auWLJqE9nTBfa89q1b0q0kk5UymxvrwW23Vq924Sev+fqls7nowETyRKG/tWtVpY5
        gS4KRbVe/TgiNXpKfRZFX
X-Received: by 2002:a05:622a:13d2:b0:2e1:eedb:c81a with SMTP id p18-20020a05622a13d200b002e1eedbc81amr17047685qtk.437.1647900263482;
        Mon, 21 Mar 2022 15:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1U5Tj/wJe6NsZNnB2FgrrKyvSVD8FAkqs6udLgi3vy3yBsH2/Xd1pfjMZojGr6sjDBC2Sug==
X-Received: by 2002:a05:622a:13d2:b0:2e1:eedb:c81a with SMTP id p18-20020a05622a13d200b002e1eedbc81amr17047671qtk.437.1647900263231;
        Mon, 21 Mar 2022 15:04:23 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id de26-20020a05620a371a00b0067dc7923b14sm8218854qkb.132.2022.03.21.15.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:04:22 -0700 (PDT)
From:   trix@redhat.com
To:     corbet@lwn.net, dan.j.williams@intel.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] nvdimm/blk: Fix title level
Date:   Mon, 21 Mar 2022 15:04:08 -0700
Message-Id: <20220321220408.2381974-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

make htmldocs fails with
Sphinx parallel build error:
docutils.utils.SystemMessage: ...nvdimm.rst:146:
  (SEVERE/4) Title level inconsistent:

PMEM-REGIONs, Atomic Sectors, and DAX
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The PMEM vs BLK section was removed without changing
the PMEM-REGIONS... title line.  Replace '^' with '_'.

Fixes: f8669f1d6a86 ("nvdimm/blk: Delete the block-aperture window driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 Documentation/driver-api/nvdimm/nvdimm.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/nvdimm/nvdimm.rst b/Documentation/driver-api/nvdimm/nvdimm.rst
index 7917f64710920..be8587a558e1e 100644
--- a/Documentation/driver-api/nvdimm/nvdimm.rst
+++ b/Documentation/driver-api/nvdimm/nvdimm.rst
@@ -15,7 +15,7 @@ Version 13
 	    Supporting Documents
 	    Git Trees
 	LIBNVDIMM PMEM
-	        PMEM-REGIONs, Atomic Sectors, and DAX
+	    PMEM-REGIONs, Atomic Sectors, and DAX
 	Example NVDIMM Platform
 	LIBNVDIMM Kernel Device Model and LIBNDCTL Userspace API
 	    LIBNDCTL: Context
@@ -144,7 +144,7 @@ can be immediately attached to nd_pmem. This latter mode is called
 label-less or "legacy".
 
 PMEM-REGIONs, Atomic Sectors, and DAX
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+-------------------------------------
 
 For the cases where an application or filesystem still needs atomic sector
 update guarantees it can register a BTT on a PMEM device or partition.  See
-- 
2.26.3

