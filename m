Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B2537D912
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 15:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729571AbfGaPjG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 11:39:06 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44614 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbfGaPjF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Jul 2019 11:39:05 -0400
Received: by mail-qt1-f195.google.com with SMTP id 44so35980445qtg.11
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2019 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a8h6/KaC5Piq1VkFuiQLhvl2ZdeRxBmHZozqoP8J2iw=;
        b=kozB+ytYyHw9RhluUzblYdsFfY3Dv43ogPWJXWl7P1oNu+oyHMha8I7lwP+NjNLmZt
         UOmHrGMgf5sYEl0a2/cKbMoV2kq9Z/eQbDzblyi13+Xrm/Tnp3ITIQqK1UfJd/qxpXkS
         0aGI974bEakxPT/bxoEOaNl18hQ3yeYLEut1AtR1KIw+epSAEQ54Dfi5T0SdU66hCyjE
         QihiV01sf1ndWDDZ0NB2//SZoDf37BmsurqPijIqDVf/LkvSW63siZlcfNnAjGWzoWSn
         1L7bkl1Cd8jJxCulHiPGHEUuMn2KzotmzW4qJ4xVa+yuSrh8dbaqho+xrP5uejKhShlF
         +hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a8h6/KaC5Piq1VkFuiQLhvl2ZdeRxBmHZozqoP8J2iw=;
        b=Wj4qRjS3UXVksWNz5FfFEA6uqSZTrP3LYTK11vrmgeONbxPR1LW0yQIYKtEvismfPB
         0jGhXCcTQBH9BbkPtUOCWWCGeN2KQrP7VR3SAw64huFWjAlO8Czc4adXYr5oRwaWuluH
         j/8Rr9JfqnXwI+VO0WtazKpjV3OMrPBfWRcfAucE3wpbk+fo3qczRE6Pqa02uQz0N9fs
         PrZs6AME4bAInM11NH6idyBNDTAfckTIEN3D+dpddssTOQM1wvHAPDIzkYJDZyE40X6v
         6W0WgMCA6k7MYd4qHeQKSEknSIcYQQhFyH6Te5t/3UvyLPA9YVojIuKhdghEWIEyMLJH
         o23w==
X-Gm-Message-State: APjAAAWMZaz7XrBwF1evunFtF+5SQKKbo3629ZvrCJ5zcuQ8LKnrVwGU
        6so3XEtMHkMQV+U97IihFP0=
X-Google-Smtp-Source: APXvYqwuACOTaf8gffAijH2Zzx0ksDXKqJiEVvsEccygqEisgOhp5Vs/4mMgCK39Hh+y7F4PhUqq4w==
X-Received: by 2002:a0c:d003:: with SMTP id u3mr90210411qvg.112.1564587544806;
        Wed, 31 Jul 2019 08:39:04 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id f25sm35116803qta.81.2019.07.31.08.39.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 08:39:04 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        marc.zyngier@arm.com, james.morse@arm.com, vladimir.murzin@arm.com,
        matthias.bgg@gmail.com, bhsharma@redhat.com
Subject: [RFC v2 4/8] kexec: add machine_kexec_post_load()
Date:   Wed, 31 Jul 2019 11:38:53 -0400
Message-Id: <20190731153857.4045-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731153857.4045-1-pasha.tatashin@soleen.com>
References: <20190731153857.4045-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It is the same as machine_kexec_prepare(), but is called after segments are
loaded. This way, can do processing work with already loaded relocation
segments. One such example is arm64: it has to have segments loaded in
order to create a page table, but it cannot do it during kexec time, because
at that time allocations won't be possible anymore.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec.c          | 4 ++++
 kernel/kexec_core.c     | 6 ++++++
 kernel/kexec_file.c     | 4 ++++
 kernel/kexec_internal.h | 2 ++
 4 files changed, 16 insertions(+)

diff --git a/kernel/kexec.c b/kernel/kexec.c
index 1b018f1a6e0d..27b71dc7b35a 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -159,6 +159,10 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
 
 	kimage_terminate(image);
 
+	ret = machine_kexec_post_load(image);
+	if (ret)
+		goto out;
+
 	/* Install the new kernel and uninstall the old */
 	image = xchg(dest_image, image);
 
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 2c5b72863b7b..8360645d1bbe 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -587,6 +587,12 @@ static void kimage_free_extra_pages(struct kimage *image)
 	kimage_free_page_list(&image->unusable_pages);
 
 }
+
+int __weak machine_kexec_post_load(struct kimage *image)
+{
+	return 0;
+}
+
 void kimage_terminate(struct kimage *image)
 {
 	if (*image->entry != 0)
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index b8cc032d5620..cb531d768114 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -391,6 +391,10 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 
 	kimage_terminate(image);
 
+	ret = machine_kexec_post_load(image);
+	if (ret)
+		goto out;
+
 	/*
 	 * Free up any temporary buffers allocated which are not needed
 	 * after image has been loaded
diff --git a/kernel/kexec_internal.h b/kernel/kexec_internal.h
index 48aaf2ac0d0d..39d30ccf8d87 100644
--- a/kernel/kexec_internal.h
+++ b/kernel/kexec_internal.h
@@ -13,6 +13,8 @@ void kimage_terminate(struct kimage *image);
 int kimage_is_destination_range(struct kimage *image,
 				unsigned long start, unsigned long end);
 
+int machine_kexec_post_load(struct kimage *image);
+
 extern struct mutex kexec_mutex;
 
 #ifdef CONFIG_KEXEC_FILE
-- 
2.22.0

