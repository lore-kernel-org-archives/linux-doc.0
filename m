Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271B1306774;
	Tue, 11 Aug 2026 03:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418962; cv=fail; b=Q1AzvXKHO8M0H7yPvmuNWhvdZsdafTcugPChMOhW7WrQ8q05h6yczd7YdYMGhoMKNLZryKRSfFO3f7IobqwaFg1TFjBY/akGxTzlpAdReHsXp2RW+hpm72yeGE6N3v03igw8MYLIdRYXZzBgqqboS8NfW2MBDQpBCioRcsuJ+/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418962; c=relaxed/simple;
	bh=I3ycl39+rIf142vwYJXQC9h/XMTK/lWEPrGQqp7Dgps=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pfMizldSWUIOtPL3UVtzYqD5V1LzVTyKLjHdjdCQqFUz5B0juAQluoIHrKBlyQxYIUwD0SwAWGKFjT2BgfBWKn80DLg7G176Z6osuP2RTHdKy0UAeYHJAOytSr8LVkxnldlSDR4GKD+2nUMwT6QVKF4Vh2TRfXPQynF973+1ngM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+J5PBvm; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+J5PBvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786418960; x=1817954960;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I3ycl39+rIf142vwYJXQC9h/XMTK/lWEPrGQqp7Dgps=;
  b=j+J5PBvmQChpFXuehoRyxqo0ctFtI+ZuyfLZSYDlG7WESEitdm1Ldoel
   Zr6wbERKiVFipC2X+eWMy2Ekc6j4LdhJZAGPNAiaiHfJu/QA0b+mpmdNz
   RGnTIDX6JHgtY5Mtitoi5qnCtf6SY1rJluoOqk4aK+8StLWfLRJ/DguhF
   RCbcGUwVx3TGC8IqmVApb/rm3RMIbnPta/M783d62jyw/CM9iaCEwOHK7
   BP2+8/tSmvxgNk1iOnOw5m0OdnouztLU5xUygjIcK2e59b2fAZwJoMfXW
   c4uZBmIL0h9L36vwZWW1I7a/t0kEzfVC8voWiuK3XHA5ALChgara3RnCM
   A==;
X-CSE-ConnectionGUID: mm0zQLlYR9+JjsLQ85Zcew==
X-CSE-MsgGUID: GwKtD5vSQmmxCCEKzB96og==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="109730800"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="109730800"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:29:19 -0700
X-CSE-ConnectionGUID: hCjiraS/T8Wd2KzzDjde2Q==
X-CSE-MsgGUID: SlSKh/19T+C7FysRt7hBOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="301436744"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:29:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:29:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:29:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8i7iKVS8zVxAlHZATJqs26bnvVCM/Rh/yBcp6RmVRxnbw4c+5y4etxhykxJWL3Y+8QThDsOb3C/gVm0sxLolb434KmibH2FejFJO5prWzCJaqjyAY+qXuDlddxMMqb7WLzSFv7y4ocaOBiXB2EECI7nXusjEH/1SSIV4Evp+V4vBjiSe8hfyslezO/FX5TrooowJhLAgp3EFt2iY+zD0l8rL5qovt7r8zeKN2tHnqwnsyVQMQ27M62O3L/fHAo6gWJuE2LBVTu98sdjTgiSYOIkrEyw71RFXueA4E4vbVDejFxNniMfnEGvEkbPNLczNxwlQVrChoBJM0z8LxlqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0msxc9s17qaYpSP0mZZiwa+1sjk0DLLNNA7Hk6pOsQQ=;
 b=AjerQnu+RVPO7drmIr79kbaz/D6RQ/SQkC/MfxczNXE6ITKP8C9/iLSx8Pupn1OzwuAxjw762jgLR2sIVGDZ4g8ys/TR4724cET3sb5jnUt6i/9Z3KqQrEzdwWWTqJNpNE+zD/PVWGgl1WNafx+X8vYNPonmTWrwUewAynQSCJhOo88tGKA8NcpH6OpzyHsbDYD+MyTmYHVDc8fdgnP9IR2kkI2GSzXp+p5WEsD6Uj9sgEapwoIx/lzH96pz8/LRg6jfa3Wxmn5cyIuPWSSxES+qOlWxT3kFo87m6W7h+dDH+XxXIIooLWWNhUG69LMUtAMBDtUkZiV9z6MzKgH+0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:29:11 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:29:11 +0000
