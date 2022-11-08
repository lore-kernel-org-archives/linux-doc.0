Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA02EC4332F
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 15:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbiKHPCk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 10:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbiKHPCj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 10:02:39 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF8D54B37
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 07:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU9HRAT4x7B1IDj5NTnqqMHzPhRDiFUQNXHxGHHTtVwH2PJItcZgKz8GN9ic3E0HdxfUz9Pme4e9iozMh8B22wJtY2ZPr3Vb/aQcv8fh90atlxMm2iDa5VCFx0Peab/pIWm9qFMng/Kms6TUgm6ncYVBxBixEg6RpwAF8V0vhKWYMtl0/OJau0Q1H+NymuqEtHNHwb+ojJF7iXfaKNAG9AHa2fOkNPpmijp90IPV59TaZKHEURw8L5i92Za3l6h/dWardGVM4nkluShLoxWndwb/59jGuB+VqhsuyQWqS0Z7ZOs3K+5OFDR4yzXLA/tvc7eRhQacEtHUpa7rjHgjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wagnd2Ro6jZbPBc6NejEEPmIB7VMTVgFyM4sOw6ujPM=;
 b=GLAaSsHN3s8JPTj0PHjeh97dy7G4V2UCjvNtioN3JAZEqaKk4OAs16nus/4NZkDuCcVnacsh1VvJ9xuRMWzrfoDurvUxOzk4l9ho3ecNurfYmctXq9ZX/z6B22urqd0A7avlHmDgDmrO3uU7QkX1KHhPDALNiu/26IcV+f+2udTlDVV3eac/aQRyDuPvpZMRi6a2Vjv3uPgKcs2mCiwuCzXPttUzXiYtPYqUl6xOnZgqKfvFrxyfPhwBi45whePo5GEzZmK7Pi6qPxSFNa8Bqc94CkCgfcEap518pRFQNHotzM030BfOSTJsHTMUQTUxTERx/Eb7WOA+CHb9gOx9/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wagnd2Ro6jZbPBc6NejEEPmIB7VMTVgFyM4sOw6ujPM=;
 b=uHADwMQIhlm1TGRPLXz7LdfSZexldOVpVXqIf8ffH6K6d5yzJUTWNRpdWRnAEhZpT15RA9rSFVIpe7GjFLdvVtXUFH4S4XhC+e5qzlV7frzvN2/NrqKJ2+WzEZ+BMolAalaMoGv4l09FpoYRO9RocjhxRskFsY1SSJeLiKfjK/2UZMsdGTYZ807NNqKPnzG2Db05vJx1A6/pXGCKKsqrhDtpB/rPPeNNGOSAwN0bwMOaw+uGi6W4D2J+vpTFshzXKt38JVG5e6SpS18X7+0BL4syHrbzcFdWb+2iDK1OzfY2Uu3CCUNpvzsWGPWibi2Nt4PDT51UJqUjaD4ha/+IvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB6877.namprd12.prod.outlook.com (2603:10b6:a03:47f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 15:02:36 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 15:02:36 +0000
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] scripts/kernel-doc: support EXPORT_SYMBOL_NS_GPL() with -export
Date:   Tue,  8 Nov 2022 11:02:35 -0400
Message-Id: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:208:23a::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfc4cbb-5c59-44e8-45d9-08dac19a4599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYUSc8i15E/ht3QeOQcEheO+yX9NYyvdKioXoigU91VeHrV4tCNh1F42gyQItSEAMFHdxGsXcCyZ4n58sdcH7jxTY8TPqbJUmfx8235M5rUzQ+ZWzN2ndHKdp5h+/fxbXc3TaOyqOJWcYQk35ec1W6ZyaTbNV/xC2+MrK2VEa8A99OZvMQnMf35dE7BZ1ub3BOy7MeOXG6H7lf/RFd3wXGrmm3hvXAwIRIB8PAHvxlYD8mWOjl/RbUUmlu4id8k0gLqdf0xgmWWDCy7vN1M8MulY8AL6V/KqX73u2no8AMJHOe6PE6ZrDYJU0LP3Zd6eRnnHyZV/aeRwz8lYWHactg0zhx2FFzWcQBMrdQVs1bSUyAtAZuouZE5zuYrkAcxRihN+ozz2KYXvCn/dRQ8oQb21jiCzBdR0BOJu/W+792SwXYYWMm9IbQQlQ4jc6xCN2V5U/GtGIiwHuYxXiabtuxPsnh7PtQnAkKLisKP4NdEvYKbbL1A6J6tiLQ4lPZj5HoSCp6a+jyB2trDLWGQaVala2zgZ5DzN7IzfJNflidEU4wKe2gbuOySWXj+Kf1OWwAj89ae4HM21ivQrpzRXYbxYHlcDFoIlbXM3DVaiv/yHHlaO56Yz2ms8BwSRKe0bZW3OKyfoIcI4b8AiIwub5mDW6JzH13m8ROWKzJ7G6v4JSiG2DXyofZZ+7cgkkVSHJ/3SadOfrOkXHzheLXREa8Vme2z9vsFRPaBcBxYjLYzkszcjKB94ZPgBF5Kvhp/3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(186003)(86362001)(38100700002)(83380400001)(110136005)(2906002)(5660300002)(8936002)(41300700001)(6486002)(478600001)(8676002)(6512007)(6506007)(26005)(2616005)(66556008)(66946007)(316002)(66476007)(36756003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QIHrvOxAUApa9Hszlt0DNAYjgqXIVGS7nRIyhvsWPKnT6tIC1WT+iIGBl4uj?=
 =?us-ascii?Q?TwKYioDawl4MIyhEIgHBKsfSY0lRD6/drUxou0c5rQtGZ/XdKXcsT9LFJBFn?=
 =?us-ascii?Q?LKl1KxMOil0m/YytqUKghFxGoMemWHH6WYHwmTA6TBqZS1UsqgtbkDmYJoba?=
 =?us-ascii?Q?stD+whlxsguGAzZrZ2OSvAWKCrF8A/wq6WZTKJkRgoFyY5k0ZtL5Fh9bbOm/?=
 =?us-ascii?Q?Q3VrMyZ19f4PQ7OrUWNSAiKDCupQj2XTMjvNgcoqkJ+ID7tUXB1yTB/W1Vxe?=
 =?us-ascii?Q?uyyR7hh3IvufSO9cQyc1bsATWoHoBIvq9Eeh6pLVRmY0lRt3jQW1or04IMpY?=
 =?us-ascii?Q?4NBTkSYKhqpt06BIIHb1ohSprnMSKvoJz/iu5DKFZT+sWQ8MC+TZB6ykfMkc?=
 =?us-ascii?Q?59BaN+1hmaghHWgPm4/GkVNDIDayRVgW1/VFW/NuiXoDZ1aZm9y1/phQPIhB?=
 =?us-ascii?Q?GuwrPDIejYVkKbP1SFlMNesdXy0DndcFzWt+H5iSYNJbSVT+IWTjzenxRYPt?=
 =?us-ascii?Q?UzJmmsyrbKYwHfbwixxxJOCW5JX/DB2EM0fyr/zAwcw2wNEtrsJCmGL90KC0?=
 =?us-ascii?Q?A4Haha5X0FDGVqN/hYBKgE7kWhbjEFMhOzczKh/1lvitraTbfhfeQ9PUJJL+?=
 =?us-ascii?Q?tYNuzJYY/Bnt6BFKKBySx/UD4ActynjqjSPc6HAj11iS9kRE7L3Kt4VEW3WT?=
 =?us-ascii?Q?8GAi0mmh/nvhVq3U2kR2YvEe5ARvrd9sw7EKBep5yBgcVt35cjFajG3QbhFD?=
 =?us-ascii?Q?Sa+2Ofs6IE2FOWL6o8qjKv2oQiVd+4BaRHRKhqf0Bz78rS/1Tvc3UbhwkV/W?=
 =?us-ascii?Q?6wQPvKx56M4mXv+iy0NS9KGotyq1hB+Q0UsMP9O78HA+dk2bIVrJvUr4tlCj?=
 =?us-ascii?Q?wlihnW+4a7h7uOEg3zdszEseYivUAkk1jjab0nfNLGIyRfo/UZSpWUyfMx/U?=
 =?us-ascii?Q?veTV2jmiu+jqtQxuwQHpEjoFtX4VADRXenELlXh3G9gceRve5ySyVvHdHwO9?=
 =?us-ascii?Q?Gr+HAhOJ8TjwpFXXx1kJvCc4RXvfq1U6yQaP1Q0p6F6Drwp5M5mgoBA6ZvuY?=
 =?us-ascii?Q?V93y/bbzrkEcl1Nrhjl5BQX1bbMffgwREwf0qNcQXeLnOBgrTjLX5oArvRfh?=
 =?us-ascii?Q?8mNJNPGbwwds2xGvFGQW8d4zNnDt69vrtk0Ep04J4S+nGLUA6mbAGcdeDkMB?=
 =?us-ascii?Q?yTf2Ug8+fG6gUHLXcXS9pueszKAVT4TLzjCTVL7Gt6zleKvrCZRhLlq3lnDf?=
 =?us-ascii?Q?+MZQ7ThSejdibcwfNME/DwiNG/mvNfn4jDAusWjsf9jw4/mPlSZKfDpsLJiI?=
 =?us-ascii?Q?5CTXMnT5O3zE5Mj8SY7XB5rtyjw0Y/i4M8HRe1wvhTwUw8wzWxgO+cdfo+3Y?=
 =?us-ascii?Q?liUWLYYNpQrWJv4hCi0Yi3Fk1dUfKjFHW4OL5do55U0tFRMojMKvsZJ998BQ?=
 =?us-ascii?Q?FqL3Yh74Az2WAACtQ2C5vv1lclpOg7w06GikTDPDjLzefYDAbcI8L8tlXRu+?=
 =?us-ascii?Q?/y1XQaX3kjRZ6xkxo32UwpSxQ8KpfOy41LUZIuuTlDNB/+PtaCLjLFWoSljv?=
 =?us-ascii?Q?On5gIFoYp3nkpJ1RSug=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfc4cbb-5c59-44e8-45d9-08dac19a4599
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 15:02:36.5018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGqltbcRuUMFQCM7zRM+xuC2TAjy6ttH5bpmvsSxbAIzuQUaykHTOXGJ6ZVayvju
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6877
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Parse EXPORT_SYMBOL_NS_GPL() in addition to EXPORT_SYMBOL_GPL() for use
with the -export flag.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 scripts/kernel-doc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

The new iommufd kdocs need this because they are using:

.. kernel-doc:: drivers/iommu/iommufd/device.c
   :export:

And also symbol namespaces for those functions.

I'd like to send it through the iommufd tree with an ack, thanks

(I don't know perl at all so happy to replace this with something more elegant)

Thanks,
Jason

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index aea04365bc69d3..48e3feca31701a 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -256,6 +256,7 @@ my $doc_inline_sect = '\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)';
 my $doc_inline_end = '^\s*\*/\s*$';
 my $doc_inline_oneline = '^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$';
 my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
+my $export_symbol_ns = '^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*\w+\)\s*;';
 my $function_pointer = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};
 my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;
 
@@ -1948,6 +1949,10 @@ sub process_export_file($) {
 	    next if (defined($nosymbol_table{$2}));
 	    $function_table{$2} = 1;
 	}
+	if (/$export_symbol_ns/) {
+	    next if (defined($nosymbol_table{$2}));
+	    $function_table{$2} = 1;
+	}
     }
 
     close(IN);
@@ -2419,12 +2424,12 @@ found on PATH.
 =item -export
 
 Only output documentation for the symbols that have been exported using
-EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() in any input FILE or -export-file FILE.
+EXPORT_SYMBOL() and related macros in any input FILE or -export-file FILE.
 
 =item -internal
 
 Only output documentation for the symbols that have NOT been exported using
-EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() in any input FILE or -export-file FILE.
+EXPORT_SYMBOL() and related macros in any input FILE or -export-file FILE.
 
 =item -function NAME
 
@@ -2451,8 +2456,7 @@ Do not output DOC: sections.
 
 =item -export-file FILE
 
-Specify an additional FILE in which to look for EXPORT_SYMBOL() and
-EXPORT_SYMBOL_GPL().
+Specify an additional FILE in which to look for EXPORT_SYMBOL information.
 
 To be used with -export or -internal.
 

base-commit: a21945d88e38b5772958161b3a5ee4e2adaa1f61
-- 
2.38.1

