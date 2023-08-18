Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58502EE4980
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 17:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379102AbjHRRfa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 13:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379100AbjHRRfB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 13:35:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACB43C2F
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692380099; x=1723916099;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BNbryQNckfqaMzTSuA5T80l0g9n/1Tv7ijYaNAqkbZk=;
  b=KHcad69WFTEc9R0/e1IVVuhZMp29jKkehKGOtl/h5TDHlunMt961EUYg
   l3YWIbokgYmo/1nx8X+MgflVReg/I/3mvUTQGUyj8TmDsNDWul/wyVEkR
   PrBZ0IL+/o6VEIAWsJj3NdhXUmOk8oRl7za7sHBbzcI5cfpJqYuxTC1GT
   qGBVFW7AfL30o068f32OAc7f7MWqXF63XvFA1yAGfmYMsvGyGoeCQMYxB
   xzEG6gVmYkpPcDxUYvcEBbDnQgD7y4jP04nGmyjKAcW4Xv+hCBO6PpJi7
   ML/t6w5u2J/OkO06QnvCc0bH2v5EOl9uNmbqKUc0O9L4qew7lY68zpSq/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="373135875"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="373135875"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 10:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728682455"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="728682455"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 18 Aug 2023 10:34:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 10:34:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 10:34:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 10:34:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 10:34:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/+M9RIlIwYYxqH2MW2LJizbZ8t00X3jWrUS6nkkWz4oP5OpukJYKcqFF2sdX2UbL9cVxJ2zc3twAXcWBWEdeL8tC2kl6rg+B7PTd9IjterGNqHQcWCqyp0ymaE3OPWMBrGA4mMKqu4CWfIvr6me/P9JUofIpG/sPkGqdDoHrbEf7Gd+OhpH/CFqBb5tqHoCw0zJBeQFoPLinKGVb72LYIle4nFpRIsckWSNQsaCTBIS1TbI1asZQek9+LrZgSXwUfGGFhuVzawzsOeHS6/+Hiydyc9uJQFyypdCVd2geREf+uAOEkxAcu7lBUsiJhxCez2W19l406wMf94sOVcqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSrneQfkKF0ml3oruf48Wozoet68dSaZqvsuJv8obVE=;
 b=OO7o7tnyWFY17/Pgyc6hYOKh9OPNeX/Uj23fvsTVNRBb2EOyFNQxe238Z7+kqje5cT0w/qRzfsgegPTqNwImI+vPcNMCHOOOLsbx3KaVMRNlKE5ZL/xM+/09kDaKFytDveVrFtziAU8k74j9YleHo423fX4KtYzuLPjyBQpudYvMreGK8ONCxYRXlamwybR99sxgToP3VOkpl70r4m1bkQyEwm1ahR0TMup1K7k7Jy1VzdxZDCQVaTFOT4M3wYS6p/dN219NtY3hDjCU/P6MDvO0+17pXUJinsdiyPW9zmNcEBRbGAGbGXxBZzRbClPF8ut9BxeFui3wbaIGOyszzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2599.namprd11.prod.outlook.com (2603:10b6:a02:c6::20)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 18 Aug
 2023 17:34:56 +0000
Received: from BYAPR11MB2599.namprd11.prod.outlook.com
 ([fe80::7167:18b4:ee0:8f0f]) by BYAPR11MB2599.namprd11.prod.outlook.com
 ([fe80::7167:18b4:ee0:8f0f%6]) with mapi id 15.20.6678.025; Fri, 18 Aug 2023
 17:34:56 +0000
Message-ID: <ee15afad-da1b-9c69-a875-67630d40584e@intel.com>
Date:   Fri, 18 Aug 2023 10:34:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH docs-next v3 0/2] Fix invalid kernel-doc warnings
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>
CC:     <kuba@kernel.org>, <rdunlap@infradead.org>,
        <emil.s.tantilov@intel.com>, <joshua.a.hay@intel.com>,
        <sridhar.samudrala@intel.com>, <alan.brady@intel.com>,
        <madhu.chittim@intel.com>, <jesse.brandeburg@intel.com>,
        <anthony.l.nguyen@intel.com>, <willemb@google.com>,
        <decot@google.com>
References: <20230815210417.98749-1-pavan.kumar.linga@intel.com>
 <87sf8gl0vu.fsf@meer.lwn.net>