Message-ID: <d97f9c33-519b-49bc-996e-b73ef197953c@intel.com>
Date: Mon, 10 Aug 2026 20:29:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 10/15] fs/resctrl: Reset the kernel-mode binding
 when an rdtgroup is removed
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
References: <cover.1783461016.git.babu.moger@amd.com>
 <89a5b2cf3b727d04591d49775a88ba38be57a5f9.1783461016.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <89a5b2cf3b727d04591d49775a88ba38be57a5f9.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b00050e-1071-48b4-ab5b-08def758b5c4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|22082099003|18002099003|11063799006|5023799004|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: mlrHe0pwIguOBDizuaYhjvD3389s9W3QUXJmJiEY7LGU3Z7d4auRBT7cOkcDnWOAfIdPyXWN0/a5B8Zr/k8kJlbH3d9XeV3YtszR0DFagrM0ukoCIknVEo8nLmvRjbSdKbS0dM0TxHf2ZFtSNSjFBdqyVSJxsUd197GufAiIvqbP6FuCSSKCMCt9U1LqBEZQi2jYJzlNl+co0YPJHaMPHfbUTauazkRjqKKf1iHhplJkHmQpNY53QVVKxGUSmHPSBLeCNzePbBw1hdPXbFWNYuSkBSGAtsXvbz40ybEB3+cfBwrROrWbvaxmjdY1Mt7NiZyxk3xWIPfN8h9jMTSo3jJ+etG1OrGHoUMw3SagjfHIIbmbnSDkmQ8cz/no+3/tf/w6heaoq3d0ems7/7SrRylGtTLP2J2/R0gSKxH4OXokO6T90AH0AKIheaH2i3456X+4XkFFp49kwtRp35/nbfqxAlZlIabjY91As0svA2udqJNF3Vv3RVlpZTqqiddeQgYAZGrMErF1h0eXEKFo49uBXkOmNddJXlJcJTTAtj4jhAJgB7vJFNBWB5jUeqsEvohHRV73g3t/Es0mPyLPWn9yIohsDRZSZPiaIhhdZzceiFBxrw2jNvmdai0mh9rJ1ZmzRO5MJC/hxeRUdVcRHdKl8e7gJWxTeV9AvDY+BeU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVNqOW8zZGZWVW1NaE9jbGV6eTRkN1R3RjhPaERYSEVmUVpxa1pWZzhsNGZr?=
 =?utf-8?B?L3JPRFJVN1dJN0hHZndBdDBxRCtUY1VBQkJNd2xPWGE3WklIQTl4eTRHL3lE?=
 =?utf-8?B?eXFwYUpRclViZmJ0YXBsaUJiNUZTNXN3bERwS2FIa2dhTExSSkJBWVk5dUlq?=
 =?utf-8?B?Y3FFY3VnbFVDQ2RlcmtJNjE4NWN0S0w2cFlzWmlXSld6S3E2V2ttMFRFK210?=
 =?utf-8?B?UW9mNXBVTUU3UU1zTnVFTkFWN2dXQkFDc3NtcFJqTTluckg4NEEwZ3h3aUNX?=
 =?utf-8?B?MGdyQk9saG54ZmlCaUJKS0RTNDdnam1MQW4yY0lRbjFaS0VSR21seTc0T3Ra?=
 =?utf-8?B?UklxNG5ETEY3MkhXRXJxYTFZcnNaTmNTMHVwL0V3aFRuRzVUTzg3d1h2QlRm?=
 =?utf-8?B?dklWUUViK2RnaTRObWdDOFJMMHByd0t3dTB3ZVQzZDAyZzVib1d1eGNhSisr?=
 =?utf-8?B?ZTZTZ1NpcjUvVVpyUHpndnFSMGV3b0ZaYkd3SUVQOEhqTXpNd3R1WjJhSDlK?=
 =?utf-8?B?NlJTZkhTZjdUQnpiQ291Nis4aXFhV0Z0aWtzY3hZZStnd1pLTEVxajBZY2kv?=
 =?utf-8?B?Nkg1aS9KTlUrNGMxMW1NRFRDeWZIYVVnekVRay9mUHBEa3U4RFVMMTBiL3Nx?=
 =?utf-8?B?VFVIalIwZGxnbWpPMVNNVHFGNHJTUW1pbXdmblhoRFpsTUhqK1E5TDFNMVc4?=
 =?utf-8?B?NHRwbXhsbVBSTitrRnU0bmV2bC9DSHRSK2RUNHNUaDV3WW9EaWduamNNb2t0?=
 =?utf-8?B?S1RzelljSVFDelNqNDQ0MngwcUlvRDdvRy9OOGVHMlJXVzBaczZncFQ5dExM?=
 =?utf-8?B?dld5dnZzYnNtQzVKN1puZ1dva3VFRDZuT05kZHpaY0t5VnhMS2N4NGg3cE5V?=
 =?utf-8?B?UmxoazNHeWJQbzVLTzR4dnBOd0pINGQ2NkhhbE9PY01saHl5bWxOS0ZwQXZZ?=
 =?utf-8?B?ZyswQUJUS2w1YkhVeFMvS2VmS2NhcDhLeTNQcGxZSzErR3ZhRFIreTllYXBG?=
 =?utf-8?B?VU4rOGF0KzZ3cEVwa2lnZ3l1MmRuOHB5UEZ5dHNuZENzbnFaR2dNb2x3NXdS?=
 =?utf-8?B?TGNUY3l0UnoyYmVtcGFCVGJtZ05wTUY2VFJwK1ZFTE9oa1JqMVZqMUZTR0t0?=
 =?utf-8?B?YnlVazlHK1RqaW04Z01sN1c0MlArZFowRUdEd08reit6NlYxTkgxRG04TEVx?=
 =?utf-8?B?dFpzTWRWVEx0VzMwcStDUUY2ejFpa1Nsbk9HQVVWbnB0ckwzMERac1JQb3pO?=
 =?utf-8?B?T3pEd2JPQ25oRFAyQ3BtYk01TWcwM1c1NGlDWFJWMU1jOC9ubTJSVnd2Rk9u?=
 =?utf-8?B?NFdaTktrZnAxd2VEM3dKNlFHTjV0NXNCenRQTG5TNzlMZm5OZ1ovaEdRRTMv?=
 =?utf-8?B?ZjhMYWE4bTI2U2VEQ1VRMklieVNFQUhUSml3VDlFYXlPVlBBOHN0ZzEvZTdx?=
 =?utf-8?B?OU9mUFBLdkRCRlNKQjVyVEZ3ekxjTUJ0VElIMXM5L1BGUWh2UUlZUXNjN3hp?=
 =?utf-8?B?Vit6dnBIUUdiSlZBa3drZUJ2Kyt5UVhPbmpBN01vZHNrZDYvUGg3dkNnOGl2?=
 =?utf-8?B?MkNqYkVmNi84ZDZzQTlHbjVJV0NHdm5jNGJBSHg5NUhvQkRYUUorNUM0OVg0?=
 =?utf-8?B?a3ZCZGpTSHlYRWtYY09VTWtJVFZTSWpqSHBNbW9Udmk2WDhTT211VDNMYWp1?=
 =?utf-8?B?bXlsc2swa1hLSTBoUHcrZWtvSjJPL253ZDA3aXJQcnFKZHN0R05vd1UwY3JJ?=
 =?utf-8?B?RWlhWDBGYVAzdzB0a3FKMHRoMnoxVUpIakI2ZmMzOUJzYWEvekJKLzVWWStZ?=
 =?utf-8?B?Y1dMWXQ0WUpNRUlCamxxKzZFNlhMUU96VVpLZExrbTNBbmJFNkhMeVZvSXZH?=
 =?utf-8?B?SGw4QUdqemdKSFN0Mjh2WGF6SWdpVWh2WHRjT0VrcHd1L2VxQm1vS2o0NGR2?=
 =?utf-8?B?RWFVMnkxME1XSFg2VVFGaEI1ZURIWFhxc2ViUEc0WUM3K0FQenhNRThKS0ZQ?=
 =?utf-8?B?OHNkNURRY2dTUUowZWxwY05lb05TNHdzWDhYY3FHcEhKRmlwRXVpQ2p1M2FF?=
 =?utf-8?B?blU1OE5STzJuQVp4MUhJQW1ocmp4dS9qZ3lmUGU0TCtxN21zeWs4UnVVbSsw?=
 =?utf-8?B?Z29ROUpZYkc3RDlLZEZkdHJDbzhXUUNvS3Q1emdjVVp4ZGVpSEt0eW9rQ25I?=
 =?utf-8?B?T2syVDBVWGljb2lXVmxsdlkyckdYaGVlaHU4ZnJjTlpJZ3NZWkM4Y1hPOU16?=
 =?utf-8?B?MjJ3Ny8ya1dQUDFhbjdVWVlkVSs1RG1QK0U2S083bmlKam45MWtYenUya2s1?=
 =?utf-8?B?a0c1T25ZN2ZsemZvY3k5ODBtZUNSQTNTMUpPSUxwTGo3T0cvdFo2YkRQd3hz?=
 =?utf-8?Q?xEY8tGI82zcKi1F8=3D?=
