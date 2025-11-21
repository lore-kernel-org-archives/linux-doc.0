Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496A27FD59;
	Fri, 21 Nov 2025 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741156; cv=fail; b=XQaNkqoRwQg1rXIui++ojSPC/N/qdoZeFPojieiqlqMf638iF/pX/fofn1BQhZz2z9fpxtbjndAGXgYcg49LDDxCqd9i6+4ZO/7xk9NIRzpPae93KOnQFOpGF/J/lsmdICIMjyJBdxD8Gn6eENxUGE46YgFzL6ZX2Nnceqo3ZQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741156; c=relaxed/simple;
	bh=wdKmivlTFd2hRtG4Gm1VIStd17lBtNTG4tjDUN87Hfs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RmXW3AK1yZIUcN9XjPe51CDO0eNtuMyn1ObUnhlX1YXzXlWyIp+quRDBPpjtiP+WNch7WjbvRos/PWI/Zdt2pkyFnRkLvlsnQZadSur45zb+ZNSEIasH+G9s9WH+tC9FwM+qx42eLkre7d6QZ65HkS3Yh0rsg+8lxhpKPcimu5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlD5I2lm; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlD5I2lm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763741154; x=1795277154;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wdKmivlTFd2hRtG4Gm1VIStd17lBtNTG4tjDUN87Hfs=;
  b=HlD5I2lmCFDfNYla5mKzia2xpe8YS3f5P2B5gJs/lKf4T3ixk4t2q4kb
   rSMAtaqqGIIffGXCUx2nTc5RQntG3CHKcV6TC0wXeIwGy5BG6LSzdwYxi
   9I8ENaRrddGYO30Wj8k5Crv+HSqg4iXdH8pZ55cL3co8hpLnVCLWVsEbX
   OXLXk5NzF/bhDYFlEAR0b0hMrbM303di2kRq4H03EQVT/kjPJLQqgTb/j
   2LEpDYnhi7tiHiWWFYhV5IYK+0vLSMAOU9fgRMFJCNDige9sooLH1uwJe
   GULG7C5dUXDlLUWMbA/HzCjXmYhGZyAqjDrbMfreUIbvm25GGE/00fM8N
   Q==;
X-CSE-ConnectionGUID: 5Cd8b2nKQvq4guD057W1RA==
X-CSE-MsgGUID: CeO2GVaBSWqQt2SmXRlSQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68439325"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="68439325"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 08:05:51 -0800
X-CSE-ConnectionGUID: 7cWyUPpmRCyj2gF+dYA8YQ==
X-CSE-MsgGUID: U3Fwu2XURTOFea7E6qwENw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="222356230"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 08:05:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 08:05:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 08:05:50 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 08:05:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxCxtW8U3/65XIAA6cY1GDPusgLoo0OmeeEwl1hoVhQxXNsy7PryT1DPAUPwiLZlasxaO9hpj1gV4mpCPkG34T89o5KDPoMQBCs/g0bY0t1gPvUHt7jctBXDEOGpc/B+L4GOQoYhvoNRveBTRvLuImTG/9vfS79KIsATMq+z55ZEWrjdRYYeKnj8GFcEPNJMgYwADXNgBC9iCqiYmvnFbANC59F8yClfoO9SOxhI9X3zFbV/hG7E8jP8dSNoGF0dZ7JNO03k01oZJYNoZGf0tXj1CzLH83CYUEiggJZ4Kc4sNWPCEeL9935JF5j31Jd2PSxynYB12kd35vjreDnU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+owRlGd3AiU4LtsQTOZ5illBvdVTGRzHfVucd4GSnQs=;
 b=gStA1I2sHZahLHtIuihpc5PxU1aGOvbr4heVzEc6cEVhgYZ4ch+diVd8VIULn5hOBn09vgAd0B40e0ErRbg0UqiyQsYQ+b0nmaKxCZXe1gAyGLCsZcP1MYYyxlMFM7mrZ/b/TXMPpkUKLxqJyKtgGc0P00pDvafw9hUTnx4Oey1EVDVCV4b6SeLtoYc9OKAxk8s4t8cfCDDJn6tasvXhQPI0BUd2D64H2yGikoLWLRA97/gdehwLtuaq44X7jNtO9C51iYPDMNuiJS/UmFGCDnKT+Qqkj1v2nYKPSKaDIF81HskTZkBEIHMP1gMVk94sgIE4pLP6Yq71hJo3zkhMvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB5903.namprd11.prod.outlook.com (2603:10b6:510:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 16:05:41 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 16:05:40 +0000
Message-ID: <3fddbb5b-a6ac-4465-afc0-6365225ba2bb@intel.com>
Date: Fri, 21 Nov 2025 08:05:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/10] x86,fs/resctrl: Support L3 Smart Data Cache
 Injection Allocation Enforcement (SDCIAE)
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: <corbet@lwn.net>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <kees@kernel.org>,
	<arnd@arndb.de>, <fvdl@google.com>, <seanjc@google.com>,
	<pawan.kumar.gupta@linux.intel.com>, <xin@zytor.com>,
	<thomas.lendacky@amd.com>, <sohil.mehta@intel.com>, <jarkko@kernel.org>,
	<chang.seok.bae@intel.com>, <ebiggers@google.com>,
	<elena.reshetova@intel.com>, <ak@linux.intel.com>,
	<mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <feng.tang@linux.alibaba.com>
