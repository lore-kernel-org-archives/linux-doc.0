Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43644A23;
	Fri, 12 Jun 2026 17:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286382; cv=fail; b=rWkhgNDDu5eKUj+e90tG56ktITKak2NBgbmoW3r5B9WUdf0kjEEP9yzycYcmdJar1VUbSYy5JD0HfHOlSSl2OQ8x/xSzEXGApJIVbX1JlkPm2xkqx0W82f4Abl8Jxqm1OHJ/v6xKK82HqkBb8+aMMoJVloJC/QIqIshFXwVg2jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286382; c=relaxed/simple;
	bh=9mX3QXFfGNDUnkCtKi0XCnRTMOW8wFPWCFbDqq0H5sA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iVdmG3nSw6RlbiFTEBbuoB9iswue/WU5YyGEFCirS5USDk3HNNABJKB61ntGMOXswkeOm+hIiCKvgDbT+7nuJYXErJ+zTuCyRAGsvakjI1OnVRWC8Spp93KDO02eC7I3xN6IZOJxx1aT7qWw+oYVBT+iITz/5Vy6jH3hw51FVYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iA4tV4GJ; arc=fail smtp.client-ip=40.107.209.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iA4tV4GJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gdeu5P9xvwQAVNVzYbxPNcSQU7L4i7I6Cw4W4VTAi8WhVuDrSKJdRpAJzVzRRqGcRWUvyeKZl3VmBdOmW9gEZiePuJvRNIfJ8PH1ipehfJwNKEoAJBXhc8w3D9+CCNK8il7wM7gepb0Yk++CTX/JTes5k7EYkGbtGJGWPJpNBy43SQKGp3s53KV7Kr2hfs496ZkybfQmR6FpSRgIMW4SfET0Pd/wHdAb6MxO3Epo+MFB8W2HuHeokzX/sEoELNVPCwhNo8qebMEgv0QxJ+KHSJ6OhB+9PNGP97o8cAsRWW/KIS08tg2ApYDwczQibGxW3S+xDZkluV4i0YUCfOP3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sww8xhZRMRiK3ZLCtBmotjKwgKqi8P5l0BuVq3y6VU=;
 b=MntRyhGN6GGMo0fpByVZbnCkgKZVNeGo+NYpK+vSPbru73zMW1Hxq0IbJ7yFLwFw3NkYXyebU356dsF4iHNYOf7QJF0b7/3t3ov0x/JeuTdZ+JNKEXiZnW+g5yXxsgDUv3hSBy25QbMy2OgZfusqQ+fnT5Ydcm6se/7T7H2N2dxS3BMkc1+TQLu5ycA+u8uNOMWiITyMAI1kEv4kusvpTA8CKUcfAyWERe9Mw9mo0uAKk4+/seSIs5Tg+ciCxHtFX/aA8i8TYFTrnCv/fd9XJ3ML3rkw6rkNgirbT5L+KQb3nJnjcTf7YMmwGnE71fSAZ7GQGCS5Ber6q+24gtLkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sww8xhZRMRiK3ZLCtBmotjKwgKqi8P5l0BuVq3y6VU=;
 b=iA4tV4GJNoIh4Zh4+I4TD7TgG5caJCVHndDZB9BDMWlWMRaPDKXOR8JceV/UCBWU5C1uTf0LpUa91gWSRTAskene9XWkM3PmPVVfbISzfADKPywodhBQf9Pt9pFRCA8RQJ1Vl/MntPMoOVOlrmrehwHuzQJgkN9ipzz+vMzF450=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA5PPF7D510B798.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 17:46:17 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 17:46:17 +0000
Message-ID: <bae9c987-1291-45e5-9307-9a3999287158@amd.com>
Date: Fri, 12 Jun 2026 12:46:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH v3 02/12] x86/resctrl: Add data structures and
 definitions for PLZA configuration