X-Exchange-RoutingPolicyChecked: gImHdUO2S9Lokt2knc8t12w+CHU1GOGP3djFnbM/YwWaMAhR69PcHyTnNZi7jt7vle/o4z7giaiP5xg+uReyrrhIuQYq89lsCMoMAttgVJOimKUtNgOTWKdhPUCZ1p7qArHz8uBSLIe1MA0050s2GpAu5ZtQKXkTcg6ytbKNIVMQbjR3Jkxw4pa62hRe/Uz610wj0lq78B1C0fnsNhMATVhcsR67AVB41YkIFGGXoyggtMpzWHETuCVUH2F9MdgpFn4o3Va+CXfwBBc+KIJAqqR1T70tnxKP3Kf3fpgwQNmnlSBbbR+XSCeywcaa1rOCTDR1bTnsmQXZc4EEj7jing==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b00050e-1071-48b4-ab5b-08def758b5c4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:29:11.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOkkRTu6Vc3+1oNVRil5HJIR0x2SrH6RMqTjB+x7z3ZGUO8+T1FsrpSRtmA6QK0ahcFW2fUOtHSOCItXplC4YbhxOa1jOb0SFJ0koeSJeTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6919
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> Resctrl keeps track of the rdtgroup backing the active global kernel-mode
> policy, including the group's CPU mask used to program kernel-mode
> associations.
> 
> When that rdtgroup is deleted, resctrl must update both its internal state
> and the hardware configuration associated with the group's kmode_cpu_mask.

