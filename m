Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE9222595;
	Fri, 20 Dec 2024 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722555; cv=fail; b=o41ze8DXyBtpiQgbF+rggpgcTweJNscFAPap7VwGNUYDlQ1U/C8bZYtBvb0XynZ5GDHn5HbDf0DNT6c2viWEUUB68uXr6edTEX9hkgOxbeb+AsHAEBZeltgrVdf4PuolW0x1PXAQH1Z4HTD3KyJTbXZ/tcZ0ADcoLbnLIOF52iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722555; c=relaxed/simple;
	bh=YQBMX5jgds4+ad5yOSCZG6+1CvV1mRSwvedNT7aBabs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nPnoy6rxS3KRZegTq1OCedMe5T84SpJe4MpcLeLNsfy/GndyGwUJFVZAGtFALtd4QMf24EnX2BhvHRfSV/jA/amVrS6S5pSOgkZ+sgQs7sjhUanwfyB+lZynQrUTADFi8QoQ6PaevCzqNchKbkvRn+6PC3XE3z7fI/oD9PBlt0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mPfJ8aiY; arc=fail smtp.client-ip=40.107.94.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mPfJ8aiY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Me4k+qB7S8+84ZIVMdnZ/pBdnYzFYmmjmKEcPQie6gtheKCQzyQKLXF9fTlUwtXLUnjocXt11mTuQJFiBazmkOrZ7UbLFnGRrC/tbp02Iy3XziVftkKc5IgzZYIRK96QTtYWm0m97b8Gidb3p6MYCTPmDsR2Vo96JrfO1T2X7p9/PpqDxxp2XRWE7Z8Evtqp7/+JG+c7oQJHKPnqOU2kwL53JPVMPOfjFAcnHI0RDwKCSqIwMiYumZAfMTCTWBq9B2haWscx5Ex1/WqKqv30UZsPug0So5Pcz0haJvz6CHW7o0yu7MyMe42pHezIXoXcDfyxQ3JdBvMnozQAeShqWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhq02R/iiN2OxT44Y/+olbvYlEl/33v6ngZsVGt1ojI=;
 b=HC1TJd8II3fOVmXxo3MUQWnMNnTLQbWY+o1ctWPkmO39ax3g4DKyajsK+lA+dDMdlOBAV2Q9Gj2k3fVjozQgB8+EAGjeBsR13u9Nc7beyRXTU8FXjULHT0pRwvUoXd4o5vrniozTssCZgvd5zn66C4NcxozHzbvy1Mbp/KX1mPgjPBYNHJtHnWJhVBVxdgFMrcI6ujRJpbw4NBnl5UyXxwx8wQ/3v/N7dNW6PExi8qfArtjtPsJsRKvOAEA9Yuam1NNYQKTmNY1XaGtTEQP0+5AaF5k2vGEkaJ1VTN9uvMy9GN4OMw7+BBnIIFWy+onVOwLSSUDvAhdKWqWfIW8BsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vhq02R/iiN2OxT44Y/+olbvYlEl/33v6ngZsVGt1ojI=;
 b=mPfJ8aiYmFVSuJfo3ygfQhp9Gd0D4L75aSZaExE0LmPQ7BuSPl4fTXVZcpHcV0FiTL8HTpsJ2XOisCm0JVoGrnN/kSHsCg4NUODhuhvoyyFzRKKBfJDVTId0TzSXQ1k1z5nhPrJMyCh+66Rc3W1aGiaWMIIeD8q9iy/BjHVo9+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 19:22:25 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 19:22:25 +0000
