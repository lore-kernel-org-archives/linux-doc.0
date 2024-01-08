Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3486E5101D
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k6xMTfmu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM6blVo1XiOkUw/vDZTd0G1i5HRs8ONaE6yYmpeHyfM7ExvqZl3AjcSa2Jm4DQN8FEoJ2az9zLKdE2bWIjuzVipm6ADuDy8nsv2deNiTeoUNJPmKKKu6WpCaomj96TxDvy4JwIRvgqwFrd6RpDIN3DroAgbOLDr1QrdWseyJPp+9bbOprfE3WP91MetjWZ8hwgqF1qGIdnpwPuj7adiZ9Li21A87sYHSX7jA94lKw53bI0PW9+72EoUPrSP6vJP2cKYATT1pOVUtT7kon8rbZ9PN0itcpf3u1Nkvvp80FqnN7Su6VtcBID0Ifcu/NHmp3pHglbPRDMEIQEOacE2xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNcVtATSOOVifjQvwga2Qe/wcJVRjWdMUSy0PD6KLa4=;
 b=hP7dL6/LqGRhbbM+doIUGCb8PvrduKaAK9bS1dxlIKpZO/zTFIlA9Fzv09rMTA2dSWFY3xbtE/YxpeElm72mkZKXoQwWW7A4M3Yu+biFrRQIVHl9I/XMONtywwu6wiW8qGDG077FHMNhyTaGJm7LAw33wzOEvSTE2A7ooDudgNEQ202M+1OPmB+rDEO/RCqSdw7zf/nR9AHK2xMoyAF/DRrJwlC7mYcFCOvApyIK82allqcKHd0ZvLwQC5GwaCoRhnkrmakNta7aSOPNsx+ITotnxj96gqk3TKaFoHmpNzGetYb8dSj/e0l9SJ/0g5GDEbnsT/VGqbI2+oCAEZciiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNcVtATSOOVifjQvwga2Qe/wcJVRjWdMUSy0PD6KLa4=;
 b=k6xMTfmuEWUqSQy91BLfbIVm4fG82tzYvUCgBv2yhOnyqCvC2MDz9JIYnKi4BkMfKL07YnY82jfgloyoMeJYo10bAxtEH2briEw+1hzbCYh/q01cQGgnsJa73O0BWHZi0delS6uYWRAHjUWkXExYMjgGBmqY5a3WHNIZc/tIbiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by PH8PR12MB6699.namprd12.prod.outlook.com (2603:10b6:510:1ce::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 15:52:15 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::6452:1eb:50fa:311d]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::6452:1eb:50fa:311d%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 15:52:15 +0000
