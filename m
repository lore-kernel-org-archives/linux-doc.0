Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022127.outbound.protection.outlook.com [52.101.101.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DEC35C1B2;
	Mon, 19 Jan 2026 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826489; cv=fail; b=Y3c0LMtY1WwtVeUD62VJRK66Zk95lD6Xm4Jnfst+4lGv9tkmC3ikoYREHNLSyXTG6aDjgX1n+UcacfXAQ/HBPw9/dpGxC24YHUr8oOYajPobzNh1MkuzdXvzr/GYsLjD8lrg3ynemx6ckmdmmP3SFYHBy/SOusXcumKVs3K6roo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826489; c=relaxed/simple;
	bh=m0LiGliAvjJKA5lbAL0Vg6fDzUUtcR62/RjXoa4LOv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t/vljDe8hrOEcoBifkorGF6F5fJMqfWkcxUqwoEsAuRj5vOetpoNKz0qcWad1jTUveXMEgr0fzTxAqD/t0GpOX6gigY3PosH0grLT1giIl1T1ZI1wRWwwjdSPWN+AiLz1APIY3cCY/fNOowtxLqUrbOGN5XQLtHClj/odACuGr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZwf8x76fHoiiQNZCFAGDHX+6SSQ8XI8gGtYmoNiAV/M0sjY5D1ej6f+IgsMr+5A8Xrs9JPpLB4M+33r6W/Tu494pY0XlCNUTHFTJHLUTKKPF4fXunUdXidtdEGPZikfsmc5ZxeJKY9GqkhYN4l+h6N9mhEVfjvwtGFDVu+38aYVDFzotLfHY72WOAynjMQhZPGkhwCZtivYCpvtMY1TFIheccGtPj1csYBL+S4e7vtjhJrWyTVSprBchUj3IpcHQ0t5fzoOWuG25PFS9AdjUw+GPJ3cXWP+mDPg5zDiW52rRSx+1sIPN3Pw+JzNs3mlpwOcpbQRaGaFjqOcd53pmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0LiGliAvjJKA5lbAL0Vg6fDzUUtcR62/RjXoa4LOv0=;
 b=HD9vJMyR5bv1Vy+VkhFNAT7StdP3w/ZtuvsH892gEY5jSBXLu7KB6anK1WLlKdqugQxuTbhanxXv+4ITCsUW8C2XIqfxwxqSc/0QVrJkH7xdJjsCmkchWAlUf5WehasUOP0V4nzN6o57l6gtVKsHSJRonb7Fnq+lGZzwtDDgfh9sMvpK4eKPc41WWfypmHq8QZiLtFxj1HltbP49fq5jWGmvf8Uf2sfcSqEwbFhMVlgis3N61WpDRHBLUoFJjOWQ8zbU+bCV62cBtttLLC8UO0hwNtvBanDxOuLEUa3lxVIi4uM5X/xt8WCRLDqxDwmarlU9DOtKVDxGnhsCAnqR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by LO3P123MB3337.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:10c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 12:41:25 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:41:24 +0000
Date: Mon, 19 Jan 2026 07:41:20 -0500
From: Aaron Tomlin <atomlin@atomlin.com>
To: Borislav Petkov <bp@alien8.de>
Cc: corbet@lwn.net, anna-maria@linutronix.de, frederic@kernel.org, 
	tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, akpm@linux-foundation.org, pawan.kumar.gupta@linux.intel.com, 
	feng.tang@linux.alibaba.com, kees@kernel.org, elver@google.com, arnd@arndb.de, 
	fvdl@google.com, lirongqing@baidu.com, bhelgaas@google.com, peterz@infradead.org, 
	brgerst@gmail.com, kai.huang@intel.com, benjamin.berg@intel.com, 
	andrew.cooper3@citrix.com, oleg@redhat.com, neelx@suse.com, sean@ashe.io, mproche@gmail.com, 
	chjohnst@gmail.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/idle: Mark "idle=poll" as deprecated
Message-ID: <lv4j25eogwjct5bzy76doh2thucpnqcqlpblbw3etmdrlc5rfq@3svjujqwisii>
References: <20260118231009.3194039-1-atomlin@atomlin.com>
 <20260119102116.GAaW4FnNBECNPFzAW3@fat_crate.local>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gbr5lvhhqthplymc"
Content-Disposition: inline
In-Reply-To: <20260119102116.GAaW4FnNBECNPFzAW3@fat_crate.local>
X-ClientProxiedBy: BN9P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::6) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|LO3P123MB3337:EE_
X-MS-Office365-Filtering-Correlation-Id: 55da882c-ba28-48f3-f9b4-08de57580e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2QrMXN3bE0wUkJCc0ZPdlYvSjlWTXdUUC9lVFBiS1B0TnVsMkNwb1VsNGxa?=
 =?utf-8?B?ZWFVay84Qlp6bjk4RUZFSlRwZXI5MmFqcCszaU9ucm9NemNTbVVEOGlNQVBD?=
 =?utf-8?B?cVA2eGFTclYrTFBIRnVJYzNsd25xWTFNVUh4K2R2ZG1IRzVTOWZhWitXVTBv?=
 =?utf-8?B?UC9UalowUVZ3UlBmZ3dqR2VJdHIzdHBUWjdCc0QxWGk5ME8xcnZ2L05Xd0hv?=
 =?utf-8?B?cWhRU1RnYWNiVG1jWmVVNEVING1KdHZNb1k2dXdUTWRvbFhGYmtRZ3ZORkx5?=
 =?utf-8?B?UGFtQW02ZkRxeFpYNW5iVmlYNERqSzBVdUVvZ1JhTTZ0OG5rNVZVZWFmeGlJ?=
 =?utf-8?B?RS8yVnhLWDl1bCtCZTBPcG13a3oxSHVPQmpsU2ppQnZHeElXOVFjOXRaczBq?=
 =?utf-8?B?dHJYaFUrRHRZWHdnNkh3T01ERERWSVYvdkNST0MvaFlvMzE2TVhsYkszQkc0?=
 =?utf-8?B?eEV3VVp4M2o0RU9QdzJldlIvNVlacWt4RFpubkVXdmJLSXFMQkZaNVVZRko5?=
 =?utf-8?B?OEtScU5aWGpZUHdRWGxCT2dnWDZETUFWdUs3QUZSM01OUmNCa1BtYU1NdGRM?=
 =?utf-8?B?dXc3endGNFVBMUltWFJzZkROaTlJL05DNGNNeVJRbmtLUTRjenVnLzlYQ1Bu?=
 =?utf-8?B?ZGt6cENDRGVwRzlrSkM1TjhsQk5Cc2VkODhHN29GcEt4blllN3ZhdkFPNVlU?=
 =?utf-8?B?ZGVQVGJBZWNZRHhWWEFQSDg4V3dyTUxlZnMyUmFUQWdoSWsrMGFjcmR4dUll?=
 =?utf-8?B?OXV6ajhaZ2puMng4STZJZFhlZGR3N29wRlU5NkNrdkR5SktWR0RCc2prUms1?=
 =?utf-8?B?N0d3eTNpNDBPcS96T2tkWS9pN1U2SVdYcys4a3hwRUlHLzJwNGZTa0pKRm5p?=
 =?utf-8?B?ZzNXWno0cENZL1d2ZSt3Y2dkYi9zNy9kUytlYXJoeVZrTTJJUzhQa0padnZ5?=
 =?utf-8?B?VUJkLzRTek56QjZPSWptak1udUZFV3RxYll0Vzl3MDgyY05FMjhRQk9sVk8v?=
 =?utf-8?B?UjBKSFpRd3N5aFM0QlNYVWpvbUZvRkd6Z3Z5bXl0WVBKQmxqdlB6UDV0VUhu?=
 =?utf-8?B?NFhoY2hHVnVzN0dIMnNkeUFVWVRYdnBsZVkyWGxMdWtPNzRJZlFtV1BuMWpW?=
 =?utf-8?B?a2dHU3NXcWZYVnQxd3dYYnowTTJUajJUQlhUblJjNDdSWnhwTFFhaG5kVGc2?=
 =?utf-8?B?L0srcktWZVdoWFVick1OWDdsR1JEQ2xqNVhRL2x4VkIzSktSTjIva3VRU0FZ?=
 =?utf-8?B?b1QrcXlWRjBKS3dua3VSUk5NM0p0TE9pUnZwaTJQMjAwN0cxa0pLdTVVM3lG?=
 =?utf-8?B?cXFkV2orT1FIRjlKYmlMVGZLNzR6ODJyV09kN1FPczNhcWRqN1FBVENhc1RO?=
 =?utf-8?B?L0dLRnZwTmFodXpuaW82NTF1MFNNK2xVNXpuV1NsMmMzU2ZnNCtkVEVjMUhX?=
 =?utf-8?B?MGlmcG5OR0hqeHI3ZlJUZ1YwQlZOTDZDaWlNd2d6NXhkd3Y5YzV3VTkrNDJ1?=
 =?utf-8?B?SGpRejNmQlk0d0VwOThkMUNNQ1pnQ3diU012RkhydXg2VDlFc0tTam1zNDJZ?=
 =?utf-8?B?eXpJVE1DTnhjNDhpaWxnUENUQkNCcEIwb3lIWE9pUzllS1dublFQd2w5UmVk?=
 =?utf-8?B?Y1pFYW1mUlNQcnJNYWFTRlZhT0wzbmRyRUtIZU1rUkNsTWhLTW13QUNyQXg4?=
 =?utf-8?B?MVk4dE5saHp5OG1Wemhxck5DemtJSkRWNHlVSGRFRm1rbytkMzM1MFRLMnJu?=
 =?utf-8?B?UnlKaTQ5NmtRY0VqN1hvNGhyN0xEaU56S2tXbzZwRzZnZ20rY2lCOHBoYUpI?=
 =?utf-8?B?Wmk5K2hadm5xcDVNbmY1b1JBWnhEdTlnTlhMRG56OENLS2diTjk1MUtjN2JX?=
 =?utf-8?B?ZjZlLzA0VmcyZjBqLzFwc3ZXckswcmQ0SVFQUktQOEJNZ1Via2dzWFdlQUZn?=
 =?utf-8?B?WG1qbTRMNDVHaHNmemVZemFnalVNZXdManpCdlo2czFsWTNKa1lhSnU5K3g4?=
 =?utf-8?B?U25XREQzOUJMZjZvMndHam8zSjBnc3BjdndyUlJpS0hxRVhuR0hhQVVva2lU?=
 =?utf-8?B?VTJNUzhjRGtjY3JUVldrT2F5SUYrL1QrSFdmOG44UURQWW8ydUxucjJ3NjZL?=
 =?utf-8?Q?8FJ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDRUTjkvZ3ZXKzkwZERmZ2ZhR0FvcHRNLzVwZStKY2Y4blF5aVplOXNxV2Za?=
 =?utf-8?B?Z3RoRlV2U1BYV1JjbWp1VnRpcGllSDJzZTRvdFBqM0ZIRDYyNFp4MDJNaDhR?=
 =?utf-8?B?TUY5ZktWbyt1WGpRT2cvRVZWek9WNjdFaUdZbFF5YUxXalRaWTk2Z1dIdXRx?=
 =?utf-8?B?cVhkLzhXcGxFRDI2ZVlyOWxwcHRDU2RMSUxFWGpHQmQ2MjVjMHY0d2dZc2tJ?=
 =?utf-8?B?Y2I3YWk3TnZqdzM1NmMxZFl6YUp3U1JvVzFzK0duK3NScW4zOVpSZWVKVTRX?=
 =?utf-8?B?VHFFTkhRWi91Z2dOVnV2SUNCdlJkYVcveE83dFE1d1VlcVFOK0U5ZCtlT1p2?=
 =?utf-8?B?NEpWcW1DeXFnSmVoWFlpQnV0UkQwOWRLNU9rSjJuOHdzajRaNHF1NXR5MGQ1?=
 =?utf-8?B?YmNZU1Nic0pJdDRUdW9qcEttRmtNTyt0enZJaXVZNGJ5WW9QWGR4NHJZZUNa?=
 =?utf-8?B?Y3VlbzcrUnNjaUp6Uk5kMU1jSzVFa2dTL1ZUODJnUVhseVhNSEdwL0pvUWR6?=
 =?utf-8?B?ZUJOVXFlV2pHaWgwVE1wYXZDeFNjNVhIRE52UHI1YTk1dVpLMngzek1SaFV1?=
 =?utf-8?B?VHZiMmpPMzZnU1JlcW9FdHpIYlQ3S3dRUnd5QjkvL0Q3aTAxTG5aU3NVcXAv?=
 =?utf-8?B?K1ZVc1VWaGs5MDRyYmVaWjRxVUlyWkJxeEpFaHpZTFZzNlZmWThTb2I3MnI1?=
 =?utf-8?B?VDJhamRGeFhCZjV5aVJkVVh6NnhBcjdzdkNLK2JSVW44ODlpZVBUeDRvOHBr?=
 =?utf-8?B?WEs2L2tydE9HMnJiRWR6YWlpdTczaGkvZkVUNWFrUHhXeWpVRG9FRXZvUTZL?=
 =?utf-8?B?cGx0OHRUME5TQm4ydys0a1h6ekRaYW1mTGhTQWlrMllzNnpSL3YvbDVJZE40?=
 =?utf-8?B?bjVKUGFlTktQRXc3bG5LZytCcGpsTHBpY2RuZGpmNkVSTTZzT082N2RIZWZ5?=
 =?utf-8?B?RkJVMEdaeWhRTExWRWlaUlc2S3B2ckN5OW9GWTFTTEFuZmlhdnhxUGlXQmRz?=
 =?utf-8?B?UmtkSHhGTnM5UFZ6L0V6WUw3T1ZoRDlrMlRuYnVZOTRTSnE1TnRqOHEyeldn?=
 =?utf-8?B?Nm85NkE5TmxGUTYrZm9VcHdsd05mRVI3Yi9nRlRabnJJZHY2S0xoQXF1QlJH?=
 =?utf-8?B?QUNsbWZraVd0aTB2Qjl5MlhXVEltSzFlTXV4MUNZYWhLL1hEVjFpQitkL3E4?=
 =?utf-8?B?clZ5b3lVVk53RkhRTU91UDJCNXByV0JWWkYyZjlTRmx4dld6TXpyWlVyTTN2?=
 =?utf-8?B?MTdyWjVLL0kwZTZkSi9WejdzNEczbGg5MXoxMFd5MURyMjcvbElQakVJdk01?=
 =?utf-8?B?aFQzSldsb2w3TVFIVm5EOFZLU25qRHl3OEZSSFEwTU03SjU0ck1MWnU1MFhJ?=
 =?utf-8?B?cGxwdmFERytmSW90ZTlZNlhUWDhGZWdHeXRGTHlHbW50STZLLyswWll1eDZp?=
 =?utf-8?B?dExZYjBKOFhOQUNYcTA3VEpLN3BORWJPMjJnRlZFZklqMFcwUVpBQ1luL09j?=
 =?utf-8?B?NGhabnR2dWNlN3pZYWlFR3lWY3V6K0NybTROVldBaWh5c1FiK1dHVTA5MDZK?=
 =?utf-8?B?R09yRmx1RzQvdXN2Q1NNZmgvUWVwZkpkN2daWmpuYmRHajEvLzAvU0tCYTN3?=
 =?utf-8?B?blNtaWlvalJRaWVORGt3dnNReXJtczRTeXNYME5BZmxRY1NIbm1CVXJ0Mkk5?=
 =?utf-8?B?M3lFNnJRWXBMaVc5YTZoWmFuSFFSLzJsU1VNcFlkWTZzVGwvdURvTUVDczBq?=
 =?utf-8?B?eC9RZiswbXpQYmtZbmw2QTEzcm5IQ0x2QnJUQWF0VmxPbUY5eVVON0x3b3gw?=
 =?utf-8?B?cjA3cDRla3JKOUtnb3VhQXZSYVlwa2w1Rm5PSmVYc1NZS05xUFpabmJBZ01r?=
 =?utf-8?B?MVpaa29uNnVwY0JERmlnM2p4OUdITUFHM3VpazdXb2JUMSt0Y1B0UWJkci8v?=
 =?utf-8?B?NmRTbmYvbzZYV0V5L3ZaL1FHVjFTMnp2ZldXZEUySkJ4YVBpQnhVTDZ0d283?=
 =?utf-8?B?RDVqSzFYZVltbXArNC93WmdSSmpxVTYwaUJwMFh3RVg4ZmFPL3hOTFdqS1Vp?=
 =?utf-8?B?YmpETG5SSC91REZhcVZQa2xkTld5Y3Noci9UTWtSUlJXS2hmWDgyVEM0RS9a?=
 =?utf-8?B?MExFUUluYmFrREFTdnNmNFpwMnltTGljeUx4WDZmYnhQd3VhK0l2OXh4cVlP?=
 =?utf-8?B?eVlKUXAvcnNGU3AyWEc4cncwQmhka1RINkF0NnNIM05hL2dIYjRMNHJrOXEy?=
 =?utf-8?B?QlFGcU9tUnkySWh3bmR4QXZaK2Z6MmU5ZjBQck91REZTM3dSV29GSVZsZGw0?=
 =?utf-8?B?ajFEOTNTUzNvUHNUb08xay8xSkhkbzE4anlCWjY4RGhibEZ5QUFXUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55da882c-ba28-48f3-f9b4-08de57580e68
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:41:24.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFqqTRRoCwG8mXL3BAqktoiiggVCnJefMuzpUpX6SixCGN8aGIbebQ60lNrtwtY8LhhXgr7eseGNX5e/ELQS1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3337

