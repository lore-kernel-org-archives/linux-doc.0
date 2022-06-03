Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3639C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 11:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239592AbiFCL2A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 07:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237380AbiFCL2A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 07:28:00 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2109.outbound.protection.outlook.com [40.107.236.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EAA3C481
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 04:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjCFELeqkrtC5jc+FVQoMco8CJvnrydy3+SGJp8rZklLJYuaj6DAuAUL/0ZFQuW63gBxTTa945acL9wrOh1LVZU+wLnYKECK0tqztK/0AwyoAsOA8AQPqc25TNtcxucLncweu9wVlDXm3xjXLZT5dDwVJLte5fAjEE89BbQrjlyaiVd7+26CNjWNBtri42MSZNF8tlpGnqopzZwq4gOBZl8eWWOgmXAk75JW3eBaHG6OoEGpfDDzqty8sX5VEUMwXQDgYfHLGE5aK5a9EhFs+fDRSpDR70Kn0PQMSiLvfAX5o8tAUVoucuPHn0KR8hm6+BtxHQRRoMG/svmYPN6Lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPHGxoSqJw3IecZ2FtD7ZsbIjD8LWauPFKSs0fUehm8=;
 b=B6uX0Yrt7I36gFG0cNsPeGRS1wG8i15LHfwUPrq2/U0MwfddTiL2Vm9rG2ATJxeq43lGSy42Lfv0nUJ8hpIxFJeAleWpEMl24wNUchlctduH2ok3vp4Jvn+GgM0ChQp8lVErKC0X3ONgHHQaJ+n762fPPbHyWQyNh9thpNOY12GBixuAjjJfZsbNhTYwjVHOuUnePggoMCrabp+dkCW+cAkXB2wEEhb19KKyRT3Qkt6muqnshK97/kUwzgJ2+wg24hLz4MvRsAM/NQVFMFeJ8TVXAtFgtr7CBugkfw645cV8tHnzK7f21qUYAOBXFodzFANPO7/TH1Urk/UQb7uEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPHGxoSqJw3IecZ2FtD7ZsbIjD8LWauPFKSs0fUehm8=;
 b=L1vSx8Dx6gO+t4MbYp8K90hRCKDGL9iDlfgO2QkGdJWDzvZiVShak2vjD0VJ2jdzL5vhKJpMapPhtnPlWkWb5C02wSKVCujkjz102s0xxXYmPbPB6F0A0qA7NgsbqVYDU4bzOmsleQrI425ETdeWwfOYy45OOSSMdVPqrHQ48ck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SJ0PR13MB5367.namprd13.prod.outlook.com (2603:10b6:a03:3d2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 11:27:54 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::b18b:5e90:6805:a8fa]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::b18b:5e90:6805:a8fa%8]) with mapi id 15.20.5332.006; Fri, 3 Jun 2022
 11:27:53 +0000
