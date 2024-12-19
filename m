Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1CD1BC9E2;
	Thu, 19 Dec 2024 23:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734650556; cv=fail; b=EwfQhx+6iuJv1bWKkDi+PiBqUS25sSz+A5G+pjf3Celrgpcv0Z6u8fn4Q6BxmwAe51Z/0zFvsqYMy+TnPPG+7OGpUotQOlgNvLX/FqC3n7v3bRfXVk8i473kZCTDcG2Y2wpP3bYFnus4KrFWokxW0XofOOZOxmF8Kdd+YP0kIiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734650556; c=relaxed/simple;
	bh=HJNIsN7HnK8imvaBQzP5XcUorSU6J6PehKkxZAPwv9U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F4csH5UVTkpWfVHC+Kn1FHjS6TjtQiOhVyWaU/WvCuXpZFDd2qCrTxFC4Tg4byZBxADsBrl+qpoT5HpHGHS2N6qnoNT5LT1dycUlHU4JyrRcofJ2g6Zrjr6byQU/ZMauUByQT6MYjz0b/r+f1ATwJ3Qzlw1RjX65HeTMual6kBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klpe0y84; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klpe0y84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734650553; x=1766186553;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HJNIsN7HnK8imvaBQzP5XcUorSU6J6PehKkxZAPwv9U=;
  b=klpe0y84wIskE0zuHxKDng7vK0Xlu19tc1BtLnlVA8w3Dpu8RKpwhRcJ
   F2L/4lKY7jp/3591/qtrXYBluIaBumcJJhl5Lw1gMP9+zFLu7VQBGNYX1
   qDnaRcmuOwzHV4CxfSNFdvtb9B0sLqwzDDmgsQ9bZSaF2QNo0gFBsUUKE
   cj7iLIl0Spp0Fae+9bHmIqxvDNUHn/OeOxDqvtLO4DUQU1hg50rrKOSDQ
   bQQmDCXckO1pJO/9VwB62ywVghmz9GjSDGc2XfFa38WOQ2V4+DV6oyNGY
   QLSMU/91dbhfM/ag019hvRT++YgYEU8Ap4tzumQ2UnKqSj0RljFLz4aZK
   g==;
X-CSE-ConnectionGUID: pPXhzlgBQNCyWpuXzMgZAg==
X-CSE-MsgGUID: fux+xJirRJ6kcZAP7vqc7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45793262"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="45793262"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 15:22:32 -0800
X-CSE-ConnectionGUID: T7DLQMaPT4+M5A32EFDg8A==
X-CSE-MsgGUID: yYmt+/OqQd2X140XeJ6rOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="98549125"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 15:22:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 15:22:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 15:22:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 15:22:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggdQ73HPWTPYH8xA5R81bV7t5ZQ/0/833R5rGFxdlGtiJQrdpG16pI4NohNHl5cEdYw+x5SPWk+ne0rQ5CpAndeTfEVluEda82MccfbkJEE9EuiPVY34Geu+EaldzLrpStMZ4Iy1ML2sbWjWKCr0aBKoMj21efA4KLT+cL2QGW46D4bhmmTigARDjvMWWBMz5kcyKWO9wz+S9jloTzgF9Of8HRJBP+wSajsmORt0+2lkkMp9t2+TzrJVA7kfY4G21w/OrJiQNdzfHgCZ3TYOkAqrKmKZrmor0D0EnDet8wTsk93xEnwN+cZJFAH1tPEVobgNOoqlwQKjw3ym1MBDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6SqVCF5BshREni6vFDLk1LJFhTMokKDIzx7DFsgGsk=;
 b=JyMrM2gvLFjZWifZwQnDn6c6/5EwoF6ZnQFYLoq8PEwJQIDUH1wKLuyWV4ARYOxWJzAl9P/VxhGVjRCzCaPKA5ftb0gybyOit1Q9oYXezh4oEqCAShCmSziYNJOGutT+p+o1WPScPIbMiIenGKFFkqHltnrkxLq6e+h+u0GOcdvEJQnf081/QhXQOK7islxc0rN5SSS/8VHWVwXaWLhiWuIIX3YB8pryc3eejNLA2W5OcscFz64fxGKjy+KBC4gBJpDxMIPCb3W5SwbWQhe/em0lMqS4u9cH4hbMkZPX6+qtDidlYr3TPcd9eTQO+Iti7F1pkw/DHE+vnHsZxhxGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.24; Thu, 19 Dec
 2024 23:22:28 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 23:22:28 +0000
