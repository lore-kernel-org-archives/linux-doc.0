Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53693B1009;
	Fri, 17 Jul 2026 22:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784329008; cv=fail; b=JT4NAnAelXWLQwOLAXykzUlTxoZmRle5/DSmrXTpw/g98/IUC4wbpCkVsJX5kJ/hhbTVj1AhAtrLow6G1cK8uVebC76AcrhPOMLxmCnPyp04fy3cJZa/ELr4h3wIoFS3RxzPJ+AtErxb4earhefodMaRbMLYmQLOX/DW7x4Aq3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784329008; c=relaxed/simple;
	bh=WeTRb+b7pRdIAL2W3zNpLAypMfohwYbAa/yIBfFmKjA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nt4Izv5Z75glSO0ghEIgA+fpPq5KJQ6Jrhd+7bJCdbwiggf0BHZ/sAdl5bquKzHOmRARoP+oyKvJtVsxx3if0FEzwqbcijHzuaGAaDdhikXi1Bv7USiEV+qfodF4/FGkKovvWJQ2QxM9wbBNs+EXawOGB0g39pYqvkaRt+lcX0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFHq60yd; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFHq60yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784329006; x=1815865006;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WeTRb+b7pRdIAL2W3zNpLAypMfohwYbAa/yIBfFmKjA=;
  b=HFHq60yd9bYvcyjPjIOxe5YtZdoPtUt9R9BCEq64cHXVozAswkkUy+hl
   AiYHVFV5hVDFO5YmUCjgKb+RVt04uJk6/y5uR829FBScnI5UxscDx8g42
   dYkAmKLImwt7p9YPw3y0tR+eJf5Z4KN6VwNpe4TyKWN7lxS8rfNwc3C5d
   rAyBpE8g8ELHXWGExeYr7/gkWy4qZSn01VHiTUyWYoSV9wTNarKYQoe2Z
   hYaayTDjeLej+5BONU/GxUOH4fHRRD4PHMjIahaN2k46mB1iXKl6W+igD
   MVaxDYflAlNdOSwnA8xq2hv/JzkhawS7aqB/GZgmTTJvRewudHzuf3xIa
   g==;
X-CSE-ConnectionGUID: r4lpw6vJQPGqxk0hAH5hqw==
X-CSE-MsgGUID: 7TTfqKXXTNOp0KVUYdKJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88681001"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="88681001"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 15:56:45 -0700
X-CSE-ConnectionGUID: 8zB3a0tHSfCy7H5cjEn88A==
X-CSE-MsgGUID: i6USUgIBQ5uVQQsK3CN8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="255131148"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 15:56:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 15:56:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 17 Jul 2026 15:56:43 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 17 Jul 2026 15:56:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wsepv7IB6hqSc8t06djh9J75N251tjLBtC6uQJcZWGN7TZ3D7Ke5BisYuJm/LnCjK116arYy7UmZsJhCRN6P/WydK/Prrsuh/Y8RngE3CodIEE//+oxx7hWLHfy72DVVs5+riMmSkKGMx7tmeOVfvD9DuOk4zZ4acqb8ObTKgcti5ZkovQ+r3z17bxr1aGbLioES39VcXPO18o8Fgyvs+qn8tzEee8O7vsA9I9ZhXY2r5J9cHbDYDihOxN8QqhncQxkFmQxRg9P3S1WLHf21iOqt5u+stfFeiOYjezLPnPY3Yt0nReFNjHUuxBqJf8opc4bum/qgFCVYFjoCioHbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2H2QaOy9jhWUb/q9ES2BJSXGTBb2IdWFRkG7D2kRzuM=;
 b=qaHjpz4bzN4RW6X52LmNyz9nLiIZW88cWzEqnted3JFaJ6c1NNHgICOR+CzAJL+u++IKmjukj3oM9YMCWBPIiqllAtD9SGdYbtus1dNp83r6EELlbyKupfgr8os+WgCgPykzv5nluTmzcAJxp8YO7gy7SIWp/DaAR4jNFMcyfXpovA3hXYvi1SUOmfYJpOFQ8OlO/mgEBa6l+r7+i4PUSmwvULDeDnKcynAad9LC67yWuGpH1MuOou5hbzeIzBu5uuIgKarBrfAZtwCAz6OLYyILTSbZah0s5P5nTnEFH1PewG5DttDCfIkgciN2Ctse3RpeXbpj4wT9m1XLuFELgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 22:56:41 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 22:56:41 +0000
