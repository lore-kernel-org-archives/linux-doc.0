Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EF5C4320A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jul 2021 15:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E084D60EE6
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jul 2021 15:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhG3Pv7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jul 2021 11:51:59 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:58860 "EHLO
        mx0a-002c1b01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231702AbhG3Pv4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jul 2021 11:51:56 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
        by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16UFnl1u026632;
        Fri, 30 Jul 2021 08:51:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=01CgtB2ZQYJGPn837/EzvHv5YSSswAg24Mfgt5V6I70=;
 b=W/iQ2tk+kNFyzMdms/eKqeJIMAw7nDjY8lo35Czol5lw5S8oSY+F3teW2gzbCaR1XAlN
 dzvtB9TxSS0BE9uXLyBYfkD3r9aaboprw+eM2Xy+B2Vs3OUB4/VPZI8Uq7Xsgf4p1+0N
 VSzS9KMCWcv/lgZZRdne/UJZ4BYYe6GqJcS79NqViBo6QI7EmOCkWiv6NozkvRLOwN34
 mgzU803y0fNDcfB25lDJYy3HzsjglH8bku/dz+v2qJ5dkeZhKy9tBm5M2ykn2BqbqxZ3
 tERGfkCXxruhCcXfvl79+t9og+bg+Qog6vd5DpjaNAGJXQVwN5H1oluXCdbTVOGHlQtX 6A== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        by mx0a-002c1b01.pphosted.com with ESMTP id 3a4cs98x8a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jul 2021 08:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtksRUOSRwJMrDsCApuSEw6zRSaEijm/1zS+bikOeCb6AiY+3+erAvOjmynDYSVTQSS0Ql09MycV3w5XIMJDjZYZYWfE2chopmpVk0mc5qxzhaFoYYPh1zsH7wHUdNNaVjjayLrF5wMFNtqiqUsJ37I3I0oDlZ30k+SC7zro6L3qpuFz+BHBqtTFo9DR2fxRld5x/Gtjo3HAEi1iHtahg4mFGWUWP6Vg5JvkFu157CYo5nqPWyY/mGDMt9uihnkcnSHtoNVTBstHyo//ra3uv/xHhGKoprR99J3Vkljx0A9VLgLW0K+6e2eWWrJLfY7GU/rNI0fRMEx1oCOiKE4RSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01CgtB2ZQYJGPn837/EzvHv5YSSswAg24Mfgt5V6I70=;
 b=ZKacpNOCc6+C65pujLhrVLqs4TvE6y/jYpKPjt1ceKpQT+/rvT/7fUq4fHuyIbyfM/Z9OjOZwqLvVul6FBIiOgPU14CohGsQQV542322++nYy231Jm5HrokKgkfUEDdO8zSdQgw9rUJ7S1/l+jDuBJszFYJZ8N7dxtzgdsUhJDh1Ho/ssSOdSocf9BhA9vFMsGrkXMWNCE3dQjPrZUOwETVNfdklUddrKNUud14Rs/WgLboQLQBBoKnBRXifXHRjlvUoL/stpC0eyuN39BcC3UWnM2VkQbtGLeaMQAY1t77HqimGe3jOhWvoTHfwYrZieo72j+Os5yKoDeki/Dcpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: lwn.ne; dkim=none (message not signed)
 header.d=none;lwn.ne; dmarc=none action=none header.from=nutanix.com;