References: <cover.1762995456.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <cover.1762995456.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:303:6a::15) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: b827bbc1-e10b-45b2-2d36-08de2917d0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVFBVGN2YjRiL3JqUzcwOVZTWDJDd2VNVkV4SWdCVGROQS81Z1p6djR2b3Ns?=
 =?utf-8?B?c1cwdkJjTzhaSE5jak91RkpSUHUySjU5VVpFUk5xdWdpcXlWREhmVzVXakdw?=
 =?utf-8?B?NkhucG1NVlFYVklweDZ0TDlGZURySnhqTUtVbHVhODlaaitYc25ZVjBJcCt5?=
 =?utf-8?B?OStHcElMNVRGcW5lMi9Danh2MmduVFkxU2ZuS3lIemJoN3g5bFgxV0d2Q01l?=
 =?utf-8?B?bTE1R0Q5TnEzU3JadDlBS2tlbDFVQ0dzSzEwM1VzZm9pSnh5WW1VSGVXV05p?=
 =?utf-8?B?MFB5aldETzlsZGJNWGJvREhDZCtTT0s4Z0VxL2lrcWdJalhSMDJkK2RFQm1p?=
 =?utf-8?B?aUlXM0FISnVjZzBzczFwc2d2WVFCZUdIZ1dWcGV3V0JoR043TGNRKzl1dVRL?=
 =?utf-8?B?OFlRcXhyT0IzNW5oNzBxQW1Ed2lTNGZyaWNGUU1BMFcwZ3Uwd3JRd1RoeVl6?=
 =?utf-8?B?ekFiNmxSdVl0Nkt0RFJJS0I2U3YwUndybVJlZVZTWnNUUThzWW1OTXZkOFhX?=
 =?utf-8?B?OVpXWktyMVJPbk9zdHgwWU5QZ3JrZGVDaUdqem5DdkZnWWZhakVaRG9jWjZJ?=
 =?utf-8?B?blBvcDJvUDBBNmtnUVdvSmh1RkJ1bis3aXE3OVNETWJtM1Y0bGdxamc1Y3B4?=
 =?utf-8?B?YXBoV1E5eXJlazFCVlNWS1ZoM2tpVU14UkVQSUlJZEY4N3BpOUl0V3prR3VE?=
 =?utf-8?B?aW1LanA3ZXpmbzAzT3hid1dHQWFZK2wvN08vbVhqcEZHM0E2azZFdVdyYUV4?=
 =?utf-8?B?TGdkbWFaODkycTVXRlRmOTRPZFNtZXhWRjZBZG9yMTdVTDZrNnFwc0FOc1NQ?=
 =?utf-8?B?Wm1TNC9kQzNwdWg2SWpyR3NmY1RZQnNFNGRYS3F0aTVPMzFMeEswVkwwQlE3?=
 =?utf-8?B?RGs2bVlEZHJ4ZVlXRGJoV2wxUFZ0VXpPdHRzeHhRemFGbWd4YU9Idk5Ca1Yx?=
 =?utf-8?B?b240K1BHM3VKdE1kVDZMeU53SnNEekF0RXJFcHdpQ0wyd2ZST2UwRUZ5cFJE?=
 =?utf-8?B?OEI1dXdQODhEbjE0MkdxQndhZGhFdDBQSk00allJQ3ZZWFdOVHpZZDd0endj?=
 =?utf-8?B?MjlXMStEYUU5aitzUUhCcmJZaDRoTnQ2VWV1NUYxSWxIdm94UWVFWFMzN3NL?=
 =?utf-8?B?RnlRUCtzbzA5RTdzQ0ZsZXVuVVdBTVBDZlJtMi9vNm8zNGRYQ3drL0xNWlQz?=
 =?utf-8?B?ZnpvOWtpQjRsWVNJZHBoSjBEQmJkODdNSUVLQ1pucU41em5IdlRSUHhIcHE2?=
 =?utf-8?B?NUFSbnpVL2wvUmdEQ2hVQVVtYVYrbm1vajVmeEh6VmZNVmZqZFBqN2N3aXZj?=
 =?utf-8?B?L0xoZTl1aUUrRmJkQ0Q1Vis0emhGbDV0ZWpFWFN3eWVmd21ESU1TUU5qcWpr?=
 =?utf-8?B?bmxUTGtHWTBISktMTkVZcHU1ODdJUXlhNEhRS0p4bi9aMnJJTDZwaDJnWnpz?=
 =?utf-8?B?TkkyOFBGOW9aUDJORkJDVzVLaU1JUmNBcGZmdnBQOGs0THB6cklUV0RwN1kv?=
 =?utf-8?B?Um1rWVdWYk5YOVA1aGFUUGxNMFpYM2hQL2c5Tk5DcTRQNUx6b1B4SzBJaGFu?=
 =?utf-8?B?SitwanNmOXdVV2V6N2g5Y0NBVFVSazFnOVkvbyt6UW5RaFJXRXlIcm9iMmlK?=
 =?utf-8?B?NVlnTXYweWtLRDA5ekJmejhkbXpsMHBKYlpITVZOYUNWN1B4NFAvWHVyQ3Nj?=
 =?utf-8?B?d2xYTDd1YThGSUJuZ3ZNRXUvNjdQdU9obGQ1Q1lnM1E0Nm5xcFNFbHB0YVhR?=
 =?utf-8?B?eW9tVFp1eXJsdjZKWlZLQ2UyU2d4cjZVNUQ5UEwrSlR4S25mL2dERGExeG9l?=
 =?utf-8?B?bTdyZzdtQlJWaVhuVTA3K0QvckRxV3FDNkpqR0xQd3lKa042QVZDZ0JYVURr?=
 =?utf-8?B?MVVoZjZ4dlgzbW9hYnRNZ0MrYVlESlY4VWh2dzFXNGYvcmJscm5MeUtqd2lp?=
 =?utf-8?B?aDkrQUIvMmdFRHRMdm9lRDZ5NDNSR2tnWElwU1RycE5sWEtYVHlBenJlUEQ4?=
 =?utf-8?B?Z0VwZzlVT3ZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekNNS2JYQ1U4SU8zTHlrSXpVU3pmUEhpdHhqRFU2YnZCNUNOMERPK0M1VjRS?=
 =?utf-8?B?WCs1VWYwVEhOUVlnUmxzdEw0LzFPMzFBcy8xWEpPRjkzazg5VDNyWGY3bXBC?=
 =?utf-8?B?dTZLOUJzbFlncHd2L0JSK1F5cWM0V2JlTHp4OHhVUTJRbEFFbFRLL3ZyNTZu?=
 =?utf-8?B?UTVsUml6Y0M1ZnVvUWFXK0s2VnVna0QyVXlJYk95NTdHS0hqU3VDU3o5bXNK?=
 =?utf-8?B?RklZTlE1cFhSaC9lcGw2Qk9kd2tmdnJNdTBDNlkzVm50VTVSdG94QzcvSDVr?=
 =?utf-8?B?YXBBdFBpcVFLc3JFd1llT2tPb0ljajBzNndpWWFybUEvS2FoNU02TVZ3NVlB?=
 =?utf-8?B?SWp6Q2dscjFvZXpVdFB5RG9zZGJ2ZDhqZzRWSHAwRk5HbTFVV3liTWRKWUd5?=
 =?utf-8?B?VXhueGxOV0FDN0NGaDlyM0s1RDhCNGpZdVpuTjlGYndua1NaQ2ljMkhtR0Qv?=
 =?utf-8?B?VmFFU0tHMDNWWUpTL3U3enR5dVhlNmNpRldXUERPYVRncUdEZkJpa3UyMHdI?=
 =?utf-8?B?Z3ZnWjEralpNSmVaZUx2Q01DU3k0WnVlMXhWUW1sYTdQWktyT0lxcm14dmVD?=
 =?utf-8?B?R0t0Zjd1L0hTdkREQVpzTEswOGgxcWVadE53NlcyQlBSWUttbnVmUmFYczZ5?=
 =?utf-8?B?SGlZS1ZNRzIvRit4Y0d3NGcxbGxRUE5RdWFBNTdoMkNIVStBVjBwbGc1WUFt?=
 =?utf-8?B?SlBXZFF3TU42RzJwNWhVbHFRcHNSRmk5NHBzTFJ3a0trT2NLbHJidWVyd01Y?=
 =?utf-8?B?c1pDRkFUMjRickU4a2g3YmI3TW9GVnUwbTVEa1BtUzN2RVhmWXA1eEloNjVB?=
 =?utf-8?B?Y3I3YUFuYUpMblFHTjFQQ0ZDYWpVSitMRUNnL0RTS2ZqejRDa3lXV3VhSStG?=
 =?utf-8?B?aUt0S21IY3RXbjRyL1ZmdGdGS0xYUldLSFcwc04yUlNBT2luVDIxTkY5MTI0?=
 =?utf-8?B?UFc0V1JWaVYxVnF0YWZzOUQraVJOREIwdGl2RGRWL3pWRXdJZE9mK0J3WXhK?=
 =?utf-8?B?QjNNMGQwMkQ3cjRhYmUyb1NwR3V0ejFTR3VGOW9mZEN4OEh4VXRFT1k4aHpu?=
 =?utf-8?B?aFIwTXc1OUp0b2M3Nko3TXYxSjNnOThaOEd0aGQxMWU4SU4zUHVTNzlSZVZI?=
 =?utf-8?B?UVRrcmxCeUFmQ2tPd1RQNy8rR3NvMFMxUkNvcnhabzJFQWVDU0pIZXE2YUxs?=
 =?utf-8?B?ajY5QWwreER5c21xNFJqcVBlUmpCSnFhaGlvb1JscjJOSEV6K3dzQXYyKzE2?=
 =?utf-8?B?TnlHamhOL1VLamZFSWdlVmFQdDMyYUVEbGhSVW1yZGFGcHBqNEd4Qy8wS1Js?=
 =?utf-8?B?SFV1YlNQUit0VzhOaGRqckFqRUxMaWhlM0NLVUVQSDk1c3prZDFtbHZRdGRI?=
 =?utf-8?B?Qkdvczg3VitCaHhLbVp4eVUxVTlnTnBLcStST0YrV2NZL2FyTEJ4ZkNHTlg1?=
 =?utf-8?B?OXBuOFIwbTFOOVcwdWVYN24rRmh5UHFEUStna2VEY1lqcnlRSHdPK3htOGht?=
 =?utf-8?B?WC9hNVAwNFJzNlg4R0o4aW01NnJXRE9EWEduVWNCR1dYNUZkOGZZZVc2R1U1?=
 =?utf-8?B?aHlLZFVwaFcwSjVOdTJtYmNPUjZTVWZ6b25NS2lZUnQ5WHRxQ3drRmp0dUJl?=
 =?utf-8?B?K2dFUTVaY1IxNWoyRGoyZCtyc3Y5eWxJN0JDaHZJcm4zZmxmTzNWNGtHeHU1?=
 =?utf-8?B?WjY2WFdJM2xxV09wU0d3RGRJemVXeWRoVXNySXYyVXJNQVdlUGpwV1REbEJ3?=
 =?utf-8?B?Q255RU94VXlVUE1VMFRPMGhuSkV6RGZwY3l1bXpaQTMweWNxUVQ5YW1ENmtj?=
 =?utf-8?B?bHJNTzZxOUhUdUhCU1JVejR6ZG9Dd3pRNlBwZndyeFFmbzVPSnFUN3pxRDJ5?=
 =?utf-8?B?aFE2NGxsVlcrSFh6eVJuY2VzekRmVDAwK3VsMmc4Nk1FSWZTc3UwWkpRb25r?=
 =?utf-8?B?ODIrUDAxR2dVRDVnUVRsd3p1cmxpdXM2VklqeFFPdDIycE5qL3dVZGUxZWVK?=
 =?utf-8?B?eXQ2WU9sVHVVZVRQckJwRkZpRUhJbyttV0MvNDZFTTRkTTI2dnkwMFB5Qk1Z?=
 =?utf-8?B?SFh3d0wzUFdNY3RLdlBqdzFWbFo2NDNTSTFaZi9yVEF4T0IzenFJU2JQeUpS?=
 =?utf-8?B?UFlDWWRJOVd1MTFPV0pnclZ6endtbUViQk9Xb0ZIVEdIdkVGV3ZjMUNEVUZJ?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b827bbc1-e10b-45b2-2d36-08de2917d0e3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 16:05:40.1384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdPsOGdiBp8yBMwoO6mWyPj5h58hny/ijpOqkqA8A1KNl2ZQ/zNmZYdl+rxUQ/Je6ubYV2/3wL6v2YNGQSg51lPlvGY7dlpMakue/y9BaI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5903
