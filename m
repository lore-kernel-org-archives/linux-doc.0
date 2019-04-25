Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 916CD7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Apr 2019 19:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbfDYTFF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Apr 2019 15:05:05 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7068 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbfDYTFF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Apr 2019 15:05:05 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cc204e40001>; Thu, 25 Apr 2019 12:05:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 25 Apr 2019 12:05:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 25 Apr 2019 12:05:02 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Apr
 2019 19:05:01 +0000
From:   <rcampbell@nvidia.com>
To:     <linux-mm@kvack.org>
CC:     <linux-doc@vger.kernel.org>, Ralph Campbell <rcampbell@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH] docs/vm: Minor editorial changes in the THP and hugetlbfs documentation.
Date:   Thu, 25 Apr 2019 12:04:26 -0700
Message-ID: <20190425190426.10051-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1556219108; bh=oa+bDTxy+GEWuMo4ctv0CAjOtzvX3qgl2j9Ubq0RakE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:X-NVConfidentiality:X-Originating-IP:
         X-ClientProxiedBy:Content-Transfer-Encoding:Content-Type;
        b=RayElyVitVO/Kglh+ZThYLs++/ZMmYV/aesX3Z8eiE/V10e5psIIOTeR3nSlQuJp4
         kyDoq13992PUs+rrEF39YXP5KKCUXHbX7r+Er0Ur911VMrJao483ZAD0UeIiQnwBu3
         xvqOAwF8519Bz2MqvtMQtJOKwFMnjpAvPnwO860J8ulB2Jvx+0Fyf5mTkyvGPOY0VB
         8rJlZh3yFAg7PsyhyvtJNPLcg89h8t+AuDZQ+iPtAfB0szrvSRYnt68wc0hk7ojTji
         IOm0zqBhrA49IyTkqgRkA1b86FSaQWIRuSe89iUbKkIncIXaVgaSfFncs6fY9zPrJy
         YNExOpfc+0n1Q==
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ralph Campbell <rcampbell@nvidia.com>

Some minor wording changes and typo corrections.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
---
 Documentation/vm/hugetlbfs_reserv.rst | 17 +++---
 Documentation/vm/transhuge.rst        | 77 ++++++++++++++-------------
 2 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/Documentation/vm/hugetlbfs_reserv.rst b/Documentation/vm/huget=
lbfs_reserv.rst
index 9d200762114f..f143954e0d05 100644
--- a/Documentation/vm/hugetlbfs_reserv.rst
+++ b/Documentation/vm/hugetlbfs_reserv.rst
@@ -85,10 +85,10 @@ Reservation Map Location (Private or Shared)
 A huge page mapping or segment is either private or shared.  If private,
 it is typically only available to a single address space (task).  If share=
d,
 it can be mapped into multiple address spaces (tasks).  The location and
-semantics of the reservation map is significantly different for two types
+semantics of the reservation map is significantly different for the two ty=
pes
 of mappings.  Location differences are:
=20
-- For private mappings, the reservation map hangs off the the VMA structur=
e.
+- For private mappings, the reservation map hangs off the VMA structure.
   Specifically, vma->vm_private_data.  This reserve map is created at the
   time the mapping (mmap(MAP_PRIVATE)) is created.
 - For shared mappings, the reservation map hangs off the inode.  Specifica=
lly,
@@ -109,15 +109,15 @@ These operations result in a call to the routine huge=
tlb_reserve_pages()::
 				  struct vm_area_struct *vma,
 				  vm_flags_t vm_flags)
=20
-The first thing hugetlb_reserve_pages() does is check for the NORESERVE
+The first thing hugetlb_reserve_pages() does is check if the NORESERVE
 flag was specified in either the shmget() or mmap() call.  If NORESERVE
-was specified, then this routine returns immediately as no reservation
+was specified, then this routine returns immediately as no reservations
 are desired.
=20
 The arguments 'from' and 'to' are huge page indices into the mapping or
 underlying file.  For shmget(), 'from' is always 0 and 'to' corresponds to
 the length of the segment/mapping.  For mmap(), the offset argument could
-be used to specify the offset into the underlying file.  In such a case
+be used to specify the offset into the underlying file.  In such a case,
 the 'from' and 'to' arguments have been adjusted by this offset.
=20
 One of the big differences between PRIVATE and SHARED mappings is the way
@@ -138,7 +138,8 @@ to indicate this VMA owns the reservations.
=20
 The reservation map is consulted to determine how many huge page reservati=
ons
 are needed for the current mapping/segment.  For private mappings, this is
-always the value (to - from).  However, for shared mappings it is possible=
 that some reservations may already exist within the range (to - from).  Se=
e the
+always the value (to - from).  However, for shared mappings it is possible=
 that
+some reservations may already exist within the range (to - from).  See the
 section :ref:`Reservation Map Modifications <resv_map_modifications>`
 for details on how this is accomplished.
=20
@@ -165,7 +166,7 @@ these counters.
 If there were enough free huge pages and the global count resv_huge_pages
 was adjusted, then the reservation map associated with the mapping is
 modified to reflect the reservations.  In the case of a shared mapping, a