From:   Simon Horman <simon.horman@corigine.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        oss-drivers@corigine.com
Subject: [PATCH] docs: arm: tcm: Fix typo in description of TCM and MMU usage
Date:   Fri,  3 Jun 2022 13:27:29 +0200
Message-Id: <20220603112729.222398-1-simon.horman@corigine.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0101CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::47) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c688435-915a-478b-3901-08da45541980
X-MS-TrafficTypeDiagnostic: SJ0PR13MB5367:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR13MB5367C20FBDEB2105B2A161FCE8A19@SJ0PR13MB5367.namprd13.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LcVwV2MsRkAMAWU2vFUyxj40okMnbFeySbTIBkQUuVWxR+FumMh0HNMoWW/ObQSA3b6eXs1vIuOv+1ZmDC7eGspBw1WsB8Qv71pQA8D3Y8yVrRE0mt2wP+/m8RyXe3Dl9srOpyserMmrzi86Ra/n6TCwqbvxyQp7UISRatNaukGbhu/xcLevTuZsd30p6EMhfFxN0JUWo+jH5f0e9OaNrcMS0S5w2j/oDmk0ZKk+61MxPns12YO8U22uWyt+kZYz/HcszidLi5nMwyBU6IkkAH90QvkxR2qvCvHIn1BXXk0kItXfCT0RFhbZ+fkKkJ621105Y89NJmAAIVX+W9yKbhVqWN75oRAKnXm3VocsEms2LdsR5lYUBCZL79iqf7DGxSttdJ2wpA5KC7ZGMJ6K0XQuUSQIKqyxMBruG6IRK0+8VCbDnuDbzDIA4PKxlWpUmNgif5VVFOKLGHdHON5BZeZxBfMWhzNG2DBm9mCAMzOqa5BZ4Cc4K2s4WoOWWCnbTRQEWnx2Hq3cbq1rrUdhXeIchl6zk5EJPR25gtmwyzlt6Vcx29m30UCBdWWE9+h5bhxJHOddOOdheVscmPTA4RmJxMRUNJntdN6FvzFuGKPBRmOjlPoeIfYgTH11kxSQtDKCA0F2w4lHH1l7CA19Eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(376002)(136003)(366004)(396003)(346002)(39830400003)(4744005)(44832011)(6666004)(8936002)(508600001)(5660300002)(83380400001)(6512007)(186003)(1076003)(107886003)(41300700001)(2906002)(6486002)(2616005)(52116002)(86362001)(6506007)(8676002)(4326008)(38100700002)(66476007)(6916009)(66556008)(316002)(66946007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rNvWEfqhhHZPdx5ja5fyX544XBYrxjiROyLwd1UuwUycn8MbSB8Xrcjl8CLG?=
 =?us-ascii?Q?nXxIjnuIsD3yLBrmRmHgEv5UdD8ob7zHdaA4lYbEGQriMblLeY5voknYDXkb?=
 =?us-ascii?Q?GkBFEDBoEABer8uY/6Bl0SmScYu8jlgmDkLdJG8yLcK05VeQGSqkEIg7cruJ?=
 =?us-ascii?Q?bkpDsV4OVwkL3fn4eY+4NoTX2zcuj4RBJ8UzFmxAfn4I/jXT3mr7sLioOBWZ?=
 =?us-ascii?Q?s0kPDkka3a1+3pXOMNiVMyPVjb9Hk6oNHo6tS7ZekoEzzb4nt1QuBlwq+mCd?=
 =?us-ascii?Q?JtRLTmB8Aa30Kf2C0JmlyIey0thooGd/xnpWkDxTc4sxykdugFx/0xfQucaq?=
 =?us-ascii?Q?VzspuB+Faj6iAoW9wolzvEhnvRAM2Qx/HEFs6LYDZVjsiHOf+eya3HT7gdWK?=
 =?us-ascii?Q?miYC2ulcDLpCvVMugkv0o14dDCkKBnxmkHSZvZdrGrMz/WD7qPrqw2JSH03t?=
 =?us-ascii?Q?bbnVNyqabj+uK8yxJNJnI3+UYgU2F7Vo2+J4M1LzpaN4ypnIoIy/TaZJeyok?=
 =?us-ascii?Q?iVblJr1I1CZ2mU/ogDNhI2IQ+t6+58LVQvg1ZanknJeK2/S1qBX50W7wqk/d?=
 =?us-ascii?Q?8c3qhC5SCDla91hDbC+tJhYTBm8MjdhzBKAW68MWkY62K398fd7JfjpAfws0?=
 =?us-ascii?Q?7dvsR7mph4YU4coPxGWhVP/lfBHTzIG5vI0tFkqK9QKDgwnGohAUAdgcxr+K?=
 =?us-ascii?Q?4oRwgwwL+EYC2zuGYUkum2FYKlOWsvldwc5s36nq1WyovnqvmFFRqRhMSAKx?=
 =?us-ascii?Q?p+qsFRN5+EkCw2NAey1Utu4vIJUUrGedlUDI/r5paVNQCDPI6An/UHOgyTHK?=
 =?us-ascii?Q?lYOC8Ou2FRjamTCUhhG7hp+MntvUU2iOvuvUO6FA7xW8kr3g2sYerAVnpgeG?=
 =?us-ascii?Q?Nxql06/8zjoQEqc+gGCTZX8OcC7w08XIikgs6eTTKqhgFffZsIZO4ToaZb7r?=
 =?us-ascii?Q?GeQmG/Qeh8qfpnhvWVu+tZm3JnqradX5TgcG7qUi9/hm3FKVLwM+KDcyVST/?=
 =?us-ascii?Q?mG0zgg0D+Q1DIZIbQCBkEHyC4zy8R3Cpq8jHzUf4Rs0JKg0SGskVDU8D6EiJ?=
 =?us-ascii?Q?XZ2ecUNEPEhrlYRvPO+6TY7/Is35wYYqcvQPsK45DTCEle7SJVyJmcUN2XiR?=
 =?us-ascii?Q?87GhZea/XAU6dPnkrdWUnI7oCvhydz2nSbqVMWOGNRWJOhXrik85om73nP2K?=
 =?us-ascii?Q?KJoq8EA4mGnxKcAJGinhm0R4TLsYfb57ZVlIiLNp+9bGSLBYulTkGwLKdqFW?=
 =?us-ascii?Q?QlfEg9fy9zYWspTPAvDr/qsRveYXXmzLnITJxFyB4Bi0mZhr1OGyWeqLk5Es?=
 =?us-ascii?Q?UB5mcvLsED4q4MQqNVxTxKlWGrxaOR2RWoklkTzgyKh9brZxPifv1PCETxw/?=
 =?us-ascii?Q?c8lnFXJ9hbwzWN6fvvbQJrEv+tdV0Ff5NSixuj5r8OAV+/vZ1+LpXDUXXTU4?=
 =?us-ascii?Q?AvzLZ5lcOeZ9wWP1zOtrcH7At5nfsoFjjLhkdQJunPRHKBFMjkE1DXhL/FpJ?=
 =?us-ascii?Q?YmsQKsfx/fEWL1CFkrBg4UI19nvYFTTUThC7A3gsu/csgzVU90ZGytTcpjL3?=
 =?us-ascii?Q?a2qRcYKuYzAnAt29Y4aR5zKXkoerpJ4YjEIXpwMaSoJV5+gyCHJo1NaJRbtR?=
 =?us-ascii?Q?TI0zqSkL5VRMUYJQVd7pjSk5e71eBFOiumJoTOU67AEcr2T7fAjZ90nuwoX9?=
 =?us-ascii?Q?wIuu+fpYoHRnlt1kGK3fPYQm0Nzpk7IfvF3O1zIiXUCfYIfLQvyMWEiFWQQJ?=
 =?us-ascii?Q?rBh51Og7bVMYJCfoYPlXFtkkjE/x+h+AOgi3+t6oL0WmFVH5RkadGJ4A59EV?=
X-MS-Exchange-AntiSpam-MessageData-1: aWTZXo5H769CaGJ07hAEvoYsIhEuTIvXZ+g=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c688435-915a-478b-3901-08da45541980
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 11:27:53.6873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Nf6TcL4xPyvtwjtYiJi99kDYi/RmZtZTsbCAjKMBf4hHZmQ8Sofs+SbJYmgccY9Abr2ABdLogvr5LomKvUEfsaDdN2aUrpudWAZMEudtqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5367
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct a typo in the description of interaction between
the TCM and MMU.

Found by inspection.

Signed-off-by: Louis Peens <louis.peens@corigine.com>
Signed-off-by: Simon Horman <simon.horman@corigine.com>
---
 Documentation/arm/tcm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm/tcm.rst b/Documentation/arm/tcm.rst
index b256f9783883..1dc6c39220f9 100644
--- a/Documentation/arm/tcm.rst
+++ b/Documentation/arm/tcm.rst
@@ -34,7 +34,7 @@ CPU so it is usually wise not to overlap any physical RAM with
 the TCM.
 
 The TCM memory can then be remapped to another address again using
-the MMU, but notice that the TCM if often used in situations where
+the MMU, but notice that the TCM is often used in situations where
 the MMU is turned off. To avoid confusion the current Linux
 implementation will map the TCM 1 to 1 from physical to virtual
 memory in the location specified by the kernel. Currently Linux
-- 
2.30.2

