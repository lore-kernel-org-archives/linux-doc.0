Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E4481238;
	Tue, 16 Jun 2026 23:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653148; cv=fail; b=pZDKpwd30ijKcjaQJIOWCqp1OhiJSylUQr4SySJDpsfiyG5v5HONZEZ0YmYBaUQBV4tPA5hDRALmDBhMxr69QpSmwMmqcPTPdYYdMKrWR/8QAyIqsB8c5d2RfOM9EYebzGAi8MoA8N+GBvWOWx018i8rN2hTBfyr7E5Iy/DlWp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653148; c=relaxed/simple;
	bh=hTB1V9Y8SBBYa4My5IqPg8wmzxnpjltphUznSDCK9wE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Eg+j/hE1BTPNmGPeiFawBJs87YOVun7nhOn2bwGYPWWc+r+nJ1kN8WQrQBA+Drc6yUV1w4Nh2dYKZlm9rdq1THJAk4rRFMAnlkE4Ed6KQTbuiH1Rn31SEfGS1M4h/nz0XKsI3nKxjzTM6CrZRBYNhMpMp3LHGBYDe9K3bjBTUwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwGPakYi; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwGPakYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781653146; x=1813189146;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hTB1V9Y8SBBYa4My5IqPg8wmzxnpjltphUznSDCK9wE=;
  b=QwGPakYiYMQCWPk8J8qI5VNQWWBs1U3G3dO+vFCOSXtYksmmj7x/XP7m
   51KBWUnKj0/S+BXwBSj0pKuDP6lQO/RA8vr/zPAPM/YxwYBPv+2iGB4iI
   gn8Ob81+G94bdPtNE7f930Rgbq40ANY13TESDgghAIvYidllhNvnu9c1k
   FcqrLNMLFXsHDE27pHNb0kNtHHWcFAhGTWvJxy5pIGNmhUFU+G5fSdg5O
   Vc5pO+nEqCwG/GDe3NlXz4g/EUmMQN1glRhlA/9S5M8EEFNluUqXZ6w+p
   Ls3aUnrei9fQIKhpI/MLAPM8g/v4b8IkGz6Y7+TR19UwDw1On6xkNzwME
   A==;
X-CSE-ConnectionGUID: WHGJ+QYkQ0G4VtRfpVb+IQ==
X-CSE-MsgGUID: co5SE6zeSe+qGXnqcYH/Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="84996653"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="84996653"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:39:05 -0700
X-CSE-ConnectionGUID: Twi0CR1FSie/mKVPc/y1SA==
X-CSE-MsgGUID: YsBjRJRgSgqOpY6eJw0Idg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="249815182"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:39:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:39:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:39:04 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2npilqKqpbK75lASZHHvlTwcyfoH2OJfHnaYY4dA9WUCIKIFB02eVY+fkvxzCrfZbI018Qcmhm8rT3NosFN6L/K/dUhSTQGlVnxOrLtKkJ+0x4H8YHAXJzOML/QrJusQCFTRdYs4SAdLr+8ASGlT0m7cK65zOu673UqfcKIQwI4xRe7mrSGTtR7YfOHiJ3MpnRxftjoFo1uxnF+PfFeCWvfhXQ1msS7aaCw4PtkT877EMKlkuCNK/M0gRoLiP/kMRniGFv8XwW+0r5R6xriGda6etDq2gbFJTkT2zVuTJPbeMTIahVwBtjlxfEh7D4CHXWg0EU8Wja3JYlUdDCqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLjQyCeIWoYp+r1JrtPRMNjdnaHiue2h3VFwznxJb00=;
 b=ukdZKJb3i2FHrxdZbVu+UMsC9Wg2SCN5R60/e6hxSXHou+arX+UWpAdu57LwIBEN5YJ1UrxMQInCx3vR1phwgEfiIUfGoTfuu65ANQsqTMJhr8zR44CypuRj+yC46UsDMKnFRsVVlrjC1aYcJbizmzaoKoZMtzukrvD2iJv8Off/UQLoTpwbQN18b0Cw+xNmWzBaJCCYwSQ3nlbWiDAVxDx68Z80VpfjmBLHfj8m1y495oShRGheqgNJZQjMMOvReG4eW9JyJNhwKV+OIGw/LvsMtZD874q+b8Us7/CNq8VEZi1NiLk5YxVZp36FMM76n/MdyUNFvKkazkmx4/z6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFBC9025319.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:39:00 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Tue, 16 Jun 2026
 23:39:00 +0000