-file_region will exist that includes the range 'from' 'to'.  For private
+file_region will exist that includes the range 'from' - 'to'.  For private
 mappings, no modifications are made to the reservation map as lack of an
 entry indicates a reservation exists.
=20
@@ -239,7 +240,7 @@ subpool accounting when the page is freed.
 The routine vma_commit_reservation() is then called to adjust the reserve
 map based on the consumption of the reservation.  In general, this involve=
s
 ensuring the page is represented within a file_region structure of the reg=
ion
-map.  For shared mappings where the the reservation was present, an entry
+map.  For shared mappings where the reservation was present, an entry
 in the reserve map already existed so no change is made.  However, if ther=
e
 was no reservation in a shared mapping or this was a private mapping a new
 entry must be created.
diff --git a/Documentation/vm/transhuge.rst b/Documentation/vm/transhuge.rs=
t
index a8cf6809e36e..0be61b0d75d3 100644
--- a/Documentation/vm/transhuge.rst
+++ b/Documentation/vm/transhuge.rst
@@ -4,8 +4,9 @@
 Transparent Hugepage Support
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
-This document describes design principles Transparent Hugepage (THP)
-Support and its interaction with other parts of the memory management.
+This document describes design principles for Transparent Hugepage (THP)
+support and its interaction with other parts of the memory management
+system.
=20
 Design principles
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -35,27 +36,27 @@ Design principles
 get_user_pages and follow_page
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
=20
-get_user_pages and follow_page if run on a hugepage, will return the
+get_user_pages and follow_page, if run on a hugepage, will return the
 head or tail pages as usual (exactly as they would do on
-hugetlbfs). Most gup users will only care about the actual physical
+hugetlbfs). Most GUP users will only care about the actual physical
 address of the page and its temporary pinning to release after the I/O
 is complete, so they won't ever notice the fact the page is huge. But
 if any driver is going to mangle over the page structure of the tail
 page (like for checking page->mapping or other bits that are relevant
 for the head page and not the tail page), it should be updated to jump
-to check head page instead. Taking reference on any head/tail page would
-prevent page from being split by anyone.
+to check head page instead. Taking a reference on any head/tail page would
+prevent the page from being split by anyone.
=20
 .. note::
    these aren't new constraints to the GUP API, and they match the
-   same constrains that applies to hugetlbfs too, so any driver capable
+   same constraints that apply to hugetlbfs too, so any driver capable
    of handling GUP on hugetlbfs will also work fine on transparent
    hugepage backed mappings.
=20
 In case you can't handle compound pages if they're returned by
-follow_page, the FOLL_SPLIT bit can be specified as parameter to
+follow_page, the FOLL_SPLIT bit can be specified as a parameter to
 follow_page, so that it will split the hugepages before returning
-them. Migration for example passes FOLL_SPLIT as parameter to
+them. Migration for example passes FOLL_SPLIT as a parameter to
 follow_page because it's not hugepage aware and in fact it can't work
 at all on hugetlbfs (but it instead works fine on transparent
 hugepages thanks to FOLL_SPLIT). migration simply can't deal with
@@ -72,11 +73,11 @@ pmd_offset. It's trivial to make the code transparent h=
ugepage aware
 by just grepping for "pmd_offset" and adding split_huge_pmd where
 missing after pmd_offset returns the pmd. Thanks to the graceful
 fallback design, with a one liner change, you can avoid to write
-hundred if not thousand of lines of complex code to make your code
+hundreds if not thousands of lines of complex code to make your code
 hugepage aware.
=20
 If you're not walking pagetables but you run into a physical hugepage
-but you can't handle it natively in your code, you can split it by
+that you can't handle natively in your code, you can split it by
 calling split_huge_page(page). This is what the Linux VM does before
 it tries to swapout the hugepage for example. split_huge_page() can fail
 if the page is pinned and you must handle this correctly.
@@ -103,18 +104,18 @@ split_huge_page() or split_huge_pmd() has a cost.
=20
 To make pagetable walks huge pmd aware, all you need to do is to call
 pmd_trans_huge() on the pmd returned by pmd_offset. You must hold the
-mmap_sem in read (or write) mode to be sure an huge pmd cannot be
+mmap_sem in read (or write) mode to be sure a huge pmd cannot be
 created from under you by khugepaged (khugepaged collapse_huge_page
 takes the mmap_sem in write mode in addition to the anon_vma lock). If
 pmd_trans_huge returns false, you just fallback in the old code
 paths. If instead pmd_trans_huge returns true, you have to take the
 page table lock (pmd_lock()) and re-run pmd_trans_huge. Taking the
-page table lock will prevent the huge pmd to be converted into a
+page table lock will prevent the huge pmd being converted into a
 regular pmd from under you (split_huge_pmd can run in parallel to the
 pagetable walk). If the second pmd_trans_huge returns false, you
 should just drop the page table lock and fallback to the old code as