Message-ID: <909f529e-3cad-457e-b02d-222bc873203e@amd.com>
Date: Mon, 8 Jan 2024 09:52:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH docs] MAINTAINERS: use tabs for indent of CONFIDENTIAL
 COMPUTING THREAT MODEL
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, elena.reshetova@intel.com
References: <20240103160938.1006517-1-kuba@kernel.org>
From: Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <20240103160938.1006517-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:806:24::25) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|PH8PR12MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6e1dd6-ef98-4cd8-76d3-08dc1061c913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7/TmlXrbqnD/2EgQ/1Jc81DpbFyJSX6/Gaep2n4WN+gY8HCBJEEUClTdWwnKPXlplPopB0Nx6ousoixr2JTCkvksnji2jhfh5PvudnCayK1265y2GIGG65sf2z2H6VO8qF6ykoIIO2D4KUBWVU3ipwOzb/BFIPYrMfsPjGLSmC1OCyOxe4ErUvvPUgAI/ryAnk0k+Ijekq87PKLZUCC+cWbRkbxiu3rb5wJP212PAKZ7TO1veRgh4OGM2UioFRFsHFuE7POvwWd6IG6zuRtRGtYaXrHKxSpIJvuWYPzYKHzTlh/RTWbEj6Ha4yYp2+bkXQ6BMed+/PekMPQv0shOn6qrmO6J0pu1wnnACoOff3WSWE86qtZrOIBhbPxZPPljcX8QGu84QO3n6qDp/MZHN+S/naD2hwc4PqUVGThRXyx/ivAuGFNxy6HDDKGrXx8xRLPPtAtnYNo+a0afq3+hlnn6sr4C3GrXagZCYruoUK+KeyctvAt3GyfSt1bAwpD+KMCtP0p0m3qJqpG3rYYGwzthfMqsVdMmRKqB229uac8q8ilvqyWOlmIWHKGjw1ey6zveH7c+WkRqycKWarmTHjIcj6X3fsIYQlFhvWaWDajc244d0hktNagigqvj9Tuty19FKrucMJCml4ok9hSXUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6506007)(2616005)(966005)(6486002)(53546011)(478600001)(26005)(6512007)(66556008)(83380400001)(41300700001)(2906002)(66946007)(4326008)(316002)(8676002)(8936002)(44832011)(5660300002)(66476007)(38100700002)(86362001)(36756003)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjQrbXlrMDA4S0cyMnowT3doeXc0UFdIZW1mWFJ3YkxFQkNsK1hjNElVUVd2?=
 =?utf-8?B?ZVVsQ2FFSThEK0R1NUgvRnJEbjF1cHdtaHlBMTV5cGFVUHB4a2ZsZ0ZGdFJs?=
 =?utf-8?B?cGxLYS9vNWtVVDNIeUxrcnVBbGpnc245ZWU0RmNWOUJweXRCOGZvSzlsVzNI?=
 =?utf-8?B?c3BETCswYkkrdFBpc3FaYnlTSWt6eURxRkc2MmFWY2tuRFc0Z0tDNEZNYnVR?=
 =?utf-8?B?QjZOamM3bHp0eVVpRGc0bktLY2VWY0dkaHc2YVpOSG0ycVBWK1d2a3owZFFI?=
 =?utf-8?B?S0w0UjFQVVdSc1ZIVzF0NlZlcmtPdXFpNXlhRDV3MkpicjZjZFd5b0xzSC8x?=
 =?utf-8?B?cXVCUTJqNWw4ZUdGNTlncFVBODRNdVZPMkxRWjVRdWtianh4OHJ4a0tDM2RF?=
 =?utf-8?B?elQ3VWljWURURjNFSHF6MGVFQWt0VG10S1RvdW9yd2tUNUdGRWcxcmNhUUZI?=
 =?utf-8?B?QXlzcEp1RXhxNHNSOU1ZSVhUNjNwdXQrS2hQaGJnMzdzTzNYK1dBZG5UeWQy?=
 =?utf-8?B?ZXBVczBCTkNFbzg2a0xhN21LM0tIbjZ4UEpnSHZXYUVJYjBrUjdxRGx4RnR5?=
 =?utf-8?B?MEpLbzEzWjhSRXlCeWN4Ykd6UEVTb0JPd1pNM1RQY3JHRmlJN29xRERyaEQ5?=
 =?utf-8?B?eDFHM3hPUXdxR2diZzRnTVRXZmVqOTIvTkRjTGF6K2xNMVowcUxSRVR4NkY5?=
 =?utf-8?B?K0t0SkI2SnhPdXBSRzNnbjhmRERrZ21lNUg1N2FVSHNCQTZDM29WZXVFZU52?=
 =?utf-8?B?RzcwT1FMNUgwZXk4amtJZEFiNHdXMUhQYXIzaUU1djdKaC9GWUQ0Vm01TVlt?=
 =?utf-8?B?V2lsSUs0T0szVCtBRHBMbUVCelZJcFFwRysrUW5xVUxUdzZtTG1PWE4zeXNR?=
 =?utf-8?B?ZCt0dUNJcjI2dTVuMFFvMUpCSEprWlZPM0gxYWxYMXhmb2MzY2lLZUdTNlNs?=
 =?utf-8?B?S2xsRUhZL2tnUjZrQzFUOTgxWDNWSGFXSUpKdEp2VTB2THhiUDhRVUZoN0JG?=
 =?utf-8?B?NThJMFpQRmljM25rMS9DMmVlUjVPNTV0Z0VKcm5rVkJ2TjlJaGJUUkJjVEE3?=
 =?utf-8?B?cmdHVVIvTlp4UDFBUzAvTU9pOVVBNnA2c0NLbFFsQkFvNnM3YnpwN0E3WVVO?=
 =?utf-8?B?VUtTM1p5R1RXSWkyZlJRMVRGcmZLWVY0ZjRwaHdYdU5VN2ZldTM3V2p2aHVI?=
 =?utf-8?B?cTVkUlg3L251Ykoyb3FERlhjSGpWRnBwUVEvSHZSNzMrb3lKQUpWcWVQK09v?=
 =?utf-8?B?cU9qUGJaL1c0Q2JrZzgwSjN5VkppakZkdjBNV01zS0RTbVM1Rm5acXN1QW9W?=
 =?utf-8?B?VThtNk5XU3JlNWJQUzhGSlNEU2pFWmcvVGFmMUpQNnhGMWtCbklFTkt0M3FN?=
 =?utf-8?B?Zk9uQWJ0UnRSTHJzRUg2bkhra0R4aGxpNVlBWmsraXJnTDRBUlRTbGRZem85?=
 =?utf-8?B?THM4MWdUQXp4UkEzRGJEOXYySzNodHJEY1I3UCtyYW1lWlBMQm85Mnh4S0Jr?=
 =?utf-8?B?MFR6eXcwMjJ2Q29JVXB4eEJVUlNuaWRjWThoQzJiMTdETXQ3bnhMeWxsUDZy?=
 =?utf-8?B?Y1BuTzlHNHVjbEMrTWlCYXZyZ2ZkT1ZqMjVQbXJ1NUcyNE11bG9IN203c0h4?=
 =?utf-8?B?V01RQ2pKb3E3S0RLVml2Q3lGK1ZKMkhLTDVTUUxHcXMwMStmd2tNd1NTM1F4?=
 =?utf-8?B?SG85Q21jTGNFVDQvNGZ5YklWcmx1QkdmbnFLbzlOc2g2RTZFVFc5Ynd0TUcv?=
 =?utf-8?B?b2tiTUFpaVh6WHhDLzU1eWZiQjJxZjJIRTF3Ykx2aVcvb2NYbjJYWThhSzRm?=
 =?utf-8?B?QTNQbnBVNzRRK3ptQUZJT0tOTC9iQXRNTitFVUFJZnFXVDQwK3FVU01rQkxh?=
 =?utf-8?B?cngxS0tHZXFHTjE5Z0E1ZWpIbThCbGVQaU0yejQyRmNsVmF3MEhUamlicURW?=
 =?utf-8?B?bEEzLzREVWIrZzFtaFZxeFBkVURFYjRQUmZaSWtuYlBiTlluTTdjVTN2U1JT?=
 =?utf-8?B?VnZmdGF6RGhaTEJXQzRHQXV3ZSt2eXlxMnFyV2g4bnNGZDdFd1QyL1ZGdE1x?=
 =?utf-8?B?bGlxNkRCU0tpMENaY09PUU1IRGZWRE1oT3Z0RUptTnM3TXppUkFkZ1BYUUk5?=
 =?utf-8?Q?5br3ARvrSj0pjhEhobXnC+6jR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6e1dd6-ef98-4cd8-76d3-08dc1061c913
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 15:52:15.2413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j24zk6vsnYuM48sV1FwPRqpqP6q9kJm6z+VY0Nz2OGwaVSwxUvtrBOxUn4SJEFoSLPBm+p+pZ0YCgBSn2+42Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6699

