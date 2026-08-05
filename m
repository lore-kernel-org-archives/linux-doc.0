Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC983CDBBD;
	Wed,  5 Aug 2026 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785906221; cv=fail; b=dwz/pZNcIpqm8Aw9gvWZdQvWlD1wDYmF/kQ22k2Jaz9V2TI6O+IWuKsPJaZQD8Rb6ytz/sFfrsA8nOpdybSfn7poQzxJHTwUcQG0p4sBmPb+wh1SbKfrmqaDghRVYnOb9kibkLBSp2xJUwEdjoBeZvYMOuEzuTozakNeWgsFZ2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785906221; c=relaxed/simple;
	bh=wkO3t3BVr1WDU+J45O4adcNy604pjWM/M5Xd7s8MRG8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cx2U6xkgg2FxgLMGA/choFce6megKhOUxqRhc6m0c7nbG0tf409WO0It+UlIP0jDLsIh4oyRVmgXZBxRSec5biPPUdMKwfklIbogdC+7yGySnLoU4A5ScemT2n2vdh96jHP+4SOpBegb9HiwFxNwYm04VP1miEPjmfg9QQt2eyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WL1nmraW; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WL1nmraW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785906220; x=1817442220;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wkO3t3BVr1WDU+J45O4adcNy604pjWM/M5Xd7s8MRG8=;
  b=WL1nmraWYf19wdJwltQu3KlmhRbk6oLxCThlwHz9wYgppZroCi6lxodD
   2FfBRj+FfZhvYROj4rPSLDLMkJOXKF9bv1r8djQHmb20Z9K78vxi8jhH5
   VDtxheAVlzF0EHu9wqDEqeFpR1fFcUF7AeZgGxk/IMzcE80hZ4I8SQtB0
   lruGU8XnyQJmtEcsW0R6TxA8rfZNox4U9uoQfHi3EJwd+Mui+C6qHkudd
   ExljczK9ORzGo+/+B0X/fKsbZI/68ao1n7Vqdt/liQb3At4UxSa7yzTGY
   Xpyz/s1FM3e+42q+5X9/v5vrV0xgqETJgvic6pZfqS+49Oc+jIPBL+8Nu
   A==;
X-CSE-ConnectionGUID: 9Q5RCC/dSWu6UijGbJ2dEw==
X-CSE-MsgGUID: m7R7lvQQTzqFBuczKWLY2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97629719"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="97629719"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 22:03:38 -0700
X-CSE-ConnectionGUID: OJf1qXGqS6qEWhcO4ljsbA==
X-CSE-MsgGUID: Se3Z84RoS1SSR5XW9dBWfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="259943368"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 22:03:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 22:03:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 22:03:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 22:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d60nztHrWOOX12XzNBMpj+EgAtJqDXQftMCCo5xrgalKD/n4xJ5zrFo8EvQDMihKy4qtYhfrHXStNW8rV3BGaVEGnn5lKNDqq7r7iU1X5UTKHDKDCWxP7rMXv2mK+9qnb3eGwFrcgSGzYCZQNck7awqFzyUNHAPa5DBG6cKgNxuual7iZQ+IV5FlMdgwF6Q6ClU/YcZ7BtVSZPPsqDxG/II4DTIemtk4D/7Lwp6ck32S7ZpOerNEmAjF6R5YDT2EMOI2Rva+jEEFk2goC60MC2b7NK7ppEzDVpFzerxbw0M1giP0CGxg3hqxo58mEXKKKUE+IEyVQDSCHjclpbD4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iweOWRpZF6TeneiATffduI/XDCxT7H5rDC0kZ5HclVY=;
 b=offOruoQ6TzLa4Y+tid+YbUiRyX3bUBX9l2JfSbGF8TeHfFOfsxQ3itVDgWx9lRmPXXGMxiN6GlK3fPF5NTjV7NfhVdsFPvLSHbfkhH+jitoQGDVnTJL5360Ver+XL6NxjhJPgMIjDlUQxrNsAJrB3IpAko8bm3SPSlGzR0eFNIf33scnkdutF6eqQXZbX4nL3To6sfXEm63ugRbUEAK6tfxwaeTlZQL/rzBYI5AcmdIOsFYQN9ATcV1n8lvXl4y2nGiCn7BQY7G+cKE++b+lbJyMMqhtIHopHDrTe/N6u26nBkeoxX0nqhxLSwZaDfd4GiY3Lb1q1q6ITpvAme/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 05:03:28 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0270.016; Wed, 5 Aug 2026
 05:03:27 +0000
Message-ID: <51cb5110-d55f-47ab-9fc5-78e36416a550@intel.com>
Date: Tue, 4 Aug 2026 22:03:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: "Moger, Babu" <bmoger@amd.com>, Borislav Petkov <bp@alien8.de>, Babu Moger
	<babu.moger@amd.com>
