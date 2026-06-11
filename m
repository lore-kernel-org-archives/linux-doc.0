Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF238BF62;
	Thu, 11 Jun 2026 23:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781221254; cv=fail; b=a2sYF1lfAKQgmBCsmGT6VXuw+fPDkYt0yvD7vKKuFh72zREpJDUVyY0iGqOcpKxwsk/7FkKdDwPCVhAFGtn1iVFCjF/GSRp1+LH5HIErkaE7ZSFnCcmtbzam4IxhcvEgMtzZ+kTcJD/sEZLm4ExLzkqB96J1NA7EtO7dGMQY4es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781221254; c=relaxed/simple;
	bh=hm4Tk1V1ln61ElLLCgsOmWSbKl2lfn8rq4VoCWwKZXc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pUjfnKkDqBPj0twssLo3JUirf8dGea1nQfMsFvo+b1PGwZd74iPf/AL0FQRThYjWQkfjLKZx0gNe4dgInQM1uXsFsZKD5IeOaJn0bF6gbfeQezWMHBr14Ww8bve5BZAp203yDqsyHB3tDiWxvVZE8uHnKgv9pTIokWnNQeohMyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6rSjVp4; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6rSjVp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781221252; x=1812757252;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hm4Tk1V1ln61ElLLCgsOmWSbKl2lfn8rq4VoCWwKZXc=;
  b=N6rSjVp4MyNpa+qvbsRYLPajAgY7xWI0nSzvhhZyKXiid4xxrB5/k+1U
   VTYyNhcdliHPeaHtywwKJ3pRYQ2HG4Ery2J6SWFGMpQygeV4ZtWhJh/IS
   d199P6fPZ0UPEtr6YP/zNFrGD10SsU48nVBv1W8HpSkVtivIz5Iks31fy
   i/Br+3/8wov+MOVBzEV3HtPL1r1CUMLAM3s+/+Rg47dOFM6+HxF8RNKjR
   HttG2fkxI+HHVehwf2/ko+BjujXYX0DRbu+muvXKkQlHBeQMV6vr3GOZl
   gxwTZx83mazGkU4dHFMR/B28VrzkIT2mFUhb/C27UPK5VIAmEfbMMPNpW
   w==;
X-CSE-ConnectionGUID: aD9q3vWoQ0WblLlE9YEwQg==
X-CSE-MsgGUID: +FeCzMxrTN+JrZsFeE+/bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99469918"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99469918"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:40:51 -0700
X-CSE-ConnectionGUID: yMZTRNdMSs2XgcJlzKLw6Q==
X-CSE-MsgGUID: AGC7yTKqRH6MAQndq8PgEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="248541504"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:40:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 16:40:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 16:40:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 16:40:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjrL+XG9ME9566nGyIDwiv+WfLRjVk0xo2SDN6xGEfY5wxU3pNMJw2UAcOBkKxxGQWrh7wJ1ELZ+tyapSZqFtwhrNB2KotqHaqQJ8jrdKYGo961VN/o3t8P0dWimcvlqhNZPknMP6S+I4u40r13i6IyLVErlMuEjuSpByI/MzmgY6mBOHwPqpwYm7r8Uk0Lk/f7ZzHcJ0NvpLQcGFK448bEoJIS3o4btur/t2CWwGHxl3GkdkphK8XVR64P2rZQl1buKS1XxkRlwFG1rQiYRSxLaeX/e+E/qiCEHoialu94E/nGSBO2WNjCbxGhtnTzlROFjQgsXeI3WCZ0EbDSj2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9cN3AE+Z+i1TNOwRE2Nd0QcIvHq/m0F59ddicfOlnk=;
 b=oLnY2wCcNCMj0xWewHY192KL1YbpWct5gn5P8MOm4Nbw2+IAothiacDN1RXCioN6+lMKAEIlonEaI6/diT6JoVyAwJPz3rlUZe20QK2fTHowdXu5jBZD/xVS+f+t1QfHgb0HNL5gp3vuhBuEqFtR2mz9b/KSLctKuxQ6N7KmK3eJ78V9kPijUIHMWUUoao6pa0hAnEUKYN0r9DzeGBStWWMvS6V1GycD6mOF7aLsD23BT2C71P9g/iSybc/y16gDhpcEjIg2UA34QrtH4FrmVgOhTz+f7wqwI2b2Y8u5fpDgHQ4JimMxKj2gYji5SUlL1y/8XhM6+GBRyzYZT5m//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV2PR11MB9537.namprd11.prod.outlook.com (2603:10b6:408:378::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 23:40:47 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 23:40:46 +0000
