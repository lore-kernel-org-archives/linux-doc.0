Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010002.outbound.protection.outlook.com [52.103.32.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94061F09B0
	for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749536482; cv=fail; b=qQsJY4Z6imCZ7ljCeyIDRJbyCC/dvr9uhCioDoz7vCUNPS6yo2jFxLwyCVzHw4Jh08S5Y80d3/XpgTCst3WZTFZ5zd9QjCz+hKZVII2gvftaCAPmOb432lvzCGyu7R5jj3zjgSfcvY9sTY/3m/r+Hbak9k4yssh7PHw/p9XKNfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749536482; c=relaxed/simple;
	bh=tqEjauETOp/O+gg5z+Wr3v5NCIzGMe8k9PKdnjk7DSg=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AQ83pqeC3hfT9cvDhGgjH274G7RQiYjZe/V1u/dAK91NhKG5gEmJ/FoSzFqiaIrL8xe5MKKBSGfBKaUKd9OC9dZKSk6Y+RCsvktZ7uR65AMH50svtvagRT/Lq761vuAdUSl3d1JbvXRNooUVx3C0jYkqnudgLjR9D/Vh5wkCin0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=S0y/FWV+; arc=fail smtp.client-ip=52.103.32.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="S0y/FWV+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5whDafdovkxpYHwC8Lg3QuPyh3F8pIIzduZscNpdH77enLIYRGdCbkcwMVWyshrSTCvRNxfWwgfCvWtLdvLAgnb//eM7FbAJLA+eOQSCRgd0tGyRw4GYksruEyX2QUgS7g0RJRcUi9L3uYxi14lOrKohxT+Qa/OYEigV6ikK1gDxS02PDseHW1KfH8x6oCcE2LK8/gP5/wIiuIQyHJyuKrPEdfaiLSdjd1CF0qqSTBaG3MVruRvt7It2NM7rVhg/tykTZf5x685D2NUXvvQqeiFADuvki+q/XyyeNU9IfwtpfdMvmbwB628XBh6HLgHw/KLGGeOcxrWBl3xOUOBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb12E7LhDfStkZ/8Odh8RFLjKoGOpUczpE5wbZiK7Ww=;
 b=TWDwv4STh++lt1MBqdk/q4gV91aDaz/DKhLhtFZDduWP0J4hJAOyOp6pPYThAgVxoGLb1tfyBXGUQ6u6QDXuM4QTQ9Q0jFluLqL5X9k70yWEljva5LNV40aWoq35R1n+qMitSVZWtRQ/tDvn3DCtdYxeg0Tzof0Cbl2x+SbBIkuJ+sme34IVh5WRZKyPphx00V/SZUYB0Y8Lg1LPTxGVc59Q2qJeFYKsjmanw8QbapzHvE/NIKfIJJwxomLd4JXBom30a8jsEpy/kA2NiZNQaslYlBkkWBlVJKouDnkmjHrp0L7U2AFVE59soT6hraXj6uiVr11sXbYWm6Aa2AbhQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qb12E7LhDfStkZ/8Odh8RFLjKoGOpUczpE5wbZiK7Ww=;
 b=S0y/FWV+Sw45b8e1OsD9F/iky6GCFcG6wpCA7PFH0EO8zKTGdDmzgXKDaMv0PHswdfmDs0FslWprsncYEDcIdBtzI7ijaURnA9sLuilMjDv8Bg3XjfpGQqsoGMxLR0rlqWJ8c4g8xqaon/cG8W9DLDZX9Ol16PfSA/sbilS/7iv4IP1IUpmeCPePaCuPfvW3mIkANMlkLG35wayTa3d3BjyKveZp6vXiYLFWhRsaaAAaS07kFh3vBAj0fubd7BT+HwCP2N5Vev7W9AxuV6MkrXeZ1gH9ljNFs+56SN2u/rmzZfinrYt+GNJ1i8EoPKq70/UeRxLz7kln46DBy91CPQ==
Received: from PAXPR06MB8224.eurprd06.prod.outlook.com (2603:10a6:102:1a3::13)
 by PR3PR06MB6827.eurprd06.prod.outlook.com (2603:10a6:102:65::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Tue, 10 Jun
 2025 06:21:17 +0000
Received: from PAXPR06MB8224.eurprd06.prod.outlook.com
 ([fe80::9306:451c:f996:14cf]) by PAXPR06MB8224.eurprd06.prod.outlook.com
 ([fe80::9306:451c:f996:14cf%3]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 06:21:17 +0000
Message-ID:
 <PAXPR06MB822465B8887324D12F1F96A5A76AA@PAXPR06MB8224.eurprd06.prod.outlook.com>
Date: Tue, 10 Jun 2025 07:21:16 +0100
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify terms;
 added note.
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>
References: <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
 <87ecvtc772.fsf@trenco.lwn.net> <aEeqcX78zipEGJkl@archie.me>
Content-Language: en-GB
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From: Dante Strock <dantestrock@hotmail.com>
In-Reply-To: <aEeqcX78zipEGJkl@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0613.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::19) To PAXPR06MB8224.eurprd06.prod.outlook.com
 (2603:10a6:102:1a3::13)
X-Microsoft-Original-Message-ID:
 <9301cd05-143e-43ed-8066-ba119d211669@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8224:EE_|PR3PR06MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 09122f8e-5772-4c30-d288-08dda7e70220
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnpxiy/k40MKpgupaWyI4+W3vdUZjF0MLemr09HbMuIGonGeT6bahDAZzUprA+iYuqAx+254WAT0tSLt3XT1b08RdKZNnHuOOYGzIJSA2BrR5E+qbzF59KsuRH+qiMvqxWLaNQD+yHvPmmUpwMXhMP+FZauSPGNBD7M06oUeg4Gslp5wS5FMiYOVrmHA8frKzJGrKkfcZXCsdjjUvI5slznXsGZVch2KyQ1/oS0pqNfL8sSnQKOCV84cWGfJ3Ur+Ul50j9f/Nn/9hH11T1cO9U0ladNHiy0DN9Uo6LaXz7PKaymbsxw6TCys9xF9OtHbZpNQmbTUpnDC5i0fKq1eS/POJsLcgQXwFJYN85Ol1pQJfs/6QvWB+ddIhGhttP/2zK/XBdDYbTend6JebotuhAIqJVpC3qtDAcbh3eVQhQpq4Js6ACrDJlDpFY5mEz+1vHL2QYnEPOPURB8YUTeDbSv/WPLTpX7v1cBPdo0GPIvUkgSsoGxNwB4fnqqZILi4Z+ICMCHQm8ZmRgCu/QKVzA46Qt98Ux03mEM6qzPiF0CqaL+EOGGiWC2MBukcHXR4cBKHElS4icMP/zgFmXf00YQAnWO+Xa9qbhPJ3OL7cUMqZA2e/xK70hzsbOqHZcLp2OYtV4XMNAbjfz44NAvmNhYXpNK11ui2UW0bGsKPO+8PdXSYb2B5nRHyDYIaUZ/zbY/1neFRKm9JoUmxDJ3vqi4XIFu4ppzmM/pw4ugV8dUwu9oF6mTEk7BTP3qUm9CNquQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|19110799006|8060799009|7092599006|15080799009|6090799003|1602099012|4302099013|3412199025|10035399007|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWJaY2hVakdTbXFOZzRIdDdBL0RCOEZXaXdabC9PZTBJM0xVMExEVFNVS3Nt?=
 =?utf-8?B?OU56VUlQK1ZpUmJqV2RCd01udzZubU5Bc1NxR3ZtZUxTMk1VZGNrdHlRc1dJ?=
 =?utf-8?B?NDJBSWMyYUVVVFYzcHJTRDhRM0o5YzJkakNPV1NJZkgvRi8zcFc3TWd2V0dn?=
 =?utf-8?B?c2Fyb1dWSmpjR3BnMnNXOURrN1BVcmlMMTJUM0JyREIrbVo3T2JKdks2cStL?=
 =?utf-8?B?V1V3NmdSOXJmRUtkYmRzdGh1L3BXT29JWHJPUUR1a0ZRSkZsK2ZQdlFuRkR4?=
 =?utf-8?B?eWJpYkd4Uk8zT2lNOXZtVC9CRmlOOUk0bUxLaUkzTVNLR2JSNmx0MU9MbHJn?=
 =?utf-8?B?Zy9sSlJrdkZnWmVrblc0NHRUakxDTUVUem1MSlppcEloYVVxUkIvMEZHQU4r?=
 =?utf-8?B?K0lQNUlWOW9rMWpnREJKdmg0b2JrQkpvMDdXL3hrMklUL21Nb3pvOTdTbmdK?=
 =?utf-8?B?SVFBSTlqVDVYdWJpUDNZZUNCSlI5dXAzaXJRcFRBRDFZNGkvbDJOWjBWRE1v?=
 =?utf-8?B?dThCVVFucEtPbFRvblRsMGt6Z2NBc1lWc2JCdlRiNDZNZmxiOFNQNWI5TFI5?=
 =?utf-8?B?dzNOWE0rQWdpRGdERDF6SjRaWU9VRGdLYkpseWpzSXliUHkycWpURW1IaDlh?=
 =?utf-8?B?cU56dkJ4OWFkTC81S0E3YlpERnNxVWMrZ3ZFR0xpdHV4em8ybmhxR3VabStR?=
 =?utf-8?B?N1hPVlNoUW5CbzYzN1I5elMyNFp2SG00Sm9JV1JCQ3FkTXV6Q2krMnduSGI4?=
 =?utf-8?B?QXBVVU91dSttMjhXR21Dd0ZoTThleUgwcFB6Nnl5aDI0aFMvM2wrUERsZ2ph?=
 =?utf-8?B?RjRDMG95dXhrQkV1d2poVjVQY1dVRkZLR1pDakJHVGV5MnovS1BsVlNkWWs1?=
 =?utf-8?B?ME9FeU5FbFc5K3hsSXk3S1hXSVh6QjdISy9HTXIwUnBEZHVTK3o3Uy9OWXBs?=
 =?utf-8?B?V29QWXRxVno3QTdVbXBrY1p0ZG9palJ6TUpEUER6OGJBL2VxL2oxM1JkNExL?=
 =?utf-8?B?elhKSkxjTWJpYXo3NDRMNEFrbnNxRzhVenErakxHTnlxbFV6SVM3dEt2TkIx?=
 =?utf-8?B?VytCZlZaQzBDVDl4dFZFM3RsT1RXSUc1RjV0ZmlIdEhWSGwzTjJnNUNHOCtj?=
 =?utf-8?B?Q1VTaVhUMnYwVlVtd1greGQrcDl1STJiSVR3YnlsVnVqSFJSdjBtVzNFMjVh?=
 =?utf-8?B?TDZPUFZJUFBRQTIzT2dvdjJSM1IxM1cvck0xNDdNNFN3L0MwODVCUlVsQUxr?=
 =?utf-8?B?WnJsMUUvaUV6WUR1dTVjMGVWNmFyMWNhU3ZodkJKV2ZyWnREcWdVblRNZ2hR?=
 =?utf-8?B?UEVFNXBYbFdFRHBqbDg2eCtxQ3B0R2NlQytxUkwxdnhiNDJuMmF5eFZDeHpv?=
 =?utf-8?B?Zm8yMmdnQ3ZMcHdjUFJKK3VLUWQ4UklNNDJoMmh1dVRqM2tmZWFNS29uc0J5?=
 =?utf-8?B?KzVrL29DTFlWQUlwWnJ1MkZ1YVpyUW9pbHdLdVZaQnI1dEYyT2QxQlZIL0FZ?=
 =?utf-8?B?VityRzN1b1BINTdLeTJidWRQaGpLSWZZU0UzZENiZG1qbmdJbEJMVnlwcTZT?=
 =?utf-8?B?eDJabkFYeDYyYTU5UUdpTFdmTmsvYXhDZWJJMC9ZM1FOWC9BQjIvUGw5ek5y?=
 =?utf-8?B?UFArZkJxeFVJY3RBTmd6MThyMXdXTWRVY2JBNTlVNFcyWHFsWHJla0U3Njg0?=
 =?utf-8?Q?M6AIvoIRw4e9ehNtWU3a?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmt6WFlhVmtTeEM5ZXIxalNCWkdRd2ZqZUZXbGhzSkVacDVGUkk0clJQWTJo?=
 =?utf-8?B?UDVGeFNLZFFqQWpaNVJ3WVluemtOZXZYQWhXSWMvTGpqSDBJYWhKaUxjNFIz?=
 =?utf-8?B?aGJlVTJXanY3bHJhQjFMWG43SUFuUFlDMXNSYmFZR081YTFzT1M1aE1JZUp6?=
 =?utf-8?B?QjR4SDVTSGtJWkJNYnd3a3hSS2lISDZaQ0dERmFJQnp5dlRmTTlqK1dnMDJZ?=
 =?utf-8?B?MUVmY1dNb21wbnpZUHlFZ2Ivbm9WbjhXVkF4cE9uQUU2UktLT2V3M1ZEclJS?=
 =?utf-8?B?bWpTTW1Gc2VLd2NETmV6c2lyM1pyQVdNOXhFV3RmZk9UcVVHTjNJUlFCQ0x3?=
 =?utf-8?B?cGpVYkxzZGx6QnlKU1F1MCtyd1NhdG03a20ydUhJZy82QzhrcytNZzJVNGpr?=
 =?utf-8?B?SW5zdEhtUEZXY29aRWI1UjRHRFVLVU9zSFdocWJQNjlwa2lBWEhoWWdWNTMr?=
 =?utf-8?B?VWZoeVRVbFhqU2lvc250VFh6eThTYmJiYkM2Q3YyanRDUzJDOGFabUdPQkVI?=
 =?utf-8?B?UWxMWnBJS0cvczlVRkNkaFNKYmk1M2pFZnE0c3FWSCs0MERTeGo3UlZYQkxp?=
 =?utf-8?B?WlEzWkI2ZjlyeWhibC8xdE1acUJtdTRpblVZS054aGFZSmFFaHBTNExjSE5D?=
 =?utf-8?B?VlM4c0V5VC9rc0J3Tmd6V0s3QkVSdzB2WkxrUDlqc2l3Ykdsamd1d1lxakpW?=
 =?utf-8?B?Snpvd01PejF2Ni9CTjZWbzFsNkNMcFFHOUJ1d2NtL2dVZHJTZTNvRFBqb1RG?=
 =?utf-8?B?UFk0ZGE4SmJRUjdndkU0MzNGQytmazJmUU1saWo0eXZTVmdVNUdPZmJPRVpY?=
 =?utf-8?B?ZWVEOFNLRE9ZVkx4TENxN1RFN2dBMWlzeEpZQXh5M0ZBK3lybmxhZllBZUh4?=
 =?utf-8?B?Vlg4KzUzSlpjZVo3UUhIaFpiNjFqMkNMUFVjRGg2OXhLa0lJWHllT0IvVHht?=
 =?utf-8?B?Qm9Pbm84N1ZOR0RjYjdGQytsSVUrWnBxUEhzT2FzaTdLSWZ2czlQU1RPRE5w?=
 =?utf-8?B?MklhN3JJMXR0WlBoZGVhTjNna2ViWHJ0eEhud3hNN04ycGgveGlJbGpMeE12?=
 =?utf-8?B?VFByV01jYjFtV3c0VE1wNXdkMWNMTzRWTDhLQStlb0tjdDdSRDR5aW8zMnAw?=
 =?utf-8?B?WVFuNkJUSk1yYlYrNWQzYWcxc01PRnR6TTN1aXJHbm5rV0tDTHduZncweFp0?=
 =?utf-8?B?SGRDNlpDTytDb3pleUpvNFc4Rm9iRE1GUnBWWjExb1lwako0aFJMdWlpUFFZ?=
 =?utf-8?B?bEVOSnJGSGQ3Qy8ybGRXS1FxdUNSUk5yVlB1cStlWTBHdXNLajd5Nlh5N0FG?=
 =?utf-8?B?Si83OVFKQUFnaWIrVlZkNjZwREttdVNybFJwRUsrK2FZTmhQVUQxcU5GeHVm?=
 =?utf-8?B?Q3ZuZVl6bTZTNW1Nb2hEUUJ6eWhxV3laM21LQjQrQUdmVmludXR4R0dIMi9Z?=
 =?utf-8?B?d3pJVXFPWnRGWDJhWk81Tk43ZEp0SGdNTjgvQmpYcWpZWWc1M0lwTFFZRkxh?=
 =?utf-8?B?WjF3WFlxSmEzeEg3aXF5YXJZVnRLOVA1S08xVzBKKzZTdjNZZU8vQ2o4bVk5?=
 =?utf-8?B?MkV5WGZHUnpQazI2VlN2OVJQK1ZZZm45dWFHK2FkV0R4aWt5UklRSklRWEM2?=
 =?utf-8?B?czYwUWpGTEE0ZmMrZWxheVNKbE5ZTE5DNUhHOFdYa3NSVnB5NTZGRTk3K29S?=
 =?utf-8?B?QWJpQzYyL1lqTmxnemYzeVRvRTdWWjR2SnA4UXFTTmtRU05nM1dRVFZRSE1R?=
 =?utf-8?Q?4GAlysf7kVL48Ca/R8=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-c5f2b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 09122f8e-5772-4c30-d288-08dda7e70220
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8224.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 06:21:17.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6827


On 10/06/2025 04:45, Bagas Sanjaya wrote:
> On Mon, Jun 09, 2025 at 08:37:05AM -0600, Jonathan Corbet wrote:
>> Dante Strock <dantestrock@hotmail.com> writes:
>>
>>> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
>>> index ef3b116492df..70f8a6603454 100644
>>> --- a/Documentation/process/2.Process.rst
>>> +++ b/Documentation/process/2.Process.rst
>>> @@ -18,17 +18,17 @@ major kernel release happening every two or three months.  The recent
>>>   release history looks like this:
>>>   
>>>   	======  =================
>>> -	5.0	March 3, 2019
>>> -	5.1	May 5, 2019
>>> -	5.2	July 7, 2019
>>> -	5.3	September 15, 2019
>>> -	5.4	November 24, 2019
>>> -	5.5	January 6, 2020
>>> +	6.10	July 14, 2024
>>> +	6.11	September 15, 2024
>>> +	6.12	November 17, 2024
>>> +	6.13	January 20, 2025
>>> +	6.14	March 24, 2025
>>> +	6.15	May 25, 2025
>>>   	======  =================
>>>   
>>> -Every 5.x release is a major kernel release with new features, internal
>>> +Every 6.x release is a major kernel release with new features, internal
>>>   API changes, and more.  A typical release can contain about 13,000
>>> -changesets with changes to several hundred thousand lines of code.  5.x is
>>> +changesets with changes to several hundred thousand lines of code.  6.x is
>>>   the leading edge of Linux kernel development; the kernel uses a
>>>   rolling development model which is continually integrating major changes.
>> I do not object to these change and could apply this, but it might be
>> nice at some point to rephrase this stuff so that we don't end up doing
>> these updates repeatedly.  After all, we'll be at 7.x within a year...
> What about not hard-coding first version number component like below?
>
> ---- >8 ----
> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
> index ef3b116492df08..47bcc6248a1338 100644
> --- a/Documentation/process/2.Process.rst
> +++ b/Documentation/process/2.Process.rst
> @@ -13,24 +13,12 @@ how the process works is required in order to be an effective part of it.
>   The big picture
>   ---------------
>   
> -The kernel developers use a loosely time-based release process, with a new
> -major kernel release happening every two or three months.  The recent
> -release history looks like this:
> -
> -	======  =================
> -	5.0	March 3, 2019
> -	5.1	May 5, 2019
> -	5.2	July 7, 2019
> -	5.3	September 15, 2019
> -	5.4	November 24, 2019
> -	5.5	January 6, 2020
> -	======  =================
> -
> -Every 5.x release is a major kernel release with new features, internal
> -API changes, and more.  A typical release can contain about 13,000
> -changesets with changes to several hundred thousand lines of code.  5.x is
> -the leading edge of Linux kernel development; the kernel uses a
> -rolling development model which is continually integrating major changes.
> +The kernel developers use a loosely time-based, rolling release development
> +process. A new major kernel release (a.x) happens every two or three months,
> +which comes with new features, internal API changes, and more. A typical
> +release can contain about 13,000 changesets with changes to several hundred
> +thousand lines of code. Recent releases, along with their dates, can be found
> +at `Linux Kernel Newbies site <https://kernelnewbies.org/LinuxVersions>`_.
>   
>   A relatively straightforward discipline is followed with regard to the
>   merging of patches for each release.  At the beginning of each development
> @@ -46,13 +34,12 @@ merge window do not come out of thin air; they have been collected, tested,
>   and staged ahead of time.  How that process works will be described in
>   detail later on).
>   
> -The merge window lasts for approximately two weeks.  At the end of this
> -time, Linus Torvalds will declare that the window is closed and release the
> -first of the "rc" kernels.  For the kernel which is destined to be 5.6,
> -for example, the release which happens at the end of the merge window will
> -be called 5.6-rc1.  The -rc1 release is the signal that the time to
> -merge new features has passed, and that the time to stabilize the next
> -kernel has begun.
> +The merge window lasts for approximately two weeks. At the end of this time,
> +Linus Torvalds will declare that the window is closed and release the first of
> +the "rc" kernels.  For the kernel which is destined to be a.x, the release
> +which happens at the end of the merge window will be called a.x-rc1. That
> +release is the signal that the time to merge new features has passed, and that
> +the time to stabilize the next kernel has begun.
>   
>   Over the next six to ten weeks, only patches which fix problems should be
>   submitted to the mainline.  On occasion a more significant change will be
> @@ -99,13 +86,13 @@ release is made.  In the real world, this kind of perfection is hard to
>   achieve; there are just too many variables in a project of this size.
>   There comes a point where delaying the final release just makes the problem
>   worse; the pile of changes waiting for the next merge window will grow
> -larger, creating even more regressions the next time around.  So most 5.x
> +larger, creating even more regressions the next time around.  So most
>   kernels go out with a handful of known regressions though, hopefully, none
>   of them are serious.
>   
>   Once a stable release is made, its ongoing maintenance is passed off to the
>   "stable team," currently Greg Kroah-Hartman. The stable team will release
> -occasional updates to the stable release using the 5.x.y numbering scheme.
> +occasional updates to the stable release using the a.x.y numbering scheme.
>   To be considered for an update release, a patch must (1) fix a significant
>   bug, and (2) already be merged into the mainline for the next development
>   kernel. Kernels will typically receive stable updates for a little more
>
> Thanks.
>
I actually think this works better instead of removing the version 
numbers entirely or updating release numbers every year. Might be worth 
it to look for other pages in the documentation that have hard-coded 
version numbers and changing them also so that the version numbers don't 
need to be updated with every release.


Thanks,
Dante
