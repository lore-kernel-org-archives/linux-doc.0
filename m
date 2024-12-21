Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1FE1F2C36;
	Sat, 21 Dec 2024 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734790839; cv=fail; b=TkJ0xVsMtc2cJD0IcHaybdExir+7eZ0eJrlGV37Lkdc7yKWjSQrBqrBsnNeS/DpCDg7bqC7fd3n2v8jI4iUTCgZtqaQapsuYeTUFhBZAB7m44ENIEZJTsMObDhd4psVrWe7gW/6ctj93j5QULN/xaN77LBjPYQO9ZjfyJuNT4jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734790839; c=relaxed/simple;
	bh=yPsRl/iZB7Q05Gfcabbh0GLKNo3eesOX23D2lk1UYqA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qVqpi5OtuaoR1WezxKChPBRSf+MwJBfxRePovy34mGx/fuAIDhuueK+S5bXuzjFm87e1hqANo3sFgOQ0ak9sHpDjD4J2rUQhKiAD8PA9iZvGIOsee18ynQ+q+ec9B5XAyZTGugwlcqBGmGqv9edhZkvq1qCb4SSC1jtuJonQ4tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=btv786/D; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="btv786/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKb2FbVO6n+7SHrvl/8OLtjugyd8834RD+fHxDYkC0GdVe6GJvV1qmLa2QVgph9zdadtc2Sa63g6f4x1ymLMdcNo4URF3uOx0R+v52ykw5+kORjnsCdvfYSZTjsUg0oKFM5cUdF0Wv1AKJDpGmiE/EMmj/4usIW5fBXfjaF3XAI98dv/qoBF/fmMXc0gEtk4C1aYKvgvuyqbWnvCNzqJciOlv7PpEBYs94C+PU+3S0vMQnhP5dy4RVVqFOG/0eTma/9/UVvab9VJSyWWJocmNldaYBV8DzoZHDCV/F/0jXuDHr8yT4awGktQzuExWW9kYeQUQj8iHfqk3coodLV7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/Tqu6H6QILBHpXAECMI2nPJRS1byexn/xP9h+UDZIo=;
 b=BcUIs7/WkMzhZ+nfL7jjuv3dQ3vbDSC/jBAk8W1ye8gAlrPWOlM9se7lJVrP6td7bjICGqANHpBVMQaSmXeEt+CuyoSIVIKQkQdR5gtA9r57dz8pStGATpl27CBlhGimFykSTDgpdsgJr0LUXLV5kX5sHZQbAGfcO6WgZK9h1Z6sKiKmrTsaefX/oGQOEI07QUsLlF3OWMNVXO4eWT2jCpmibT6BU3Yni2YTeGLmuNlmGdGZtiJe5tnCvcvlk8TNrN7NwcsB0HUg+qMF9EmgcujLLcZazLmfw4kIvbI9bO9xan0CpNeuHVM/qwYcr/OsQ2mI6RJ6KGMBV6HXmtnRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/Tqu6H6QILBHpXAECMI2nPJRS1byexn/xP9h+UDZIo=;
 b=btv786/DSJREplSV/Y3greQQTbHUXnbWpuaxKrrv7NN35hoU5eC8In4b9mmmkUkHVT6rZszWmOZf8+R3bYXQ41YifUrZ+dvmu/Bc3fHZ3Y8w/q4OZ5HkzdEDBygDvK2wsreP0w9aqLBDQnF8/EwQCuS5docYhSFB6az6PyXVNiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ2PR12MB7847.namprd12.prod.outlook.com (2603:10b6:a03:4d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Sat, 21 Dec
 2024 14:20:35 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 14:20:35 +0000
Message-ID: <156e6bb5-650d-427c-8750-28b2d03cd587@amd.com>
Date: Sat, 21 Dec 2024 08:20:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 20/24] x86/resctrl: Introduce the interface to switch
 between monitor modes
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
 <874347c318853ccaafc7efae79093f2a394bba77.1734034524.git.babu.moger@amd.com>
 <270bfebe-9a6f-4606-bb0e-c798e0984d3a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <270bfebe-9a6f-4606-bb0e-c798e0984d3a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ2PR12MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 47702a64-c2fe-49f4-f3ae-08dd21caa2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1pRUUJNTTlkSzJCU3ZMdHlmY0N1aFptbkZIWndFMFd4R2ZOakhIN1hvenFU?=
 =?utf-8?B?bHFVeVBHNDF0NjY4VFVrdVBCbnRFSVBIZHc5MGZxbExSUU5vYTB6Z25mNEM2?=
 =?utf-8?B?R0ZJVnFTeVc0Ymp4RGN3R3I4azhyaEVQeklaakV0dmxSWXFLaFc3Nmd5K0Jz?=
 =?utf-8?B?N00xNGFNcTdXOWtWOVJ6VUdjZGZ5d2tOMVB2Sk5rT0tYVlMra3lad2RXcWRP?=
 =?utf-8?B?V3dKdmF6cVcxRjA2L2tGS2NjQWhFUEkrNnJ5MGNKY0ZvUmRoQ2Z4Rk0vT3Nv?=
 =?utf-8?B?MFY1dVVjSFQ0Q0o0MUQ4c09od2FiWUw4Q3lCbG96cS9hMENuTU1ObVV3OWsx?=
 =?utf-8?B?SFRUcDNHT3YrcExsNUJ6dXJmQ2FCdGhmY2Qxb2hvemh3ditwZHdBVDRhVjlr?=
 =?utf-8?B?OENSbU9yYjA3VzZKWnN6elpESVpQcS90bGdnKytYdjF5K0Vkdm9nRjdIdUtR?=
 =?utf-8?B?eWdmc0ZIRDdRYnlIMm5CZzRKVmVGYkZwTWh4bmZPbVBVd05ZTTArNWc4UURD?=
 =?utf-8?B?YkJYaHZ2ZVhSQkN4NXE3RzYwRDh2ZHltd0dleUo3NzF2MFpKRnp4YVdxZk05?=
 =?utf-8?B?REdSTzhkVzdGWlBiSWswdXhWbFdWTGN1Y2ZhTFZFcjdKYnYxS0tON3ZjQWpk?=
 =?utf-8?B?cmtvTEJDZjB6N2ZBemZsMk0wTUM0NUZ4elJpbFBmZXJhS2pKOFV1U3J2REUr?=
 =?utf-8?B?U2hvT3ZGYTE0TVhkSUthQ05FSmlrc0ExUVVxai9PY0VZYVJ2YTRFaFlhcEg5?=
 =?utf-8?B?S0dxdmNYdVUraTZXQUJTbE8yenlOcS9YWG9TNXFYOXozTHE5K1QzenNXRGoy?=
 =?utf-8?B?b28vNXhaU3lCWHZuaHI0K01BMGZ0U2hURDIvVkhuM2lEQWlQMDIvelhVeW4r?=
 =?utf-8?B?WmJQODNOd2JMKy9RMEV3U1NYRDZmRCtZdTV1QTdsS0VBNmRyQ3ZCWTEyZmt2?=
 =?utf-8?B?MzRXczBYMG5BU25mY0ZXUjUrZ25hams4dlh2UWtMMTZnMHk3OXJ2SWV6cFJ6?=
 =?utf-8?B?dGM1bm5mNUtmeU1QU3Vyc2ZxbVZJZXM3UmM5QURPQ3Vpdng5RVJpMEJWR1pP?=
 =?utf-8?B?aWM2OTgzY0M0MkJuOHhFYmYzRXE0R1B3cmlhM1J2eVI1TmhJbjlibzc1c2pZ?=
 =?utf-8?B?TitwYkVwUUttUUJuMExwcmtWUTd2QmRzMXhHSmx3S0pJWEpwR3NldTUrQ2xv?=
 =?utf-8?B?N2ovc0FROUJWQ0x0NnFSUnQ2T3BVS1ovZDFaRSt4dVRnU0lLYnR2TlRJeXRF?=
 =?utf-8?B?ZDZGbVdkUTVEdHdXbDk4RVJnVUhEV0x6a0xVL0EvREw5WjgwZFl3ejhqV1pP?=
 =?utf-8?B?d1Z3dWRBb0hIbWpJWlNpWkhVU0JqWlBRankrUUp2c3QwWENTQklNTWlzZDZ5?=
 =?utf-8?B?RFdPeFVmSjg3ZlA2cWhCeDJXcGxTVzdvYVA5VnFkaXBXQm14MnZrY3JITnA5?=
 =?utf-8?B?Qzd2MFI5SU8wRURNWEhYUjBLRFVaeWZoQ1NFU0FHc3ZmbkZnbTd4TUZXN1Zj?=
 =?utf-8?B?ZWlheENKaGtTcVZ0TjZGUHVscnV5Q05PcTl1YzVuTUJJU1lXRUNUTE5xTC9Q?=
 =?utf-8?B?RW5NQlA2TDdCRDNpeGhlSU5PallWRXJvZVZsVTVITGMvbzZ3VmIxMHFFaXk0?=
 =?utf-8?B?d2dWZWkvTEEwcmswMUI0U1dPREhFM0ovN1o5VTcxQk1NcFhHaWRMVnduM3JC?=
 =?utf-8?B?UEhMZ0RhZVhTcHFDTDF4ay93MWQ5akExOVMrN2dsYkY5Um9yaXZVQ1E2MzUw?=
 =?utf-8?B?c3orU1lxcEhkd1BzSVBUdndVRWM2YVVPRVBIaDhuWk5jK2VnTXZFbCtBV1k2?=
 =?utf-8?B?dzU2UC8xVXpKK25RaExoMjVtK2NQZTZ2bTVjOVFaZEE5cTFLZFl0bS9ZODFu?=
 =?utf-8?Q?H+/0J5S1UZBHa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3pFZXdPcWNrekY0UnZheHJDZnovNkJrYnJrN0JQQ3dWV0xIMmJxSE1pd0Zt?=
 =?utf-8?B?ZEthZXpORFEvcFlTZStuQnc4NGZ6d1E1dlIwZzhtU01rNVNWR0IyUUlQNEcy?=
 =?utf-8?B?a0I0cCtFaWZFT2lFYzVkWnk1dVZlNWtyMnpwVFROdUtZd0Q1M1ZBR0xpUWNG?=
 =?utf-8?B?YmpsNi9hY1RIL0ZvWnI2VHhKcDNxZzBmUk82ZDE5aTRDMW1rQzl4Ujh6Nzc2?=
 =?utf-8?B?YVdFOFEwZm9LSTEzWEg5VGVyelFxT0l6aFFUekM0MjF3R1FIbUdWalBYOUcw?=
 =?utf-8?B?am9ZTEFqd2N2WkZITHJkbGlhRWJRQy9pdkY2Y001b0NqZDQwOCs0Y0cxQ1dL?=
 =?utf-8?B?bzZBSTJxT0taRW0xUVl3YWRFMHc5MkVDa1hFYlprYlhNMWMrbVlHR0dROE16?=
 =?utf-8?B?QjZNUmhWbmt0eDBwT0hLaXZvMnRxWnZiMVhBMVpWTklWeGRVN054NzEwWVBq?=
 =?utf-8?B?d2NWWkppWFp3N05vb1NjOEtoOUJ1dlM4cGFRU2k1NDR0MkxaMlozSFpqQysx?=
 =?utf-8?B?cENFK2hNM21EOWVrTWpyWTdVZ3NjRmd4eEF0U0hrdDJzeCtWMWJsRno3bThh?=
 =?utf-8?B?VzJtK25kZVFEY3hzOUJxUHdVQWJUTm5lMmlydmQ4MXdmRlhxNW8xU1lOZFJh?=
 =?utf-8?B?Z1ZMampqVHVvdW9jQTJ4eFFDQk1UZmM2RXVlRDhybkJkd3d3NkVPZlZtcVdo?=
 =?utf-8?B?RDZIODZhejRweTZjKzBWdXNpcUFYWHFPczExZXpCVjRpcGJQVStqU3ZOMExm?=
 =?utf-8?B?ZmJtQUwxUEJVQ1VrdnlOcVZXME5MNWJMdXptTEJSaHdrbklvSlZ0V0tEcEtD?=
 =?utf-8?B?MFZPSXhqT3lvNUVWWVVpMDN6ZE45Z3hmdnBkQXJoc1RsVmhFVTl5bjRWNmhW?=
 =?utf-8?B?RHVzMkRqRXVHQUk0dE5ObHM1V3NBaVZTSjlpZzRyeCswcWd2ajFMOVJOSnFQ?=
 =?utf-8?B?R3c2aUVVMGJxRzN2TmhDWS90NVdGVlBPV2NGMGZRQ3BKUU0yL2dHa3E0QUc0?=
 =?utf-8?B?N1ZBc0dXV0YxcjVnNnVxY2RjWnh1cURJQVliRGI3R1VMU0o0V29tcXMvOXFm?=
 =?utf-8?B?ak51ZUhFelBiMy81SjBQZ1Q5d3FKRkx4dThnOU42NHFnNmtnaWd5eFhFKzEv?=
 =?utf-8?B?U28xallUc0pwV0F4Zk4xTWJGc3NVRDMybmxmeGNZMGIwWWlFVDdyZEhMR3VL?=
 =?utf-8?B?NEVMODFqSjZTd2FoRWc4N3ZwVzlHQlRuWG1rOHE2SHBXQjkwZXRlYmxoOEkv?=
 =?utf-8?B?VURieTc1VzVkZVlDL2ZwdUx5VVRmeG5YK05DU0M4cWhsRkozMmxTdjc5ZGRR?=
 =?utf-8?B?ajV5cjAzbDNMcy9IZmRlTjNZZ2IwaXoxejRONUlSQU9oY09Xci9QczVkTnRM?=
 =?utf-8?B?aVJaOCt6MTN1YXloVXFrQjI3NlBvZlBXYi9lMUVQNVpwQWJVMmJiakllblhi?=
 =?utf-8?B?Mnh0U2piS3BYOEVvWUVudS82OFVIMzQvVkpZaHFvTnlNaHJIa1Y2RXVvazRP?=
 =?utf-8?B?U1lPMkpZZzlLdi9HRTZycVZJMWl3UWdMV0RCN2JadEhOUmRxTVIrVEVzcHQv?=
 =?utf-8?B?NEgvNTFFc3hnQmt3ZnA4YkxSZGlia0ZFditDZ2RHY0hicVc3R2ZLSjdjUDRy?=
 =?utf-8?B?cExOUnhRMTJRUDZWL0ZsNVg0em9mYkptaC8yQVBOcVNJUFdVTEtKZjlYcG9n?=
 =?utf-8?B?K2RUNlpoY2dudmpNdFpGcVJBR0dya2R0Sm9TSzZWQWlPeUQ3VnZJaVlFT0sz?=
 =?utf-8?B?aFp4SjVKeStQR2FzUjJNWE5WQW90WjFOQkJCZHI2MENjQ0c1enBHVkM1SzJn?=
 =?utf-8?B?R1BFUFRHQktWMUFBMG5QemdDQk5WMUVsZE9keGNrNC9BLzRVaWdEZ2xwMlBR?=
 =?utf-8?B?SlZpYWN1ZWd5cFkxQlhISDIvU2tHcVdONGcrenNVdGthYjU1TUE4RWtjSHY0?=
 =?utf-8?B?dVQwcEdPc0RQTFpwTE95bm0rekw2VnRqblVhRzdLTzgzbmRzcGxLNnlXdWxw?=
 =?utf-8?B?bWdTTXpTaDlSaVVnQ283VnM5WTlwWTRLUVJ1bjQzV2dnR09EeWZtckJ3K2l4?=
 =?utf-8?B?VnZKYmppVEw1ck41SkFha3FOWlhhUVVRdEF0YnVjRE40aXU5dzZmbzR2SVZR?=
 =?utf-8?Q?P4SbSntFrdAlXjSHyIG49+aVH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47702a64-c2fe-49f4-f3ae-08dd21caa2cc
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 14:20:35.6391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4itvlMlB+Sslk6rmWMiXQ4rRTkYOPVbZWLnHyyjrYuc3TLEctoWpn7yvVQYWne7T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7847

