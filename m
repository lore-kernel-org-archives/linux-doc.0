Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998606F099;
	Fri, 20 Dec 2024 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734664408; cv=fail; b=dbJEMzPgcr5CdfvxgZTRrRcxI+0MEIKPAvYWtdVE/wSiMAr3aFOxi+HtCOwXO1/hZ4fpFtbzMozvcMLa7RbEthX7xSPxyuzBWhwuoW9ibyDb5KjAnAZp7RymquRDMI0K55yPd03XAyHVYjzuPQK7B6y5sbMW8CK/GsE06UYp+To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734664408; c=relaxed/simple;
	bh=BHPYjSF+C5ZZqBuV/oo8RXnORB/h254lIT6otcEklq0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SXYFq3lkDSDHAzHNko36PSrLngxkTeNgH87z/kKQpIC2kWpBvRbox3SZ06wFMnYO+L061pz2NIyW6iC6l4ZBs9CsoCfSqaWbBoB09BkSH5pz3NL1PW9FJpkByl30XlcihCefSim+CYcjhKIBIGxlhI4ryLS93LIL8kmQVBBoj6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1ZcCMvv; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1ZcCMvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734664406; x=1766200406;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BHPYjSF+C5ZZqBuV/oo8RXnORB/h254lIT6otcEklq0=;
  b=n1ZcCMvvKghOQyL1Q4WfSnrTSzXgJcNPiapkPj9A3Nqsx7NRXIZql+3O
   8u48IFJFB3h+japdXC0T5WwEPPbHljgGxgCOF/7QLxiG8fT5p0NKOdg21
   YPbyLK6/h4idnPgUKxoSANrNhuJ/rT7SAU9QV5i/ND+KJKM2XLEBpeag+
   iQGoVOMNlOwNVt2U9fPLRHIduluKe/sNQHdMxKJ9XmJWWmzzEmWDv4j7r
   0P1W5UYX4V7RRkkgz1rwRY9xDsBwHE9k/to8YVInUDCrIGCGXM1iQBKUR
   0w3k2aPqhmvoSwFyC7Qgc2OWw0h/Wz3PebMItA8Y7DwhUYIxAzk6ExaCq
   Q==;
