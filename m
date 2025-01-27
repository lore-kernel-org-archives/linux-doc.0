Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC01EA91;
	Mon, 27 Jan 2025 18:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738002349; cv=fail; b=ZpeoW0w8+nB6LdZov8UjZKsxuxrZbwoF+dRwiBvHrU5RB4dTIzTJRqDIpRf5OpgnrM9xuCnrzMWX3VDIV9D0XIipRLKIz7QXyNZE8Bzm9enfBTeRQuEunm23NrJPooyBhkq2kwR1fCFxBclwRdRVx2pFjr12Y55eKlYAxO4v9+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738002349; c=relaxed/simple;
	bh=gHuIpp+OUOnvOtJk/rzq3Z97TXE4NHuzJkhq3aV9pBA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pDl6uB//+WqGi13/Iuax04qloNSCo0mhRwHUGKdYwUnWWL26lvqMOYjk1XNjShhSJBnRcxSNZN/2LtzJjeHM0ZUSaaXkfZfPScliYmzZLy89aWxwVCGXg9radu8YFhLYGa5Iziw2XizKVVvc08YSICMxIujiQ3Zlma+WdcsHmhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c/VqDcf3; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c/VqDcf3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5w05qi4hjprBNeuLzET/2TvIKIQ+Q6JIlpXYY/ktBsfsj3kMrCQf1nTwfFJRUmS1s85ue1Iiojvo6Na7sl8wJb5XyrKu5QtYa0yhWsVD3HAI3pvLBkJgKkD/yiUlxJdN2b9gL5EtiqZu5kvMztuKlh+LZBO9B7psQHnNc5SR4Oj0Le+XqEhxDILjF+b94rjMjnq6oroPSOo99vWYurLMsADIwwi1PKpuQ9oM9XNJ9NBClT8tXM5fEn5DRelZHRnuG2EQL1xV7FCOTDSrSaHYA/ydaO7u8kiP86BXs5bmiUvdpScV6RqpW9aIDqF6p+CzLRZqsq/xaziYhZ/pAOvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMJNi1QItSyOkFQ5JG99h0STKXVcJ75MnCd2YLKe4LM=;
 b=qVme8/01t2ajutydD4v9OvJlzYwpRzBUPsfAB1idNPoSn/gpICdHK95VozPwjKt0Ty1VS8M/tLt54fB8fJS5IDTC+/8wwX+SGWqfEu22MTl3JTQOY4p1h8MwdDqavassfqT3jQmvq9PwMxMv35rxGgmzF14xvBLbhTDGiS47Vswzh28j2HYeYImctjAxy2lDCFrILAVlEoK0W4/wAYKp9IKQLpHtsB6I/Mcm0COR3tL9+TVj3i1tN/B6xfdG6GzLlXsPnHT7pCPkOz6wX+PFkcbdwPIfUNfAvL4chkm5c7XqRFj/xun8r6FERogUQKki3+TX8Kc/sHDr0/a2sGvTzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMJNi1QItSyOkFQ5JG99h0STKXVcJ75MnCd2YLKe4LM=;
 b=c/VqDcf3HHFVrNYbMH/sagNyGJuCJAeu5Rdhxfi315xiXexcsR8UioAULB8wL5hp3jXk2SseSahRTUvMogpeqTRTe6wSz8YXhOpzs1ccEjVqc+uhcIeFhutG4PWv/BaH8hIw9nrLcyX7XPLgpYNgwiGfzyDQ1TmFuB+/yCADCoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN0PR12MB6198.namprd12.prod.outlook.com (2603:10b6:208:3c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Mon, 27 Jan
 2025 18:25:45 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:25:44 +0000
Message-ID: <faaf5c41-43a9-4138-aa39-6c895930eb5e@amd.com>
Date: Mon, 27 Jan 2025 12:25:40 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: RE: [PATCH v2 0/7] x86/resctrl : Support L3 Smart Data Cache
 Injection Allocation Enforcement (SDCIAE)
To: "Luck, Tony" <tony.luck@intel.com>,
 "Chatre, Reinette" <reinette.chatre@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "Yu, Fenghua" <fenghua.yu@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 "daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>,
 "sandipan.das@amd.com" <sandipan.das@amd.com>,
 "Huang, Kai" <kai.huang@intel.com>, "seanjc@google.com" <seanjc@google.com>,
 "Li, Xin3" <xin3.li@intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>, "corbet@lwn.net" <corbet@lwn.net>
References: <cover.1734556832.git.babu.moger@amd.com>
 <SJ1PR11MB60837B532254E7B23BC27E84FC052@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <SJ1PR11MB60837B532254E7B23BC27E84FC052@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0148.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::14) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN0PR12MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: bd075f72-7302-4f2c-4310-08dd3f0002f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmVxSTYyNyt2YVRteWJvWDljV0gyd3FBRzI2SEdWamxBWHVsdGRiSXY3Ymha?=
 =?utf-8?B?dksveXhibkZmbWhiOGVFQ0dERTFHSHk3bS82SmpCWnNZaWJqRzJPcjRsSDVi?=
 =?utf-8?B?eGZwcklHQjJrRnRFeWtKb0g2OGdXcWZnSGRwN2MyU0szbjRYQVM3V3JwQStD?=
 =?utf-8?B?N1FKQ2lmRU8wbkw3Rm82eTdJWUhoOXdOZ2txdlJLQW8ySGRlT3g2Wk1YTXNU?=
 =?utf-8?B?ajN1QlkraWUwUTJWdHh3K3gvWTRVNWRJeUJqWVNrZGRMTUdyZWFXcC91R1VE?=
 =?utf-8?B?bXBSZ2hhVGxUWUhTMVpMdW00c3ZmSnZoTEd6RlU0NXJwMmlTaDRpNmpFcTZE?=
 =?utf-8?B?UzFnTjVQbjhia2JsNUFFeUMxdHljenlWL1FmenAvbDFkU0diN3VnSTJkOVRs?=
 =?utf-8?B?MHNXUVVOL09HSzh0RnJJRm1rT0NOYk1pVlk3TnBWVDVFejFCajNYRU54ZENX?=
 =?utf-8?B?dnMzbVF2UTltNEtXY1dTTWU2TVhLTWt4K0NSMVo3czZHMzlqWmM3bmZPUUZk?=
 =?utf-8?B?dngwamlyZkNVZ2lmQlRFYlNpVWppaG0zZ3JiRjRwUGg5RndEeTRsakhlQWZ3?=
 =?utf-8?B?RlV3NFRFWGFXTllMYmQwVXJUMEkxYkNzUzdkWVMrS05vc3MyNTh3K0tRUVpL?=
 =?utf-8?B?V3gvRXJMQ3dJUmd2SWlxRUdpSCszZDJCMVJPS3F4c0dqeExHS1ZyZmZZM09I?=
 =?utf-8?B?dU9ZSTFuU3JCcUNpcmRxcngvNmY5QWJKalV3UHhjVWlwR1RJaWRTMklINHJ3?=
 =?utf-8?B?djQ4KzhBakRCTThqWnhiQUUraEYxZVlveXdLc1hVMmh2YTczbmdZcjhlSExF?=
 =?utf-8?B?YlozWVhkdTBQeVhzUGpHR01JVHJvZWl5RWhXMHdoR2lHL3BqaUJ3clJvNjNL?=
 =?utf-8?B?cWx0TXdIeTZOTW9ROUNTTytLTDJaaGQvektud1lLWUR4dDIzMzRiWHExeStz?=
 =?utf-8?B?QktYZFAyOElIQ3ZDdGlNd3RTamhhRjBsRVduc2o5VTJyZEQyS2NpQmlRZGJP?=
 =?utf-8?B?dDd5c0F6aWc5ZXN3RUJVRWFUZlk0UjNNanVUVUFBQllYUzJicmhOSzNjNmZv?=
 =?utf-8?B?TFlzY3IyRU43Ym5qZWtxaVhYRjR6U3Y3VlRGWUpKWUdpdDNRWlFFMHNDbmZI?=
 =?utf-8?B?QWhoU09lSUVOdjJ4Z01Eejk3TUUwWXNwVDlweXJ2OTNmNGNKRHZRVkxOOHYr?=
 =?utf-8?B?UDFqQTlHTEM3c2tvNUs1L25EUmtmV3dKSFJETzNyNTZoaEg5V1hJREx2dGFT?=
 =?utf-8?B?eTZYUUU1MVlQK283dG5xS0lLN0c4amZYK0xaZE96SFBBL21ueG5DV2hvYkVj?=
 =?utf-8?B?OWlON3djazh6ZENpNUlENndzSllXUnZSUU83ckdwOW9uVEN4VDZEMnh1bFFB?=
 =?utf-8?B?MFJBTUNyd01KZEJoSG02cm1ZS2lWUlhxT2s1RTBEZkdJcnl2aXlrSkZhVjF0?=
 =?utf-8?B?aUVQYUpFOCtoUkZKUXZDOE5xejdTNDBhYWRzS0tZYkh1dVN2a2FqV3lxQjls?=
 =?utf-8?B?WkpWVGJEbThYMmc2cDQyeUMyYlQydVpMV3RIMUN6R3hXTFUrMGdaeWFQZ3BH?=
 =?utf-8?B?TXJrdzJpazc1ZEpJQWJadVJuN1NLSFpMR3NBNE1YMWZjTGJScFNweWxpcVpw?=
 =?utf-8?B?WjFwandsaE9ueVhNa1pTZWxPbnFyWXNFbThCbTVSUldMbm9WT0dMNEdGQ0Vr?=
 =?utf-8?B?aHA5aTcxTitYYVhMWFBpVmwxYlN3eEIzQXVwd245UnVhYy9JWDZpRzF2V0NV?=
 =?utf-8?B?eE5pK0kvZ1ZWRXlFSFRQaUJWVXd6QUhqZmtaZ1lncG5sVk05ZjczY013Q2o5?=
 =?utf-8?B?RG9wWG1Qci9XYzFkMjRGZmRLYUV2UVUvd1lKM2FiMVJvOER6Q3VGaHJGZUcw?=
 =?utf-8?Q?+6KD1+s/iHHLw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFZHUXpQdUdYNGNDMGVKdWowRTlDSTM3MlN5dnJnMmxkUE5iVlhaaFlLRHZE?=
 =?utf-8?B?V3hJMjBIOXFmdEJzblZaeHd3azZxM1N5OEQwK1o0MG5rZ0phS29JVFhORUhq?=
 =?utf-8?B?SWVpYWl5NWJ5WjZsM294K01TSnZjbzdBZ0FrN3c2amloWWpEdkczdE1nWlMy?=
 =?utf-8?B?bU5TMnl0UDh0Y3JkdTI3TnFXaDVoMVNiNjZRTU9UZ3RSdGFuUk1HYjVRQUhP?=
 =?utf-8?B?clZXcy9XbkpwR1JQc3R5eUhnRkcrZW40S3hJM0lzVWFYUzBZeTF3MnZJMWRT?=
 =?utf-8?B?TVJVUlBSa0xNZ0tvVUFTeUJUcnNIWmFJbjBEeW1kcE11Rmx6cFpjT1BNeHpP?=
 =?utf-8?B?VDVpaGxadUV6RzZiVHNxNTBxdEtIVWtlNUV6SWpFVWdSakw4Ym8wN094c0J4?=
 =?utf-8?B?N0Z3VUNER3lsQWVEQ3Z5U2x5c2hYT2E0ZjV6QlVTZC9yQ1dTaFhjeno2WCtC?=
 =?utf-8?B?ZWR4bXlRdEZkcnR3eUFmSFlmdHRuMUVRaEFEdnJnRG42UER1ZURYb0RjWFFl?=
 =?utf-8?B?ZzFRdGk3bGFBMWJ3eTFtZWYvZzY4eWVhaSs3a2IyaTlaMnlaU25udjhmTWR0?=
 =?utf-8?B?LzVqaGdBZytmaml4QU9sQVMzY1FkZ2JERUczMjBFUkpzQU1MeTlZdGVRT3ZH?=
 =?utf-8?B?bkZMcExURHpoeWFUTWxSSHI5N1RpMUYzMEE2VGxXUmJOVUJQSEx5Y2pYN1kx?=
 =?utf-8?B?NHRNOHhnSGR0RFJDbUJ4SC9DSHdnajFZdmtydFYrcnVYMHc3aWRhTUJMRDJQ?=
 =?utf-8?B?d0poaXlDV01JSFdzaSsxdjZhRWhSVktXVXcyYWtWdG5VLzdmL3ZINU92aWYw?=
 =?utf-8?B?cllKRjNiSzlRcWtSVUkvaFg4c1p4M0Q5TGVOMkMvRDJ4cHlRUGxtVERkalND?=
 =?utf-8?B?b0htSWJtajh3RjF1dFlpK0xFMy8rSU1nOHhJY2xIL1V4dGVtU0tZTnZIZ29K?=
 =?utf-8?B?dXlNSEsxREVUSDFJN0RCNnpCSFZJckFCcDVTdFJMcWRFMFlqb3Zidm5nOTBN?=
 =?utf-8?B?OFcwTHBpa2g0V25EaUVsVW5ocjF5ZXA2TW9ocWVDVXlTVlVIWE9wNjBEMUxQ?=
 =?utf-8?B?eU00a3ZEYzZoM1ViRjFCWWVsNm81YTNzcUNsTS9nSldyeVhXWmlUemV0ODNS?=
 =?utf-8?B?Z0pLNWZLZlFrL2RnNDVkNDFWM3dkN0ZUa2k2MGVGRHZjb1Fndk5tdi9EbEJD?=
 =?utf-8?B?VnRrUWI5UGRScHgwSWY5QWxsdE5CbUpqTktEb1ludFNsMGFuenBPQTU2enl5?=
 =?utf-8?B?VkxQVkpVL3hRSEtqMm1iME1pM2FaZHNnTlpEcnZXVHdjNDNMS3UzYTJkM3hn?=
 =?utf-8?B?THRLOXRMNWdEQ0kyNFhCdWtGVFJvTUhmMGRLa29NUUpoTGo4bVZWMnB6Nlpx?=
 =?utf-8?B?MmYxdDRTRng0U1FHZ2FVcjlUODdSODkvSFFnVWJUQVFqRE93U2k1M2J4U2o2?=
 =?utf-8?B?cUtzNE90dGppY1FZUWE2UzQ0RlN5V2xabGhjN1grVkI3ME5qcHVkT0JuTnVp?=
 =?utf-8?B?TzcyNUVxV255ZnRyRDBoYnlrUGo5QnU5WElmSkZDRmpTcitXM2MzN0U0eHQz?=
 =?utf-8?B?SkYvdEdTRm5QOVRtTnI1RkZiTXFpR0xoNWY4SXU3ajhiNE1DQXpjM3RZVU53?=
 =?utf-8?B?Qk9NUy9TSDgrMHpkdEhNTzArdURzcmdsMkF5dzE1VEc1UmJSVEpDVlh6aHB3?=
 =?utf-8?B?bXdBWGZNREZibjRCK1V5TXk1NFNKMlI0RVNJV1pkVXUzMWd3a3YwbU50YmZN?=
 =?utf-8?B?SHhqMHhxVHh5blFZYUhaMmRQNHI5MFc2UGIwYy9XSTdKTFBqc2s0UVU4eURG?=
 =?utf-8?B?a0JJbkJ6TTZiazI0d0lCQ2R1OEtONUYrcGJVRkh5ems5bnNCcWh6RzZxdDFO?=
 =?utf-8?B?OWprektCODJqem5rWERwcklQT2s5UXFwSGgwUnMzeGZ1clVGdHVMeHYxNG9y?=
 =?utf-8?B?aDFoNWdDN2pONUtHSk5uY2pRS0ZyeW96bVRnbVFRY1ZzR3BBVThFNmZjRUJ6?=
 =?utf-8?B?NXMyWFNqdFFjeDg4ekhiYlVETkFqNjY4aTFtR2JtU1hIQlNCVEJSTjlhRE1a?=
 =?utf-8?B?Mmx5cXdMdVNpNXBYMDlqVVdmYU94WmlHWkpINW4wSGNtQVl5T1BlS05yZnJy?=
 =?utf-8?Q?Bwjw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd075f72-7302-4f2c-4310-08dd3f0002f3
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 18:25:44.1064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Pauqz+cfP0VLDGvynn7tefRmbwFdCYPelSegIii91Isye2jpgtRW2jSWUJSzi/V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6198