Message-ID: <d337915a-ef4c-43b2-a915-e97381b7dca0@intel.com>
Date: Fri, 17 Jul 2026 15:56:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0156.namprd04.prod.outlook.com
 (2603:10b6:303:85::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: fea48001-521a-4dc4-b5b7-08dee456aa71
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: ddZJt0EWdSmHvKDXvU8shNh94UnYkRWKM+ztXTL+Ib+W/C1V0i61M330EQXZwG4ihW8ShOj2vcRzyCQAIvFi0DfXB7M8OsWtbnw1FPtpbTJ/CRiPYOg3yo0Ibu1abO6KJ/UuyKFyN3jw7F4/vTCc3goEXG32QpDKVKGjdY1FPfI0aLJ7u7ozezr4aja9gbmWkPM7KQMJjTE3sXz6DdhCHUJOY35KeT2EilFKtsuYzVEAdvy3B8mj8csXmxaed2PKYOo+/Z9vqMVcYHwj9mJkixvP5emEPY124aWCJlJX3WJEhApPn/LIOyw+MD1zbX0ffosmMXfBwq2BAoqRooErpzKuhpzzXKKuWRlfUVDrfWN5lowJqLiDmQKbTD/Dd3mHps7TpXYl0WXEJix/fw0xDCLcsCLTXbfnX4V9jmnDNDzvjHyCV7F053f77f1UoP+JRoKsjptIcY6TtE1Rx4lZb8fMVZrn/+oDFu65f1tcMzw8/2gP89+syr8cYwrAJbxXtNc1/xw6rCYDFHdx/mF8456JyhC+lrednDYpVT19c3sPnX/7yNE7tBygN+5Zw7upGm/4YH9AKVzGF6DBOF55q3AcWXUo7t+IODNrSjcgvyCkmgHQocz9itCj+Q+zwjGcMCbqTOpzoOQAJ1d8IBQGufvr9rUSF5KR77oUzJ/m7cQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG5VZ29VNnFEOWtCNTgxeFIySmZySnRoU0dhWnUvRFhmWmFpWGw5WUNlb1lP?=
 =?utf-8?B?TExNM2ZMdEJoL1RrMzNKWFdpWTlQS1JRTi9Qc0lEZm5nZXFTZEdodjJnWHJz?=
 =?utf-8?B?UWdPK3U1Ykdvb0d2ckYzQkRrMlpmcWZ0dW9lSlVXcVdDbDY3RE1lK3ZGVzN5?=
 =?utf-8?B?QVVqRXlsTnVseDVmN1FmUi94dktBTi9wQzdkeUZNWmd1RXlTR1NacW5RMjhG?=
 =?utf-8?B?OVJzdzNBNllNWU16YlROU1hJZTlFdXl6d3ZDNlhLKzVOcG8vdGU5T1BMMnMr?=
 =?utf-8?B?MjlaMjJRcndScFYzQ3J4cFRrRlgvYTlUbmFZSFFuRGVSbXBRaDFGeDFxODg0?=
 =?utf-8?B?bkxXZzU5ZnB4ZmRKaDU3KzlqSGh5bUFpMTdnVVlTZDk0UnJOVDVKNXN5bzB1?=
 =?utf-8?B?VmI2b21PZmp0NSt1SU80QnJUYUpISlBOelhGZjdPYURDNkE4RWY5MXQvY0ti?=
 =?utf-8?B?dTJIb2NJQk9lNFVlWUtaNW5MY3pvRjVTeHdpODRkWTJ5WUZuRHY0Ty9uUnFM?=
 =?utf-8?B?MmRBbFhuRWVDYVh0QWp2TnlzQ0ROVHVoNDlSMnZxWEc1RjJJajZmdG5BS0hU?=
 =?utf-8?B?bGZCeXZGVTFUV3Qzb2srUWRnaE1LaHJyWDhOU2hwY05TbG9CQ1VERnFSUGhi?=
 =?utf-8?B?dktSTUhxUUhhVkpTT2JkT2R0eFJGNmVIY3crWE05dkFPUDZjblBTUGtFWHpz?=
 =?utf-8?B?c1JTVDBFVjlsMWpEaFhjR3l1SVJtUmxrNmhVZUE0aHBYUE04QVV2UFJMNjZH?=
 =?utf-8?B?RWR3a1N6ZjFQRlBOYlNjSWlRYUxPaU8zMm1veGwveWNQaENVTlIyUmtEVnMw?=
 =?utf-8?B?dVQzbHVNWjY5VnlnemZyd0RleVlYTCtQWTNhRGpXeUtybzZJcVYwUW9LWThw?=
 =?utf-8?B?MHc3ejhhWkR4V2RlVkUxNU55anRzQkQvWldqbTZvUWZ2a3dIeXRWSTI1cW5x?=
 =?utf-8?B?ZUlIM1RzTFlWV0lwbTNxV1lKM0lLL0hrUUkraFhsVFQwZzlUVFo5NllzOVZQ?=
 =?utf-8?B?Y2xIdW5OaG9KcVpGQlcrZk9vQk9HTGd3bDhrdTJUN3Y2UjNjcjIzZnhlUmpQ?=
 =?utf-8?B?RmhZd2V3aGJWMXpidUtlRGZLVDBRRkZkYzUwNVlkUkN2MG9seTNaVFNoU3R4?=
 =?utf-8?B?WXdCbmFzN0FKdUR1MW10b0lJbm53QTJpTEVOQVVqR1Q4Q3pmbVMydjhCLzE3?=
 =?utf-8?B?MjRaV28vb1lOQ3RtbndZOVlkS3U3eU9WN3EvSVZrQ2ZOaHE1RytPNHR5QXkx?=
 =?utf-8?B?Y0NFL1dWZENqYVFYWXNNcTdTQXN0M3Q2REd3eFRORFpINzhQUDBEOXR3S3U0?=
 =?utf-8?B?ODlCTmlwWXdvRlFER09LZURFQ2V6Y3Bkc1k1K1M2c3lvNmt1OXlYdVpvajh2?=
 =?utf-8?B?UUp0L3lTSTM1TEc1RWtBbVA0TW8vNGo1aWdKWmpKZkpJMHRINkRwRzBtdmF1?=
 =?utf-8?B?b1BBdmwrRkRQWjNIb2k5QjU5a2wrWkNNN1Y4OVN6L2Y0TGZ0YnRHbTFBbkRO?=
 =?utf-8?B?RHE0bklUMGMwNzljL0FvU3V5NFBKYnhVVVM1aEF2WG1LL0Z0U0srOUhvL2ls?=
 =?utf-8?B?eVg1eVV4SERFZ240QWRrNGZhT3RPaU94bXNzMTAza3pLMDFtb1k1Q3h2MmYz?=
 =?utf-8?B?THFUWmdqSVNaTG5MWEF1T2d6OVVXcndsQ1oxWXdKSU9lakcrTnJKRmVkMFMw?=
 =?utf-8?B?V3FEU1FhUzc3Y21GQVlmek1qT09sVWdGSk1iTVZxSkVaZytiWWpVQjNocExu?=
 =?utf-8?B?NGJPQ3k2V0Ixb2hYa2JveE5uRzBQb2Vad3Qwc2FlaWU1TzUxcllPTW02ZFNp?=
 =?utf-8?B?a0gyaUUra0QxbFRQYUpzdFUvbjZaakgrWFlJemVCQmYycGY4ajhjR2JDaFpC?=
 =?utf-8?B?Z2daTFJVR2NOM1hJTVdEeTdkcUNQZ3NVV1dSallhVDhqYk1TSkFYZmZheHE0?=
 =?utf-8?B?aGxVdnRSTE81Q0tFUm9WT01oT0lUV2FPOWFISlhhR1Q4RDE3YkI0a0RIZFRN?=
 =?utf-8?B?S0VXRDNaczdCNTF1Z1ZGQktUaDJsMVE2RHZJTElpbnh2ZTU5VWZJNFFEOXFo?=
 =?utf-8?B?VzBLN01HWXdHV2NWL1ZCK0Q4OTQraXBwT1FpaWhFLzZKci84cnB2RUI1Q1NM?=
 =?utf-8?B?enRYY0VtaWZCK1dTbyszOTVrenllbTBhR0lMZ09iWUxQZlpocm9VYjJCa211?=
 =?utf-8?B?ekk0MDBxUE9WcWh5TEVYWmJkcFhQZjRZZ1hhT1FKSjI2MGNQODN4RjJNL09k?=
 =?utf-8?B?ZS9IOGhId2F4azdZQTgwVnBYM0lMYlVyVjRSQXR2Zm1MdTRCYVkvWlAzSjlM?=
 =?utf-8?B?c1RzQlc3RlVhaFdkVVI2MEFDeFNSN2NZN1JwaS94RjJSckRvcGx5T0NlR20x?=
 =?utf-8?Q?5+5M3GUyDROqfDXo=3D?=
X-Exchange-RoutingPolicyChecked: FeBWgd2ts7feRYmoQ+uZw6tE7/4+Ig3uc12PnzeJbbBXLJD65qewd0Ba2+iRHnNpR9du18JGrIcqIdbJRdfIFpuMKdfqWqZo9aBSVFI/0vV8rAjjGBlVZZEch280Ezz1I17USwdp9iuYTYJpT5XBpNtAP/2xaPf3CrEsTTmQevgbAnq4LG468Q/t7y7XTfz1TOvNNXn7xgTDMEvZK4WXvrhQIhDHAnv+97jodwnYa3H1VA9Ga+hlvd8af6momL2XA0f++c5f7CN7jal85ZSOQpZZA8xBCDdm5U28xMsF1m7egmkO8ma4XItVX89jSOfKXTHPQ+6cpG/qyzDGtKltng==
X-MS-Exchange-CrossTenant-Network-Message-Id: fea48001-521a-4dc4-b5b7-08dee456aa71
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 22:56:41.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkwjAh+I/5egDSl5JVdIgCvpo45zZojg0PvDdD4OUZAzVvXyJPbjKvuGB2eZLl0CMeutaI3u3i6u2Y777ec+k+mSjaA4SNhWW9Q4PnJ94kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
X-OriginatorOrg: intel.com

Hi Babu,

On 7/17/26 2:13 PM, Babu Moger wrote:
> The kernel currently enables the ABMC-based "mbm_event" mode by default on
> hardware that supports it. However, this can cause bandwidth monitoring
> failures with existing userspace tools such as pqos.
> 
> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
> groups by default. On systems with 32 or fewer ABMC counters, this default
> configuration can consume all available counters, since each group requires
> one counter for local MBM and another for total MBM. If additional
> monitoring groups are created, counter resources are exhausted and pqos
> tool reports memory bandwidth counters as zero for those groups.

It is not obvious to me that this is a problem. If I understand correctly 
there are two scenarios possible with this pqos behavior:

- ABMC is not in use ("mbm_assign_mode" is set to "default")
  - pqos can create 16 or more monitor groups
  - hardware still supports a limited number of counters with consequence that
    underlying counters reset at any time as the different monitoring groups
    need to be tracked.
  - pqos can read monitoring data of all 16 monitor groups, sometimes reading the
    events would return "Unavailable", sometimes reading the events return data.
  - *None* of the monitoring numbers returned are guaranteed to be accurate.

- ABMC is in use ("mbm_assign_mode" is set to "mbm_event"):
  - pqos can create 16 or more monitor groups
  - only a subset of monitoring groups have counters assigned and these counters
    are guaranteed to only track the monitor groups/events they are assigned to
  - pqos can read monitoring data of all 16 monitor groups with two possibilities:
    - monitor group/event has counter assigned: monitoring numbers are guaranteed to be accurate
    - monitor group/event does not have counter assigned: monitoring numbers return 0

If my understanding is correct then the preference is to rather have wrong data than
see 0? This does not sound right. What am I missing?

The changelog starts with "this can cause bandwidth monitoring failures with existing
userspace tools such as pqos". How could returning accurate memory bandwidth data be
considered a failure? How does this issue manifest itself?

> 
> Avoid this compatibility issue by leaving mbm_assign_mode in the "default"
> mode during initialization. Users who want to use ABMC can continue to
> enable it explicitly:
> 
>  echo mbm_event > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> Update the resctrl documentation to reflect the new boot-time default and
> adjust the mbm_assign_mode examples accordingly.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> There are plans to enable "mbm_event" by default once additional counters
> are available. For now, keep the default mode to maintain compatibility
> with existing tools.

This is not ideal. resctrl should aim to provide a consistent user interface
across kernel versions. 

Reinette

