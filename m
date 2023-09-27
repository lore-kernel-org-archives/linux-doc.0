Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A6EE82CAF
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 16:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjI0Qn4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 12:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjI0Qnz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 12:43:55 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A2795;
        Wed, 27 Sep 2023 09:43:54 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6515d44b562so68256436d6.3;
        Wed, 27 Sep 2023 09:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695833033; x=1696437833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEao/pkJ/HYJmlN4A0Twlg9bHlRAPLblCfEZbWhODcQ=;
        b=em8q0SuMVOYqrjimth9KEsdy51mJXtiECIzJ4mSQBvFz5FwMAoKOMns/sf+x0Kdv0W
         diOIFE5uFOXAgHf6Yh3DOSBvyXMh51k9GIpNDqyZI1qKJbK9mJWnFYnbkRQyIHtkRvFb
         PSk9lUByeRVSWF5qMOO1uTTiTOVQEBZnj+qCFL2kZu23h5AstHdVVIk07x7xOm/PRp/j
         DALoMYhsN7m5o/4hGLeHwydjpG9c5RL6v5Mjf0mfc+jSNt6JcHdpqUTt0fBmoEYsv/76
         A5IZjQbqlNXqUnMPrA4rWti9C5Ry7I4BvrX5cl+hfnMrtfVD3+rIRMK+O0NmZCdGnn1t
         HlZQ==
X-Gm-Message-State: AOJu0YzMrZdZaV6cWcXOrAgn/MDKpHQVEdml5Sydk0cSLlUQDiHoVCiu
        m5lg4xoRgVf5cb6SwM0urN3Xo4ws8E+//g==
X-Google-Smtp-Source: AGHT+IGkkOUsS6gtV/j32p6B8APXxBrA+aatvEt+eHYHdcBEfKIJ0Jisc2GIfNs4PSkiAAOQmOT/pg==
X-Received: by 2002:a0c:b30d:0:b0:65a:f9f3:e779 with SMTP id s13-20020a0cb30d000000b0065af9f3e779mr2108784qve.34.1695833033377;
        Wed, 27 Sep 2023 09:43:53 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a040:1a3:cb84:45fc:12dc:6d10:9889])
        by smtp.gmail.com with ESMTPSA id o18-20020a0ce412000000b0065b22afe53csm1730098qvl.94.2023.09.27.09.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:43:52 -0700 (PDT)
From:   Costa Shulyupin <costa.shul@redhat.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <muchun.song@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH] docs: update link to powerpc/vmemmap_dedup.rst
Date:   Wed, 27 Sep 2023 19:43:18 +0300
Message-ID: <20230927164319.2686237-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

after move of powerpc/ to arch/

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/mm/vmemmap_dedup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 59891f72420e..593ede6d314b 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -211,7 +211,7 @@ the device (altmap).
 
 The following page sizes are supported in DAX: PAGE_SIZE (4K on x86_64),
 PMD_SIZE (2M on x86_64) and PUD_SIZE (1G on x86_64).
-For powerpc equivalent details see Documentation/powerpc/vmemmap_dedup.rst
+For powerpc equivalent details see Documentation/arch/powerpc/vmemmap_dedup.rst
 
 The differences with HugeTLB are relatively minor.
 
-- 
2.41.0