Message-ID: <db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com>
Date: Thu, 11 Jun 2026 16:40:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] x86/resctrl: Add data structures and definitions
 for PLZA configuration
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <paulmck@kernel.org>, <bhelgaas@google.com>,
	<seanjc@google.com>, <alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <e84fdbc324b312ff137d279ec154e3827c0aed81.1777591497.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <e84fdbc324b312ff137d279ec154e3827c0aed81.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:303:2b::13) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV2PR11MB9537:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5ae4e0-8d5f-4346-8530-08dec812dc78
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 3/FWTnWObpcCMidM2nEXQNdmuO7sEIe+kODyHrjkPGw/vS3ZfsCOeV+LRKcijNYxX9ABUx7Hbjhcuu8kI9nX8Hkqahcz3bugFqfBfYjLAApiw6Gedw6DwgaDPbIKnV6VfVJIEbzgka0xSwZmbDUMrqeZG57k8qQvedkVXWFnpZ/pjNlxJZYM1SkFPIYrWosDN09BUZOaeMhIM+zGHDnqOLIxfVXar8KjRPOkB/aRCJRs3jNgjkBcapj3pOhu3r1mOiigQdLxkLahv3RthxmodDvtL4N/rkIkdJGDWuKUOrriBKkVQl7NbHmgnADm+X02BlhT+44JEnBxA/W+ppmoYK1ZePzy58oUglhoVBfB7Jumk/FsPVnxj/2Nw/3PkMVBmK2Mat2sq6Qmj/VqbUNfH/LxvxOWcBBi6R9dZb3u4amWNvekdB5H6hBMZwZGtgNNmGx1XtY+caERdcCC2A/J8w8M/l+tpnHiOYc9jF+IQ0zDCT5wBGnz9SY8pSnCgkp221EkxrWR5cRu2y66sEHxs5fBsxvScjFDD0Hvp41IkGQwlL/isp9d1K/FZUQEgQ2LoaAJSkyXP6UrSrWfnTujeoOIQZtyAOVjn2QH7hvM5jmAs7bXDuwS+ZzPd1waW/B0ujmox/f/flHgKbXgVehyOf2dEh2oO7+6d3hlfuN7V/wJ+qn5MogmZgpfYPzETGZp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzNKbTIvcTVJY2NabFVkOTJJRFRhV2JNcHN1M1RxL1BuWXZWUU41aWhESUIw?=
 =?utf-8?B?cDhZWUZ0TnFkUHI5eUVWTDhUNk15cE4yc0ZKVTVyY0pzbm41cTBvQzU5cHlR?=
 =?utf-8?B?Vm55Y0JJTGcrT3FDL1l3NU12WVNBTDF0MjVEVXY1SDd6VmZRcElHZXY4cTY5?=
 =?utf-8?B?YmxnYzdiZm80QWRSaWhrTHdXUjF2T0VJdWtacG53RmRYazhOUk81SWt5NUFC?=
 =?utf-8?B?cGNBM1V0U05ySENBdllLNldKdkx2eTU0bzR0ODRrRk0wMndDdWxtdWlZT0RD?=
 =?utf-8?B?NnB3aWhUbERXK0xmWFRuamszTWxKdmt2VlAwQTl5RTlJbzBkRzQrMXBUZjZY?=
 =?utf-8?B?eUVjdTk5anltc1BBZXFTM3NnVUliRWlhcktIVm5PckNLM2V5d0pGTVg0aHRD?=
 =?utf-8?B?bVMycnh3QlpXOW5RdGtMTEdGSSs5N29zN1hLSGJZTTkrY2VzQTBxU0RrREtR?=
 =?utf-8?B?VSthRVpZYVdLZ0dydXhpdTV6Lys3UDFzWVlOYzRuNlNkOEVjYS80dXJNeVhZ?=
 =?utf-8?B?ckV6Vzk3V1JrUlpaa1pFclFXV0ltSWI3ektxVkk3ejhYc3RubDBzUHNNOTFi?=
 =?utf-8?B?OG1jdEhNL0lvak1NbHdxM3hlSmViSkwxeVNMa0lqNG85cllBQmpvVElUbHUv?=
 =?utf-8?B?ODBZWDRHN1hhcVZDamZweVZqK2k3UVRtV2EzRWk4MGp4ZVNFaXJxQTErcFBt?=
 =?utf-8?B?NGxkZWdVeXk5SHYzbjRGbklwc0ZGMlk2SnpuOUZ4emZDMjJGb2NpL1EycjFK?=
 =?utf-8?B?elBEd0FmMzNJK3hhOWtrUG9nM3BWQndlL1ExanZ5R2FPekFVZ2l1Y0pIT3dQ?=
 =?utf-8?B?RDV2cEJhWlo4cHZ0dStLQ0pQT0ZFY00rakhtblJpVzNLb1VhYTBrVG85ZnFx?=
 =?utf-8?B?ZVlwaldjMVVnMHNJcTNwQlNqMUowT0JabzhmOG13dEVmNGJ3ZUNucEU3dXk5?=
 =?utf-8?B?ZWVYSDNxb3JSUEZFa204MWl2VkFmVm16NjVuLzAzY244SmNMYmtLdU9ET2ZK?=
 =?utf-8?B?aEIvdWZCZWxwSm9xSVJ1OWgyQkw1N2JLaFlld2JEQXZ1OU9SRVBsaHhWR05h?=
 =?utf-8?B?WW10ZVJhaTh6cThQMnNSSDZURlRzZzdYU1daVWhRcXVEcldVc2R2QWpRblNr?=
 =?utf-8?B?TkFtV3A2TWx3RlBKRkZjMjRhanM4empLeFhCajQ3NmxCTFpKcnh2NVV0cVVL?=
 =?utf-8?B?WWZybGs4WEREQVNDYTZKalVBRCtobDZjRzkzYU04UnQzM0FvL1dQazdXRTNG?=
 =?utf-8?B?NndtbVg5K3ZDdTYzYmdtSThrb0dOd0tTMDMyOVNubE9Td0xSdW42cWR3ZkdD?=
 =?utf-8?B?UWdnTU81akJVOWo5SlNRWEpLV0JVOUZSZzlTelRIR1QxZVlmVGpKeVB2cEc2?=
 =?utf-8?B?TTZqaDJoUnZmTnlkdVMyRTJQYWthaHRjOXNRZkZUOEV4a1RIYzBMd2l2Mmcr?=
 =?utf-8?B?NHZjclZEWjJrMGhvbEhqSTNTQzYwSnJmQnBOU0lKR2dJVmVLT2VnbS9KK2Ni?=
 =?utf-8?B?OThzMnJicHdadkZmVnZsNTM0T3VSY1ZCYTc2eHJEcUNPN1E4SkpidE9NUFhx?=
 =?utf-8?B?Wkx4TElZd2o1QlBPR01HVEpVWVcxdWJtVXk0VzRtcTEwNTBFc2czMVdKYmhi?=
 =?utf-8?B?YzR4U1FQdWg5aFFvditsb1Zsc3lrUUw0SndXVmVaOENOaFhKNjUrNHJsbnV2?=
 =?utf-8?B?ZG5PWS9Hdm9qR2k4MnF6TkxsWDE0d3IyaUlyT2lTU2N4T0labWNpSmQ4TjlF?=
 =?utf-8?B?U3gwdm1DYklYUW5VaDBMWGZ0U1JoeGxndytOeGFtcFFRYlYwczZzVEt4U0hY?=
 =?utf-8?B?Y3I0NnBlRy9IMDJ5MUZLYkw3Wm1lRE9sWlp2NGNoaUU4Mmg2dWYyZ1pSaUZK?=
 =?utf-8?B?QzhDcVd3N1pCc0dsTXo4QmJpK25hY05RckxWaDY1U090enIvT0VJSjNvem5C?=
 =?utf-8?B?U2t3Qmtienh4eHBMdTZYdU5JQ0I5RW5lZ3dvK1huQ2ZCekt1TFR6K2FBOHBy?=
 =?utf-8?B?MEZUWHVlQ3lWakd2TWNXejA0WUtNKzBNVjFEY3hUN1ZUbFk1SUtIKzdGOUJO?=
 =?utf-8?B?UW43Mnp5YUhmSjNSZ1Bia1JWdk42MG9MQ1AwVEx6aTgyTlV3dkFQdnBod3Ru?=
 =?utf-8?B?VXFNcmVjVFplZTZRaVF3ZEtnV1puS0JnbXp5RmtEZTdYdWhBdEljM0lxU3du?=
 =?utf-8?B?R0VoTy9yOXRiK24xeFh0UGpUWlJjTTZacm1XSVJIV25qRGxBelpGbTZsUFRx?=
 =?utf-8?B?MnFqYmdyenRPOXRaNVRlZkUyN2tURHRtZWtsclU5WFJucUNlQ1o3ODZ6RVQy?=
 =?utf-8?B?elBOYTEyalp6RldNdFMrMktsT3YwekVlUWplMUhVVjlMTC95U1RWMXNLWWNK?=
 =?utf-8?Q?yVqTN+4LFkBPFmB0=3D?=
