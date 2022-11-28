Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989DAC43217
	for <linux-doc@archiver.kernel.org>; Mon, 28 Nov 2022 15:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbiK1PbZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Nov 2022 10:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbiK1PbG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 10:31:06 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3A127FE0
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 07:28:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYQc5/jSHYfUxYhA9oE+x3eRhE+7UB+EYyM5F/x14281jkp0Q8g2ZOVjAYaTpxsxeO0D33QB7q0CwZFSUQxJHMktQk2Ga78Gly6jQXpTxZz1FEJQhy+CeQh1/92YANe74JSimxflEcedle2aIyzwm5oh6Atrcd6HEXNtYmA2SaDPpjZaWCcNPn/kPM1vv61s8rctAHPEGJeCe3M+tlDUr0U+hSjvbD9Ld9YwB+Jfe0jK5bBjATJSd5N1RKGArDbUm7vEbIx8rFvNvCta3qpTFbkYtpC9MeFfOfxxVC2gx2+0MqzXW8SF1n7ThLKuI6mxf34FEv8+W1MO6a8LuvBnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1BgGIME83pTJ2mg4IPFIM0hUlkHezpYYdmTvN2Bh7g=;
 b=XO+gt65XZKH1sR2M7+7qrt3pCyp7AJ9hvouFypI1ArapZKwm7fwMiwJwP46dj1RZKZqASKMoICFmbDI5wVU+o5+7+8oCW0SyFdOgOWKnQhARR1K+rTPMbhF/ODErAGjVrD+e1NEBIT8Y9yK8F2Gj+YpYorAtgwI0ZHJUXCHz70yeoFDniNF1nf/6x3gwPRS30lzvvKk4nGi6elkZd9eHzYNrZRC1W8zmjFUvSOmPE8l6y2gETdwan1OwCWECr0xsNfjCrP6MlsUhroYJjVUxu82H9rtVCKjWv1VDKMt/SrcOqUG1HwAOYG/bU/oMg6jg91knLgKBWjGsMcWiKdBiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1BgGIME83pTJ2mg4IPFIM0hUlkHezpYYdmTvN2Bh7g=;
 b=b5vAzQ88Dcqe0Eyp4kRGeilFCRnuf+TTEbfE1oL/FHu7aA4JUV9usTlQN2vlIGLWmf1i71sO01BdMwHlHvJjhqEhDTqoj/zAnltrcfOSQaZI/UN043XvnUqixpU1O2E7fdkmox96utzcPzo6sJtqOk403Iaev7PWpwl6YnkhOhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:28:20 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::9eca:d454:d407:7ba2]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::9eca:d454:d407:7ba2%3]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 15:28:20 +0000
