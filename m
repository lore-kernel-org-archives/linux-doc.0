Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98FE3815FB;
	Fri, 12 Jun 2026 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283628; cv=fail; b=fJMIbVFz7HftK0wIfx2HD7sWE/1w5H6MOyEeQr7byT8ocW9vLqgJNNlUGkcfLmYf0SQZf/EQX7r41/nIjP9t9ooKBjkk2TqOqI2osslTLiqL3fF0DRwtJNjeoj8dh9nopbyTRhXL5BR1pQu4h1qdnQvwFnBtVbRaG9Znxo/Qeo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283628; c=relaxed/simple;
	bh=MMK/g8rNZ28ip3pG8E1lQhL+z0dFeEOnsLBYDNr3Gk8=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ls8gqa9QALHMSwyiMexhetQgwQgi8odA84SKwNNvfptrNS8nk+DjKu2GfjRoPDwXt0QCoaSYi+2w1NobV7j8dQdTOxYhlLaXW+0TnJ5ek7jG1ZZVO0qeP5NZsMq8pAmf9OJDkPe4q8BsgupMssr/c6IE4wBIZAknKn/kfGxYiws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EcFqm7mD; arc=fail smtp.client-ip=52.101.46.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EcFqm7mD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJNcP7veR5mFfhi6vratBO+e6X2P/Nagg+oluJa4DfC7NN+AbyQR7VIsZ1AEt2koa8cmm4uh9ptGp6Z7JeQVfYpAj0xmcVd9IWRdi0q2pjWWvvGO+vmQW+ZZurpLbUVIz3SWxBbq56WDjKfwTcI9LpQ09SAR6L2ku2rigC6vAY+t3SL1CSAi9Rbj9XnmSo5HY4ypoOVSb9qcaOsE6U2m35iM2SAYPjDdjyzF1FX/E/Fp0ZrcUtJ+iyX3NM0y3PasXp1GdtOu24jk5M9mjU9gKAs7ae8N5FIH8facyqzOmqBiO1lATBL+mW3T58IsrQ7ciDDCvTx0Y8kq2+c0jCEH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO8raafiy3bDxJOizswybXolxCUgZqHi2DiqFH+q7jY=;
 b=e4X2s/HxHY2Uc579LhJxPte29O4tP27qK5nW6uEjX9NmsMfwTN9vWYGk+6uIdhRZjCq6Kt9+hz6CF5RtXc8Qk4/07f89aF1wYs1pNRNnm2wZ5AZHTZCZ1h9wAnzKX++ZoY6u6z8l3bZv1FecVoOYE2tlWsD4fuM/5MUODfLy0oF1rCrSWRb28PtOPjqltEQ3i3McNwRX2GqWeW6WJpPEB2AiC3tmMJP6awUA229pglo3I+kveV39PtYgTeGoXa7dMOqyx2Cm/bYBe5Rs6js7dE0N71zr+35dh+jdubznabi/e5yr52LlyvSB2RlTE4FD1d8nyrdKRrpe7cRTJyDURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO8raafiy3bDxJOizswybXolxCUgZqHi2DiqFH+q7jY=;
 b=EcFqm7mDK8Wy01DE09gQmafV0zx0WYx0iDAt6yVzNbSkBLKCpGReR/AugQwlJ0J9dT7C46G4eCuAdgfsvmwPpRLO7+5VO56wu8Z8wMya5UeKck/uv/9HvlhjUc0OecK9htpm8cz5DebkOYnWUwbPdVPpMdkJfXEVCSfbw7OOwIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 17:00:20 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0113.014; Fri, 12 Jun 2026
 17:00:20 +0000
Message-ID: <bb603c09-cd23-4fd4-8a50-e7f9f9648a5e@amd.com>
Date: Fri, 12 Jun 2026 12:00:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] x86/resctrl: Support Privilege-Level Zero
 Association (PLZA)
From: "Moger, Babu" <bmoger@amd.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 hpa@zytor.com, akpm@linux-foundation.org, rdunlap@infradead.org,
 pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
 lirongqing@baidu.com, paulmck@kernel.org, bhelgaas@google.com,
 seanjc@google.com, alexandre.chartre@oracle.com, yazen.ghannam@amd.com,
 peterz@infradead.org, chang.seok.bae@intel.com, kim.phillips@amd.com,
 xin@zytor.com, naveen@kernel.org, thomas.lendacky@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com,
 peternewman@google.com
References: <cover.1777591496.git.babu.moger@amd.com>
 <f59c7f5404f29b2901af68d8032ee615b7f0efea.1777591496.git.babu.moger@amd.com>
 <081b5cd6-37a3-4aaf-862b-b41e9536bb66@intel.com>
 <a737ae9e-9cbc-46bb-b565-0b888e69f0ea@amd.com>
