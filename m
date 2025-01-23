Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF12192B76;
	Thu, 23 Jan 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737661914; cv=fail; b=UK973XRWi+VE+PIIgQLAUL7sSWDwIWbW1XndKNuKP6RaCzn7sLQ3G5kBVvyuniGpFkRc67vRkLcJdpkPFOUUrJDej4HAEruh32cM4eDlTDfX4Ekd9We9GeNSbPxfkE+l7Tw+hagBm3FiRd6c9dcjLaAKpPOEa4joS/f29+FpBXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737661914; c=relaxed/simple;
	bh=Dv5sPT9+26AfcbNsjkGQuYUNPG1+lMQrqnSNlWDvKAY=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ndQh8IPTwKzf6dlJ6hRs6CkJUFQ4S6suN16awNEZHHhCuxoFW3jA012KiCuewjEwNxHhF9ur2sH5JtcwSeJDKPa+OjbwoOakBRko7sdP+MgIXMQ13NaVmOsxfpMhVPDAJOq66Z35DaeaQrlhYv15asNsCsJdt28W4wmWTkNOjEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rcuvXJU9; arc=fail smtp.client-ip=40.107.92.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rcuvXJU9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfJZfBxs/2CAaOx4ck25aeYElgQidn50WtYjyKkUmdsOJ83I6vMkoKKs0grItillG50LCTHxK5bbMeZ4T4vCMMS6VDT95kbGnxVVmiYX1OV/Shn0J/Vvtndk76uZ7ngbQ7+zdiRAJCym1Zn+thwonHFqyv/optIeZKjcHWySRRwSfcYy4oGOTfKNLAQ+rAWM+xeVwwBa3GGsWcINsYuir7RZccap8a47Qr8KAOo1bX98wc8jEpCBXRq/7xRZx7IIljEkssG6kgePs0yC4NpQ0ND/fug0UQvBGMhP0s7uRlyI9EJbt1hvTOvxQq+48sEWBAWRgWyW4aoA74v2rDD0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQs4DbAazeN/T5297QvM/mvJITSAdvUW27eZYG2S7Zk=;
 b=q2R+u8e+qH8NBvVEiJxy4zyWKUSOBdoHbdXbtewoV1F3hMmNQTkMg0o7b95P/lBLe22AIQLrr67o1TS9IByCJ/yYyKLiSk2FRcFsGFkvt7Uq2VIrsCwmL7g00z93j0g2x3XOsSCS1hFCKbAgv6OYfH7t7W4UfuX5FGOJ6F1Xof9BngH2u6pepR8Csl812sfC4blxHGgPPXB1nagk0ZgLCiZiING7ORa39adX5Tyj/lssz0rudNLKoGKPL7ZhjU6DQbVpcTFtOfz22lCO/yEbiCl1c0WlIm9ckSSXgK2Z4+WqKVRZKo3r1bcJZSz38q6elWh5rip+AsfL2SorTXz3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQs4DbAazeN/T5297QvM/mvJITSAdvUW27eZYG2S7Zk=;
 b=rcuvXJU90V1xH6ehFeE/HVwaPmsd/eSrmH734qrh2F4oCYmOG3wVhco+500JgKoQUabes72yKGDV7E8tOZFlzggpLkprBB4qL0Z0Lhkv221X4ziaXU3XCd4IEVmjMi3pa5vuFutPkY/eOuM9/TSd/rfDhS3U4wAvEauykZKoFzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 19:51:48 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 19:51:48 +0000
Message-ID: <34c4f359-3050-49a5-9421-f0254118b775@amd.com>
Date: Thu, 23 Jan 2025 13:51:44 -0600
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v2 4/7] x86/resctrl: Implement "io_alloc" enable/disable
 handlers
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com,
 akpm@linux-foundation.org, paulmck@kernel.org, thuth@redhat.com,
 rostedt@goodmis.org, xiongwei.song@windriver.com,
 pawan.kumar.gupta@linux.intel.com, jpoimboe@kernel.org,
 daniel.sneddon@linux.intel.com, thomas.lendacky@amd.com, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, seanjc@google.com,
 xin3.li@intel.com, ebiggers@google.com, andrew.cooper3@citrix.com,
 mario.limonciello@amd.com, tan.shaopeng@fujitsu.com, james.morse@arm.com,
 tony.luck@intel.com, peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1734556832.git.babu.moger@amd.com>
 <2049de4cc86740fe525468347836e00025f53c83.1734556832.git.babu.moger@amd.com>
 <af906265-a341-4a00-bfd8-7aa9acd53b8f@intel.com>