X-CSE-ConnectionGUID: hglaxKnpT1iQVq5xWXmg+A==
X-CSE-MsgGUID: TUjJ5iMwReiox9EaEpEcIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35370707"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="35370707"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 19:13:25 -0800
X-CSE-ConnectionGUID: hdd7RQCMSZKGO0cak2O+Bw==
X-CSE-MsgGUID: a81AkmrUTaOkK5FTsjqT3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="103261308"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 19:13:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 19:13:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 19:13:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 19:13:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKqY2HSvtRO5LukC5yrHAHf+6J/JU7FgkwJQsUmnNRsl3wzsPFI/olCPq49avGvj2sWZXDgvRqh6qXHpQvesDF7NyrhrZNZ+BMQNJyfdt/FJTAfTK5TlgOaZvYEnVoqz87rVJjTUk4z+m1IQOo5CtXMaVy4CpJDYsHGzyoelaDUci2BvnsE5wyJ2LA4yBJCVUw39KeQYkbxN/AQ39bfTkud0JUhBESHRGe/wOtMCDxHhaxj/CR9zpkU4BnwWPwwTVG038MhoHOnfR81q3KEj1PSPM8AkeOqm6GiMAF6AZk7EoDutN1Cwg17JsUNN1ZGfBHv5sMLtdUp4EhSNuKU4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xtbB55YD2KMz50jU0tjqo5Gvkc2Ph0ero5B8jTUvDs=;
 b=mGe6y6eyZ1J9zxz96fFIed2dB/kqU6WDO32FfY6EnqaeWJuWbsBVOttXAOK2fk24rJICsbHQ6Ez4eubUVA0huI3fYIOQueAnZYTU2tsj0pnu7kwnsnAo8G8O4R/vg0bCC1SPbM/1KIGDZ7FaH+QG07pC0ktCHbixEQqVWlQ+sFPl78wlYwmwSuD/xO6Cd7+/UaIMbwHPlQgmaiBJbW1y6DobKcJdgBAcYyaWYBar7UhqX2WVmn0KmruZwy7gzs49fvrlweuEhVz++ttF9sZRVDHxYLqDhOx65QCzV1Ieth2P7Y3+upWpWrkAkZVJO6pbUcbr+/sUlYFYWA4zXltJoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB7524.namprd11.prod.outlook.com (2603:10b6:510:281::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 03:12:30 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 03:12:30 +0000
Message-ID: <5e1471a0-3484-4273-9be7-94d084d2cc4d@intel.com>
Date: Thu, 19 Dec 2024 19:12:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 22/24] x86/resctrl: Update assignments on event
 configuration changes
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <andipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <8c8ecf12622c649bd269052b9fcd436710446034.1734034524.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <8c8ecf12622c649bd269052b9fcd436710446034.1734034524.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:303:86::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: c99af657-0dbe-495d-4ef7-08dd20a423f3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmRTejBNMENWcCttYUYwWVpVakhRckRneTdWeHp6ZG5rbEVCV04yWkp2c1lY?=
 =?utf-8?B?YUhHcFU1TGJodUd4VVRyd0t6czZVL1BDUkxnM051eHlLclN0eTVvTjFlWTlV?=
 =?utf-8?B?WVVIbldyaTRUWjBRUFRQektIR2t2b0RkMXR3ak96RTZVT2lXWGRyOGdBQW1V?=
 =?utf-8?B?YUl4U29pd2xHZXdCM0tjZmhWZkwzSjQ0c1U2cTNLZUZCWnEwUytUY2M1QzVs?=
 =?utf-8?B?V3I2aXE5ekZZY1RoUVpiWUh0WW1CZWR5RkdqdUwzaEdjVmlFSjNKQ1JSRnUv?=
 =?utf-8?B?bUY3YlpzRGlIREZqVm9yVjFrNU9JMkJoaFF2cHlaelpGN04xWEpkMEFXNnVP?=
 =?utf-8?B?SFR4VGpzSlZucHdwNGl4RnZadVRUKzVBVk5uS1dWMkJLaXgvUHpyUktUT3Mr?=
 =?utf-8?B?R3lrdk5NOXFBSll4NitoNU1qR0V6aVVTUUtFUEphN09qZ2tPaEUxRm1qQXoy?=
 =?utf-8?B?b0ZpSFI0SWMySGlYRmJyZjhmZzFrT2dOWEVJREpWZkdQVVZGZ0ZNdFFiaUFC?=
 =?utf-8?B?bU1rYVR4VFhOSytzeWlnWWhGeEhDRkVlOVBvQU9JWkM3MFVoNlRUTXlGeDBN?=
 =?utf-8?B?UlFkT0tkNElDU3ordlNoQlJQMkVDUHJ5SzlmWkV5em5DN3JmRjd5QmVaWmpI?=
 =?utf-8?B?RjQrL09sdSsvMkdINmNrcm4xUW9IRzdxMzdlVTJSbmhlMkh5d25HYmhhZ3d0?=
 =?utf-8?B?OXdYcjFiVkR5RmtIaXhDQnZsNHFJN3BBTFNqNkpwekFwTmNmRXNORDFsQjE0?=
 =?utf-8?B?a1RRNHBwSWpmUjVBdTFLT0U2dFNXdnhUTVZIaXc3RTJKT1l5Zlc5OW12cDNQ?=
 =?utf-8?B?cU54dXV0YS9rR1pSbU8zeUVwL3VidW11bE1JV2FodjN4dkxGU2d4K0h4M2Ny?=
 =?utf-8?B?ZUFjTG1rdEJtVVU5MHp6Z1JmOUs5M0kwY3hUUVR3STJqQVNpMWxMN1d0dlpO?=
 =?utf-8?B?dG5LbG1JRFlsRFY5RmI4SStFbCs1eWpIdGcvMEpIbU5zR010S3l4MjNYa3Zk?=
 =?utf-8?B?SHUzcDFaM1Q1aVFVS2lzRGxKNGdqbG9YZGRFanE5VXlXYWYrUWJTME16eHVx?=
 =?utf-8?B?R2ZSM0N5SlltM2pndTYzUmFiMEZNWG91SGZGRGJGejZybEZHVS9JcVNYN3Jy?=
 =?utf-8?B?QmRTd3JpRHRNRmd2cnJVSDFKeEhqbTUxNTBXRlR5ZFpETnlwQzI5elpSTTM0?=
 =?utf-8?B?djlrdVN2cUN2UTBlY0tmZExnM1ZLYjdjV2tBQzZjQXhGa1dCaGVJVUJEL1FQ?=
 =?utf-8?B?ODlsZkFMZ3dnVmhjMDhBZ0w4N0Q0RTNXN2pmWVI4TjM4bnlFZmtpMUxHdEV3?=
 =?utf-8?B?UGhJbWpDamlaZmg2a0R5Uk9CSWNFc2pkUGxSRkRWSUg2cXFlTmE1L0hIN1lX?=
 =?utf-8?B?MmZ4Q3ZXNi9BdXpyeENXREhoYmxmK0N5TnJycW1hQkUxYVJyYlpYZy9yNXRw?=
 =?utf-8?B?VFRrb3ZjQTEvSDU1dWMyYW1OeEphck0rWTRNRmZzVHpxZGozU2l3ZVNrRmpt?=
 =?utf-8?B?WkNiNE1YNWNZRDZKdW9HaGdzSERLUjZvQU1OS2huT3BYcmlIaGUvL0ppeitD?=
 =?utf-8?B?NkVrR2lDVkRBTXFkNEtvOWhmZU8rSFFQdVVlRkx5THl2amVjY1BxQ0U4WHly?=
 =?utf-8?B?MkwydTBjU3BKNG1YcXdIRS9KU2lVNXZrVzZqN1JQSnQxbVNlSm5heCsrR3Rk?=
 =?utf-8?B?T0xKTmlSelVGUUU1bUtUL1o2NEduN01aWWl6a0dyZlRobyt3Mis5OHlJdFM0?=
 =?utf-8?B?bmhzZGo0S3g2VVk1Ri8ycVRaZGMxUnlzUXpqNmtKckttVG4vYTlBa1NhZXVF?=
 =?utf-8?B?VUcrWDd2UTFUWU9iQnBDMGI2UGF2cDQ3dVcwcnFIa0tIaDMxOW0rb1RIYTRt?=
 =?utf-8?Q?rpqPJAgoQx9Rq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2tkUWM5b1psdDFRRWFoL2ZwR1dub1cyT2h0MXN3dEM3Tk91T3hoTzZ4YUtO?=
 =?utf-8?B?U3FwTXJRZ2ZKQVRndHUvTUY5cVdrR0JydnI0ODI3RnIvaEw1aU9rRTNFaWR6?=
 =?utf-8?B?V1JLSm1xNjJUU3VLK2U5SzRPcDQyMHFVNFRXZFFQNzZiUXNmS2pNSlpkbS8x?=
 =?utf-8?B?Sk1GalZYSkNNRlVVc01pV1VkK0htVmFMR0lSWUcyR0VyL295cEZ0Rnc2QzdJ?=
 =?utf-8?B?SVJWM1VHQ0JUbFRNV3NZTHh5WHYrQzA2ZXNQY0FTeTc4ajJ2K3NLdndvQ1lX?=
 =?utf-8?B?QU5SVHFKRGdYa3dKYlNtaTJ1S1F5NGhqQ2c5MmZHZld6Y0JMcnlMVmNrY3Zp?=
 =?utf-8?B?d1M1RUNrVmhTWXVFYTFGNm1ZK1Exc25ZOTBUTUlNZG5SRHNJZkVwbkxkMjh6?=
 =?utf-8?B?cjl6aWl2SmVnU2NUdGVNVnR3KzhTV3FUemo2cVc1bFF4djkwUVQydEZhdWNY?=
 =?utf-8?B?b09admhNeUNReXMyb0I4azg4WkZMQXI0bldCYUllenowUjJCZGkzMHJON3Q5?=
 =?utf-8?B?UVNOcmdMMXZienVmTkJxbjZUbUdIditVWHdnQW9zWkQvSi96RFVVK3pLelgr?=
 =?utf-8?B?c01HcG52R2thdTNqL21HckZpcCsvZkFJaFB2MWJ5aXN3SXFZa00venRRdUw5?=
 =?utf-8?B?TSsvdlQ4TzB4Y3JMb0RKYlVCVlVzMHk3UnBocjQ3ZUwvcnJTeFVEM0poVTA0?=
 =?utf-8?B?M2hUc3FJOTh2VkJqb01JSTBFNzBQTzk3SUNLUzY2YU5CZEpMZUtGbkkvSC9G?=
 =?utf-8?B?SVVnSDJjVmorZTBWaitWY1BpcXJEazhFWTgwcUdxa20va0ZiVHQ5UWgxWDcw?=
 =?utf-8?B?M3dYV1dWSVg1QWV2Rmg1SHRTS2RBNmh6a2JubCtrNUdoclpMN3A5VlB5ckY2?=
 =?utf-8?B?NE1lMjJhNlEvTWRQUmRkWDV5S0FBQ011SXIxMHdsNWNtS3BId2tKaUIrU3N6?=
 =?utf-8?B?RkwxTDF3SXNuSjN6aGxyT2YyYjJCTGhaamlMRGJ6VnFLc1RtSEhCZUJrS0Fp?=
 =?utf-8?B?NzFURWl4UmRVUWh5eDh4cEdkeklaTEpVbTIzWDN3R1hNTWVydnA4bE5CRFJO?=
 =?utf-8?B?YmZzdXNTdlFnNUJSVjdqb2dHVHdReFZDRFg2NHZDMnROWVhFSVo0QU8wWXNr?=
 =?utf-8?B?bXhYQkN3Y3ZMZk0zZ0JveW54eDdlK1hXRDFuMGRLTFQ2OFdZZ2kwekUra3NO?=
 =?utf-8?B?MU9KZ0dHbXFIbklTSWdVV29BMElycEpuQkYvcDV0WTVUejU3T1JrRjh2QkVM?=
 =?utf-8?B?V0J6SlYvU0FjOGwyRGowOXFoOVcrcHRtZzlSL1lOU1Z3MWJySnlVYjlBRTRq?=
 =?utf-8?B?R1ZYR0RLRmFjYUprL3BZaE5hWVh3anJoZ0FpajVnbzNrV01DUUtNK2hxSzNC?=
 =?utf-8?B?WTFuOXZRYktnQ2NnY0FLRE9PVkFFNnlMS1pHeHVBUE4wbE1ielUyTmE4SlNU?=
 =?utf-8?B?THJxckRBOUZ2aU5EM0NlemgvZkdTOEVFbzFQNUQ3UzdpT3lJZU8zRUpJMXdl?=
 =?utf-8?B?TE5mVzQ2VXlkbSs3NG5Cbm9MOGt0QXk5UGs3b29pUGdxSVNjclY0d1d3T1ps?=
 =?utf-8?B?Ty9DMTUzTW9HZlFrVlZjY1ljTVNPNWp4LzR6c1RCMHZUeUFGMUJ2SE4rZE9D?=
 =?utf-8?B?WkpGVFM1eE5tSkpGdTNnVnFyVHpTRmdzYWZqZUJiVGZZc1lBU1FtTDZRMmRS?=
 =?utf-8?B?cHU3Rm9KbkZoR3p4QWF0dU03WmhJQVFhZDlZSkJZMExvU2lYNzJ4VFBMSkht?=
 =?utf-8?B?R1BVbXZBODR4akFZZnVqalU1T2ZlLzRTYXgxUzBFRU9oZjh0YVdtVDJYM3Jv?=
 =?utf-8?B?T05FSVlxMEhCdjY0VlNiS0cvOHkxTmpOYTBRd0dJb3RmNnluZ3Z5aUJpclc3?=
 =?utf-8?B?WUowTldDMlE0OS9mV2VDMm1LWXVoQm9OajZONDJ3WFBCS3VCTzMxRHJ3TEhJ?=
 =?utf-8?B?YW5xUDZmWTlzc2w0endlaFlodTRnRnhEYjBpNlZ0eE9XNCt6aDBnRk9OQUVu?=
 =?utf-8?B?Ym9hL0lUSWRQaEZhZVhNYW15a0JuMHRDM0FlT09zVjdEWnQyK21DOFpuR29q?=
 =?utf-8?B?RkVuTzhKNHlzeEYvdUZmOWlvTXcxY3BqR0VpbzFzNXJsbVBPc1hwRUtKNFEr?=
 =?utf-8?B?cEpPYkVOb1pTYTE1WXMraFRSV2NST0hwOGRMNVJiOVpmTS96MXZ3TTZrZ1dq?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c99af657-0dbe-495d-4ef7-08dd20a423f3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 03:12:30.7917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+XP3ZcULPo9Jn7LGcl0QNEutu9NY0HIDAJLMojpWDrW5zzpatV4wUSgFZ6tGLhHeUHKstw3MPgKKiCbqju2JFXAh4AEzvwitbTGhGyKA9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7524