Hi Reinette,

On 12/19/2024 8:56 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> Introduce interface to switch between mbm_cntr_assign and default modes.
>>
> 
> This changelog needs context.

Sure.

> 
>> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> [mbm_cntr_assign]
>> default
>>
>> To enable the "mbm_cntr_assign" mode:
>> $ echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>
>> To enable the default monitoring mode:
>> $ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>
>> MBM event counters will reset when mbm_assign_mode is changed.
> 
> I think it will help to elaborate on this.
> 
> I understand this as two parts. As stated, the hardware counters
> are reset since that is what ABMC does. In this patch
> there is a mbm_cntr_reset() but that does not actually reset the counters as
> the above implies.
> Instead, the counters are automatically reset as part of changing the mode.
> resctrl triggers reset of architectural and non-architectural
> state of the events because of the hardware counter reset.
> 
> The changelog can really do more to explain what this patch does.

Ok. Will do.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
>> ---
>>   Documentation/arch/x86/resctrl.rst     | 15 ++++++++
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 50 +++++++++++++++++++++++++-
>>   2 files changed, 64 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 3ec14c314606..d3a8a34cf629 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -290,6 +290,21 @@ with the following files:
>>   	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>>   	there is no counter associated with that event.
>>   
>> +	* To enable "mbm_cntr_assign" mode:
>> +	  ::
>> +
>> +	    # echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +
>> +	* To enable default monitoring mode:
>> +	  ::
>> +
>> +	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +
>> +	The MBM events (mbm_total_bytes and/or mbm_local_bytes) associated with
>> +	counters may reset when "mbm_assign_mode" is changed. Moving to
> 
> After looking at the final documentation it seems more appropriate to move this to
> the top of the "mbm_assign_mode" section. The top already shows how to read from the
> file using cat so it seems like a good match to document write to the file in the
> same area.

ok.

> 
>> +	mbm_cntr_assign mode require users to assign the counters to the events.
>> +	Otherwise, the MBM event counters will return "Unassigned" when read.
> 
> This portion can move to the mode it applies to.

ok.

> 
>> +
>>   "num_mbm_cntrs":
>>   	The number of monitoring counters available for assignment when the
>>   	architecture supports mbm_cntr_assign mode.
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 8d00b1689a80..eea534cce3d0 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -939,6 +939,53 @@ static void mbm_cntr_reset(struct rdt_resource *r)
>>   	}
>>   }
>>   
>> +static ssize_t rdtgroup_mbm_assign_mode_write(struct kernfs_open_file *of,
>> +					      char *buf, size_t nbytes, loff_t off)
> 
> rdtgroup_ namespace is not appropriate

Will rename as resctrl_

thanks
Babu