Instead of updating the hardware configuration itself resctrl fs will request
the underlying architecture to do so.

> Introduce rdtgroup_config_kmode_reset() to disable the active kernel-mode
> association for the bound group's CPU mask and to clear its kernel-mode
> state. Invoke this helper from rdtgroup_kmode_detach(), and reset
> resctrl_kcfg to INHERIT_CTRL_AND_MON. Ensure rdtgroup_kmode_detach() is
> called during group removal and filesystem teardown, before the bound
> rdtgroup is freed.

(Same comment as before - please do not describe the code details and write in
imperative tone. Please check all changelogs.)

I think it will be helpful to add reminder why "reset" call needs to
include all the existing assignments. This could be part of resctrl fs "contract" 
with architecture on when and how it calls resctrl_arch_configure_kmode().

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Re-wrote the changelog.
>     Added the call free_all_child_rdtgrp() and rmdir_all_sub()
>     Simplified the code comments.
> 
> v3: New patch to handle the kernel_mode clean up.
> ---
>  fs/resctrl/rdtgroup.c | 62 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 0d5c94169d03..21659fd75850 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1127,6 +1127,61 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +/**
> + * rdtgroup_config_kmode_reset() - Tear down the kernel-mode binding on @rdtgrp
> + * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
> + *		May be %NULL when no group is currently bound, in which case
> + *		this is a no-op.
> + * @kmode:	Kernel-mode policy currently active on @rdtgrp.
> + *
> + * Reset the kernel-mode binding on the CPUs in @rdtgrp's @kmode_cpu_mask.
> + */
> +static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,