Content-Language: en-US
In-Reply-To: <af906265-a341-4a00-bfd8-7aa9acd53b8f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::26) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3d91d0-8ec2-4744-a0a5-08dd3be75f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXNUMFhnR3U2Q1VWSHZkdGRuQkFIMUM5VU9aN016bllZL3lKVkthMjAzMW8x?=
 =?utf-8?B?eG81cWdhN28rUFJ4MnA0dVZvcGc2VjVwcndNd0pCTnJZOTlTY1lKUmVpRlUx?=
 =?utf-8?B?dDArbHBkYnlZZnluNXZQUkFSMXlINFNrMC9EaVVlMy9pZXBHd1Ria29LbDQ3?=
 =?utf-8?B?ZEdLb1RDN3BzQVBYNDBPT05ubTdBNHN0M1NiZHFVaXB2blpMUWFBWlYvcno0?=
 =?utf-8?B?UDM1YUFnRUVGK3FyajZ6R3B2KzdSWWc1bjl5dnp5c2RCLzhROVFyRXo3eHZt?=
 =?utf-8?B?OU1YTnpEVmE5NkpDd2pPR2M2OXdvWHlOYkw2eWFQanJCZUF4Y3ZTZThtcjRx?=
 =?utf-8?B?VjlPSE1YSTlJcUVldXU3SStCVHVxLzdHN0k1TW1ycmJlSGwxc2dwNWN0UEov?=
 =?utf-8?B?eE9uR2Z2djhwN2JhQlZCVi93REw3em1MS1hXdVBKL0JqRXA5OTJaTlBoQTlS?=
 =?utf-8?B?MXBjU0ZoYUxhNWZpYzVtY1RWeW1pa2J3T2cyZDNNWk5IT2U4d0FvWUswRzRa?=
 =?utf-8?B?ditRV3VaN1FIN3Y2SHRzQXFUTUtVOVBiSTljWGRVRk9GbWZDWDNwamFNNi9n?=
 =?utf-8?B?NlBaejFBRENHQjVXZ3BkQW9Ra2xPRlFUQTFrc1dTR3g3eFlyUDBYSzd6cnZN?=
 =?utf-8?B?ZHJIaDZ6U2VtSUpETVU0U1lkV1VvWTZLWHdQM1d5VmorUU1BM1IrQVRVeVZH?=
 =?utf-8?B?QUhOcncwaGpjZ1p2VzBKYXRMZkUrbEYraHV4enQ3bkRzUXgxTjVPNEtPcU9j?=
 =?utf-8?B?UUc2aFJhbml5cGNPbzZtY2dRakZwRVFoMGVUUVV0UWRPb3lLNWhRQ2V3ejlC?=
 =?utf-8?B?OEJpeXRWaVBZRGdqbDAzZXJUajNDWlZvR3k3VmJrL0d5ZXgvY2gvQXRFdmlK?=
 =?utf-8?B?V05hWmRLSFlzL1ZKVFN3b3c1SEcraWJTNTk3Wjc5VzM5M1pzMXJxLzEwcGln?=
 =?utf-8?B?cy9Fa3NkS3FrV2toZlZLZy9HaTlyVnUydlUwbFFZZzltMWNJQjBDYkc3N1lM?=
 =?utf-8?B?Y3JpdUFnVXhKdXU4Mlk2Y0lsU2hQbDgyc0VZUGFZKzVCTUFQUkdOSklNbUxn?=
 =?utf-8?B?MTBReWpoWGQ4eE54YVR1SU9wamdtcjVrbmRsVTZ6dEFkb1JvbFB2RXUzME84?=
 =?utf-8?B?QmRMdENYOVM1ODRHY0I1RE1sVXJNTm9hUDZzaVVQTDlzRzA0ZHIwd3hlMU5Y?=
 =?utf-8?B?TkgzRzBzVFVPNnJaZU13RTgxdURTUlZYMjRpRWdwMU9aaVdEajdxQUtSdnlT?=
 =?utf-8?B?UEhlYm9GRmdXTzF2RE9naE1DL1AzNWNzb3FyckpFWitiTFRLWTNYQ1dwUy9t?=
 =?utf-8?B?enc5bTljYk5aRzZpWjBKZnNSU2E5UlNiK1g4MnhHY2ZXRVFwdUF3bzhBN1Az?=
 =?utf-8?B?bEZxR0pZREFuaG9JMlBXSDVjS1YvMitSdE1ZL01qUmxsbW9reitwSEMyQ0hm?=
 =?utf-8?B?cmE4eFEycTdEdkh4c3NldFFKYUNXWWcxL0hydEdjRStBTFAxRmpiOVdMdFlO?=
 =?utf-8?B?WTZzTVA4VXgzTVlCZ2ttVUV6ZG5JaEQ2TEh1WElpSGtoVjV1eTZoY3pac3hT?=
 =?utf-8?B?cmp1bHRpclUxZGVCUFdrTHQ1VXp3eEpocDIzK1BLK3d4VXFIdHo1TlJGU0lZ?=
 =?utf-8?B?MXBISElUcHp4V1JJY1BnejIzNUtTUUZvTW5lMWNCRlhLWFo4dlNhRFZoMGVH?=
 =?utf-8?B?SlI1bWVGd2hGejE3am9UNks0eHVXbERneHJRayt0dnFBR2Z4c3VvTVdsN2h5?=
 =?utf-8?B?c29RQjBVcGltNUU3T2FNak9hRkFwc09FYWNJV2FpZUVwNTZUdXlSOUM4UzNq?=
 =?utf-8?B?WXpBTW9nTUYvM243eDhDUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzFSeGFYRmU3dXp0NkVpbytwZlh5Z0RNc2EzU2doeFFDbEFUamN0OXZBaUdj?=
 =?utf-8?B?bzZ6Y243UzN0bmNNRGVEV1BCZ0hYTmMxcDJMWTZtTGk2WkIrb25MRVdqckc5?=
 =?utf-8?B?SFVCclhWdElWak1taTAwamdZd3JuOW84NUxSTW04WDZBQU5FNXV4QVF6ZkRV?=
 =?utf-8?B?VjB0N1RvYjBOWWNZaHdYZmt5VlVKNEtycnIrTkp2UDFsRTV0RmhzWXV0dUd0?=
 =?utf-8?B?R0FDWklUNnpxVXJWY01jbFlKeURCY0FpK2VYMElxTU44aU5jTVFwVktNMzJa?=
 =?utf-8?B?Z3NYMlc4cnNBS21ZZmhxVU9ZVXRWYkpiUTl0bkg1OUpMMzJpakVKTHFYbnRW?=
 =?utf-8?B?ZUZYYUlvNnFsdmlGYitJR1BHdW1RYkMrRzdxQTE5YUkwaVVkQTRhRW5hK2Fi?=
 =?utf-8?B?Yy9XU1Y2MkVjY3FnRG5ueVNDUDV1U1J0ZUFQYXhhbW83U00zSnhjS2ZoUXlq?=
 =?utf-8?B?eGZaSE5DK3RYUXRyREZmUTgzQ0psV2tGcEhuMkRadWJSR2gzOEFabTUyQ3c4?=
 =?utf-8?B?Um8vZmlHemlNR1l1eWFsemMyZXJ1MWFkNzZ4VUhITVNoalkwZFRsNmd3eTBp?=
 =?utf-8?B?RzhDbVNybEF1Z3ZLNGx0c3Qva2U5V1VlNnM4dm0wZkNKeTlhRko4S2ZvOEdt?=
 =?utf-8?B?eWMwcEZ5V0ZybXFQWWZDeGRxQk4yOU1xNS9SSklCQ09vQXZ2R041T0tKUXZJ?=
 =?utf-8?B?c0tnQ1BzN0lhcm91dkwyTmVFRWJ2TWRPeFc5YlVWNUFESUUwV1hJSWI3RGpr?=
 =?utf-8?B?QVFrYkNTUVp1RXdxT1VlRVkrVCtYOFdURld3VzZzdlJvV3E5TXdhekRLREZq?=
 =?utf-8?B?clljaTdhRmMrek0zZ3ArZk9jR0JQdDVDTHRtV1N1M1BiK1hGQi9YVTRTOHNV?=
 =?utf-8?B?V1JhT2NTSVJFaFg0b1kxV1F5MlppNEFRSkJuVlkzd2FFRWJHTCs5WXRvQndv?=
 =?utf-8?B?WXVDMXRUZ2lYbzZYelZSRWpnY1VhWFVQTzRLYnJTaEg4bmd0eUtGb28ycCtU?=
 =?utf-8?B?ZG8zbC9QQXhyS1ZETG1iVlFlcDdWOUttWmh2akVWUExDYjNVNThoK2Ivc21Z?=
 =?utf-8?B?TE9JUm5YYWY5TTc3WGE5V29XaVplZnJUL2MyeDQ1dVB1MEpMVEYxbXJPMVJJ?=
 =?utf-8?B?RnZvakNpODlROVM3WUNkQWJINkI5WC9DYnBVZ2R2elpFQmc4SzZpWmNrZ3NC?=
 =?utf-8?B?QnFCeUNaSk1MOVp5eWZkV2hDcnhRU1BRd3JhazM5NHJOUzJtL0ltVzRsdU5R?=
 =?utf-8?B?ZlFOQXJ6Qy9aSjNOVk9EQjhIcENqaHJwK2dzS1pvWk05cXB2eHpHWHRxMnpL?=
 =?utf-8?B?UTlDek9XalROZnlvSHBJeXlyUGoveUoxRGZSdHB3V3F5UGticjU4UkdScVJl?=
 =?utf-8?B?cHdBVzZUdlpQdDNzcS9BdjlGZ0JiVlRwSVU2cFc4SzBHVlZnazA2aDBiVVBW?=
 =?utf-8?B?czl6cWI1ckRsdWJWNUhudU9jMXhFQ3BnV3JaVnArbEF2TE9nN0RoajI5L2sr?=
 =?utf-8?B?S3B4am9yYXNncnA1TmJPaWp0cERjeitCZkFSaVJrb1l6dENsM0V1blN5RDBi?=
 =?utf-8?B?ZllKRnRpcXRZamxLaktnWDNkeHp3Q25yNi9SbnlPQktXNGxSMGxtcHFKa0NC?=
 =?utf-8?B?ZEdyb2FZQVgyeFE0dVNPaG5CcU14R2VQc25NRU1XbTVqY1FSNVRuOVZUWXVn?=
 =?utf-8?B?SEhJOHJiNHRvYzVTZDVYSENvRVVNdnNUODdCQ2paNURiNDFBZ0FUaVdEQW9G?=
 =?utf-8?B?VnlTUEV4Q3dxQkNiZUF2VzZIc0xqWnRldFo1UTE4TEMxRDQ5d3hmYmZiYW1q?=
 =?utf-8?B?NGFPNW9aMFZtNGRhS1duQVZxR1cxWlh1S2JKK1ZVcFArcU1KaTVxTjgwem8z?=
 =?utf-8?B?RTdweWtqK0N2eGdjcHJIdHFCdGlSRnh5RFpRYm5rcWxrWW8vK0FGQ2YyY0ti?=
 =?utf-8?B?VlJkZFllUW5OVkE4VE9NeE1xTWVWWGdDaW5aRytGUDNxSWlNL3B1QUtFUk4r?=
 =?utf-8?B?YlE4WHVoYm5yUzdBMTBTcGdtODQ0NmRQVnBCY1hGUW5aVnUwQy92bjUxK1F1?=
 =?utf-8?B?OGNweFdGRW5UYzZXZk5jTTc3WDJ1T3Y3bjhHbU84Z01YTnZkRWVNNjY0Ync4?=
 =?utf-8?Q?uGnk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3d91d0-8ec2-4744-a0a5-08dd3be75f9c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:51:48.5637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTadvh74hIQTYmwxbfZpzGpWRfCSKCHzPGeM8rLtab08m+GSiRR7K6bHetKZCG35
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635