-before. Otherwise you can proceed to process the huge pmd and the
-hugepage natively. Once finished you can drop the page table lock.
+before. Otherwise, you can proceed to process the huge pmd and the
+hugepage natively. Once finished, you can drop the page table lock.
=20
 Refcounts and transparent huge pages
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -122,61 +123,61 @@ Refcounts and transparent huge pages
 Refcounting on THP is mostly consistent with refcounting on other compound
 pages:
=20
-  - get_page()/put_page() and GUP operate in head page's ->_refcount.
+  - get_page()/put_page() and GUP operate on head page's ->_refcount.
=20
   - ->_refcount in tail pages is always zero: get_page_unless_zero() never
-    succeed on tail pages.
+    succeeds on tail pages.
=20
   - map/unmap of the pages with PTE entry increment/decrement ->_mapcount
     on relevant sub-page of the compound page.
=20
-  - map/unmap of the whole compound page accounted in compound_mapcount
+  - map/unmap of the whole compound page is accounted for in compound_mapc=
ount
     (stored in first tail page). For file huge pages, we also increment
     ->_mapcount of all sub-pages in order to have race-free detection of
     last unmap of subpages.
=20
 PageDoubleMap() indicates that the page is *possibly* mapped with PTEs.
=20
-For anonymous pages PageDoubleMap() also indicates ->_mapcount in all
+For anonymous pages, PageDoubleMap() also indicates ->_mapcount in all
 subpages is offset up by one. This additional reference is required to
 get race-free detection of unmap of subpages when we have them mapped with
 both PMDs and PTEs.
=20
-This is optimization required to lower overhead of per-subpage mapcount
-tracking. The alternative is alter ->_mapcount in all subpages on each
+This optimization is required to lower the overhead of per-subpage mapcoun=
t
+tracking. The alternative is to alter ->_mapcount in all subpages on each
 map/unmap of the whole compound page.
=20
-For anonymous pages, we set PG_double_map when a PMD of the page got split
-for the first time, but still have PMD mapping. The additional references
-go away with last compound_mapcount.
+For anonymous pages, we set PG_double_map when a PMD of the page is split
+for the first time, but still have a PMD mapping. The additional reference=
s
+go away with the last compound_mapcount.
=20
-File pages get PG_double_map set on first map of the page with PTE and
-goes away when the page gets evicted from page cache.
+File pages get PG_double_map set on the first map of the page with PTE and
+goes away when the page gets evicted from the page cache.
=20
 split_huge_page internally has to distribute the refcounts in the head
 page to the tail pages before clearing all PG_head/tail bits from the page
 structures. It can be done easily for refcounts taken by page table
-entries. But we don't have enough information on how to distribute any
+entries, but we don't have enough information on how to distribute any
 additional pins (i.e. from get_user_pages). split_huge_page() fails any
-requests to split pinned huge page: it expects page count to be equal to
-sum of mapcount of all sub-pages plus one (split_huge_page caller must
-have reference for head page).
+requests to split pinned huge pages: it expects page count to be equal to
+the sum of mapcount of all sub-pages plus one (split_huge_page caller must
+have a reference to the head page).
=20
 split_huge_page uses migration entries to stabilize page->_refcount and
-page->_mapcount of anonymous pages. File pages just got unmapped.
+page->_mapcount of anonymous pages. File pages just get unmapped.
=20
-We safe against physical memory scanners too: the only legitimate way
-scanner can get reference to a page is get_page_unless_zero().
+We are safe against physical memory scanners too: the only legitimate way
+a scanner can get a reference to a page is get_page_unless_zero().
=20
 All tail pages have zero ->_refcount until atomic_add(). This prevents the
 scanner from getting a reference to the tail page up to that point. After =
the
-atomic_add() we don't care about the ->_refcount value. We already known h=
ow
+atomic_add() we don't care about the ->_refcount value. We already know ho=
w
 many references should be uncharged from the head page.
=20
 For head page get_page_unless_zero() will succeed and we don't mind. It's
-clear where reference should go after split: it will stay on head page.
+clear where references should go after split: it will stay on the head pag=
e.
=20
-Note that split_huge_pmd() doesn't have any limitation on refcounting:
+Note that split_huge_pmd() doesn't have any limitations on refcounting:
 pmd can be split at any point and never fails.
=20
 Partial unmap and deferred_split_huge_page()
@@ -188,10 +189,10 @@ in page_remove_rmap() and queue the THP for splitting=
 if memory pressure
 comes. Splitting will free up unused subpages.
=20
 Splitting the page right away is not an option due to locking context in
-the place where we can detect partial unmap. It's also might be
+the place where we can detect partial unmap. It also might be
 counterproductive since in many cases partial unmap happens during exit(2)=
 if
 a THP crosses a VMA boundary.
=20
-Function deferred_split_huge_page() is used to queue page for splitting.
+The function deferred_split_huge_page() is used to queue a page for splitt=
ing.
 The splitting itself will happen when we get memory pressure via shrinker
 interface.
--=20
2.20.1