To: "Luck, Tony" <tony.luck@intel.com>,
 "Chatre, Reinette" <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "feng.tang@linux.alibaba.com" <feng.tang@linux.alibaba.com>,
 "dapeng1.mi@linux.intel.com" <dapeng1.mi@linux.intel.com>,
 "kees@kernel.org" <kees@kernel.org>, "elver@google.com" <elver@google.com>,
 "lirongqing@baidu.com" <lirongqing@baidu.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "alexandre.chartre@oracle.com" <alexandre.chartre@oracle.com>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "Bae, Chang Seok" <chang.seok.bae@intel.com>,
 "kim.phillips@amd.com" <kim.phillips@amd.com>, "xin@zytor.com"
 <xin@zytor.com>, "naveen@kernel.org" <naveen@kernel.org>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <e84fdbc324b312ff137d279ec154e3827c0aed81.1777591497.git.babu.moger@amd.com>
 <db9c0b3e-184c-4100-b59a-91f6e818fd31@intel.com>
 <SJ1PR11MB6083C069F99FAB8A0BEB8518FC182@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <SJ1PR11MB6083C069F99FAB8A0BEB8518FC182@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:806:121::33) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: f08309b2-69f7-4c83-71f0-08dec8aa7ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|921020|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	fXcp9xoPVTpzPxkR4dTYaZHKpYmbGG1amYQKdG39lxIOezDqFXbN9w/Uur4HboRg66QLrngz3M83nu0jzr5LnTmzw59Jcxyu+54MAYjP0qMM5iWBDQYUmOD7XOhjw8PTRLYrJSG23I8clp5ZUmOzYuA3GMIv2ylP8ppp8Adm/spQHhrTVdJXkWWlSlXXb2BCQ5Zmlc7EUoNrVMzJ9717c6bkZqFivFtvVmKjE5+1YFzQYbZ12CAIR6TCCzxv/sa81lKmgDPpyOug5CpIg4SJJRSAfolwjR5At1lGedoKb9p8PQ69GYSr/x+6W19Ml8YR/KDU0nXcKp5dFfnnjRxHewgyLdqkbgBnwJS7TVN1sKRM4EFjBj1EEKTeTzvRHEq7y9y8Tjom8EVeocKiAlxxtAy6G/1vOLp/T3Gazhz4SjYRiAD2urP3F7ZOUKSqBCjE+3c/vhnZZQkJwb8A81aoMAJB7gZnCxW72ByFnQNZV/Qwb1SY92DdDKWkPD8Istzk4BrWnRf4dllidxj6dMU0VDSNOA+5J3Sj+PC5cNLUctmmiPpEf5Uv071ljwz2Y/q2ln/MU0HfejGjbA3/fud15kVdL9/+RhlcNWRB5mMOmIKskckOYcJMNmlmeOdvtPGDdfls0I+d/0SLqjf0EGqqmrbHdCe8fC9FWWKOB5GlxMEk5CxPfYey10OERt9nLHcgCzQyzjU+d2u7+dn3Ad7WibhigemABN1HD5GtLmjlmxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(921020)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlI2aExCSVB1ZVRYVU1FOTN2b01KUlpUSmxqKy9YQnZ0SDNjUUVQT0NrWFhP?=
 =?utf-8?B?a3pkamZ4Q2U2VmVrb0R3b3FKZXFFZWZCSnI0M3BFWVIweWEwVFhVVU9pby9t?=
 =?utf-8?B?U24rZ3BpdkExcXNkZUNMOGlPdUlDNlhiYUJLMnExbmhzenR0Q3RKUDBGSVhL?=
 =?utf-8?B?Q0htanU2VWIxdFRsQlk3L0dNMGRzVUd4bVR0SzMrUGZETG5DV2pZQmovMVdG?=
 =?utf-8?B?S014MWFrc0l2TDNpRGgxV3k5amhoR2lJRVhsTnhobnN2ZVQwZ3VNYWlnK3Iw?=
 =?utf-8?B?LzZRRnIyTS94cEQzUW9Tbi9QZ0NBKzNndHI0THdJOXhOdGNiaXNDMXZJYkRa?=
 =?utf-8?B?TC9xN3Y0bTVpeHVySGp0VTdzQmRlSlQ4aWtLVFlwS2VhSXA2UmIyODNpeTR0?=
 =?utf-8?B?YVJOMHliSUxoNno3dDE2WWw5cHRTYW9HTDNQdXlxY3p5L2Nva0sySDVZOE15?=
 =?utf-8?B?OTNaNGxVOCt1WG84bjJXM0o4clBYS0Y3VzVLL0J5aDNOaldibG1QamFoVld6?=
 =?utf-8?B?anBNb2RQdkFUVXVPelQ3TWlHU052MEd3UHZtVjVnajFJRDNYM1N4MGNIQzdC?=
 =?utf-8?B?cmRRa3lTM3NWdEFhQmtBalMwNFRLMVc4V21Tck9STkM4MlZiblpLWjBpOGpv?=
 =?utf-8?B?NyswbWtKV2VWT2dVZGI3dWlPNjN3TXpOMmpjS0JHR1RRTEdyRkRYYmdJWjJ1?=
 =?utf-8?B?VCtneE53STFzMTZtZEh5MThLWlRITU9INXd4OVllSzdIcWlmUTZYTXBwNnll?=
 =?utf-8?B?SWJ0dlRCSzIyMnB3S1pUM1lTeWZpYXl5WkpkTEJ0dVNQTXRBczU2ZWlIemdk?=
 =?utf-8?B?YUxqQ2Y0eVpkRDZQd2YwRzJFR1dXU0hZRjJJRG5wM2tnYTRhSEtISVlLSGxz?=
 =?utf-8?B?SkZVSjNaQ3dBRC9IRTkrb251aXdTYWR5YkVWYlhxek03eCtZYjhrQTB1WjFw?=
 =?utf-8?B?cnRqdEEreU5kS0FkNzlUcVZjUXI2cExhMEQrTklqaFNYTFZaMlhpN1BMZ3Ew?=
 =?utf-8?B?UCtQL2xoY25ZNWJyem5QWFRLSWp2Mkl3M2tjNFVjZnMxeHAvcWF1WlY3MHFn?=
 =?utf-8?B?Rnpld3JFeUpvcWpyKzJmWmdoRWZucWZjanhvbTNHSlNlVkl1V3VJTDRpeWJj?=
 =?utf-8?B?M3RwTzZPdHU2MG5sZWJ3dmU5a3NsSTdjc3YzTFNLczlkWTloam9ZaUUrUGc3?=
 =?utf-8?B?SUFEN0E5VlJaNVhnTnlqdGljODlkNGVmTGY2R2NlbFZrOTNXR3FKY2RwWWZE?=
 =?utf-8?B?cTlYY2hSUkh2S1lVUFVzZFhKYjlubis3N3I4Ni9hdnZScGdKWWk1QnJJOGMx?=
 =?utf-8?B?Y2d3c0Rnd3REODJuZjgwRG5QNVBRRm01VHQyRkwyVDFySzhVSnBPUFB3Rjcy?=
 =?utf-8?B?ZkdSSTU3R2VXM3RmbEtZL1FBSDl6UGQ5NEpablNXa0IxQ1J6Y1RTR3NHNjNq?=
 =?utf-8?B?VGkwY2Z2VlZLcFhQbk9MbzJ4Tk1sUDF2cCs5WXVnQ0p4bmUyVUhyTk9lYUpa?=
 =?utf-8?B?YWk2NjhrRVU0M3FndGlxQU9JekJjZjkzTEZHT29NamtxUkxQREE0eUMwM0xV?=
 =?utf-8?B?TCtqNFVLTGExcnFlNTZSdkxycWNnZGxyUmNYbTdJYmNSMVVoM1BZZTkvQk1w?=
 =?utf-8?B?OE5XMDYvYnpMMjRtbmFGR0VINklvSzZ3bVdBMzNkRzNNc1pLaTFtVkY0VVdM?=
 =?utf-8?B?VjNKQUhxb0FVdGoyZVlSSENPSHRGT2Nva0NHMTZ3dlpZaVdJaEdFMHllK2lm?=
 =?utf-8?B?MXJreGFsU3NBV3c1RER0N3dudFpXdUFTOXJ6bDhLRGZ0bHJWdWx4SHRCRGFK?=
 =?utf-8?B?emh0Yk5JT20wSW9qUXhqbm56SHZMMXVvU1pzNi8yMmxraW9YQVFrMzhHbzVE?=
 =?utf-8?B?WXFrUDZXOWFYM09TTVZ1ZHIxUTlleUMwK2FLNkdzVGZ0NzYwTHlEb3I0cllw?=
 =?utf-8?B?T1J5MWhvY1RCaVhaYW0xaWx5SUtwS2RXby96Ri8xNVRJaTBlaXRINVVkaVp4?=
 =?utf-8?B?WWF3YUpwV1JOcmE3ZWU2Wk1kSGljK3hVbGhRUHY3RFlFY1V1VDV4bkFBeTNv?=
 =?utf-8?B?bklnUzd5SWFJandWRHlkdlA3RkVYMTU4MGN2TkNpY21xdVFkS0ljVzJjeW5S?=
 =?utf-8?B?TE9ka3BjYkxOVG91YXcvWVFJSDIyczVMYUhPckl6ODg0WlJMclRDTFZ6Wm51?=
 =?utf-8?B?VHJDMFlZcEt3dmkrU3BFQmVYV29ZYlpidTZvNHFRa1B4ekhkQ2paM2F5M3Vw?=
 =?utf-8?B?c2VqMlkwVStTYkxlM2Y3UXg3RjNMZWp4ZjJsTkxBbkV2SUhaaHhmSU9MRksx?=
 =?utf-8?Q?YUEaHVPALzGC2ibkl4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08309b2-69f7-4c83-71f0-08dec8aa7ec9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:46:17.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0G6zXOI3Yl22xz7clZWvdWFlhrDPUQm2n4vL4dXishPyhWlHAGtI2xRr/bNPztmh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798