X-OriginatorOrg: intel.com

Hi Babu,

On 12/12/24 12:15 PM, Babu Moger wrote:
> Resctrl provides option to configure events by writing to the interfaces
> /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config or
> /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config when BMEC (Bandwidth
> Monitoring Event Configuration) is supported.
> 
> Whenever the event configuration is updated, MBM assignments must be
> revised across all monitor groups within the impacted domains.

This needs imperative tone description of what this patch does. 

 
...

> @@ -1825,6 +1825,54 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +/*
> + * Review the cntr_cfg domain configuration. If a matching assignment is found,
> + * update the counter assignment accordingly. This is within the IPI Context,

This "Review the cntr_cfg domain configuration. If a matching assignment is found,"
is too vague for me to make sense of what it is trying to do. Can this be made more specific?

> + * so call resctrl_abmc_config_one_amd directly.
> + */
> +static void resctrl_arch_update_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				     enum resctrl_event_id evtid, u32 val)
> +{
> +	struct cntr_config config;
> +	struct rdtgroup *rdtgrp;
> +	struct mbm_state *m;
> +	u32 cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		rdtgrp = d->cntr_cfg[cntr_id].rdtgrp;
> +		if (rdtgrp && d->cntr_cfg[cntr_id].evtid == evtid) {
> +			memset(&config, 0, sizeof(struct cntr_config));
> +			config.r = r;
> +			config.d = d;
> +			config.evtid = evtid;
> +			config.rmid = rdtgrp->mon.rmid;
> +			config.closid = rdtgrp->closid;
> +			config.cntr_id = cntr_id;
> +			config.val = val;
> +			config.assign = 1;
> +
> +			resctrl_abmc_config_one_amd(&config);
> +
> +			m = get_mbm_state(d, rdtgrp->closid, rdtgrp->mon.rmid, evtid);
> +			if (m)
> +				memset(m, 0, sizeof(struct mbm_state));
> +		}
> +	}
> +}
> +
> +static void resctrl_mon_event_config_set(void *info)
> +{
> +	struct mon_config_info *mon_info = info;
> +	struct rdt_mon_domain *d = mon_info->d;
> +	struct rdt_resource *r = mon_info->r;
> +
> +	resctrl_arch_mon_event_config_set(d, mon_info->evtid, mon_info->mon_config);
> +
> +	/* Check if assignments needs to be updated */
> +	if (resctrl_arch_mbm_cntr_assign_enabled(r))
> +		resctrl_arch_update_cntr(r, d, mon_info->evtid,
> +					 mon_info->mon_config);
> +}
>  
>  static void mbm_config_write_domain(struct rdt_resource *r,
>  				    struct rdt_mon_domain *d, u32 evtid, u32 val)
> @@ -1840,6 +1888,7 @@ static void mbm_config_write_domain(struct rdt_resource *r,
>  	if (config_val == INVALID_CONFIG_VALUE || config_val == val)
>  		return;
>  
> +	mon_info.r = r;
>  	mon_info.d = d;
>  	mon_info.evtid = evtid;
>  	mon_info.mon_config = val;
> @@ -1851,7 +1900,7 @@ static void mbm_config_write_domain(struct rdt_resource *r,
>  	 * on one CPU is observed by all the CPUs in the domain.
>  	 */
>  	smp_call_function_any(&d->hdr.cpu_mask,
> -			      resctrl_arch_mon_event_config_set,
> +			      resctrl_mon_event_config_set,
>  			      &mon_info, 1);
>  
>  	/*

Reinette
