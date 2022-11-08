Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D17C4332F
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 16:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbiKHQVY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 11:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbiKHQVX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 11:21:23 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5275A1AE
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 08:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXTAyhDRwSYCOy23Qy8q5XNuMJFiuekW2WrgW82T1UoQyhmo/dgub5XPR17vH/oD6IC/AxFTAGbmkOJYtSr2/tF5zUGMH+GhDa13xaTe5eByBiaWkCpOUq8hhLLgDlYa8LJ24l+iyj9xtiM4pdyJ10H87co3RviNhFvMQR+PvvpGho/pPm54sMtuQcpIBHVptcf5qZjTBxh4+WKFfm84VEco3EYLBYaL8fPvK25J4lYS7C1lVu/Veu5J24755fsAKqKYRuGYm98GgA250vCV37byDRXcrBZNW1smxOoRG7DSOd293bV1FWHM6vCyc65tlBeLJBXuH1horSFzfhbK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLAA8x8/c6oLyc3Nt7B3yPAUNNt7BB3m7yFEfYRTgCQ=;
 b=d7oPOkqHa/4+7Plzk12hASsB8Aixzy+YcnxSTsyeZq7iZCMhnFZmWnQdmuBHAnN8xGglFBPrDVjbaiGtRs8BhersSHNAlCmAB4cNUp+7Z0zq9RRxmCxxpu14XQSg5vsYg5ifDTM9xZNf8XwaW/P+8+4E3OF1P/iIrjmwMypuyusrkNEQKyRBC6sf1bedYnSTSTrsWyVTKHUhJsl3GHqcdMryaE0v9GGPFTrBLa6Qi/gKY+hsP4X2QcxO8kKjGkeMOEmzl6HIZkV9/gKQQmkw44VEglApO/SXceSwlx1/zXRF6j6zmsDcEokvazUKm/4KZf8z1Z3ABl4dscTIe/sq6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLAA8x8/c6oLyc3Nt7B3yPAUNNt7BB3m7yFEfYRTgCQ=;
 b=Uo5KVKjeZ+9TqAqHYbaaqNG0vz77oJRntQGmyesiHnZ9up63hyazW8jdN7sq9JzpjhxQWFYbWVaGG3uzhUuSM0S+omXxH5xisE6JI7UAa0qqkcrnqkmyh610gmwUIUg2/Lmz7BM2vnpjtd2U5jwfT66AqTgDoNIbCUqADmOD85ZVkc9Qi6DXW8Vb5OG+pjtra3N2e1ssG4+c1DRWEogGg2UylX9FFl4E4DYSAwvvLUKBIsA6aXG/kVTSSgq7Ooc/1+imof/dVXv7dDr6vAun2k09p4Vgq1PCC2m8wxkNv6ikEiscaxVWv49HEMe4HP7IVCQSk2JqwLAh7iOaF62fLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 16:21:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 16:21:19 +0000
Date:   Tue, 8 Nov 2022 12:21:17 -0400
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] scripts/kernel-doc: support EXPORT_SYMBOL_NS_GPL() with
 -export
Message-ID: <Y2qB/TkNvPInZnY4@nvidia.com>
References: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
 <Y2p01rcfyDfIqufZ@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2p01rcfyDfIqufZ@casper.infradead.org>