Message-ID: <a8b7c71d-b501-4efd-8e79-db14f1704aa6@amd.com>
Date: Fri, 20 Dec 2024 13:22:21 -0600
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
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <d6bc8c3a-932c-4bb2-8bb4-b44b05baa9db@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:806:122::33) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc3938f-b3ab-48db-105c-08dd212ba2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGdDcStKSTJCWjREMWtsZVNlMFVlTVE5MDlpM25kT0hWVmg5VTNKMUVwcWdY?=
 =?utf-8?B?VmV3OEk2TFIyYVZJcDBCU0V5Z0NYOGhwMCtuaUVuaTRnNEFZMjRkZlJGVml0?=
 =?utf-8?B?emxJTGpOSzFqU2lLYlVpVUdRKzdqOEVyYWs0aThRMHB2MFV4Sm92Y3llS2lQ?=
 =?utf-8?B?My96WmZibVZTaFlZUWVlSTErN0RaWmhXcUFjS1k1LzEzRlpqRGJzUUl2RXov?=
 =?utf-8?B?YmVkM25mTWdMUnFaeHh2SmIweGhuVGdVVHk0VE05QlhRMC9PU29oYWEvYzFv?=
 =?utf-8?B?dEY5Ujl4QnZWWTE2bTRqU2pZR1lCUTJ4QlR2RWJuUWZzL2trNGZDSEo4MTdR?=
 =?utf-8?B?bUkrSytodnNlbnRyVTI5MkpVQlN5TXZVSEtVZitac3czODBIektub3FNRXJk?=
 =?utf-8?B?Y0FYRDc2Skk1anVLSEU5aTNkT3NUdy9iNEFFSk5WS1pnMktkUFhCMjJsQ2xO?=
 =?utf-8?B?YTdlZk1jY0JnOTNES0E0eUFCeFo5Tm1DYkNCU0hlZkNmclBHZnRERkE5aWUz?=
 =?utf-8?B?RWVOUnJVai9vblpJMDZPazFoUFZ5bnN3Y3JJQUhCVUxJejVKYUxWNFV4RXlH?=
 =?utf-8?B?bGRnZ0NsY0NTcHY5NTM4YWRCS05iTndvMWMvL2N5YzFRaTQ1MHN5aVVJUmVM?=
 =?utf-8?B?aDU2Y0p1TUxLTHQxdHEvTFJPSW9uWkxkN0x5MGJJWnNpY0pMZUxFdk5aOWli?=
 =?utf-8?B?dTcrN09iWitteFVGb0lXc3RnZmliRE5uakx6TnlUNkVaNEVreXBXbGFLUlpZ?=
 =?utf-8?B?NjUxbDRLUXkxeUV6ODhya01pdGxiWHdWZ2tKSzQwaWZkRVBOSW9uU3l5TCta?=
 =?utf-8?B?eUlQZlJXZ3dZZ0NiaklOVEllODJyUnpwc2YwSTA1Z2F1eGJ2MnBDZkNTOXhq?=
 =?utf-8?B?d1owSTV4WkxMZHJKR01GbFovajJlYTVTcy9pa21RU2kzOEJFTldFMTBJbUpB?=
 =?utf-8?B?V3JMSTRTaXZwOEVZWk5pWkMxMWVsa2NJdDhOaDhFZk5tL1FYR3hLcTVPVkNY?=
 =?utf-8?B?NHUrTDY0UTcyemxXbGxxUC9LRk05SXFCOUo1SmdrbDJrbCs3ck5YcHVCdjEy?=
 =?utf-8?B?OTd1MmdTSjN6ZWF2aTJYK09yQkcwdk5MODNLd1FXVXZ2cU5MSlJvTE1NWjV5?=
 =?utf-8?B?OXNGRHNrVDl2UU9VaXlRZVdzQ21hMHdMb3VpVUFIdXo3TCtHREdnQWwvTmd5?=
 =?utf-8?B?WmVzVFYwZnJwU3MvejgwUUo4Yzgyemt5SzBheU9nNkFlcFpNZHdIdzliNXhL?=
 =?utf-8?B?UTViWWJlaGpRenc3MG9qeVhKOC9ES2FFc3J6aUttcGZWZmpoRWwwTm0rNzEr?=
 =?utf-8?B?MzFqbkpJMTMyVXpoVDNEN2ova0QxVWI2aE45YjlMS1dVVThCSXBrcEcrdEZj?=
 =?utf-8?B?S2ozdzgzRFdMTnc3TnQ1MEZCZ2Zibkd1MkZYQnV2TVVkU3RXVDY4R0xhRjRu?=
 =?utf-8?B?MC9UR0EvTFRMbDNyUk5wMUI0WXhKS0tkNE1YSGdPRTFGdThReDJ3S2tWTkhn?=
 =?utf-8?B?ZXUrbEwxWHhNdEIyMkwwYlJqVWRsdHNITVYyaldiL3JKQVlycDRVd0ovTXVB?=
 =?utf-8?B?WFg0RVpiK3V5bWJuRWRDWXFHTllpU0lHVXZBRHJjRXlvUTQyM0hJc0M3aXRT?=
 =?utf-8?B?bU9mbWNFS1ZCcnljZHF1VHdkeFAweEhQUnEzM0FONnozazhwV1JZYzZxdDA0?=
 =?utf-8?B?clIwbFcxbUF2cTZtc1llRXltQ2txd3F4bnhBbEM1TnNWUVNhVXNXSzEvRkpt?=
 =?utf-8?B?S0xuelYrd0hDb0JsM1hCTE16VG1OYUQzZThTY3NaL21wR0VOMVZsNW41aUhN?=
 =?utf-8?B?cTdMd1poSlRIVjFVSGtqMHZjUWx2Sk14ZXlmcFA2bFhUYnh4THc0QWVtVHl2?=
 =?utf-8?Q?SPPR5VPXe0Bc7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajU2N2NZcGg4STdlTGxOZ0g4SUdQVXpEQytBdFZNL05KemRYYWd5QU41UU5E?=
 =?utf-8?B?dk5HODJjbWk3UUs2Vm1iUkIwaFZHRE5CM2tGQ3hOSTdqbnRuNEJGTjYwRXFs?=
 =?utf-8?B?N3BMazhLZTJ2cFQxYmRZS20wM1NCR25ITmY4UXpjVmlndDJHSFRlbzd1MEZy?=
 =?utf-8?B?bHVpdUw5WXlQeG9nVzRRYXVMWWt3c0NvT3Z4Y2hpRkZYS0xtb2dZN1RadWZF?=
 =?utf-8?B?OWx1anBDSTdIN2V5bkpFZFZYUzJlSGl0alB5UmRnZUVFLzJiVDRCYVhwUDhS?=
 =?utf-8?B?QzJ1SlkvZE0vY0dGOGFWNElxYjZpeS9hQVBvd2NHSG5OeWIyT1JBaVgxbDFi?=
 =?utf-8?B?eTU1UHpyNVhYZENBQ3lPSlNSMk9rMDBHQ1B6UG4yakV4UWFzVHNRQ1FXM0Jr?=
 =?utf-8?B?RlBONjZZczhod3VvemtGMW9aTXlFUHBWOGdvaGZjYUs5RWNiZnd1QzVTcHBx?=
 =?utf-8?B?cWdwN3VJd0d4YUlURDFXTUd3SHEvYjE1RlF3bURmdXoxb1JQeGpKWVlkTUd0?=
 =?utf-8?B?SjAzdW8vYWs3YitrVHlJWkxMTHNrZlA1SXFMZU1scEN2TGJmVXlxV1U0TE9r?=
 =?utf-8?B?K0FMTVY3bUU5eUk2Y1RvbE1KR01UMGRaekgyL3UyUVV3dGd4SjFFNkh1bmhq?=
 =?utf-8?B?QU45cUExSkFYdHMwZlJjeXdIaGNHekpHRkV6Q0VPV1g0VDA2VTJINHVpMnRU?=
 =?utf-8?B?QlNSdVk1UE85djR2RWV3Z1dnUzcrRGo3TjJobkU4QUgzNzlTZDZxWDFRRzZr?=
 =?utf-8?B?ZGM0Y3V1MjVxeTFiS0gvUVNrdy8vOVE0Y0hJNFdqVDBPVVN1akNNdkFjUXF3?=
 =?utf-8?B?UER6MWNPVzBhMU9ndHZWTHhrMUxxUGVya3dpVjdPN0x6SUIxRWIxTy9EOG5k?=
 =?utf-8?B?bkdwa0QzelRGMUdlU05Bc2dLcnVqMUFBWWtiZ0t3amRWR0FrNzMxSUlSQXZo?=
 =?utf-8?B?cEp1cGxIWFd3UnFSTUgwYU00eWZhWGVqVCtGdEN0d2FyRUtQMUVBbUd1bEpP?=
 =?utf-8?B?ZW1OTXdtdk1aYzFMWTRRM29telRkalA3N3c1VHVNcWZPYjdjdkZkdXVLc1Zn?=
 =?utf-8?B?ZWtpWklpUFBacitiK3hIVUZyblFnZ0RWejRBZzN6cTZJanpXMThkZGFob0Ix?=
 =?utf-8?B?NTh0QUdqcTVEcStaRnp0UHNTRDVDNXlJdjhhcDhkSmcxaU1VR3hydFhiaW0y?=
 =?utf-8?B?UXJQQitjVERHZURybWg2TVN3R1diSDgwSFlacFU3eENDT3M5ODkwWDgyZWYv?=
 =?utf-8?B?eGhkU1hrTGJVbno4ZXRHSG9iYWVjZE14TE5YTHpST2Y4cUZhekdBRU1VWFNy?=
 =?utf-8?B?eVJvb1hpMVdRdUc2ME9BNzVCRlRUam0wUlJkUjJsR1NLUVNJMDJoM280K3FG?=
 =?utf-8?B?UVd5Q21Sdk5MLzlibzU1NUpXV0JBclpiaHJtMTZKOXlPd2pGcHErcVJsRlNG?=
 =?utf-8?B?WHhFNC8wUlVtN0lobTA1N2lQRm90ZW91WDl4aGRHYkV2eE9Eazd5ZUZpb281?=
 =?utf-8?B?L1d4NFRHQVJlekEzMmh3MzNuUHhYOUpNNXVWb2ppZ3hKRE0wa2Nwa2VvOFI0?=
 =?utf-8?B?ak43SG5lbWFERVZRZkxhcEJWc0V4RHhwTGt6bUhVTURoQ2dRRG1KQm5yQ0Z1?=
 =?utf-8?B?cVBwMUJ2V0VBZUp3c2tqS01MSUZZRG8rQXlGN0FFOGNXR3pHRUh1Vk15VUtN?=
 =?utf-8?B?UHM1cFg4SC9qY2w3c0hnbHA5d0FHZWR1TVVVaGkvWkNwYzM2eFFZbGNOWXlP?=
 =?utf-8?B?SnVrV1piZ2Nia2gvN2VsdU1sUjdLMEE0R0E3U2tlR1VBSXRzeFowWWxKYnBI?=
 =?utf-8?B?bmViUHR3d2JFck5QQWR6UWVrYzlCZURCMklSakRoNUllUGpHOW5pYi9VbU9a?=
 =?utf-8?B?TElHOE92VlE4TTR2OElCMkVuR0g2N1RicFJXZkpzSGx6RmplQ040dzRHSW9I?=
 =?utf-8?B?ZUlNTXhBSmZmZkdYZ2FzZG9XM3NkYTFoVHNpRkdQdmF3Q09jOWJycGlzd3M3?=
 =?utf-8?B?R1B4bUJEMFVMemZUbmhGY1Uxd1p5TDhTTE5CZUhIK0d1ZkNkN0wwSXJCM2h0?=
 =?utf-8?B?WHJqK0FHdndDNnBucm9Eb3lsYURSZlNKaXIxSG95L294WHdTS0MwNWFjRjA4?=
 =?utf-8?Q?5uBY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc3938f-b3ab-48db-105c-08dd212ba2d9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 19:22:25.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2oTSnPWjycffg3EOLaSj5X09TsXJJEeiLysCKsmuAFM7w6Xkvul86ug9f43zl+A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085

