Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99015747C;
	Fri, 20 Dec 2024 22:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733709; cv=fail; b=T6YYV/ztPqlmCAxOazwrHXhVSaEG24pKwFqfvhKmIQMrOTT0qtUg6n+cR7yLg1J4n+mHVrl/FZTBqafxq7OZqOwA5uC5ImMi+w7gh///MQayC2xEqmTmUuhWUQZmXekqNLcl1rFk17GFIgmVKhzx98A9t8+RwjFxrJOalqBHtkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733709; c=relaxed/simple;
	bh=mlqZPEhb4VW1Ba/E7ErgxCc9ljtRLsMkesPHEnf9Nkk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IWKHubgkag6mvx6Z9eMHNi9TvxxPeYjYiSJ/is43ilDSA/wjvKyxj+lCx/KFyd6tuDMZfHmIhVYQE/CmlNzkQ6h3fo1jaN7oN50bwcTWbYPzoEcfBmui5RT15iIKnmQfIIU0p9j83lqGD4PVWSonn/nscP+q+v72ut6Mc57iDMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aAfRW/J9; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aAfRW/J9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3zyz64OLSUZg7jC2K05l4jX5/F6NTV6DuRQzNDh16sd+T41NCAWS6+koRYJG5QE21yNpADFrA8zfNel/b3qYpUrHWc1s/Io/Mio8LR+vIE3B+ZhhOyF0GFA9S1/4U1JEROUpY9PHHl3SctmgvGaW8mnI3g/8ml8gFRZnZPKAexmXCDRY2h7zGAHy4kE8L8/yHQ2DNigkjBDKumyRC+IRrW00uVphLkvE41aGQ7U9C+3M5p6xZncsRcI7Xz/exUsaaMINYWgNyBYiIpQz6ctZ/UFDRFTyyctXFUSI2ob3YFDOHyWjqns/GKu/L1VeWRZArG3I8mw+N2ZF/cxWmrZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNmNUAQ+Mki9Z3CdqzKYtTWdc8NWI4xOo6vPGBCjTeU=;
 b=ostJRMkkqhB4UlBoDUFDSqH0WTbf/w5srbicWOroeukd8OvQY0DdHawcP7G9K3FyDhy4ts7pPAWRBtTe0XLhwcHDq1c/2lDTae3o60OKRIcjMI5ienDQR1kW1yFNxi8Skdd1/f1CopfvrcQdihAn+05pjifV2VjHjR50vVtlt4iC6wJ0KU8ySeaRqw1RpdC+ZdnxPUu2ZjlTbFT7GBMUIFbnpjMbDks2hzpOXcsrsFdZi+BjD4KkmE232bHyixOLBnBghUedJLviXXIT79Z2OkJTOTlTkOhdTr1WcmP8rXadfVR+kuc08K0MNhFAbjVYNzHwv33sK+INQtWdyksJsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNmNUAQ+Mki9Z3CdqzKYtTWdc8NWI4xOo6vPGBCjTeU=;
 b=aAfRW/J91P3bG38V//vZI38/s/IdMmXDGXQnsWXhBBGOeWcZXoHQBucZ+rEJYQDiH2mEOtw7SJQCdT5p8L+Lzco7ldhAUyfzsntXjGQgQAi23uZ5FQqMcj/wSdym7cmukW9yL/xkkLYYYOdvER0W8B0KVrOe9KN4cY1q8ZsijQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 22:28:25 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:28:24 +0000