CC: "Luck, Tony" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
References: <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <b067caec-4e20-4095-a7b4-eecb5d8594c2@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <b067caec-4e20-4095-a7b4-eecb5d8594c2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:303:2a::8) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CO1PR11MB4787:EE_
X-MS-Office365-Filtering-Correlation-Id: e33f6be8-7b27-40e4-ab5e-08def2aee2ba
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|3023799007|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: ZEwLixYByjDysZAyMSYpUb7LEFw0AjsZGM8P4euDzfmg3qPJ+DFMNrONgp4mcMjEjoicHom2yPuvCRGl0Nx7ts72ukCbDAeO9m/upOvbQkYkzyYPGX79UE7THcUKzY30mEwweUNJm4Rbgmg5vKGbE9ChZzG1XYVGvD6dkFRZRExJ91tPaj+drE5wCoteaqJqUFxBPdfTfK7681f7ZHf7ADobSRBe8xF5PvgwXbELVQamHpkJJv1+Lxes1gxiCYvvtZM6LT9A9TA+pEqUe0bHWYyvIP1xxNTrFzfb/+0Me3mwCT3ln9YIQgWCV4OR1e4SuRSaebVmZBUXVWe3qT9ZIXJpXuoEvSDM2WQFeioSh3t5RJXO2m75XuDBOwmJhRDGrQ8IYDvz/Ks+Yj/ifGCz60FNGwXi/MlIJeM14ObuqScChKbFco4oAI1GY5C+sp5DNSVsleVhlxqbsFPro2y1extwHd27Gq6V7aEwhLFNy+h+hLUBM7wGzuRO2oVo2naaR+FGCX+aTpoebPw1uzRpFr7ZQ94uHITZ0UApLPiLW864dQNh6rzdqmmWopoNYHk6hITL58y+Qxjjp3ZogJZisGfpXDEgL7B3I0IsoQwytpZB4AP9DP+Jfp/91/SRHA2/0cjKJweD2pY/J4yE1yB0fJ4rsK1LInXwmunrsBk3eVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXArSHg5bHJyeEY1Rzg1dllPQW02ZDd2UndIZ25vQ09qSXpzKzYwR1dtaXlM?=
 =?utf-8?B?b3VRYStJVnpFMHZ5N2RhQmgwNVlqS0R4dzgvZXZxSWttMVhLazRqYndHZEFl?=
 =?utf-8?B?YkFqZzYwQUd1Mk1USnpYTWcxK1M5NmVBNDEweWhwOUJwdWUrd09ldUNYV2Q2?=
 =?utf-8?B?Nkl2czV1KzAraVVGQVpldGlLUmVlV1ppWnNtRUF4MHJrL0M2dUtpME1jTy96?=
 =?utf-8?B?RXZjUUltbHBqNEkwaHhGclh4MnIxSUlBU2MyR0h4aG9tMHN4UWNpNmRDOGc5?=
 =?utf-8?B?ZENSQ2t3bDFMd2RBY04zQklOdHVSUTArT0dHRmRsbHMwTlpGUDlsTGxqeDc5?=
 =?utf-8?B?SzcyZE9GWEFHSk9uSnluNkV3L3QyRTV0d0xIRTV1YzhOTU9HQjB4cS9aZnFs?=
 =?utf-8?B?eG1yUS90N05QTGRKNUlvRXpIQklYSUFYblZNREhIYm1VMHJQRjl2SmZVc2tI?=
 =?utf-8?B?T3NvTHcvNDl6REp4YUQvOFUzNUVGcGlld2RiL1RXaGJGamlUMFB5TjZOa2pR?=
 =?utf-8?B?RlRWUDVlTVZscjlQbWZBSEZLVmhlOHRRSHM4R3ZQaVFJVFYxaFhRdWhtQm9L?=
 =?utf-8?B?WkNoN0xVdjd2bjZuREhOMGdnT1BDOHdkNGhla1JRRzkxdHZXeUUwWXNoZ0hp?=
 =?utf-8?B?ek1NL1EwdFNoeENKczE0RW56dEt0djJuTXE2Y3lqMEx0Tjk5cnQybHJaNEtO?=
 =?utf-8?B?bFNES240SXRkWnpzTUx1VnFtT2ZJSzJGcUV2QysyOVVmTnFsbjk1eXdSd2dY?=
 =?utf-8?B?MGt5cGhLYTN5bVdXZmRHcWNwbWFJUFpkYmZ6L296dnJVVHYwaVdpL09WUEtp?=
 =?utf-8?B?SWdwaytiaDdvdkRBWDlaYVpEQ0J2cVRsVTdDOUMwdHM2WFhSTXpPOHcvUHdj?=
 =?utf-8?B?RmVkNFVkdXovdDJNS3krU3RPMy92SWE1V0p2VjB6QnJlcjI3UDJsYWMwZUlG?=
 =?utf-8?B?ekFNVWViWkc2RW53TGxnVGtLNWI4N0ZDdjRWSkJjbnBMZjNLRjNpaVc4ZDFN?=
 =?utf-8?B?YXB2ei9rYVRRbnhVb3lIOXgwV1gxVUhNSFEwOXROR2pDbHRQVDR3SGtmdjhH?=
 =?utf-8?B?aWFWYTBjL29TU052OGRpTUxjVnB4Z09BdnBLUTRtNUQ3SWVnVzc4R0l3d08x?=
 =?utf-8?B?QW5yUGZPSkFBMXB6Z1N1Z25hVGZsUVl6RnZnZU5wbkdsM25IYndtSnNPR0R0?=
 =?utf-8?B?VE9YU3ZldnNYbmlXRHhRdjlsZ3FZOTdZUUYvU3BIdlh6UHBFRGE5ZHhjZ2lu?=
 =?utf-8?B?SXNxMklUM3VLampaNWNzTk1PK3NGQjAxWHplbFhUQThIek45MUh2SjU4YkNj?=
 =?utf-8?B?emhJOVhHL2FESGtVMnlmL3pBLzhNd0Rhb0VlNEdvaUt5VWhXcmxWb0x6Y0Fv?=
 =?utf-8?B?dSszZXBsemhQZ1RmRFNZVXQ2T3ZHRVdmQlpJMGp0cEJ6QWQ1d2prZmw1TVcw?=
 =?utf-8?B?cWhnbmVRc0N4d0llTVFhc2RIUENvRkJmemtMdGFaNTFDRFNCSWwwZEN0dWpn?=
 =?utf-8?B?Zkg0TFY3aDdlTm5kVTdTWEhhL1FzYkx2c1BFMm9SbEFwa09RUllOMVlXUEhj?=
 =?utf-8?B?VUZYRC84akdRZjRDdmd1bXBjL1NaKzBkMHJzSVZWeXNBRURaczZteHExUHN6?=
 =?utf-8?B?M3BSVGx4TU1wTGd3c1dqMjNlTDIyTEZWWXZyczJqYkxEUkk5RVBaMGJtUW5W?=
 =?utf-8?B?OCtRdFVWMGRoLzVMTk9pUlk3c21NcjA0TnI5Z0diN28vdDRqOFRseURMVmJN?=
 =?utf-8?B?UVEzOG1lRUk4SlZmOFVRKzJNSUtaSk5mVHJXZXdrYjNHSHJFalBsTGZqQzhk?=
 =?utf-8?B?OVdSRWliWE1ndFpUVDZaWDhrTzdreE9RQy9EZkw4QXN6L2RMMm02VFZMbFR2?=
 =?utf-8?B?MTZyTjNRL2d1M3JsOFFZVWJjdm5YZUhXL3RKbWdta2R2SVE1VEVwZ2Q3ajc0?=
 =?utf-8?B?QmxrTkk2NGFZdWhQVC9kQi9nbEQxVUFEOEVNRThQSTFCNXdwWkprQyt5OVVw?=
 =?utf-8?B?eXZjUXRsUzQ3Uis5WDZzMzB1Qk5aUGpzTDU0YmhWaHdYV0lxTXRHNExpWjN2?=
 =?utf-8?B?bjJUTkNZeVhoenlacjBGTGZrdjVndDVTMGF2Q0trUXNlOU15cUZRUnBhZHVz?=
 =?utf-8?B?aXZVTTFSRElXbUY3YWoxRXk3bWR6b2tBbWg0T0ZYWW03VmdsazByTjRYVjhR?=
 =?utf-8?B?RnpESVVFV0NSUjMya0ZrbTVZbTA0blV4Y3VvQ0JMUEllQnZoZWw5dGsraHJD?=
 =?utf-8?B?VVh0QUU1YzEzQUlSM3IvdFFTWlRjdVV0cmkxOFF0WHVIUEdodXdTOFFEMGJL?=
 =?utf-8?B?ZXp6T1ZiTHBocHZQSWIxcnRzS0x6Sm5waldUUktnTndhaWx5QkhiN01WSENu?=
 =?utf-8?Q?WFSAjoNgj6qPj4xI=3D?=
