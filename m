Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDE7C43334
	for <linux-doc@archiver.kernel.org>; Mon,  6 Jun 2022 17:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiFFRFz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Jun 2022 13:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiFFRFs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Jun 2022 13:05:48 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBE21EA856
        for <linux-doc@vger.kernel.org>; Mon,  6 Jun 2022 09:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpdNTTiNY6SdoPyOlXo4Q6yFODjhF4Al+jPRyYi2BnXXMr1QKN06nQORZ9iKyj7NP06MxGQo+WUTTCXJeVN1YjPK1/bKZ1jGoBKUEgb5Ex6M+9HKYOHqYpJruSkhCYDoCqYBB0n0RxPQM+1ZjRAtXLOO1BmcGKcpfSGhrBpp7odGnq3XcijCDkYWOXXnTfGoIsrCQ9b6YDt8L7nnq7YzFWBgY3qJePIxfyUWoiN8iYJ4TXr2iHsYKIXmsG2c5ToaOIM7zBki7KHmalUbkwtlmj8cYAiwjuh6EzyE7+wkrWUvAzL4t6ZfuykH4AVE6XF3JfX0oV+G8a2baVNuityHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ptB7Q5qGwccINqjQ4tYEX88o5KG4e8PiSTk21/VmZU=;
 b=l9DC1tFXSTjv6DClaYHWByfglgM4K9hq66w+k8rTlvpkm1NfAZcnZYAisGgKFKAMYwcjD5W4UMjinP+wbKlIsXNRDSFfOCAavagU6TWaO5nbqnqp2tqXmJ6O3/ycYpVcQo48lwaPoCpG7THxA9RnmyUvSHMi/Lb1ZuEnpOeWPp+Hty8xXHfyaXtxJCFAt+Gt2/hDkpQKGptDXymQKxRRBV/uIeQn4X+axTQSczVoa8yMxwsNU1tQbvmUxb3n8JK1quI9meW4mswtszx12QqwjWl7H5D4PEQCT63fUDD1UizfTrTZqQ/SP+589SZuxJtIWpoxKgnGZy0FffhipY13CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ptB7Q5qGwccINqjQ4tYEX88o5KG4e8PiSTk21/VmZU=;
 b=D8tunqVUj6li3WAfrBD/zL4JG+6pihYr8NmUbXT7IkHNj3jlyeBJtT6kCGsKX4tktdmao2OT/fxHgeqvEbk4j55G9m1Hb8I2lvwGj+vm6R70TsO58XktrRvhwfMIU5OAP2r6JcAfEC/u3Pvd7DmTgLoVnaLxqXe1feC5wqJD233roZpw6PkxN9UYlKRG00w1aU32SYQ6X4LcWJyUpej3CY3gcLse2er3cvM4vskOoTI81v88oXDbAzl78h/SeMLysk+oHkRxUWqJtac/muO6x/cqoG8I/z0jjdOVOC9oAQCuRk7vzP0pZAY5GEj5glFOE6wl4wPjRnV1p51XMt8jnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by BN6PR12MB1362.namprd12.prod.outlook.com (2603:10b6:404:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 16:55:26 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::6c51:327:2e1f:a04c]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::6c51:327:2e1f:a04c%9]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 16:55:26 +0000