Message-ID: <2429a51a-92ad-4810-bee9-44bd6fba3443@intel.com>
Date: Tue, 16 Jun 2026 16:38:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] fs/resctrl: Add info/kernel_mode for kernel-mode
 policy introspection
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
 <549bf0fadf1cedb5938599be58e53b7464c939b5.1777591497.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <549bf0fadf1cedb5938599be58e53b7464c939b5.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFBC9025319:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc70e88-1547-4a91-b171-08decc007135
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|6133799003|56012099006|3023799007|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: C0HE2pEtoTX5A9GyKD4oSYadZvdG7bAi1veY7qPQBknyyCIEUeZEnmiNsrFMXsyrOd6eKejCTW/SR9qg5uXFzbUg2gB8dllKV7C2ldlJ+NZa27sA8iK2Tdw8YI0XmE+V84fEcP6oOJYsS3KKGfB+Hgqkatz1fhH7FF4sNoBm1JxlZfWDswNy95CFQzKgZe7rUQ9lxzcqL4tJYpqOgY4XldpupNXxrTG+0Uonzflr7wn1nBI7wc0kS1qRF5+qHPNfGmMYlG80wpZvCG16aN4V1ZLlTeU9qnROO2XoJ39PDf6EVj7HF7BhiySbKB+bcfO4gn2PDMJPJPpOSQT/KWakAl+EsxvJ3fe1KPBQrjynuQgazF3IjWxE0TiPwM8cP8KS5M+fhKJjZ8rqvK6qP/H07Aie2/pn3/Hkx24rNW7YnAkSs+2wYkSabl008sazzSClqUDaeqljYUN3kPbvlwcchc5meFjB6zpot2S8WiAsjbyeaDFBWH3mDIqu1NFDUcy+EC0RV69COzoB07yHvb4p9aHpbm+bFf1Dr6H1W6iNWLCxjt/2KrClbg+BgcaNAs+Wj+tWTdRplqUpbP586T01wNaEhm/kh8CitWAM03Q4Kr0YvKm6p74EVYrABYdUjxLrVmbbEmi+aV/Gq2HsI9gu1RcjDfDZ8Q4XSoUzGWDJHMvL4tNlnQNlG8v9pDho0d5BpH/m9OAY/pzeLG+vk+gq3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(56012099006)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0dydkM3eW1yTVFUYmJYU3BybGZOUHppMzg4VXhheXFZeUVCQXJOcmhYTC9o?=
 =?utf-8?B?dm9YUU5QN25OTXNaVERzR3ZqeXlaRHo2bkxwZHhFNjdxdVU2N1FDTExiWWpx?=
 =?utf-8?B?L1BhQlRDbWNpV2QvRVRmcURaeDNCZXRmWmxZY3lvamtJT01tSVdIV3FKaE9k?=
 =?utf-8?B?Mk5HVldVc3NoM3lEc3hSa3dZeEdtaktwV3phd2pqRE9yeFZGVXoySnpyRGhH?=
 =?utf-8?B?ckVyTWtmRzg0cUFrSTdDdW9kRmVWaS9jTTYrR0JzRG9za2lIdXh4bTNPWG5s?=
 =?utf-8?B?ZE5ydWVMeFVpblBCbjZEMzlxaEtyNHlYU1hiWjRkWUQzam1iZ05RQjlRQUE0?=
 =?utf-8?B?SmpFRFRiZFRNcExKbjl1Y21SamREdDZFYUNFRUZ2SEN4K0IwamovRnZydTA5?=
 =?utf-8?B?MGEraXZEK1hHMzR6bGtDdWtPdU9rUE9GQmRBcjh6d3l4YmhLTDFUS0REbytt?=
 =?utf-8?B?d3hJb24xMFZLS3lZc0REdWw4VlY5NmlnS0x4NloydWJYa2VHVFZxRklPbXo3?=
 =?utf-8?B?SHEvWmNSdjdPVm1kZDFWeEI2WFRXMDhYdEIxSHphKzFLNmN2UXJONFZGaTk4?=
 =?utf-8?B?R3F1MmI2LzNCQ3p2QkFKYUJMYjJOd2kzZVpId1orUUExWXlpREZTQzlubzhP?=
 =?utf-8?B?Snp5WTBvQmRjU29qNUphQ3ExSjFKRXJzcy9lUVFBb2NCalNkZUFibVprbEhN?=
 =?utf-8?B?em9hL0p6N0FIaE5nQ2RjY1QxL2RDVlBHaVRKSmVwWkY3QXhDaGZ6RE5vcHJY?=
 =?utf-8?B?SERjRnlxT3R1eWJGdGdOWmhBMGZqaFNtcHNNN3JZK2U0WHN3Tks3QjV1d3ZB?=
 =?utf-8?B?SGRmUlhKblZPdFdDOVpQS0R4UytCbmVuK2hNNHJmU1MzYXMwSUgxK2U4TGNC?=
 =?utf-8?B?ZDZ4Rm53WFg5emZPaXo2WTM0ekJiajBqb0dtM1FHb1F2R1lKVkxUY2NwUDFa?=
 =?utf-8?B?a2IyL0dTeU5iQ3JOZExHNEo0MGJsTHp6UDViS3E1aVkvbVNkUDE1ZHdYN25v?=
 =?utf-8?B?UmdNOXFQbFk3c1Z5d1dqS2dIVWk1NnRxamxSMFdlS3JLWVR3V2I2NVJGWTBY?=
 =?utf-8?B?U2V5VHdxcUdaaEZFRG5PekIrT2pJYmFEWnd6bHNObllZeTZBa3o1ODh6ZU1m?=
 =?utf-8?B?YjZ3aGxYUjFXSWxDWkRIZFErbHJHMUNXOFZacllZWWFkNG44aHVLS0JBb2p0?=
 =?utf-8?B?ODN2SDljRXhXc2NnMlVLL2FJck5ndEQrZzlKbjVyZ080bFlXZkhrRHBkQzRE?=
 =?utf-8?B?TWQxdUJjNkxsaGZWa1ZKT3lUcmVTWDlZZ2FSNnRtL2Q5bG9rRW4vcVlnZWJo?=
 =?utf-8?B?a2d4VVY2ZEJDNFE4MEdwSjR4SFBSOU9aajhHdFM4aEZwRGhvdDlOb09DR09y?=
 =?utf-8?B?KzQrL3RvcjIyaWZmVkRQRUNsYXNMTzhtS0V6bHIxWWJhbHFnTFR6VE8xVzhX?=
 =?utf-8?B?S21zRWplMy9uOUd2d2hEMXMrSTRRVEcxNFZVMDRqLzNGbDB6UWY0TExUMHQ0?=
 =?utf-8?B?bmJPcXJuS3BCUWtELzAycEFqSHhTMldTczZIMUp4SXQwcCt0TDlRQ3VZODE1?=
 =?utf-8?B?YVBNMDY5dDlHb0xXN2NuSENYRGNPOFgvWVJuN3liWm50S3pmYklaWTN0dWg5?=
 =?utf-8?B?ai9tclpVMDFaNE9FUE9ac3lEaE9zNmNMWlJpNVF0emdqMjQ5dkJzM2JtZjU5?=
 =?utf-8?B?Wk1kWER2K2xIbDFoUTdyUGlpWGI0VmVSV1BvWG1NMkJOQ0thSzNkNzF0cm5p?=
 =?utf-8?B?eVg2a1kzc2tpUGZ4WjViTEYvVjd1eWpPeXlLeE1GUHZQZGU1c1k5WFBqcCtG?=
 =?utf-8?B?Q2s2KzM5UWRhcStzWDlRK0VXTWJRSm5TSjFXQ01OYU1ONzVjdDJvS1ZnVEo5?=
 =?utf-8?B?N1Q2bkxlejUyK0o0dHpoSlZIKzFPZjdWeG85SnRpWjRUczV4QVd5bjlTZnI0?=
 =?utf-8?B?a2F5OTk3UnRNMHJQNlVlQ2w3Wmg0SlpBRjBvS3dkakJiZVpJNlBTeXZ4clRq?=
 =?utf-8?B?SU1BTW41V3JQOGNiWXVqOUFYTFViQktXOGJ5eDNLZS9WaGtldHY2R3JmK1hU?=
 =?utf-8?B?Ujk5N1JxTWtlakYrcmRVaVdibjJYSFhtWFE5N2xxKzZielFkcDBDbmNnc3d3?=
 =?utf-8?B?TkdqbEZRL3ZRMm14M2NrelJtNG5SSlVlVWowcForcFExcXF1MkowOUdvRC9v?=
 =?utf-8?B?bDA2KzRYSzUraG1MTjQwOElxV2RzQ0Y0UThzZUdiSk9vMy84SGxtNDNFMTBa?=
 =?utf-8?B?SFV3Q09hOG1rWXJ2aVpoSmlJeTI4RnFtQytUWFNzQlhjeXJrem91RWtlTXpu?=
 =?utf-8?B?c2FIRURWZzBYRTdSSUhId3VienBkVCt1WmprWHVnOTR3YUtlUHU3VHZ2UXNF?=
 =?utf-8?Q?jPZ4SwErLP3AiDLA=3D?=