Message-ID: <e800c0d1-fad7-4388-93ce-0a7a58c4d340@amd.com>
Date: Fri, 20 Dec 2024 16:28:22 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/24] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
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
 <9f74a647d9ff929f040c57e32e253ac824d12086.1734034524.git.babu.moger@amd.com>
 <d6bc8c3a-932c-4bb2-8bb4-b44b05baa9db@intel.com>
 <a8b7c71d-b501-4efd-8e79-db14f1704aa6@amd.com>
 <92bd670e-7d06-45c7-ad3c-e52f67e53210@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <92bd670e-7d06-45c7-ad3c-e52f67e53210@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0156.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::19) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: b45204d2-51eb-45e5-b1ca-08dd21459e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEkvM0EwR1B3OURINDM4Umh5eThFU3lZQkJKSTZLU0lsa1laRlBXWVJPRE9T?=
 =?utf-8?B?VVB0eklBRkFZV01FcGJTUHd3cmJHek9kNmZoZWc5b0FubHNiWFFRVkFqQ3RZ?=
 =?utf-8?B?YldpMTg1SzBIYkF5MnY0WDNyTGpQWXhSVVdOTmhzam9weHlvKytvMC9Va0VP?=
 =?utf-8?B?RlhVdk9qUGRmYVRwNVViWm5RMlBsMlB3dmxXd2VuV09mSUJVTFJGVHFCNkFZ?=
 =?utf-8?B?Ym5sNmZibTRtQUF3Vkg5T3lTUzFnc0diRjRpNFZxemE3MkNXRTIxb3BjaVhO?=
 =?utf-8?B?TE9zVTlweTk2YlBDM3NBc0VBUC9zSWhad2JOVE8vRmpaS1NsTGN4VFN2RUpi?=
 =?utf-8?B?Y1c1V3ZydzZJTkRDM1ZqQTlqaU16bVVVbkNlYzYyVGVwRW9peTFveXd0eWI1?=
 =?utf-8?B?K3VSWnptSzJyOGR5SDVBV1dKb0RGc2dNNFBsQnhHL0NEU1JtZVloR2FJU1I1?=
 =?utf-8?B?ZExOVlFuV3U4T1cvK1JLaCtwNXVkcStqWFErbCsvcHZJbVduVzRqa1RCZjAv?=
 =?utf-8?B?aDdHVmt2MXpOQUt4MzBQUVpCYndvU1A3S0NFdUpMSUtnaW4xUno2dE1RUUQ1?=
 =?utf-8?B?eHlpQldZMGhscXI5aTkyVkluZGZSSFJpSTJ4WkdMcUVxL2M2RjYzZWRhVGI5?=
 =?utf-8?B?ek84L3g1MyswQkdQdFEwMVNKT1F5Ly9BNldYZHpUaGQzeURTb1pWVnQxbkhS?=
 =?utf-8?B?RlBIK1pSZFBBc1VjTW1DYS8vbW9KTS9pMWZUWEpoT1ZQTjI1MFg4alZuc1V4?=
 =?utf-8?B?NXRKVFFJbDdEeE9abTBCSm9DSUtZbmpMaWwxSEVrYUVPdG93VW9PVEpTWDAr?=
 =?utf-8?B?ZDI1eXg4TzlUMUlqSFhtWU5MNjh3WFhtSExzSVFPTDN2QWE4Q2l3by8xd3Yz?=
 =?utf-8?B?QUZxam5jYWx3K1JmTkppOG1rNkptUjV5bzhVMzJPTVZad01TMW5BSFN6bkIy?=
 =?utf-8?B?NmZ5Yy9xeXFSY3FYRUxXeGtRT0I1eFc3cHg3d29jOXVSVlNrMkRiR2UyUk40?=
 =?utf-8?B?cktKQ0NZTm5NaHdxN2g0U1ROTTN0N3dsWis3TFNUZDFZMUJGb3doRDJoNG90?=
 =?utf-8?B?dEtRVzlqWU8zY3d6dllTWjJOSjN4L2ZGWHl0UDRVc25qUFNXQm9lOGtpdmRh?=
 =?utf-8?B?N3JBVWg0OUJjaGE5ZlhWZDhRODROT3pIeFBDQ2lic2RhSmZSQ0pLN3VMM3BI?=
 =?utf-8?B?U3pqMHA3WVBQcTN0R0ZmM1BNVDhEbHpucVJaSXBJVDNtZzVVRUJiRCs4Y3lQ?=
 =?utf-8?B?Y1FZMVduUTJYU0RCREpmOC9kVG43cFNGWVQvUlhlSUxzWVorS1crL3JlLzNz?=
 =?utf-8?B?Z3ZZVDBZR0J6WUNQUUdTMHM2MEZLQmxKK0lxUUwxU1lXNWJrcWU5UE1meWJO?=
 =?utf-8?B?OEtKWUx0emwzaU5TM2JIbTF5NndvTldIMFNQRmYrYUZ2cGdNY1NqenA0SVJ6?=
 =?utf-8?B?RmRUZGtCVXI0a3Uvei9GT2pyazlLSmVnK1BvSmwvV0ZhZTdUQ0xZTzVVdE00?=
 =?utf-8?B?Mm9XbjF5V2hjRlFnZDZVZ3R3cVhzZm9vYmJNOG5yb3ZOVnhWUjd4N0VzVFVx?=
 =?utf-8?B?K25xR1lsTzlWQWRZa1JPY0dnaEg1alBVVGJ6elBOQUR1SmRMaGdaSnJuaWNs?=
 =?utf-8?B?U2VpZmRJYWV3bTJZNnIxMDRhVjZvRVgyRTZLNFhoRVlhMnRkeGVpRXBqTGxB?=
 =?utf-8?B?dkpXdXNJdHVmMHdzSVkxa1BZY0o0ajFzdXVhOWhiWGhCcVdMeWdzeU9rbVdl?=
 =?utf-8?B?UDVISGpUUEdXK05vYk9sdzNxdHBobG1QNElpb0NaczdBd0lrcVRZYlBDQklo?=
 =?utf-8?B?bjBJZDV5bFcyRVZhbGQ2OHZveFhtNS8rdFB2RExjUlo5RVRvNDJQSlQ4NEJP?=
 =?utf-8?Q?Pb4oRNPlszpDj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTdXMXdVMUJYZWdyNUpwenA3Tnowb3cyQTN2Y2pHWGhHVHBvOEwrYVorS0tQ?=
 =?utf-8?B?Sk5GSTY0TkhwUTcwU2ZIOU40RzVhRHFiUEo4OVJJV1pPYVZ6UzdNZmFtWmpi?=
 =?utf-8?B?ZXhwK2wxOUM2NGVpcnliT1k2cXJ3QVcyZXU5NHhkODNsS3JzWitKVzd5SXpo?=
 =?utf-8?B?dU1mcWExdWtWbUd3eFlWbXRMWS9oRG02cjVpa1BqWFlkcTQ1ODYyRFBhVnc0?=
 =?utf-8?B?bmE5S2hjNDdmUXFLNlpPanVNUENjMVlCZGdpQ1hVWFRRM1VyT3VpV1dvOCtH?=
 =?utf-8?B?WlBPQVFuUTNpQkFWbEg1a2FnTVI3dk1sUk9PTVNjZ3I2Y1d2cUN5T3oyWEUw?=
 =?utf-8?B?U3hRNmRmcnBDSTE0VFhzVnR2UkhhdHRTSlJnb2d3aCs4NVNtZmdwRGxLL0Jn?=
 =?utf-8?B?aVR2VWFTbWNSd2FOQzNZdW1OMEVNRU5PRzQxbmVEN1lwNXRVa21NMW5yaXI5?=
 =?utf-8?B?NndBTTNXcnh1QzhQb2RCZUdyTDE1T2U1ZUsxYnE4d1FnTTFrLzRQZysxMFhx?=
 =?utf-8?B?SFRHb3RVYW4wZElDck1pazNUZEN6NUxiYkRlcXRnMXNOMGYrZXZ3WEZIV1Rq?=
 =?utf-8?B?djNHQ1NLSm00Tm1MMTYyS25kMVJ2WmtzN0RWbkxsNWVIMlIyRklnMHpuSzZB?=
 =?utf-8?B?L2E5OU0zS0Y3VXRFMFltREFPRTF5QUZ4Z2ZnRGlaZXZKbWJLcHprcWRoRDFV?=
 =?utf-8?B?cEV0bmlRc2dSS2JJb0VCZVhFY2tXSDFiOHFWZmVlMlIyVzJjRzFLRy8zbVhr?=
 =?utf-8?B?Sm1yN1cwSDVJcUtNV3hMeVFjQkVyT0ovcnRmSjhZTFVEcnJXRVJqbVE5WUh1?=
 =?utf-8?B?N0ZiMHZ5VlFEMjk3elhyZmlGQUh0TEc4MXprYS9XVlIyVVJpNE1ZUDJVWngw?=
 =?utf-8?B?bjdRakFENnFlSzVrQUQ2d05xOXNITGd1Sk1UK2FkQzVHNDJ3ZmdhUC9tVkdt?=
 =?utf-8?B?UGp3cmRmMU9ZWGF6akVtWXB5c0R0SnNnQU5KR1BKejZWUXZLeFB1SW5mN0NQ?=
 =?utf-8?B?M3krS1NzMTFsNER2MzNiL29RaEN1d1o1ek5CV0Ixd2xiSTcxdk5TL2Y4MjBO?=
 =?utf-8?B?SGxmWXk2d2RhdHl6cUpsR0tKMGxJdXhMa2NzUWxmZXlVcXg0RTZXVytsdk9s?=
 =?utf-8?B?M1N5ZS92MU9yOXk2dUZyYVlnMHRKME9ucE5MVFVXZUVxVTlDQlVBOHIxYXlD?=
 =?utf-8?B?djJyWTd1WVViNDFxUEtkQy9JSHY2c05QZEJKaHRiYk43N1gxc0ZaVHUrVVNM?=
 =?utf-8?B?WU9TcGJncnF4b3ZwRVJmU3lXUW9EWFZzbHpXVDZFN3gxR001WEVGbzIwMk5y?=
 =?utf-8?B?WlpQdDlUcS9vUkVHdmozV3hFZEwzNEx6NkcyaURaenpDRFFMQ0YyL25kOTRK?=
 =?utf-8?B?RTdhVHRyQmdRT3cwbDdnU0RGWlM3V2ZTUFlrUCtZMnNKdDQyb2pvMlhMZ2gy?=
 =?utf-8?B?N0w4N0VvdzNYRENMclcwaHdKMjBXTGNnM3ZRYlJYNS9UNERlYnVpR3ZCVzhz?=
 =?utf-8?B?ZVA3RnQ1eUhrSEl6b1NKbUwyQVFwdjlIRFZvNGxpd1FRdHhoOUQwcFBFZFlj?=
 =?utf-8?B?eTMyWVJCSFlUZWNzcVVNdHRZNFA2SXd1bXlmajNuazNLYUlSZC9CaUxRZmlo?=
 =?utf-8?B?K3c2TVRLemxld0tIYys1bmJONDNoMFFUejFtNTZESThNanJhN3Jtc2RKRWIw?=
 =?utf-8?B?Umk1L1FUVmRxTWpTcDlZVTNjN1R3ei9lcElZRjhqd25peUR1MU1ETHJpbXJC?=
 =?utf-8?B?dlMzZ3RFaGN3VzZxc1JVVU5GMmk5UnNyeHNwd0w2Mkh6SGhFeEhud3BBN1hD?=
 =?utf-8?B?dGFua2czS0RBV2JDbStpVnV4cTl1VC9oRkxKaEY5Q05nY1EwVDZWL0o0K0sr?=
 =?utf-8?B?bTYraC9ncUJOUlBkTXFjdEpNZUw1MU83aU9qMFNUcHp6WlNna3kycmgzSTZ4?=
 =?utf-8?B?WHdSYVAveHlpTzdUcm1qUm9nTVZScHpvalhkU3g1bENjSjRnelgyRUFkTlFI?=
 =?utf-8?B?UksySCtTRUZ5U2RmNTczanVLSTUvcE1yZDRhNkpoSHJiTFJDTGZTL25tdkds?=
 =?utf-8?B?TUxtSzhXb1RrbFpaQWVwZDNCK3h2Qklpc3JWWGhNSVJ0TTdzNHRwdHgxaDVT?=
 =?utf-8?Q?4NJqrMxn0VcVeY21NTlXbmKHj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45204d2-51eb-45e5-b1ca-08dd21459e0f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:28:24.6483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeE3N8GUkS5zU7sbCGTLEgfMGWN1sTXNey3uA9j634u+jxHmk7r46Rwl1JaPJsM9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972