X-OriginatorOrg: intel.com

Dear x86 maintainers,

Could you please consider this series for inclusion when you find is most appropriate?

Regards,

Reinette

On 11/12/25 4:57 PM, Babu Moger wrote:
> 
> This series adds the support for L3 Smart Data Cache Injection Allocation
> Enforcement (SDCIAE) to resctrl infrastructure. It is referred to as
> "io_alloc" in resctrl subsystem.
> 
> Upcoming AMD hardware implements Smart Data Cache Injection (SDCI).
> Smart Data Cache Injection (SDCI) is a mechanism that enables direct
> insertion of data from I/O devices into the L3 cache. By directly caching
> data from I/O devices rather than first storing the I/O data in DRAM, SDCI
> reduces demands on DRAM bandwidth and reduces latency to the processor
> consuming the I/O data.
> 
> The SDCIAE (SDCI Allocation Enforcement) PQE feature allows system software
> to control the portion of the L3 cache used for SDCI devices.
> 
> When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
> partitions identified by the highest-supported L3_MASK_n register, where n
> is the maximum supported CLOSID.
> 
> Since CLOSIDs are managed by resctrl fs it is least invasive to make
> the "io_alloc is supported by maximum supported CLOSID" part of the
> initial resctrl fs support for io_alloc. Take care not to expose this
> use of CLOSID for io_alloc to user space so that this is not required from
> other architectures that may support io_alloc differently in the future.
> 
> The SDCIAE feature details are documented in APM [1] available from [2].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>     Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
>     Injection Allocation Enforcement (SDCIAE)
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
> 
> The feature requires linux support of TPH (TLP Processing Hints).
> The support is available in linux kernel after the commit
> 48d0fd2b903e3 ("PCI/TPH: Add TPH documentation")
> 
> The patches are based on top of commit (v6.18.0-rc5)
> Commit 2f70cdbd7c20 (tip/master) ("Merge branch into tip/master: 'x86/sgx'")
> 
> Comments and suggestions are always welcome as usual.
> 
> # Linux Implementation
> 
> Feature adds following interface files when the resctrl "io_alloc" feature
> is supported on the resource:
> 
> /sys/fs/resctrl/info/L3/io_alloc: Report the feature status. Enable/disable the
> 				  feature by writing to the interface.
> 
> /sys/fs/resctrl/info/L3/io_alloc_cbm:  List the Capacity Bit Masks (CBMs) available
> 				       for I/O devices when io_alloc feature is enabled.
> 				       Configure the CBM by writing to the interface.
> 
> When CDP is enabled, these files are created both in L3CODE and L3DATA.
> 
> # Examples:
> 
> a. Check if io_alloc feature is available.
> 
> 	# mount -t resctrl resctrl /sys/fs/resctrl/
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	disabled
> 
> b. Enable the io_alloc feature. 
> 
> 	# echo 1 > /sys/fs/resctrl/info/L3/io_alloc 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	enabled
> 
> c. Check the CBM values for the io_alloc feature.
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
> 	0=ffff;1=ffff
> 
> d. Change the CBM value of domain 1.
> 	# echo 1=ff > /sys/fs/resctrl/info/L3/io_alloc_cbm
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
> 	0=ffff;1=00ff
> 
> e. Change the CBM value of domain 0 and 1.
> 	# echo "0=ff;1=f" > /sys/fs/resctrl/info/L3/io_alloc_cbm
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
> 	0=00ff;1=000f
> 
> 
> f. Disable io_alloc feature and exit.
> 
> 	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	disabled
> 
> 	# umount /sys/fs/resctrl/
> ---
> v12: 
>    Minor format fix in resctrl.rst (patch 6) and added text about writable files in the info section.
>    Other patches did not change.
>    There were some discussion about adding support to update all the domains of io_alloc_cbm
>    with one command.
>    https://lore.kernel.org/lkml/20251107012401.224515-2-atomlin@atomlin.com/
>    Aaron will be adding that later.
> 
> v11:
>    Took care of review commnet on patch 6.
>    Fixed typo CDP_3DATA -> CDP_DATA.
>    Added code to free the CLOSID on resctrl_arch_io_alloc_enable() failure.
>    Fixed the prototype of rdtgroup_name_by_closid().
>    
>    Other patches did not change.
>    Added Reviewed-by: tag for few patches.
>    Took care of few minor conflicts in fs/resctrl/internal.h due to code displacement.
> 
> v10:
>   Updated the changelogs in most patches when there is some repetitions in texts. Thanks to Reinette.
> 
>   Fixed the minor conflicts in scattered.c and cpufeatures.h.
> 
>   Fixed the few conflicts due to recent ABMC feature merge.
> 
>   Code comment update to match MSR names correctly.
> 
>   Re-arranged the details in resctrl.rst file.
> 
>   Changed the text L3CODE to CDP_CODE and L3DATA to CDP_DATA.
> 
>   Updated the return code to EINVAL when feature is not enabled in resctrl_io_alloc_cbm_write().
> 
>   Few other text changes. Added details in each patch about the specifics.
> 
> v9:
>   Major change is related to CDP.
>   The processing and updating CBMs for CDP_CODE and CDP_DATA are done only once.
>   The updated CBMs are copied to the peers using staged_config.
>   
>   Removed resctrl_get_schema(). Not required anymore.
> 
>   Updated the "bit_usage" section of resctrl.rst for io_alloc.
> 
>   Fixed the tabs in SMBA and BMEC lines in resctrl.rst.
> 
>   Improved the changelog for all the patches.
>   
>   Added the code comments about CDP_CODE and CDP_DATA where applicable.
> 
>   Added Reviewed-by: tag for couple of patches.
>   
>   Added comments in each patch about the changes.
> 
> 
> v8:
>   Added Acked-by, Reviewed-by tags to couple of patches.
> 
>   Updated Documentation/filesystems/resctrl.rst for each interface.
>    
>   Updated the changelog in most patches. 
>   
>   Moved the patch to update the rdt_bit_usage_show() for io_alloc changes to the end.
>  
>   Moved resctrl_arch_io_alloc_enable() and its dependancies to
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c file.
>   
>   Moved resctrl_io_alloc_show() to fs/resctrl/ctrlmondata.c.
>   Added prototype for rdt_kn_parent_priv() in fs/resctrl/internal.h
>   so, it can be uses in other fs/resctrl/ files.
>   
>   Renamed resctrl_io_alloc_init_cat() to resctrl_io_alloc_init_cbm().
>   Moved resctrl_io_alloc_write() and all its dependancies to fs/resctrl/ctrlmondata.c.
>   Added prototypes for all the functions in fs/resctrl/internal.h.
> 
>   Moved resctrl_io_alloc_cbm_show() to fs/resctrl/ctrlmondata.c. show_doms remains
>   static with this change.
> 
>   Moved resctrl_io_alloc_parse_line() and resctrl_io_alloc_cbm_write()
>   to fs/resctrl/ctrlmondata.c.
> 
>   Added resctrl_arch_get_cdp_enabled() check inside resctrl_io_alloc_parse_line().
>   parse_cbm() remains static as everything moved to ctrlmondata.c.
> 
>   Simplified the CDT check  in rdt_bit_usage_show() as CDP_DATA and CDP_CODE
>   are in sync with io_alloc enabled.
> 
> v7:
>   Fixed few conflicts in
>   arch/x86/include/asm/cpufeatures.h
>   arch/x86/kernel/cpu/scattered.c
> 
>   Updated the changelog in most patches. Removed the references of L3 in
>   filesystem related changes.
> 
>   Removed the inline for resctrl_arch_get_io_alloc_enabled().
>   Updated the code comment in resctrl.h.
>   Changed the subject to x86,fs/resctrl where applicable.
>  
>   Split the patches based on the comment.
>   https://lore.kernel.org/lkml/3bec3844-7fda-452b-988f-42b0de9d63ba@intel.com/
>   Separated resctrl_io_alloc_show and bit_usage changes in two separate patches.
> 
>   Added new function resctrl_io_alloc_closid_supported() to verify io_alloc CLOSID.
>  
>   Added the code to initialize/update the schemata for both CDP_DATA and CDP_CODE when CDP is enabled.
> 
>   Rephrased the changelog and code comments in all the patches.
> 
> v6: 
>    Sorry if you see this series duplicate. Messed up the
>    emails linux-doc@vger.kernel.org and linux-kernel@vger.kernel.org.
> 
>    Sent v5 by mistake before completing all testing.
>    Most of the changes are in resctrl.rst user doc.
>    The resource name is no longer printed in io_alloc_cbms.
>    Updated the related documentation accordingly.
>    Resolved conflicts in cpufeatures.h
>    Added lockdep_assert_cpus_held() in _resctrl_sdciae_enable() to protect
>    r->ctrl_domains.
> 
>    Added more comments in include/linux/resctrl.h.
> 
>    Updated "io_alloc_cbm" details in user doc resctrl.rst. Resource name is
>    not printed in CBM now.
> 
>    Updated subjects to fs/resctrl: where applicable.
> 
> v5: 
>     Patches are created on top of recent resctrl FS/ARCH code restructure.
>     The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.
>     Resolved the conflict due to the merge.
> 
>     Updated bit_usage to reflect the io_alloc CBM as discussed in the thread:
>     https://lore.kernel.org/lkml/3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com/
>     Modified rdt_bit_usage_show() to read io_alloc_cbm in hw_shareable, ensuring
>     that bit_usage accurately represents the CBMs.
> 
>     Moved prototypes of resctrl_arch_io_alloc_enable() and
>     resctrl_arch_get_io_alloc_enabled() to include/linux/resctrl.h.
> 
>     Used rdt_kn_name to get the rdtgroup name instead of accesssing it directly
>     while printing group name used by the io_alloc_closid.
> 
>     Updated show_doms() to print the resource if only it is valid. Pass NULL while
>     printing io_alloc CBM.
> 
>     Changed the code to access io_alloc CBMs via either L3CODE or L3DATA resources.
> 
> v4: The "io_alloc" interface will report "enabled/disabled/not supported"
>     instead of 0 or 1..
> 
>     Updated resctrl_io_alloc_closid_get() to verify the max closid availability
>     using closids_supported().
> 
>     Updated the documentation for "shareable_bits" and "bit_usage".
> 
>     NOTE: io_alloc is about specific CLOS. rdt_bit_usage_show() is not designed
>     handle bit_usage for specific CLOS. Its about overall system. So, we cannot
>     really tell the user which CLOS is shared across both hardware and software.
>     This is something we need to discuss.
> 
>     Introduced io_alloc_init() to initialize fflags.
> 
>     Printed the group name when io_alloc enablement fails to help user.
>     
>     Added rdtgroup_mutex before rdt_last_cmd_puts() in resctrl_io_alloc_cbm_show().
>     Returned -ENODEV when resource type is CDP_DATA.
> 
>     Kept the resource name while printing the CBM (L3:0=ffff) that way we dont have
>     to change show_doms() just for this feature and it is consistant across all the
>     schemata display.
> 
>     Added new patch to call parse_cbm() directly to avoid code duplication.
> 
>     Checked all the series(v1-v3) again to verify if I missed any comment.
> 
> v3: Rewrote commit log for the last 3 patches. Changed the text to bit
>     more generic than the AMD specific feature. Added AMD feature
>     specifics in the end.
> 
>     Renamed the rdt_get_sdciae_alloc_cfg() to rdt_set_io_alloc_capable().
>     Renamed the _resctrl_io_alloc_enable() to _resctrl_sdciae_enable()
>     as it is arch specific.
> 
>     Changed the return to void in _resctrl_sdciae_enable() instead of int.
>  
>     The number of CLOSIDs is determined based on the minimum supported
>     across all resources (in closid_init). It needs to match the max
>     supported on the resource. Added the check to verify if MAX CLOSID
>     availability on the system.
> 
>     Added CDP check to make sure io_alloc is configured in CDP_CODE.
>     Highest CLOSID corresponds to CDP_CODE. 
> 
>     Added resctrl_io_alloc_closid_free() to free the io_alloc CLOSID.
> 
>     Added errors in few cases when CLOSID allocation fails.
>     Fixes splat reported when info/L3/bit_usage is accesed when io_alloc is enabled.
>     https://lore.kernel.org/lkml/SJ1PR11MB60837B532254E7B23BC27E84FC052@SJ1PR11MB6083.namprd11.prod.outlook.com/
> 
> v2: Added dependancy on X86_FEATURE_CAT_L3
>     Removed the "" in CPU feature definition.
> 
>     Changed sdciae_capable to io_alloc_capable to make it as generic feature.
>     Moved io_alloc_capable field in struct resctrl_cache.
> 
>     Changed the name of few arch functions similar to ABMC series.
>     resctrl_arch_get_io_alloc_enabled()
>     resctrl_arch_io_alloc_enable()
> 
>     Renamed the feature to "io_alloc".
>     Added generic texts for the feature in commit log and resctrl.rst doc.
>     Added resctrl_io_alloc_init_cat() to initialize io_alloc to default values
>     when enabled.
>     Fixed io_alloc interface to show only on L3 resource.
>     Added the locks while processing io_alloc CBMs.
> 
> Previous versions:
> v11: https://lore.kernel.org/lkml/cover.1761844489.git.babu.moger@amd.com/
> v10: https://lore.kernel.org/lkml/cover.1761090859.git.babu.moger@amd.com/
>  v9: https://lore.kernel.org/lkml/cover.1756851697.git.babu.moger@amd.com/
>  v8: https://lore.kernel.org/lkml/cover.1754436586.git.babu.moger@amd.com/
>  v7: https://lore.kernel.org/lkml/cover.1752167718.git.babu.moger@amd.com/
>  v6: https://lore.kernel.org/lkml/cover.1749677012.git.babu.moger@amd.com/
>  v5: https://lore.kernel.org/lkml/cover.1747943499.git.babu.moger@amd.com/
>  v4: https://lore.kernel.org/lkml/cover.1745275431.git.babu.moger@amd.com/
>  v3: https://lore.kernel.org/lkml/cover.1738272037.git.babu.moger@amd.com/
>  v2: https://lore.kernel.org/lkml/cover.1734556832.git.babu.moger@amd.com/
>  v1: https://lore.kernel.org/lkml/cover.1723824984.git.babu.moger@amd.com/
> 
> 
> Babu Moger (10):
>   x86/cpufeatures: Add support for L3 Smart Data Cache Injection
>     Allocation Enforcement
>   x86/resctrl: Add SDCIAE feature in the command line options
>   x86,fs/resctrl: Detect io_alloc feature
>   x86,fs/resctrl: Implement "io_alloc" enable/disable handlers
>   fs/resctrl: Introduce interface to display "io_alloc" support
>   fs/resctrl: Add user interface to enable/disable io_alloc feature
>   fs/resctrl: Introduce interface to display io_alloc CBMs
>   fs/resctrl: Modify struct rdt_parse_data to pass mode and CLOSID
>   fs/resctrl: Introduce interface to modify io_alloc capacity bitmasks
>   fs/resctrl: Update bit_usage to reflect io_alloc
> 
>  .../admin-guide/kernel-parameters.txt         |   2 +-
>  Documentation/filesystems/resctrl.rst         | 134 ++++++--
>  arch/x86/include/asm/cpufeatures.h            |   1 +
>  arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
>  arch/x86/kernel/cpu/resctrl/core.c            |   9 +
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  40 +++
>  arch/x86/kernel/cpu/resctrl/internal.h        |   5 +
>  arch/x86/kernel/cpu/scattered.c               |   1 +
>  fs/resctrl/ctrlmondata.c                      | 309 +++++++++++++++++-
>  fs/resctrl/internal.h                         |  17 +
>  fs/resctrl/rdtgroup.c                         |  75 ++++-
>  include/linux/resctrl.h                       |  24 ++
>  12 files changed, 574 insertions(+), 44 deletions(-)
> 