Thanks for catching this.
Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>

On 1/3/24 10:09, Jakub Kicinski wrote:
> There are two MAINTAINERS entries which snuck in during the previous
> merge window which use spaces instead of tabs for indent. The rest
> of the file uses tabs. Fix CONFIDENTIAL COMPUTING THREAT MODEL FOR
> X86 VIRTUALIZATION (SNP/TDX).
> 
> Given the prevalence of using tabs some scripts (AKA my scripts)
> assume tabs when parsing.
> 
> The faulty entry was added in commit 1f597b1a6ec2 ("docs: security:
> Confidential computing intro and threat model for x86 virtualization")
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>   MAINTAINERS | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a9876df20f8..1ce437992a4d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5313,10 +5313,10 @@ W:	http://accessrunner.sourceforge.net/
>   F:	drivers/usb/atm/cxacru.c
>   
>   CONFIDENTIAL COMPUTING THREAT MODEL FOR X86 VIRTUALIZATION (SNP/TDX)
> -M:    Elena Reshetova <elena.reshetova@intel.com>
> -M:    Carlos Bilbao <carlos.bilbao@amd.com>
> -S:    Maintained
> -F:    Documentation/security/snp-tdx-threat-model.rst
> +M:	Elena Reshetova <elena.reshetova@intel.com>
> +M:	Carlos Bilbao <carlos.bilbao@amd.com>
> +S:	Maintained
> +F:	Documentation/security/snp-tdx-threat-model.rst
>   
>   CONFIGFS
>   M:	Joel Becker <jlbec@evilplan.org>
