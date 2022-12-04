Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCD5C4708D
	for <linux-doc@archiver.kernel.org>; Sun,  4 Dec 2022 16:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbiLDQPK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Dec 2022 11:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiLDQPJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Dec 2022 11:15:09 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF34313FB3
        for <linux-doc@vger.kernel.org>; Sun,  4 Dec 2022 08:15:08 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso12708946pjt.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Dec 2022 08:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRQapFdwTnMNn2b4Tmu2pfTwu3sgopbJ/w2CVO4ajW0=;
        b=D9HiGoEwhwlbDf046jFmOoT756+CfK+J0b38Sr1aPx3LWGaU3r2Spfkj7pxwdkOXmT
         vgzdlF/ruF1wjnLwFfVTBfI0RaGI/rJ66k9cuNBLzwVMTrlAbZg4GGRD0hkcq+TyUVOw
         /x9ashaKx4dwa0/EqZH3RjK1GYm6ogmjAXX2tnIRx57KNpmkSGJRx4qzN0P3IuMJ6MNi
         5UqnA99cznD1QP3g6CSDnGSbsFaxQxJ8s5GH8lnFiv0fB45EzuenHpzYY7zg56XNR91/
         ClkwTE9zWUXRn7uFZu3s4sxCnPnmTexxlnjlZ83A5000Tw+4jbEjDo6pG5hrKmBOtyyG
         Uvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRQapFdwTnMNn2b4Tmu2pfTwu3sgopbJ/w2CVO4ajW0=;
        b=KNLt7qh9kFY9jbl53pE1XsU/VskIqEWFHXwOK0LpQ3wg7Fa9gYkxbXIxmDhsqyTSZ8
         3hqVzw0aq9q3GJ/SbWJ6r+DqfPivgkSzQRRBNOlIg1Rxh0oO7+aI8Ti8XSBYVXhYw7v7
         A9L8xQPaVmLLlg/+Wjubg0cR2fQ1bX3p24aPUbTTMre/RgLn90Cjy+5X5qshfoMeabH9
         vzp4PpxF44DTCrUQX9wFhEy5Sj9fFERM5SjiCp7hzhEq429BKaR7RRS8EAapcHRbM68T
         VjYRKPkP9VEBfLydvWwNLlTRVpmAN4cfAtgu9AZ6lgZUuCxiY9Inwb0JTjo0reX/qE4O
         YiiA==
X-Gm-Message-State: ANoB5pnKP+WYCotiEIOvRiusr1c/xjR/ToG5Lnuu5Q8/uPC5K5cU2xmN
        q+fFTV1rChq1lRttcsBcveBw2g==
X-Google-Smtp-Source: AA0mqf5bbj9b9IunN6RcDM3rBOrdn1vqyKhHx++JAOfkgLrnrCTISkUgeF/xk0d8pZG3YyH/vfnLkQ==
X-Received: by 2002:a17:902:7d94:b0:188:f0e1:ef42 with SMTP id a20-20020a1709027d9400b00188f0e1ef42mr64237242plm.166.1670170508210;
        Sun, 04 Dec 2022 08:15:08 -0800 (PST)
Received: from Tower.bytedance.net ([139.177.225.248])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b0016cf3f124e1sm9000323plh.234.2022.12.04.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 08:15:07 -0800 (PST)
From:   Zhongkun He <hezhongkun.hzk@bytedance.com>
To:     mhocko@suse.com, akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, wuyun.abel@bytedance.com,
        Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH 2/3] mm: fix the reference of mempolicy in some functions.
Date:   Mon,  5 Dec 2022 00:14:31 +0800
Message-Id: <20221204161432.2149375-3-hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221204161432.2149375-1-hezhongkun.hzk@bytedance.com>
References: <20221204161432.2149375-1-hezhongkun.hzk@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are some functions that use mempolicy in process
context, but don't reference it. Let's fix it to have
a clear life time model.

Suggested-by: Michal Hocko <mhocko@suse.com>
Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 mm/hugetlb.c   | 16 ++++++-----
 mm/mempolicy.c | 78 +++++++++++++++++++++++++-------------------------
 2 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 277330f40818..0c2b5233e0c9 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4353,19 +4353,19 @@ static int __init default_hugepagesz_setup(char *s)
 }
 __setup("default_hugepagesz=", default_hugepagesz_setup);
 