--gbr5lvhhqthplymc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] x86/idle: Mark "idle=poll" as deprecated
MIME-Version: 1.0

On Mon, Jan 19, 2026 at 11:21:16AM +0100, Borislav Petkov wrote:
> On Sun, Jan 18, 2026 at 06:10:09PM -0500, Aaron Tomlin wrote:
> > The "idle=3Dpoll" boot parameter is a blunt instrument that forces all
> > CPUs in the system into a continuous "polling" state. While effective
> > at eliminating wake-up latency, this global override is architecturally
> > obsolete and inefficient on modern multicore systems.
>=20
> Nope.
>=20
> It is still very useful when you want to stop the machine from entering s=
leep
> states.
>=20
> > By writing special value "n/a" to the per-CPU sysfs node
> > /sys/devices/system/cpu/cpuN/power/pm_qos_resume_latency_us, userspace
> > can force a specific CPU to poll without imposing this cost globally.
>=20
> You can't do that on the kernel command line and thus prevent entering sl=
eep
> states from the get-go.

Hi Boris,

Thank you for your feedback.

Understood.

I will investigate the possibility of implementing a boot-time parameter
for the PM QoS subsystem to bridge this gap. This would provide the same
immediate enforcement as "idle=3Dpoll" while retaining the runtime
flexibility of the QoS framework.


