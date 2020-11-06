Return-Path: <SRS0=YDtV=EM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615BDC2D0A3
	for <linux-doc@archiver.kernel.org>; Fri,  6 Nov 2020 10:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4446206DC
	for <linux-doc@archiver.kernel.org>; Fri,  6 Nov 2020 10:20:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="5uW2zMZP";
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="5uW2zMZP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgKFKUd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Nov 2020 05:20:33 -0500
Received: from mail-eopbgr150050.outbound.protection.outlook.com ([40.107.15.50]:42660
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726642AbgKFKUd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Nov 2020 05:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o57nPdKc69cmoVpXBQyh0cMtvu6jNCquHgsAG3oTL54=;
 b=5uW2zMZPoJkFI/buD/T0ypZnBS7fOL+Se0CvYR5Y3YL3gQpvRCel4TETZ0MeSQSYeQx28KKMAfSAb03wiF52dVVBFQmncPvkY5ItjMYb5pxhTYfgJo2NUveIHBehvdE4u4bMuG2Cf1uEhrWg4xu7zq+klH6BdM+c3KyQBPG+LX4=
Received: from AM6PR0502CA0065.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::42) by DB8PR08MB5161.eurprd08.prod.outlook.com
 (2603:10a6:10:ea::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 10:20:27 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::90) by AM6PR0502CA0065.outlook.office365.com
 (2603:10a6:20b:56::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 10:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 10:20:27 +0000
Received: ("Tessian outbound 9cb9038eacad:v64"); Fri, 06 Nov 2020 10:20:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 387ced14a052e387
X-CR-MTA-TID: 64aa7808
Received: from 3ee90cc3995f.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id BF174E08-2806-45FB-9825-9D7353D216A4.1;
        Fri, 06 Nov 2020 10:19:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ee90cc3995f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 10:19:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5qzj2nmCD202biY2/UXhZPXBWmhtZeQvsyPgFpe+/1Kt9+AdWLoru6nfZN1U02/oUzNoroD3xW7Yg2Y3/BLnCBX//CN7WSuMV40Hkt7/wXmVsefr5tLZH35O2KtI2jikVSvElMs+WZn+c4sEXyw2XHPC1TClYxDR/RQrI8VQjLaXSfTjbWovnVK4GeZgbsgpQXlKU0zLXYJdJSkGOvnewfWO/9lK8yHChIOQKjWoCg3i3XaY4htsTAC+Q84n2T8Spr/21yvsPXRBPItN+2XDi2BMuERd64oTAB2muim+94icfdK+txavnulEoWV0BagAEaV/+udNgAI0KsiuHH6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o57nPdKc69cmoVpXBQyh0cMtvu6jNCquHgsAG3oTL54=;
 b=MZb7aEvrnSGn3g7mwECwKQyehkCkaUkRZLoyeQbK/n91JMGqsbZsponvn7dUiohoTKue/mU5aomf9/6VlYQZ39bxFn3tRhgNe36bMD5zflBJnO1AXTl6yYai0hlrl6kn+UZmLlr921pWmQF3QvbQvht0R5aURDiBTb+StDq/0Rp3+pnBtQvci9fRf4GIfWjXU+u2RoStWZyHfQ6QvwYX2HxJ6whzSvZuTDmNY+oeGC3pndP1/ngTOqdCGy6iMlcIPch0+HI7OL2c8t1GEkA2+cnQBdPWLxV+CKzxaDjOPVP9OdvKYlJ4STFjd13v6byvFCkIYzU+Ugt4Bz3Abxzr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o57nPdKc69cmoVpXBQyh0cMtvu6jNCquHgsAG3oTL54=;
 b=5uW2zMZPoJkFI/buD/T0ypZnBS7fOL+Se0CvYR5Y3YL3gQpvRCel4TETZ0MeSQSYeQx28KKMAfSAb03wiF52dVVBFQmncPvkY5ItjMYb5pxhTYfgJo2NUveIHBehvdE4u4bMuG2Cf1uEhrWg4xu7zq+klH6BdM+c3KyQBPG+LX4=
Authentication-Results-Original: lists.infradead.org; dkim=none (message not
 signed) header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=arm.com;
Received: from VE1PR08MB5566.eurprd08.prod.outlook.com (2603:10a6:800:1a9::7)
 by VE1PR08MB5678.eurprd08.prod.outlook.com (2603:10a6:800:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 10:19:46 +0000
Received: from VE1PR08MB5566.eurprd08.prod.outlook.com
 ([fe80::479:8cf9:caa1:5477]) by VE1PR08MB5566.eurprd08.prod.outlook.com
 ([fe80::479:8cf9:caa1:5477%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 10:19:46 +0000
From:   Szabolcs Nagy <szabolcs.nagy@arm.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: document /proc api for arm64 MTE vm flags
Date:   Fri,  6 Nov 2020 10:19:40 +0000
Message-Id: <20201106101940.5777-1-szabolcs.nagy@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO3P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::13) To VE1PR08MB5566.eurprd08.prod.outlook.com
 (2603:10a6:800:1a9::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (217.140.106.54) by LO3P265CA0008.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Fri, 6 Nov 2020 10:19:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 362b7143-ecc6-424e-ac8d-08d8823d94aa
X-MS-TrafficTypeDiagnostic: VE1PR08MB5678:|DB8PR08MB5161:
X-Microsoft-Antispam-PRVS: <DB8PR08MB5161D03071897E9AC0B91478EDED0@DB8PR08MB5161.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:398;OLM:398;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KezDko9hlefpJxzpi8mPSPvyfqSzUl4Tw8N99cSfcSqBorSbCYrE456zvougSPBbaDFgknD0GwGwSmgecmVu5bp0Y+vm3uQo6qVecZoNA5N0Pnipr3H49TB3fYQPUioQalv4ndEjvNqybiUACVjBDt937ZMFiu2p0coBOARX6aKEDQ0/zA3bkeTg9mqQp4laPZJaH2/5FW8JXaOHHim5l9XddQ2TrPa0s+3VA0IpE7c5SpY0Q9bC+6KjglW51j/v4Z3CVdXW626jT5BFqkXpM3IOvy2sRzmmne8ESzI4OACWKpKL+lvNVimf2argYMj1Rb26aJEelIY5tRCQt+Mg+eWabjx39wxTefxj2XRMqAXoZyVgBA3LPY+SR1NZOV/k
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5566.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(6512007)(26005)(2616005)(956004)(69590400008)(6486002)(8676002)(478600001)(186003)(4326008)(6916009)(44832011)(5660300002)(66946007)(52116002)(66556008)(6506007)(86362001)(36756003)(1076003)(66476007)(6666004)(2906002)(4744005)(8936002)(316002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: qUtP3NTIDbtW2Hzwo7a7ctxqGPcSICywlh7KhZQwVQDkNow3tINcFeDcMXj6vd944X/6NKqHxS56psTlaLbwWszRVYJ0oSBxU2VdgxwSrB8xKY8mZfJwIR0udWXnma/YEHrly/xmv5zjn9tENWf/ZhW6WVFheoTe0rBrl83bGNbbEhH60DzgZSxb4dwFQvKXFCBUzYzzBDsTQStkF8c8PXBOAga0UWWvEVKbdedLekyYaxODiTwCTpv33lu/HW+jDx0BHHP3HlapQHbgoQ7GXv/8JMdwFP3SkVZ3aj69nFLgMtmcEiMn3MwxHiglhEqy5Y/yE69pMcw1bSEzBqI3bsBqVfgmsmevwQsyLYpRREXRNun5MmV3jlGMnlGu/rd1SlELa2wWwSXb3VJqcB3WW9ArnmTU7795cKhvZ63OKdngPanf6OTkT3iTjTjfznR9Mf4Q6LpLuU3RBkbVLyUBm8/jgLLtN53fAM8ZqWelOfVqrmMlhPKwYSlm3Dkg1SEBAksXVNCTqRfupiSPtGjg/2q/xcouV/b2E2pCL6dn9WN2Zf6AVp6E6FcOscuCV/HAiplizZYc4mg3xeiZAEJLsxmWYhiaxynJ/zDIYkpKtqf0GYkp3I6K0ZWLReBX7yKNcFeVnLT22UWAr+fbWOqhog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5678
Original-Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6033da04-dd10-4a3e-8695-08d8823d7c40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NG9YOVoGCRwf249WYnVS4CDwKZCO6RDy/kJa9AOL/4qOzJ97mw3P/ESZ62f7aWqQDzSATj+yzgZ72jqhCfZlvPCiuqge7PQbE6ZyQpef4Ur4NOtz+JlZAvUzi7/lKodRgBFJJHf90qX7GQiv9J1WVu4D0Hd3XkPxVMP19l4bWaQhUNlhClhGm5SQQuyf7cv/hB0C67i/QWQ9x+aJWJJgiF7ka0eAPNeHVMr3QQVPKCvZTzdgygw+ttMo7asj4szvhttI/Tfq0V4M8zgNgG4igEI0uHhyFzPyBqXt+i6y2pldFOy6sQq2zw7YpWS1U+3I1Ex20gxQvKYE4+yIVBGny8W1c10g8Tvn5Fm90PmvMMppP3mhqd5Nctp9X6txVwVc2y2qAscZRkC8SemHa7RMrS14/z+pyh0PM8oN0qR/xBn9fraT9KSQvMIGCWzWk3Sx
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(5660300002)(478600001)(86362001)(2906002)(34206002)(6512007)(8676002)(26005)(70586007)(70206006)(6666004)(44832011)(4326008)(6506007)(8936002)(2616005)(36756003)(1076003)(36906005)(316002)(6486002)(956004)(4744005)(82740400003)(81166007)(82310400003)(16526019)(336012)(356005)(47076004)(69590400008)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 10:20:27.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 362b7143-ecc6-424e-ac8d-08d8823d94aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5161
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document that /proc/PID/smaps shows PROT_MTE settings in VmFlags.
Support for this was introduced in

  commit 9f3419315f3cdc41a7318e4d50ba18a592b30c8c
  arm64: mte: Add PROT_MTE support to mmap() and mprotect()

Signed-off-by: Szabolcs Nagy <szabolcs.nagy@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-doc@vger.kernel.org
---
 Documentation/filesystems/proc.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 533c79e8d2cd..e5fa972d4c76 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -546,6 +546,7 @@ encoded manner. The codes are the following:
     nh    no huge page advise flag
     mg    mergable advise flag
     bt    arm64 BTI guarded page
+    mt    arm64 MTE allocation tags are enabled
     ==    =======================================
 
 Note that there is no guarantee that every flag and associated mnemonic will
-- 
2.17.1