X-Exchange-RoutingPolicyChecked: eMUsVx+FyoSNFM3jXO+IlS7oiX9Ku041DTqX7tFKSUmhzt3PQXJHhHT+tlA9cCKFCkDGhzwkrntr9QBTupjG0rIsE+B5knlVfFH+wtFO9XA1VKrqTyY+Yxk4UnCreWVxDRTMSbKtEe+bPFG4UUwZ2Ra0FwIXysPFrOgFoZoPH2LfSpgPDq1Fz7XsB/18H+F2N6huBpzgrtBu99mgX7oLD+V1TcEKfB79leIgofNGKcxhqGW2plPPbxtYdA4ySv7vwCZJpRpeALHtC7I6Oa18yvQbXESCKrowT9dUB6e0A2cKHXbnJFg9G/Qg8EhppbHLRv4pjJh1wOUBZLKW4iGL5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc70e88-1547-4a91-b171-08decc007135
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:39:00.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKC9WwUdWcU75s933yH5zTEUUy0JISnYJPlIdwkV02xl630gOC9SybPlDUD6GimT2AXJS7j3iplIvIucv9ZLxE44KzZ1hgnJ6XtE3aLmX58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9025319
X-OriginatorOrg: intel.com

Hi Babu,

How should "introspection" as used in subject be interpreted? This just
displays the supported and active kernel modes to user space, no?