Message-ID: <69d7f38c-2df4-4191-80cc-cc5c724b2050@intel.com>
Date: Thu, 19 Dec 2024 15:22:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <a72e23d8fe43038cd319403ed68b657fb36e23df.1734034524.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <a72e23d8fe43038cd319403ed68b657fb36e23df.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fe3ee9-17fe-4a91-ec69-08dd20840156
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bitDQlk1aWJBQm41WENwUnhlQWhWeGd4a3c5NG1vcEo2UHdYcHNjWVNFWWtR?=
 =?utf-8?B?b25rQ2NtYTlVbzJydTZNMDEzbW1ncmNLNjhQeWpEdXhFdWxQVGNheVZEaGtx?=
 =?utf-8?B?SHc1d2NDbUUwYk5EK055Y1kwai9PZm9VWGREdzhFSUdkT0s3VVNrZGZIWVhZ?=
 =?utf-8?B?cXF2ek1OaU01NkV6ZDRrOHRKZkNIVVR2SkQybUlVZ0hDVmFEWmpidUxoRXZ3?=
 =?utf-8?B?aDFjVWE5ellXSlJDUkNQbHM1NFJDZkJaQldvRTYraG1pczMzM3NsemRQYmUv?=
 =?utf-8?B?Wkg2S0pjMFNTZU1RWFE5WWllV1NZeHNVSjRoYkZqK2Zva1hMRExIZVNSVElv?=
 =?utf-8?B?SUZoSEVsZ1h2Z0pad2ZwaVNyWCt0czJNd2VyWkpNMUZ2clZ1WjlVOHhUMDEv?=
 =?utf-8?B?RGhpRGpKakdCa0ZHVVFQRVdqUUZSRGZsMW9XMzh2NlBRTVFFelAzWG4zRzla?=
 =?utf-8?B?TTZGRDhNWlRudUdLUFptSGhwT2NMeksyY2dKU0JrOEpxOUJVRi9SL043TVYx?=
 =?utf-8?B?TWZoZmtFWU1wY2hzeVJCM0pvWEFXK0ZDeEFWM3c5eWJVUW1udW5PeU5hK2FX?=
 =?utf-8?B?amp3TGZDU3UvdW9sUFBtOUpYZkYyL2NSZjA2ZXd3SldwYlBiZ1pYSytraDBs?=
 =?utf-8?B?MmI0K0pvZHlwVlR3VTRja2ZYQUVPWlpFRHE0dmZPNGhsM3FGblJCc2VNeURT?=
 =?utf-8?B?WmNBUE80Qm5ZUEdsWk1aNFJkUXFBQStyMGlCTWpmeFF5dEJ3SU8yb1pZUUE3?=
 =?utf-8?B?SGVhblhZN0ZFQWhBRWhZVEh6QXV1a0JwTFpDVlhDZFp3Ym1sQzdaSlRGVWNL?=
 =?utf-8?B?c0I3ekk0cVdUVThhaWdSR2RZQU85YmJ0dHBRNVZiSFV5V2gzRkJJcU5UMmdR?=
 =?utf-8?B?b3dNa0MxbG9xbUY2aEt1WmpoeVVTanlPWVQ0S1dPMEJzVEhCNmg2MzJQTVNx?=
 =?utf-8?B?Y3RZWk5sdFJiK0VPMG9LWEk2Qi9NU1haSGp0VmZkTElFU1pOV0h4L3RIVkNu?=
 =?utf-8?B?a2RXT2h2T3pXSWg4SXB0ZXIzRE5ZY05CS2t1SjMzUFk0UEo5UEd2QTI2NHli?=
 =?utf-8?B?bzFBSWVCR05Vem9zOGt3T3hwS1dGMGxaREQ4SnJWbDREeU1KM0MxQ3RJNGl3?=
 =?utf-8?B?bGxORnhGbllkY2o5V2lIYU5TUTViZE9HRjdrbUZlRFFkWnRERVRVeVJ0QjRB?=
 =?utf-8?B?aGsyRldxZjFVWVQ4cjRTMWFBSWlNejFsbC9uekc1Q1RWcFFEc1pnVDEvMWNy?=
 =?utf-8?B?a0NJczBmbys1OTlRT0VoWm1NUDJpcTNUenM0T3ZNYkJSYTc2eXBoVTFpZGl2?=
 =?utf-8?B?bkU5MWQ2WTF5L3UwRGp2clBBUlI4emJDeit4OTV2L2F2UGNxZHdVeE93dXRL?=
 =?utf-8?B?Y0x1aWNLYWtCRERKQ0JLbnMzUUViSDRuaS9ZUlY1ajJlbElBZHF6Z25IdjFj?=
 =?utf-8?B?VmxQUTdzSS9TQjZIUTg5bExVbTRra2JUUkJiVExGMDkyT0M2MVNqdSt1UGdH?=
 =?utf-8?B?N3QyZXJSQlRXMVVVdnBsazQwSzNyTldmcFNGd1RUR0lTYytoVHdrRGVrRmpr?=
 =?utf-8?B?ODZkSEJhZ0JxRFRQZDcxY0x4eGo3OXdTZDZEN0dhTyt2LytkK3d3MXNmOC9k?=
 =?utf-8?B?Y1o3NlNxS0N5WXNWZFlyeERjdnFOUXF6UWc1eHVlRE1lM202ak5Rb2VCTjNH?=
 =?utf-8?B?TnZRT2FNa2gxUzF3N2h1eDZzN3daMHlXR2ZMVSs4ZEJkUFdCVmRsalhpRWFx?=
 =?utf-8?B?VzJxd1hNVGdZUmdJUWUrYWx1LzJMZTZVMTUwOEhseUovZWpLVll1dFo3Y0NJ?=
 =?utf-8?B?RVpZMlJraDBKS2hxcHpGZ280TCtLL2JMbE5jQkVVcDBZcjF5anU2elFIRjN3?=
 =?utf-8?Q?SSfRHQxFWY6uN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHNsTWlhT1U4MXY0NDJ4L2RTOUdSd0JHdFJsL21CMStoSkthZmZ2czJ1V1A3?=
 =?utf-8?B?NW5FRHNGS0JTZzZnN250SVBNR3NqMVlBczB3U01FVUgzcUZieUtWQXhzTFhr?=
 =?utf-8?B?UzB1cFF2RHgxQlQxcmRybzJhMVExdk5HTTdGWVVwZTZMeXpoU2lyNkkrUmds?=
 =?utf-8?B?RXN0L0NTWGlZYzVtbWR1MHFkOWpsVGN4ZkRwQlAyUFFwQTAwaTRmc3JXN2NO?=
 =?utf-8?B?Rkc4SmFFTTU0RzdZajNHNkFMeEFNa0N4UGRqN0c3bjAwTWV0cS9tZndzVEF1?=
 =?utf-8?B?ak1NQTJrMXlhQS92VFFjRCtFYklKVEU5OGIvcllHbnA1bUY4a2pOeEpYbjBo?=
 =?utf-8?B?QXpqV2JBaTZ0WFNZU0xXdU1kdXNiNFBjcWc3WVhYMHBoYjMzSkFVdUhUTFlB?=
 =?utf-8?B?ejlIY0RobGtuL3RzM3FyV1A3Z0FsTU1WRzNjeTR1UEhCK3hwSklEUkl6bWFk?=
 =?utf-8?B?WXhiVEVPWFVVT0pBemt2SmdRTmNEQTc1WnZIOTlaUC9DZTJnekRtd2QrZFJ4?=
 =?utf-8?B?TllVa3dTcElsV2lEL2RYUktGRUtUYTNNMmdyRTQ0N2ZjUzZJaGh6ei9GS1NP?=
 =?utf-8?B?aTFsbTBWN1ZRblZHZFpCRWNhMkRPUVdGb0FLcGhZY0tYcmN1bFI5Nmt0RVg0?=
 =?utf-8?B?QjVwV0lmZmVITUhVbFNBczgzYklqTWhSb3VDdGlGVWkyQ1JEZWg5SDNWdnlO?=
 =?utf-8?B?TFBWUzUrcDBXNEhiNmM4d05xalE0ZTJjajZRTGFaNGg4ZzZzL1RMZmR0VXZl?=
 =?utf-8?B?bFFOdWFkTm92TkJZVW5BMEpJQ3hmS09lRTE1QnBseE5nUlpGRGtuVVMvKzdj?=
 =?utf-8?B?WWNHUkd6QzdqbFNhMVhuMldLSGtTRnRydXcxcGRLRTl6Y0R6azU4ZDJ6WE12?=
 =?utf-8?B?Vnd0NkptYzF5aGM0QUIrZE5DUG1VV1J3YS94TXNyeFFMVDUwYkgraC8xdUhF?=
 =?utf-8?B?QTFJL2ZmODRxT2lzQkVTVmRib3NOMDloUmRtdkxrU1BtL2hrUWFBQU9tODcw?=
 =?utf-8?B?SFYzSmVLU2k1UitIYmdzQzl1ZDZQVy8wK0Z1ZDlWOGVsT0ZlRE9QOXJoYUJ6?=
 =?utf-8?B?d1ViR3FHVW0vTjJ5aGs2UkpobVkzQ2o3MWlSYitlSkZOcW16TER4VWltcTRD?=
 =?utf-8?B?QlkvZENnRzBOWmdxR2tTN3k5M09VK2RIN2taQldqaDR0RjgxdXY0SkZRMjBZ?=
 =?utf-8?B?R0xZM1NaUTQrZFNWR2ZEVzVTTkhiZjBGeEhMUmQ2a2o1OWlGQVRTM2hHcmZ2?=
 =?utf-8?B?N1poeWxXNFJnUHF5dk5qVmRKQUZTNUpubURCVWJCUjYvaU1YWEx5UElsYStU?=
 =?utf-8?B?cDhneWs4MlE4bnpVVllLT1c3Uk04bCsrNjUyNjREdVR5UEl6S2VUd0trKy85?=
 =?utf-8?B?Tys3SlRHVE1jcnd6RURENW50aTU5WnZkQ0lVcnBmNWFIc3RhRk9yRVJFVmJ3?=
 =?utf-8?B?amhJYzVwZ2xyVlhoWlRXZGlsdlVlNitzT3MxL3F0ZTh5VWtyLzY1N0IzeTcr?=
 =?utf-8?B?T2xkU29JQXhTRkwyZnZ6SWN4bE14ZUpIZEt1WXd2clNTSnVoc0JDQjhUU2Mw?=
 =?utf-8?B?QW4ybXBPU2NPdmxRTXQ4Ulcyd1FQb0d6S041aGNJR3NjZW5BR3FVUnN1RldM?=
 =?utf-8?B?Mmw1aW4yZmx3SVY1ZGpvSm5rMm5ZVTZHVS9mWGU2R05zdk5BR2c2c296ZXFY?=
 =?utf-8?B?clVjOVF3a25aT3BjbDhiYVNDNkRXc3lkYVNpRHA2TWlKSW14c1BQblhXZk11?=
 =?utf-8?B?U2FnZWY3QitGbWFlK1V0Tk5rSXE2ZXVWcXdDQ1RoVzRqWmRnS0YwaXUvTUdq?=
 =?utf-8?B?NUNJdjl6VWc1MXprTzRMa0lIdFpXbklFMldGVld6bFhSSTZkVWQrNk5yWjJ1?=
 =?utf-8?B?RmRmQjRTN2hISFBLckN2RVY2T1k2cUI1MWdXaE0xWUxZdTJ0YlZOR2xXOStz?=
 =?utf-8?B?K3ZQMjIvMjl1V2RyQTdIZy9SNmJUN2xHeW1ReXI4UllhYUJSQnVZM0FNUkZF?=
 =?utf-8?B?NWJ5Q2VhSkkrdy9ZRHdZUDdIQWFNeTFmYXd6cGpSU1NTb2RxMEZid045Qkkw?=
 =?utf-8?B?L3FGZkJERXJnaS9CMCtVL3hCSEpkQXZ4akxSQUhZTWtIMWZzWEFPYnQ4aHk1?=
 =?utf-8?B?cEoxdUVqWVVMMG1BY1hxZmp1TTZMTUdxQzl3cGpodC9BbFNINGdnbkMrcm1B?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fe3ee9-17fe-4a91-ec69-08dd20840156
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 23:22:28.8002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRX4Ckdb3V6GxrRE7L2LfjZK8F+a2MNI7KiXQbLFz4uNBuAb3inbSXZb0jpVXJayUH0yxkqRYZQquDuNJ/KaHNRaAohiJO2HDUcmiZDx0gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7578
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> The mbm_cntr_assign mode offers several counters that can be assigned
> to an RMID, event pair and monitor the bandwidth as long as it is
> assigned.
> 
> Counters are managed at the domain level. Introduce the interface to
> allocate/free/assign the counters.