Hi Reinette,

On 12/19/2024 5:04 PM, Reinette Chatre wrote:
> (andipan.das@amd.com -> sandipan.das@amd.com to stop sending undeliverable emails)

Yes.

> 
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as it is
>> assigned. The assigned RMID will be tracked by the hardware until the user
>> unassigns it manually.
>>
>> Configure the counters by writing to the L3_QOS_ABMC_CFG MSR and specifying
>> the counter ID, bandwidth source (RMID), and bandwidth event configuration.
>>
>> Provide the interface to assign the counter ids to RMID.
> 
> Until now in this series many patches "introduced interface X" and every
> time it was some new resctrl file that user space interacts with. This
> changelog starts with a context about "user to assign a hardware counter"
> and ends with "Provide the interface", but there is no new user interface
> in this patch. Can this be more specific about what this patch does?

Yes. This should be about resctrl_arch_config_cntr(). How about this?

The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as it 
is assigned. The assigned RMID will be tracked by the hardware until the 
user unassigns it manually.

Provide the architecture specific handler to to assign/unassign the 
counter. Counters are configured by writing to the L3_QOS_ABMC_CFG MSR 
and specifying the counter ID, bandwidth source (RMID), and bandwidth 
event configuration.

> 
>>
>> The feature details are documented in the APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>>      Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>>      Monitoring (ABMC).
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ....
> 
>> ---
>>   arch/x86/kernel/cpu/resctrl/internal.h |  3 ++
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 58 ++++++++++++++++++++++++++
>>   2 files changed, 61 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 35bcf0e5ba7e..849bcfe4ea5b 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -701,5 +701,8 @@ bool closid_allocated(unsigned int closid);
>>   int resctrl_find_cleanest_closid(void);
>>   void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>>   unsigned int mon_event_config_index_get(u32 evtid);
>> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			     u32 cntr_id, bool assign);
>>   
>>   #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 72518e0ec2ec..e895d2415f22 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1686,6 +1686,34 @@ unsigned int mon_event_config_index_get(u32 evtid)
>>   	}
>>   }
>>   
>> +struct cntr_config {
>> +	struct rdt_resource *r;
>> +	struct rdt_mon_domain *d;
>> +	enum resctrl_event_id evtid;
>> +	u32 rmid;
>> +	u32 closid;
>> +	u32 cntr_id;
>> +	u32 val;
>> +	bool assign;
>> +};
> 
> I think I am missing something because it is not clear to me why this
> new struct is needed. Why not just use union l3_qos_abmc_cfg?

