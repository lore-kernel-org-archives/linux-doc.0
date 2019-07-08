Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DC0C47D92A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Jul 2019 21:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405302AbfGHVPh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Jul 2019 17:15:37 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35462 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405294AbfGHVPh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 17:15:37 -0400
Received: by mail-qk1-f195.google.com with SMTP id r21so14175627qke.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 14:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0AMQxB8fjID6n1nIoBRP/bexLOV4+LcL9MqYB3dLbp0=;
        b=nh2063uICAObAjvkowsMusqQTntBkHqsfDRkCKAaQr6mTjmZpjHeQbbJETBcCobAji
         gGycJV8JxvYKKHhTrBKhzzaa/0oync9yQY22DTAt6Lasb8/KgeCIV1yTfKJfPA4bSP5H
         XNkKsLyMvQkV72jCjE85v0IoPLvyvhY4i8NIB/SQAT6Sg+vdWDdAa0pNLjGlyZob2RKu
         KSMLCm5gq949sNAsKLj2ma2oXyJx/ugj3A9fd9byhxVX/hy78ZWLeWfWUB5DKxh9l9tB
         ExkSwi1sOivngEa7rGmXpr701XcGlSIKddV+gNESh946PsgUjHAjZJ6S9ZUhcy+8ia+V
         ucWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0AMQxB8fjID6n1nIoBRP/bexLOV4+LcL9MqYB3dLbp0=;
        b=TpouRhmGozPMIobUwBO150QCpm4HcSGfRMqpdvNp5sQMU193em5wCXemZl2uDQgT61
         2mt5J/4y4A16yM4bSaQBRSExLw8gwZY1L6E9cyE4HT7oGDzgtoDutzJg2g1PAxlEclR7
         Sh1O0t94axLeZq+t22e9nSQXbPkJzEQWwP7yBsXc+TJslyCZD1HlDd71B+ezDjGuut0s
         Y4zhPq34gYUXEAqpQ6ZE6ekWFPsMWkbgINfvJWqKq7aLBIhRYKL8uQ+UM83Q9oc+SH69
         LOYvhnUYHxLQCmbKzDmdzgJoQGPYHvMUDz82u0gU+lJt/Hz84GMpZS9WmzitWIfuMHUe
         MQNA==
X-Gm-Message-State: APjAAAVZFSpN1Oz7lo20l85EELNhklge8HVQPrvnOWAnI7ck+BcZ/jW6
        JoPGQmevxDSzsZgEMK5I8VEbOA==
X-Google-Smtp-Source: APXvYqxil68FzEbaqfS3VsZ9U/3z7w3WmWgrJNx8pulJ4mSV3A2nSrAQIOKvet23G/V3Ph6Itu0yLw==
X-Received: by 2002:ae9:f303:: with SMTP id p3mr15620551qkg.320.1562620536253;
        Mon, 08 Jul 2019 14:15:36 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id b67sm8335620qkd.82.2019.07.08.14.15.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:15:35 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [v1 4/5] kexec: use reserved memory for normal kexec reboot
Date:   Mon,  8 Jul 2019 17:15:27 -0400
Message-Id: <20190708211528.12392-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708211528.12392-1-pasha.tatashin@soleen.com>
References: <20190708211528.12392-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If memory was reserved for the given segment use it directly instead of
allocating on per-page bases. This will avoid relocating this segment to
final destination when machine is rebooted.

This is done on a per segment bases because user might decide to always
load kernel segments at the given address (i.e. non-relocatable kernel),
but load initramfs at reserved address, and thus save reboot time on
copying initramfs if it is large, and reduces reboot performance.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 kernel/kexec_core.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 932feadbeb3a..2a8d8746e0a1 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -154,6 +154,18 @@ static struct page *kimage_alloc_page(struct kimage *image,
 				       gfp_t gfp_mask,
 				       unsigned long dest);
 
+/* Check whether this segment is fully within the resource */
+static bool segment_is_reserved(struct kexec_segment *seg, struct resource *res)
+{
+	unsigned long mstart = seg->mem;
+	unsigned long mend = mstart + seg->memsz - 1;
+
+	if (mstart < phys_to_boot_phys(res->start) ||
+	    mend > phys_to_boot_phys(res->end))
+		return false;
+	return true;
+}
+
 int sanity_check_segment_list(struct kimage *image)
 {
 	int i;
@@ -246,13 +258,9 @@ int sanity_check_segment_list(struct kimage *image)
 
 	if (image->type == KEXEC_TYPE_CRASH) {
 		for (i = 0; i < nr_segments; i++) {
-			unsigned long mstart, mend;
-
-			mstart = image->segment[i].mem;
-			mend = mstart + image->segment[i].memsz - 1;
 			/* Ensure we are within the crash kernel limits */
-			if ((mstart < phys_to_boot_phys(crashk_res.start)) ||
-			    (mend > phys_to_boot_phys(crashk_res.end)))
+			if (!segment_is_reserved(&image->segment[i],
+						 &crashk_res))
 				return -EADDRNOTAVAIL;
 		}
 	}
@@ -848,12 +856,13 @@ static int kimage_load_normal_segment(struct kimage *image,
 	return result;
 }
 
-static int kimage_load_crash_segment(struct kimage *image,
-					struct kexec_segment *segment)
+static int kimage_load_crash_or_reserved_segment(struct kimage *image,
+						 struct kexec_segment *segment)
 {
-	/* For crash dumps kernels we simply copy the data from
-	 * user space to it's destination.
-	 * We do things a page at a time for the sake of kmap.
+	/*
+	 * For crash dumps and kexec-reserved kernels we simply copy the data
+	 * from user space to it's destination. We do things a page at a time
+	 * for the sake of kmap.
 	 */
 	unsigned long maddr;
 	size_t ubytes, mbytes;
@@ -923,10 +932,14 @@ int kimage_load_segment(struct kimage *image,
 
 	switch (image->type) {
 	case KEXEC_TYPE_DEFAULT:
-		result = kimage_load_normal_segment(image, segment);
+		if (segment_is_reserved(segment, &kexeck_res))
+			result = kimage_load_crash_or_reserved_segment(image,
+								       segment);
+		else
+			result = kimage_load_normal_segment(image, segment);
 		break;
 	case KEXEC_TYPE_CRASH:
-		result = kimage_load_crash_segment(image, segment);
+		result = kimage_load_crash_or_reserved_segment(image, segment);
 		break;
 	}
 
-- 
2.22.0

