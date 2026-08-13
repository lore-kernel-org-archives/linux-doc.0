Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B78440A0F;
	Thu, 13 Aug 2026 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786656082; cv=fail; b=jn39JrcRbVHwo1uqqP7RGzCdGllUae5+s2ScMKfVMOQFCrLBDIdNvVn9SDajo0p6wE361HV2uy+ucjV8TiE9rPgsMd1PfU1S7I1PI4FHZ5P9ZZb+xypJT1OBnry6jWGGt/A07yy3o4UwE2hWc49WpUhFvKQcswOwxMAfWKKlFTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786656082; c=relaxed/simple;
	bh=4CwEgQxoBcup47d3+lduZyZBK39jCtIWIbci+FuTCjs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AHZIY0E0+yZ7Zud2PcNw+d26/djWpQ8zCIqfG05oCvf9ECN1/anQRE2WCR7u2p5bvWTPzjp3cRWMICsVUHa5gwBvKqvqaSA5xpQd+qke0tD8oMXNEUnr0hzI1wJ3JXyifPwOxYPVHREwu//BYx+dNW4+24nHb1RKh0QfvkOx1zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vvv8t1Wn; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vvv8t1Wn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786656079; x=1818192079;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4CwEgQxoBcup47d3+lduZyZBK39jCtIWIbci+FuTCjs=;
  b=Vvv8t1Wn98APsNnj0SXFvRpYF2MBrs2hvTIS/VojsDtP1N1VY1lpXfkH
   9dJYrYjRM9rys09nqjtlBH4gs0UmGVusd+eMBSwK2L/P+vGJuYGYW0iwi
   HHhiSO09wT+EzVbSO/2Kyb1v7nucQ7vh2dJerriXsL+V+Xrrlj20nnt8d
   przPSIG0H6fC0WydEYOryF7ly6MWoLSIVCLXrOZZ/snsS/sl7SnMkPnOX
   QGjlq2hilUmVyLNOfSj3Ke3PXhBDfpXyDxDSo4K1ncH7xM7mfmZmuuVyr
   25aQmR3ITh6kyCpfu/wPE+4ftRRKmHLANTjh8EP8zkt9ir8X4OU7f2vXq
   Q==;
X-CSE-ConnectionGUID: LAnVByEIRgeoYbPPFW/QNg==
X-CSE-MsgGUID: GaLY3TybSyOBzLKwSZDEoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97906188"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="97906188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 14:21:16 -0700
X-CSE-ConnectionGUID: Fk3gVeiHTfeUomM6OHKguA==
X-CSE-MsgGUID: Hpv2I9k1SMink5JXCobUjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="262312831"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 14:21:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 14:21:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 14:21:16 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 14:21:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg5XrLPPJZGrUKTBHGj1E7pGrWe2khsT+jYKbx6p7BOr4b1xtTDPjG1vyRz0JvhzzyYlx8csG0WBBR0v2DosPsnnF6vmOIxQkNkw+ukVDiMScjYyMWE9wZ0R+7Su+OTz4nli/HrTimp3om5RHoenjcdMMoEYNsbhFgq+kqoBeRmKV28cTX53R3uhJ3cE6JTHc2X8CaOg5ZOMPLKfcJgYJk4AseAPCALgSP+gsD2YpxIcCyqVQ5k23Qcbsw5C67V2iejhMC5JeIY/NTl9rQXQPWF+Aw4MeixD58wbu5MJV8XnA1GAuSFcl8PDR94wQkDoI7dzGfmBEePTfjoNJi7ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s45BLuUcA4IpyxvSLOJAHnFdVk8gBiP0Owkk6KQUaKo=;
 b=uoedIukdWKdEHZIO2tuFyae7r3UF9YTvr8Bg0u+3DTeiwzPxXe708R001Lgtb6kVsB15GS7WJLOGZIc6yHTAyFsOZixDO0tLiLGgky8sk15XMkTkZFbA16RDy5MXAKmM3qly8NIVR2nUxwMy8kgS+S+KV+0VlI4JnFFa1pBqp1w101MQrgDswZFbsySVBiyh4XZbMYEkV6Z6s2F7RbOQNQemKSbWpQgLUyKCkU3ZABQfrL+ILc9XXQuZbGPAvjikclCqPBwnpaRS09QQAuWOwwyLex4XjsUe50VwhCTohDqcTnZ6Yh7OzHS4U4oADzXi7Pqvsy+Fit/PSyV3ZjHrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 21:21:12 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 21:21:11 +0000
