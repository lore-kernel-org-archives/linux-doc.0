Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011016.outbound.protection.outlook.com [52.101.52.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217936D50A;
	Thu, 20 Nov 2025 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763663739; cv=fail; b=NkrPq6Tvd2XPtA8+GYWZ5hAG67UrVfHYrZzt1XWriF6KFZJQK3FocMC2rjIJZ0nwmeHDtJDGz2toJ42mKiqUJtTCtIZlfT0CjE+GrPOQgZjqNXl8eu6sZl9kITWj6Mg8AwgIR3ZAYtYS9A2tITBWJzrKM2qtD943XFzp4hXyzY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763663739; c=relaxed/simple;
	bh=r8CFZEwnpbq0JA3FYHqV3J6WDL3y1eF03sPz1FzkoZ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fkw0YUsKpfHP3Cfj/TfiGjxdZY4Vq6vOrr9P7sj77leSqFf+rJCviYEk0X9nb4YMXg2GCkXV4Kbb1+HvcBdmvhvfcGt+pkgBHrCFvi+Wa+zhwZjFKzNs6zy1LSywkBmEvngEmIQd39ssfdpimuAWd+jAmCawlci9S0t0T0s8OLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QjmKjyc2; arc=fail smtp.client-ip=52.101.52.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QjmKjyc2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiJiyELziTQINvapS3H/KgAZuep2vfSIdn5bWtzByPfc5JEeNFD9iRlmzrvf1Dw2Xab04/kSpjwy1kGVQDmzdGCTgCjtWYi7Z/BpTWC1eBi1U8I9RjwPMT4pE0Zn5LM4+V/FtAe1ITWx6TZDoIMWmzfJwAp4B3Rq6ovjZ/gw1CmqRXwwMNGhQVLN0R2RuD7L+9PwhuT4DSXTSv6VHR3Jx0z+dpmUJN6pqROrKIUFuoUfH3FqFZczZydE0/JoOB5v4QSRBQ5RKVpRgu5iKvJ6P8AL66miMuab8uDQMAqJyP9tsIA8KLDmMz0O77+KM/jSQLbtDJmrRsMsZidGs9qi3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqaiI+FPAVGfYghFXpxsrurb9t62LH/jmJstPL3vWWA=;
 b=wwO6qHSC6i43UBR2RjIl6lrJrhCYKZc33/a32r8wFBm2sbxuWL3LQf1tVbw1of4QxuA3PBCqHTeoDEYXvTFFVP0AI9TKoQ3NA+jTTq5WcLD0uqhSuMyQzSl8K0XjvWEmLn5QuStymWvt1uLQOuy22YhUVmRyrh3KXvaHetZH1y+qVnZ7LhWPctORSWFVpcRP4o0wpQlSMd7tiQB8Z+F112dc5b4JgvERpJsNGJIqq/2qUDnEGowmuY+vsClSMKaK4rtSTD9XKv+b/fy8dJ87Gg4UmNdcx/KJcJU/vhBVGBpYQD0Ig7BCBqduNqlaxYSEkfhlbdt0GVLC1zhcvLIkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqaiI+FPAVGfYghFXpxsrurb9t62LH/jmJstPL3vWWA=;
 b=QjmKjyc2JzrI+GV2dEoCCJcr7Rm/KtQhtC81JUDs0e9+LkUNVbEmA/6ApNydq7MV8bHkbu8qoLw1kpP5fbvmDmqoEyoKfhd1J+vbB7OhegS205KLY7o2WDirvgoFZDvrRiI/F2YNj4QPfHvboM3KiEmDbVH7ulHmM9Xt3jg8LTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdc) by DS0PR12MB9448.namprd12.prod.outlook.com
 (2603:10b6:8:1bb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 18:35:33 +0000
Received: from IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 ([fe80::8d61:56ca:a8ea:b2eb]) by IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 ([fe80::8d61:56ca:a8ea:b2eb%8]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 18:35:33 +0000
Message-ID: <312511a1-ee7c-47da-b351-ee7d9adfe306@amd.com>
Date: Thu, 20 Nov 2025 12:35:26 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/10] fs/resctrl: Add user interface to
 enable/disable io_alloc feature
To: Babu Moger <babu.moger@amd.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com
Cc: corbet@lwn.net, Dave.Martin@arm.com, james.morse@arm.com, x86@kernel.org,
 hpa@zytor.com, akpm@linux-foundation.org, paulmck@kernel.org,
 rdunlap@infradead.org, pmladek@suse.com, kees@kernel.org, arnd@arndb.de,
 fvdl@google.com, seanjc@google.com, pawan.kumar.gupta@linux.intel.com,
 xin@zytor.com, thomas.lendacky@amd.com, sohil.mehta@intel.com,
 jarkko@kernel.org, chang.seok.bae@intel.com, ebiggers@google.com,
 elena.reshetova@intel.com, ak@linux.intel.com, mario.limonciello@amd.com,
 perry.yuan@amd.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, feng.tang@linux.alibaba.com
References: <cover.1762995456.git.babu.moger@amd.com>
 <c7d3037795e653e22b02d8fc73ca80d9b075031c.1762995456.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <bmoger@amd.com>
In-Reply-To: <c7d3037795e653e22b02d8fc73ca80d9b075031c.1762995456.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0164.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::19) To IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdc)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PPF9A76BB3A6:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4a494e-b920-4186-f6fc-08de286396ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXJvdEQwclk5L0pKMFFJaWdJcDdCSjNRSFlsLy9OOGlpT0JBcnpOalFxbWJH?=
 =?utf-8?B?c3pOZy80YmNxaFJQWWdqQ1g1NWQ2aWFiMXBtdWlJVDBXQzQvcTNjQW5TVUtU?=
 =?utf-8?B?eXMxRE1GMW5QSHBWNDU3dWllRkVEUlJLcUdxbE1ZNDBYNDBOTDIwczFvS1dS?=
 =?utf-8?B?S2RFcUVMZUJncllRVExTaGRmNml1S3dmVzVuNDJsS1Z5Nm5va1dweC9LeFdZ?=
 =?utf-8?B?dlRQYkxIa1hNS2RCSmxDWG5oQWxGRmRGbU1QTEtJOUZ0VG1DczFrdXdHTHV3?=
 =?utf-8?B?Wkw2aHQzZklITU0wcm41aG1QRSs1UHN1THFWNUp4TFN1OGw1dlN5ZWk0WXM2?=
 =?utf-8?B?VnVYRi8xM3JxYWNzK2dHZnpRTWFpT2dERnY4UzR2bzNmSmhYVzI1QjNwN1ZU?=
 =?utf-8?B?dzMzTXVvY0ZHN2RtN3NSWTM5NDJIRlFvZndubkM5djlOMWZTaCtyOEpTMDVl?=
 =?utf-8?B?QXBJOEI2UFFVSHN4dm92RHMvVDNsdVhqZ2w4c3krdXJyVUNFVUJqeUZ2VjB5?=
 =?utf-8?B?WFRVZGxWSWh0NjFJMis4TE8wR09vSEp5TEpISTBGOTFWNCs5WDZGYzZCcTlv?=
 =?utf-8?B?ZFJXSTdzVFZjclBnRlFSMXFhNGQ4eUY5a0dIREFSR1lVTmJOWFczc2t4dEdU?=
 =?utf-8?B?Z3lsTlVjTDdSa3VxKzJ6YXpxZlRLa1doSnJ5cXJNd0VMQnN0QVNKVldFR3JQ?=
 =?utf-8?B?TUZQaFVXdUk5cC9ycjNjZ1J1ei81K3p6MnFhZUpubHBpNGNUSElOZ1hQTDZW?=
 =?utf-8?B?c1FRc1k3V0dUQmpGWWVrSmZ0c2JBaWdpTmo0VzZESWhwSHVCSXNURXlBN2Z3?=
 =?utf-8?B?cktiSjZSUjFoY0M5QVBNcVg4ZnluNTUyNzl4QXlXZXcveGpUMzZmdlpzS2pC?=
 =?utf-8?B?ODROekdzbklaZ0E1UDZXNmpUNE54RHk3LzgzVlBqbFBtV0tWUm9Pb3BKZzBw?=
 =?utf-8?B?TDZHTzRFTFpBNWZZTmZNNmZzU1JFTmhLb0V3TnpyVnpLang5aGg1U2Z1YnBJ?=
 =?utf-8?B?RDZ5ckhVN2NFV2dqRzh2L3JISEI2YTA0c2tIVHEvcFJrWUw1elBiZVo2MGRM?=
 =?utf-8?B?UzgxRWErRjg2dU1QYjcrQ2p3STJQWXZoRTMycVZ3RjBnZUVJVXhZeGFhYXlH?=
 =?utf-8?B?TEVzTVEwVDBUWUZpR2hYUVFOY2N5dnJwVFVYeVN5VGUwQllUdk5LZ2xRTVNu?=
 =?utf-8?B?aDFuUENkVS9adkFCVGtJc3VSUm96MlNlek9iRmlpdUtBZzlLdGcyaWJ2S1l3?=
 =?utf-8?B?K0JENnFBZXZHcmQrWVB5NWkzRWt1bjFuV2ZSREZRZE5WUkxZZ05JOWxRUnZo?=
 =?utf-8?B?THptcnRCNlJFb3I5T0FnQmE5dWJpd3lJTmR2bm9aL1FkYTJBSjhJZlFmazRW?=
 =?utf-8?B?Rm5CbnJDUUxwekswWmNuSVVvQ3lrZk9XdzZBaTR3RnoxVDRGTEczV1dlTXdV?=
 =?utf-8?B?Z3ZoSUF4MElweEhNQ0RUSGNjWUNFdHVremthRGdKRnBzenJVaXpqTXB0c1l1?=
 =?utf-8?B?RWdlK012WmFIMGlaKysxZDE1MCtXeWR4blh0WHZEU0VvZXQ5TE0ySjF4N0hS?=
 =?utf-8?B?L3hocmQ0dnJTQnpJV3NTb3U4enI0ZFZ0VFlKMFp3aDMxSGRhUzVsQUJDYXZJ?=
 =?utf-8?B?OWpZMERId0RPNms4UnpBYmRIdnMyR3lCbUhTS2hCMlY5U2hGcmFIUExaTlNC?=
 =?utf-8?B?SUZMVUoyNjY4VXIrZ0pHM1JWdHB3cHNONmdKQ0ovK2FvVlBrUE9RTmVBMTlC?=
 =?utf-8?B?dDF3QlZLMHE0NGN3NGcvS3FsWTFKVm5YcjUyWFY4SUxoVkIxc3pGWUxiaTc0?=
 =?utf-8?B?ZmZtbVF3NlFEMUtJRzAyL2lqUk5OcUZPZkRRL3llMDFsVVZoS3NYV2Y3ci83?=
 =?utf-8?B?cGUxbWJrZEFGN3c1bEhtbldSNFduaDBXUy9oK2RFQ3p5Y1lTeCt0TGttZDY0?=
 =?utf-8?Q?9zOYXsVsT6PXgvoG/z3sG/zOp97kucik?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF9A76BB3A6.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3pJSXd4MHFSUjlvUHljYjdTbEdaK081bjRqVmgzdXFNOGxuVmE1RVkxQndy?=
 =?utf-8?B?SFU2dXNoNmk5ai9yWmw4d3ZEZ2ExOWZpMjQ4Mm1CVkdIS3RoQzBYTzlwWTE0?=
 =?utf-8?B?djBHL056Z0xlWGxmaGJIeFpwNktYVTJQOEp6a1phOXRPazcrcWZyT0RucFdn?=
 =?utf-8?B?MkowNnR2eWNSdmltemhobHNuQTR5SkZKWllSNndvNDRrS2NVWFR0VDVjalRH?=
 =?utf-8?B?N01mUlBkM2FRdXZ4WVhZTFRyWE92UUJ1cVYrUERLR3lwWk02cVc4OThYSkI2?=
 =?utf-8?B?RUhwUUtmM3lnSzFOWTNBTWVDeUt1di9FWHBlVkttY0FNZC9vNVpuZkpkTTVZ?=
 =?utf-8?B?aS9ZMllMbGxmR0pPb2lwMkQwWXVqNEN1bEVsZitDTWhmbkgwOTZIY2lWdS94?=
 =?utf-8?B?TzhsNk41SlF1djVjOXd1MWNYMFB0U3M5dnJPTElUTys0eWQvMmloQ3BZUHB1?=
 =?utf-8?B?V3lLbnFVYmhLME1yb0tUNHAyUnYyRmVLVk1yYjNYeiswMy9rVjltRktraitN?=
 =?utf-8?B?ZUVDeEptYlI0WEtIK0xoeEw2MUhOUlBWS1c5azFyTWpqbDQwWjBJWlZiTGsz?=
 =?utf-8?B?dlVvdUpRQXZMTzRvT0tIZEgzTVBzc25pRXlXT2hCaDRYcStwdDNSNG1GU2Jo?=
 =?utf-8?B?ZE9ialdkT0V6c3hTSXhlazBPVXBmaTJGdEkyNGFXeU5Sbko0OFZjZ081Si9F?=
 =?utf-8?B?L2ZYb29OdjBrZmUyRkljbXJMMU42ZWRTcDlCVW1iOXd1SVpKS29TZkc2ZUY2?=
 =?utf-8?B?c2dPNnpGOG5QaWJnZjM1N3h6MEhaMXBOS0N4TWVzZ0NZMDV6d1ZTNktQN3Ax?=
 =?utf-8?B?MUdta2ZjRlpFekNlcE5RdGtpVnZ0ejZneGhvbTdyMEd2ckEyYnR6VENFSEJP?=
 =?utf-8?B?YlIwUU5tM0g0bFg0a1NwWCtRRUlxT0phZjkyNEdGSmxjUnd5ZHVuUlFuQlE0?=
 =?utf-8?B?VklDc3lZRUtIQUkxWFh1NTNsNTJuZ1pIZkl0RE9zRnFXaUZoK3pLRHg5WXdJ?=
 =?utf-8?B?SEl2WkpLaks2U01VOW9wRXlBenZYYStoaGhUNnF6T3JlUEZMeUtJYjRZWmU3?=
 =?utf-8?B?ekJ6aEZFTXRSa2dweWFpclROS01DL2dmWjVMa1lFWk1rdVpzTHVoa2hPa1FW?=
 =?utf-8?B?eldOYzJzMGVUcWo1aGs0NmlmY2xXbE9XTG1pYVRLcTkxejZIdXBtcTJyYmlT?=
 =?utf-8?B?SVUyeHBhSDV1NTQ1cmNFd21wTWZzdmw1NFFGNko3alRsNFVaZW9XenNsZTJQ?=
 =?utf-8?B?dzJaR2VlM0hTUmtSYXR4K3BJZ25qL3Z5YlUxeGZ0WWRCbUVWZGwvTGJHN3cz?=
 =?utf-8?B?QlpoREpmeEdUd1hSTTFTaXhYenBXVVc5dG5Da0ZWQU9iTDBGZ1lEd05tRWhG?=
 =?utf-8?B?cHhoTWtDVHpySEtCOW1IWXNKZzlFYW1uemQrSWxJZGh4cXEyRHB1VDBLYnl5?=
 =?utf-8?B?emZzUW0yOHU0V3dOdDZVOWdIeW5mSVd6ZER2U3VPK3BDZm9NN2ppalRYaXZN?=
 =?utf-8?B?OThaTjQvSW5ibXM3eU1YbTZkWkhLU3QvNWdzalhIZnV3K0ZZb3QvaUN1MnND?=
 =?utf-8?B?SVRPbkNhRkt6MWZ6U3ZuTTE4bERhaVpJUjZwRXQ4RXFEb3EvRHlJaXNNTmVS?=
 =?utf-8?B?WVZiRGJhMUREOHp5K29mTmpRalJPb3ZaUXRDYkNDYnQvdHN1OTAwTFFMcXBl?=
 =?utf-8?B?ZC8xL21MYzB5WmxBS1RFdHZ4RENCb1ZBc3JNMG9zSEhxb0hWWFNDL0llb1FX?=
 =?utf-8?B?d0JINmQ2VEdyTmlEbDZhNVpFaGgxM1BKdEJxbnFpVktiT3U3SlNmd1BWVUd1?=
 =?utf-8?B?VlF2YjJKQjBVNjc4Vmx0VkZqelROVFlqTjk4dEx1eTVhUXZvQ2J5d09hU1JL?=
 =?utf-8?B?SkNGZE1pZWxjV2wxWnpkbktOTEd4NGNRR1VtQkhTMTNuM05WM1NwbEtnQTg1?=
 =?utf-8?B?MFJJV3Jxa2ZJWmxLcXVPblZLQ1JkQmFOK3RoVndHcXlBbUdKcC8yRDBBb3dZ?=
 =?utf-8?B?RnVvcjAxT1FvdUZCSVUzZjRtWVBDUHQyT1IvL2lWZ1RLYzYwQXBlSDk3bmNi?=
 =?utf-8?B?NmpQS2JwTDFmbVlnVmlEUGlDczZ6QnlpMytMWHp3TWhycHltTGdHbTBoTkpw?=
 =?utf-8?Q?ZByw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4a494e-b920-4186-f6fc-08de286396ce
