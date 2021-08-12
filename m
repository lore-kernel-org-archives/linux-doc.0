Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10CDC4320A
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 15:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2FF560FC0
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 15:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238351AbhHLP7i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 11:59:38 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:27338 "EHLO
        mx0a-002c1b01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238195AbhHLP7h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Aug 2021 11:59:37 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
        by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17CFvFSe003867;
        Thu, 12 Aug 2021 08:59:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=01CgtB2ZQYJGPn837/EzvHv5YSSswAg24Mfgt5V6I70=;
 b=GnH2QCymk/klylm9hBv28j3PpDQH6zLjVTBIrC3hmfzNaaie+XoZE1bTMOrKiYRqTNIz
 MBcNpDkiE16cGrodm9uRcl/IBnmaK/i6oLukF9bK3INIXFKRyHH3YVdJBly/rd8hGj1t
 lUoMV6qOswZlA3KhaFZEfmPa4kWjJWiNh+bhfNHWbgWMFkW/sGboZgqYb4lwnz1Oew6/
 4sk2FoqMYinADEZF9G1xMTp0QxvFUw1HXAzN/+E0GLcC75JGArF9YhkFwqkPgFCmoHCJ
 yFbBSHB7vcav0LeSXSheOznL8hRo+n7WaP4a+LtdafWh7q3ZAtver6FguGs1elESNy3I 4g== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
        by mx0a-002c1b01.pphosted.com with ESMTP id 3acxd2h170-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Aug 2021 08:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf0ZMCK9MAalNYR4YfbkaPBSlNzjiisHFL1eCZjqZKyDb/WZR393bi2vLueQZvvODHoUNNlxrzb1PmqxA/N45h+/bFdgAP59ZLt8l8ko4J6ZgWroIolfMcquKf3zHQrhhTXf5v+PRBzi575L20qqcGAveF9Hz4fYib7Wos3RuS6VAvZV2VSiSsxhJR0Whol0FyqYDWnBxMSQSZZ86rHPk/Kt3RFxlHZRH6BTwVIy7THG0IfzAv25Z2QEQ+5dj0LEK7wncwuTo4pdH9JzBq1g9OtgzcZdLjSkIL03z59wNXi+KA6ZoCDhMcbVS/79Y/Kess0cLyq9nvWUBVMyOfgU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01CgtB2ZQYJGPn837/EzvHv5YSSswAg24Mfgt5V6I70=;
 b=c8k9d1wmrR7yaMFAFvvk2WmPu7LcF1q6PZO1VJO+znIPKWYgjycsnx6o2oFBsUsLnYmOh/4LVX2dMAL8/UxGoMwPUDLGrKeG9SUEWQ4X2gII2NGWpv9bMDj+ANb+8UZMsUI6ZvsSYsq1bxYYeNSGwOcb6v8d6mKNBTtKvGpMtSH5q95O/J6NvtilCkcWcf2lDqO8WX1+CXa2F2vfPSb+Avc76+HDr98YoNzkN7p2ZosoZEbFlWc4aqoxjbn7CZidEmLkSAgk4xN5rccYd9XUou1FE5Fefn6+xJPkcfGjLdC3nUnlqfYkOQ6kaZtBiymhCJwNwMrAADArYR/UmQs5rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=none action=none header.from=nutanix.com;
