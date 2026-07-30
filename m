Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012008.outbound.protection.outlook.com [52.101.43.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D646D08D;
	Thu, 30 Jul 2026 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440967; cv=fail; b=DP6GLIytZ/uotqbuKYrNOWhBXGl3qgTaPZE4aQApDowqaTLek1+5Vp6uOCNWxwdtfltCA74v96gL+7ppKJQjg/+fIoSI0zoSjObi55+ZOhnKx/QeFyXfAHRUb5fnBIXfhgydY9cpjwj49MzfVpJif3uoOpZFLjR2/NOf2EjWcwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440967; c=relaxed/simple;
	bh=yIUnFAbPkVa8aE0p+jNLX9Ck2ruTjJtnN9LoOV1qiJw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RIpIN/anr3Jwavzq3DuEBN29b3yU+XFdS6yPnXyMmkVdt6XFsTbJ/mEhqDptlCI9+TYXbwiIAYWlxHYli05ISyKjt8OkALM6uAGU/UsfLPJe486c0xgwNnDjORZdbLkq+Mt0l7of4/vzliVUiraNXf3yRg3IvSQtC0dXAV6LJCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2QEhVumX; arc=fail smtp.client-ip=52.101.43.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2QEhVumX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpd4PVJgpMKqf6oAff+zfiLIaUyy11wWLxvrrmNgFzlKPAGENn7LNIgumijBKASrTredc9RtLx7Un61Sd2J0fyXFFCfRUHh3UWOIhh6a0kCNds3YXRDGGaPEGPXYPaTue0B+ekTAwTngVwnrmUlZ+mn31mkL1qpHUaVbvcQ1AYaS3mwnBbhoFjPsV32CSIdv8mzuHv4dDLCagyD+mMC6KxcNtjV7VTzE58e8LidrmPINRgzVs5z/ORlUua8p8/24PFIIJXrZtR0I3jC56rxXQHvzqD+bcMtbyJ9Qh0wpkFAA9G4XPhU1tPzWV/XOWZNImDziOWGJ17sjcXjHXgLEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNfcy9C5SLQSogjMfn5Ys9CQTqenNyYinuEc8UQzysw=;
 b=QOcnk1oJ9tggmpiCmOt5Sl5aueoOFGhDHL9+CXUquJVbDGHdDHc8jmn+dwapQQJoTu/leieyjUKoXWK/+c3+/DVSzZA1WZnSIIS2W8G8q/jdfaopSneOHfDsIktGSo6wJ59HcvfAQqFH1eB16VvT6gjkjFPqeFejxcis/QVbo5KvDpFso+yJt05iTiyKg/z6C4t4IXOTuAYg0X/yFb/oMWUBh7GxStWZmhihzHQA/t7yCeSLG41gY3AJnoKb+txq7oD+Z8urYWoPrvV0AN9hiceZ/8eeG1s1Nh2uqfCa1IMedWzDR6cXu0StAB+29HOOyRop/dKpSfvd1W4FQ5pKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNfcy9C5SLQSogjMfn5Ys9CQTqenNyYinuEc8UQzysw=;
 b=2QEhVumXsDE8hUzbmYa4YitAhCGKVeboT/DfNL/QxsXmqxaIC5AqHuAS3JX/FSjeo5eO6wTSrwYlUyfBFNqzQetx5XwFt4NBv060bthwEU/BeBdpktEj5DwBvYWDKCZcqkj1el7XXN0lso5a6IfmVVSRAKtPxeH649T2vkYT1Vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 19:49:08 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 19:49:07 +0000
Message-ID: <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
Date: Thu, 30 Jul 2026 14:49:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>
Cc: "Moger, Babu" <bmoger@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>, "Luck, Tony"
 <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:610:e5::11) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c00f19c-8408-42b4-796b-08deee739e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oR8qBEDivy8iLZtGhixUebHeL6OEmYwr0V3ViXGqkOt/9zhjp/L7s8dlPzlFmDEclulz7KWMC2p+2nP3ygjAQoAewRyKSYvDRm+Ej6jagmKnAhro5xcvfocna4zkHKoMyOzxXAN5/Rvs701L6O++tZeMvg2sNp5X4JPgo/wly0ftJCOGFkkgpvTW7IN+WYdy3UsNUyI24ewGwwPxYh2pxnyBQRabEMQlgPQS9SAtOCt9YIOSR1otTOWT1RGk3GUUMTs7IVPpPLnNxnuJ0Tc4fPfrKcwc4gKQ4v3REFAvnt6lvWbuVS/3ONfOs2Eh3yUsZCcP0jGMOsd2lYT/8EF15XHB/ls+djlbG7xBiuNwU8CDj+x4AlgUCdyuXw+HKdXvJO2cqi5PyOPMEcQc1NwT3UDZYhMDWEVnY5rerCN/14HjJ3CWJJ3G+MQP1bJSKNFM/lY/J9F4yHZzS/jsOk383mZStl1TGDCG3qVGshEA4gxxbTWvzDOGGo9Q2cqqOzXEpXc8Iy7yAsbjOcsMA0RiuOCq25N6/jSF9GtHs5fskkINZwFjhXw44rFCG/laOgzL37OEMIqinqn0eQI312Ua89M4eTv9d2zQE/i+RMAoeHot4SRhntbOjwMcaOWFLsPo1MSxznSmSUs4Rq2QLQhJIVqkHy0nRmIbu6izJiB8mHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdtVHRlc2VBM1BOYktrV1h2TFg2NUxBOEorZ2MydDYzeWNPVU5vTFdmWTNC?=
 =?utf-8?B?WnVDeHlCQVdreEVsa0RIdm5GTURkM3ZXU2RRWGl4Z0FxNVZiSHdDWHQxbVRa?=
 =?utf-8?B?OXhZWWVicGw0TmYzSW1YbGJON05CRFJSMUtQUDlvcWRqL3lLZ1RsOTU3L0Vs?=
 =?utf-8?B?OWl0MDF4VDV4K2FqV05TUy92WGlYRU9QK0V3OEZ1Zm5qUTFDNkZpdXozd29i?=
 =?utf-8?B?SW5nSG1QS3dRaUFBc1BQQ3k0REI0RTZtUWhVZGpOWTNZRWJEVzVMc1A0NEhU?=
 =?utf-8?B?d0ovWmZDY1V1aUpuMmlhaTJPU0ZXSVZqOUJQbzZJT2xpNkhkUW0rdFNWbVlE?=
 =?utf-8?B?YXZ0WVJVTXBOQk13N0ZUNUg5SzlYazVWeWhJYmRseTF4RERrL3liVkNCbEJY?=
 =?utf-8?B?UU1Kck1MbkhVTXRCS001czdodUduYXVHcXlOMkd4bG42SzJxbTJWMG1vTm1o?=
 =?utf-8?B?QjdobnBrQkZxTXNnelV4K1VtaHVOZ0k4TVowaHBHdDVXNE1obkx6cFRlWHc4?=
 =?utf-8?B?bXdxalBOaklSdk5XcWdoSGpuYTk0SGlpWEYrc0dEcE5idUlCZzMwa1BUSll5?=
 =?utf-8?B?amxDTXUvd3dsV0Q4QjlEc0JmaDcwZzdQRW1kVjZGODFUWTI0Q2YrdUFoUWtW?=
 =?utf-8?B?TE9hN2ZzZDB2UWZRT3RSK2RXRUJBU1lxWGgzRm1LdFNIc3BscWljNlp5VzRU?=
 =?utf-8?B?MjBVUG4rL0RXNEdaNGNJOWs5SWc3c3RJWllBYlA5anFNcFVQejhrZ2hUQWtm?=
 =?utf-8?B?ZnlrZVUrMlZXcW84cm1vd2Q3eStUMXVuSFhsWVlpMEQ2dGp1V3YySksvZ2R3?=
 =?utf-8?B?WG1wc1I5dU0yUk5LNEY5SEYyUno4Qk1JaktZeW5lRlkyK2E3OFhyL013N2ZP?=
 =?utf-8?B?YW8wZzZwSkRua0N0TTA0d1FLdE5zZFo2cEUyaTB1Q0NGaFdYZVRpM3FoZVB3?=
 =?utf-8?B?dkFRNFVMSEN0TVJWcXVUWGQ4Rzl6dFEyYUprMFkzNHp2ZS9NMzZwRzBsc1ZP?=
 =?utf-8?B?V0VSR1NGcG12cFFjQjkzMTEyYXAzenY4Mk5SeHFkZit4SEcvanNtK0FRelZm?=
 =?utf-8?B?L0tvR0JFOSttSFJodStXcjYxVy9pR2poSk1Yd0dHWkNpZDhrTmtPRVhia0Z1?=
 =?utf-8?B?VlJCd2R4blRTNmhpbkFuYkxtQkF2SmpxdmJjSWh3Si9Qc1dCb0lWeGRRUzhF?=
 =?utf-8?B?QlliZjBVM2JzWmlUOUgxbVhPTlI1WFNETmNTeG1rOHEwTWtHUWIvNFRXRWll?=
 =?utf-8?B?RVFVRXkzaUltRFhUaC9hVlRrSTVZL0Z2QWw0Y0VlTGRrV0Z1UFlBNjBoSCtx?=
 =?utf-8?B?VCtHanVYOEJ5dDBseFhIc0t4QmlsWlI5QVBFZHF5OTcybEZSZzZES2hISE5o?=
 =?utf-8?B?NmtCVGhKVHdHWktpTnVjNWVsSTZ6OWIvd1c5ejRqY0lQU0krOFowMDhMcnUv?=
 =?utf-8?B?c3MrUm1FS3grKzJEWVJ6OGtSNUpseDBSeU9LVlhDbHc1TW9hZ2NTc3Q2cDJi?=
 =?utf-8?B?dVRrendWWTJEV3dwSXRib0J1VHZnUXRSTThPWmhNeDNKKzFFOCtrQzVUZVBo?=
 =?utf-8?B?Q2JsME1uVUtCRVdMOGl2M1BiQTlvTHczVllHTHhqRDQ5RmNJdVd2SVRkbGpq?=
 =?utf-8?B?a1BCRUJYbzZjemtRREhLRVZFWGNhYWcwWHBlTWMvK0R2WjJWdlRNeklkOXVl?=
 =?utf-8?B?Ty9kcEpRVkRpbGJLVnB4SnJ2TDdlRVFSelZwaWtPak9IcU5McHlDSmYwUkhX?=
 =?utf-8?B?S1VxUDExYUZiYzlKV1l6NWo0S2ZKVDM1NG1lNnhxK1ZKRmlNQ1d2YnFENlNS?=
 =?utf-8?B?VGYxMDBQd1d5OThoOFE3OWpYM3lVOVhtM1hvQWRCVHg0emVJZC9sRENsTVlJ?=
 =?utf-8?B?ZmVLRERiR2JBcEFRaEVDNEk3a1QxUTdOcEJuVlY1YWFCZ3FOSXo0VVloTEJz?=
 =?utf-8?B?ZG9vSFgyOTYvSXcwa2kzdTdSQWF5MlVESEJYR2dZT2pvdUVoVkRhSGNZaE9C?=
 =?utf-8?B?YzFESEJTZHdjQkEwNWtGdWc5NFVMKzI4MjBUVEtIL2x3VTdXK1FlNUFUNFBw?=
 =?utf-8?B?SjJqSFI2WGdheXQ2T2FEdlhsREZqbjdlVnRXWkM2OXkzRGtCZ3lnWE9hRzVm?=
 =?utf-8?B?aDVxb2NlRGpqUzExbm9yL2FKbHlvemlSTjBrZlR1V3JkNGpTNjRYbHpSUWdK?=
 =?utf-8?B?USt0ZU5UK1Y2NkRXVWRLNXBRbUdQZVNMVXdvN3EwQVBMS1VvL3d4ZjZDYm1K?=
 =?utf-8?B?YU5iTkprU0VneFBXWkJqYkVhODA1ZFBYNjlpQ2VubVVGQVRFRDhJaFRxUGNy?=
 =?utf-8?Q?iiBrsB2dSsotAaEGCs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c00f19c-8408-42b4-796b-08deee739e37
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:49:07.8533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLWRWwdIrp7S3GRZK7c2WHO+cpTHzRZrZrXKP7syWL27pQl2C9+bXS4yOs9TCGtL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431



On 7/30/26 14:43, Borislav Petkov wrote:
> On Thu, Jul 30, 2026 at 02:39:40PM -0500, Babu Moger wrote:
>> Therefore, creating more than 64 monitoring groups in the default
>> measurement mode can lead to inaccurate measurement results.
> 
> I have this there now:
> 
> In either case, creating more monitoring groups than available counters can
> lead to innacuracies during measurement.
> 

That is correct.
Thanks
Babu