X-Exchange-RoutingPolicyChecked: phHhdcW3Hh38pFky26stoxYayAHnb7DvqimYBhmkXDOg6euGNkszWwEUf9Q9W/gQXSEya6Ust6z1VnUlcWzdkdh7P29mveBqbY3UVcT/m4QYykWX9yXseAdvVy4Lq/Q5Fx+IDk67IEno9KACpfSLgM3LBXGLY3/8x4F6NIB/uoWH5ZpaU60n8pkeZKazPpPdVfGiMSLMuSsdi5BO7b2r8XRZVYhsm1+aCYusRaQtk/wT6hoA3+FkpBHFZBKVzAlIP1PAx/3PmiGV3p/3XwP4XyUKGG2lYVN17EwiNJQrJWAh41uulQrCNi6UOZ0XrPjbocKQTVb28ZY28wz/wLQ5Zw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e33f6be8-7b27-40e4-ab5e-08def2aee2ba
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 05:03:27.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/tWA877Ck+OxW1zyzTDjgPnw7AQUB4dara/rVZH7FGyhdOj+rStU8Y7UQWFNH1lwg28z+h731SsgF9r5L+lDcgTo+tbRo+CTo9sdW2heBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4787
X-OriginatorOrg: intel.com

Hi Babu,

On 8/4/26 4:44 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 8/4/2026 5:10 PM, Reinette Chatre wrote:
>> Hi Boris and Babu,
>>
>> On 8/4/26 12:16 PM, Borislav Petkov wrote:
>>> On Sat, Aug 01, 2026 at 04:47:01PM -0700, Reinette Chatre wrote:
>>>> ...
>>>> On Intel the RMIDs are always counting. Please keep in mind that these RMID do not
>>>> actually return raw counts that are verbatim passed on to user space but instead
>>>> the returned value is "upscaled" using a hardware provided scaling factor to obtain the
>>>> value that is returned to user space. This is done on AMD (with and without ABMC)
>>>> and Intel.
>>>
>>> So, long story short - and I appreciate the explaining - we should switch
>>> AMD's default behavior back to RMID + 64 counters - exactly like it is on
>>> Intel - and the ABMC thing will be explicitly selectable by the user.
>>
>> nit: s/exactly like it is on Intel//
>>
>> ok.
>>
>>> This way there are no surprises when running any tools on either vendor and if
>>> one wants something special, one selects it.
>> This patch, once minimized for easier backporting and marked for stable, would
>> accomplish this.
>>
>> Two nitpicks:
>> * "no surprises" should be "no surprises (as long as AMD hardware does not return
>>    "Unavailable")".
>>     There is the known issue with the default mode on AMD where return of "Unavailable"
>>     is treated as wraparound by pqos.
>> * "one wants something special" should be "one wants accurate data".
>>     Caveat: User does not know how inaccurate data is in default mode. Users need to learn
>>     about existence of accurate data from outside resctrl via external sources, possibly
>>     leaving it up to the tools considered here.
> 
> I can capture these limitations in the documentation(resctrl.rst).
> Is that what you're suggesting?

