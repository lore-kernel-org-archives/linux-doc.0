Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C490A1C1753;
	Mon, 13 Jan 2025 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736798623; cv=fail; b=O0Aj37itMLxWz16lvddJRN5ZbN8poC8Cgas3eqpi2JJpKjx6JK5tGXfl/9G6T9FnFhmATf7o169gdFcqiZlUqWrDVw2JnHNkc2RuavI8ei8EercRi4ukfUK3xbIVA8TD7fh/lxfo3hfu5hv7jZrdxvib6WSJ9bI/S+yuucHjHEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736798623; c=relaxed/simple;
	bh=HUpGeKisw8QaPQDeR0bvAm9oCgBt4XxyuVxtm43okx0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X6/28UDxqfvQXAn4IOob/RW4s1kmEOVYb3yP0cOY3vM5WNGmxWbztDiQIq59PehNdHRpOw8O7nDrje0mar1SmoZ07zyrvJoWhqnv9y95bqpVPJfLkBZZwcNqYLa5cGBZUmdgvk+yq3q/zUcmVo10bLO91Mq8YSimd84ewmDETLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wsb2reGN; arc=fail smtp.client-ip=40.107.102.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wsb2reGN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzb/GfbxohRmgO+26I3ggb1hZaS/w43daRjrcTqQ3o/w2LmmsDZDvTeJFPA5dWgyjIRUJriMOZ/XVvgTUYlOqG3jv7QtR7iQCXW8G3roL5HNwLWAKfiMx2SiT0laQWZ6xqmyoyOGvhtbceTWqHdXymrsIoswRH7xtCGtk/LkvRLrGzz9QvdLPe+EBoF5a4doJUD24r8FJDhB7GgFs552nIGIabzLqODKMwm3AN9+pKxOBYs5dMYJqQxjfeGLJ46jYu1b8HTb1gHsjbapSotPBl8rdoaJ0Bt6Xxt1UHAliw7m4xx5iaVfVetZENxdn1TMBz/va4yNw5zZAJtTpthI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4MXRG3KXPMQiMb+2n4atabmCZN2MPVr0KfXKnOALFM=;
 b=egnoM+G8n8N64id9JPRe1dKpuDpEeuWFANjipZMwiZfOz92AVfph33K04+6wEUDU2BmHW9JBRZALNKjtVZbtVbJUqexgFimTVL/OcDuF4b/v1cSsQcy99zsijPLsrbe/UuYlj49Oyl4vSEHt9WjrIptLHYPTdJibwzpkce0TKzYdnLnizXXcnGuC/WJYE+4dE08Bm+y0TDSzXsIhjlxL56vMX4N4Y36vUBoNvyWaxdNFeEgkSxJF3PeOdBr4rgfmKvR6krPIzW5uEii0lL6TwThcX+PVzl8pwDJRZQvEYsc5vBI+7COcXMX5OHHsgbgi0GO7vOh5/8z5t8730v5wIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4MXRG3KXPMQiMb+2n4atabmCZN2MPVr0KfXKnOALFM=;
 b=wsb2reGNFwbE1XV4aw72lZ6VR7w4Of8f5Px2OtsGuN9Gyq8ym9oNpYdYaWD57ZhuQkoF5krWlJSkY08cZ5hw0pAkB+0lKq1GGrUARR7i7XeDvwhfzLeFMYz4XM4uWtN7sx1VFXX+vTwLXONhSIRvnSaY4CtV72/b72P+8LwEBeU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CYYPR12MB8855.namprd12.prod.outlook.com (2603:10b6:930:bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 20:03:39 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 20:03:39 +0000
Message-ID: <527b1b69-bbd8-497f-afb2-94e865af2255@amd.com>
Date: Mon, 13 Jan 2025 14:03:34 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v10 22/24] x86/resctrl: Update assignments on event
 configuration changes
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, tony.luck@intel.com,
 peternewman@google.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1734034524.git.babu.moger@amd.com>
 <8c8ecf12622c649bd269052b9fcd436710446034.1734034524.git.babu.moger@amd.com>
 <5e1471a0-3484-4273-9be7-94d084d2cc4d@intel.com>
 <d127defc-6f3a-4255-b2d0-b59178089cee@amd.com>
 <f53a0de4-32b8-4648-a036-108e4369f31d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <f53a0de4-32b8-4648-a036-108e4369f31d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0110.namprd05.prod.outlook.com
 (2603:10b6:803:42::27) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CYYPR12MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: a04613a2-9176-4180-79f2-08dd340d5f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnAwb0pRMld2T1Z1VVFRU256WHRJb2puTGUxSEJLdkJ2ZlNHRXlySzdoSEZI?=
 =?utf-8?B?UmpiQ0pJMjJGV0dISUI3b1FGT3h0T0ViTStpYjU3eEZxY09tYWk5NXVuVEEr?=
 =?utf-8?B?dG5SUU50VG5EZUt0UXRXRm5kWU1nZkNCamI1ei93cE9POUl1Vi9WdWM4dVdw?=
 =?utf-8?B?ZnU5WkVLM0RWRDA1QzZPQXY0WkZFL1VzVlVpTUcybzlldDRXNUlWUFJtOEk4?=
 =?utf-8?B?ZUtLcUYzUG9ja2hUakgvb0J0TkNCamJPRUVISDQvbTBDNGpoNlBRWit6dS82?=
 =?utf-8?B?YVBOa2hKRXpRMklTa1dBVXJQclFRZ3JZNEFpSzVpRlVwUlR6WkF2TzUwL1pJ?=
 =?utf-8?B?TGNsdWNSTFdCRnlhTFdkZnQ1dzhYOFhxMVNmcnA3RldxQUtXeG9RTGVhbkR6?=
 =?utf-8?B?V2E0eTIxV3dvMk1RblpBNHV0SE5wRHJyREFmbFpUa2VsZzRZdEo2WDBQZk1S?=
 =?utf-8?B?WkErcy9qaDNzcHJleHlBeEdYQUNSMENiTTJKTldnRHFSUDN4ZTBQdGlIUGxl?=
 =?utf-8?B?dXFtZWY2UmZBb0FwcGk4eE1mbTlJeXBueEZSaHJjWUxSUnkvRHBHSCsrM2xP?=
 =?utf-8?B?bFNCQm9xcGtFNGZUcU1TTVlhanAvZWpiaEc4NHAxTmZmMTZtOHNTNE10RnFv?=
 =?utf-8?B?ckdSU2djVXdYNGsvVjQ1QmNBM2VaMjVQTGZGY29FOXQ0ZzhiSDRKOFJwUFk5?=
 =?utf-8?B?SDl4TzFXSktLeDJpUWM5blM2aDd2cGZHQW5WNGdqVXliMzk2ZW1VK01wa3ov?=
 =?utf-8?B?aWNVczhMdU1sN1R2WnVQN2hPMDhlUkFzNis4Z0JEOCswVGJrYmM0QWxnVndr?=
 =?utf-8?B?eFFCbk1uRVErNHR6eHFqSDRuRmhDYWVSODZTbXlEMFlFL0R3czNMY09abFQr?=
 =?utf-8?B?WGxobHc4UXJITk1iNUJIazQyS1V0eFZuNDVRSXJUNDFlZ0hLR3lwcXpmVmxa?=
 =?utf-8?B?V1E3RkdBYjZaZmk1QmF6ME1oVDMyU0haT28xd1h1RDU4ZExzbk5HZFgxMWFS?=
 =?utf-8?B?ZnZYNENiZENSYXRjNS9aM1EwOTdZVENoM0JzVXVQTGxGNzhnb1V4ZnF6eW1s?=
 =?utf-8?B?N210NWdVZnhOcFNLckVoVHdoa1FzekFUZDFoN2JTKzVnUDJXbHEyc1FrTzd0?=
 =?utf-8?B?NVhJaUdJcUVkK0pBWjQ3eWVLaFYrakNpL0MvbHhiRSs4eGVxYWhHcGFKNnZi?=
 =?utf-8?B?YnI1OHpmTjBxSjdERmNqTXJ4elhuR25Na28vT21sWjQwekRZNFhIS0lPRG5M?=
 =?utf-8?B?WGRzb29BbHQ5Y2lsMWo3SllxbkdzdG1adXFyR2lDWkhEd25lMWw3TWw0M2t1?=
 =?utf-8?B?TTN1MmpkZTd0UVRGRWJlTFc2T2MzYU5KZ3dOOWEvV2xOazc1RVA2c2ROUk5u?=
 =?utf-8?B?cVFKQUdNWlNJcERLd3VrbDl2L3V5cU5UbEVzUXl4bWxPeUd3UGx1UElFWmQ0?=
 =?utf-8?B?VzhaUUlGMXdKR1hvM1pkR0tpT0ZqalF2ckpHajhiOU9WS01IVEh6R3QrUXZl?=
 =?utf-8?B?ZmNMRis0N1E4Tko5emZGQ1hNZC80RURyZDQreEVyTlRtT2taVE41czNLR2R3?=
 =?utf-8?B?RURGbEREYkZka3RxTVJ1MkR4UmUvZFRLK2pNTDJxR0RpZ3ZLa2xwc1c1NXFI?=
 =?utf-8?B?S1crMkd6cEJRR2FUVWwwY2pNWXpzNURGNStybE1OaDN1bXlDSUhXNTZLK1Mv?=
 =?utf-8?B?NW15ZU4zbzFsUTZ5TnFldzQ3RjkzdVhUOSt4WHdKTC9vMm9NRTBIS2tBOEpR?=
 =?utf-8?B?ZjQrTS9NWnM2UlFiby9zZDV5TXJ0YllaQTRXNGJnK0VyRWRYVlJ0d25sVyt1?=
 =?utf-8?B?UWl5c3hpbUg1aEF4bFZ6bmIvNnprbitJOHBEUk9ITThLY3FuZHBnY1N4SEpZ?=
 =?utf-8?B?RytOZEpiUE9iZjEwb1MwTkpnaDNOcjJQS2laT2I4UGNlRm1ENndOT1BETU9K?=
 =?utf-8?Q?cY+oG9td6A8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXc3Qk55dEFETDl4K0ljSGlBUkpuVzVvSFV0NU44WjVCRmdJU2lYQ0hLaU1O?=
 =?utf-8?B?bkRwSkNYbzZHN2JHUzhvczRIVTdPRGRPYzJuM1g1Y29UN0MxOC93RmEwZUZM?=
 =?utf-8?B?YjNqeGtCWC83RXdxZFJJKy9UODhCUXhvN1o2dWJJQXUyOHl6aWtUbWdHZm1R?=
 =?utf-8?B?aURoV25ucnlnbFVid0d2VmdTeHdtN1c3aU9KRDVyc3AzNHEwU1p2eW8zdjhK?=
 =?utf-8?B?T2V1R1drMUFENDNJWWVmRTBJQlh3Q3pjSnE2TUs0MDJudmYrVFhDQlh4dkx5?=
 =?utf-8?B?dUQzZWFiOU5HT0ZWVmNHVzNvVzlvdUE0VFlXQnJDT3dpYlNEcERFcHhpeEIy?=
 =?utf-8?B?UU5QUDJWRlhuNjJPWnRNcEhnQWRsWEtrS1JqelA5cUxuZncxV2dnUmlVa1JR?=
 =?utf-8?B?akNYY0RWbmJBc0VIMFRGbGNJaytNa3RsZXlURmpkaUMzM0VTSVZVWFBwOGsr?=
 =?utf-8?B?WHlMOXlyaElGZi95VFhabE5haEMycEJtZENqQmRFcmxVcW5TbVZIMDZDRHZQ?=
 =?utf-8?B?cXg0VEhJTWJlYllwSXFwVnllTDZCTlJvQTMxaWVTaUcxVmFlcnZYa0srdDFE?=
 =?utf-8?B?WHBvd25CUTZaRlI3dk42aGJzSjh3Z2Eva1cvMTdPQktXU00xWXAwQXhvRDVn?=
 =?utf-8?B?QUZRVFhZQTh2U3ZYMW0zUmVua2lhcWxLVFBpanZIa1ZyNXZqU1B4Umt3YkZE?=
 =?utf-8?B?cWdtS1phNm00SkF6UHRmc2ZFYkIxd2R0VzluMkl5K3NseU9sRThzb0hHdG1J?=
 =?utf-8?B?ZTlUTzFPa20vRitLZkhCOWVBeE8vekdzMGdkZmFNTjhURWZLWWZLbGhVcXRj?=
 =?utf-8?B?ck5zSHZPLzEzMlBiMTZST1lmelY2U1pCekswZDhyM2p4cndxSHBKYi9MeDdw?=
 =?utf-8?B?bFJ6SUNEa1Qxd0gvQ2xnVGJPK1d0MURxakxzT3NYZFRoVG4rYS9OeWZnMC9t?=
 =?utf-8?B?bVFVSE5NN3k0b292QzF6SllFTGdnalFwcDN0L1ByUmJQVXRMeHlTank4RTlE?=
 =?utf-8?B?L0haZ1BIMmdRNmlrQ2xFM1RKanJ4MzZQZWFEVW5yNmFZbytHYnJDVWhLWG51?=
 =?utf-8?B?WmZwOHE4TjFNaEliTzhzVDVmWDZ1ZjlMOXNheE0xMG1ic2EyMDFZaEwrKzlo?=
 =?utf-8?B?dFJpUWhFZXd5Z3RNMWI0SCtSUkhodzJ0d1EwdXlHZzZWelVMVmI3aFY4WlBY?=
 =?utf-8?B?VHl6cytHTzVUZmsySnUrcmZuclRHTlkwcmhTVXlXcUVRdUZOd2cvdzRPOWNY?=
 =?utf-8?B?QytzVnVxMWdwUk9zUkdkKzl6T1BOQjh1QkFrNVlpcldpQUtveEVIRHlKRHln?=
 =?utf-8?B?RGdqTG5vQi9GSG83Um0zN3dPZGFaeEhEREVyM2xqdFp4cUQ2dVpIVExwZ0dW?=
 =?utf-8?B?eFFoWkN1V1l3VWp2MWpoYXAya1ZaQjMyQ1lIQmRhTGFWeEQvTVJpWHRuakt3?=
 =?utf-8?B?NzByQkE5cHZqSXZ0dlBLaWR0cUhjTzBib3FKeU9UTGxiK0FtZERhc1Q2WUwr?=
 =?utf-8?B?NlgySlVwaHhiTnU1UmE0WDVWaXZ5Q3VlWkZCaSsrT0xUUWFBbmpsRVM1Ym82?=
 =?utf-8?B?UFE5TnFjSDdKZEdqbFNHcHJ0aHYxZVYvYnhaa0lwMDMwb21lc1pJVHpQNHZ6?=
 =?utf-8?B?N2tkbWVPZDdKQkVoMnp3WFQvSlNkZEdXdjVud2RlRTAxeitVUGwrMEt1ZXVo?=
 =?utf-8?B?Uytzc0JNaXJ3cENlTlVKdUNaRGdCN2E2QVlMcm0zOCsxbllnclVaSzZHV2Js?=
 =?utf-8?B?ZTZkTFlWUFk2VzVISGYyTnpsYnRiQkI1T0luVjRkWERBanZpYnlnVllEUEwv?=
 =?utf-8?B?WTFnK1pndWFaNENldFkweDgrS28ydzdTdVlPcEhra0RtZjNrNzRQV0tZb0l6?=
 =?utf-8?B?a3h6Z1Zzc1BUaTJkbnJBbnB5N1FxcnhMQmhmQmVXaFprREJnN2w4dHM0aGVW?=
 =?utf-8?B?T3F2MjFRTzRZT1V0QmE4eGhxVENNS0tyckplTEovV3BsaXdwRkRGWkNHc2Vi?=
 =?utf-8?B?SEppY3VqYjI4UC9KMzNoMUluUlhQOW1QN0NTeXpqRk1hR3RzLzRpVTdvOVhT?=
 =?utf-8?B?NjVxc0l0dnhLcitUNHdRTGl2aWhsejNoLzh1WWIyaDAvdTI3K0tUOGRDZFpq?=
 =?utf-8?Q?Ru7U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04613a2-9176-4180-79f2-08dd340d5f35
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 20:03:39.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sy/rZFxqc1S/xP79kVF35bL4vRdFy2R+q7ywPjFV00UpZtHNgd73uSSuVTBhO1aO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8855