So far the word "active" has been used a lot when referring to the "active"
kernel mode. To complement this I think it will make this work easier to
understand if this is renamed to rdtgroup_kmode_deactivate() and to match
it rdtgroup_config_kmode() could be renamed to rdtgroup_kmode_activate()?

> +					enum resctrl_kernel_mode kmode)
> +{
> +	bool assign_mon = false;
> +
> +	if (!rdtgrp)
> +		return;
> +
> +	if (kmode == INHERIT_CTRL_AND_MON)
> +		goto out_clear;

When kmode is INHERIT_CTRL_AND_MON then there should not be a resource group
assigned so the work done at "out_clear" is not necessary?

> +
> +	if (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU)
> +		assign_mon = true;

Could use the same assignment as resctrl_kmode_online_cpu() and kmode_cpus_write() ?

> +
> +	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
> +				     rdtgrp->mon.rmid, assign_mon, false);
> +
> +out_clear:
> +	cpumask_clear(&rdtgrp->kmode_cpu_mask);
> +	rdtgrp->kmode = false;
> +}
> +
> +/**
> + * rdtgroup_kmode_detach() - Detach @rdtgrp from kernel-mode assignment
> + * @rdtgrp: Resctrl group being removed or torn down
> + *
> + * If @rdtgrp is bound to the active kernel-mode assignment, disable the
> + * hardware association programmed for that group and reset the kernel-mode
> + * to INHERIT_CTRL_AND_MON.
> + */
> +static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
> +{
> +	if (!rdtgrp || !rdtgrp->kmode)
> +		return;
> +
> +	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
> +		pr_warn("resctrl: kernel-mode group not valid\n");
> +		return;
> +	}
> +
> +	rdtgroup_config_kmode_reset(rdtgrp, resctrl_kcfg.kmode_cur);
> +
> +	resctrl_kcfg.k_rdtgrp = NULL;
> +	resctrl_kcfg.kmode_cur = INHERIT_CTRL_AND_MON;
> +}
> +
>  void *rdt_kn_parent_priv(struct kernfs_node *kn)
>  {
>  	/*
> @@ -3215,6 +3270,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
>  
>  	head = &rdtgrp->mon.crdtgrp_list;
>  	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
> +		rdtgroup_kmode_detach(sentry);
>  		rdtgroup_unassign_cntrs(sentry);
>  		free_rmid(sentry->closid, sentry->mon.rmid);
>  		list_del(&sentry->mon.crdtgrp_list);
> @@ -3252,6 +3308,7 @@ static void rmdir_all_sub(void)
>  		cpumask_or(&rdtgroup_default.cpu_mask,
>  			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
>  
> +		rdtgroup_kmode_detach(rdtgrp);
>  		rdtgroup_unassign_cntrs(rdtgrp);
>  
>  		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
> @@ -3347,6 +3404,7 @@ static void resctrl_fs_teardown(void)
>  		return;
>  
>  	rmdir_all_sub();
> +	rdtgroup_kmode_detach(&rdtgroup_default);
>  	rdtgroup_unassign_cntrs(&rdtgroup_default);
>  	mon_put_kn_priv();
>  	rdt_pseudo_lock_release();
> @@ -4149,6 +4207,8 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>  	u32 closid, rmid;
>  	int cpu;
>  
> +	rdtgroup_kmode_detach(rdtgrp);
> +
>  	/* Give any tasks back to the parent group */
>  	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
>  
> @@ -4199,6 +4259,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>  	u32 closid, rmid;
>  	int cpu;
>  
> +	rdtgroup_kmode_detach(rdtgrp);
> +
>  	/* Give any tasks back to the default group */
>  	rdt_move_group_tasks(rdtgrp, &rdtgroup_default, tmpmask);
>  

Reinette