X-Exchange-RoutingPolicyChecked: ZId7S9SrcDesVUCJYQ1GMcdMOk9wOgu8CrqVRJZptp1N6XC3bmMk2qe50GagbGv0tTpRJ8tEdu86i7rJzu9uVI72NQlqJ+6biVXG0UkrhLqyb2I7KVw/WWajcfA6d0wepQZa3uEaVtpLZ5x7yQ5dJoi1jgY5ANYb9f1R2Jp2Dcob9dFClFnRjOo1SY0e2IC55MiymZiWN3Tz4u4bRXrWvfXQvguIyspB9cv3RC21jQ7R6cMaOBHW3gHeCOJ0BCSpYrZV/2WRA+XUov/sBMKyHCdBTiTbo6SngyExE5eBc7/B1X/wUAHlHCSot5H3vMiMgoT90jTiEtiSb2WdEqU0JA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5ae4e0-8d5f-4346-8530-08dec812dc78
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 23:40:46.8753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtoQkF10g7ZYwrt+YA6DG8l6rXGoegAl6Kej0obQ264gWSWuCXsmAgonnlE3XluHMU2wIMelr2UmTK7RpNqL9cy3/PFYWxMJXIoiDO93AAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9537
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> Privilege Level Zero Association (PLZA) is configured per logical processor
> via MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc). Software must program RMID and
> CLOSID association fields and their enable bits using the layout defined
> for the MSR.
> 
> Define MSR_IA32_PQR_PLZA_ASSOC and the RMID_EN, CLOSID_EN, and PLZA_EN bit
> masks in asm/msr-index.h. Add union msr_pqr_plza_assoc in arch resctrl
> internal.h

