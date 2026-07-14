Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E96027587D;
	Tue, 14 Jul 2026 23:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073594; cv=fail; b=iE7yE5/EE6bPkgxR401ep1hP/TsTi3R2rPVJwPasqY4EHPeV9nTBcTxzyevXux2X4PghNDk1EFUPg+i+EO9mTXpV0czv0d0hkb2rsyXqkX93WLsUA6bSxPyJOAZRvk2eEei+QGcsRPpXq3cezsr11stMKz7MO7aiK28x8OVfGSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073594; c=relaxed/simple;
	bh=1ES0cIykx5O/8EIDVOr2xLnnLCy/diZ7QXg6/rRsXto=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bFj8pY9u5MbCshbgSfS8Sh+9GeIy3zKgi2tJFZaiJhGeP4GJOdsEEyuMIpAwZUKvfLVQL804Hf7+osz6wE+Hc1UzEDMsXo6l3D6D4UmiXk2VYWOSC4vJuLh2FsAhSUlaiULPXYzYLXlp8hkaegLKRmxGzMdbI5vIOUZuJH6B188=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXD7j4Ir; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXD7j4Ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784073592; x=1815609592;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1ES0cIykx5O/8EIDVOr2xLnnLCy/diZ7QXg6/rRsXto=;
  b=eXD7j4IrnmpxW1fKSrlgLde5EqSxlDMZpwgFeQfoSEqnN9HYvUW7B5+R
   47eVO13JMLuCXuJAZ/szIsTFdIUWRgLWPhae86DE3/Op4FZ0N02PAhu54
   h1fUVCszdf8JkPj4+3xKsRsAOCHONGfv0kw3uBE5YXMtdBXeW76zDDB8a
   63C9o/JbcrnHmL+EpQwO595Ghi/ZKqxN3o+bOMSrEtv1dD9Xkf81wbjem
   S52h7Ph3hv+pGubtAdLHxmwH5hjMZLEhlMXF0L70CZ8Fy7RlZkOzmDGL6
   oFlfcQLwgGkQdtbGO5eqDC9P3QRE8cyR9v9ErS0IqKXggr0s8Ii1qbXH0
   g==;
