Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44C5C43461
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:42:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D23020809
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="lc0/0lOX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgIPAmD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgIONC4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:02:56 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF27DC061797
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:02:55 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id o20so1871488pfp.11
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eNchCXlujHVbLKrDly+nb0OZuzhDeUp4zy0iJXX+zts=;
        b=lc0/0lOXMXW6CqInlrV1vRTsQtfbMiUBOwP4cPSQ/2UvctoSkPq85BGm4npwx+3wUc
         VqUklikLospgrLDQ4wlW3z7rPyOBrciyG1K0DugATR9FIHAYeCTZSiXDv5SOiU8HNN4e
         z2S6v7c0SeINkiwtNed/vqPdtCGDDopnBEbxbRUw/oWYqcgtnq9kg/b1BUUAABcHlhTb
         rDilY8ZLwf2qRc9VvcjtsCtmKcBoZ5vkzsG7FvnWeB2eqtXZGodOHGHj9GslKqG4bjbz
         DcbPgKTU/Gucf9acbpdx0Zpf0x9H+UEafA7kwQVLDGAd7Ilj/oVoLIVGpKR30LL2G/7m
         Bspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eNchCXlujHVbLKrDly+nb0OZuzhDeUp4zy0iJXX+zts=;
        b=InVcUsRjBdVVlUa78B5EqSkTh0nPfMLMsC9c6ko/AhsVs4WnDm74DqZ6OtW2gxw7qd
         d+xCqyMqIjhHU4Q9P8HgnWJYXCPClAExAhsxGWUzGgvs64FzhWqN14dsX+xitvRoSspz
         yVvh0Q6v4gbW8LHPiR3sDNdsbtXpucDcLFhLhhgcUkh8ka6rr9JQAWsf0zUxI+frCv/1
         /u01fb4lquSMKsTKCIa/OJawUfn/jJjMxYUTPwU2l983kNRTxmLDKA+yxiNvuJGFoLDQ
         EI2O+umXdw7rohCItemymwDpltdTUQw5PqUA8MB6bjM2s3P3JwKupFEXKqemduWpYtQb
         jrRA==
X-Gm-Message-State: AOAM531SwNNSjTRg1TQyj3ZXRB4r4W69LECZKcXp/+b8fsQbI74+b1sL
        WLj5/g7lDTA4j904CU31As6uBw==
X-Google-Smtp-Source: ABdhPJwmk58xJFs7bVQwlQ8TOo6QNgpQumZzCogF3iD2x+NuPWVnOo/NDEmSo5qdwcLGuncUFiCQYA==
X-Received: by 2002:a62:7ed5:0:b029:13e:d13d:a086 with SMTP id z204-20020a627ed50000b029013ed13da086mr17607925pfc.29.1600174975269;
        Tue, 15 Sep 2020 06:02:55 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.02.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:02:54 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [RFC PATCH 17/24] mm/hugetlb: Add a BUILD_BUG_ON to check if struct page size is a power of two
Date:   Tue, 15 Sep 2020 20:59:40 +0800
Message-Id: <20200915125947.26204-18-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We only can free the unused vmemmap to the buddy system when the
size of struct page is a power of two. So add a BUILD_BUG_ON to
check the illegal case.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7072b849af3d..34706cec21ec 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3817,6 +3817,10 @@ static int __init hugetlb_init(void)
 {
 	int i;
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+	BUILD_BUG_ON_NOT_POWER_OF_2(sizeof(struct page));
+#endif
+
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
 			pr_warn("HugeTLB: huge pages not supported, ignoring associated command-line parameters\n");
-- 
2.20.1