-static nodemask_t *policy_mbind_nodemask(gfp_t gfp)
+static nodemask_t *policy_mbind_nodemask(gfp_t gfp, struct mempolicy **mpol)
 {
 #ifdef CONFIG_NUMA
-	struct mempolicy *mpol = get_task_policy(current);
+	*mpol = get_task_policy(current);
 
 	/*
 	 * Only enforce MPOL_BIND policy which overlaps with cpuset policy
 	 * (from policy_nodemask) specifically for hugetlb case
 	 */
-	if (mpol->mode == MPOL_BIND &&
-		(apply_policy_zone(mpol, gfp_zone(gfp)) &&
-		 cpuset_nodemask_valid_mems_allowed(&mpol->nodes)))
-		return &mpol->nodes;
+	if ((*mpol)->mode == MPOL_BIND &&
+		(apply_policy_zone(*mpol, gfp_zone(gfp)) &&
+		 cpuset_nodemask_valid_mems_allowed(&(*mpol)->nodes)))
+		return &(*mpol)->nodes;
 #endif
 	return NULL;
 }
@@ -4375,14 +4375,16 @@ static unsigned int allowed_mems_nr(struct hstate *h)
 	int node;
 	unsigned int nr = 0;
 	nodemask_t *mbind_nodemask;
+	struct mempolicy *mpol = NULL;
 	unsigned int *array = h->free_huge_pages_node;
 	gfp_t gfp_mask = htlb_alloc_mask(h);
 
-	mbind_nodemask = policy_mbind_nodemask(gfp_mask);
+	mbind_nodemask = policy_mbind_nodemask(gfp_mask, &mpol);
 	for_each_node_mask(node, cpuset_current_mems_allowed) {
 		if (!mbind_nodemask || node_isset(node, *mbind_nodemask))
 			nr += array[node];
 	}
+	mpol_put(mpol);
 
 	return nr;
 }
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index f1857ebded46..0feffb7ff01e 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -159,7 +159,7 @@ int numa_map_to_online_node(int node)
 EXPORT_SYMBOL_GPL(numa_map_to_online_node);
 
 /* Obtain a reference on the specified task mempolicy */
-static mempolicy *get_task_mpol(struct task_struct *p)
+static struct mempolicy *get_task_mpol(struct task_struct *p)
 {
 	struct mempolicy *pol;
 
@@ -925,7 +925,8 @@ static void get_policy_nodemask(struct mempolicy *p, nodemask_t *nodes)
 		*nodes = p->nodes;
 		break;
 	case MPOL_LOCAL:
-		/* return empty node mask for local allocation */killbreak;
+		/* return empty node mask for local allocation */
+		break;
 	default:
 		BUG();
 	}