From:   "Linga, Pavan Kumar" <pavan.kumar.linga@intel.com>
In-Reply-To: <87sf8gl0vu.fsf@meer.lwn.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:303:b9::22) To BYAPR11MB2599.namprd11.prod.outlook.com
 (2603:10b6:a02:c6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2599:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: daac2dfb-7e60-4327-216b-08dba0117039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6cn3wHyIM0rKtQfFOYsSfOekkIKzk32a3cmH3AxCdsmPjqJl+v8HiRygQ5rPo/Sl/so1ocIdN2doS9HcdQzwS1qpEFd3/v9vyVIMqBZvadYnwlH82akpKOPdmXDgXND0ggP3x75M+hIqar3QmJSSMYKKmyB17c4VIiSfh092ahz0PAthaF9hFwdDNicNHAyOh78Vh+IKyiPeS0q55CRizTeygwBnR8Xua1eU5VFI9D8LSKZehlDqCU9JJI83NFdN7/oO2A+8ViODseTJ3FOlzakaMLEc1VabN4mR1eKRYVjk6nqiTBfA6ti7RBFYElRYVaNF0udjhC4cCLldAl2Ylln9iSOAbxhYpcQpZK3QdlRK8Y8Bl2eWJLd2R8bNnGv5TkktVVJhJzCnaEfI4mmJu1SFrcdIgKLk0vPOi5pR4rfL0RV44cGGmD5Guw3IVbjEOnVthPg7w+n/uOeMp91apkAotOLUzAfwB7CoSp1+a4N/YHP1LynZl1IZ/H5LM7I4YxEQ65k1y1L+pagqg3N4cgZUlhGvwd2q0IO6t8oiBLH/CVoGaZPzz9mu5PQOtd+Mj9KFsruR54ALyWDdel17EqGbq3m2fuUKS3ggMA7xKLcm2d8s8cnysQNPFzhInZ8uB1z12aX6CHYxH2pZfYBZchb0rDEOPsppGLMDjPohC/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2599.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(31696002)(2906002)(83380400001)(26005)(6506007)(86362001)(478600001)(6666004)(6486002)(2616005)(53546011)(6512007)(36756003)(966005)(5660300002)(41300700001)(66476007)(66556008)(66946007)(316002)(31686004)(4326008)(8936002)(8676002)(82960400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2Y5eG5vaXBKU0hpRmFsOWRjUXcweHozREVBY1dIbzFrYXNDZWt0Mm9Gd3ZY?=
 =?utf-8?B?VTdYMnJYM2FnZ0pQWEJGbWhBdzdhdlEyeDlyc0ZjM0pQY0FRUmVTZ3lkbmZJ?=
 =?utf-8?B?V2tqQXBpZ0UxR1dOY2JYMkZnRUxhN2FSZXNOWEVhc0g2czZ0d0N2cDU0YmxN?=
 =?utf-8?B?Ykd1VFJUU3o3T1ZITW1zZ1Bubkd0cU9oNGQ2QXFHMHM4WHgwSzFmNU1FcHU5?=
 =?utf-8?B?U29xVmphR2p3TGtQNU84MmFkaFpuRjB6Smt2dUVwdCs2eU9hT0xYeFFxVmNE?=
 =?utf-8?B?dXUyVTMrL3dQNXR1VnNrVEYyQWVvT0hWK0dPSitERTk2OVZnNmRiRkQxeEVt?=
 =?utf-8?B?MnRLbEtzREdIYThxTTgvdk8ybEd5ejB0eGsvaHc5b1RiV3ErV1dsTDBCa1c3?=
 =?utf-8?B?UTF5Rm5DSWN6RUFMTzJWbDR3WDJlcXJIbmNKQlM1WVdZejdHUDJKNEhyUE1U?=
 =?utf-8?B?MS9TUFAweVh2R014UGJZdVphS1d1dVdvK1ZnOXZnUHBUNUUrNkxLNHFwT24z?=
 =?utf-8?B?Njd4dkZMVHRzN1BjMFFmZXlrN2ZKd0xkNWQrc0tybjVIYUhiUFZLT05VZzE0?=
 =?utf-8?B?VE0vSGxhMTJqSHhkYk1yQnloMndSOFZWbzhSSURsS1ZaTFJGKzJPSFQ2eTZG?=
 =?utf-8?B?cWhWeWVQODhERjVmdTM5WS9rejNxWiswYXA4SFRUR1NSTkhjTDl4aUtnbis4?=
 =?utf-8?B?ZzBzL2pIQzVVSE43WmFPdGt6OXFRSFc1R3VaOWhmUlBiU1RMc2tXcVo5dnZE?=
 =?utf-8?B?R2xOZ2tscGJLY1Mzams4UFNHai9WSUtoOWNPNXI0MkFqd3o4RWtIdlBtcXBw?=
 =?utf-8?B?dGVnNUovOC9KN3dKWjhkbEw4bUVhZEFwbzdrZmFMRlM5ekNiTHVLWUFETDlG?=
 =?utf-8?B?NmdKZU1kK2MvMTJybGcwZDZoZHNITU1LL1hBWXowV2N4c0J3T3hqMkhia2Zx?=
 =?utf-8?B?TmRCd1FLRTBBWTlXOWkxOG5JM2RsaUVnc29aY2hQWDJpbHVYRStaR2Fjb1Er?=
 =?utf-8?B?MUZvNkhYWTV5T1VSa1dkWmhEN1FTWkdUeUg3NEFsTDd4ODByY2lyTU9mS1N0?=
 =?utf-8?B?MHhQVTFJS0d1N1B1Y3pib1VNWkhpckhlQXY2cyt6MTlHb3dRcnYrekNYQXlq?=
 =?utf-8?B?L2R1Z1U3VXJNdmdMTCtYa0ZOSFcwRmErbHRoZlR2SGFOMEJsNkdkVmdGQXVp?=
 =?utf-8?B?WjFSMzk3bzZROXEwemFlL2MrbUV1TGtObFI2ZWJKVlFFYm5EazUwV3Y4M2Nx?=
 =?utf-8?B?Yyt6d0hVb2kxaENlY1ovaFByNml6Z3JQcy9RZ3pLWlZSQ0xEQ0RKdkVhc1Ay?=
 =?utf-8?B?QzVtUUlWb2RkRXRQVDZUNWoxT0szeWxoTzhWa1Uwb1RBQm82OUp6Q1ZURisx?=
 =?utf-8?B?MnBVeVdlb3hXMXR4RktsV0tmL2dlSDIyN1ZQblVTakp4Y1VQbEZIM09ISGhz?=
 =?utf-8?B?NSt0d2V6c3VUZElkMEQ5bVFpTVZUVHdPTm9BY0s5ZWRUa1VZeVc2OEdwbEtX?=
 =?utf-8?B?NmtISnFhOG95Ym1nVk9DN1ZXVnBFcDR6dHU5RGZmZTZGdDZsdG9hWWV5MjF5?=
 =?utf-8?B?QTRhd01SSHZmNmUrdTUzRVYzeHBGTzZHTmNESHdLOUFnbHhYRFJjTzFUYitm?=
 =?utf-8?B?SGswNmlNVkRZZm85cW54ZUFxbkljSm9TWmxpYndjM0ZLc0ViZDMxVTkwRlFt?=
 =?utf-8?B?OE1pcE5aY05DNnJEdFVvNHRqeG04NUdwWGt6SkEyamNXcmNmb1doWEpXdFlL?=
 =?utf-8?B?TlF1Zllwc0YzbUkweDdSWG5VdEl2bHlzZE9uSmRpNDQ3elBNanVtaVVIbHJB?=
 =?utf-8?B?ZUhIUHo4MWpBVmswV2paRUJTQ2d4RnpvcEs3czV4QUpRRHIyZWllWjFqdUlo?=
 =?utf-8?B?RUwzVzBBY1ErY1dNQ1JLbHV3MVNMZmtCWU5kWFBBSHJWejVjNXA5ZTl2U2hM?=
 =?utf-8?B?RFFkU0NJOUNrOGtUU0ZvUHpYc3p5b2ZRTXlTd3RZWUxnT25Bai9md0E0NitE?=
 =?utf-8?B?TkFQUjNiMHlyWVkvbXhPNU1pRVovRnZPZk1vWDVrYXUvSlZnK0l4bnRqREJY?=
 =?utf-8?B?S2c1SDkwUlBaZ3NGcEYwUEY1T1o2WWtZNmViL054VDJWL005WWYwdXE1WTFH?=
 =?utf-8?B?MDdKclo2aTVXRk1qTzRicWlIMWhvUFpwZk5oVkphVjhObEpUR1MxNzlVWkVa?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daac2dfb-7e60-4327-216b-08dba0117039
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2599.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:34:56.2457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01KAABECsIZJmSmEt4LJ6U034hKKQ1Mu6VGmfSzX+32Pw0bD3WVPn64FKAmLuygsOFbgiTCsOW+1ChXh7C5FJnJZrnh2Yu9/XjR8VVBXyXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/18/2023 10:24 AM, Jonathan Corbet wrote:
> Pavan Kumar Linga <pavan.kumar.linga@intel.com> writes:
> 
>> kernel-doc reports invalid warnings on IDPF driver patch series [1]
>> that is submitted for review. This patch series fixes those warnings.
>>
>> [1]: https://lore.kernel.org/netdev/20230808003416.3805142-1-anthony.l.nguyen@intel.com/
>> ---
>> v2 -> v3:
>>   * Changed from net-next to docs-next based on Jonathan's comment:
>>     https://lore.kernel.org/netdev/87pm3pv47i.fsf@meer.lwn.net/
>>   * Added a 'Cc' tag in the commit message
>>   (patch 2):
>>   * Replaced ".*" with "[^;]*" in the regex
>>
>> v1 -> v2:
>>   * Fix typos in the commit message
>>
>> net-next:
>> v2 - https://lore.kernel.org/netdev/20230814170720.46229-1-pavan.kumar.linga@intel.com/
>> v1 - https://lore.kernel.org/netdev/20230812002549.36286-1-pavan.kumar.linga@intel.com/
>> ---
>>
>> Pavan Kumar Linga (2):
>>    scripts: kernel-doc: parse DEFINE_DMA_UNMAP_[ADDR|LEN]
>>    scripts: kernel-doc: fix macro handling in enums
>>
>>   scripts/kernel-doc | 5 +++++
>>   1 file changed, 5 insertions(+)
> 
> Series applied, thanks.
> 
> jon

Thanks Jon.

Regards,
Pavan