Received: from DM6PR02MB5578.namprd02.prod.outlook.com (2603:10b6:5:79::13) by
 DM6PR02MB6955.namprd02.prod.outlook.com (2603:10b6:5:259::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21; Fri, 30 Jul 2021 15:51:42 +0000
Received: from DM6PR02MB5578.namprd02.prod.outlook.com
 ([fe80::159:22bc:800a:52b8]) by DM6PR02MB5578.namprd02.prod.outlook.com
 ([fe80::159:22bc:800a:52b8%6]) with mapi id 15.20.4373.022; Fri, 30 Jul 2021
 15:51:42 +0000
From:   Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
To:     corbet@lwn.ne, linux-doc@vger.kernel.org
Cc:     ivan.teterevkov@nutanix.com, florian.schmidt@nutanix.com,
        carl.waldspurger@nutanix.com, jonathan.davies@nutanix.com,
        Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
Subject: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP shmem issue
Date:   Fri, 30 Jul 2021 15:51:20 +0000
Message-Id: <20210730155120.62065-1-tiberiu.georgescu@nutanix.com>
X-Mailer: git-send-email 2.32.0.380.geb27b338a3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:510:e::26) To DM6PR02MB5578.namprd02.prod.outlook.com
 (2603:10b6:5:79::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tiberiu-georgescu.ubvm.nutanix.com (192.146.154.243) by PH0PR07CA0051.namprd07.prod.outlook.com (2603:10b6:510:e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 15:51:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8fcada9-a35f-4fed-68b8-08d95371ed11
X-MS-TrafficTypeDiagnostic: DM6PR02MB6955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR02MB69550625FD5ECDBF98D85294E6EC9@DM6PR02MB6955.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MysS+3Lvzt27/fMDDrDZBjSSpFIVYjeHsO4zjlXuPQJZ/5LOSf75a1WVM+uEwCBJgwrmJSd307Lz23+fh3DMI24Mw0mxidEEnP27qpVgPvqDJSKOwN0XnLn0hZU74rnTkMHNQmXTBdx/ag9MV26KW0wv3skjegusPOGrVWNowyRuCFQkmz+Zejk02fOIHUgfirfyvgJquYi3KkqZ8q4nt7hkAEwk9IEw4rdeqrnlMSN3Hj1/BXRRoaBdnsov90F0EkBhbqkCu+kcdoO+g4lpgvmDDgq0O9g0Um4k/gOZU03ijtyfA8MEN32piM7meY2ysc3VNaeyY+sZyBOJIwMEBf7PL34TMRVoEGqsUFwzofvK6WE8GYzQ+1iHKUqaZ/8M35Sybj7M/8ukws272s9Nqc7k13B2ARwlCnzKEcF4czCTCP3Ued8A/n4Rh1MAs5SXe8f6mD0JGqNiLrjAyumPTa+UQyQVJY8cEbU8K5bdjIDt32UBf6fD5YEQLFraDMri84ghP+uSVsCmzrTLShs0WsnSDQvIYc4yVNmbFerY2S3+oASmqNIq++qIe09xc4pT3GzfOiUpXCip7D8Quc6OhedIFnEfQXbMq9ijrX+JB9hHCiCSNXNjLhnMJ2uVczeZGg87ajSJwhPmjuMasUfZdPzsbJgHae9ZcKTa/fDaHJN2E/Pwu3fZ1XbEzPejIXU5sIGSG05nsjtXvOZwLLcu8MW1rQIT21qdPgWSOX0wGHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5578.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(2616005)(66946007)(6666004)(1076003)(26005)(38350700002)(38100700002)(186003)(4326008)(36756003)(6486002)(66476007)(66556008)(478600001)(956004)(8936002)(107886003)(8676002)(52116002)(7696005)(86362001)(83380400001)(316002)(2906002)(5660300002)(14143004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1PjoY11VY68breysPYH7zmnXHZUiTyZJBhsqyLnYsVYFIpxOEeJC/JGe8Hf?=
 =?us-ascii?Q?LAi//Yv1Ii90ngZ34EapVic+UzZ1oYTrMxm13rwPMEoypp0Ww8apjs8aJ5ks?=
 =?us-ascii?Q?u2db+PdVTcV9tusTqTGhsCL90G+rCDjwjroqos56IAjQPm55WkP/uY2hqOEd?=
 =?us-ascii?Q?3thkN17pT4yaSNUzP20LzHt4nQHh3cBMaCrLIEh3wEVlDpjmNpk4Oc+znH4L?=
 =?us-ascii?Q?tOEOCqFK3q+PUotGRxxXr5AbFhTq1kKXS8P3OiAbJiT4W6eJqkoVtcJhb37y?=
 =?us-ascii?Q?JuarkeVCYJrtMAN5WEwCLDiiTdL8FPvreXzxfc3xuAmQbMBdg0k/kmTvwvlz?=
 =?us-ascii?Q?nlvSZdJ1/wHaX9fHrJ00mluhN8VV1mmuccNgl0GP2R8fwh5aKHczUMoum0Nt?=
 =?us-ascii?Q?QUEE+/LGcYQw9VfJl7iG6sr/tG6S1bIOL6MiD9BtoQuUsm5FXFUEhJHyY5az?=
 =?us-ascii?Q?hjettfVWiZQoXcWIrgYh8imioXa52Lj4LSjCDErVp/V0B9gh7Pa30nmvhS5x?=
 =?us-ascii?Q?bMzOKepnRWzLazR5H7THEZvnr9HhPJJKgdENwshIZQNmuLD5/2KzxS1wTRRn?=
 =?us-ascii?Q?UITJIvq5Ty5I4029w6eMLptT6fy8JX7JNMHrKk0K0gKFfUP3RQWtIJtm7ys9?=
 =?us-ascii?Q?lVM6oSHhnNWbRyTV9k8QB8h8KpAFxlRTsgGcu5D3+VWxvSWOPMwW1Xhj1X9H?=
 =?us-ascii?Q?fVLpoKqmAkZO+kDbDlgTSTVOrALLcXVp2HJlquvH6iaNDEHN0RPOjsO73bX2?=
 =?us-ascii?Q?IxYUcM3B/ydBrZ7wg4q6IwTWx9vaUsB893zhmWzPp5W3ZbOGWTE25J/u/nq/?=
 =?us-ascii?Q?7exJNhr1e9LlQSljhoYCXz0rPNGlYTVCxJJDnbCT/Ww6Hp1jjP1jrO6JbsL4?=
 =?us-ascii?Q?ECsq/s2jsSp7FNnzvUqx0pdbYcBuj4xaUZqiJh8FrOG4scLoyLlHMCPV06nL?=
 =?us-ascii?Q?tBq0EtIu16UuCUtHbCZOoMTe4/ikpemfEkf943ZqMLHhKK0ZjqUZt9sQlkpZ?=
 =?us-ascii?Q?v1TOVow2SFG7SvVf01sIzqOrqTr3bPq6af1Kmqw6nQmc0+X/7cmq2+2dQfA+?=
 =?us-ascii?Q?n1aSRaemSSL7tcHkUq1vUuUg5kUs4iBSzB7UQZpdY9zJKmYU1MTmn5Rb2ydI?=
 =?us-ascii?Q?F2/MtTy9JniNhESUJ/KXWFTeN4ji/fj2ZfwJkxizd9byIsPlsV/7jRpn4hkJ?=
 =?us-ascii?Q?3OE16L+Hl85en3A6dnetnnVrZnc/A/+DY4LHnb89WhNHZObqetSH6GMsykYU?=
 =?us-ascii?Q?YWIzeyNqZawCM4rj8Twqamk+2Z7meWoXJIoAi2DDeDMOrUmu5BQaK2aVeUq8?=
 =?us-ascii?Q?bMbS6myioO5UNzByxzHHgQSb?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fcada9-a35f-4fed-68b8-08d95371ed11
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5578.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 15:51:42.4895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvL4ZW/o9Ho2QeN7NnDUQuoDD+lW6pHL2qJLsvuTCSz6QyV2hhmMsD0facnh73V0UOFkOFTFUqdQ+WK/m62gz4b5J1h6VKR2qe9yIsPjI4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6955
X-Proofpoint-GUID: 6pFIa1iYgz6sp6irMJEzkCuQeo6J9htL
X-Proofpoint-ORIG-GUID: 6pFIa1iYgz6sp6irMJEzkCuQeo6J9htL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-30_08:2021-07-30,2021-07-30 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mentioning the current missing functionality of the pagemap, in case
someone stumbles upon unexpected behaviour.

Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>
---
 Documentation/admin-guide/mm/pagemap.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
index fb578fbbb76c..627f3832b3a2 100644
--- a/Documentation/admin-guide/mm/pagemap.rst
+++ b/Documentation/admin-guide/mm/pagemap.rst
@@ -207,3 +207,9 @@ Before Linux 3.11 pagemap bits 55-60 were used for "page-shift" (which is
 always 12 at most architectures). Since Linux 3.11 their meaning changes
 after first clear of soft-dirty bits. Since Linux 4.2 they are used for
 flags unconditionally.
+
+Note that the page table entries for swappable and non-syncable pages are
+cleared when those pages are zapped or swapped out. This makes information
+about the page disappear from the pagemap.  The location of the swapped
+page can still be retrieved from the page cache, but flags like SOFT_DIRTY
+and UFFD_WP are lost irretrievably.
-- 
2.32.0.380.geb27b338a3