Hi Reinette,

On 12/23/24 15:14, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/18/24 1:38 PM, Babu Moger wrote:
>> Introduce architecture-specific2yy handlers to manage the detection and
> 
> "architecture-specific2yy"?

My bad.

> 
>> enabling/disabling of this feature.
> 
> Please add more to the context. It just jumps in with a "this feature" without
> any introduction.

Sure. Will rewrite the commit text.

> 
>>
>> SDCIAE feature can be enabled by setting bit 1 in MSR L3_QOS_EXT_CFG.
>> When the state of SDCIAE is modified, the updated value must be applied
>> across all logical processors within the QOS Domain. By default, the
>> io_alloc feature is turned off.
>>
>> The SDCIAE feature details are available in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
>> Injection Allocation Enforcement (SDCIAE)
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v2: Renamed the functions to simplify the code.
>>     Renamed sdciae_capable to io_alloc_capable.
>>
>>     Changed the name of few arch functions similar to ABMC series.
>>     resctrl_arch_get_io_alloc_enabled()
>>     resctrl_arch_io_alloc_enable()
>> ---
>>  arch/x86/include/asm/msr-index.h       |  1 +
>>  arch/x86/kernel/cpu/resctrl/internal.h | 10 ++++++++
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 34 ++++++++++++++++++++++++++
>>  include/linux/resctrl.h                |  9 +++++++
>>  4 files changed, 54 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index 3f3e2bc99162..360c52a62da9 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -1196,6 +1196,7 @@
>>  /* - AMD: */
>>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
>> +#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>>  
>>  /* AMD-V MSRs */
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 20c898f09b7e..dff3354c2282 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -56,6 +56,9 @@
>>  /* Max event bits supported */
>>  #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
>>  
>> +/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
>> +#define SDCIAE_ENABLE_BIT		1
>> +
>>  /**
>>   * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
>>   *			        aren't marked nohz_full
>> @@ -479,6 +482,7 @@ struct rdt_parse_data {
>>   * @mbm_cfg_mask:	Bandwidth sources that can be tracked when Bandwidth
>>   *			Monitoring Event Configuration (BMEC) is supported.
>>   * @cdp_enabled:	CDP state of this resource
>> + * @sdciae_enabled:	SDCIAE feature is enabled
>>   *
>>   * Members of this structure are either private to the architecture
>>   * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
>> @@ -493,6 +497,7 @@ struct rdt_hw_resource {
>>  	unsigned int		mbm_width;
>>  	unsigned int		mbm_cfg_mask;
>>  	bool			cdp_enabled;
>> +	bool			sdciae_enabled;
>>  };
>>  
>>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
>> @@ -539,6 +544,11 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
>>  
>>  void arch_mon_domain_online(struct rdt_resource *r, struct rdt_mon_domain *d);
>>  
>> +static inline bool resctrl_arch_get_io_alloc_enabled(enum resctrl_res_level l)
> 
> The custom is to pass a pointer to the resource when interacting with it. Why is it
> needed to pass the ID here?

Will change it.

> 
>> +{
>> +	return rdt_resources_all[l].sdciae_enabled;
>> +}
>> +
>>  /*
>>   * To return the common struct rdt_resource, which is contained in struct
>>   * rdt_hw_resource, walk the resctrl member of struct rdt_hw_resource.
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 6419e04d8a7b..398f241b65d5 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1798,6 +1798,40 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>  	return ret ?: nbytes;
>>  }
>>  
>> +static void resctrl_sdciae_set_one_amd(void *arg)
>> +{
>> +	bool *enable = arg;
>> +
>> +	if (*enable)
>> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
>> +	else
>> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
>> +}
>> +
>> +static int _resctrl_io_alloc_enable(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_ctrl_domain *d;
>> +
>> +	/* Update L3_QOS_EXT_CFG MSR on all the CPUs in all domains*/
>> +	list_for_each_entry(d, &r->ctrl_domains, hdr.list)
>> +		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
>> +
>> +	return 0;
> 
> Same comment as in V1 about this arch specific handler always returning 0 and can thus
> just return void. Also the name should not reflect that it is resctrl code. One
> option could be _resctrl_arch_io_alloc_enable().

Sure.

> 
>> +}
>> +
>> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>> +
>> +	if (hw_res->r_resctrl.cache.io_alloc_capable &&
>> +	    hw_res->sdciae_enabled != enable) {
>> +		_resctrl_io_alloc_enable(r, enable);
>> +		hw_res->sdciae_enabled = enable;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 5837acff7442..8c66aeac4768 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -344,6 +344,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>>   */
>>  void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
>>  
>> +/**
>> + * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
>> + * @r:		The resctrl resource.
>> + * @enable:	Enable (1) or disable (0) the feature
>> + *
>> + * This can be called from any CPU.
>> + */
>> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>> +
>>  extern unsigned int resctrl_rmid_realloc_threshold;
>>  extern unsigned int resctrl_rmid_realloc_limit;
>>  
> 
> Reinette
> 

-- 
Thanks
Babu Moger