X-CSE-ConnectionGUID: doIyAhLfR3C+JO04LVaP/A==
X-CSE-MsgGUID: eG7635BLSPCOXZ5qT8Q2kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96215738"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="96215738"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 16:59:51 -0700
X-CSE-ConnectionGUID: bO2oyjSVQjSEEsUCE3Gc+g==
X-CSE-MsgGUID: 0eFVuTJ/QiWz8AOhsr4aeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="253384575"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 16:59:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:59:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 16:59:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 16:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK7xdnEV7S7iJUbqb4jGWBPyJUxc8VnlRgMSSNpNyaFREKh5PJRjtWzuoU/OqTcZ6N1C39BV1gzvDbNA8j1mPPl7BVYjHWVq6rax4k4xW4AVk0vaBOmKG/gy8ADBWTlxlh1PBRrLob4XzxtEB1IxLm1C1FvNozvtEAKyEFZpdvbj5RuHQ59HNZGO0oQg+eFaRM2s2yEP+csyZgBgrPrq6mKR27UapKCwrBRBH3Uq6JAiE0S4/htjdUfoZLUam2oDMjoG5Xlmbqm4LOir2WeatB05JNWlQu7SddoRhHTVtYLooxJ3OJY4eQqD6wn9al8xmgJMBAkYG+ETjrtHjH9w6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfDUea4eoIg2KvjFWJZZ/yeRrSZhd76i+hiS+WRZUO4=;
 b=qHvrgwQ49Y0m8tV+TlTAWdwkxm0gDi1shnbnzF4Pltvei+8oavsew4JhF38N8lZMBLiFGocOOUeAm9FCjsjyk4AoisowfeCm1cCUugEXj7OJP2i0VR84U/6FzvtUTvGzN903/R2Lp1Ji616pZhI5F/8VQwBPbUI51vqfV6SZMiOnKsHS/u8ph+R0+jXl1p57kQJ9rXOLHJgb0UKrBvZRYKf/cqrftM75Oihw56UeAFWZMS6o0dxgTJGq1BmmVKd6pRWkZzyiY4CJC90hLfl1fN4/YAwO6sJOjDinchymYbsMl4UxMdYRapS+AXprfFV47tNDemCKC0gEv1gHJuv0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CHAPR11MB9679.namprd11.prod.outlook.com (2603:10b6:610:2ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 23:59:48 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 23:59:47 +0000
Message-ID: <dc1ea24e-fdec-4c26-b043-af7f78e94bff@intel.com>
Date: Tue, 14 Jul 2026 16:59:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: "Moger, Babu" <bmoger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	<bp@alien8.de>, <x86@kernel.org>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<dave.martin@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <2cad039a-63ee-4340-a9f7-d8aaeeda593a@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <2cad039a-63ee-4340-a9f7-d8aaeeda593a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0040.namprd04.prod.outlook.com
 (2603:10b6:303:6a::15) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CHAPR11MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: 5057db3c-f869-489a-e301-08dee203fc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: UCgXUPdGeHAC4pq0vJmGK3zDRbqkx7zGFjtg41WB0V9zVErz7gCNCd4RFX3oHgGiYY6r7kyHVYZIBhARu1MQT65cuYpZoeHxap7jQcoEAvDmKL3wKCgNjbe9cYqUAcshLq2cWZR4UVRP9lyzR8R8Do52oHLq7BXLt1iIdt29mTrsNwTmjpVFkiT5g12aDygQnTcD7i+ZgH4YlTnSKMSRWtPCxTyCv4lyxnUVXOVoJ6r1MC9ZPjo3c0ZdKjcQpzBI3SrxYxR01+/MEqrW5+kDQiCd0wJ4OOeBH3DGzEj6xd3U5Ax+HqXLF4whb1WBWUL8odqgSH39iKX7tE9/LeJ9kxPIOPZ6JNIuBTQC4YAOVkLAxxcMoJ3Jk+v+UEzoCpoxHldsmwIKCwT7gxOduiRvs1/tH2uXhxCw8dCDzdnMzFpkbi4k9SVCc9lFkyH9gioSw1W6sg9NZGNNYPrf0B9ip3MzjjVGZUMkdZehqitL0p0VRnX05Jk2PSfMd686ZVCFjqctRnuhP6jCWo5hyfo+DEnTUTBCRQXOUAyDL9yE/kV0k55b7GSBJWnqztJOj3vgdJUmMoJhGG5KrCbMau7rE4k9Bv8U+2Pj+SrZiQxsM09x5OMmh/3HdFdjZjrzPDAz4S3X89N0pYF+fNaxPqlHn+Pa29mO9Nhfo3dSUrcVVd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umk4YklJcU5zNHdrWGtnY0FHVEN5dVpqUU9NS2ZhRUJlM2NCUE0wNndGb0lI?=
 =?utf-8?B?VStuVWJUZVBUaFhtSUs5RUJkcW4ydThtckJMUXVycU9MQllxQXVrSGM5ZXl0?=
 =?utf-8?B?RTRZQ2Fqenk1K2lmMkhFMGV6dHE5VWJxU3RKQldJWGhnNC9qd2hiLzFnNHY3?=
 =?utf-8?B?eUl2SnJnS1RPNVlaVEFkbEV2bUMreUNKMzQ2MDNTaThmN0VwZHRmc2ZHY1lN?=
 =?utf-8?B?ZGhXSFlvWW0vRWRQTjE2cnVFblkxZytYa2ZCdmxYMktCNmNEM3RPeVpvK296?=
 =?utf-8?B?cElxYmM0QjFTcDQxQnNkQ1ZOYTBsdXVnNERJVmtXVlg5MW5qT2swNlBsV0Jr?=
 =?utf-8?B?bWJLQVhrVzhyM1FKOUlHSmJwTGQ1L0duRkdKR3N6NmNya0srT2orblBwVlo2?=
 =?utf-8?B?QktRNDhqYldiclBXV01WQjhpeitXRXZ5dmc1K0VQYlQ0V1FuY2JkeUxZemNn?=
 =?utf-8?B?V0I1dERTQmUvQnJ0NndOdW9QeTVIQ2FmbStudDJIdzF6MXhDQVZoOXVQQWVN?=
 =?utf-8?B?VlkwQ2w2MEdwdlhGSGduTnlPUE9KcUVsMTFPcFdqdERCZzlnbjVYSkdIRXMy?=
 =?utf-8?B?OFl1c2laTHBrY29VQi9RdGh6akp4MC9zZzlqb1dHU0llTWN4ODlWbS9XS3N5?=
 =?utf-8?B?Mjk0MCtScGhCa2hacFhxZmlFWWdQUTlDcmNiVVdqREtTazJKOGZzZ3IyN2RN?=
 =?utf-8?B?bXdzdmNUTlFXcmlxL3JLZzRNY09GMExvdXNONVZWdldxUnJzQVJ3RTY3NmR1?=
 =?utf-8?B?d2NxbzhTOVNsYU5mSnpxbzlYZG1jcTJIdUk3WEdMSjB5NlZUWHU1YVpZblpq?=
 =?utf-8?B?MTZzZEt6N1M2aWN2Q1BCQXVsZXQ3WTVrMTFNbGNOZVl2TFZxblUyUUFGUzFw?=
 =?utf-8?B?TUNLaHVkTGpzeXRCSWJ6N3UvQzZKTFpSUWQxWXlMeUJjOGMwaFRDN2IvT05W?=
 =?utf-8?B?TVpqcE1wSnh4M3RhR3NIaFF1NTN2eTJkQ1hKZm40aUdReUZicVhXRVRTRlM3?=
 =?utf-8?B?Wkt5THdHVkJsM0ZBMUdKem92Um1OZXZDWTQ2cDZFSWp2SWRtM2ZQTnUrWi9X?=
 =?utf-8?B?cThYbm9NVTJTY3M0cjh0dWtkVzY1cUVqVVpWQlNnQzZaWjBLcnpoSDg0WHBE?=
 =?utf-8?B?cHF4TXV4alFkS3RnMjlhMEdhUWtIbHN3OFFVREVWYUhaTjVNY3BaRnlEa2JH?=
 =?utf-8?B?K0oydDVwQ3Z6b29aTkF6TXRJRC9ZZHFJKzcrU3d3b3VVVWE3Lzk4S0tzeVEv?=
 =?utf-8?B?dnIxcVZKazZ5aG13a1lRYkJ0Mm56TTJzY0hVMDFvbEZkYldmd0ZGNklTUzRY?=
 =?utf-8?B?OHpkaDVpelJDYTIwaUtjNzlFellmZjFOZ1RYUnRkeURObGxlSzRiZ25rQnlz?=
 =?utf-8?B?c0sxMGVXTVpVdkxEV2FJa2Jvb0xycWU5WXlLZWJMc1Y1bXFKeVM4akVUdVFV?=
 =?utf-8?B?M0tHWU1nRVRBdTQ0MGlYbnZEQndmY2RGcURXUkluUnpvZ3RUY2w0N0Z4WFRi?=
 =?utf-8?B?R3I5c0Y1YmN0NnNLbVZ3RE8rQXBBdDg1bzM5L3RpMlhUanZvdnRMRDlrdmZo?=
 =?utf-8?B?aUdxSDNDaG45M2JJR3c1cUROejJWdVpBMUNVSFR0Um00RmNYRE50T2FTWmlZ?=
 =?utf-8?B?QzJzSzEwUmRHaFM1UGU2NVBxaEVDVko5cmZkY1Jqc3JzdDRKTUMyUnlIMWJB?=
 =?utf-8?B?YVpqd0ljTjZvWDBrTHUvK0gwc2lyWUZvVmNtL3NxWGN5U05LeFFnWUg4cEVK?=
 =?utf-8?B?NGtZVUNMNFpKS3E0TEpQVHBzbTN3Lzhud2lra1lOSytWVVZxTnlmWFVJb2x2?=
 =?utf-8?B?U3FwcXpDM2N6ZHNDd0tObWEzdWw2b01CK1BnKy9LR21JbFhkM21ZeUlURFFq?=
 =?utf-8?B?MGh3VkpPSGxrUVhZbXVpTXQ0ZkpVRmk1alg4RnNYME9KcDBsUE01d0ZnUUk1?=
 =?utf-8?B?U29IUW9sNVZYbHpIbHN2ZDFUWlRCNXpEcjZoOFN5SHVhSzRvMVVxTWVzSmtr?=
 =?utf-8?B?YnFBWXoydHV2S3JzWVE1Qzc1WklRR0FvSHNSRElWZ3lGLysrUVhSQmNxV1Zt?=
 =?utf-8?B?aHR4ZkNPK3lZQ1V5R2hIa0NYNXBBb1F5SGtBTHI3bHJwYmhzNExvU3FDRENX?=
 =?utf-8?B?dXFvcjUyNTRVWW9YQVFiVlo2cU9XNGZZd1VyU0tJemtxc0VaN3FsUEN5dVc3?=
 =?utf-8?B?VXRDY3VrUjExZEV1UTMvTmRsc1Y2Z0JHRWRraEFTcld6aWwyQVV1cDZqVWdJ?=
 =?utf-8?B?TnRUdFdKTDZhd0NLMURhSWJRUWRwVmNEZ3A4VlRzTHhhc0NrVjMxd2plV1M4?=
 =?utf-8?B?SnlQaVA0UkwwSHQ0QWlVU01QbnNkRzQwaWV5VXVJYkZTOTJ1LytrRjY4K0JH?=
 =?utf-8?Q?RNN5R3bZVxolzKyY=3D?=
X-Exchange-RoutingPolicyChecked: eglmFjY8aOsyvNGrO9ZpqYi0JBr8i1shY7PIiLSaijNzGEenHYpuT6tT1TKcA6PZMIcjF1gHWrhQMdpzGAVBQUtP70tlS0gMjp29wDmrm/+5XmnuFiOhLMHqxlT3b50hDlAFw6HiGL1HhRi+06pXku80BAXtI7sVfLzRJJpv45OPIz7+weiOteDP7bhSuuvmd2RrJ8ZnIiSGCXgr9YqRW0zMM6R6oKSoVbWkSDdP45DV3BpN1D1SrtTOsTHTxPGXthIP2q/Vb5TdZ0LZOmz9yz+UsFZUISPKMIKWfUcsuaU1qQ1XpRAMoWvCUXYvG1nINVXEu6p6g51ywaFWrPaJjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5057db3c-f869-489a-e301-08dee203fc1d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:59:47.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXw/Y2/RPYQheRii/V0LsbcbxHYjbyzeGh7xoUuCyygWlIeD6HFNf1xp5Y87sxCoSm2NpcrYEZR8xc6zwdWZBdw+hCi2elSG1sRGDdu2dTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9679
X-OriginatorOrg: intel.com



On 7/14/26 3:48 PM, Moger, Babu wrote:
> Ran few tests on the series. Everything looks good.
> 
> Tested-by: Babu Moger <babu.moger@amd.com>
> 
Thank you very much Babu.

Reinette