Hi Tony,


On 6/12/2026 10:40 AM, Luck, Tony wrote:
>>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>>> index 9dc6b610e4e2..623628d3c643 100644
>>> --- a/arch/x86/include/asm/msr-index.h
>>> +++ b/arch/x86/include/asm/msr-index.h
>>> @@ -1287,10 +1287,17 @@
>>>   /* - AMD: */
>>>   #define MSR_IA32_MBA_BW_BASE               0xc0000200
>>>   #define MSR_IA32_SMBA_BW_BASE              0xc0000280
>>> +#define MSR_IA32_PQR_PLZA_ASSOC            0xc00003fc
>>>   #define MSR_IA32_L3_QOS_ABMC_CFG   0xc00003fd
>>>   #define MSR_IA32_L3_QOS_EXT_CFG            0xc00003ff
>>>   #define MSR_IA32_EVT_CFG_BASE              0xc0000400
>>>
>>> +/* Lower 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
>>> +#define RMID_EN                            BIT(31)
>>> +/* Upper 32 bits of MSR_IA32_PQR_PLZA_ASSOC */
>>> +#define CLOSID_EN                  BIT(15)
>>> +#define PLZA_EN                            BIT(31)
>>> +
>>
>> This is unexpected. So far resctrl has only defined the MSR numbers in this file, not
>> the individual fields. This seems a legitimate use of msr-index.h but creates inconsistency
>> with how the fields of the other resctrl registers are defined. This may be ok so I am
>> looking past this for now. Since I am not familiar with this use I am looking at other
>> patterns of this and it seems that the register fields are usually defined right after
>> the register to make this relationship clear and also use more verbose naming to establish
>> this relationship ... I do not think such cryptic names should be used without context
>> in such a global scope. Please compare with how other fields are defined at this scope.
> 
> There's also patches in flight to treat MSRs as a single "u64" and move away from
> the low level implementation detail that the RDMSR/WRMSR instructions split into
> upper/lower halves.
> 
> All the kernel interfaces are moving to rdmsrq() and wrmsrq() (together with related
> functions).

Ack.

> 
> So maybe:
> 
> #define PQR_PLZA_RMID_EN        BIT_ULL(31)
> #define PQR_PLZA_CLOSID_EN      BIT_ULL(47)
> #define PQR_PLZA_PLZA_EN        BIT_ULL(63)
> 
> [modify with whatever addition prefix characters seem necessary]
> 

Actually, I don’t need these changes anymore—they were carried over from 
a previous version. Thanks for making the updates, though.

Thanks
Babu

