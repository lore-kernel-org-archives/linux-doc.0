Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BF6ECAAD3
	for <linux-doc@archiver.kernel.org>; Thu,  8 Sep 2022 00:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiIHAUI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Sep 2022 20:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbiIHAUH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Sep 2022 20:20:07 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5625F21F
        for <linux-doc@vger.kernel.org>; Wed,  7 Sep 2022 17:19:55 -0700 (PDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 287Hnd9t021975
        for <linux-doc@vger.kernel.org>; Wed, 7 Sep 2022 17:19:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=jIuRHalrKaQnNst4eWUdRXin2ZluUvvLjoo2dZOonZw=;
 b=q/2wLdtwhORD17+Cejkejj0fblWtD/ZBZEaA7s4HwSUBstqNekF5OTmRuMPMPxsRfJ61
 a/MhBhdagaZWWSC5lBfgJ60DKcdHTKIlPMQ70BPSxT68Y/1PkUlBqrn6nZAEM1vEKvnF
 GN6owfSbfAKL5YpGdl3qcAbInGl26/43QqU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3je87gugpd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 07 Sep 2022 17:19:54 -0700
Received: from twshared25017.14.frc2.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 17:19:53 -0700
Received: by devvm6390.atn0.facebook.com (Postfix, from userid 352741)
        id 26530371C857; Wed,  7 Sep 2022 17:19:50 -0700 (PDT)
From:   <alexlzhu@fb.com>
To:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Kernel-team@fb.com>
CC:     Alexander Zhu <alexlzhu@fb.com>
Subject: [PATCH] docs/mm: Improve grammar on mmu_notifier documentation
Date:   Wed, 7 Sep 2022 17:19:48 -0700
Message-ID: <20220908001948.3014216-1-alexlzhu@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: npA6gVV9XXRCDgzh90DqqJgiUKVPimOf
X-Proofpoint-GUID: npA6gVV9XXRCDgzh90DqqJgiUKVPimOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_10,2022-09-07_02,2022-06-22_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alexander Zhu <alexlzhu@fb.com>

Improve grammar on mmu_notifier documentation.

Signed-off-by: Alexander Zhu <alexlzhu@fb.com>
---
 Documentation/mm/mmu_notifier.rst | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/mm/mmu_notifier.rst b/Documentation/mm/mmu_not=
ifier.rst
index df5d7777fc6b..e22b591fc406 100644
--- a/Documentation/mm/mmu_notifier.rst
+++ b/Documentation/mm/mmu_notifier.rst
@@ -7,10 +7,11 @@ When clearing a pte/pmd we are given a choice to notify=
 the event through
 (notify version of \*_clear_flush call mmu_notifier_invalidate_range) un=
der
 the page table lock. But that notification is not necessary in all cases=
.
=20
-For secondary TLB (non CPU TLB) like IOMMU TLB or device TLB (when devic=
e use
-thing like ATS/PASID to get the IOMMU to walk the CPU page table to acce=
ss a
-process virtual address space). There is only 2 cases when you need to n=
otify
-those secondary TLB while holding page table lock when clearing a pte/pm=
d:
+For secondary TLB (non CPU TLB) like IOMMU TLB or device TLB (when the d=
evice
+uses something like ATS/PASID to get the IOMMU to walk the CPU page tabl=
e to
+access a process virtual address space). There are only 2 cases when you=
 need
+to notify the secondary TLB while holding the page table lock when clear=
ing
+a pte/pmd:
=20
   A) page backing address is free before mmu_notifier_invalidate_range_e=
nd()
   B) a page table entry is updated to point to a new page (COW, write fa=
ult
@@ -27,13 +28,13 @@ happen:
   - set page table entry to point to new page
=20
 If clearing the page table entry is not followed by a notify before sett=
ing
-the new pte/pmd value then you can break memory model like C11 or C++11 =
for
-the device.
+the new pte/pmd value then you can break the memory model like C11 or C+=
+11
+for the device.
=20
 Consider the following scenario (device use a feature similar to ATS/PAS=
ID):
=20
-Two address addrA and addrB such that \|addrA - addrB\| >=3D PAGE_SIZE w=
e assume
-they are write protected for COW (other case of B apply too).
+Two addresses addrA and addrB such that \|addrA - addrB\| >=3D PAGE_SIZE=
 we assume
+they are write protected for COW (other case of B applies as well).
=20
 ::
=20
@@ -86,14 +87,13 @@ they are write protected for COW (other case of B app=
ly too).
  CPU-thread-3  {}
  DEV-thread-0  {read addrA from old page}
  DEV-thread-2  {read addrB from new page}
-
-So here because at time N+2 the clear page table entry was not pair with=
 a
-notification to invalidate the secondary TLB, the device see the new val=
ue for
-addrB before seeing the new value for addrA. This break total memory ord=
ering
+Here because at time N+2 the clear page table entry was not paired with =
a
+notification to invalidate the secondary TLB, the device sees the new va=
lue for
+addrB before seeing the new value for addrA. This breaks total memory or=
dering
 for the device.
=20
 When changing a pte to write protect or to point to a new write protecte=
d page
 with same content (KSM) it is fine to delay the mmu_notifier_invalidate_=
range
 call to mmu_notifier_invalidate_range_end() outside the page table lock.=
 This
 is true even if the thread doing the page table update is preempted righ=
t after
-releasing page table lock but before call mmu_notifier_invalidate_range_=
end().
+releasing the page table lock but before calling mmu_notifier_invalidate=
_range_end().
--=20
2.30.2