Message-ID: <f8165d56-3048-42a8-9594-b82425eca88f@intel.com>
Date: Thu, 13 Aug 2026 14:21:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 13/15] fs/resctrl: Add interface to modify
 kernel-mode via info/kernel_mode
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
 <9916861e5fe73cc8d7ea02ce366b512bc5424843.1783461016.git.babu.moger@amd.com>
 <4203f7a0-25e5-41d4-b6bb-95652540a834@intel.com>
 <9e5d9cb0-fabf-45d9-a0b1-5103559721b1@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <9e5d9cb0-fabf-45d9-a0b1-5103559721b1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 0549d24f-a6aa-4d8d-a323-08def980cc92
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|376014|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: fsqeOvS/SfVJiCR2szHdblDqvzOSV90/RuKi3SBfQYOfq24idEjBybXA0QSp8mbbMTxKD12Dle5gpB9NONIVPQxtHTk0QcOGtAM6UnYnzgJGKtLP1cw7jV7ScBBRKFmxes4ztUE+QWipqRKtLWdx4WwYpPxNenjye7GUL6F9v9uUIaHq//Hb+KBYKw2olosyK54fGmlg9q56Sj5oDhlDlFFUPe8K1iS+5e6FLBqv8E7wiSsMzkCQ05M+RMLXK4/ZDpeDV7bnO8UfLdGExBq405Bu/Jz7T1kwAww7tS16FL6zyCCMUcry6ihKnwKHvf0ogk72VB389thlHGhAoNJCb9PMZOJ7ue4E6FqUzSL/OqV6Hexe+tiqc+eSytaLashpmxL2XPp0ICAFMACfD9Qgk/n43qwXSleQaOCrS08HLF48Pz6Bb0u+36d9CvlHMeUVoGmvo6ACQgLwmCPXFSIxE5ItLuh2ed2jyUIkRPqBQhNcsmEd4sjuywa5ktnrXc3KpnGKRMZOipO03rz3bU1F9l/abYxFVAbz8fAQx7IgGO47gNRTaNW0SoJnYvhjmYtFOPoKNyRkWhBJKwC3SKJnX/KTnqlIsTFABAT6uJmZVM1vjJ6OgyCHWJOCD7wDNIj+M15ohuP86zsxW5GRa6INKalq50P2kitwLDWlT13wMzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW1zcVlNcHNmUk1tQzhEclJXV1F0WFBQZXNNUDNoVFpnMk1SNTYxbzlpWFNK?=
 =?utf-8?B?WFArMENSK1cwamFiV1JSWmFjV2hTSW16UW45azlKNVA0b2xVYlBvanVDZWpU?=
 =?utf-8?B?bm8zWmVZWEF1ak9GU1c3VTFRcjRaSGpCaUtlcnFHNmNQWlIvTUh2SHNzRWc2?=
 =?utf-8?B?RzYrbldBdTJvOThXSWpIL25kTFQwMTlQZ1hHQ0NLcVJ0VVNUQU9XejJyOEVT?=
 =?utf-8?B?bVlVQkhnMG5jVHRjSHFsNDJqcDgveTJXcFMxTWxpV0lkUUhhRnhjZnlYTExp?=
 =?utf-8?B?Tk5RWFl0cG1MWndhYWt1MWx3Yll1RFRMM1ZSQi9XTEs3QUc0Q3o3Tk5LZi93?=
 =?utf-8?B?SE5qZ3RsWG9hVmVKZS9iZzk3ckFOSnJlMjBIelRQbWVkcDdkL2FuQXlMdmdn?=
 =?utf-8?B?bjR0OTRSek82VGFFcVkzMzE1OGhNM2JKRW1qaVlBVE5WK0dnSzNWL2NyejBs?=
 =?utf-8?B?RXlIc3FlR1BhQzJuWWE1anBQa2xIS0hwT1l1aCtWQm1heWJTNkQwNTllM21t?=
 =?utf-8?B?bndIZ05MdGVVMENGZ0JHMVVISjRVYzZpK01weitNRDR0dHhkN2pBM2FMa3Zh?=
 =?utf-8?B?QlRhcDVtbGs2T2czWlRGR1JQcndxT1U2aXF4MC8wbWt6bTNRTjB4TjhZeUUz?=
 =?utf-8?B?WnlxNStVM1JJcUhZblRqekdiL2IxbkJqSTVHUlBwUEU5MWRCWG03SzNiTnQx?=
 =?utf-8?B?RGVub01reTlSKzZBYThzcHNacjV6NHZZOXdPdTF5UnhEalpwODdNcGJnVUQ4?=
 =?utf-8?B?c1o5UGF5ZzR6eTdhMHJ1eUlJSHRsYlc3ZmVoU3lnZDlTbThDSUxvMUdicW80?=
 =?utf-8?B?Z0ptZGNRVkF6M2tsVEdwOGs2RXdxaC9SOUhKdXMzalZFK1hkZGtpaG56ODgy?=
 =?utf-8?B?MGNnVVFiRlNiQWJlVkFVYUtlVjdGK1MxcW5lOG14MHVWRXAyVTFIK05HL1pn?=
 =?utf-8?B?QlVlY0JZVjBjcDdaaFNCK2dXRno3YWlrSU9vYW1XcWU2d2RpTTdYOUZYTGdQ?=
 =?utf-8?B?VXU1VXdIN1dNNzZsZkJxK2lERS8wR29Eb3Z5OTBWVVN0VEFWMktuREJxMXM3?=
 =?utf-8?B?ZC8yUE9kWEVxejYxQ291dlZNVE5VdytWL21NQU03UnBUbUI0UXZlUHJncXgr?=
 =?utf-8?B?Z2NCRnNBdGJkNmcreEdrdUllcjZtNWY5bTlJMC9JeUVFUjNDUkRKYWlHRzIz?=
 =?utf-8?B?VnhGTzE4Q3hGZk5yR3E2TFFCZ2lDYkdnQ2NsK0dIR2wra1ZmVTZyTGg3YWZh?=
 =?utf-8?B?MUhvNWhnWGFnMTlPN3llYkZEQUNqMTIrYTJPeDVnQm9WdDRvRDB1MkFSUnFJ?=
 =?utf-8?B?SG9aT1VRYU9CY29abG5zVndKZVRJVlQ1SDNqaGFIekdPUENFS3BXbk12Qllu?=
 =?utf-8?B?bi9EUm15ZXZmUkU4NzA2blRseEczdy9PRmVvUERsMTBicnNNQkJTNEtJaWNU?=
 =?utf-8?B?MC9qdDA5cWdwTlZkVDlPcG80NDNUbmRVVU1UNVl3S3h0OGdYRFRkNUo0djJ3?=
 =?utf-8?B?RnFGeWlQNWsySnRRYmd4R3VoR294RDd6WXdmbS9aYXh4VVBJcXBkT1FoQmVr?=
 =?utf-8?B?eWgwcGNEb093L0xvMmh6MUxQRlZabmVFOGJWbllWTlg4aVZrOTNMNkNUNkpK?=
 =?utf-8?B?VnpsZXUySm41dGlHQXlNTXVrVG40M2ZybVJnVldhQnJOZkFRRFJucUFtOVNJ?=
 =?utf-8?B?LzIxR1BZMFM3WElDUUlqV01SRXFJUHNXZjJUQmpJMXh1a2tsZlViZk93RTBI?=
 =?utf-8?B?aXE5RDRUVDN5SnhoNjR2MXg5SlI2Z0t0eFJZNzl6OFRIQXVFdHpGMDQyOWhI?=
 =?utf-8?B?OWg0dmtUYUtGWTl0S3lVUHBRQXNDNmhZdzNqV0lXN3I0NDhaSnduTEE4YUEw?=
 =?utf-8?B?eUJPUjg2TmlXOTB6UCs3UEd0anBlNW5UU1l2ME9HYjljQnBlbXJzRlp5Sk9H?=
 =?utf-8?B?L2NGVHpVMTc2RmgzWTJyMnhaa1U4MDNOeFNPdVVGMVFueUhSK3JwQ25tVzNZ?=
 =?utf-8?B?MzVzclFqKzVTOVVnOEVpbU1Bb1A0RndqR0NHSk5sOExyZXp1QjdjZUFhMGts?=
 =?utf-8?B?OWg3R2FFN2E5aHp2V2pacEVqVHZ0L0x3TUk1dDlsekJvSFhKQzAvNExReERN?=
 =?utf-8?B?SVNoT0NzZVZnV05wTjA1aG93ZXVNeUZGYUJKY2tuUXlDNytTWFNIcjJJQnBI?=
 =?utf-8?B?bWFkdk9XeGVvcVlDbDJJWmVuTzk1azB0ZXcvVnNvTGJHK3pCZ09YTlpSdmZl?=
 =?utf-8?B?ajg3NG1OVnZsQW1meFJvY0Zubmc2azRQNXprTTJCTlBhZm9QSmNDeFZ2cEtk?=
 =?utf-8?B?dWxKUkJiaHlZeW5tRk16TERNSytNT3ZKNyt2UlZmRkxlcW9lS01zUHR4SENl?=
 =?utf-8?Q?I8I3OrEvvyz/yMkQ=3D?=
