Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A82C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 25 Mar 2022 19:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbiCYTne (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Mar 2022 15:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiCYTlV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Mar 2022 15:41:21 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCEB20D803
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 12:12:51 -0700 (PDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22PHOTwO029856
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 10:38:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=x+7qxqbQef0z0Ifs8RXC4BLkeVf+ndnrJ+olAXSGxZw=;
 b=CVA9uyv6dyAljR2+ih+lHdKTbvaHsiLDEl+kvMGE4TSY6mt0IOm9imPCnibshsdQJWOw
 Ft4BubDoaLPkZGANb3rPZY/GUJ59M9OrpaDmTIISnMro9EAAfax04x/auicXlYCLjo+3
 3H7qgPLn50V1iE/DKmG0bdHqSpp1lXzeu/U= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3f153u79a2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 10:38:35 -0700
Received: from twshared14141.02.ash7.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Mar 2022 10:38:34 -0700
Received: by devbig039.lla1.facebook.com (Postfix, from userid 572232)
        id 14F7B64E77FD; Fri, 25 Mar 2022 10:38:28 -0700 (PDT)
From:   Dylan Yudaken <dylany@fb.com>
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>
CC:     Dylan Yudaken <dylany@fb.com>
Subject: [PATCH] docs: fault-injection: fix defaults
Date:   Fri, 25 Mar 2022 10:38:19 -0700
Message-ID: <20220325173819.2255914-1-dylany@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: brKSHHfhD4GKiRSjty1zEReW5nHrFpm7
X-Proofpoint-GUID: brKSHHfhD4GKiRSjty1zEReW5nHrFpm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_05,2022-03-24_01,2022-02-23_01
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
 Documentation/fault-injection/fault-injection.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Document=
ation/fault-injection/fault-injection.rst
index 4a25c5eb6f07..8b4e1ce26d01 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -132,7 +132,7 @@ configuration of fault-injection capabilities.
=20
 	Format: { 'Y' | 'N' }
=20
-	default is 'N', setting it to 'Y' won't inject failures into
+	default is 'Y', setting it to 'Y' won't inject failures into
 	highmem/user allocations.
=20
 - /sys/kernel/debug/failslab/ignore-gfp-wait:
@@ -140,7 +140,7 @@ configuration of fault-injection capabilities.
=20
 	Format: { 'Y' | 'N' }
=20
-	default is 'N', setting it to 'Y' will inject failures
+	default is 'Y', setting it to 'Y' will inject failures
 	only into non-sleep allocations (GFP_ATOMIC allocations).
=20
 - /sys/kernel/debug/fail_page_alloc/min-order:
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

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
--=20
2.30.2