Kind rgards,
--=20
Aaron Tomlin

--gbr5lvhhqthplymc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEeQaE6/qKljiNHm6b4t6WWBnMd9YFAmluJmsACgkQ4t6WWBnM
d9ZNeQ//b7vroGiNUAw3u7mjGatKV4OAZ1TArQJd6tOnDplDifajEF2RWbRGlw6X
gFWh+MH/MfZrCarXrwU6rvXTAed0M7aJqNHTy/e364TzVCBY/MRytk+cUGIkX6z6
Bhjwd6cRRm6odY7mr7JkfOM/I+MMtsPv2YMCVSiVAjRIu7J2muBXlp7cVkc+wo8z
eiTW8UKBAZBZTU5uIUCBFKVInRt8sJuH49hp5Mx0Qe4uHg3g5ssrV+RGCkeOMmtO
NPo6J2AP/ZEy8KWQGA6LBQCWeWkfaH2VziXCwBw01kstZkBr384eopvA70L1AMOG
ciASnW2cNwCXvTp3L/zLCBqUVhTp+FLyMH7uiprAPgybjioKzGWyuW6fseCh6S0/
yQ8UhD3HVd/03adEPJVi00t7JOBBZQ/U+WVkwZX1rfXMNJdLg18CVFg8bAxqQzim
1jQ3Cc8+Zdhf5UV6oyx9045bOTAjAt2wOTwl12B2fg64PGNoINY/JhR7uU35q/6F
amswcnj/Dh2NR/dHL6JtHSHkoMM42XnIuIG5UeRAwahhepdpLqNoP8AvBN2el+f3
GFb8zsFC6K8aNUaeKEbSNgAJfapienEpkKBMxt8132EInFhE+PZ/ah/cA4SfcOp5
L0IrOvEp4JA1XO3dmIGduKHhVTIVbpblAjGdpO+ifXPbtFisEfY=
=n0yI
-----END PGP SIGNATURE-----

--gbr5lvhhqthplymc--