Above paragraph captures what can be seen from the patch. Please check entire
series for this since many changelogs in this series verbatim describes the code
changes in patch without helping reader understand why those changes are made.


> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index 9dc6b610e4e2..623628d3c643 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1287,10 +1287,17 @@
>  /* - AMD: */
>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
> +#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
>  #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
>  #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>  
> +/* Lower 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
> +#define RMID_EN				BIT(31)
> +/* Upper 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
> +#define CLOSID_EN			BIT(15)
> +#define PLZA_EN				BIT(31)
> +

This is unexpected. So far resctrl has only defined the MSR numbers in this file, not
the individual fields. This seems a legitimate use of msr-index.h but creates inconsistency
with how the fields of the other resctrl registers are defined. This may be ok so I am
looking past this for now. Since I am not familiar with this use I am looking at other
patterns of this and it seems that the register fields are usually defined right after
the register to make this relationship clear and also use more verbose naming to establish
this relationship ... I do not think such cryptic names should be used without context
in such a global scope. Please compare with how other fields are defined at this scope.

> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index e3cfa0c10e92..1c2f87ffb0ea 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -222,6 +222,33 @@ union l3_qos_abmc_cfg {
>  	unsigned long full;
>  };
>  
> +/*
> + * PLZA is programmed by writing to MSR_IA32_PQR_PLZA_ASSOC. Bitfield
> + * layout for MSR_IA32_PQR_PLZA_ASSOC (Privilege Level Zero Association).

These comments are valuable to describe how resctrl should interact with
this register so it would help to be specific and document any and all
constraints.

For example, I seem to remember that all fields except PLZA_EN are required
to be identical on all CPUs. Please document that and any other constraints here.

> + *
> + * @rmid		: The RMID to be configured for PLZA.

What does "to be configured" mean? It seems to imply that when resctrl
writes to @rmid then the setting does not take immediate effect but would
take effect at some future "configure" time?

> + * @reserved1		: Reserved.
> + * @rmid_en		: Associate RMID or not.

Please elaborate ... what is RMID associated with? What does "or not" imply? 
Here it will help to document relationship with MSR_IA32_PQR_ASSOC.

> + * @closid		: The CLOSID to be configured for PLZA.
> + * @reserved2		: Reserved.
> + * @closid_en		: Associate CLOSID or not.

Same comments as for RMID

> + * @reserved3		: Reserved.
> + * @plza_en		: Configure PLZA or not.

plza_en implies "enable" but the comment mentions "configure". Considering
the other fields are "to be configured" there seems to be relationship but
that is not documented at all. For example, if @plza_en is 1 and resctrl modifies
@rmid should resctrl write "1" to @plza_en again to "configure" the new RMID?

Please add specific detail to help understand how best to interact with this
register. 

> + */
> +union msr_pqr_plza_assoc {
> +	struct {
> +		unsigned long rmid	:12,
> +			      reserved1	:19,
> +			      rmid_en	: 1,
> +			      closid	: 4,
> +			      reserved2	:11,
> +			      closid_en	: 1,
> +			      reserved3	:15,
> +			      plza_en	: 1;
> +	} split;
> +	unsigned long full;
> +};
> +
>  void rdt_ctrl_update(void *arg);
>  
>  int rdt_get_l3_mon_config(struct rdt_resource *r);

Reinette