On 4/30/26 4:24 PM, Babu Moger wrote:
> There is no user-visible way today to see which kernel-mode CLOSID/RMID
> policies the running kernel supports, which one is active, or which
> resctrl group currently owns the kernel CLOSID/RMID.

Why should there be? This is a new feature being added in this series.
No need to write this as a bugfix.

> 
> Add a read-only top-level sysfs file, info/kernel_mode.  It emits one
> line per mode advertised in resctrl_kcfg.kmode, in stable lowercase
> spelling derived from enum resctrl_kernel_modes, e.g.:

All these changelogs feel so strange ... as though they are written by
somebody who simultaneously has no and full knowledge of resctrl.
These verbatim descriptions of what the code does is not necessary. Please
start with why the patch is needed.

> 
>   [inherit_ctrl_and_mon:group=//]

This is unexpected. There should be no group associated with this default mode.
This is how I interpreted our previous discussion ending:
https://lore.kernel.org/lkml/6709398b-269d-47b5-9b41-084f410bb1a6@amd.com/

>   global_assign_ctrl_inherit_mon_per_cpu:group=none
>   global_assign_ctrl_assign_mon_per_cpu:group=none
> 
> The effective policy (resctrl_kcfg.kmode_cur) is wrapped in square

(needs imperative - please check all changelogs)

> brackets and its :group= suffix names the resctrl group currently
> bound to the kernel CLOSID/RMID (resctrl_kcfg.k_rdtgrp), formatted as
> <ctrl>/<mon>/ with empty components left blank.  Inactive modes are
> reported as :group=none.
> 
> rdtgroup_mutex is held while printing, matching other info/ show paths.

No need to describe details that can be seen from patch.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v3: New patch to handle the changed interface file info/kernel_mode.
>     Changed the group name to "none" if kmode binding is not done.
>     Reinette suggested "uninitialized". "none" seemed more relevent.
> ---
>  fs/resctrl/rdtgroup.c | 74 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index a7bfc74897cc..9cdcfa64c4a2 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -988,6 +988,73 @@ static int rdt_last_cmd_status_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +/* Sysfs lines for info/kernel_mode; indexed by &enum resctrl_kernel_modes */
> +static const char * const resctrl_mode_str[] = {
> +	[INHERIT_CTRL_AND_MON]			= "inherit_ctrl_and_mon",
> +	[GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU] = "global_assign_ctrl_inherit_mon_per_cpu",
> +	[GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU]	= "global_assign_ctrl_assign_mon_per_cpu",

Please make alignment consistent.

> +};
> +
> +static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
> +
> +/**
> + * resctrl_kernel_mode_show() - Enumerate supported and effective kernel-mode policies

"Enumerate" -> "Display"?

> + * @of: kernfs open file
> + * @seq: output seq_file
> + * @v: unused
> + *
> + * Emits one line per mode advertised in resctrl_kcfg.kmode (each mode is one
> + * BIT(index) per &enum resctrl_kernel_modes).  Every line carries a

Above is clear from the code. Please instead describe what this means.

> + * ":group=<name>" suffix:
> + *
> + *   - The effective policy (whose BIT matches resctrl_kcfg.kmode_cur) is
> + *     wrapped in square brackets and <name> is the resctrl group that
> + *     currently owns the kernel CLOSID/RMID (resctrl_kcfg.k_rdtgrp),
> + *     formatted as "<ctrl>/<mon>/".  A component is left empty when it
> + *     does not apply: an RDTCTRL_GROUP emits "<ctrl>//", an RDTMON_GROUP
> + *     under the default control group emits "/<mon>/", and an RDTMON_GROUP
> + *     under a named control group emits "<ctrl>/<mon>/".
> + *
> + *   - Other supported but inactive modes are emitted without brackets and
> + *     <name> is reported as "none".
> + *
> + * Context: Called under rdtgroup_mutex like other resctrl sysfs show paths.

This does not look accurate since it is not called with mutex held but instead
takes the mutex itself. Also no need to refer to what other code does.

> + */
> +static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
> +				    struct seq_file *seq, void *v)
> +{
> +	struct rdtgroup *rdtgrp;
> +	const char *ctrl, *mon;
> +	int i;
> +
> +	mutex_lock(&rdtgroup_mutex);
> +	for (i = 0; i < RESCTRL_NUM_KERNEL_MODES; i++) {
> +		if (!(resctrl_kcfg.kmode & BIT(i)))
> +			continue;
> +
> +		if (resctrl_kcfg.kmode_cur != BIT(i)) {
> +			seq_printf(seq, "%s:group=none\n",
> +				   resctrl_mode_str[i]);
> +			continue;
> +		}
> +
> +		rdtgrp = resctrl_kcfg.k_rdtgrp;
> +		ctrl = "";
> +		mon = "";
> +		if (rdtgrp->type == RDTMON_GROUP) {
> +			if (rdtgrp->mon.parent != &rdtgroup_default)
> +				ctrl = rdtgrp->mon.parent->kn->name;

Isn't default group's kn->name is initialized correctly via
rdtgroup_setup_root()->kernfs_create_root()->__kernfs_new_node(root, NULL, "", ...) ?

> +			mon = rdtgrp->kn->name;
> +		} else {
> +			ctrl = rdtgrp->kn->name;
> +		}

Can the names not just be initialized directly from kn->name?


> +		seq_printf(seq, "[%s:group=%s/%s/]\n",
> +			   resctrl_mode_str[i], ctrl, mon);

This is not where I understood our discussion landed. I expected that the display will
reflect what can/should be assigned in a mode. For example, mode "inherit_ctrl_and_mon"
does not have an associated resource group and should thus not display one, 
"global_assign_ctrl_inherit_mon_per_cpu" can only be assigned a control group and
should thus not display a monitor group also.

> +	}
> +	mutex_unlock(&rdtgroup_mutex);
> +	return 0;
> +}
> +
>  void *rdt_kn_parent_priv(struct kernfs_node *kn)
>  {
>  	/*
> @@ -1891,6 +1958,13 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= rdt_last_cmd_status_show,
>  		.fflags		= RFTYPE_TOP_INFO,
>  	},
> +	{
> +		.name		= "kernel_mode",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_kernel_mode_show,
> +		.fflags		= RFTYPE_TOP_INFO,
> +	},
>  	{
>  		.name		= "mbm_assign_on_mkdir",
>  		.mode		= 0644,

Reinette