Content-Language: en-US
In-Reply-To: <a737ae9e-9cbc-46bb-b565-0b888e69f0ea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:806:120::7) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3f1529-5e4d-4605-2c98-08dec8a4163a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i5z26j0z87EVXDIFAyDQ1VJ8csZ58tJ1NMdA2aOhWyFD4+Z/EizZctO6ZlYzEHjTfVelnVajpdSW7JF7qIWLglbuN1Z7SxxoIQ71XWi8fvP2v0sDnA1LJR3rdzQU6FI/vLEBSren95QnCKv0DDuJz21WoMicqEFOM70uX3EzPNkESl1naW8GFQ5rJnsBHei2GH6jD1aJJuMzBPUT1w7a+9A1D5D1xzBVQyT1U9czI0dTrJ5s7iNWYBl7u28nur6iQes70fYIE82jLTaibTlIj47gsibMHPZcraFU1UuxavUnJAwjxAtnDGa+Z4PVut1N76xG5VG5VVe8DZWTscC8SW/QqzWP8oHFiuLhWk07nISuZxCws+qmYUg55d/wYerLGji57x1WHaYj2xggo75tjV0w9ZB7fDzwnfsfPnDWGtsVfGmsUn1XBWTpt0GDSj7LyaOh+BSLvRll9Q9PFCRs27Bpf8WotpeotW+S1ye6VkCcROsy+a1FvnaemAi0Y75gHF1BFH63RxGgeMMU2ZXHQlDfrWmqrs76vI0j+kAS2H33w/tGzmxWeH2zAs+4C/IGcHqsrKK57kn0Wy5ENDItYnF8wZ5zY63um57dNExRE5OZFrn9/hK0RGTZwEnWAqKPI7AnRG6+sPwoVi9Vy7u597rM7nlrIQ/9veWvbBfzA4GudzEfIWPt7MLy1smXPi1u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXg5Vk82b0d2TFE3bGVGZmp0R3lqVVBIdzI4QTFMczA5elpKeVBoRXNmRDVq?=
 =?utf-8?B?U3ZlSmczMktBYkxzVjJxNExXNW9iUzZPNkM4TldTOWp3VldjbHJUK25TM3g1?=
 =?utf-8?B?Z0FxQXdOS0UvbTJUbHkxUmJXOUUrYjZ6bnN0a2UvVHNpbVdGOUo1Qm9LQlBZ?=
 =?utf-8?B?RUVGVmtjeVNqbGVaQ3Y5SHdOZm9TaTB4WmlJTTFyZ09sS3Y3QUFNMll3WGRH?=
 =?utf-8?B?Z1V0YmxJL3htRkVvYjhVd1MydTFhQW9OQUlOMkRUZHJIWWpoVms0anFwcmho?=
 =?utf-8?B?VExqQm55QjVweWhPRWJKVUN4eE1qcEdjdkErNHdmQi9URkc2REV6Uk11dFRP?=
 =?utf-8?B?SEltNGNIeG1COUJmc3FadjhuakZ4SDlHTlBrS09Qb09NaVV2TkVMVXVoYkll?=
 =?utf-8?B?VXNYNXVhRHZQUzFCS3ViOHN1aG1MVnBpOVI1U1hrR0gwN0lmeXcrSnNtdzZW?=
 =?utf-8?B?N2N1TDRVdlVpRXZuRHBsMTJ2WkFHczZwRWRSek90TStRUGlneHB3bFdjdjhS?=
 =?utf-8?B?S3NscTZ4N0ZCc1NlLy9TOTAycENmYTNpdWhGVkVOR1labDVzN3g0MGlhcWNp?=
 =?utf-8?B?TkJPcWN3QUdNOGlzaFg2K3c1Rk5sVmpOYitoZHV4WXdWWVBTaTVKZVZQUXpv?=
 =?utf-8?B?ZFZHak1VdmpjVDZjNUZVeGM4cU1IS0trOWUxNXNRVDk3bnBvOThUaCtpQVRM?=
 =?utf-8?B?ZTBXZVIzNHc5QTBaNDNKdER3RE10SjBKZXcwVFptdTFNcjhLT09jR29KN0hp?=
 =?utf-8?B?WW9UeHhwT015YlBrdDI1VDhHMk5xR3FFa1VwbVVQL01oQjl5M0NKNkFGcnNV?=
 =?utf-8?B?UmZXYlYzSjhCYnJobTJWcjl5bDF3bi9FNmZNbk00Z1g4c0x6ZTU1Sjdyd2pr?=
 =?utf-8?B?UXFtM0FpdTJZK3BNZWE0M0g4dnp6Yk45UWZWb1pqWVluUEE5TSt6ZklpYkVU?=
 =?utf-8?B?YzN0aEpveUlEMXBveWxJS1RGaW1rbG1Jai9tRm96MFZuWEhCSEdqamlsMkxh?=
 =?utf-8?B?WW9NVkhLR0EySkp1ZnBRMTUxUkJaMytaU2plbzhUMGxxZWxqSTg2aUVadHQ4?=
 =?utf-8?B?ME5hUmFONGpha1NPdGpmaldXREgrS3hpZW1oOXoyc2hxeXg4NjFOdGJVVFIr?=
 =?utf-8?B?NmhwM29PZ0laNnM5YjFIYXRQZG5BMTl4MjBIQS9nRE1McWFReFgvMk9tTXNr?=
 =?utf-8?B?NGRzcmMwNWNBNE9KQlBUOFhDOHNUV1RPRndpQm9yUnJHZmcyUmorYjlsUSs4?=
 =?utf-8?B?V2h1TGZEOWxvTWFXeUlDR0JkcE8yUUdLdFVzRU5VU1ZZaEZBc1JLS2hLaElK?=
 =?utf-8?B?N3JCNWtFZUpyYU5aMWR5KzVhMEg0Qng2UEpvdHZkeEVEM2h6eEJMckNBd0U3?=
 =?utf-8?B?V0k5cG8vZ0VwcFJpUCsxdVdVMUROUzV3aVBaYkc2dmZiQVh3bEkrZlpLLzRw?=
 =?utf-8?B?VnBWdE5SQlNqblFZbmV2QkI2bno2dGw3UWpLc2V1QzA2SnFPd0lMTnVHZWd1?=
 =?utf-8?B?dGZVcUw3N1VvNmtVTjVTYnI1anBPbkV6RURvVkRoOTBhV3dIcFFWUVpYQS9R?=
 =?utf-8?B?NVRYSnA4aUpTZzJpc0QzUFkzSDdmcVNyNUxzeW5lL0hrV1JhdjI1bzhGNmJt?=
 =?utf-8?B?eS9pSmR5NUpxQ0Z0Y1lBbWRSdzVMemgvUXB0emF0SDhSWUlia3NmTnFDaGly?=
 =?utf-8?B?MThqZ3AzT25nUlJlcVY3elhIcUJJb3VVRDF1eS9tNkxKc29TZXNzTUY4bWd4?=
 =?utf-8?B?bmtMbEp5VXROSHJHNFVKdTVzT2sySDJrUW9ic3l1NnFhTGJrOWplYjU4a0Fm?=
 =?utf-8?B?V3ZoNlNaRHBNSG5xdWV0U2E3TnlTNmVGVXZQVWJuWUQ3aUJrWlF1SXl1TmQr?=
 =?utf-8?B?VG5JWjlOZGd6MTJMMk5QaHpQR1oyWDdiMzB0Y29aVUg0WkdHWFgyczV0dTAr?=
 =?utf-8?B?Tk03WHNOZVlId201SDl2Mk1vSXh2d1VSWWJnQzRXK2ZGbVdkRVIrdlhqdDY5?=
 =?utf-8?B?TGFrY0pUWWRGanpRLzcwOHpLUlBQVC9wT3Z5bWZiTUVrM1dWSDZ1L1JESWZT?=
 =?utf-8?B?dEZ4STFiajYrd3MwQ3lXcW1PM2VXdWwwVUUwWmpmYk1hOVI5VkpKSko1WE9E?=
 =?utf-8?B?dVU1cUliMmN0cW1SU0RlVnErQnFBdTJJa0tyWjkzaVBMMkhNQ2J3VFZkK21u?=
 =?utf-8?B?WVlwdTF2YjVrNEFkQVJhUkxURHBobFhJblV2VlBnbnM4bEc3dk5zbC9HRm1u?=
 =?utf-8?B?ZlQrb0ptdVpCTzEvZW41cTRBSUZrL1JlQ0xNTzZ6ZURTOXRxdGdURkNJMWFH?=
 =?utf-8?Q?IhfCikk0LXfz96sOuZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3f1529-5e4d-4605-2c98-08dec8a4163a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:00:20.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnFA6gV9L0Uv6SfA+kd1cpb7GmTLZ8j5bnXYlqzgNVpoHTURuMOd0MyysfKCu61y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887