Received: from DM6PR02MB5578.namprd02.prod.outlook.com (2603:10b6:5:79::13) by
 DM6PR02MB5866.namprd02.prod.outlook.com (2603:10b6:5:152::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.15; Thu, 12 Aug 2021 15:59:07 +0000
Received: from DM6PR02MB5578.namprd02.prod.outlook.com
 ([fe80::5116:80a5:77d9:fcc4]) by DM6PR02MB5578.namprd02.prod.outlook.com
 ([fe80::5116:80a5:77d9:fcc4%7]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 15:59:07 +0000
From:   Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org
Cc:     peter.xu@redhat.com, ivan.teterevkov@nutanix.com,
        florian.schmidt@nutanix.com, carl.waldspurger@nutanix.com,
        jonathan.davies@nutanix.com,
        Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
Subject: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP shmem issue
Date:   Thu, 12 Aug 2021 15:58:43 +0000
Message-Id: <20210812155843.236919-1-tiberiu.georgescu@nutanix.com>
X-Mailer: git-send-email 2.32.0.380.geb27b338a3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To DM6PR02MB5578.namprd02.prod.outlook.com
 (2603:10b6:5:79::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tiberiu-georgescu.ubvm.nutanix.com (192.146.154.243) by SJ0PR13CA0129.namprd13.prod.outlook.com (2603:10b6:a03:2c6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.8 via Frontend Transport; Thu, 12 Aug 2021 15:59:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77f3bc66-ae9f-4d73-573f-08d95daa1d50
X-MS-TrafficTypeDiagnostic: DM6PR02MB5866:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR02MB5866199FC3DFB80D93DFBF7CE6F99@DM6PR02MB5866.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1I79wIQ/KDtwQE3TKTjTxPar6z3L7sG2TMmrhriDybnWdgWeMTmRXaEW01cN+jKYU5pstv6fZUSqETh+oA+G6lc7RPatOX3VcabP7AgNVu1UfJj8Z/kVrpqAAwWuRX8XDHqdZD1R7MrwhPDLTsDYeBRXX7uYA4liIMpiT/G4hD5KPWQWxl9h6kukwjdSu+b9SYgFTCo3ZtHfRwYgicccvH+SutC9tLR0fTDJKPCuG7hDgUP9fIjPWW4evYiCghTsMkQPeSEqh6FAqlvvQBFValXIFD/tmr3aHt6IecEdmswh4Dtpc/ER3JQPo1OsFNfVb4p90UTXgfBlFIzMFqP39daR2GAYNOJfUhKadg7GC5ZposL8ji5lGLk1YGqjZqeqacNR8MSabHrpLCxZ7U3YaoSq1Fx+6JygtJu4IncHhfyhTXDIGM7aOjXpOkkCDjq+UYqSypZq1+c57DL/9XdM1BneVEjVSiMO6PVcbXt9OyikJFh7NJemJbPmcEmUzsd9TiAKsA/N41Z69/aiPWu0UWr1wmJsERoQcjCAkjQnK93t/KG9jlad84jdjRCHAcWvIx+AHuii7Ll9eM64gI2wumk1WPovzaQuCi2HVjeZcJD+ql3PnVAcIdmIq5ywuwRZgbKREbpbDa29b7mi4NeIl3m4WQDsRnKLMQk9RM00pHHXdqqzMLtpwBOqhlXlQFGgqbbz0hb61cGvNr3UUDa1KF4t37PcdnrBa90JQAyBzyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5578.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(376002)(39860400002)(366004)(52116002)(4326008)(26005)(86362001)(186003)(478600001)(8936002)(8676002)(7696005)(36756003)(316002)(83380400001)(107886003)(6666004)(5660300002)(66556008)(6486002)(1076003)(66476007)(66946007)(38100700002)(956004)(2616005)(38350700002)(2906002)(14143004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RKZG8gI6S2GDyZo3b0e5uoDneTmUhc/WlxNT/NtvR9DQKw+TNaQWG+eiyPJJ?=
 =?us-ascii?Q?wv7hq+WV754Ff96+Rnx7qxlWjn0Ix/+YJrHHrMJH7YNtXo2xV77P1dnA284k?=
 =?us-ascii?Q?0X8hyFWWFefAtISerkKhVF7rBzaTyKn686W9NwERVNMmX86uK+pZ7HFyChFT?=
 =?us-ascii?Q?rtaMKVDxIb44b7JAXCqUyqJfLHUUwq7kcV0s0H6RUwLNQILQ4fjdgKopMHzg?=
 =?us-ascii?Q?NpYdfmcjx2wMSJTznXQTkfRq+qFAuGGPKaFnX0AUU45fegSlup3og2s3s0oP?=
 =?us-ascii?Q?OdHnaZVnD2aUljBA02vZymCqQWlpSFUNc7fOmcQjqr2RMVAyfbIwSJJv0EdG?=
 =?us-ascii?Q?/Pt08MLymeYIw6HMztnq6YRHHembXM61d3gOn/XlvwZ4V26TRMVhpxF8EWLQ?=
 =?us-ascii?Q?UeQqP/FqyIc5h0au4Y7gccyTy9Tw8nhxwCPOl5B0snXUcaE1trqvP/CcDqTG?=
 =?us-ascii?Q?Bq1DKqVPY1AL+trSI+KHI+ddU93IgrSn7F8tp/IhIlAp0f3nQ59QbRv5Vq2K?=
 =?us-ascii?Q?GUP8zOj5qDhMRINqUZg3jIaiiy1NSh1SkPJbkYLntsWiZU7JOs293mFJ4myl?=
 =?us-ascii?Q?Z9dyHIZpP3zdT1Z0GXoU7Y1HxSVQ837ROLJwnj47p8v67USPnw0aR3Bu55WZ?=
 =?us-ascii?Q?n30+mODDavuemAwNRv4Ii3+aXKYGGRJ1Ihjh92Zvv94LnchhUegAMRa7Chn1?=
 =?us-ascii?Q?iNFBxwPp0WqK/NbH3rElz7yzskhBI0D59VyE5C3wO7SAbx5ppCdgNLPRTpz3?=
 =?us-ascii?Q?R2wwh5pMk9lIQZQxVDng0hSr/S748hyYqeIhuPVw6DfSeIQ+FECmD4gGOKEo?=
 =?us-ascii?Q?PgLh4wgiQHP03xAtyMoF+C+JOa0qMQiOAkT4jjRaeBtEkIW0w2zJdyFAsgr6?=
 =?us-ascii?Q?KwK+5hwZxDjFg3xIaVgDrKRACEymv3q93LSIvH+4HXKeSGlNqdnFrtvdsyGc?=
 =?us-ascii?Q?fNZpR3ZthMDn4n3DzmsdIG4nUpSlxh5UxoMIiVZ9G8zaEoh999A93sthxkR1?=
 =?us-ascii?Q?Y/k4e3fMOl7vX8nN0lIH5Z6HH9AV8eDlELM/EdLa1qsgP2NJzKF/9zo4hr5P?=
 =?us-ascii?Q?UVbS7mgmws5iqDVAyPGuVRzxGhqjpJ+LNU0vaM6ZvPOSEw/JCoh8t4Q5zpoo?=
 =?us-ascii?Q?tuRETAgc4WKGtq67FmXWkUDtDXtXvu/yh0gVIDRqDsWJbWPLSoUAXLWEk56J?=
 =?us-ascii?Q?gbmLuxkAEf7GTBVL0B/FsTVur9ln35Ossfm2wiMEOwLFNozZ18aYRQ2izpGB?=
 =?us-ascii?Q?85CzeFHbKHKascdYT+200zLjza1llZLv8g9dji8Bf9az2nwFY9S4T2oNnOKv?=
 =?us-ascii?Q?uQcRT31EpJwB4C4Y3JLzAHQP?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f3bc66-ae9f-4d73-573f-08d95daa1d50
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5578.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 15:59:06.9042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYLvM9xwmzuP81tTYa3zaX8V5DhbDSdRinJ/vBuo0ewOxIeepbFaz8t0SLtDjeRzGBJxoXE6bC7JTHyoqw1cyWzWJ25YynaoSm798kP95Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5866
X-Proofpoint-ORIG-GUID: r3huxYa_sNJkFrOK6FDIeCoaLsPwNeik
X-Proofpoint-GUID: r3huxYa_sNJkFrOK6FDIeCoaLsPwNeik
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-12_05:2021-08-12,2021-08-12 signatures=0
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