X-MS-Exchange-CrossTenant-AuthSource: IA0PPF9A76BB3A6.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 18:35:33.2261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YspW/vtJ7R7hI+leY1VkXC9Hzw9QV9yR2U121Ano2JNuXWAtIb4+EcKWDcqN8F7j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448

Hi Reinette,

On 11/12/25 18:57, Babu Moger wrote:
> AMD's SDCIAE forces all SDCI lines to be placed into the L3 cache portions
> identified by the highest-supported L3_MASK_n register, where n is the
> maximum supported CLOSID.
>
> To support AMD's SDCIAE, when io_alloc resctrl feature is enabled, reserve
> the highest CLOSID exclusively for I/O allocation traffic making it no
> longer available for general CPU cache allocation.
>
> Introduce user interface to enable/disable io_alloc feature and encourage
> users to enable io_alloc only when running workloads that can benefit from
> this functionality. On enable, initialize the io_alloc CLOSID with all
> usable CBMs across all the domains.
>
> Since CLOSIDs are managed by resctrl fs, it is least invasive to make
> "io_alloc is supported by maximum supported CLOSID" part of the initial
> resctrl fs support for io_alloc. Take care to minimally (only in error
> messages) expose this use of CLOSID for io_alloc to user space so that this
> is not required from other architectures that may support io_alloc
> differently in the future.
>
> When resctrl is mounted with "-o cdp" to enable code/data prioritization,
> there are two L3 resources that can support I/O allocation: L3CODE and
> L3DATA.  From resctrl fs perspective the two resources share a CLOSID and
> the architecture's available CLOSID are halved to support this.  The
> architecture's underlying CLOSID used by SDCIAE when CDP is enabled is the
> CLOSID associated with the CDP_CODE resource, but from resctrl's perspective
> there is only one CLOSID for both CDP_CODE and CDP_DATA. CDP_DATA is thus
> not usable for general (CPU) cache allocation nor I/O allocation. Keep the
> CDP_CODE and CDP_DATA I/O alloc status in sync to avoid any confusion to
> user space. That is, enabling io_alloc on CDP_CODE does so on CDP_DATA and
> vice-versa, and keep the I/O allocation CBMs of CDP_CODE and CDP_DATA in
> sync.
>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v12: Minor format fix in resctrl.rst.
>       Added text about writable files in the info section.
>       Removed Reviewed-by tag from Reinette as there are some new text changes from Dave.

Only this patch needs "Reviewed-by" tag.

Gentle reminder with upcoming holidays.

Hoping this series will be queued for next merge window.

Thanks

Babu