Message-ID: <003eed0a-fdce-7df2-6a97-8e4a051f1ff7@amd.com>
Date:   Mon, 28 Nov 2022 09:28:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
From:   Carlos Bilbao <carlos.bilbao@amd.com>
Subject: [PATCH v2] docs/sp_SP: Add memory-barriers.txt Spanish translation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR20CA0008.namprd20.prod.outlook.com
 (2603:10b6:610:58::18) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db22e1b-8bf2-42c0-be5f-08dad1552e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /frzoaK2LjyHENtzwnFQmNXtFyEy0sVZI3Hl4WEJQK/5B69xUYpm6vTzPXrIsDLyAcuO9EUktS2/1c5vFIf26sTax51D5Wh+bWstYy3bEwWp4LREYINiX8++90CwkiDZsGyCtGiP1M/airCBYIkbRTgmlxbAvslIG2FE2igHbmCzs7oeVa8RmoP696ZfLwVWWPdWXWy3y3r3T5lKCkagEt5DlKMfXCTtxs7NZmZc1HA9Lckqh4PZPpiuSlZvi/6Xdz3gvXlvZXwmmRqjTxtnAjZrzCyzyK6O/9C2ntvHGiofna/vahlJ05K3/VELgsnrcs0CBLTPphJ/CWSj0DJSDD92H2DiCHJQgTr0hGBNS3wIrl7o8zRFy3MnOO4/oQXPTqMyxFZHZzLNJNtJcv5CVA6ZObFnN5aZljPlDM9AnrkGq+GJTT5JaWzUmYlXji3MndKv4RJ9m15bg/Xqs+fr1lFnv7z9/M5QUlUb2WlItuzZfiH+8iueFXugAr8JZVR71dypK47cL/dfGh9Rh5in2X9hhIoCpiqXBSGSAsAkJAaTaEmjOedow4fc/GqdFMJ0eM2+df1h2Q31titBSnuFgoQCuXkgzP9dyPfTSQ3ZY3HtZE/HBkiI5nLR/iauP7AiifolpPipNxKEVAtyDhlfA1V5BcMxCVPtdiw6ICF7CMbADmnkyXJnWbPtO53p0c9Pjx/U3IbTJ+Ds69E/VmfBqsRf3v9V2MrIcJ7sGcXozTCCJ49z5E1HLEO+vY+hA7xx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(558084003)(31696002)(6512007)(8676002)(66556008)(26005)(66476007)(66946007)(86362001)(8936002)(41300700001)(2616005)(966005)(6506007)(4326008)(6486002)(478600001)(6666004)(6916009)(38100700002)(316002)(5660300002)(44832011)(2906002)(31686004)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejIrMFBKc2VJMkc1V04vQ05kWGl3UnpQYlV4bnN5YVd1UFVSdlI2dHM0OS9J?=
 =?utf-8?B?S3oxWWI0NTFlM3RzNStZRnhtR29LTVlIenlEdzhwMTJUcFhrL21MV3lpUkdu?=
 =?utf-8?B?bDFPeWR4TWhzcnNTcWl3R3I3dlNqa1JWMDJhbWlSNEVFT2t4RTdvZTJvZDRr?=
 =?utf-8?B?QThkM2tSenV2RzVrMWZCdVRkYk9VeUhJVCszeHhGc1BWN0FqTHI5aEl3dTRU?=
 =?utf-8?B?S0czSlhMTlZEdTV4SUhjLzdWOHQ1VGh2NHNiN0xLN0FUc3NnYUxDamo4SUhp?=
 =?utf-8?B?WFRmTHpqeTlkdkxLa05hUDFjWVI0cWE1NWdFTXFIQzFhaVNhZ091dWNCaWZ2?=
 =?utf-8?B?a3lJZW5kTW5IQ3cycGZZUEo3R2hEd1ZIM2RpcFIweGpwbDNVcDFXN2FiL25X?=
 =?utf-8?B?RHg2Uk9GelFKWGxhR0d3WXprM01RZHpZZlNtME1GdTQ2cE8rcmdEeUVMakpJ?=
 =?utf-8?B?bHArajJlcVB6bkRaYllZSlFyRXJWdElkSDVPVSttTVVHZHFUSXNaajE4US9X?=
 =?utf-8?B?YklZRkVoajRudlVlemtHNURLMFBvN0ROSk0yMDlrdDZBMmxMWXpLdkV5aDNT?=
 =?utf-8?B?RWg4RG5vcFRSNUdQOFR2TncwcVRxcDVtS1pUTjg5QW9xWXhVbFhZdFVPblg2?=
 =?utf-8?B?b1pqMDNpZmxubTQ2dGNoeU5tQ0VYSmR3OHVRRXE3S0dZdGpIOEl6NHFlZVB5?=
 =?utf-8?B?cWR3OEN4dFI1aUxqZjZLa2lUWEZFRTdJMlZrWnBQaWVLc2tORmVVbDQzTThK?=
 =?utf-8?B?SEdvamRJZjNrYXVZSzZ0cDd0alp4UUNDRWRwUHdNTElPMERVS2twSFovRmh1?=
 =?utf-8?B?VUVQOWNNTUgyazhEMGJCRDE1Y1J6cU5Eem9DL1Y0dXBpZlFNUTFNdUhJckFw?=
 =?utf-8?B?Nm4zM1JYTHlxV2ZDbnJoMkcrSEZxR3N3RTBTcEJ5K3ZrQ3VzTEJtNWxUc29W?=
 =?utf-8?B?cWc3WHhia0l5cE5zM1FBY3lHcWlrZGJ5KzlEdGpJbHRsS25Hbzh5QzlYNHZC?=
 =?utf-8?B?RTY0MlNJNFZXV1dodEYyWlV2bE9ZZS95NDJCK21FQ2pLNDh3bWdOYXNuZG1L?=
 =?utf-8?B?VjFxd2tGVzYzaE4xbVFMUHV5TEsxYnM1a25oaEpyZFIxMWRrL0VoR1R3Lzd4?=
 =?utf-8?B?VGJkYU1HdE10OE0wbFlMZWw2NmFWTDlGNmJEMzVyWGRWVGlzdmJyUGJWR1I4?=
 =?utf-8?B?N3kzd053MmxDQUhNU2NxNzZrdXMvMURTUGVFbUJUdGJ3d05aczlEUDNDV3E4?=
 =?utf-8?B?MFpEVDlqbGczK2JXWmpLWjF6UVN3aUFVTUNuZ2psNlo1NVN4SHRVT2JHeXhL?=
 =?utf-8?B?RkxqanZ5SmRJNGhpbXI0N2RSeE1QaWgrMWxRcmhVSVlZeWdhb1BSRFkwaXlO?=
 =?utf-8?B?N002UG1yK1dSdFl3a1JEUXpBUjlwVkU3Y1FrdFhxbmd3MXNwUUEzajQ1eWRK?=
 =?utf-8?B?L3BkNmR2UWNpZ2RmcStjR1VPSHR1clRtLyt2NldWY0tzSjdBRThCWXluNHRl?=
 =?utf-8?B?WG1tN3U1UGZna3ZZcFBYRDR6blltV0swQkVwaWFwQ05ueTFUSXhpSEdPQVlm?=
 =?utf-8?B?MGdIblFUbEVEbjNyZ1cycXYwZnppbjdXekh1Mm8vTlF2N0tCTkorVERNWm5S?=
 =?utf-8?B?L0FQcTNIVk1uVFM2eURWdk9Jcno2YXNVZ0RDL3c0OFpUR3Z6Rlluckl3bUxG?=
 =?utf-8?B?VERpRWxFMEZuYUNLUXJWK1ZNNXFPaWhvM0k4cWxSa2xzSTBsUE5qaTBMbmd5?=
 =?utf-8?B?andSRndCQzZXRjlnQ0FjRkZFS2tHSTczbmJLQUtXSGhja3IyM0FOMXlOZjVM?=
 =?utf-8?B?TVhsSlZnVHdBWkFoOHU5M2E4RG5va3BQem05NWJRVjFNenlqMnh3TDZWdkVS?=
 =?utf-8?B?TGNzVGVMbWxHQzNYeE1uL2x3VjBYMEozY2FpYk41SFQvc0xHbEZqd0RJQ1ha?=
 =?utf-8?B?UzRRRUNBSDhRdFFFSTVNVGl4N3pXYW5iUlBJOG5iSWU5cHlyb25MMkp3bFQ0?=
 =?utf-8?B?ZERyb3JFNzNVdnF5NFpjT3VwQ3JGY3BqMlF6d1FuKzVyZGMxcitweFBMTG1x?=
 =?utf-8?B?bVFTYTlORjB4NFlteU5wb1FxZ3F2eHFBMXN3dS8yU3dlb2tJNTlyNGNjU3pr?=
 =?utf-8?Q?4MKTb7AuQ4EN9Z38Y9MtUHB54?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db22e1b-8bf2-42c0-be5f-08dad1552e02
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:28:20.2109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TamChVvW+ObOfkx/WschJJyzEWbG09w0Kr2FSNpYnI8FB3BceQBGj58lwWLGpKcf7iajtgw2hOc0zXs6WDQwww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just a heads up for subscribers of this list, I just shared the following
patch:

[PATCH v2] docs/sp_SP: Add memory-barriers.txt Spanish translation

but it seems too large for linux-doc, and it got bounced. You can find
the patch here:

https://lkml.org/lkml/2022/11/28/741

Thanks,
Carlos

