Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89B0C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 15:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbiCQP0b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 11:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbiCQP0a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 11:26:30 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2044.outbound.protection.outlook.com [40.92.52.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18E6205BCD
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 08:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7mHKZbvqQZK849z31guEePWP+BmKWTW+ZsvVBsXfuodotNoroIn7FBLGglfpnk+01e9+nWA8UvynBRA202pIU51KBBMI6voljfwKv6tcRIrOvdiu6Ewwyes/G6tRri5F/vIwr2lyigKBGfz/5ouOQt2ysjCqJkpUR57H6qecEJgjA/shdEiy9PNRDP5Akx2pa4zbXn1oBLXqDfzwEOGe3xBhnyV8iLRrDkEBfJqKpX2mFg8Z2BH1h82vSNgEUEtMCGUm56fHHOuBGwMyrJyMoAtkMY8rKSFKdOGTlVElnHrJ+QIz3xB4tdoenQ7BSjnKqPQqKYwEsLcVT4A+6SY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONWWTqygwuWFyy6Ddb9rb/zuYzUE3x4vx36LLXZz/zQ=;
 b=n2xi6Qo0bB6QUQ9DzlKlgFLEx02A03KKV+jliYgdodw7HhczF106YeiypovBRkXNyZO7Fj83J9121b2h5Jtt/hcVYdx2uIb908Ke4GHRkbMxwhrN3JUID+pf0WI5iXeSWdKaMUOU6eISf2zvjoxa4AevpZ12mEArtQUzb5P2/NlbttZ8aAhMR6FwuF5nH2JprZ9KkRnpq9y1h95tj+HeUvcaL//u0r91NqDoQm2ulXqAwUzuU01v8xQBAeCeDAUoaBbinpRfR6ShZgkISMQ7Z5P6Ti6PUGEil/g2Lwmlz3Ryq3DJ9h9KXwnYsQ5qMx2EAVxPUt0HH+WOcnBBAI+7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONWWTqygwuWFyy6Ddb9rb/zuYzUE3x4vx36LLXZz/zQ=;
 b=A8ONRUYaYcClfs5xOJ2rjZp4U8Mt4hDmnQk73FWhqKKpvhy/iqR8PgzsuMtuGle+CUTJVsJ0WLA6w//C5I64ws9oBdEgbvSUWBelQKW2+BnuP1ALGo57sRA0evQTYu83vCNWhmU4AYdvMuphgfMVKByVxqVMbWoxyamyDO00hTS6fypoMBuWhkyJkix5HRMUumNYBkLFCeVAWMsG+ih/zcwtg1stUoXdMlzj+N13mRmlmUyTIyj0tk19VFY7FM6+7ZKOrxUMxPrSf2GSPSJji6DO9e/oUazCYJmthZHwg/snBCjKHtTLDTO8V2NH5pnfqwS8XwCUuemyn+KSHhprUA==
Received: from SI2PR01MB3929.apcprd01.prod.exchangelabs.com
 (2603:1096:4:106::5) by TY2PR0101MB3151.apcprd01.prod.exchangelabs.com
 (2603:1096:404:f4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 15:25:09 +0000
Received: from SI2PR01MB3929.apcprd01.prod.exchangelabs.com
 ([fe80::d179:ecb6:188c:f9a]) by SI2PR01MB3929.apcprd01.prod.exchangelabs.com
 ([fe80::d179:ecb6:188c:f9a%3]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 15:25:09 +0000
Message-ID: <SI2PR01MB3929000E406A2DCA53A25F55F8129@SI2PR01MB3929.apcprd01.prod.exchangelabs.com>
Subject: [ PATCH ] Documentation: fixed typos
From:   kushagra765@outlook.com
To:     linux-doc@vger.kernel.org
Date:   Thu, 17 Mar 2022 20:55:04 +0530
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN:  [4Hn8MiiG/2CRzgI+mvYqc0h8it1y4I7uL9YbcyT2/aI=]
X-ClientProxiedBy: BMXPR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::18) To SI2PR01MB3929.apcprd01.prod.exchangelabs.com
 (2603:1096:4:106::5)
X-Microsoft-Original-Message-ID: <95f6027698a33753abf1aba10c6bd634275f3e3d.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7422ddbf-3bf9-4d39-13b9-08da082a5224
X-MS-TrafficTypeDiagnostic: TY2PR0101MB3151:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/XqdE8BSqEGRL5jc35dHpHsbJ/s4A102YZvdRUqzgkxUVoAcPAxDljcWX/PVRw8Izl2TZqudFLER4dzR9+E/k/nNWTbLKuEnpwzuEGAQD5ZZykwrBo+O85v3ZuuSwL3X7ErUOAipDrpmQHiLo1C8vOldkltpmu8amPxy+whTXIZGucWuQJQVKtWcOTWLws++s0Akr207d5cp0TRFZqsS7JD5HfS+vbNOHMWz99l55ddo5kdrvh6MlQiNywLRdjlHEVTRASbJn59G1eAE57ozpJACcUDhLnON1EpgdLl92wNA3tI7HJ6J01zmG7DuELomEe7eAcNsCxWA3+OjneSio2NssHHVRtYbOgLl4irG/Y8i9YDR8wGolK9VWburkwi1IlgLH2OdIsy8Zqlum2RZ7FzwV/HzDnmGS8349I0D86y7XzUBPDTTwIdBztODGrTa3MnT6biXzbXdABoog7cUXuQFuUXfmxpJN4fUcI83XTStKZUGk1zVZJvvW3ja6kp7A/aNGttLcZfAp4ijBypkYKWLFGmvRvzcshj6WBH1CX4T15RbyZsIgG9vZlqDUDpTaXV9O4MWZmnYu2BVSyIKA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RStHZEFHOUxMdkRnVmU1R1lWUjE4RVF3VmNwd1pYUmZINDU2QU1MdUJ0SWRT?=
 =?utf-8?B?aWgzZDJ2WVovKzBvWlIrK3dmbnNxWlNHc2oxQ2V2MERzai9QUGZWTEdleENz?=
 =?utf-8?B?SGR4YVg4MTZGVEFubWFnNnlqbHdxaUNTampkZ1hmL1dBRG9QR3BLWjRLUGVU?=
 =?utf-8?B?ODV1S1hWMDkzN1o5ZUdSUUF6Ni9zeEdoYmJqT0p2NnRYeEpEaUZ1VmJCdTZz?=
 =?utf-8?B?eWtTTmNwVHh3WVNqblhwaStBbmY1YlhUS3l3OE5UQ2ZuRmVEaS9icUlraVUz?=
 =?utf-8?B?WTQ0T2x1dTd0WVdrUm5WbXRRTndZa2Z1ZWpmMC90NVJTMlZ4bmJYb05oOHpv?=
 =?utf-8?B?cnFIVzh1L1I4bEhibWhqSWJDSTV5cFRacVpDWGpjVk9SVHRSUk9odlFMRUsv?=
 =?utf-8?B?QkZoeTlCR2F5aG45aGRuVkpUNlM4dXY3OXFxRmhEUTExY2ZCTmkvd2VIR205?=
 =?utf-8?B?L21LV3Q2WHkzK2xONHdhT3F5TWxSMi94K2JVdEtmcGd3b2swV0JMQTVuVUhi?=
 =?utf-8?B?K1NaYmNIVDRoMStpU0IweUE2ZnRUZWJiM0hKaEFxWG1BT1Y5TzBjbDhYbDBI?=
 =?utf-8?B?Y2RMOGc4WWRkWTBjcHluYkZta0ppM3NlRXRXRklURE92MGNWK0JZVUxGeUdF?=
 =?utf-8?B?cko2NG82eko4NGpZdlN6Y016OGd0WE5YWUZzamJydWJlQVA5cFNPVk5BYTdn?=
 =?utf-8?B?QnE1Q1dGc01OSjFHMnNCRUV3eFRoUDI0NFlFL3dockpKYkRwcmZhZ1FhTkJ6?=
 =?utf-8?B?N2JrdXhlNkIySmxTU1lBdXEwcStWVXM4ZHhGSzYvSlM2RGg2aDJwcXh6cXRv?=
 =?utf-8?B?VlJ3TnpUTnNreTFIVDY3Z29sK0dNUEhDVU16U05OVmVTZG5XNGxYRzMxeU1k?=
 =?utf-8?B?VGVJS1BTbkliSkMxa1VLc3g5MHZwN2x5R3lFRzhwM2dFSDlycmlNY2p1VnRq?=
 =?utf-8?B?dzVJaHd5VVVBRHNrZUNBZ1YxbWxDMmJ2MHRzVzRDalBUSGxzSmFFakFPNEgw?=
 =?utf-8?B?TmVzTDl6S0NPNFNPSWtIbGZOSlVqa2o1SzZqa0Y5bzE3SUZyWlJPMmJzcWtv?=
 =?utf-8?B?REtYTGFELzkyTDVqL3lJUmFvNmN1M25rVi9meGJxaEt6T1hIMXk5VVRQRm5r?=
 =?utf-8?B?TzRqYXlCWE9WcFY4ajlMQWgwUWlXZUpmNFJFSnY2SlVJQlBuQnRadEI1Rm5N?=
 =?utf-8?B?MzJWQURFTk92Smc0SFdKajgzUkxMVjh0dm5ISHNXLzdNWHV1cEczakdLL0g4?=
 =?utf-8?B?QnhaM05NZ2VqVEtIRUtwVFhQMjhOQjN4YXl1dFdxVStFL0VpWWpyaGRHMTNH?=
 =?utf-8?B?UWtaM0VOVmMrZGd5L2JFSlU0VFNjb0VlQVRQaGZ0T2FlT3JzaFd1SDVQcE5P?=
 =?utf-8?B?OWNSSEk1NGpRRmM0OUhXSVFPdjBGYng2Y3RzOGw1QVY3eHFjRDFCQjlZTWtG?=
 =?utf-8?B?VEdGclFZdXZHOGJ1MDRwU2N6NW9ydzRMUVgrYWlFdGMySEdDejJmWHZTdFAy?=
 =?utf-8?B?OTRmZVRxbWVXQWpyWFhTUEhhTS9VZkVuZnBXM3BpamdmYktqTFZHMyttUzNW?=
 =?utf-8?Q?HkiHxJk7ud/QEzh+/bPjntfeQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7422ddbf-3bf9-4d39-13b9-08da082a5224
X-MS-Exchange-CrossTenant-AuthSource: SI2PR01MB3929.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 15:25:09.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR0101MB3151
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From ade08e81a63db0faf39791f9cd7c87e5787186f5 Mon Sep 17 00:00:00 2001
From: Kushagra Verma <kushagra765@outlook.com>
Date: Thu, 17 Mar 2022 20:37:36 +0530
Subject: [PATCH] Documentation: fixed typos

   1. Documentation/admin-guide/bootconfig.rst:207: fixed a typo in the word 'concatenated`
   2. Documentation/atomic_t.txt:327: fixed a typo in the word `architecture`

Signed-off-by: Kushagra Verma <kushagra765@outlook.com>
---
 Documentation/admin-guide/bootconfig.rst | 2 +-
 Documentation/atomic_t.txt               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
index a1860fc0ca88..d4ea063aca0c 100644
--- a/Documentation/admin-guide/bootconfig.rst
+++ b/Documentation/admin-guide/bootconfig.rst
@@ -204,7 +204,7 @@ In addition to the kernel command line, the boot config can be used for
 passing the kernel parameters. All the key-value pairs under ``kernel``
 key will be passed to kernel cmdline directly. Moreover, the key-value
 pairs under ``init`` will be passed to init process via the cmdline.
-The parameters are concatinated with user-given kernel cmdline string
+The parameters are concatenated with user-given kernel cmdline string
 as the following order, so that the command line parameter can override
 bootconfig parameters (this depends on how the subsystem handles parameters
 but in general, earlier parameter will be overwritten by later one.)::
diff --git a/Documentation/atomic_t.txt b/Documentation/atomic_t.txt
index 0f1ffa03db09..d7adc6d543db 100644
--- a/Documentation/atomic_t.txt
+++ b/Documentation/atomic_t.txt
@@ -324,7 +324,7 @@ atomic operations.
 
 Specifically 'simple' cmpxchg() loops are expected to not starve one another
 indefinitely. However, this is not evident on LL/SC architectures, because
-while an LL/SC architecure 'can/should/must' provide forward progress
+while an LL/SC architecture 'can/should/must' provide forward progress
 guarantees between competing LL/SC sections, such a guarantee does not
 transfer to cmpxchg() implemented using LL/SC. Consider:
 
-- 
2.25.1