X-Exchange-RoutingPolicyChecked: U4D8au97OLE0+6Fi288pixk1XZFx5sBKfN5r9EAPwezURN9w0x8NdWH8AH4H+4P/niGz7ylM2rZpErv588wvwFw5GgHAxEXNPPNTt7TaRE81OQOvJiB9587LN+pNEeIxzlXfV04ulYgZFseseIJTm1RYkua8B1u4VAXnQZHmZSubdajwa/8sHKgZ+b0CNcuSXDMfCgTtikC4dRpxD0MIDyxhYg3d+hSWiD4avEty5umVLUTXqk5HjvrnyVQcZiqLw8JudA2SSJFsJf/logzE2C0JA/ZXMxlPKNCzKCurFsO78wD8flZd4TrnnFQ/EsoNqFHzXZiaxu82oQlS4JpW+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0549d24f-a6aa-4d8d-a323-08def980cc92
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 21:21:11.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJk6Oe+pQHbRl59IdT6DBLNxJShdkMis64fq1ImNihG2bGqnDY3PaHlHPWmWEn7BrVdGBa93tsLEYz+/7S2CTqOQRklcoDl6LF5TeZkH7dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
X-OriginatorOrg: intel.com

Hi Babu,

On 8/13/26 1:55 PM, Babu Moger wrote:
> On 8/10/26 22:40, Reinette Chatre wrote:
>> On 7/7/26 2:50 PM, Babu Moger wrote:


>>> + *
>>> + * Return: @nbytes on success, negative errno with last_cmd_status set on error.
>>> + */
>>> +static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
>>> +                     char *buf, size_t nbytes, loff_t off)
>>> +{
>>> +    enum resctrl_kernel_mode mode;
>>> +    char *mode_str, *group_str, *slash;
>>> +    const char *ctrl_name, *mon_name;
>>

...

>>> +
>>> +    for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
>>> +        if (!strcmp(mode_str, resctrl_mode_str[mode]))
>>> +            break;
>>> +
>>> +    if (mode == RESCTRL_NUM_KERNEL_MODES) {
>>> +        rdt_last_cmd_puts("Unknown kernel mode\n");
>>> +        ret = -EINVAL;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    if (!(test_bit(mode, &resctrl_kcfg.kmode))) {
>>> +        rdt_last_cmd_puts("Kernel mode not available\n");
>>> +        ret = -EINVAL;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    /*
>>> +     * INHERIT mode binds no rdtgroup. Ignore any user-supplied :group=
>>> +     * suffix and let show print the mode without a group.
>>
>> copy&paste?
> 
> Hmm.. Text seems correct here to me. Did I miss something?

This is the function that parses user input so the comment describing what should
be displayed to user space seems out of place.

Reinette