Hi Reinette,

On 12/20/2024 3:41 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/20/24 11:22 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 12/19/2024 5:04 PM, Reinette Chatre wrote:
>>> (andipan.das@amd.com -> sandipan.das@amd.com to stop sending undeliverable emails)
>>
>> Yes.
>>
>>>
>>> Hi Babu,
>>>
>>> On 12/12/24 12:15 PM, Babu Moger wrote:
>>>> The ABMC feature provides an option to the user to assign a hardware
>>>> counter to an RMID, event pair and monitor the bandwidth as long as it is
>>>> assigned. The assigned RMID will be tracked by the hardware until the user
>>>> unassigns it manually.
>>>>
>>>> Configure the counters by writing to the L3_QOS_ABMC_CFG MSR and specifying
>>>> the counter ID, bandwidth source (RMID), and bandwidth event configuration.
>>>>
>>>> Provide the interface to assign the counter ids to RMID.
>>>
>>> Until now in this series many patches "introduced interface X" and every
>>> time it was some new resctrl file that user space interacts with. This
>>> changelog starts with a context about "user to assign a hardware counter"
>>> and ends with "Provide the interface", but there is no new user interface
>>> in this patch. Can this be more specific about what this patch does?
>>
>> Yes. This should be about resctrl_arch_config_cntr(). How about this?
>>
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as it is assigned. The assigned RMID will be tracked by the hardware until the user unassigns it manually.
>>
>> Provide the architecture specific handler to to assign/unassign the counter. Counters are configured by writing to the L3_QOS_ABMC_CFG MSR and specifying the counter ID, bandwidth source (RMID), and bandwidth event configuration.
> 
> Again just one sentence appended. The "to to" demonstrates it is another
> example of something typed quickly to see if it sticks.