Hi Tony,

Thanks for testing..

On 12/18/24 17:27, Luck, Tony wrote:
> I don't have an AMD system, so I added a couple of hacks to the code to pretend I did.
> My hacks might have missed something, so the below test may not fail for you.
> 
> My test:
> 
> # echo 1 > info/L3/io_alloc
> # cat info/L3/bit_usage
> 
> This gave me a console splat starting with:
> 
> [  163.801078] invalid mode for closid 14

I recreated the issue.

1124.714954] ------------[ cut here ]------------
[ 1124.714955] invalid mode for closid 15
[ 1124.714956] WARNING: CPU: 71 PID: 3553 at
arch/x86/kernel/cpu/resctrl/rdtgroup.c:1082 rdt_bit_usage_show+0x238/0x2d0


> 
> That happened because in rdt_bit_usage_show()
> 
>                 for (i = 0; i < closids_supported(); i++) {
>                         if (!closid_allocated(i))
>                                 continue;
>                         ctrl_val = resctrl_arch_get_config(r, dom, i,
>                                                            s->conf_type);
>                         mode = rdtgroup_mode_by_closid(i);
> 
> CLOSID 14 is my highest. It's supported, and allocated.
> 
> rdtgroup_mode_by_closid() searches rdt_all_groups to find
> one using CLOSID 14, but there isn't one. So it returns
> RDT_NUM_MODES
> 
> Maybe RDT_NUM_MODES isn't invalid in the switch()
> Looks like it should be same action as RDT_MODE_SHAREABLE?

Yes. That is correct. Will take care of this in next revision.
-- 
Thanks
Babu Moger