Message-ID: <985966be-b7a1-c208-0775-d1cb4ff072cd@nvidia.com>
Date:   Mon, 6 Jun 2022 09:55:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] docs: Move the HTE documentation to driver-api/
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     linux-doc@vger.kernel.org
References: <87a6apj1do.fsf@meer.lwn.net>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <87a6apj1do.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60f9c29f-15b9-4f0c-da7e-08da47dd5a6c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1362:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB136261EF018231DDCDBA7F40AEA29@BN6PR12MB1362.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 517bhxxAUHrAo5tHxYHzjYGBJpsT4sNHFqX3NF1T+A4X6U1gv8iAP4U3NGTPnK4g6w5iXBB0mOXPauGJlp4Y92Lr19yFxmbcGBuwXPDElVLj92LD156Guf400ogdvew7VQ8t1TEhbM+joGSCI0BRnkim0wQUqyvyXDHImKXqqWECtgqQGTWZ88S6FKPQdssL75GYVFeDnR4zg81deQ+CrmKGxW0uFha0IkM9CVBHwFfmR40JtaYR54ocoWgrX7Iv5jIDpAh0BGrXEftDnDKZiauFSjzfs6g2Q5AgLl1ev3xsW8CUWQfBfuQJekFr4yvjuszO9ZjRunrxUJlE3MXlTqVYZUoh3cRDNMf7Zn+ajQXqs1zwWIA+NiL+IOQF0EQoAf95YQXwsftOhpwdlHC2WIUMLsUG3/gm20P6055dgO2FFdBK65rqxemhy9HP4k3mzbYLoZzgrJlsmtgMK4jKj03rdNgMpKWyHELoM3gC02EBdWXrOdB/f1NYH6hBcK4YULvE2y0nvWMn1X/Wxv9Vtxm7s8CpOYCnafVYv5EXG5jpAb0A+NjBBHHoQdDV+GIXrK56wGkTTQkn3ttAHOy5Shh+2RT6kC6qRlzGcz0tECBy1Y3cnwzNdDj3nuHyZg6y6rjXm6uBN5PddDxbTXRVjhoZmJ+vjmwB+KMf8+9yo7dpitDnYhvSzbKOsYAbw/t0okM19N8Y5CtpoFYv+Fmi20sMf6NOaDy7YY9L8U1ywtE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4116.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(2906002)(31686004)(36756003)(508600001)(38100700002)(110136005)(6636002)(4326008)(53546011)(5660300002)(316002)(2616005)(26005)(8676002)(6506007)(6666004)(8936002)(6512007)(66476007)(66946007)(66556008)(86362001)(31696002)(186003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUR4aWF2TmNxQVh3VlYwa2lSZnZSaVNlRFFIaUl6Y0JlRElMODNEeCtKWjZE?=
 =?utf-8?B?QUZiRjVleWZHWXRBaVJIdkFFK2dmR0Q0ZGZZa25ZYVpSZk9UeW5HVENZOUhY?=
 =?utf-8?B?VUxKWFlvYy9CaVB2QWlXbDBEKzdnRUZzNkZ0VE1LS1VjWTU4Y3pkTHA5emtt?=
 =?utf-8?B?b3N0Nkd2STF2aDhzc2NaeTBIUGFpNVh5V0hSRlA0eTBKT1NXSG81U1NsQldz?=
 =?utf-8?B?SURONlFTUG5UR0o3aHYrRnFPck5MNjBla20zUWxaOVcwdml4eU5PL2x6RWRF?=
 =?utf-8?B?NUJTb1RXMk5QS0RVbTJ5MEtoRGFrcWFLQnp2MW8zQVZJWC9SRDlxWklQcmlQ?=
 =?utf-8?B?MndBZzhqa01vK1hYMVovWE1HZm1SWWlGTzNwYks1cllZeUNNWXhCZmdyL0Jq?=
 =?utf-8?B?amFucXNFR2hvMUZiM1dHYjlyNlVkMEpzOU9kM1UycXozT1JmRWF2VzV0Mkdr?=
 =?utf-8?B?UGdhRXdqUWNlRE4zMkZSV2RnREVRN0ZBc0FVSUE3dzRSdGZJL3pwV2NiNUNG?=
 =?utf-8?B?alNMWDFUYVhGa0FVcDBFUi8vYjRWVXQzWFl0bjZsM0xhQzZmMnVsRkJnR2RO?=
 =?utf-8?B?R3VKRCsxN1ZmNEdnbWtDdnRZTHRzUTlldy9MRkoycGMvT3BjNXh1U0VsZlhz?=
 =?utf-8?B?Yk4vbm5KZHBhWGVxckQ2bldaWmdwbURVeDQ5VGRjY3dzcjlaREc4aHVTTEg1?=
 =?utf-8?B?RXpMeFplT0FqUEdqaW55ZUVSMC84OEhGbkF5NkNGTUsraUV2SjNkV2hUMkNL?=
 =?utf-8?B?SHNCQU1GL3B4MDRXczRFUTBpY3FSZGtEU3gzVVFKaDZaTmhBVkFjendpT2dz?=
 =?utf-8?B?NmdPVDRHclFCMDUrSTNGMmRTNnVDY0w1cEFLVzh5S1ptcmJpODFhMERPa1ZC?=
 =?utf-8?B?MlorcVpnNGZrcHNIWG9CQmJ6a1NUdUtQNjZTMFI2RnJoS2ZGSFpvT3Jmb2F3?=
 =?utf-8?B?ZHFqN1RkOVJlWXlqNGtpUCtEUVNUdlhMZzEwa1djZHBKS00wcHBCWVZaWlFU?=
 =?utf-8?B?UmVaeDBqV0RuQXBTZWJGTGhhZ3pweHcvQnQvZEdHQlljSnY0NnUwcW5DRFpT?=
 =?utf-8?B?VGt4YmRLK1RCTjJoQkR3WElCWUVKYm81M3psMTVFNWszSC9ZY2xmRE9jM09S?=
 =?utf-8?B?VC8zdVp0V1hBTXRLa2p4TjF4NzFlc3haam42bFp5bmRrSGVBY2tiWWNvZXph?=
 =?utf-8?B?NW9WL3FoWlQ4dEN0SE1ySDVtVHdiYlBZdzZyOWlyZjdJUDFYcFBWWlBtN21I?=
 =?utf-8?B?Q0FUa2dWd09OaXUyYXUyeHZhVGJzSnpTYi9sSGFxYU9VR1RyRWVGZmQvTjQv?=
 =?utf-8?B?TUkwMmYrMlVjRmhteitmdjh0a2dodDZyVEhmaXNlWVVmSCtFM1l2RVJTY0NW?=
 =?utf-8?B?Uk9aU0txM3hLNHhMYVBNeW1TS0p2MlRMQVZOTzdMblJWVU1uY1BtMUc3V3k4?=
 =?utf-8?B?d2JseGJKSm5GbnQ2U0hZRDZQK2FYTVpHNmhBbEFmYm14T3NPejd6aVE5MGxP?=
 =?utf-8?B?blZpQjRaQis3QWkyRDRicU52ZzhQeEZ5cFNEcVV2U1p3eEsvNno4cWMyeXJj?=
 =?utf-8?B?Ny9iQmk4MjdIektUdVd3ZUYxSmgvVGJOMkExS2MrV2Y3L3pUSWRwWVpBdTRY?=
 =?utf-8?B?V2JSMURURGkrUmVhS0ZwYnhJTXltZU5WdXk1MC9Dang3WGk2UGZkalQwZ0dn?=
 =?utf-8?B?dlpzWVZEMkllZGdNdUVidm4ycEhZZDhmTGcrQnZxeDNmL3VMb3NQSzAxbXhK?=
 =?utf-8?B?WkhMUUdzNDhNRkxLY3RGY09XZFVqQk5HSktiWW90bmROQ1NhMHR3b1kwKzZ5?=
 =?utf-8?B?dFcvWnU2aXh0ZGowbEIrTVpEQzBxWnhDa2FhSzdpd3MwTWNhS0ozZkgxZUtL?=
 =?utf-8?B?VlJwZEwrSDJHTEl0RDVBdzVqL3ZWQW5rZVNqeUZlZGgwcDF3bmlRdVNtTmdM?=
 =?utf-8?B?bTVib1ExV21hMWhTMUZPdlJLbFMvYU00Mzg0eVgyemErN2xMV0tySDFXR1No?=
 =?utf-8?B?V2wvRktKUXpyUGZ2NGlkaG5GR0kzM2puNHRXMFFVSG5qSWtpMHdWSFBaNDlv?=
 =?utf-8?B?U2NIR1FxeTZMK3lmTlJPWmg0aEJiREtXYmVEOXdCYy9MQWJJWXd1bjRtQmJo?=
 =?utf-8?B?UEJ6SlRPTHZMY1QzZVo2aWtGcERCcVR5dDZoNTRVTVpjM0lTbzluN09lZmMw?=
 =?utf-8?B?WE5ucCtBTWZwc2lHTG1oTk8yR2xnK1N4Q3lKRzc2Rjhtc3hZRk5ldnRxMVgx?=
 =?utf-8?B?Nzh3dTlERzh3WW1QM2Erd2F4eFhaSjVoV01QM0d4ckE4UVpIb3F3ZVBvNnph?=
 =?utf-8?B?SzFldTFKeHBTS0RVOGU1MUd4Rldtaldsd09yRXVVQ0lHUVlmdDNFQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f9c29f-15b9-4f0c-da7e-08da47dd5a6c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 16:55:25.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBdOc0vdONhtxspex8OYrel6xyJh4mZi6VeBwUEfJAmFHIQ8AfckfEu3IwdX4McqYOz3xHn6Zm+djvXDcNwI4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1362
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Acked-by: Dipen Patel <dipenp@nvidia.com>

On 6/6/22 7:46 AM, Jonathan Corbet wrote:
> The hardware timestamp engine documentation is driver API material, and
> really belongs in the driver-API book; move it there.
>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/{ => driver-api}/hte/hte.rst          | 0
>  Documentation/{ => driver-api}/hte/index.rst        | 0
>  Documentation/{ => driver-api}/hte/tegra194-hte.rst | 0
>  Documentation/driver-api/index.rst                  | 1 +
>  Documentation/index.rst                             | 1 -
>  MAINTAINERS                                         | 2 +-
>  6 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/{ => driver-api}/hte/hte.rst (100%)
>  rename Documentation/{ => driver-api}/hte/index.rst (100%)
>  rename Documentation/{ => driver-api}/hte/tegra194-hte.rst (100%)
>
> diff --git a/Documentation/hte/hte.rst b/Documentation/driver-api/hte/hte.rst
> similarity index 100%
> rename from Documentation/hte/hte.rst
> rename to Documentation/driver-api/hte/hte.rst
> diff --git a/Documentation/hte/index.rst b/Documentation/driver-api/hte/index.rst
> similarity index 100%
> rename from Documentation/hte/index.rst
> rename to Documentation/driver-api/hte/index.rst
> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/driver-api/hte/tegra194-hte.rst
> similarity index 100%
> rename from Documentation/hte/tegra194-hte.rst
> rename to Documentation/driver-api/hte/tegra194-hte.rst
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index d76a60d95b58..a6d525cd9fc4 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -108,6 +108,7 @@ available subsections can be seen below.
>     xilinx/index
>     xillybus
>     zorro
> +   hte/index
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 8f9be0e658b4..67036a05b771 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -137,7 +137,6 @@ needed).
>     scheduler/index
>     mhi/index
>     peci/index
> -   hte/index
>  
>  Architecture-agnostic documentation
>  -----------------------------------
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a6d3bd9d2a8d..e5b7b78d62d3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9081,7 +9081,7 @@ HTE SUBSYSTEM
>  M:	Dipen Patel <dipenp@nvidia.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/timestamp/
> -F:	Documentation/hte/
> +F:	Documentation/driver-api/hte/
>  F:	drivers/hte/
>  F:	include/linux/hte.h
>  