Are you referring to the nitpicks? I am not suggesting that you take any action based on it.
I quoted text in a message that I do not 100% agree with and highlighted why. My goal for
doing this was just to confirm we are all on the same page.

>> What is the plan with https://github.com/intel/intel-cmt-cat/issues/311 ?
> 
> I see a few possible options:
> 
> 1. Use a workaround by mounting resctrl, setting mbm_assign_mode to default, and rerunning pqos. We can also document this limitation(Unavailable).
> 
> 2. Reference the commit ID once the patch is merged.
> 
> 3. Reach out to the pqos maintainers to explore any other available options.
> 

The end goal is not clear to me here. Without having a goal it is difficult to
explore steps to get there.

One goal mentioned in changelog is to ensure pqos users have a great experience
when using pqos on AMD hardware. Do you expect that pqos users may want to use
assignable counters to get accurate data? If so, is there a plan for these pqos
users to be able to use assignable counters via pqos? 

I do not see mention of a goal or expectation in that issue and as it is written
I interpret it as "enabling assignable counters on AMD is a bug". This interpretation
is supported by the options you list above.
To me this contradicts a goal of supporting pqos users on AMD hardware.

>> sidenote:
>> Separate from this I again would like to propose that AMD work with pqos folks on
>> how pqos should handle the various text return values to fix the wraparound
>> issue. For example, is the preference for counting to stall at a number until the
>> hardware reports data again (so that user space always just sees numbers and not
>> be surprised by text) or should the text value (for example "Unavailable") be passed
>> on to user space or ...? The current wraparound issue should be fixed but it is
>> difficult for me to gauge what solution users would find least surprising. My
>> expectations from users do seem to be on the high side.
>>
> 
> Yes, this has been a longstanding issue on AMD platforms. So far, we
> haven't found a viable solution. Hopefully, AMD will eventually
> provide support for all the counters that are advertised as
> supported.

I'm confused. Are you saying that you have not found a viable solution for
the pqos wraparound issue? But .... you did not even report it to the pqos
team! Are you really suggesting that the fix requires a new AMD hardware feature?
In the mean time software can address it, no? 
Reinette
