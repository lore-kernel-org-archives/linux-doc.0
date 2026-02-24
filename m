Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022108.outbound.protection.outlook.com [52.101.126.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61826738D;
	Tue, 24 Feb 2026 03:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771902242; cv=fail; b=PYqDFnDuoV1mCpK6f/71lWWlSpdgym/lHa4zptIN7Yk4phdjPkic5JINe39gHfol7xitExJCfy+UECNAy3oxM/lVA/cZ30Zs5eY1P+/+TMs5uOWYqvptCgXjU0kRDUiFtANN74o61A6VsXJo1jqSrxgvNY5ROMLSPehKHmhO5fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771902242; c=relaxed/simple;
	bh=hIQZa7cT0ngxdL2DyTty+L2K9xXe5TeGTzMqguKs+G0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JziwyBYwNFXJVUEObtexHblo5guTTT7OTvjsQ2OSxEy6k/P+9R2dGwd/RtdKhHHnYrzoSiPJLcQ6p2k2yUd6QP1Ndmjfc/+m7Jqezu0tnmHHLs7v2jWZhP5rp4uLqG1O2sdpKQ+7jxk+sRh8qjeAe+cg1neS7CgR89xDHnqNNpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furdevs.cn; spf=pass smtp.mailfrom=furdevs.cn; dkim=pass (2048-bit key) header.d=furdevs.cn header.i=@furdevs.cn header.b=iHs90uGz; arc=fail smtp.client-ip=52.101.126.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furdevs.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=furdevs.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=furdevs.cn header.i=@furdevs.cn header.b="iHs90uGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubNLVF47IHT1wVpGThqtqq+FjlSBlVIV//3nWZwXdwgkNHLIcCJbzhN0LOJPY2jgWHvRTXelVgmc7DWTMl6y1+50REEJ0vsTGAMnvtBzYVwSJea5FTmn1ctD/OC3pXtEUpHrMlWsuLm9537m1nP4ZWO81au2DLUEEkrJ10ZlwRQQ8Yx/y/Rd5IJNaI5rskywoXZSZFVWBWeNDqQiEvdHw2vIBOlRfsvijGiHMyIwzuhoBMZjL48EdnJ5nnhJpeOAJFgdnMshJc547v+ApbgXd8C6BsvZ0upJaeSGFHslEpon1jznmrNuLMwFYLAwYiXAT30bY/Y3OlWbfz+pzEI/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWxCptQAirXsm/eFPUkt1DSCq6yMkaIhb9HBpzbQrzs=;
 b=tBylH9gjkz9m/fd41IfFzCQEv4KZa2q3nhUgQ4Yv64Vji3YAtAxzCcJTT8BLaf0WzI+Qe2ndQj8YJZmroiw7xoD3XOdTamD9i35tlQGiPteZfTxD5/t7hjb7x9jndhOdSLtHl/90wwnRnkVo/NBQFv7OenBTi4/Vn2C3dw17v24l2pR4eAGkkX91VnN3jSgTpRQFmhYpQYWmVdiFRETepqYGHNqc5zlWzbWer+EhUg5ZOrAlnDAF6xVuTitwSrLqwiEqDRFUzQvzP9nbGAM1waWNtrLWL1KaqTRrVzD24wGv7HrKCUKtiQoclPplaG1EpC2JGUeQCUhibSvJbJvHBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=furdevs.cn; dmarc=pass action=none header.from=furdevs.cn;
 dkim=pass header.d=furdevs.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=furdevs.cn;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWxCptQAirXsm/eFPUkt1DSCq6yMkaIhb9HBpzbQrzs=;
 b=iHs90uGzV5oK2z6F53g7S60TqB4pFSeiD0Ud39a8FJXtfc+LMGTXCvibVclWEKy8x1x5JTxJ3x4Arz4MK34rXM6Ca8Jzn0qO3HDE207RY9C6A5e34xKFZeFPBji6DkXigwV3UbaAEuDSX2JT1KkpyAqpzImGb1CEqKoKQyZFslu4GhVZ2svYL1yNSob+RnjcIGtbnWSoeWXOoUx2Kw5eH1ffR/VcQENTfBAovtBL8iZ/OPwPHeAfFBJSQJwWHMF65hMLO65Up1N0pMcBNCFDILT25Eo9x+2dzFlKN8TJZr4JuzcvHRrvDnWf7cz8ORoCeQ1HJOBN0ryUEEtaXECoWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=furdevs.cn;
Received: from TYSPR04MB7125.apcprd04.prod.outlook.com (2603:1096:400:477::12)
 by SEYPR04MB7329.apcprd04.prod.outlook.com (2603:1096:101:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 03:03:56 +0000
Received: from TYSPR04MB7125.apcprd04.prod.outlook.com
 ([fe80::a2b:ba98:33bb:56fc]) by TYSPR04MB7125.apcprd04.prod.outlook.com
 ([fe80::a2b:ba98:33bb:56fc%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 03:03:56 +0000
Message-ID: <201bfa5f-2826-4a31-a4e6-a4cbe4dc884e@furdevs.cn>
Date: Tue, 24 Feb 2026 11:03:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs/zh_TW: update personal information
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260220160201.41149-1-srcres258@furdevs.cn>
 <87a4wz3z89.fsf@trenco.lwn.net>
Content-Language: en-US
From: Haowen Hu <srcres258@furdevs.cn>
In-Reply-To: <87a4wz3z89.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To TYSPR04MB7125.apcprd04.prod.outlook.com
 (2603:1096:400:477::12)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR04MB7125:EE_|SEYPR04MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d50dde-d10c-422a-7054-08de7351596c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|1800799024|376014|366016|41320700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEY2ZjRjdGFNbHhxZzY0TmE1ZkY5T1lpSDB0UUFzUlIrblhTZEFnUkNRS0x2?=
 =?utf-8?B?Wlg5WkhyTE5QeU5mR09YWU0vVWZ2V0FuZU8wdkVnM1U4czJ1dThTTFd0VW4x?=
 =?utf-8?B?MHhFa3lPakhKYVJpU1FTRSt0NFhHR1JWeklTNWg2RUJqWTZHQWI5TitoUHJl?=
 =?utf-8?B?RkhQaXFWZjh0MmhxbzgwaHBaOGlRN2ltQUdzSDlCek1LdXkzc1lQeVE4WXFH?=
 =?utf-8?B?dkdxa2VJR09BUjVSMHUvK3NaUCtYWVZIUW5ObTRWNXFrUUM3K2RvVk0wQ0lX?=
 =?utf-8?B?Q2ROaFMyZWRSV0xIdVBObEtWcHI2a3JVS1ZSSGttWVZTTGx2VzdHM2tmdWNR?=
 =?utf-8?B?Z1FSYndiaU53OU9pVk9rci9BdjNQSVFjWUdnKzhWcmlBQ2NpVFVJalA2T3Zl?=
 =?utf-8?B?eGIwb0paQ2xEbEpnbVVBdUdYRkliOEJvbXBTWUdaQU05VUxyODBpVlNGbHR0?=
 =?utf-8?B?bWdPZ1pqNE45c2tIaFFPcFdlY2lNcmNLOWZqVzltTHA5V3BPNTdURXBqWnFx?=
 =?utf-8?B?RFJrWFh3blgrblNZcXpvbndWSFprVVh6bHI4Z2svMnRSZkt0bWppRVIvZkpG?=
 =?utf-8?B?enhQa0J4TElVS1E5SzZETlNNekNiRDZGT2FiNFBwNm1JRHAwakJ0V0d1ZElR?=
 =?utf-8?B?ODJyRG1iMS9lTU1KOWVCU2NlbmVtNmlRL3d3ZTYwYnVUV0t4SzlCRDd4Y1g0?=
 =?utf-8?B?bHo5cEpjVjdQSzIvMEdST1JBTkowVS94YUNqNHJ2Sk5nNU1Ra25MZGJXWnNo?=
 =?utf-8?B?R1E3WkNXa05ZUnpWWGFEb2V3U1hmYmIyQUdTeEhwSFd1a0Y3amtHejVib3RC?=
 =?utf-8?B?TERoaDg0Y0lZYm5kWW9Fakh3V3M0bjlzOW9ZbHhuWHNtT051RjE3ZHdOQ1Na?=
 =?utf-8?B?dEZjU01Hd2wyMThONG9ZdFdZL1IrYzNreUFsVThXR2xaRWsydVJWYm9XR0ZI?=
 =?utf-8?B?U2ZENjlwSmZHKzk5OXRObmZPblcxVStGSjNEQk0zSW8yczNrRldCY01XUVZP?=
 =?utf-8?B?TVJnSGlhdklaYkphY3dRUi9EMVFGUzFwVFBOUmJHQVlFakNkOEZTTHYxb3gr?=
 =?utf-8?B?RjlDWitGeGtoV1J5TU52RTZiNllZNVdSQU1wbHd6MmFvenJoczNaeDkzc1Fs?=
 =?utf-8?B?K2V2aDJWL0FSeEdzUnBhTW96WFVNc0owUkhCWkUzWkdocStkTHhXTU5ScklR?=
 =?utf-8?B?RW1BTDFIMkpCc2paNGgzSG82NWk2ZHd0OGNkZ24zNnc4WUlIVDhoa0w5TXZ4?=
 =?utf-8?B?VGUwVmh1cnpqS0thc1Z4SzlsODVqN1J1VlJLZ2tqUENmTDJjc0ZacmEwSnIz?=
 =?utf-8?B?YnNvOW14Sjk5dHRWd0R1VXNxdlpKc1V2SHVQSmhmRmpNc3I3Q3ZhWFk1MzV1?=
 =?utf-8?B?clFleG0zUGRRclZNUUJhbGU3KzUzZkNMb3o0T2tidklYMExjbmRxL3FwbkZ4?=
 =?utf-8?B?Z3FSODRhNWtudU5ZdFdLNjg5MS9DaEtqZDZMUWJ5Z2dtbjEzSmxXMUR0MG50?=
 =?utf-8?B?L282bVZLQURNemdIWHl2cDRiYnI3SkhzRHpKUHpVNUJ2WkV0aE1SWS95SlVX?=
 =?utf-8?B?RjJoME1TMDVIdE1SNGZ6MzlCMWZNVlU3VFpIL3Z0YWJ4VDJvZHRlVGF6NldN?=
 =?utf-8?B?ZmhoZnJPWDUxdG9xcWNFdDVxMU5uRGl5TlE5ZWR0TFdkQVEzNEJYY3RJSEgy?=
 =?utf-8?B?cXdtRUVNVk5uVWEvWGVWMnR4OUZzOG43M2laVjZjQmNFZjZUVXFmcGk4Nkli?=
 =?utf-8?B?M29vYzIxZEQybk01ZEpFUjhJZStxcVpxdW83VFpsUWFFcjJrakJGZzFlTk9v?=
 =?utf-8?B?eE1lRXU4cHJGMUw4bzRWYWF0bzhJZXQ1bFUwYXlQSE5XaXYyZkZWWWVBakJp?=
 =?utf-8?B?NkhQbXRvWHdSTTViZXQ2WnFldjQxRFFXa0Mzb1JncmNsV2hjcmJUZjdYZ3Zy?=
 =?utf-8?B?Vzhxdk1UamJ0dWhzUlZIRmpmQi9VbTFuZlpoTmNJR1BmeWsvSjUxSzVUeXBk?=
 =?utf-8?B?Wjc4N2VPSis0d29CVFVaN1E4VEI4UUJQTjVuZ0tNa3ZnOHl1cE0yU01paWVD?=
 =?utf-8?B?MDBDc3ErcUZPbTRYN0hxRGVsT1AxcTJsUFdHekxjS1BtdGFCZmhpT3F5TFNX?=
 =?utf-8?Q?2ne4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR04MB7125.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(786006)(1800799024)(376014)(366016)(41320700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHhNVDJSWml0Y0t5Q1JPUEcvYUtoeHI4OS9oc2lTNWV3ckh6WTNkRCtETXJS?=
 =?utf-8?B?b0MzRndUTjA3akdLTjV4dFpJTGVRT3BCK3FneTF2ekQzUEhUbTJoWEpwOWZ1?=
 =?utf-8?B?SkJRU3J5M1F6S1VycFo4SVNSRGVHc1J0TkxDWkRCVW4yYWxwayszbW9xd01r?=
 =?utf-8?B?all1Z0ZTTGpQT1pSRUZhVDAvckdBdnRwV3l0dkZUd1ovZ0lRek1NR2Q5WFFr?=
 =?utf-8?B?SlF6V1pxRm5ZMUQ0eWlmMndUSTFEQjU0UzA4M0QvVGI3T2tUblJ2ZlJyZzZt?=
 =?utf-8?B?THVuWUdnNFlsZW90QU04eVAyeDQ0UFVFNWQvajRlSUYwTVNNZDNMVUthdmNE?=
 =?utf-8?B?YjlDeno1Uk0wNEJubFRxTXlGR0tvelMyYVJUUnBqS3cxMjVkN1BkaFlBODlK?=
 =?utf-8?B?eklhUWFsWTM4d0NkcnQwdUJSWWFyZ1BWRExNYmhWdEczV1Uxb3pSTUlLQXZK?=
 =?utf-8?B?MVhPTzQvd09nYWtTc2xQZ0h5Qlk0Q1dkc1RoL2JGY2FCdU5uZ3JtN1FlL2VO?=
 =?utf-8?B?dzlxTkVadStsUzV2TGJiSDIwQnFzdm5OUkxJc3FxbEt4Szl2SU8yaWdyMGJZ?=
 =?utf-8?B?ODNsc1FQVFk2UWlRVFRUenNkY2psbjgzb0ViVUE4NzVNT0dZWVNPUkhkUjI1?=
 =?utf-8?B?b0x2MXRENDNDa2ZRa2lZcVFxYkExUkYxMXhGaE5aQzJINjZObmY3NVBjQW1G?=
 =?utf-8?B?L3hOZzYxNDAzTXhFdGNzd0ExYWM4a0h5Tk9uR1NST3JaU3VhZ1AwL2hkQ0Nh?=
 =?utf-8?B?V3dmZDJxa0JQeHMxR2NmWGE0SDk5dnEvQUdqRFE1bTJsUW5POWt1NEx1REc1?=
 =?utf-8?B?aEdVNVltUHdHZVEvL0J5ZDNJODYzR253K25MRXd4ekdRMEVFWFYwaXNDRm9j?=
 =?utf-8?B?NFR0cWdNdVY5NWtBaDMwOWZ6OVQyOW11YmE0NThlZ214NnRrSUFuMGdiclJI?=
 =?utf-8?B?U0tnYm9pQ3RwNXhwQnN0R2RaaXd5NE96UWpaV1JoSktwRUh2RHl3Zll0Vjcz?=
 =?utf-8?B?azl1QVpDSmpBTHhyUXU3SnBxVHRmK09PZVF3MUR2SzVwdDdSL00rVWRqTVlR?=
 =?utf-8?B?eEJBcmZKbkJLcXhmSjVCWnBkUkZXY3NGY3UwaGt6SSsyN0hRL0JnWjk1VXE3?=
 =?utf-8?B?MW9xQ2Fyenl5Z2JuczRlMUtTdVhoV1o3M0RKV1R4NlpIelAvZ2xZazJXcXpR?=
 =?utf-8?B?c1l6QVdIMnRtbllaVGpEdDR6c1RVMnFYR0ZocVd1SWE2WUlKVEhkVWJOWUdG?=
 =?utf-8?B?TVV3TXdKWFZrRjlUME5YeVVqbkhJUCtaS2JNcHozdWl0b0dGeHZMQWV1cm5h?=
 =?utf-8?B?bkptRmVlaHl1UGNRUFVnWkZJc3lWVURSeS9jUkxrZDcwSUx3UlZuSjJaYURV?=
 =?utf-8?B?bVErRjIwbWZORTdmS2ZreWtYeERBZjNTZTBTYzhVOVJjT2Nic3RVVFZsVS9Q?=
 =?utf-8?B?dXB3dHhIYTJMVG1Nc1lFSkJmZzIwTEswM1A1NkphWjFCY1lWMHVkdUhqZGJw?=
 =?utf-8?B?Z2QwbXBvWEp5RXNSa2VCSGU3M3BYTTFJNFF3L3lUZnIrRS9UU2JHSVdBVW1l?=
 =?utf-8?B?YVRsWWlaSGQrTEZVYzJWNzdwL0pGRjFmSFRkQlBFK0FYNllIcWRPOU45VDEr?=
 =?utf-8?B?U1dac1FvMUw1MVZHY3R0aU5jN3QwMGU0cEhLb1RRZGY5TTZqeEFwWllwVWxx?=
 =?utf-8?B?aFNtK2hrOUNQU3h6b3V4SGNRRWIramgxaXZjTElHSzNZMVc0M20vS0N0aURn?=
 =?utf-8?B?bGpJeUFHWDY2MVlwdFFWeUdhTjAyenBoUjVERmdFV3cwSElKNS9EbDhLRkxa?=
 =?utf-8?B?ajVTR05yQzdNdHJBTTZ4Y2tJTHRYaGdEWk1TeUhBUmpoS2Q4VUdTT3c4Nmdy?=
 =?utf-8?B?a2QySmdOL2F0MlBocXc2MkhuM2s3Z3RoVCtQZmF2ZDFIZ0h1bHhUWDVCK1RR?=
 =?utf-8?B?YlZKZG12QnZiR2JNaCsxYTZwbmJOa0hoTThCWk5zNUlDR2JuRWFHTDZsQ21j?=
 =?utf-8?B?bEkxeVFvbXRETHFydE9RQ2hTemNkUFFmYnhNc1VDSFFmZjNMMlgwVFlDUFlL?=
 =?utf-8?B?RUFVM1FmbS9BZlJ2MjB5dG1PSVhYT0ZTZ05JZHQ4OWNNYWNqaDdndm13cGl3?=
 =?utf-8?B?R2xnU2V5c3cyTitUdzNzYldZVGZmMkk0ZDFsVHNjeVQrYUE3bFZFNm1lSElZ?=
 =?utf-8?B?Qy8zYU5haEJQVWdJRWdwbjdUTW5LMUhxeUJ6Y0NpYm42M2ZxNXMyTktBdzB5?=
 =?utf-8?B?ck81UnRLN3gxN0Q2emUrZFFXZm9nT1BlOVNSSTkzQ3R5eGR4V3pFTzdlZElU?=
 =?utf-8?B?TVNpWEY3ZDNHb3Ewand1aU9GWmx4WVZyNlJBaTF2RGpQVmZzS2dKUT09?=
X-OriginatorOrg: furdevs.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d50dde-d10c-422a-7054-08de7351596c
X-MS-Exchange-CrossTenant-AuthSource: TYSPR04MB7125.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 03:03:56.5277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c15d1683-7bd7-4720-8850-c10d9a967b56
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezh5YZBGKQ63WpG3iyzP9zFqIaFoCdB4iYK41S/OBkzmBOexR4x34VsfifRuqyltfS23vChb+8Siq2rm+7ZUMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7329



On 2/24/26 05:51, Jonathan Corbet wrote:
> Haowen Hu <srcres258@furdevs.cn> writes:
> 
>> Get my personal information updated in the Linux kernel Documentation.
>> Mainly on:
>>
>>    * The legacy e-mail (2023002089@link.tyut.edu.cn) had some issue and
>>      is not accessible now. Replace it with my current e-mail
>>      (srcres258@furdevs.cn).
> 
> So ...
> 
>> diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
>> index 8115a7618307..9b27b1f19355 100644
>> --- a/Documentation/translations/zh_TW/IRQ.txt
>> +++ b/Documentation/translations/zh_TW/IRQ.txt
>> @@ -7,7 +7,7 @@ help.  Contact the Chinese maintainer if this translation is outdated
>>   or if there is a problem with the translation.
>>
>>   Maintainer: Eric W. Biederman <ebiederman@xmission.com>
>> -Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
>> +Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>
> 
> Despite this claim, you have not touched this translation since 2023.

Guilty for my absence of contributions. For my being busy with daily
routines, I had little time working on the kernel documentation stuff.

> And two of the handful of changes you made that year were ... changing
> your email address in all of those files.

Sure. Just want to keep things synced as exactly as possible, and so
does the patch mean to be.

> 
> I don't think that all this churn this is reasonable, especially for a
> translation that appears to have been abandoned.  So I don't really want
> to apply this.  I would suggest you send me an alternative *removing*
> that information from those files, optionally leaving a credit for past
> work done in Documentation/translations/zh_TW/index.rst.  The question
> of when this translation becomes too old and should just be removed can
> be left for another day.

OK, so do you mean this translation (zh_TW) is planned to be removed
from the entire documentation? I'm working on the update job currently
for the translation to become modern, and you can have a review of my
rework when this is done and the patch is sent. I really want these
texts to be kept in the kernel documentation and they are able to
receive a thorough update to be suitable toward the kernel nowadays.

> 
> Thanks,
> 
> jon