Changelog of previous patch also claimed to "Provide the interface to assign the
counter ids to RMID." Please let changelogs describe the change more accurately.

(This still does not provide a user interface so what is meant by interface is
unclear)


> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 849bcfe4ea5b..70d2577fc377 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -704,5 +704,8 @@ unsigned int mon_event_config_index_get(u32 evtid);
>  int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>  			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
>  			     u32 cntr_id, bool assign);
> -
> +int rdtgroup_assign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
> +			       struct rdt_mon_domain *d, enum resctrl_event_id evtid);

Could you please be consistent in the ordering of parameters?

int rdtgroup_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d, 
			       struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);

> +struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
> +				u32 rmid, enum resctrl_event_id evtid);
>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index f857af361af1..8823cd97ff1f 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -575,8 +575,8 @@ void free_rmid(u32 closid, u32 rmid)
>  		list_add_tail(&entry->list, &rmid_free_lru);
>  }
>  
> -static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
> -				       u32 rmid, enum resctrl_event_id evtid)
> +struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
> +				u32 rmid, enum resctrl_event_id evtid)
>  {
>  	u32 idx = resctrl_arch_rmid_idx_encode(closid, rmid);
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index e895d2415f22..1c8694a68cf4 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1927,6 +1927,116 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>  	return 0;
>  }
>  
> +/*
> + * Configure the counter for the event, RMID pair for the domain.

This description can be more helpful ... it essentially just re-writes function
header.

> + */
> +static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			       enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			       u32 cntr_id, bool assign)
> +{
> +	struct mbm_state *m;
> +	int ret;
> +
> +	ret = resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, assign);
> +	if (ret)
> +		return ret;
> +
> +	m = get_mbm_state(d, closid, rmid, evtid);
> +	if (m)
> +		memset(m, 0, sizeof(struct mbm_state));
> +
> +	return ret;
> +}
> +
> +static bool mbm_cntr_assigned(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
> +		    d->cntr_cfg[cntr_id].evtid == evtid)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
> +			d->cntr_cfg[cntr_id].evtid = evtid;
> +			return cntr_id;
> +		}
> +	}
> +
> +	return -EINVAL;

This can be -ENOSPC

> +}
> +
> +static void mbm_cntr_free(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
> +		    d->cntr_cfg[cntr_id].evtid == evtid)
> +			memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
> +	}
> +}

From what I can tell the counter ID is always available when the counter is freed so
it can just be freed directly without looping over array?

> +
> +/*
> + * Assign a hardware counter to event @evtid of group @rdtgrp.
> + * Counter will be assigned to all the domains if rdt_mon_domain is NULL

(to be consistent) "if rdt_mon_domain is NULL" -> "if @d is NULL"

> + * else the counter will be assigned to specific domain.

"will be assigned to specific domain" -> "will be assigned to @d"

Reinette