Hi Reinette,

Missed typo again.

On 6/12/2026 11:56 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 6/11/2026 6:23 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/30/26 4:24 PM, Babu Moger wrote:
>>> Customers have identified an issue while using the QoS resource Control
>>
>> "Control" -> "control"?
>>
> 
> ack
> 
>>> feature. If a memory bandwidth associated with a CLOSID is aggressively
>>
>> "a memory bandwidth" -> "memory bandwidth"?
> 
> ack.
> 
>>
>>> throttled, and it moves into Kernel mode, the Kernel operations are also
>>
>> What does "it" refer to here? From text it seems to be the "CLOSID" 
>> but that
>> does not sound right? Should "it" instead be something like "a task 
>> with that
>> CLOSID"?
> 
> sure.
> 
>>
>> "Kernel" -> "kernel"?
> 
> ack.
>>
>>> aggressively throttled. This can stall forward progress and eventually
>>> degrade overall system performance. AMD hardware supports a feature
>>> Privilege-Level Zero Association (PLZA) to change the association of the
>>> thread as soon as it begins executing.
>>
>> "change the association of the thread as soon as it begins executing." 
>> I am
>> not able to parse this.
> 
> How about ?
> 
> Customers have identified an issue while using the QoS resource Control

Control > control

Thanks

Babu

