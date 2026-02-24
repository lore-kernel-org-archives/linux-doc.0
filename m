Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023139.outbound.protection.outlook.com [52.101.127.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3D6287257;
	Tue, 24 Feb 2026 03:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771902738; cv=fail; b=LoWo85q2YBc0MYxbzYI/yQ2a2qahw7kGrOhw/NsU99oc/adNQO5YBX2JRgExnfgDkmdbrYWL2F+RioAIgSyAOv+T52t6sLPnsW0XaYBb359xMCULGH1ghZwGlLYbIUOdw4HA5B5zQRFMLelzcPQKDxE3nqpmbkG/12oegeVhvkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771902738; c=relaxed/simple;
	bh=UmgpbsCLo5zSFez9UtO3zLhilD2x0ojBuIRSqSh+bvg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SFxAFeB2L40cdPB7+5GYD2XVIPkueGJmoCN8o55o3XkhX3aNF45sJnb8cgdryRXjV2oVJWhS/J4H7xKxT7PYHDfPSvVt/AggGK96pG0sgCdCDWrSSthYsWG2Pj4EcN3QrG7ut65kq4A9aXAtqr0Y3O7opRvjcwerORhHOrDxUJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furdevs.cn; spf=pass smtp.mailfrom=furdevs.cn; dkim=pass (2048-bit key) header.d=furdevs.cn header.i=@furdevs.cn header.b=Ln0ONVyx; arc=fail smtp.client-ip=52.101.127.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furdevs.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=furdevs.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=furdevs.cn header.i=@furdevs.cn header.b="Ln0ONVyx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3SagOfAm8Aa9pwzab9PF42f5X1Zx561sGohgdLepV87EB9cIy8/f/q969UClvviW2YVOgG3o/IM7lO4gbFyA7rJ47NEPd4HLba03kuH62v2EwC0Np+yqlCW/sODbYIIL+IjnZZLkuVRfz0JAdrLbP/IDMlfMrwsbTEMa8V7JLBlAWFauwbm4DT3Fvdi/nU/VQiDwoYaoAO9x0JPqzyNEtvQBI8llWARLQ/K8LSYSP5ckrFIMj1MdVKgxcG6ClgqMfK+EHroGZ14SQbZdvt68E25a19wwWGaHubBXyTzy8ztcrGVaqM2phUv/uD8R7zMUvFJCzjAZR456HnfCmkhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4ozYU2ecx4IrXMdXZgCULMCDSZhMkRuDL2P32PW/ew=;
 b=uxUI2vhaBhq4sJlgmPbnz6WUiaIaBsiLzBtkIsj3XsyjB/y9LerSjwW4PNU7Qbw4fh4oiGQ0ilsL6/MQTCPksG6Woe/HzkH7aHt60zO2UoB+CII3FOCWRc13xiR/xethcdOa/qxmP+ER2kBceN6adf+Y9Ib6Xk2AYmP5AuD73vdGwzaAhYzIm0/4+ByLf+dcE0AtAmCKsYL7jECTulAiqmBNwFp+TjxAGd429Gst4SDP5ZhN7LP2/5AlYL2sHnmLMMM2lzkkLVinruPH4MAJ8PnPb3uLZDD3P60ZwuXOze0wabuwyHJT7C1sPov+7hyTNGu7qlH2s1Rrt1BA/ftEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=furdevs.cn; dmarc=pass action=none header.from=furdevs.cn;
 dkim=pass header.d=furdevs.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=furdevs.cn;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4ozYU2ecx4IrXMdXZgCULMCDSZhMkRuDL2P32PW/ew=;
 b=Ln0ONVyxgtDGOxy3AV92QKWf/g96vEJf6RRu2sl2clGKVfLHPnexOrsCMmpPzzJDxdygbDRqjC85dL9OFy6dgtmkXR5oVGOD8keYSUem9lXK0EvQpGWTZ0Vczq5Hsf58uOf8njv5yA0pyfED1GbbaGh+cn98oLYXNzc368UNJnSO2Fw/zc7gHkWGWJp+a+cZgpL9uoKHLE7QO5uTOyPXoQj0zyaM8os5DozzO9ar2PRUT/KedkZnzLjC1NMeRDtsKAnYhSS2G05vXoUmHuVf7DM0tjZDiO++6BkHbFwwk5srgOs7E9JVXmQu0shvdwWM7r/1nSpgUWCjbBXJQS2ZpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=furdevs.cn;
Received: from TYSPR04MB7125.apcprd04.prod.outlook.com (2603:1096:400:477::12)
 by JH0PR04MB7841.apcprd04.prod.outlook.com (2603:1096:990:95::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 03:12:13 +0000
Received: from TYSPR04MB7125.apcprd04.prod.outlook.com
 ([fe80::a2b:ba98:33bb:56fc]) by TYSPR04MB7125.apcprd04.prod.outlook.com
 ([fe80::a2b:ba98:33bb:56fc%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 03:12:12 +0000
Message-ID: <8c56352c-3c24-4a7e-8711-cec317a9da02@furdevs.cn>
Date: Tue, 24 Feb 2026 11:11:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs/zh_TW: update personal information
From: Haowen Hu <srcres258@furdevs.cn>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260220160201.41149-1-srcres258@furdevs.cn>
 <87a4wz3z89.fsf@trenco.lwn.net>
 <7fee40fd-e9dd-4b45-88b0-67b6c3e228cd@furdevs.cn>
Content-Language: en-US
In-Reply-To: <7fee40fd-e9dd-4b45-88b0-67b6c3e228cd@furdevs.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0023.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::7)
 To TYSPR04MB7125.apcprd04.prod.outlook.com (2603:1096:400:477::12)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR04MB7125:EE_|JH0PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 222c1967-67cd-40bf-6f3a-08de73528150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|786006|41320700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2FFNUlTaEk5SmFrOGIyTnJmY2JQbWpMRU1PdkdocFRFTG82a1RGYzVybjAx?=
 =?utf-8?B?L0E1eHlRTXNrOUhLYk41S3l2L3RRdFAyQ1UwUHpueTlPMjMyd242TVZYckFS?=
 =?utf-8?B?anlhb0c2d2pLZ0pBZmFiZUJjclZJNTR0VnMvdW51OWpZMWFUbzdBOHlvKzh1?=
 =?utf-8?B?dUUySmxIS0ZXWWlaZ3ZRUHNmRFE1UCtWeWpTYUttZ2xkSmJ1OE83Nk9hTURD?=
 =?utf-8?B?b25Td3RsOFhXZkgrTGpBbnNsZUh4UFBzWld5dXZpYzNhR055R3Iya2J2VHBq?=
 =?utf-8?B?YmlFVXFaTFcvR0xWL1dRdGZSc2EwZFZOdWFTc2RxVWtaS2Y4b3orYlFweUh3?=
 =?utf-8?B?NURvLzdGM0NseVhJQTdaVlIremZUcWQzU0VETjRQMHN6aWZySTFuY2dlbjZM?=
 =?utf-8?B?U3cxOGlpbmhWNlUxOVYvRWZ0dGNUTDJmRm43dWlGS3hreW4zRHYrQ1pHd3c3?=
 =?utf-8?B?enUydDZJLzlvSm93MXdtNUp1RkYrb0VXeW95Qmo4MXB5UWtyYzFyUnlURSs1?=
 =?utf-8?B?eFhmNHcySDRla21jUVQxTW5pTHBCM0pobDloRmE1Kzl0dmxlL0pYNjdON0ts?=
 =?utf-8?B?RW1zaVdpcVpQekdQWWtCSlN1MVNiK2I4MDcvM1daZ05zRUQyNWpIcHdFV25i?=
 =?utf-8?B?RlN5SUZoOU1aWE0rb2hLL2FMTjBzdC9jQ2E2UUUwLzVyYnloUjVFd2R3NVRZ?=
 =?utf-8?B?Ty9xY3Zzak1TTFJwcWlLYUhlM3hpTGdtaW55N3Z1RnFsN3R0eHBzS29jc1do?=
 =?utf-8?B?ZVIwRXdNVUplaVZycHFINmUwTStZMU51cUkyTTlvM1dmVFRCOFdjQnk4THFv?=
 =?utf-8?B?dVMrbTFlRDhYejlwSXlVRHIvWCtoVis1akhDTFVJSkZNSTVNQkZCTmwxSTJ5?=
 =?utf-8?B?NlZQSVBrQi9vNXBsMFlqeTRyTllDL2R2QmQvZkJWbi9wN2pYTkZNbUNCMW5I?=
 =?utf-8?B?VEJkU0xlbnFJblFEQ2h1WjdibUxhbVBXZVRKeUVKbWNvRFo1MlVkUW1CWXdp?=
 =?utf-8?B?UEJlTkV3YmdCZGxzdFFuRjAzVjh0UmNwMWFrZkZSdXhMZHAxVmhjcUZGNmlu?=
 =?utf-8?B?MUlyTHhwTW4zSDlYZGVXWTcxMkxnSTVQMjJLMFBTK05mRFRJSXU2YXV5TzZn?=
 =?utf-8?B?TUYwTVNOaVo4MG4vakhwcml0SEo4K3kyTUl2Vjd4QWR5Z3RBTHNMWW1RVFVQ?=
 =?utf-8?B?K3dPMEo0S2NSdWUwUHRXL0tNNWQwWlRUU0ExakZXS1lWS1gvQ3p1NzRnRElQ?=
 =?utf-8?B?UWZDNmZ4WE1Fb2RoZjlBbXE1eER6N3JjbEpwSHdRVllXZGhLc21Tcm1BNU5w?=
 =?utf-8?B?Z3dsZ0NlNWhVVzZsSkhVV0Rxd292TnJxeUNrOE1kTEhsV28xbkFGRFdwWVRX?=
 =?utf-8?B?dytBNSszcGZ3VGh0cXVnV1FwVzVnbzVvZ2dpTWRJdlJIN2xzWmtJR1k2L1BJ?=
 =?utf-8?B?QXI3cWMxVllLYTh6RTQ5Sy8vWWQ3NUkzODNBMUZoeTZOUlBwU2FFU2RHQ2hZ?=
 =?utf-8?B?SUh1UVljVEZIajVWWHhOUWNhODhjUXF0OFpoNWg0R0VjM25IaFBNVERjVG1k?=
 =?utf-8?B?UEtqbyswblpHY0N5Vmc3NkFQNnhrSnlET2ZySUFscHFHQllEa2I3bHA1YlND?=
 =?utf-8?B?dHUyM0V6VXZLUnFxZURtNTZPT29EYklYMFg5cFBVV2dhZmNwOVJEdUdjMEw1?=
 =?utf-8?B?TFNPWHh5TmVPQ2Mwd3hmWHc5UlFaMFd6bHdWWVRuWXZaNU41V0gzYzN6aFE3?=
 =?utf-8?B?M0NMdlBzdDNrNmhMSXRIS3BSQnBQc053OWkyVEI1bWtYeUVydngrNGVjL0dG?=
 =?utf-8?B?b2ZxWkdWcVdvcVBIaVBhUzhrSERyMG1nbis3TS9jTzMwVENkQ3h1ekR6R2x5?=
 =?utf-8?B?dkdTclYwMmVLSEp4cEdzMHVMdVZPUDByU2F1emhYdzFUTmFzT3hXUCtVUTEv?=
 =?utf-8?B?ampKL2JhOGN2bFlRRHptcGMrZkppTEZDU1NQT0NkV2xKYkRVOEo0YThjUGdn?=
 =?utf-8?B?a0ZPcG9PcWVjRDI2S3Z3OXppSjFYcEZNWlN3WGxjbmxYelcwcGdOeWhUb1o5?=
 =?utf-8?B?eXRwQlZVODZOZ2FWNEc2Y2VHY04ra1ZCQlozNXp2UG13ZTJxR1ZoWWI2VFNz?=
 =?utf-8?Q?SooI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR04MB7125.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(786006)(41320700013)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDhxVi9zeDQ4S2lxN0ZYc2pvY2pvYzM5L21vV2gvaHI3OEhrallPZ1pFbVRq?=
 =?utf-8?B?NER2QTlDYysrTllidXJ5dGNTUnFVcWFoRDk1U1o3UE9jcUs2dmlVaXpvc1dO?=
 =?utf-8?B?c1JZNHcrL24zRWNQME5yTjBNR1NYalNIdzJNRlAzOFp3SDlNN0gvNXFnU3pm?=
 =?utf-8?B?NHRTbkcxOHdTWWFSTkkvSzV0bStNL0pwK1ZxYjJ5WW1ENVhkNnBQY1lFdno4?=
 =?utf-8?B?STdkbjE2TmlVK2hub1M3QlNvRUZxUTBRdExaMkN4RFVUaHFuNVowc1VsbCtl?=
 =?utf-8?B?ZDFJdndIOXk4Q1hQZ3F1UDk4UjVsN1FYNUdPY0xpbjJ0bjNSdlU2cDNvRzhN?=
 =?utf-8?B?VGdwUFhrU2xEb091b1k3ajVMM0U5Q2k5S21CODd6T1Q3L0pxYnNQcmt4UGlO?=
 =?utf-8?B?dkRGa0wyQmNFNm5COFA2WHlvam9SdkNIcTV2b09wUXZTQjV4K3NZbzE2Wlpn?=
 =?utf-8?B?dCtYTmQwMlFwTkF6Szc5QmtJdGZ5M25QYWdqQWJmT1hORTdiYmlJTGNZeEhH?=
 =?utf-8?B?WUJCdThEdERPckNNNStNZis0QlU4R2sxRkJFZTlYeXk3VVBpdHNtUHpCeXVr?=
 =?utf-8?B?aysyYkswaXNGU250NXh1TmNhdFdHejBzQnEwOVR0MlordmRaV09RRXlHMUd6?=
 =?utf-8?B?ckNXRkpVajdLS1hmdjhHVWlGWmdFeVBUWlJHUi90cU42a2c5Z3BpdjdGZTh6?=
 =?utf-8?B?UmdJazA3bUFrMk9ubmFKemFPeGlsbmVXZW1acEFuc0VpRzhzWVFvOWwrL1lp?=
 =?utf-8?B?N2xPTGtOMmd5TktwT3pqNkV1ekc4UVFUeHRxUUEvaVVqTFBKWmFyb0lPb0du?=
 =?utf-8?B?VHZqUEpxa2IwSy9SeGxydzIzNFdzVUg5UmxmV2VRWUVJVzk2MmhQVWgrUnRk?=
 =?utf-8?B?TkRlYStMVnUybTc0REJkVGs1cjNiUFRKdFFGQlBnWGRCY2xXeXY1T1VOSUxS?=
 =?utf-8?B?SFpBQVg3L09Zd2ZVU3ptNjNzT3gwdVFoV0twTVNjVjB6NkhWL3VqWUVjNDRi?=
 =?utf-8?B?UHpGRUVLZEtpc2RMY0g1YmRBeXdWNEdrUFdvWlljZXczUkcrWnA5cHo1UkIz?=
 =?utf-8?B?c2F6ZU5ucE0vZkJyMHZFTjdFZGxYZHJvV0RISmhuUnB3RkFmWmU0RHQ4VTVy?=
 =?utf-8?B?WTIvTWxWbi8rUUpvSi9TdHVGYVFvdGJ4Ui9uazQ4amRVZ1ZrK3lWNUNXbExG?=
 =?utf-8?B?Q3JNeWZlRjRETkdHNVJEV1FITXVNQkRZZzJLem9wR045R0ZhbmdjWU13NGFk?=
 =?utf-8?B?d2NTaHhrMWg0MXVPd2hMVlFMOVQvemJocStQcE14cW9ZcEZod3BLbHkzbEVQ?=
 =?utf-8?B?MmVCNjBJbTVmWVF6TTVjak8vR1BDUVp0Y3B4bDczYitZdmxEenFocVhocDY3?=
 =?utf-8?B?QTg1WTNoUERkZnk3K2tMdVVHTG14N0t6aVpSZW5KcG9JQlpwdEtrK2NON1Qx?=
 =?utf-8?B?R1AzeFVBOUpnREptdlF5Wk8rQ0s2RVNOR2tONVhXbGpqN05XRHE0cmhxNDd5?=
 =?utf-8?B?QkkvK0ZTMzlKd0YwSzhXcnFkSWhrNkZFMWYyYlp0cEdkTmVsRDV5WSswUWJj?=
 =?utf-8?B?ZDluVXUvTEYrcnVCMWc2N1ZGaXRZWDJydVBlem41MmdiSkRuaXRsbVp1Y1VB?=
 =?utf-8?B?ZkpBY09UMDFadnBYaXZCQVIxNjlMTU85czUwZ1hsYkdlbGFuL0JlY0hncStn?=
 =?utf-8?B?K3o5aHBVMHp4cEptZnhrczhseDB4Q1N0QVF0bXZxMkpXWVducG0wNDF3Mkps?=
 =?utf-8?B?SzBKMGtncHA4TVhaWnR0L0NicjlSOHE3cWVPSk1SNmtMcE95Sjk4MnBrNkFz?=
 =?utf-8?B?M252c1lPaGhLVTMzb0FYYnMyNSttTjlSMWlDREZxRVpOUXpkRi9hdlU3L00x?=
 =?utf-8?B?dHRwWkU3RXViUHhWVFh0TEZFak9Xdk9TdURXLzhnMnBUd1hkbE5FTVFNcjhS?=
 =?utf-8?B?ZTN3eENNVVgwOFd6M2EyK3l3TmsrcjhRa0NyWFBDVGFnM25FMnN6anRncXNM?=
 =?utf-8?B?ZHpsWi9YeEVQWU8reTZnT3VsTU9YTlhvVUZUd2RHVG1jZkd4WVRaSXdiVnda?=
 =?utf-8?B?cEpPVENCWXVHU3F3WGkrdU9lNE93clZtRU9aUG9ObFVONU11azNMclpqdFZB?=
 =?utf-8?B?SHFYbmJVSlRuRFVnRGNzZUQzQ2N1eklmcGR1OUpYcFkrZzljOUtSZFNLKytn?=
 =?utf-8?B?Qzh2YUhqNkM3dGUxNmJvVU9PZ0s4Q2dlaDV2ZlFUMjRqOExlUmtGcnI1ek5q?=
 =?utf-8?B?Yno4MUhsNjk1TWJtZTFEL2xIUitBcXdFTngyOVQrRG4xUzUzTXRnK0pXMWtP?=
 =?utf-8?B?Ui9aZHgwVmFTMndRNUlnOGRmbDZLTm1iMnJlMm9VZjRpSlRrM1N1QT09?=
X-OriginatorOrg: furdevs.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 222c1967-67cd-40bf-6f3a-08de73528150
X-MS-Exchange-CrossTenant-AuthSource: TYSPR04MB7125.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 03:12:12.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c15d1683-7bd7-4720-8850-c10d9a967b56
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xfpD2PMhxgNyC6MQcV0vMUcRgUzfOvu8InoSPFX+j6l9RN6Op490G84mI8i/xZSJPr33upzmJQW+0kqXNLwxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7841



On 2/24/26 11:05, Haowen Hu wrote:
> 
> 
> On 2/24/26 05:51, Jonathan Corbet wrote:
>> Haowen Hu <srcres258@furdevs.cn> writes:
>>
>>> Get my personal information updated in the Linux kernel Documentation.
>>> Mainly on:
>>>
>>>    * The legacy e-mail (2023002089@link.tyut.edu.cn) had some issue and
>>>      is not accessible now. Replace it with my current e-mail
>>>      (srcres258@furdevs.cn).
>>
>> So ...
>>
>>> diff --git a/Documentation/translations/zh_TW/IRQ.txt b/ 
>>> Documentation/translations/zh_TW/IRQ.txt
>>> index 8115a7618307..9b27b1f19355 100644
>>> --- a/Documentation/translations/zh_TW/IRQ.txt
>>> +++ b/Documentation/translations/zh_TW/IRQ.txt
>>> @@ -7,7 +7,7 @@ help.  Contact the Chinese maintainer if this 
>>> translation is outdated
>>>   or if there is a problem with the translation.
>>>
>>>   Maintainer: Eric W. Biederman <ebiederman@xmission.com>
>>> -Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
>>> +Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>
>>
>> Despite this claim, you have not touched this translation since 2023.
> 
> Guilty for my absence of contributions. For my being busy with daily
> routines, I had little time working on the kernel documentation stuff.
> 
>> And two of the handful of changes you made that year were ... changing
>> your email address in all of those files.
> 
> Sure. Just want to keep things synced as exactly as possible, and so
> does the patch mean to be.
> 
>>
>> I don't think that all this churn this is reasonable, especially for a
>> translation that appears to have been abandoned.  So I don't really want
>> to apply this.  I would suggest you send me an alternative *removing*
>> that information from those files, optionally leaving a credit for past
>> work done in Documentation/translations/zh_TW/index.rst.  The question
>> of when this translation becomes too old and should just be removed can
>> be left for another day.
> 
> OK, so do you mean this translation (zh_TW) is planned to be removed
> from the entire documentation? I'm working on the update job currently
> for the translation to become modern, and you can have a review of my
> rework when this is done and the patch is sent. I really want these
> texts to be kept in the kernel documentation and they are able to
> receive a thorough update to be suitable toward the kernel nowadays.
> 
>>
>> Thanks,
>>
>> jon
> 

