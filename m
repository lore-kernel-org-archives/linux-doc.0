Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABAC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 11 Nov 2022 17:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbiKKRyt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Nov 2022 12:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbiKKRys (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Nov 2022 12:54:48 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BC9DE90
        for <linux-doc@vger.kernel.org>; Fri, 11 Nov 2022 09:54:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8Wo8wga824CHXaSd98x7+9i3UAok5p3DxLKCCOy9DSQviaURZBAfD4iKJwJZVM4pAURpteeDxV6Ycf76p8vg2WdYSjV3qH/tL+HPMs+IHfI+DK+NrwGU5QqLHTSWdoz9BwKcnp+eR+yJOz37biZIQnNTxq5+7nAtGF9vtCLKkLOyt2Dlf0wHDhKtQu4jkc6c6xY+6UxcdKhgZ4dzyDWF9awzurLTkL5B64Fm6zyTQftpQjd5zRYUi9o3tSix3pgXZ4L4RzN0pNX/r2IDtBhXuCVm8XVEaf4m6nZb57yutcOWuO9SK7YJOfcotokKpYBwhm3trZT3LkT/ozQY6t81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwHUDi+cw48T5DFoke+6GjTwFJuCr198EXiw5GuZov0=;
 b=DPwXXG/0vd44OBmVBHyEVgZTBKE6cQTBVagzEaE6exfaaSrCh6HcOt8SeYEHpGB+aAqksVDYroUaXVr4FwGzUks5Q39fvi96lsZo4ofzxDV6fSVtpztKzQPEIPtQmK772woMoiUq9yBeY+PbbeoTJG6oBHDHOJYXJ4KcTOAcZSPnJYWvNyYQzbItYw89SB1f0GGVPV0FOOrL1p4BSyN6F08DCwtq0sdxE6pAmlaprLCjgaEswZNexIyfYTMk6kyESJjeNC9A2Tz9BGIo7WtHWSYuHZPFVnNEDbj92vYZ4kpqjLx7OchnFQQB4typ3+n83qIZVwEeMyl7tcp9rbXF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwHUDi+cw48T5DFoke+6GjTwFJuCr198EXiw5GuZov0=;
 b=PXmK2EVTz0h8q24U0Yx/Q7BEydXOx7Pa0WVf/E1irBIq98iANXE+Ue5SHmtOv+OsIRER37jw6zKEyI62i4NPtUClAlNaz5YDmYvRrO3x7dkPvn+lqZVehs2p3HyaAWwuHmW7HzXbOWFlGyOzn6lGUQkHh1Jj/VQUAByBuWrXM68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 17:54:46 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::9eca:d454:d407:7ba2]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::9eca:d454:d407:7ba2%3]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 17:54:46 +0000
