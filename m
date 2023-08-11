Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D477C0015E
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 19:57:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235037AbjHKT5B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 15:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjHKT46 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 15:56:58 -0400
X-Greylist: delayed 1183 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Aug 2023 12:56:57 PDT
Received: from 66-220-144-179.mail-mxout.facebook.com (66-220-144-179.mail-mxout.facebook.com [66.220.144.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A24B30F8
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 12:56:56 -0700 (PDT)
Received: by devbig1114.prn1.facebook.com (Postfix, from userid 425415)
        id E859DA091D51; Fri, 11 Aug 2023 12:36:59 -0700 (PDT)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, akpm@linux-foundation.org, david@redhat.com,
        hannes@cmpxchg.org, riel@surriel.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: [PATCH v1] mm/ksm: add pages scanned metric
Date:   Fri, 11 Aug 2023 12:36:55 -0700
Message-Id: <20230811193655.2518943-1-shr@devkernel.io>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ksm currently maintains several statistics, which let you determine how
successful KSM is at sharing pages. However it does not contain a metric
to determine how much work it does.

This commit adds the pages scanned metric. This allows the administrator
to determine how many pages have been scanned over a period of time.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
---
 Documentation/admin-guide/mm/ksm.rst |  2 ++
 mm/ksm.c                             | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-g=
uide/mm/ksm.rst
index 5c5be7bd84b8..776f244bdae4 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -159,6 +159,8 @@ The effectiveness of KSM and MADV_MERGEABLE is shown =
in ``/sys/kernel/mm/ksm/``:
=20
 general_profit
         how effective is KSM. The calculation is explained below.
+pages_scanned
+        how many pages are being scanned for ksm
 pages_shared
         how many shared pages are being used
 pages_sharing
diff --git a/mm/ksm.c b/mm/ksm.c
index 6b7b8928fb96..8d6aee05421d 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -242,6 +242,9 @@ static struct kmem_cache *rmap_item_cache;
 static struct kmem_cache *stable_node_cache;
 static struct kmem_cache *mm_slot_cache;
=20
+/* The number of pages scanned */
+static unsigned long ksm_pages_scanned;
+
 /* The number of nodes in the stable tree */
 static unsigned long ksm_pages_shared;
=20
@@ -2483,8 +2486,9 @@ static void ksm_do_scan(unsigned int scan_npages)
 {
 	struct ksm_rmap_item *rmap_item;
 	struct page *page;
+	unsigned int npages =3D scan_npages;
=20
-	while (scan_npages-- && likely(!freezing(current))) {
+	while (npages-- && likely(!freezing(current))) {
 		cond_resched();
 		rmap_item =3D scan_get_next_rmap_item(&page);
 		if (!rmap_item)
@@ -2492,6 +2496,8 @@ static void ksm_do_scan(unsigned int scan_npages)
 		cmp_and_merge_page(page, rmap_item);
 		put_page(page);
 	}
+
+	ksm_pages_scanned +=3D scan_npages - npages;
 }
=20
 static int ksmd_should_run(void)
@@ -3332,6 +3338,13 @@ static ssize_t max_page_sharing_store(struct kobje=
ct *kobj,
 }
 KSM_ATTR(max_page_sharing);
=20
+static ssize_t pages_scanned_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%lu\n", ksm_pages_scanned);
+}
+KSM_ATTR_RO(pages_scanned);
+
 static ssize_t pages_shared_show(struct kobject *kobj,
 				 struct kobj_attribute *attr, char *buf)
 {
@@ -3440,6 +3453,7 @@ static struct attribute *ksm_attrs[] =3D {
 	&sleep_millisecs_attr.attr,
 	&pages_to_scan_attr.attr,
 	&run_attr.attr,
+	&pages_scanned_attr.attr,
 	&pages_shared_attr.attr,
 	&pages_sharing_attr.attr,
 	&pages_unshared_attr.attr,

base-commit: f4a280e5bb4a764a75d3215b61bc0f02b4c26417
--=20
2.39.3

