Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C823BED79;
	Tue, 11 Aug 2026 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481704; cv=fail; b=GOqT10OK2AMthWNE9d3Krn8+KK8TQovEdUheN59eoLexfSd2c1HM6A0MFYXG4s5jpVScXU7FzSgbjwVhp416vp/f4OraB18Zef3uyjis+cVXMQrWwhrtPcAaBM7+4fn8KHeBSww/09v23YZ3lGyspw9ApazNPcVQpMIgCH1lSMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481704; c=relaxed/simple;
	bh=SkYWynieZd5Q9RKm+UiXWeYSsjOa1VtcO33GzC9M8Ec=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=Oams1YjAjgB9XeozBcd+o2b7YWjgdtW8JVW570+pb4Gt3796U60yysJi2XV2JGbuFQrBxY/4kaj9DqKRWqBhl1+6IQvx/dL7Nc48kH1YK/cKBudsuy/FjHjtr2KhWwd6/LI50AKPOFjOgCrC3TGObD7KhosU0YWwiCJXVPKfcXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XZaOl+KV; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XZaOl+KV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egKSgXFuh6VbdgwpH7On67qEXXySuyjSYE/05L1aucBDrwc5r5Rua0BQ7fVk1YAp3DevMG5ZYKqjBogC9LCrL3guo+oHeIOvOA1MFSiP7apaAljcE3FfDCadXB+QLDlE/NeSIyszIqy21UHlyZjwLK3xbCAPOZ75+HnzK7n2ufEgCZe3TMTCZRfRkxiDRZUxO2br84ng4zONzJgOoLFGemA6h1reWMAR4IU4XlXUrPuA16Ai01guTideTsJHdOI+kQEHZZwRcu597YvFCOlpikrm3eyFcqy6Vu0wpUrpBbOPRA5E3/3sXcbHSLg5HTHlIYv/YAMOjqkElU3y7mTS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkCrzGYffhrS+lBm87Y/JP0Ez7nSN+F28AcRSbBlazk=;
 b=UDMPMfS19vnaAuxuO/TnJT4KnubdLXjE0K5tEEg6jZn0aYswggpLMYXsn2Pc+mDmDb54CJwXr10KgRphcztOey7gVTVeV2NkKjuiWMt2Ayn8wup5aFtT8tEQcB+PJGJ2d04lV2elCF7uengGAsaFWNypcf6sbBMLHJdC4NM2omstNJoI+0f9VTbDR4c7rHWg+kLhrPW16rvAoLLz/3pfvdLUI9IhLhuNYKeT91QBDbwSNYRM88iKco/m1aVOo03ix2UFQvrZ3JpkM4WCbaBC6XYwTijGrOaPXstjMQjHjqnhmI8hoVaFW/EdZ/6pZnv05/XdWMTtqOTz13IUTKqjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkCrzGYffhrS+lBm87Y/JP0Ez7nSN+F28AcRSbBlazk=;
 b=XZaOl+KVbHJB0xtxJTrVjBH/fV6JSOcsUbH8FtR5ZdL4DJjo0ZOjl3UXU57RVOweGztdeAiyi1lwUhPAdxU6CxrY+Y82hdFNu6bOWmnnU6cXGuRwB7AdhFMxHbMDSfCIg2e+Qz7GdO3uCWZ7303ShcPt/nb2etbhXuqiHLx//OLFl79NzICGvlTo9/CZxrBbhoGM+IHJ/hnzmyOsYRM4RzudgwQhyP0n75wtMbeNNzzrb2MNLgfQQdsvkT/yZxq7etozwZz0lsYkZBczXiq/9qryjOAlJhPWynKWhvXwBxL7f+9R45HFAlS2x35sXEcJ+54NxTtX2Rty2BImSwR9PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS4PR12MB9585.namprd12.prod.outlook.com (2603:10b6:8:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 20:54:56 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0315.011; Tue, 11 Aug 2026
 20:54:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 16:54:55 -0400
