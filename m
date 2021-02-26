Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE630C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 07:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C54164EDB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 07:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhBZHT7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Feb 2021 02:19:59 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14651 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhBZHTz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 02:19:55 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6038a0f30000>; Thu, 25 Feb 2021 23:19:15 -0800
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Feb
 2021 07:19:14 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jhubbard@nvidia.com>,
        <rcampbell@nvidia.com>, <jglisse@redhat.com>, <jgg@nvidia.com>,
        <hch@infradead.org>, <daniel@ffwll.ch>,
        Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v3 7/8] nouveau/svm: Refactor nouveau_range_fault
Date:   Fri, 26 Feb 2021 18:18:31 +1100
Message-ID: <20210226071832.31547-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210226071832.31547-1-apopple@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614323955; bh=IDt/w91IyQ/+IVJx/VBVmCwlFW3knn/F3DU7wj6KD1M=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type:
         X-Originating-IP:X-ClientProxiedBy;
        b=iA4v2TY6cOGSM1kE0ULEWVgO4EsyNIXP2jQFmT56qDtlo7ThdDtZVA82vv55IqcmX
         hr/gsMDaqCyssGqBYufTKmSU4XkUj5op8gJawcK0Xdlkfn0lSIwA22GT5dO1iaaS8P
         5l5tfMeJ153KRBFhjnkDOzDOmXiQz+R0JWyxgLQxXlBRLKZa9tanzQrPUS2Jpn8G7i
         tLbbrgJfcT/rJHSSUharLyht5xSS2afi5NlGq8M12Nzht6J+z06e2ywFzkW3J6vJ8A
         pD0A+k5J5GOP3U77KG7R6/14xEJ3E8N4KzOkHAiC1cXmnzmF1RMPQZIbfOlOFd4Km8
         esWI5TtHaH8Qg==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Call mmu_interval_notifier_insert() as part of nouveau_range_fault().
This doesn't introduce any functional change but makes it easier for a
subsequent patch to alter the behaviour of nouveau_range_fault() to
support GPU atomic operations.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 34 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouvea=
u/nouveau_svm.c
index f18bd53da052..cd7b47c946cf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -567,18 +567,27 @@ static int nouveau_range_fault(struct nouveau_svmm *s=
vmm,
 	unsigned long hmm_pfns[1];
 	struct hmm_range range =3D {
 		.notifier =3D &notifier->notifier,
-		.start =3D notifier->notifier.interval_tree.start,
-		.end =3D notifier->notifier.interval_tree.last + 1,
 		.default_flags =3D hmm_flags,
 		.hmm_pfns =3D hmm_pfns,
 		.dev_private_owner =3D drm->dev,
 	};
-	struct mm_struct *mm =3D notifier->notifier.mm;
+	struct mm_struct *mm =3D svmm->notifier.mm;
 	int ret;
=20
+	ret =3D mmu_interval_notifier_insert(&notifier->notifier, mm,
+					args->p.addr, args->p.size,
+					&nouveau_svm_mni_ops);
+	if (ret)
+		return ret;
+
+	range.start =3D notifier->notifier.interval_tree.start;
+	range.end =3D notifier->notifier.interval_tree.last + 1;
+
 	while (true) {
-		if (time_after(jiffies, timeout))
-			return -EBUSY;
+		if (time_after(jiffies, timeout)) {
+			ret =3D -EBUSY;
+			goto out;
+		}
=20
 		range.notifier_seq =3D mmu_interval_read_begin(range.notifier);
 		mmap_read_lock(mm);
@@ -587,7 +596,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svm=
m,
 		if (ret) {
 			if (ret =3D=3D -EBUSY)
 				continue;
-			return ret;
+			goto out;
 		}
=20
 		mutex_lock(&svmm->mutex);
@@ -606,6 +615,9 @@ static int nouveau_range_fault(struct nouveau_svmm *svm=
m,
 	svmm->vmm->vmm.object.client->super =3D false;
 	mutex_unlock(&svmm->mutex);
=20
+out:
+	mmu_interval_notifier_remove(&notifier->notifier);
+
 	return ret;
 }
=20
@@ -727,14 +739,8 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		}
=20
 		notifier.svmm =3D svmm;
-		ret =3D mmu_interval_notifier_insert(&notifier.notifier, mm,
-						   args.i.p.addr, args.i.p.size,
-						   &nouveau_svm_mni_ops);
-		if (!ret) {
-			ret =3D nouveau_range_fault(svmm, svm->drm, &args.i,
-				sizeof(args), hmm_flags, &notifier);
-			mmu_interval_notifier_remove(&notifier.notifier);
-		}
+		ret =3D nouveau_range_fault(svmm, svm->drm, &args.i,
+					sizeof(args), hmm_flags, &notifier);
 		mmput(mm);
=20
 		limit =3D args.i.p.addr + args.i.p.size;
--=20
2.20.1