My bad. Will rewrite this.

> 
> 
>>>> @@ -1686,6 +1686,34 @@ unsigned int mon_event_config_index_get(u32 evtid)
>>>>        }
>>>>    }
>>>>    +struct cntr_config {
>>>> +    struct rdt_resource *r;
>>>> +    struct rdt_mon_domain *d;
>>>> +    enum resctrl_event_id evtid;
>>>> +    u32 rmid;
>>>> +    u32 closid;
>>>> +    u32 cntr_id;
>>>> +    u32 val;
>>>> +    bool assign;
>>>> +};
>>>
>>> I think I am missing something because it is not clear to me why this
>>> new struct is needed. Why not just use union l3_qos_abmc_cfg?
>>
>> New struct is needed because we need to call resctrl_arch_reset_rmid() inside IPI. It requires all these parameters.
> 
> Could you please answer my question?

May be I did not understand your question here.

We need to do couple of things here in the IPI.

1. Configure the counter. This requires the cntr_id, rmid, event config 
value and assign(or unassign). This is to populate  l3_qos_abmc_cfg and 
write the MSR.

2. Reset RMID. This requires rdt_resource, rdt_mon_domain, RMID, CLOSID 
and event.

So, I packed all these in a new structure and sent to IPI handler so 
that both these actions can be done in IPI.

Can this be simplified?


> 
>>>> @@ -1869,6 +1897,36 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>>>        return ret ?: nbytes;
>>>>    }
>>>>    +/*
>>>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>>>> + */
>>>> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>> +                 enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>>> +                 u32 cntr_id, bool assign)
>>>> +{
>>>> +    struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>>> +    struct cntr_config config = { 0 };
>>>
>>> Please see 29eaa7958367 ("x86/resctrl: Slightly clean-up mbm_config_show()")
>>
>> This may not apply here.
>>
>> x86/resctrl: Slightly clean-up mbm_config_show()
>>
>> "mon_info' is already zeroed in the list_for_each_entry() loop below. There  is no need to explicitly initialize it here. It just wastes some space and cycles.
>>
>> In our case we are not doing memset again.
> 
> No, but every member is explicitly initialized instead. It may be needed if
> union l3_qos_abmc_cfg is used as I asked about earlier where it will be important
> to ensure reserve bits are initialized.

I missed your comment on reserve bits(Searched in this series). General 
rule is reserve bits should be written as zeros.

Thanks
Babu
> 
> Reinette
> 

