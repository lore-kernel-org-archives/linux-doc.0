Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8576DC3527D
	for <linux-doc@archiver.kernel.org>; Tue,  5 Apr 2022 11:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234052AbiDELGM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Apr 2022 07:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353200AbiDEKFv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Apr 2022 06:05:51 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE20BE9F9
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 02:54:27 -0700 (PDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 234NPFp5001171
        for <linux-doc@vger.kernel.org>; Tue, 5 Apr 2022 02:54:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=8yR0R6//rrpx6xMSqMgpagKBvzJMhAiTzR7V2rQWi1g=;
 b=Pchn5Kvi/QKBZ8C5+O1p8jS8Cgbh6dbZgHjcvQtmRB78zcsPLhQBeuBKkEYr+xNj6Jlz
 no8FTpN9VfB0qKSIR49mbPD8bSSCzIpQefFvQAtFElFq34rLfFFtIwV6a9Prh/8cjldq
 g6g++CQ4rTl1+wrsbyM+o7ACvRSZwBvIiG4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3f857x53pm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 05 Apr 2022 02:54:26 -0700
Received: from twshared41237.03.ash8.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 5 Apr 2022 02:54:25 -0700
Received: by devbig039.lla1.facebook.com (Postfix, from userid 572232)
        id E99676D9461F; Tue,  5 Apr 2022 02:54:15 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>
CC:     Dylan Yudaken <dylany@fb.com>
Subject: [PATCH v2] docs: fault-injection: fix defaults
Date:   Tue, 5 Apr 2022 02:54:14 -0700
Message-ID: <20220405095414.816060-1-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: o92smyiKeSlUeVzAB9FZm4ZKqnxVC2XE
X-Proofpoint-ORIG-GUID: o92smyiKeSlUeVzAB9FZm4ZKqnxVC2XE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_10,2022-03-31_01,2022-02-23_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ignore-gfp-wait and ignore-gfp-highmem defaults are actually true (Y) in
both failslab and fail_page_alloc, not false as the docs suggest. See
page_alloc.c:3762 and failslab.c:13

At the same time use 'Y' instead of '1' in the example scripts just for
consistency. (though 1 would work)

Signed-off-by: Dylan Yudaken <dylany@fb.com>
---

v2: reword the docs to explain what happens if 'N' is set.

 Documentation/fault-injection/fault-injection.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Document=
ation/fault-injection/fault-injection.rst
index 4a25c5eb6f07..eb9c2d9a4f5f 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -132,16 +132,16 @@ configuration of fault-injection capabilities.
=20
 	Format: { 'Y' | 'N' }
=20
-	default is 'N', setting it to 'Y' won't inject failures into
-	highmem/user allocations.
+	default is 'Y', setting it to 'N' will also inject failures into
+	highmem/user allocations (__GFP_HIGHMEM allocations).
=20
 - /sys/kernel/debug/failslab/ignore-gfp-wait:
 - /sys/kernel/debug/fail_page_alloc/ignore-gfp-wait:
=20
 	Format: { 'Y' | 'N' }
=20
-	default is 'N', setting it to 'Y' will inject failures
-	only into non-sleep allocations (GFP_ATOMIC allocations).
+	default is 'Y', setting it to 'N' will also inject failures
+	into allocations that can sleep (__GFP_DIRECT_RECLAIM allocations).
=20
 - /sys/kernel/debug/fail_page_alloc/min-order:
=20
@@ -280,7 +280,7 @@ Application Examples
     printf %#x -1 > /sys/kernel/debug/$FAILTYPE/times
     echo 0 > /sys/kernel/debug/$FAILTYPE/space
     echo 2 > /sys/kernel/debug/$FAILTYPE/verbose
-    echo 1 > /sys/kernel/debug/$FAILTYPE/ignore-gfp-wait
+    echo Y > /sys/kernel/debug/$FAILTYPE/ignore-gfp-wait
=20
     faulty_system()
     {
@@ -334,8 +334,8 @@ Application Examples
     printf %#x -1 > /sys/kernel/debug/$FAILTYPE/times
     echo 0 > /sys/kernel/debug/$FAILTYPE/space
     echo 2 > /sys/kernel/debug/$FAILTYPE/verbose
-    echo 1 > /sys/kernel/debug/$FAILTYPE/ignore-gfp-wait
-    echo 1 > /sys/kernel/debug/$FAILTYPE/ignore-gfp-highmem
+    echo Y > /sys/kernel/debug/$FAILTYPE/ignore-gfp-wait
+    echo Y > /sys/kernel/debug/$FAILTYPE/ignore-gfp-highmem
     echo 10 > /sys/kernel/debug/$FAILTYPE/stacktrace-depth
=20
     trap "echo 0 > /sys/kernel/debug/$FAILTYPE/probability" SIGINT SIGTE=
RM EXIT
--=20
2.30.2