Message-ID: <a7d1996d-9a77-ff51-41c8-2fe90f090642@amd.com>
Date:   Fri, 11 Nov 2022 11:54:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     linux-doc@vger.kernel.org
From:   Carlos Bilbao <carlos.bilbao@amd.com>
Subject: [RFC] docs/sp_SP: Add memory-barriers.txt Spanish translation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:610:e5::6) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c835e0b-2d76-43c7-3057-08dac40dd1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ALEjk1zmgNSwhHxM5bs8GsE11WlOfZ51//WSEVINBOOgJLJj7ajjwTWIaIvQr0d8AG/12AvWxri4ccN+og3/cDOvfxl/xzfQ6RWsV0yRDo0HKBTKm4H2IwmBrvAn0eum7a5KSmzqGWThTxSnA5aQUHi7i/qotZTll/aktREsmhbBGE1FQA2J+JjW2TB0ie71JYYlYapM1MkUeJRiBeYT9KV+zjWylhVMYFLHbeBo8US/21JiuFvYOV9h0EXShZWYKCB+Q4tgRdbPrw3q0BiJKfnAW0fKqjl3piiu7QY69D50RPyrftpqhH6VA35dC5e66IUthKxr2SEzAjEfZeixhV7ToRAMigyD1g4cjZMJiIPfQSh0HLjk+r6u1LO1cXo+eT1ase55VkMjMqZ5KcDxPNDbhn56FVCug74xtckusMoYY9GBcTy1NUoYQtzpo39161rxRm5jSSg2L3+c+7jPzFW1EZffTALzt2EtaSJOC47YjwZWBUkF3MvYnXKGkCgy0MdKQIbrOLoyt904ssFJ8hFbVqRBkdIKHp/iqsMAjygxX7P49K/0IpYOcd74R6QI57Y0FIhASeMtYlqfQnNFLAFthyy1yFvRZMFUDkIPAiy0oIRPMHJysHe77glX7Kjh8kaOl1kNglY/+P8VMhM0EZ7VEoyc3KXLG2/trBgTapKk69tWuWGEsaunXLATLgQIo4qkHdoUff2KHkVFaYheMKIRlH9m479QvJDH+vwtsRdAncUxSht9W4b+Crc3QmW9TPEvkyHG1MEwy07JrHSSqXzvxtq6OqMvZtjnjF8Sa6FuMURc73aiuntxxO10uLSF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199015)(36756003)(558084003)(31696002)(31686004)(86362001)(2906002)(44832011)(2616005)(6512007)(186003)(6506007)(26005)(38100700002)(8676002)(66556008)(6916009)(316002)(66946007)(6486002)(478600001)(966005)(8936002)(41300700001)(5660300002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEovSkhUNXhFMzdiMDBic1BRczlBdjRRKzRoY3BFUGMvdmM4TkZtcUJ5cUl0?=
 =?utf-8?B?UVNIaW1ocGUxdjBHTHp1VUNWV2tzZVM3MnNUbFEzdjJGYW8xRkNWVHM0WnJL?=
 =?utf-8?B?NWZKcGVzc2hsd0U0ZFpITW92ckpTaklQZXZHcG1MaFlZSkhaYURFdmhPblZF?=
 =?utf-8?B?cEhtUXZaSlRHKzFiZ1hNTGNzN2RvR1RmWmg3VzVrdWJWYURsQlkwZ05HeG9n?=
 =?utf-8?B?TGo1RGhhR1N3OW03Y2FYTTcyWU84RVdQTm1KRWtkb1dPYVQwLzUyTVlvODhT?=
 =?utf-8?B?S3ZxMmtXenBqc21JeG9ZUmNiM0xGb2EydUN2cFhDUkFvMUpOYkhiaTBydmFn?=
 =?utf-8?B?OWd0TWV1bmxOSFJBRlhGNEZOazF6Rk9OZytNNkxhQTJRelZ5cEhhajRoN0tG?=
 =?utf-8?B?WUVhZysvdWxFd05SeFRQdTFMT09OYkxZaUs3NVFQMklNNDlsdWRpL3BnbEw5?=
 =?utf-8?B?UzdESGxQL2JXeWwwMmZFOW51Mno1TEJFRjY1RmZwQUZkVnZ3U1BjaU9ta1g2?=
 =?utf-8?B?b2taTWsxdnNZK3YwVW9VaDBEL2hGWFNFYXhpaDMra1RScVdoVWJ6MkR2bnFQ?=
 =?utf-8?B?ZmxHNmpWdXZpYmlHRTdlUS9JNVpQY2Nvb1ExWUV5MmhQVkZrdzhHQ1Z5RkdM?=
 =?utf-8?B?SitGU2NlQUkyS3lGZlJXc1BsUlgyQmYxRTZMV2xUSm9jaUZsenQ4cFdEMWNz?=
 =?utf-8?B?OFlFaW9YbE41UEduYmROK2puZ1FBRnFmSjQrTitxaGhnRTgzVUEzODIyUzl2?=
 =?utf-8?B?QWhaeUw4cWcrRW5MK0hZSVZlcGxIbTFrOHpGU3dPYURlOTVnT29ad3l1SEQ0?=
 =?utf-8?B?bjJ4K2RTNFRJWWtvemMvbGN0a09LTStGQ2lsQWsweStibFdaa25QemVMRDl3?=
 =?utf-8?B?ckpsOWdRUk04NW80MDhUdXhkais2RU4vMUZqaEsyOTR6VlVwTlF4QnYvaTN5?=
 =?utf-8?B?N01jMVJ4aUgwbE9TZHduYmFCZDZiZDY4U3pLYk4yeUM2K2lKUzA0QzFoMVJz?=
 =?utf-8?B?Q3kvMDJtZUlnT3dPL1ZqNXdMK3o1czkrOG5BMTZ5T3NZWmNBZmZyRVhiNEJi?=
 =?utf-8?B?NHlkZW5YVFFHS3ArcDkvSkpuSlZxV215VHo4cWRCYlkvZUc1UGVXT2ZPcnVI?=
 =?utf-8?B?bXdJTk5VVUg4MDVVZXFBQURTcmN3ZTZKRDk0MXZlRlphL1JCdzRHMWZlaHFP?=
 =?utf-8?B?S3Rad1FrNXJqNG0wVXZLZ3YvTlhjeGxGc3IvdmR4MERWVnh4T2Y5ZU9YTTJp?=
 =?utf-8?B?VXdldnR0azRUcHdWU3haR3liY2Yvc3NlUHllNWZxRDRHbS9WVlViRHhxS2Jy?=
 =?utf-8?B?S0E5Q1N3K01YMktiRm8zOUxuRU42cnRtdjdSQS95YXdTZGlLYWdiS3IrWVZh?=
 =?utf-8?B?elA0c0ZRZDdlcERXV2FTNkxkYUhtM3greDRJcHJLWTVKeGFPV3doR2loaWpu?=
 =?utf-8?B?OHpXbHBKMHVXR3hpd1NNVjdUUkQ0YldxNDd1TDNyLzdtV2YreE85eUlVNTNr?=
 =?utf-8?B?QWtGSGs1RmpyNmxlaUJ6eDdWcVV0bE1GQUdyazltMEJpRzV5TEc0UTVya2h0?=
 =?utf-8?B?djZBY0t6UHJMR1F1aWVzWk9mMEVWa2V3TVJaTUtESXZ5OVl5ZlpCSFlYRCti?=
 =?utf-8?B?c1g1MFRBcTd5VUE2dzFrd2FJUmtuT1dDOGthUWlxb3pZYWlaNjluNXlGOHpY?=
 =?utf-8?B?WXJXRFQ0NUk1QnFBZmN4aHZxS2ZjMnY0QXNJaFJrNEt4MmFaQk9YYlp5U2lI?=
 =?utf-8?B?a280cEhLRW1CcHc0U213b1U4ODAvMTcwazVwUVYyUWFDbzFwQUtuaGxsUHEy?=
 =?utf-8?B?K25oRlVocW1Ga2N6NUxsZ3N2eDBCMWZYMC9iWGE2QjNTYm5ZVUJjSEdmN05I?=
 =?utf-8?B?S0ovbUJvam1BSlREUUJjYWhpUWF1aVpPTFFMYlJEMkZEQ3FhVFVQZTJkN24r?=
 =?utf-8?B?bGVFME9sZmVya3M1bFpTK2V6R1FjTEhmdXhjLy94a0Izd1p2TGEwYTRtSUt0?=
 =?utf-8?B?UzJUeFM1MjBqMG53b0Z3cnhaQ0hraU1pREtvclNkdklrZ1MvQithT3Y5dWRO?=
 =?utf-8?B?dW05dGV2bVBkRDdSMWxCY1F1OU10VHYvQXdYQ2I4L1JhckhLKzRMQXpCVkZY?=
 =?utf-8?Q?1iBVATdiTd9UnFbB1hwR4n/PR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c835e0b-2d76-43c7-3057-08dac40dd1b4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 17:54:46.0555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJD+ronJgcptnu+mAng7qAbICLGaUcKvJEoqAlPmHl0Gb5+V5ZILC+n+0ifVau+EB2oNlO/WhpPyTapuL2ulcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just a heads up for subscribers of this list, I just shared the following
patch:

[PATCH] docs/sp_SP: Add memory-barriers.txt Spanish translation

but it seems too large for linux-doc, and it got bounced. You can find
the patch here:

https://lkml.org/lkml/2022/11/11/963

Thanks,
Carlos