@@ -951,7 +952,7 @@ static long do_get_mempolicy(int *policy, nodemask_t *nmask,
 	int err;
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma = NULL;
-	struct mempolicy *pol = current->mempolicy, *pol_refcount = NULL;
+	struct mempolicy *pol;
 
 	if (flags &
 		~(unsigned long)(MPOL_F_NODE|MPOL_F_ADDR|MPOL_F_MEMS_ALLOWED))
@@ -966,8 +967,10 @@ static long do_get_mempolicy(int *policy, nodemask_t *nmask,
 		task_unlock(current);
 		return 0;
 	}
+	pol = get_task_mpol(current);
 
 	if (flags & MPOL_F_ADDR) {
+		mpol_put(pol); /* put the refcount of task mpol */
 		/*
 		 * Do NOT fall back to task policy if the
 		 * vma/shared policy at addr is NULL.  We
@@ -979,27 +982,19 @@ static long do_get_mempolicy(int *policy, nodemask_t *nmask,
 			mmap_read_unlock(mm);
 			return -EFAULT;
 		}
-		if (vma->vm_ops && vma->vm_ops->get_policy)
-			pol = vma->vm_ops->get_policy(vma, addr);
-		else
-			pol = vma->vm_policy;
-	} else if (addr)
-		return -EINVAL;
+		/* obtain a reference to vma mpol. */
+		pol = __get_vma_policy(vma, addr);
+		mmap_read_unlock(mm);
+	} else if (addr) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	if (!pol)
 		pol = &default_policy;	/* indicates default behavior */
 
 	if (flags & MPOL_F_NODE) {
 		if (flags & MPOL_F_ADDR) {
-			/*
-			 * Take a refcount on the mpol, because we are about to
-			 * drop the mmap_lock, after which only "pol" remains
-			 * valid, "vma" is stale.
-			 */
-			pol_refcount = pol;
-			vma = NULL;
-			mpol_get(pol);
-			mmap_read_unlock(mm);
 			err = lookup_node(mm, addr);
 			if (err < 0)
 				goto out;
@@ -1023,21 +1018,19 @@ static long do_get_mempolicy(int *policy, nodemask_t *nmask,
 
 	err = 0;
 	if (nmask) {
-		if (mpol_store_user_nodemask(pol)) {
+		/*
+		 * There is no need for a lock, since we get
+		 * a reference to mpol.
+		 */
+		if (mpol_store_user_nodemask(pol))
 			*nmask = pol->w.user_nodemask;
-		} else {
-			task_lock(current);
+		else
 			get_policy_nodemask(pol, nmask);
-			task_unlock(current);
-		}
 	}
 
  out:
-	mpol_cond_put(pol);
-	if (vma)
-		mmap_read_unlock(mm);
-	if (pol_refcount)
-		mpol_put(pol_refcount);
+	if (pol != &default_policy)
+		mpol_put(pol);
 	return err;
 }
 
@@ -1923,16 +1916,18 @@ unsigned int mempolicy_slab_node(void)
 	if (!in_task())
 		return node;
 
-	policy = current->mempolicy;
+	policy = get_task_mpol(current);
 	if (!policy)
 		return node;
 
 	switch (policy->mode) {
 	case MPOL_PREFERRED:
-		return first_node(policy->nodes);
+		node = first_node(policy->nodes);
+		break;
 
 	case MPOL_INTERLEAVE:
-		return interleave_nodes(policy);
+		node = interleave_nodes(policy);
+		break;
 
 	case MPOL_BIND:
 	case MPOL_PREFERRED_MANY:
@@ -1948,14 +1943,17 @@ unsigned int mempolicy_slab_node(void)
 		zonelist = &NODE_DATA(node)->node_zonelists[ZONELIST_FALLBACK];
 		z = first_zones_zonelist(zonelist, highest_zoneidx,
 							&policy->nodes);
-		return z->zone ? zone_to_nid(z->zone) : node;
+		node = z->zone ? zone_to_nid(z->zone) : node;
+		break;
 	}
 	case MPOL_LOCAL:
-		return node;
+		break;
 
 	default:
 		BUG();
 	}
+	mpol_put(policy);
+	return node;
 }
 
 /*
@@ -2379,21 +2377,23 @@ unsigned long alloc_pages_bulk_array_mempolicy(gfp_t gfp,
 		unsigned long nr_pages, struct page **page_array)
 {
 	struct mempolicy *pol = &default_policy;
+	unsigned long pages;
 
 	if (!in_interrupt() && !(gfp & __GFP_THISNODE))
 		pol = get_task_policy(current);
 
 	if (pol->mode == MPOL_INTERLEAVE)
-		return alloc_pages_bulk_array_interleave(gfp, pol,
+		pages = alloc_pages_bulk_array_interleave(gfp, pol,
 							 nr_pages, page_array);
-
-	if (pol->mode == MPOL_PREFERRED_MANY)
-		return alloc_pages_bulk_array_preferred_many(gfp,
+	else if (pol->mode == MPOL_PREFERRED_MANY)
+		pages = alloc_pages_bulk_array_preferred_many(gfp,
 				numa_node_id(), pol, nr_pages, page_array);
-
-	return __alloc_pages_bulk(gfp, policy_node(gfp, pol, numa_node_id()),
+	else
+		pages = __alloc_pages_bulk(gfp, policy_node(gfp, pol, numa_node_id()),
 				  policy_nodemask(gfp, pol), nr_pages, NULL,
 				  page_array);
+	mpol_put(pol);
+	return pages;
 }
 
 int vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
-- 
2.25.1