X-ClientProxiedBy: MN2PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:208:23d::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: c32559ae-375a-4224-135e-08dac1a544eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t4w8LrRZ4or3DmVMMXNS5/X/eOamp5rOYFfhac8WTpXVPbQavUiNbjlN4lfYOhSn+FuuPl5VdUqanc5v1nQpGFwE1RGzih/oyTCaOz/jjZ0LkY0pL8WiHNvOHo2lFrJiGgAObNEzwJKPvnqWm7c2kxfS/MI+R3j5VI3UyRVXWJwi26CIfphVZcmMwwf3uyi92diHzGDmL4PBKEYd7mB6/EMh2C2SPRFr1QOiLOASe2HFB0KZhiMievWvYaDk6SWbgQyVZrlgTjhm8VPpFRdkVISyYF2FePLPH/4uVUoiAD/n75tuhw+q+Sv5hDrxdrWJW1wrQ7/YbQ7j5+c/p8N3whuf8CzrPPt879VKJ8nfdT7+s3xL/UQLMQEWzoibTqtsS0C+aVqdJbOH2A/9ibHzw53U6sYq0fOAco92iGg3SLHuzYbuv9HMs1pemMPBR2C/I+TRe9Q1I/elBO/peqLxCcbQgzc49MTMmF6ZX/Zn4LmnTkj80h3tCICeuAvmOusOq/w3jidUBl8TYZVyIF1xZ9RpzoL4+6a4eSt2kJgxVRqi6idlvhGdudeg83BAuEeDRSoSWOHfZ/esKarJGZhcxLJ+Znys4iRCehogwRhsYvvPdGMOmpAVg3siAbWIBs1nuufGEvtMUQ+1yF4Xbk7lNplWqsS32QZ/nlnO19rhzixsilC7RszizkiAPsISilrkMU2cR6IrLRH8NhuXCIXpig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199015)(6486002)(316002)(54906003)(5660300002)(4744005)(6916009)(41300700001)(4326008)(66556008)(66476007)(36756003)(8676002)(8936002)(38100700002)(6506007)(83380400001)(478600001)(86362001)(2616005)(6512007)(26005)(186003)(66946007)(66899015)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x89qhWRN/Cjit7lLTErqyCSALuk04vkRRvDhNMnHxbLwRQRy55SmDHSzuqB0?=
 =?us-ascii?Q?oC+rudz9O+f5lCluhBFcTxzSsUTpwEPDKDLSvmjOdDBmWKe7wcomy/A7KWw/?=
 =?us-ascii?Q?SxMPF54OSxXA+2zoAmIDOLdNDKP0tvNttTEyHvNRolao7UwpfThnjsjy46qh?=
 =?us-ascii?Q?YlO5EARyGofpKmVZ9bqLGQr3i49VT3ku74fNfWO1J310N60oz1wTWDGdN5sh?=
 =?us-ascii?Q?TUtA3OhMOOtgAMYy4eIvyaf1yufsG09jNW1ZfPHHo60zwQhlE0Qr2NTWQfPF?=
 =?us-ascii?Q?uxK5Zo4yqUV0j/sVRITMZMxtbRLEZX1dhpLn1e4Ea7stFkkUx1OnRO1JBwps?=
 =?us-ascii?Q?BsUZCuUn98XxsohJcXMwlcSfxBr9RzvPTwAdTOnMFMFxkTN5oO6rUFwACHQ8?=
 =?us-ascii?Q?Yg3eyB7e1XSMDTGyrgF0VQT08PNSMgSIpWGBu50XXd35zAsgslCSO7pGASQ6?=
 =?us-ascii?Q?qIO+nTxEW/TFpv20+ZOvuzlpdKrqH5wLdk0B53Tk2chetnv1WTzXZaH4pRMV?=
 =?us-ascii?Q?HhCYcWdp8F6CH4+rw8ch2Ef766dVEsERR/iqeJIiFdZnZ7dtNX3X8iyh2uTI?=
 =?us-ascii?Q?hToJTkwdNEQ7LY2Vj8U19YSwdScDG19bw9AlMHGVA+i15IwCdNBi7QzKdwWO?=
 =?us-ascii?Q?AUtUQeXgilAr9lVfUH4RYYOlPuI+fPbLfwKpekQF3ntkCgH1tEeSdIPJ/8Rq?=
 =?us-ascii?Q?8sZkxPtrK3/y2sEpDuD5ZEH8LoOnWNZbRHlZ2gYKlfMjh6E9k4oHShl9dcYt?=
 =?us-ascii?Q?gvmy7Jd7UjE2k4P6SSfXK+KzXRQoJDcBhvehBmDppA/c/aNTE5QiH+TKHN40?=
 =?us-ascii?Q?E5Icj5kzoo06GKNijc3iA6Qu3lkXVaHffV+dMEDIXRe+Sn1w/Z0CXmc08UGo?=
 =?us-ascii?Q?3MQdxjtwl/wQ2DS/INxU0JlpnGoQ1hjRuB2E4Fi9fYHOsBuMHjNuTRmLIZu3?=
 =?us-ascii?Q?91Bl3uL3ORv84v4smfQAabO9gc/gmE8MuT3qXQ07hg+qULPEzXIxdAlHXi0+?=
 =?us-ascii?Q?p6v36sE5IVY2X8IK2n+Zs3Y5snjUX2mLkSOhe2KLIz3bnjv661tQm/DaZiVX?=
 =?us-ascii?Q?ns32BKYrt9TRBUPBxJ5WTFNOSBV+vj5cLOkNmvgxnTgDM6ZQ4Qj4yBx3/BkK?=
 =?us-ascii?Q?d/IH2RgU42cq2iHWO74mEa1Ldk3Z43qmmOHRxEFBjyASDcpakEwoSrnCO/eU?=
 =?us-ascii?Q?SufXFlwei9xBBfwaa3f8UIa6Py0qJ9raAjSqT9cELQwwZpXpki0YneoK8R3E?=
 =?us-ascii?Q?f7BZ01chJfN2RAtTW9hhuZz43hh4c+sHO1804wjC6PMMjjZd2lXN5Z1qajWX?=
 =?us-ascii?Q?7riNynr/THMWLXmPeemOnDgkS8+GHvWqrAL9lQ/BzP2FXB4rwuSON8ubID73?=
 =?us-ascii?Q?znd43RaRiASneSct7GUbBVed8449bGeJN7tnuC+f3ZHXXCGSF18CYqF/c1Pb?=
 =?us-ascii?Q?3oppJjDc5sNm84xWktfgbi2rPfRhqCyPFaIom7IDEDs05+Q5Zwr970I7reE8?=
 =?us-ascii?Q?FAI7MiWEuIJkK7aw9ad3NHhxTyqC6ooOKb/Z89ETqoF6qhCy8MxQva3opUuh?=
 =?us-ascii?Q?WnyMfxj/WVEzX6pnmb8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32559ae-375a-4224-135e-08dac1a544eb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:21:19.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1mEAO3Qsbk+pADq/VOFTE48aW8TPsSIeFtTxGt4iTD+xXGedX0RQRGTpIw8CEjO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 08, 2022 at 03:25:10PM +0000, Matthew Wilcox wrote:
> On Tue, Nov 08, 2022 at 11:02:35AM -0400, Jason Gunthorpe wrote:
> > (I don't know perl at all so happy to replace this with something more elegant)
> >  my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> > +my $export_symbol_ns = '^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*\w+\)\s*;';
> 
> How about:
> 
> -my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> +my $export_symbol = '^\s*EXPORT_SYMBOL(_NS)?(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> 
> Not them i'm a perlite either, but this is just a regexp.

I started like that, but the target text looks like this:

EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);

And the (\w+) capture should only pick "iommufd_access_destroy", so
the ideal regex does the ",\s*\w+)" part only if _NS was matched
earlier.

Jason