Message-Id: <DKMEWP5COTNW.J65YIGB11RA6@nvidia.com>
Subject: Re: [PATCH v4 7/7] mm: Documentation: clarify where the mTHP stats
 live
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>,
 "Barry Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>,
 "Usama Arif" <usama.arif@linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Mike Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-7-ddac39d61c4a@linux.dev>
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-7-ddac39d61c4a@linux.dev>
X-ClientProxiedBy: BL1PR13CA0367.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::12) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS4PR12MB9585:EE_
X-MS-Office365-Filtering-Correlation-Id: 7192dc08-9c9c-4aa7-795a-08def7eacccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|23010399003|376014|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	5+m9Vwjt0zThjGs3K8t1mwaKKjkqWogn6r2HjINozJ1wBzDDs44kDbLYjph/MqahOz4mUQY30ukxLymM5+1ZSmMGH96M9wAUq7lgrM3X/7PYzB6jD038cIPEt6anBoJYmLwUuH/Zr+NOcpv3E1XuyFzd5foM8fjWiEF5wspJqKM2K7msaKQOTzG7DMB4gygae/D8GVLqDyWYgMkqW0mscGxQw8zPI9AvbjnAjLoyh8V521GxBr5Cdf7ObQTgF5i86AlKTdo0IoPiKnVdTdmyRNLhstwrTALd6lW13SbgwS/lyk6gV5lDsH00Awb+zIa/VSHACMVbD5iezCjWRuxh/rsB03XStOjA8vrqnHmUN20IaZ0CywMJy0OyfCQzGJMTY8Ng56eS490bp2zwYCWIpywlyjxdWpcY6em06eHiYbKFQJdhihYbEQj2JLIfBgdsgTLfz3dUanuCzwhFyW/wHmC8tg9V/lCOCNJ4J0q3c6g1E3QlZLatwrQ8+r5RtcPg8fIXV+57L8UTEbqcdC3f2IhN7rjCsZbV9qSyaMpYMWTjoWGdqrOPeElo35Tjrg0tqOxZknt1DQVk3d2AXtbj8nwvHxnksFVkfhfacsqe5YgZfy94EaXowVC37TAUFSofql3pIah164ov/IXuFaDuenFUMpgneCsMFT5FQ+Rckfk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REVVbEZDeHZtY3krTXFYK0pQTGlhMEJ1QWZSRWR1cXhzUkNRT25DUm40OVpQ?=
 =?utf-8?B?L2NzUEVVcGFTRkU3S29acjNjS2R6Y1BPN2Q3WnU2WTh5Y0FTQjVoTlYwcGpm?=
 =?utf-8?B?TnVPNVZBWjdKdW5RRUd5a1BkRk9sZGtGd2dOa0FwcGVpMDdmNFBjUGxHYmIz?=
 =?utf-8?B?K3JVbmRFTldoU2kvTFFMaG5EU1dqb2RjcnZ5RFpaM3Bucm5wT3NINXBCWHpY?=
 =?utf-8?B?R0UwVkF4Ukh2eUpvSDhOdEh2c21SZVJKWmdyTHpySDlRWTY4dXc0SkRSU1px?=
 =?utf-8?B?aTc4dVhFNmw4eG52U2VJc0FBYkNGY0F1YzJCcDJXTlVzMzNKem92T2ExODFv?=
 =?utf-8?B?ekRUV2hPWW9uaWlEeXlMeVVQWmxYSjQvRmMyaDZkTkZiU1ozc3VLdnd4Y04y?=
 =?utf-8?B?dXc3MXdUMXMyNnc5a0gwcVZ2eUc5bTZkQjRBejlKeXV0dkRRSFpBbDZYd1Rv?=
 =?utf-8?B?WFgwWjluSmhWWVg1OHhRcW0vQlU4WTA4akdhbCtWa0Q2U2NKUi9UeURjRmdp?=
 =?utf-8?B?K3FnOTJ1aXVhK3l1Q3pNNEFJczE4MlpHN3pYR0dHRkY3NFVqWGRJVFdYU01n?=
 =?utf-8?B?cWMxTmJaOVZvWjJMZUZKMU82elh5ZU03NGVwUWRjUkIySEdtSFlraXhtS3E1?=
 =?utf-8?B?YmpmQWpBTi9abWFwOWg4d1lrZlo4Z1V2cHdkQ0owbW5PWkdWYjZOWXZqcVhN?=
 =?utf-8?B?ZllGSENNcGE2ZzVBK2x5RkNzK1l6UExZdG5RMzczMjlvOWRpL2ZNd0pwcnNl?=
 =?utf-8?B?ZDhyQVVIQ3VLRFc4VkRNRzNUREJGWlBjL2pBQkY1UFIzL0UwNUt0YXFWczcy?=
 =?utf-8?B?MkE3OTcvQlJlRGJmMXE0aE9wQ1F1V2ZvdHFaMDFJeERiOUQxVjZQWWx1aGhK?=
 =?utf-8?B?aU9lTE5aTFZubERMN3NVRVlkeWFWMUxEWkFiMlpZMEtPVnFQa3Btb0w5R2Ns?=
 =?utf-8?B?VzNmaGhjTjkrQW03OGk1bTB4WGd1UEpRUURvaWtxQk9jSlNqUzZPSDI1Uk1j?=
 =?utf-8?B?S1VCUHd0V2UzK01EbUZuT1U4ZGFwOTBTcVFsa1lkVGRhTXJOT1hFOXgvdXYz?=
 =?utf-8?B?UDlBcUNDVXg2ZjhRVHQzV3hiakdNUHkyVXU0d0VSVldpMWVwdTJlNkI4aDda?=
 =?utf-8?B?cDBzU01iMGJocy9LRlhnWlZFOEN5eUxiT0xsUStZV1dHTGViMkFPNG9lYytF?=
 =?utf-8?B?NXN0N1U0NHJHUVR0U0VyMUhPWTVGZVd1cGVCZTJwZnVsMUNkcEJ4dEdVbVBP?=
 =?utf-8?B?N1BMQlJnQStrcHdiMzVqamt0SGZJb2xURFRaV0RXRythTVdBU3k1dVQ0N3h2?=
 =?utf-8?B?NVRwZi9HdGxEZjArZm9VQkhRbS81b2MzNVdxeHdIbHUzNG1PYWsxTFVMODlF?=
 =?utf-8?B?S0lWMk5DSVZXdW05bFhWUVp1cDFjU3NWYy8rU0FTdGZvNktzSGxjcEh5WXRm?=
 =?utf-8?B?L3dlV1hISnM4T1MxQkl5ZHJMYlpnZUNTUFcwbjZIbERxNnN3WVEwbFFqam9Q?=
 =?utf-8?B?T2VGK2hGTkxpdHF1L0REVHdMUVBYQWxxVUM1cSsrOENSTXlUWGNHZFNtdEFt?=
 =?utf-8?B?Ni94b3JlbmUyNGdxWmpESWNJbkxkMkpSeFo0Z2NDaE1YM2lIN0JFQ0Q0azl2?=
 =?utf-8?B?S3NkekV1c2kxTVN5OHFCNDIxZ2tYZGNVb3UrZDRyYi9kWktqUHdPN3kvYTdL?=
 =?utf-8?B?Q2pFdUNzL2tXL0RjMmM2amZzRy9GS2d0R1lKRVBHYjJOUGJKRDBpaGJsQTR0?=
 =?utf-8?B?QU56czFkWnpYR2FrcXlsbThGRGtEYlFHUzJhTWNjRU1lS3Q2NlV6SUc5UjZM?=
 =?utf-8?B?L0k2UWRSMzIzMjRaODdTZ28vRlY5anhma3BvNERpYnRMTjQxOU5NZzNKTWtY?=
 =?utf-8?B?NUNuSHEzUDUybUNWNys4VlZKOXR4MTkvRlRnODFTU3BWNjFPM3dhbG1seWxJ?=
 =?utf-8?B?UllMcnZacERlVm52d3BUeGdwSisxaWxDUG9yM090bGV6cXlpZWtwWVpsWUFN?=
 =?utf-8?B?MUQxR08xZjMrbmtyMjVuV0hCMG4vOWxwdmZpSmM4TWx0azhOQU9nV1dBVVB1?=
 =?utf-8?B?SUhaWnVWRDZDdUdMN1FCR0dEWHN6MlNRZnVRR3lBeVNSN0FnNG9LY3QyNEs4?=
 =?utf-8?B?TzJhM0JKRVR2Y3ZrR3lMRW13S3FNWkZCajNJcnVERXV5RDA0K1hoQ1NxeTJh?=
 =?utf-8?B?enJRWlNDTlBkeDFTOWxvYm5JU1F0NU03MStmQ01QRWZBZzlyL0JqSnJML2J1?=
 =?utf-8?B?R0lvUVR1RGYwTjlrbkptSEE4RnpIeEhrV0ZnOENzYjdCZUFhRVBuTXJxRU1C?=
 =?utf-8?Q?qRH4aftK2WxHjYXp6k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7192dc08-9c9c-4aa7-795a-08def7eacccf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:54:56.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbLpCxss12V3xY85HB6Mq8uuYYGH0G+geNisSuNZCo8np+OsRr6P+McjxAm0Gpiz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9585

On Tue Aug 11, 2026 at 8:48 AM EDT, Nico Pache (Red Hat) wrote:
> The note about khugepaged counters references /proc/vmstat for the PMD
> case, but never mentions where the mTHPs stats can be found
> (i.e.: /sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/stats/)
> Add a small addition to this section for clarity.
>
> Also fix a missing period while we are at it.
>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> ---
>  Documentation/admin-guide/mm/transhuge.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

