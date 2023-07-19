Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F78EB64DA
	for <linux-doc@archiver.kernel.org>; Wed, 19 Jul 2023 11:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjGSLFs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jul 2023 07:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjGSLFp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 07:05:45 -0400
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C33E75;
        Wed, 19 Jul 2023 04:05:42 -0700 (PDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J9jrtw013032;
        Wed, 19 Jul 2023 04:05:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0220; bh=eFDFWqo6gID/QCN9gvy4Wc0KOi3v8oToQsz9Y0xKUEM=;
 b=fMEahkCFyEDQ+yVc4vL/9n+kHMu9Vo1uABeMjR2/e+uA3RXa/s5LN6kHGevyTpLPZKS4
 N+wmvfZfMCbqms4Vz6PZubEH9GQEul01sPhKPlg9Gk0PfCM9OPlyhfVGyvGC7jUkMLI0
 pJ0eGPBkq71MGlQ71My+sN7S8bUJZkUhXEPZRPN+w6jx3X6qSNR5TxiVQBw8uDDG1fEC
 DCYjGrJm/LOgyQiDq5P7jIWBlfqzrixOgVury41Fe4uYqWXCYUnXuAyDjhxEONoZC2MR
 1tBCNJ5BcRslx2v1V2EwTmDyj0MkjRYvVwBTj7g1ZF9XaadBRdvkRDkrvOMgoR2ftOQv ag== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3rwyc6jdya-12
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 19 Jul 2023 04:05:31 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 19 Jul
 2023 04:05:17 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Wed, 19 Jul 2023 04:05:17 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
        by maili.marvell.com (Postfix) with ESMTP id AE97F3F704F;
        Wed, 19 Jul 2023 04:05:10 -0700 (PDT)
From:   Hariprasad Kelam <hkelam@marvell.com>
To:     <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <kuba@kernel.org>, <davem@davemloft.net>,
        <willemdebruijn.kernel@gmail.com>, <andrew@lunn.ch>,
        <sgoutham@marvell.com>, <lcherian@marvell.com>,
        <gakula@marvell.com>, <jerinj@marvell.com>, <sbhatta@marvell.com>,
        <hkelam@marvell.com>, <naveenm@marvell.com>, <edumazet@google.com>,
        <pabeni@redhat.com>, <jhs@mojatatu.com>,
        <xiyou.wangcong@gmail.com>, <jiri@resnulli.us>,
        <maxtram95@gmail.com>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>
Subject: [net-next PatchV4 4/4] docs: octeontx2: extend documentation for Round Robin scheduling
Date:   Wed, 19 Jul 2023 16:34:43 +0530
Message-ID: <20230719110443.15310-5-hkelam@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230719110443.15310-1-hkelam@marvell.com>
References: <20230719110443.15310-1-hkelam@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: kQcd5XplTZQUYor0wMPBDCB8AF2UIF6L
X-Proofpoint-ORIG-GUID: kQcd5XplTZQUYor0wMPBDCB8AF2UIF6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_06,2023-07-19_01,2023-05-22_02
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add example tc-htb commands for Round robin scheduling

Signed-off-by: Hariprasad Kelam <hkelam@marvell.com>
---
 .../device_drivers/ethernet/marvell/octeontx2.rst         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
index bfd233cfac35..1e196cb9ce25 100644
--- a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
+++ b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
@@ -332,3 +332,11 @@ Setup HTB offload
         # tc class add dev <interface> parent 1: classid 1:1 htb rate 10Gbit prio 1
 
         # tc class add dev <interface> parent 1: classid 1:2 htb rate 10Gbit prio 7
+
+4. Create tc classes with same priorities and different quantum::
+
+        # tc class add dev <interface> parent 1: classid 1:1 htb rate 10Gbit prio 2 quantum 409600
+
+        # tc class add dev <interface> parent 1: classid 1:2 htb rate 10Gbit prio 2 quantum 188416
+
+        # tc class add dev <interface> parent 1: classid 1:3 htb rate 10Gbit prio 2 quantum 32768
-- 
2.17.1