Hi Reinette,

On 12/23/24 10:20, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/21/24 6:59 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 12/19/2024 9:12 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 12/12/24 12:15 PM, Babu Moger wrote:
>>>> Resctrl provides option to configure events by writing to the interfaces
>>>> /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config or
>>>> /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config when BMEC (Bandwidth
>>>> Monitoring Event Configuration) is supported.
>>>>
>>>> Whenever the event configuration is updated, MBM assignments must be
>>>> revised across all monitor groups within the impacted domains.
>>>
>>> This needs imperative tone description of what this patch does.
>>
>> Sure.
>>
>>>
>>>   ...
>>>
>>>> @@ -1825,6 +1825,54 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>>>>       return 0;
>>>>   }
>>>>   +/*
>>>> + * Review the cntr_cfg domain configuration. If a matching assignment is found,
>>>> + * update the counter assignment accordingly. This is within the IPI Context,
>>>
>>> This "Review the cntr_cfg domain configuration. If a matching assignment is found,"
>>> is too vague for me to make sense of what it is trying to do. Can this be made more specific?
>>
>> Does this look ok?
>>
>> Check the counter configuration in the domain. If the specific event is configured, then update the assignment with the new event configuration value. This is within the IPI Context,  so call resctrl_abmc_config_one_amd directly"
> 
> I think it will be easier to understand what this function does if the
> comment is made more specific. For example:
> 	Update hardware counter configuration after event configuration change.         
>                                                                                 
> 	Walk the hardware counters of domain @d to reconfigure all assigned
> 	counters that are monitoring @evtid with the event's new configuration
> 	@mon_config (or @config_val).                                     
>                                                                                 
> 	This is run on a CPU belonging to domain @d so call                             
> 	resctrl_abmc_config_one_amd() directly.    

Looks good.  Thanks

> 
> Looking closer at architecture specific resctrl_arch_update_cntr() the
> reset of non-arch state (get_mbm_state()->memset()) seems out of place.
> There is a resctrl_arch_reset_rmid_all() within mbm_config_write_domain() that
> resets all architectural state after the event configuration is changed,
> should the non-architectural state not also be reset at that time? It looks

Moved the reset of non-arch state inside mbm_config_write_domain(). It
seems to work fine. Also I can simplify the IPI code further.


diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5f5cf9b3a053..ce08fb718e2e 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2076,9 +2076,6 @@ static void resctrl_abmc_config_one_amd(void *info)
        abmc_cfg.split.bw_type = config->val;

        wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg.full);
-
-       resctrl_arch_reset_rmid(config->r, config->d, config->closid,
-                               config->rmid, config->evtid);
 }

 static int mbm_config_show(struct seq_file *s, struct rdt_resource *r,
u32 evtid)
@@ -2153,10 +2150,6 @@ static void resctrl_arch_update_cntr(struct
rdt_resource *r, struct rdt_mon_doma
                        config.assign = 1;

                        resctrl_abmc_config_one_amd(&config);
-
-                       m = get_mbm_state(d, rdtgrp->closid,
rdtgrp->mon.rmid, evtid);
-                       if (m)
-                               memset(m, 0, sizeof(struct mbm_state));
                }
        }
 }
@@ -2178,6 +2171,7 @@ static void resctrl_mon_event_config_set(void *info)
 static void mbm_config_write_domain(struct rdt_resource *r,
                                    struct rdt_mon_domain *d, u32 evtid,
u32 val)
 {
+       u32 idx_limit = resctrl_arch_system_num_rmid_idx();
        struct mon_config_info mon_info = {0};
        u32 config_val;

@@ -2214,6 +2208,12 @@ static void mbm_config_write_domain(struct
rdt_resource *r,
         * mbm_local and mbm_total counts for all the RMIDs.
         */
        resctrl_arch_reset_rmid_all(r, d);
+
+       if (is_mbm_total_enabled())
+               memset(d->mbm_total, 0, sizeof(struct mbm_state) * idx_limit);
+
+       if (is_mbm_local_enabled())
+               memset(d->mbm_local, 0, sizeof(struct mbm_state) * idx_limit);
 }

 static int mon_config_write(struct rdt_resource *r, char *tok, u32 evtid)



> to me like it is something that may be needed for existing event
> configuration (but not an issue until Peter's new feature lands) and when done,
> the reset done within resctrl_arch_update_cntr() will no longer be necessary.
> 
> Something else to consider is the resctrl_arch_reset_rmid() within
> resctrl_abmc_config_one_amd() seems redundant on this call path since
> it is followed by resctrl_arch_reset_rmid_all(). resctrl_arch_reset_rmid() 
> does one MSR write and one MSR read for every counter that needs to be
> reconfigured and if that is unnecessary it may be worthwhile to optimize
> out?

Yes. Removed the resctrl_arch_reset_rmid() within
resctrl_abmc_config_one_amd().

Tested the code and seems to  work fine.

-- 
Thanks
Babu Moger
