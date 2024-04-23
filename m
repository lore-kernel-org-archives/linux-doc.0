Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2080.outbound.protection.outlook.com [40.107.212.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFD413D258;
	Tue, 23 Apr 2024 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713890407; cv=fail; b=mEoA2Aa7AuBPGfg8gZJqSAlRb3vFiBLPS1fxbAz1hxb5xPmMFkzfMadn3IonOOGLe4ax1YtoGxgESlPDlz5fis3OjWJLxbpnEtbp+NJKvg92wiPvQQTavqzRivJ7j7qWkEkUKqzmxVPTEB7db1mZDzboRuF+raH3PCmxmeb1oAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713890407; c=relaxed/simple;
	bh=MhPN6n8DX6VLWqGCvqiiPgkq7LRbBeyUH4JGvkcs0Ns=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lgg9aEK5Bwo0NDgTqHtLCfsonwChF95GfCkqgUAMHmJ1UPNRzPIughMsbP0k1ex7ql0S6bq7l16x65X6dFODrlF9zt1BjloEzr+pFlFOOuz9cLKbvVHSz4tvtTGWH2YQFhzg+jxjT1pLCpm88sXVskq0K72J1VrX9H/+9VNABv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hTvBzQXG; arc=fail smtp.client-ip=40.107.212.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hTvBzQXG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVRALR0i8aSKhiqNoProkIDycVUQanmJrl0nO+OUEuFviVs7AcKtR5m8AAF3GyEbFg9KExJCbTDygEEFcHDStjNDRsj26M20OYRgu9EIVgJTgQ+heDvLA7rmDAgAo3dCMSBLMx4DHNTFOzgTDe/zb5WMoLxCP3CmtwgLpk+urtsBDASSYcphL4XV9vy/Xd8fkO3LvV181KJ2Ax1pJaIAM5oKftQD6XZzY786JJNPvNcCPLQ2suc3DrfasdZRBJLsTCWiTRZDo7JL4cSR5Zx9wZ3jMnYvlpBlEQrjl4f60oTzR3xMztQja2Na7w2x+4/1jcPMfL8M3W88umNW5PLMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SKaZZFZh/wX9Gny5qjzMFOBmzLknq5vY+EEKm7zXac=;
 b=XEZgtffQYwLOtMf/usfwPyD+EFHfoXhWjGvLzvLKxcqaFN84Jw8tD5llgt3AMMfjvLiYgMnD2Zx0ijYEEz90LguIhsRGglxDcGXUGQHv8bdxugXjSFjRnaqAL3LSvDMGU4PDOh+P+I/kXSN8O3VUSHz9vpkjC0bycIHEUN5Jhhov5pthe0VCSWckCKkuItHi0JtTRzdltaaWILbrMlk0MqXI9Cr0d/E5Qvd5FOnLA65iYDn+2kLQoqSGm7gW0lyuMA9qFT6aNa6CJ9q17Rb6CzCVRSeNXBi1yoqL6EekTkB1mfNJspHTDtcaA1Howkpnz4U+AZ2NG5dAg9hWncwu2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SKaZZFZh/wX9Gny5qjzMFOBmzLknq5vY+EEKm7zXac=;
 b=hTvBzQXGOESGU5Sieo2jqNEEi5KqwO1HyAY/DtzLjYBOtXmm0krNOf1w7bytpPyEJTToNFjTlXe03m2zems0eXXZqawZ5lSZRBWkTvqptiEDIruh93QHwQDW5A4rzkDB5l/rgZvQz2FUxMa2KtZPCPzbrQ39wXbDByZ/bTMKk64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by LV3PR12MB9185.namprd12.prod.outlook.com (2603:10b6:408:199::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 16:40:03 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8b3e:57e8:d574:309a]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::8b3e:57e8:d574:309a%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 16:40:03 +0000
Message-ID: <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>
Date: Tue, 23 Apr 2024 11:39:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Feedback on my development setup
Content-Language: en-US
To: Josh Marshall <joshua.r.marshall.1991@gmail.com>, ngn <ngn@ngn.tf>
Cc: linux-newbie@vger.kernel.org,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, pranjal.singh4370@gmail.com,
 "bilbao@vt.edu" <bilbao@vt.edu>
References: <CAFkJGRc824vYEufG=6ZVPAW2iVpd0NDThJadZVrUk_ZND_qJag@mail.gmail.com>
 <Zh6Xbqijp8rRGo1H@archbtw>
 <CAFkJGRe+UpNPSnSL623o6G+NCkK_uGPx-NCNLQx0vSGpMo98eg@mail.gmail.com>
 <CAPzh0z8RySn429XYQHoP_c9UA+pb6SLHGhH40vQDhc3P2xiysQ@mail.gmail.com>
 <CAFkJGRfK=1f8tfWO8G0v8SOmCwCgK7P5y7g2My47VG6Obb1DNw@mail.gmail.com>
 <ZiE9ydgMtpKOBLDk@archbtw>
 <CAFkJGRddGHK0j4CcQUoRKiD3afniLY=rRV5npY5wpauqqY0XZg@mail.gmail.com>
 <CAFkJGRdFuMoO4_mR-cR1NWjKQJnopN0v1R11-jSnLn+FKcOCdg@mail.gmail.com>
 <CAFkJGRcg+ThJ-xUve0=WorChW=-6PreLHXeM8YwtwzwpkHTu8g@mail.gmail.com>
 <CAFkJGRcgJA4qe1AVi23ZQVPr_UEzkTBPH8f30g=OsKmii7QzQw@mail.gmail.com>
 <ZiKYXX-v0Eu-qCBt@archbtw>
 <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
From: "Bilbao, Carlos" <carlos.bilbao@amd.com>
In-Reply-To: <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0057.namprd12.prod.outlook.com
 (2603:10b6:802:20::28) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c5af9e-22e7-4013-fda9-08dc63b405ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aklNUkZMcFUreG5hRmhLNkM3cmVVRmhRVUkwTkdNVWFucW1NVHQwUTNKaDVh?=
 =?utf-8?B?VnRsb2J5dWgyTU4wRGpCOUwrWlp5bnRrYVFjNEFBQTNuUG0xd3dKb200NGpL?=
 =?utf-8?B?R1Vnb3FBeU5FOUZHUklxclR3Y2FZZXFjQ0lrSEZKekU0RUxENmg5TmN5eCtn?=
 =?utf-8?B?MlpUR0psL2hKN0x0blM0aEJ5L2F4ZlcyYmNicDRqeTZsVFcrQytLNDEwR0Nl?=
 =?utf-8?B?SGZMM2wyelRYZDlZaHRuSDkwUWM3UkVFZ1psYldBWXlBT25EK2IwRTVPcERt?=
 =?utf-8?B?ZWRHZFBCbkh6T2JIQytsdGU3SjZIOVF2Z3hacUs2N0NhYTNiUVgrQTBSTk5H?=
 =?utf-8?B?UE9UOVRzMWNvQ2VIYTlvZG1ZVko5ZldFa0N2WDFxalhxRzRpTzAzMmhSWXF0?=
 =?utf-8?B?WnZNRmdoOExlUENGQ2pVMjhsR2dLUUZjWCtpVEtKYVZCZEQ2R0hTMDhUdDZF?=
 =?utf-8?B?WERWc2ZmMnduSDRJQ2dITWcrR1NmSGtrM2xxZkdwUmEwNEZTdXNmZzdSUzB1?=
 =?utf-8?B?QmU1NUhZaUVWNjJoT1ROaUFkdXpxbEQ0TFdXMVVwQXN5SEdscGkvOUlyRThK?=
 =?utf-8?B?cUx5aXdwSHJRZDZyeDlIQngrbFpjODdJWDdMakVEQlZxc29KN25YaWd2Z0Fh?=
 =?utf-8?B?SEY0b0QzUlc3dnJrSHNOdTdBSjhRVlgwZ09rZUcrTWI2a0M5aTIxVUk5U3FL?=
 =?utf-8?B?SHkzZDFEeTdVcW9LeXJCTU5jbU1BQ2NWb25XQjVoWDJyUGxIb1lZTnNUN1FU?=
 =?utf-8?B?WUJ1cHViWjA4bjZvbTkyeTBOY1NNbU1CZXQvbVdlVmFnN2xpOTBvRlJVY055?=
 =?utf-8?B?K3A0em9KeFp6ZXNyaXdYWmc1OC8wL1JKYWwxTWd4cUtzcnBBeGwvb0ZJQi9m?=
 =?utf-8?B?V2FPL0V2ZURETXRmcFdoWVhNZFRIRWROR1BJLy9uTVU3QnA0MHFjMmR3OElt?=
 =?utf-8?B?MEsxRGhBY2xEL1JuRWUvT1lXTmNjMEtleVZlRzF4ZUIrcXZKMGlsdDkza05M?=
 =?utf-8?B?QVdCclF5cEpwMjhueHliampaMnhqa3E3S1MxL0JpMVBGTmhidnkza21JN05w?=
 =?utf-8?B?Mk8zRmoyayt2TUdLVUN1blZ3ZXZxWlNaQy8zSXJvcEJNY2xFRGVyb1FmanZv?=
 =?utf-8?B?UG5qd0NRb3pXWHJja1dEeFh3cHRXTGNJQXRvSEpSMUVMU3VRNWcyS2tBWWt2?=
 =?utf-8?B?U2ZGaVVZbUVOVUs1cUthRmNSWHBuM1k3UUs0dE4rNEZLSmF2Y3U0aHdrZVV6?=
 =?utf-8?B?eVIrbFVsZ1ZYY3pVOVQwZ1FhRkpMbVFKcTR0bWFRQmJoV2NTYmtJNEJDLzdU?=
 =?utf-8?B?YjJraGlFMktZc0l2clFaNEpBbnJ1eUk3dHp3bUZvYXBXYzhiR0FHTUxEVERq?=
 =?utf-8?B?ZkJvUXNuL3dvZXppQmIyWWpwT0wwTVJyMlhKK1Bla1hvMHBIdlJkM0pDZzhi?=
 =?utf-8?B?VkN6c1pXeEo0WUFwNjUwZTB0SXF2Mm5ZMTdYQTZXSlprY2dQYnFla0hOZ0sz?=
 =?utf-8?B?UFNLcUNRSEM3Qi9LWmI3TGNSamRFODg5SUxBZnBYaWxHZk1EUlBvZUh1ZUpV?=
 =?utf-8?B?WHJ0ZW9UQVdaa0dBRkFTWGZ3aTQrNFZpZ0ljYThNa1ZmcE1HZytZcGY3NHdJ?=
 =?utf-8?Q?D4N3mynqg6kHtYNlw+koz0VqyH/BrNoNEwdAA9nF1s6o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDZGSFlhck5IaVhsTVRJRzBlQ1RJWGkyZ2ZxdjFOakVJUWczTkVuOE00bXd4?=
 =?utf-8?B?TXpGWkVEcDdMcENaVDBYYm5xV2RMb0ZWeEdWTVBBeUw0Kzg0NTI4TTluclZh?=
 =?utf-8?B?OGp3TXpGQkxjSUhJZUxKdkhuL25jODkzNlJtRXZaZHZyNG93eTcybXYvczIv?=
 =?utf-8?B?aEN3SkVqMGc5SEJuWEdkVXdQUTNzSExSb1hlMlFhRTVISHdrS0R1SElPNDI4?=
 =?utf-8?B?MUVxdUFDenF1ODU1TlZwQ211eGd4Z2ZDYXcyblNSaHFjL0hFZmozOVZyU3VJ?=
 =?utf-8?B?ei8xbHlPS3JrdXFtYmtiWjZNQ2dSazFYK1NiYk1GbWtpVDlSL1RBV2wxWkpy?=
 =?utf-8?B?TTNzTHcybzFDcWtqVVo5T0R2UzVTYzZxLzhMY0IrMlF3QTZQUEtMQ2hyeUpm?=
 =?utf-8?B?THFRRDU2cW9OeUNZSlhrdFhieENrRnUyaXdzZGZRZ0xvTStWTGdsMlVvc2dK?=
 =?utf-8?B?ajh1dW9odldKaWNJQXJTT21rbVRxMldsQ2pwMzJqbnJXaHZ0Si9JTzNaZUdJ?=
 =?utf-8?B?VktlTEgxc1I5WDVDVVNqb01KNTFQaEhFZE9ieUZ5ejNqbzZESWxOVmxxQ1Bv?=
 =?utf-8?B?c08zYjJpWFV4L1k2K2l6T01pR2JzZzdkSzkrcHpuYThDVXk3U0crTjlNT0JC?=
 =?utf-8?B?Wmhkb01Ed2t6cU5UMVNDV1V4MUluVjZaQU5mbEhMeWc4VFhFc0N2SndzSXZx?=
 =?utf-8?B?aFBRbHNVakIyeE9JR3BzUTJYRGNXSzd3N2E0TWtEYjIzWEZRMmJlQkIxMFlk?=
 =?utf-8?B?Mm40allBcVFRVkh0QkVjdU92N0Z6RFlaQkNNTHRTd0kxQ3ZRYVZ1bUJ3VG01?=
 =?utf-8?B?a0YzUW85NWl1WERaYmhQUGRhK1JWTzZaSVFwdHpGZTlKb0xCNTZJTytocFUw?=
 =?utf-8?B?bHFGY3JMSnZEWEN2UmF6dWp3U1RJeFVLSG83bVhBR0ZHbTBVczlxdHF1dDZY?=
 =?utf-8?B?WTRoU1owYkpNNXp4b0dZQ3RrR1F5cG5iVkgwWTBySkcwcjN5bUhyTHVyejBL?=
 =?utf-8?B?eDdGYnNLTWk4QkY5Z0FTR21SQ1p3djd1NWZ1R2ZGc212Z3M4ZGk2eWJid08w?=
 =?utf-8?B?SWU0a3FTYkFnZVozSTFhUzJ0VmF5Y25NRzVHeWd0QXZBbjdNaTZnR3NkcjRi?=
 =?utf-8?B?MEg2UHNNTmdvUldqT1VxSVNUejBBN2NsSTF4Z1pSSnA5NittdFZCUCtZWXlZ?=
 =?utf-8?B?WGhqeEIxR3YvOHpESzllRnMyZkFBN3RSUzlqOTcxa0Z0K2xWeWo1ektzVk5t?=
 =?utf-8?B?ejh4eVJJRFR0N2E5UXAvV0VXS0VOeHNlY3NYVU8zNWJVdkRIeldxNTRLbHlK?=
 =?utf-8?B?UzFoeVJGSFNDN2MybTVlNTFDbEhMRDQyMWJKMFl1L0grM0t0YkhpK0NMRFRG?=
 =?utf-8?B?SVpFT2c2U2dFWXM1NXBzSXpFdGVwc1BzbkdldVNScXlCZFNvWGh4b2FVMlRY?=
 =?utf-8?B?NUZZY2c1MGtjZUp1eGtLWGNySkFsYkhrcENxUjZudDd0OXphV1dkbXB6YlBv?=
 =?utf-8?B?a1pQVkFsdVdReVBlSjVLQWR0cnlpdVBlZ0xteUw4NVpDbStManNEQWtxRW9u?=
 =?utf-8?B?bVZkZWo0dUFLeHQwSEdKTXZscjltVS9ad2w3b2F0ck0wdHNqK0ltS3J3Zlkv?=
 =?utf-8?B?b3RhZ2I2d01uRXpYVDkwY1FGc1MvUWNvbGhmMi91N3pnbnpVWjY0QjluQklZ?=
 =?utf-8?B?K3RwNEdHUnNiKzNCcUxpWGh3SUxmcE1jdXZkcXpUamk3Y3RHRUh2b2hUMGhV?=
 =?utf-8?B?cnowV1ZtMkFhVG1hUUhNSTF1Y0lyU0VVVWlBVUx2NHFvYWFuTVVNRHY0d1FH?=
 =?utf-8?B?bmxtTTVBNWZjeGtTbEdrYmFFb20zTHU2akk2UjIwTFovUlBCbnI2S2puV2hE?=
 =?utf-8?B?QWRMMXhKR1hZMFRmWWtOMmh4eXltUFZCRlBPLzdOK08wZkZHZDEvQmgrbFRL?=
 =?utf-8?B?WFpVQlNIeGRZeGFDd3dZb0lHNUVTYjE5WFJPM3pWWm9ZSEpYMC90Z1VZNmda?=
 =?utf-8?B?TWdpNjljOStxcTd1YVgrMGpJOGp6YnQrMFQ0OUwvNzZJd3JjemhyN0tGQ1My?=
 =?utf-8?B?OXA2SzdCRFkwWXdkeUt4eXNPWWsxZUJoNW92VUJNTlNmemZqTk1YSUJoUXF0?=
 =?utf-8?Q?MOtL7B1rIeYnlNopE6kNjMibp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c5af9e-22e7-4013-fda9-08dc63b405ea
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 16:40:02.5797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeT0yKQGe8Sb6nu0eccKxttmcwOqPz0bkefjaG43eVyDVLlo3YVLFRjrM8YvtIm5yb/UDwrauXml2g+e4pn2/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185

Hello Josh,

On 4/23/2024 10:34 AM, Josh Marshall wrote:
> I have a draft document which I would like broader review on, which
> currently lives here:
> https://gitlab.com/anadon/getting-started-on-kernel-dev-guide-workspace.
> This document is to ease the setup of Kernel Development.  I intend to
> send this in as a patch to the mainline doc tree once it gets by a
> suitable number of reviewers.

It's great that you're interested in improving the documentation. I've CCed
linux-doc list for visibility.

However, please note that we already have existing documentation, and it
might be better to extend what's already there rather than creating
something entirely new. You can refer to:

https://www.kernel.org/doc/html/latest/process/development-process.html

If you still feel the need to start a new document and host it remotely, I
suggest updating:

https://www.kernel.org/doc/html/v6.1/process/kernel-docs.html

If I may offer a suggestion, focusing on documenting the challenges you've
encountered with KVM, etc., could be more valuable that trying to cover
everything.

> 
> On Fri, Apr 19, 2024 at 12:15 PM ngn <ngn@ngn.tf> wrote:
>>
>> On Thu, Apr 18, 2024 at 05:40:20PM -0400, Josh Marshall wrote:
>>> Looks like breakpoints aren't working?  https://paste.debian.net/1314501/
>>>
>>
>> This maybe caused by Kernel Address Space Randomization (KASLR), try
>> disabling it by adding nokaslr option to the boot options.

Thanks,
Carlos
