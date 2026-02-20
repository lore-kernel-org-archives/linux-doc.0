Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022078.outbound.protection.outlook.com [52.101.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF7F280318;
	Fri, 20 Feb 2026 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603351; cv=fail; b=OtxUl/xzHiK5opG97b9i3YKu9efxZu05Sr/qqM1VxSX76uXjegapUhsCHVHKSCGSHrjQMKohpMgCBTT0r4YoKOV1jkersxfZkPcMrkZ9ceWuwUcVe+llyurP2adujP99Mc3Z6RpAe50gmg+4AALUOONIgTCWlZWXrhz/2P+ly6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603351; c=relaxed/simple;
	bh=dhW5Kpep4DJJTGasioIruAyMJenKpBDkx2XyzppEMBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f7kTBKfrcvH5H3Z9DyjQd2b0ah8pIg8cmHybyR7uRDICJPWCc2pis2y+869HLqCu1rM+B3TUc3dtPnNflWa1gCTPy7XcdaWbAvW2wlW5dwmx/aanjY2fUAnrSrAN9xpmjDE1e1zzq76hIlBkY2ZzHJs8BKxoCs8ptmTzA8XUN6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furdevs.cn; spf=pass smtp.mailfrom=furdevs.cn; dkim=pass (2048-bit key) header.d=furdevs.cn header.i=@furdevs.cn header.b=Cov/sS0F; arc=fail smtp.client-ip=52.101.126.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furdevs.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=furdevs.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=furdevs.cn header.i=@furdevs.cn header.b="Cov/sS0F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMwTwRfeyzbUFlIu99lyP6ZIm/cB4JExExRXAHihLgppsUa0Gr+kRpoBSd0J7W5B5iPf54ut99EwFfXFsUjvmMCFltsUKb8VvCarhrHFyyRRxOdh3blOAg2pFgn4i565nSfp6oNXDsyOfBe8EgvXpplEZhcRPKPo+peNc/wbIJaxwU6Yn608ET81Po4G+uWHvOziE1z7U4nJvVDy2VNO1jEDsdRDb9Jq9QMVTx02YAmDUKkk3BQJ6Fo/RgjCg5okDAqfnGD5L12dWJAh1Dya00p5HP5oO10gjXNFa9GVh99wy++KJW+QhEJ677tG8zHhtA5r96ffRwT4uIhVRX0BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzBSAtNXfZJq/hOrdjQc6rtagbLiNAQ7S6W2eFR4Cbs=;
 b=PPE/DWnxxPkv1yZPkcNDbZJlBq84tM5mRVm5LiXSBJ1dAjJskmI6M3QlM+RdPjYYmGcaxPAhp0TzYeEbRwaHSmG5aP6sEyorqXF/y26DlgZ140/zrOVMA30i0oidzJkqpkvXKKeStoqmXiTZPaxKrWaQDj+tLf9GasKnVG6w+yq68HwXpoxIzYPMHme7xfTmI+CCg+dMozeTymqOxZgm3+EVcsQEomsratrzfXYOBBh20Mk55BmdxCGTYQt4z68fIzcw5EreE1xKnsHoiqkijJkY9gwd7XnM7WBFZS4pGyVxCx8H8DwDuo9r/j5pUa95PEu7yP3qbS71q00Jzy9L3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=furdevs.cn; dmarc=pass action=none header.from=furdevs.cn;
 dkim=pass header.d=furdevs.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=furdevs.cn;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzBSAtNXfZJq/hOrdjQc6rtagbLiNAQ7S6W2eFR4Cbs=;
 b=Cov/sS0Fddka2fVHc0YyNA+hYBFjbIY9LLJgVoQ5EsCOgJbTaZgyKv5mc9bExg3ks6W15PWCodg3k47uMhCttWfUq8sQFSIhtVOg7uUH/0wbQlqft8VbrV3c687ecbA0y6LljkorCvRd893LSqCUSUx7Eu9CrgR20vKH9DqxyQ4JbDTQSgr0VEb5VnvcSTStl6L+JVyLD8+PMFe8e9iLRDs5Muvkwf/4gWanh+8yzYb4CXh81iABOY2rRC8ZtPv4ONimzG3EHO5vArKfC5Txck9lYNyyVJjG8yDWtirqUI1+cSXCMnxfXTGcDnT0TYmspKjD6Y6RWZTryvGpTnIjGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=furdevs.cn;
Received: from TYSPR04MB7125.apcprd04.prod.outlook.com (2603:1096:400:477::12)
 by KU2PPFB255AF57A.apcprd04.prod.outlook.com (2603:1096:d18::560) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 20 Feb
 2026 16:02:21 +0000
Received: from TYSPR04MB7125.apcprd04.prod.outlook.com
 ([fe80::a2b:ba98:33bb:56fc]) by TYSPR04MB7125.apcprd04.prod.outlook.com
 ([fe80::a2b:ba98:33bb:56fc%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:02:21 +0000
From: Haowen Hu <srcres258@furdevs.cn>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Hu <srcres258@furdevs.cn>
Subject: [PATCH 2/2] docs/zh_TW: remove trailing space
Date: Sat, 21 Feb 2026 00:01:26 +0800
Message-ID: <20260220160201.41149-2-srcres258@furdevs.cn>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260220160201.41149-1-srcres258@furdevs.cn>
References: <20260220160201.41149-1-srcres258@furdevs.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0002.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::15) To TYSPR04MB7125.apcprd04.prod.outlook.com
 (2603:1096:400:477::12)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR04MB7125:EE_|KU2PPFB255AF57A:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cab677b-f318-4547-7dd0-08de70996e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|786006|366016|41320700013|376014|14052099004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1U3MCtqQ0dsYjNEMzBwcEtPdWZqb3pncFJ2R01rakd0QVFrckZpbFE5V0tT?=
 =?utf-8?B?YWlqQ3JzMUY0TXBrNHVySVh5UzlyS0tKNlB4SW03TW1oYTViK1B0eGZuSVZV?=
 =?utf-8?B?TDNnc3d3VHB2NGdRRG92NGJKWFExQXRGMnQ2ZjJ6em9BcWRWWGRZR3hpYTJE?=
 =?utf-8?B?ZGVLd3A4USsrZTZXV0VndFo4NkE5Z3hzd1JxYjRpZFV5Q0FrZC9yZFQ1bW8v?=
 =?utf-8?B?SzdFZEFON1NQckovdUszTGh6djBhOEVTWnVtNUJMSStPeVh4azNJbDU2ZlMy?=
 =?utf-8?B?ZWdUaFBFMmY3K3RYelE3eURzQnpUR3pKYnZobnRPMzVpbGlnNGdSRjRiMGpS?=
 =?utf-8?B?TlBSUWRQdUYzTHFqRXVud1JFVldURG01WlhYc3VSa2VsajJGVjFDcjFESW8y?=
 =?utf-8?B?T2FxQlppa0VpWmhzSWJ5YlB4T0x3ajkxb3l2NE1wbFAxSTE1cGl6ZXZ6VUJl?=
 =?utf-8?B?eFVrRzFaY1lHMStnTHQwVm9ZZTBWRnp0di9adklMbDJCK0c5MEdUeHFYaUFT?=
 =?utf-8?B?VkdQSG1MeUxCTlA4ejFwY2RNUVkyc1FsZ0loenU1NEJiSGFXVjNDZlNNWUw0?=
 =?utf-8?B?TCsvckJoV2ZVQ3ZtR1NFU3YvQmRhclp5dUpockdDZHl2QUxxM093Rm5raXNa?=
 =?utf-8?B?RGh5N2FZVjM2Mk81Nkprb3B2L2VtakNFanB5eXlZWUg5SnVwWjBoYmFYaGZk?=
 =?utf-8?B?czIzdkx6VmVhUFVpbXMwWXlrdEZYb2xvSXpPSU9oUjQ5WllaUnkzeTNaam9v?=
 =?utf-8?B?L1NUSldIM2szQkk2R2pQQVJmR3pFWmtVSmJqdUtZTm1iN1UvT2hPUXM2b21X?=
 =?utf-8?B?OWZ2RVVKazdNMm9JT0pKeFZwQVNIbmI0S3c3aWJNRVV3UTdZT1FMN3RSRjNv?=
 =?utf-8?B?bE1NTjgvb2tuVWJKY2ZrN1hoWVhsZVl4QmVRWDIxS0ZnY3VKSGpwNWZSdU1q?=
 =?utf-8?B?dTZvZDhtSC9vKzBGWG1yaVFSMnN3eVUvM3ZRVW5QUDJwODhhaTBLTlF1ZXZN?=
 =?utf-8?B?MUF5N2cyeEQxNE9wVGZJTzliWHJENnFPb2JWZ2xKc090MkhZMTBLdUloMHUw?=
 =?utf-8?B?VGozNXRkOGFhVmhBdWhzQ29GSnlGWGFJbldFN0oxYWpVdkJxNEc2c1NySVdI?=
 =?utf-8?B?YnN5bklNUDBOMlM1WmJaZW03VWVKblVPR21TSjhRU3JpOHg2RzRSclV6Mmlh?=
 =?utf-8?B?aTRPSksrQm0vdTJOdFYvME5wK3ozK1hVL2FuN1ZrcVBlcHVVdW1xZCtpVkx6?=
 =?utf-8?B?R29MTDRNejNPR2lLMWxuVUZWUkVqNFBjWHcwbFhnelV3K3ZMTDN0azJzOVkx?=
 =?utf-8?B?eTZBOUpDL2FUN3RlODd2Zi85OVhzL094ODRvOXFqODR2eVVJZnlHelNGR0VO?=
 =?utf-8?B?VE10dnh6YUpwQ3BTaURnOWt6VFViancrR0hDK0JPRzVmckdGU3kwKzI0R3c2?=
 =?utf-8?B?eUVtNFRidnJ4bWlZNVo5OUROWmoyZUh0Rm5EQVErRDJ6VjhIRzZuYjh0Rkp5?=
 =?utf-8?B?ckVnWEt2ZFl3TnJRVWpsSWxCam9mRHZ3TnVyd3p6SVloQW9ka3EySWxxK2pL?=
 =?utf-8?B?QWMxV0pQc1ZrM0FrSjZ6bVVEbVh3RTFUeGVFVWUzcGR2UHJNYjA4VUZjNVhs?=
 =?utf-8?B?Z2FsbDB3ZStCTHZRczI5K29TUW9TdjdtTFNQbWNGMHVvZXRXQlEyQmtCcGl4?=
 =?utf-8?B?WlZGWWo0eDdWNjc0WFRQSWhIY3QydGdJcStUNEZSanAxMWdaYllBeG85Qm5o?=
 =?utf-8?B?UmIrVmFRZkJDVGZ6eHNDeUYrSjU3QzMzejJRblkzSWkrakE0U1RsMVVwL1ZU?=
 =?utf-8?B?cmFyRFlEZmw4eGxhOTdTam44RTFsV2k3L09CbzlXWWR1aUZHMlcxbGs4aGtM?=
 =?utf-8?B?eE9CQXo4N1FGV1Axc0gyOW1rSWFrY29sRnlqRHhka0ZGVTNqQ25LZWxCS3Zv?=
 =?utf-8?B?T3Z3TlN3TUZVWDZ5WGtoTlZNZzB6d3lEQWpSYkllTUMzQTZrdGxuVTBzTkxZ?=
 =?utf-8?B?L0c4ZGxSdCtyb2VDcUc5clVLSnRzVUR2MGducHBQc3BmMXpxMFlyQkhzMTFx?=
 =?utf-8?Q?W7HcL9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR04MB7125.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(786006)(366016)(41320700013)(376014)(14052099004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlVsOEw4RUt6QkgwUkpmaHF3L0Vzc3lKdHpFSjU1UklqaUFOeFJaYlg5eC9s?=
 =?utf-8?B?dm1LcDhka0d6dnlEMU9MYzVTRE9LZ3QwbFNOWEhKZXRhN3hybTN3cUF5NzdP?=
 =?utf-8?B?TXRzZ3I3SE1kSldXbHhqZCtqN1lVMVdJMkx1ODcvNlhWcnBoVEk1Q21sT01j?=
 =?utf-8?B?ZEdWWWttUGNkZ0gyWEhnWlhPL0tKYWZwRXlVbkhZckQ2RzJVQ2sxaUVrWWRl?=
 =?utf-8?B?NmtyOHI3UW81Z1B6b2FsNGd4RnZDK1dST2hKckxEZTcxUXo5V3FnMVk5ekxo?=
 =?utf-8?B?cEVvYlRzMzY5cGpzNm5VRmEyOVk5TDBLVXR6ZVorNVUvdTBFYk5STHZuQUhn?=
 =?utf-8?B?S2lUYTNhazZvUFZ3TVVrblQrUk9KUWdhaTJEQjN5TEoyYmh3WlhLVCtlRklP?=
 =?utf-8?B?T2ZPVHRta0NLYUNBdnRzYmNnbE5EYnhUWHJwNUJNc3FIQVBUNXZZek1oYXZT?=
 =?utf-8?B?MG9kMmVvVUdkZVFldkRMZnZqVGVkT01PbUxTN252QW0yb3dNYThVM1JoTFJI?=
 =?utf-8?B?UiszRWZzRVFSdWRIeUh4UWZuYkFaUG9ESktKMFJJT2o4MTJ2ZTR5dm5Ebndz?=
 =?utf-8?B?NVB4QjZMYWwyeGE2a2ZmL3lNR1BnZzNEbEUzZnpZUVBTUFk4a1phWjdsa3ht?=
 =?utf-8?B?VXJHTEREUnhlOEdHV0RSbnp0RzhGejNGTTlhNSt4TS9UVE5KRm9qN2x1WDlo?=
 =?utf-8?B?ejRSUVp5OFBhREhRaWJ5bXgzZHk0OVhxN1U4ZW9uWE5tSGNHZFBoUndPZXZY?=
 =?utf-8?B?MEJFaWpVbWYzMVRDZnYvZUxXWm9BV1AvRyt1elM5ekdhaEU4aU1wbm9ZYkpH?=
 =?utf-8?B?NW9DUVFvQ21OVGxEaXdJZHRpODJQMVVpRzJWNHhzaFk5VGFzcjBnamFKQll0?=
 =?utf-8?B?WHV0a0lmb3JERVNaUW04akNZWExhU29PcWM4d3RLK1JuWEVXU3ZKQVBBQXVp?=
 =?utf-8?B?bmllSncrL2t1S0ZyYW94NUUvUTR0dkxnVzNUSjlsL0QyLysyRjdLTTlrdTZm?=
 =?utf-8?B?R3ZzdjVXQW1ZME5kaFhWMUZFNDBuRHk5dUtKT3YzRlZxODk0RjIxdUsxTThw?=
 =?utf-8?B?MlZieEtzOE13SEJLeWN3L0xvelpQK1NtaXR0ZGF1Wk1YdzUvYytrREhsVWJJ?=
 =?utf-8?B?QVk1MEx1Z2pDSWtQWTYxTlRhUnVCQUpsNk1lc2ppMHdsa3JTdWNucDVMcTN6?=
 =?utf-8?B?dDFwdmdvTS9IU1YxUlJDaFRYN0ZlOWZVTjhWbFZJd1JDWE5zWmluK2FxZ2VH?=
 =?utf-8?B?OHVrTWhWd2RTUG0vSk53L3l3SGQxYm9oVkk3eDh2R0hFVjQvL0JjZ0RYb3Fp?=
 =?utf-8?B?L3FOdk55akYzWXRnK25BTy9ZRW0rR3p6TXZwVnkrVUhRN0FWWXlIcFdSUUNQ?=
 =?utf-8?B?dXVWQ3RRTUNJc0s3bVh5TDJXT2xWeXJyWGRHcjU3S0tuVVo1ZTFEVHRkTzFr?=
 =?utf-8?B?ZW01ck41UUlMQkYrU3pYZjVGcVV0UXp0NzlLWUg2OFQwcUFHc0pmL3FlRitz?=
 =?utf-8?B?aXlQaC9KRjRIQ0V4WjhPcU80dWp5RmZFM3VSYXg4M05ySHhQcmVwcDZRd3ND?=
 =?utf-8?B?UnRramdReTB4SGZDUzk5WVdOMy8yWWgwcHlSMVVPNmdaVUJvT3VYT2pRM2ND?=
 =?utf-8?B?Tit1eVcxY1dGazBtZ0pZUWdWZ3IzK2FnUU92MU5Ca29JaU94eHQ4VWx2bEpo?=
 =?utf-8?B?MGY1WFhmZkRvazFZM1huaFNpRHpQVTNNcWR1Rk95MjhRL0RIYkE0UWlBN3Nh?=
 =?utf-8?B?cFV4MVNTTURhbFIrQVVEK3MxMWY5NEV6aDB6c05aVktMZC9ScjJnZGFIN2N1?=
 =?utf-8?B?TFp5OFRrZnVjR2JLaE42UmdtaW5WdDNzZjZMQzhQL3hKZ1poaE1raTcybkRJ?=
 =?utf-8?B?cWhvOXQ3eEJLZ3hHMm5SQVh2SVNLRDJ2enphUDFwUEpHaCs1L21wNXlWdS9j?=
 =?utf-8?B?MVRLeGc5bHFreHZpeUh4a2k5VjE1eWQvRStuNGF1dVh3QTI0cTVXUitPSlN3?=
 =?utf-8?B?VHhEeXhMR05HWEM1V2ZncDNpTjh1SzRFdUxVS1p1eVZPUGV2S3VkKzJudWk3?=
 =?utf-8?B?M3dqd2J2NEJpekJxNnFrTlgxRkR2czZ3ODR6REpkK1JTbTU3N0NYZFpVNXV4?=
 =?utf-8?B?UWZlRjRkL21IL2ZzME1lUXRWZXlGRHQwNC9yWldwUFAreFAzZUtlS2h4RXJC?=
 =?utf-8?B?WWcvZElzWk1LeDMvMFVkVzVTc2x1MVkrdm9HcitFYUttZmJLcUoxclZ5U2N1?=
 =?utf-8?B?LzZ1Z2VQQXVUd3dQMGR6WndGMSthR0NPV3l5TTgxYmhOcW0rLzFtWUNpbGRN?=
 =?utf-8?B?R0VBV0dIcU53LzJxZWUwcDluR1YrbVM2OXBOL1VhYjFmemFLS2tldz09?=
X-OriginatorOrg: furdevs.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cab677b-f318-4547-7dd0-08de70996e25
X-MS-Exchange-CrossTenant-AuthSource: TYSPR04MB7125.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:02:21.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c15d1683-7bd7-4720-8850-c10d9a967b56
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bQSh4xI/052SeYnVW49+R1nN7nYr5fmTp+qsFCDZ3oLIHWMmM8e5hsK1UndMc7pHZaW98nB9sl03VW/ZyMB4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFB255AF57A

Remove one trailing space character.

Signed-off-by: Haowen Hu <srcres258@furdevs.cn>
---
 Documentation/translations/zh_TW/admin-guide/README.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index 6e89d1608639..fe3645b7952e 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -33,7 +33,7 @@ Linux內核6.x版本 <http://kernel.org/>
 
   雖然Linux最初是爲32位的x86 PC機（386或更高版本）開發的，但今天它也能運行在
   （至少）Compaq Alpha AXP、Sun SPARC與UltraSPARC、Motorola 68000、PowerPC、
-  PowerPC64、ARM、Hitachi SuperH、Cell、IBM S/390、MIPS、HP PA-RISC、Intel 
+  PowerPC64、ARM、Hitachi SuperH、Cell、IBM S/390、MIPS、HP PA-RISC、Intel
   IA-64、DEC VAX、AMD x86-64 Xtensa和ARC架構上。
 
   Linux很容易移植到大多數通用的32位或64位體系架構，只要它們有一個分頁內存管理
-- 
2.51.2