New struct is needed because we need to call resctrl_arch_reset_rmid() 
inside IPI. It requires all these parameters.

void resctrl_arch_reset_rmid(struct rdt_resource *r, struct 
rdt_mon_domain *d, u32 closid, u32 rmid, 
enum resctrl_event_id eventid);

> 
> If it is indeed needed it needs better formatting and clear descriptions,
> a member like "val" is very generic.

Sure. Will change it.

> 
>> +
>> +static void resctrl_abmc_config_one_amd(void *info)
>> +{
>> +	struct cntr_config *config = info;
>> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
>> +
> 
> reverse fir

Sure.

> 
>> +	abmc_cfg.split.cfg_en = 1;
>> +	abmc_cfg.split.cntr_en = config->assign ? 1 : 0;
>> +	abmc_cfg.split.cntr_id = config->cntr_id;
>> +	abmc_cfg.split.bw_src = config->rmid;
>> +	abmc_cfg.split.bw_type = config->val;
>> +
>> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg.full);
>> +
>> +	resctrl_arch_reset_rmid(config->r, config->d, config->closid,
>> +				config->rmid, config->evtid);
>> +}
>> +
>>   static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
>>   {
>>   	struct rdt_mon_domain *dom;
>> @@ -1869,6 +1897,36 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>   	return ret ?: nbytes;
>>   }
>>   
>> +/*
>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>> + */
>> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			     u32 cntr_id, bool assign)
>> +{
>> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>> +	struct cntr_config config = { 0 };
> 
> Please see 29eaa7958367 ("x86/resctrl: Slightly clean-up mbm_config_show()")

This may not apply here.

x86/resctrl: Slightly clean-up mbm_config_show()

"mon_info' is already zeroed in the list_for_each_entry() loop below. 
There  is no need to explicitly initialize it here. It just wastes some 
space and cycles.

In our case we are not doing memset again.

Thanks
Babu

> 
>> +
>> +	config.r = r;
>> +	config.d = d;
>> +	config.evtid = evtid;
>> +	config.rmid = rmid;
>> +	config.closid = closid;
>> +	config.cntr_id = cntr_id;
>> +
>> +	/* Update the event configuration from the domain */
>> +	if (evtid == QOS_L3_MBM_TOTAL_EVENT_ID)
>> +		config.val = hw_dom->mbm_total_cfg;
>> +	else
>> +		config.val = hw_dom->mbm_local_cfg;
>> +
>> +	config.assign = assign;
>> +
>> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &config, 1);
>> +
>> +	return 0;
>> +}
>> +
>>   /* rdtgroup information files for one cache resource. */
>>   static struct rftype res_common_files[] = {
>>   	{
> 
> Reinette
> 

