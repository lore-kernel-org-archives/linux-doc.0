Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77B2C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 18:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbiFISm7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 14:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbiFISm6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 14:42:58 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2126.outbound.protection.outlook.com [40.107.237.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E501E4529
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 11:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAwhNdWQj2C0cQRJfnPqAncOA11oqDPL2VdIad1N9Q8oa2w9T+SqJE1MB5jHTRD3hsAeLam10LKgfVZGDZ7NRtyzeh7MONqH0fFzz8yzOvySE2zWJUqd/kkKT2nfv2U+MElb2SW96f5Q0TiEBdwSoKUBXNb+kw+pm9LBkYPIR2Z9/5flNpYldF2fQWvdIqK5YjjRjrTUM4zQIf8edEbgedcSzj6jN8Rn8Nmdymi7SvV88RrZ2WGFb/M+L0tAaKpsirZ4tSP7BIv/sTkqwdPHu6jSeogHtoHicLEcjBYJdGr/USIWDpaFD+iWpKU3mZXsy/Fry9XC6kK7OEU7xH31OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuwGdFCxT3AxWBLrp9fiGhT61BF8GCgs+I9WuplxJBA=;
 b=VzbW3flQedhSp5YeHvzOiGW+EzcM+vjeIAZ2zO9JY/7rNG8/epePeZkEWqtK9O21YgR/x81JJxzcXskBoGpaX7eYvvbdcQv+QdvV6QnrLFzBWI1YPc/LTyE7WW9IEVP8kQuPHs4WVXjQQ+zB+5/hJuIGEDrX2+x+5+FSz16m0ty+Yxn6J3Js1thspBkfQYHu4D7e0HfKf7OWSYfUxORuRT28zsPn/XbaJdWh2jAGFj7rRvCjdNblneczL19qycrOL7KZSobJ42VjBeeP7Q+BPnhUALI7HPmiwWQ/cN0AqMgUlQfC+l/9h9uVW/Q/1FEKYA25FfQVCTvsFZ1Mukv+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuwGdFCxT3AxWBLrp9fiGhT61BF8GCgs+I9WuplxJBA=;
 b=OiQH1dEKBwTyaw/5iQGie64GZx0IN7hldx5BDrBFn6MRTA347CKE7ZGsVH7NWSB64CDMS3emRijlNw9G1Iv/39t4hLVmR6XNKoq7FdOSTEzQ9tPDXGxqtMZspbyJm52Rn4SvXsGcv/02ZTCrfIo0j+/DJKxLkbqOi5xz+ciRx+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from BY3PR13MB4834.namprd13.prod.outlook.com (2603:10b6:a03:36b::10)
 by DM4PR13MB5858.namprd13.prod.outlook.com (2603:10b6:8:46::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.5; Thu, 9 Jun 2022 18:42:54 +0000
Received: from BY3PR13MB4834.namprd13.prod.outlook.com
 ([fe80::2969:19af:7d52:6e33]) by BY3PR13MB4834.namprd13.prod.outlook.com
 ([fe80::2969:19af:7d52:6e33%6]) with mapi id 15.20.5353.005; Thu, 9 Jun 2022
 18:42:54 +0000
From:   Simon Horman <simon.horman@corigine.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        oss-drivers@corigine.com
Subject: [PATCH v2] docs: arm: tcm: Fix typo in description of TCM and MMU usage
Date:   Thu,  9 Jun 2022 20:42:30 +0200
Message-Id: <20220609184230.627958-1-simon.horman@corigine.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0131.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::36) To BY3PR13MB4834.namprd13.prod.outlook.com
 (2603:10b6:a03:36b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa4ae999-83e5-4e46-8646-08da4a47dd2b
X-MS-TrafficTypeDiagnostic: DM4PR13MB5858:EE_
X-Microsoft-Antispam-PRVS: <DM4PR13MB5858B47A936A318D2841C8C6E8A79@DM4PR13MB5858.namprd13.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sxO0iEOHjCVBR4cpYTkEal1JZx1OY/23N6bRtpyDZjza4iMPMH7l9RpDdLwD1oY91VKQU073GjUOmm1TTjBSxiVYIDaw9KVVqxDoALq8STLiiFiy/pVQrtrFikhRrFP0oPNCCOBtlg1Q2pzJgYjY9qieOTd8NAMVZKdhDyrF4VuGaK7qiQoqzCwTuAPSTwFeU5jTzvFaineTDTowLMf4SxkjHuOUa8XN1XNHM5yKkdJyobc78Yf8+VJFsE4fWw5j/a8J4ARpTJtYVr+vuam0slw6mGcNxRa1UhSjYFDeMCdNopqjxCDNEN5duudphWXCTFnG7ixTDsN/QDqhBOHsYLyPCIf+xt9CoH9XneVPj4VJiBdRHeqfqR3dRAXrjgeHDL73EZdeXLAFKFDpRgQNcvB91iPuTjUzc6E4VNcQSCunV4qEzPUIB1eLHpYbSCZt/ZT+cHEh88r3/0qesjFM7wr0thv9jw7U05ibXkHbqcc5zYPucZSoYkvmnX9IABIc+vVwLtqiZdT1uluW6co+GLIyHTATwUx2ty/tz3B6/9kZOMOGqqbknBZOHmg8lbI55cMltreQWPOC2HoWim3zACFWlXIgvYKFBJ99omR7F1lubQ+4fdVBiskKlFP2i04zGM1MrbhFg2rR+O+++7zPKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR13MB4834.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(39840400004)(346002)(396003)(136003)(316002)(6512007)(2906002)(36756003)(6916009)(66476007)(38100700002)(66946007)(66556008)(83380400001)(4326008)(8676002)(186003)(6666004)(107886003)(2616005)(41300700001)(5660300002)(4744005)(6506007)(52116002)(44832011)(508600001)(6486002)(8936002)(86362001)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xooxyejabHIzMHSZqC40W07ixmMFo7vuPxEUuEXj2DjTgB7Y+3AplMmPhnQi?=
 =?us-ascii?Q?vaF2MBWJzrv+YUlzRqU+zfK+tVH9wRjhtD6xyLkmM0RQeyaAa+jG3aUT0wTu?=
 =?us-ascii?Q?ZCutqfnwVj2PWobuyS+fxnwKLHIXOM/v7rFLtHP88L1S4YWcLYAg2NcY8en6?=
 =?us-ascii?Q?9q18Rhfau1LtqRO+CIeuFTuA1PnkqAF6WCzD2OFnSDDd4/BBjmIkBhk/aArl?=
 =?us-ascii?Q?CRErTct4kldK6nN4PHQfv0sZFpczB2Knq7ia8T8EnhYydDQPiduDQw7UMFGO?=
 =?us-ascii?Q?2anZdridZ9U+X2lZL4wUfN0iLIFsIpFJx3MR53txva9UIaavanp0Y7hO2dsG?=
 =?us-ascii?Q?Y6DPSCDI4tdGo/BNv0RxsImRm/bFOwBz9iRFBFRTdSa5tB9yOzZ24UWcahOv?=
 =?us-ascii?Q?2emLEQP0Sze5/KAGFplIgf2wZ0MdqImXcSDGtUAOF7PcIQ/pZFAtQXOZKONq?=
 =?us-ascii?Q?WcZtgaDC2AWakXNOTLVLm6TfcIRJMYRyBZXG+JRhJ5NHCyn+BVgCrrsD97Df?=
 =?us-ascii?Q?jZlSf6MRo+zUFzY8IG8wXZJCNv9Om7aqfQVFsYf+YeoVzviehuPunNjPOAl4?=
 =?us-ascii?Q?b/lo2tsT7qTmvBz26Notl78MGNFKMOX1SjG9591MawlUE5Ayr9hPehJFK4PX?=
 =?us-ascii?Q?CifvSA7Hk1wA6dm0Ct/+Fhn4p+zYf57SWZ7KMDR3HC+7b5pv+pndJ1AD7sP3?=
 =?us-ascii?Q?U7xPO7oL2HUJXyOsmYr/BgDxnJLW511ceQ1xbcE5Y8GWKmv1oLt6ms1dUchl?=
 =?us-ascii?Q?AEYkPQGVqJxk2Zmo1KMwCha4P+Qdfp2LhRkR+5Jn+zkVV1rIf5EVWq62rjGN?=
 =?us-ascii?Q?XLt4UQVbtf6HzMraf+VGsxPKcPxzRLRfJNsdQQB3ie+g+lksjYmI5dLTTPjq?=
 =?us-ascii?Q?aykL5gah7vYccX9lHoW6RPjpAQrdEZ6XSgQYCl32vChuiMMP5omM762qH7jE?=
 =?us-ascii?Q?WtquSI7ISi+RzleLtJGLLnVJ9+8GG9lvtAXBDwlINEVtokGhGwx6xXvk/OjY?=
 =?us-ascii?Q?lh0nCZuP4T5dyaPYCpId49RQ2QMfAnuDMfR7V2wB6zUT/27C/cK62jCGPnpQ?=
 =?us-ascii?Q?QkyPOEBAzosUDTb6rvGY6gUfiU6873eCn8YVqRFGFRRq0267zoNwVlTpNp9c?=
 =?us-ascii?Q?d3a9GsAuEr2LkNcmni8Cxn7ff3Wtt7M2O8qUNS4TptKnA5q6oAGrQFePTpe0?=
 =?us-ascii?Q?LZV+6h6nSUMLtNqPalmBPkzD5JZsTEMC2ydokSvUAcUljRmyrt/KHLWPgeQv?=
 =?us-ascii?Q?bN1zhVeemJL/tQ2A05tX8VFgfenBWqYFrm5ODJMZabF/XHsPhNtn1e1IVxUs?=
 =?us-ascii?Q?rIj0R726FB3M7hxT7F+9PAGGXwByaKiwK26qAUq3uuiNQWnh6R5e9UhkqH7R?=
 =?us-ascii?Q?PxMyhUkRUrHmHll2/DCZoFI9DdsDEeUpnBGZ52dRHX5O87Z8KBeVGaIsHhMh?=
 =?us-ascii?Q?JLxZmiNRFTE8Rnu5b3NEYsLeY+1pkCDtB6Te9cnBo1Imb3WUIoZHwfalc1bW?=
 =?us-ascii?Q?dWagJXKZ/dRZpWcBNDtfbn3C9lb3dD8c0f46/pRmgalDa3ky+lCtrws8fPaZ?=
 =?us-ascii?Q?x4RqSMwyme9w0S1O716y11NULBRTxBxKPMXLxafWSvVo5jRdOrcggHLQCJG0?=
 =?us-ascii?Q?YDQqVHR7Za1BKMfn5D+aD9pV8kg6JQ7d/B44S29a8MS3/c5cmPULQECkCR3p?=
 =?us-ascii?Q?RY2kM094vGzG/srY88Z3oXTghM2XvDI4xrdeTcYi0KSC/W+9a/I91SyLqUvj?=
 =?us-ascii?Q?jiOBVykx+J6TGFrJJNdoQuWy0ldGkixsfp9j+TpC+XoFcZljVFVgWKxVbAvb?=
X-MS-Exchange-AntiSpam-MessageData-1: UUU3AnG5Y83u0wbI0CmbXuDzoblj366yHEE=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4ae999-83e5-4e46-8646-08da4a47dd2b
X-MS-Exchange-CrossTenant-AuthSource: BY3PR13MB4834.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 18:42:54.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTYss99PebU09l+CQLGtwCs1KgikNACG1lZrczZO0fEOMzRe2E7fUYI7sJx01G7wJrO5kLnK+8KCiKplvQRxFcq6NncXchMsCMWI2mFWD/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR13MB5858
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct a typo in the description of interaction between
the TCM and MMU.

Found by inspection.

Signed-off-by: Simon Horman <simon.horman@corigine.com>
---
v2
* Removed non-author signed-off-by tag
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

