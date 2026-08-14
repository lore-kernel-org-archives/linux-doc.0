Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599612E3FE;
	Fri, 14 Aug 2026 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715909; cv=fail; b=ZHJGX0L6p8fFghu5wexkXASqmt83AHBucd8Ozh2qFXHD8ep+yIu/iuZuutIq52KJHA4PCwAvpTJSBl5cs57Vcm6zv3sRQlPuaPoFmwg9xuHiVUkLYAdQcUsmnJL9P5Am/kmgRfnhUvAh4aVkOWjvQVgVCA8le2AcZEd2hSZFM9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715909; c=relaxed/simple;
	bh=QxhjQAkllnLJrL9DjRKYGjQNf1pSJKlaypQPmiPrqB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mfzaKlPP8iAHEDtjlzli6e5/5i1yUUEtjU2bhZgCYhQhhDLbNoU+vMD44WuDg/GB+M6fAjM0EKvM4OOpplSOXRpIz0pyJKbeZOdpydo/Q20B8yGmO1LlTqENnWcd3lzLnlAE0PQt9mvyGOiGJD4f1PMwpW+9zmxyYbshupvIB4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rtubynNQ; arc=fail smtp.client-ip=52.101.85.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rtubynNQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKps4SGMVjEf2SAtPNabRpYj4BB6OrDc4Kdl2E/7QbsSRSl0uDgjx9mCuB3T1BMsYiBtFBDOU0S2ZugDxHBrx9t+PZxWmnr262dfq2FM5ET3n3je63cy78OSxRalDAe4BjLE+c64VxXK5c3WsJmS1/P9KWIILuh3KuBr4D1kQLtaw3n/7VJYDVvFrLXmNsq3GTaGhZ36iZv4IHN33LAgOyy3R5H2aUNyWBTgdIuoYTBsPTcAeNPNmfDIfWhd3K7U7s8xALnWDLEgEkTAC5gkSLAzKTgPOqJt98sbNOYjnLnjklwq6HRNEtQp/PagNDiSTyXaTwj1sxR+G+ilaxLg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dfgc23Jq3kEUY8mOtV5zozCdABRbWfmGJk+iLYzdkdo=;
 b=IuAPJDlyj7+4xBw/ICYhyPV8QHgFS8DV4zfmra/xWdgSmtHbFN0JmvP49SQr8RGZFz+QoCrAuEmBFrCJ5XGaHl9czOvivo4OgtSu4e3zc9kz5hqFf8UA79q27PG6ZkwNx53kCQXs8fqlOK3rIhxqLkq41TkgTi6biHqRoIC+cdLO4z8bJ47mzGvJT8UCEpPorCXp13jAKLbj2eCngQbxBX8gEj55oZT4ZIBVOTuLMkFHAoNBeUu2SfjTWkxGmxy4EY8uF8GOol/Usi7nKJXBcNMcr+LI72d8/q0bmqshNc8ZoDRLtazue4vsusFgN1rAh/pa/MahFSS1qKRzK7+IXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dfgc23Jq3kEUY8mOtV5zozCdABRbWfmGJk+iLYzdkdo=;
 b=rtubynNQyCs0DpEftkyqzxshye5Mi8mrscHt6Eb9suu/khEqW+fpHIPcCuW47ghgYB2a3ikGJYuyD3oqGV/p9k3WTK9ZcrRHjZLfy23+uzuvC8abyNmw4Twk+Uh6yf+tkiJpBz+mNuZW5q0IDF4aCzC0fP36dUM2P62oDZF3PMhQZxGqkbd0b0E4k/IBWwI8De7Qe6naHsdA7RZk2kQvoMu1MEYuqeVPRH3SYVNrjy2Nz25+ZeOMfgk/wVMZfaarak1tlcRgKZdwPQK5cX7VYlogKR3bM1UuS4Lzltt2E762+qVvgqULZAgGMPbqIE4EqodFFgV93GctEC/rZ+REuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 14 Aug
 2026 13:58:22 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:58:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 5/7] mm/khugepaged: Refactor the PTE state checks into
 a helper
Date: Fri, 14 Aug 2026 09:58:20 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <0774EB62-61DC-40CC-B841-8E7487805B91@nvidia.com>
In-Reply-To: <6bfa6c93-4eb5-46c6-9524-7b59297f3601@kernel.org>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-5-ddac39d61c4a@linux.dev>
 <f1371b4d-6e98-4699-8c1b-7612f6d70f02@kernel.org>
 <753cb38f-66b4-4bd0-8b53-7480efe30ec3@kernel.org>
 <DKNGC4X9V83D.268DMWU0WIILG@nvidia.com>
 <6bfa6c93-4eb5-46c6-9524-7b59297f3601@kernel.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR14CA0017.namprd14.prod.outlook.com
 (2603:10b6:208:23e::22) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 7328f22d-01cf-4f79-45b4-08defa0c1a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1rHsab7IdoFTpO2uP8qYbXVqfkjqAHj3Yr4U1/eZAYy0oEyCgtNU+SRDuZ82IMMWKxij8sWISzqDb14Bq4Etrr0o6zV1JlB4/MQuNjyxAK3ek/aRgBU0+QgOwchuvVIj+GLC53mbYel+hlgPkw01orxxEw2AhsnCAOc0/aIu6cXXekEyEcF9SbXJWfnlMDMeaZjKGyyoQeS/nJzORvHBVBgzCQBPFGdpPKgrnbH79MiFpPO8/y4z8UNFc2dTGeoJZIZTpaJMttdGbG4EBiBMlc88Um08+yPOfU7dvKWGkz7CyQzVzodE5wTaZrHDearVkrs8PvvDhJOW6XAHKFdb/hfQ6PBrAJN+iLcVMrt2EmApqURkJ0YxBBoZrKsscA0HTva3G9M0RkNdWv+xwBeP3fjqdoTvR/iaTxHsBuFpXHg/Zw01Xv6+DwPZizi7Hz70zjZaKXReElmPl6XRxjir0miw9tGUE5ywuRfEeYn8JALE5tdNGE82XBiNvTqiJzzDf4Z6mNZzEuurH2A+sjvuj60EMvH7KQHMBNf6rHGufI0pGz6vSPVl4R1ByoXh6RJjeAxNuAZXjsizFYHZpCQO37BzXGC76+V+rm/PADL7lufXKOxmhbWFwMLPXzoGV7iO9jXTUWoqsIwB1tqbNz58OZYwS1KnAUUC+dlDvHDskvE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pbtYiQaAnrZwOsD2sLcVlLbGb810thI1Jbka/CRs4/idGUBLeT5iMeK3cRnl?=
 =?us-ascii?Q?S+SRcPKcyWh1qKI4GZW33yQtRjDK4CKH7zlXr0paE7LSDFxxtAderkxf33So?=
 =?us-ascii?Q?/CzxmBwFXlJbeCMaTW+QDawdxbumtdkvwXHQuJD8IikclOnW7u7YCNC6tgUz?=
 =?us-ascii?Q?3Xlek8Mh+hPHk2UZoqKU+aa9cxwJlrqqMDxgW4WiGTQr63+NoQ+kXs/ZwF7N?=
 =?us-ascii?Q?6w7t8NQXiVhe8FIXXX9YwfYtCQp+4K6BBnk5iZ2a3J+9fyQwg9EFcDRGya2q?=
 =?us-ascii?Q?bFyWXcAzfV2/upzPpvSiKjGoi7MWhFcgxRetJbbNznjC27aNd/tusHthUcWS?=
 =?us-ascii?Q?M70rjtV/D/PwqLAjwvlJCVWtyoRbApuXpxWrANGx60K719q/PbyYnsi9JZdh?=
 =?us-ascii?Q?WmlMCa+O91E7hPetYV4k9mnTkhbB4qCbHHMotkGi89k+Otz1MlBWUQ6R0Ub3?=
 =?us-ascii?Q?OmmQNmZyTdo4FfNU8AV0d0xHTonmmV9VRt3mq8HylHuknUT0pR5fqpsaazAY?=
 =?us-ascii?Q?NHO5aTKwPLIzxFwW+OWXUGaxPqMyckV6WeMq1W8zT+wJ4+QvHQXCkfsaqQdd?=
 =?us-ascii?Q?YmikgS7bX+sMAxKd2B6YLXkJ1WnS1DjaU5NzXFjGdkqGjtdSz/z6Es60zH18?=
 =?us-ascii?Q?UITcJqJhpsHCr2xVC5p+59BvO8rYzIWW4fMOR9tgZBrfgV1qnRMQTV9RkRzf?=
 =?us-ascii?Q?/YU1BTsbmP87QzOhjtb6DKYRdoM3Hj5RfvewpRREpCcRgI2PirGAVrSmKKb0?=
 =?us-ascii?Q?eDHvd8JupoCYIosDZBXjnRjelbydVXA1jBArnMuBTv+YKWTUdCvVodsFq7km?=
 =?us-ascii?Q?/ky0TRVT3H738csIuNFB79eW6DlDE28qsCdRwnjRKHfzIK9dfcASuaBeOhpZ?=
 =?us-ascii?Q?Bt4AZ/IR/dDsFfXv6HF516OX2F/fmBB8cHBnbYTcLr2my6F36z1dtdWHSkAn?=
 =?us-ascii?Q?sPifwa/nzSId8zkDfhziM7Yf7M4pHzSPCLdzyqlbJhpOTDarOX9ByS/1g/m5?=
 =?us-ascii?Q?FDsSONx1XF9KdQ+aIBiy0/gVLZP/HvEe3yE5uzUSGyCFG8rxMKVdybC8iYPq?=
 =?us-ascii?Q?J3ynEQabU7o8Yiw4pQBAXbZ5qSd1+CVB5LIqkkvI2pl+u42GxQIHeLN5Qkew?=
 =?us-ascii?Q?AxPkl5f0tAw+eh/54nLYA3Zefcl3uAGzHolCfKeBs98ZTjiNUWpxU60BRqX2?=
 =?us-ascii?Q?bRl7eZy3miedhwU0YdpbCUQ+Zaxxyc1n1LuzOPAWeUIBhGFRWHaiPDlrFrCS?=
 =?us-ascii?Q?A+dY4iuT68uqK32iasESBCDXbYjJgomeCF9H1puySOtb4/P1VsagkBzcfJmQ?=
 =?us-ascii?Q?cLzOb0Gp6Ji2JwNGUP9/5LN/xu6qA74MTRv+hpf6le09dNa7MECDFBEjtfYB?=
 =?us-ascii?Q?Cwuyeda86UN99Vfy9HicPenU8UtMb0lluQkphgdija/C+iQDqrKnzys002i+?=
 =?us-ascii?Q?I3HKuxzlzZguFuN+7riRrws9dFvwiXmehz+Fy6iHEu+pS1I5Ux/TSjWPCq+P?=
 =?us-ascii?Q?uhRIIx5+eG0sBODWy9eU9kNTlQQvQAd6yWD0HulV5ner5f0YZQ1G1NCwEgst?=
 =?us-ascii?Q?yvTZBwL95fmFqng402qdSjXOJzrhEBp7/1G0oo6N6FBuEL4bihBAla0m51bu?=
 =?us-ascii?Q?OPfjYlHEJdc0DwADhJsIPiOaaaHENGERfGLiD6xF/u9A1LbfinOdUu0hVlmO?=
 =?us-ascii?Q?AgbMRGKryAXPMGcRiiXQEsPZT8Ct2B4BCTZbz2FqUgwaaQFR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7328f22d-01cf-4f79-45b4-08defa0c1a63
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:58:22.3698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBTm8WFCeq5K77L5C4YgDZ4jVfZtGZz+8nK4+ZhT6GKms2filDdiwmvryXiI6FLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789

On 13 Aug 2026, at 3:13, David Hildenbrand (Arm) wrote:

>>> +	if (!pte_present(pteval)) {
>>> +		if (ctx->max_ptes_swap < 0)
>>> +			return SCAN_PTE_NON_PRESENT;
>>> +		if (++ctx->nonpresent_ptes > ctx->max_ptes_swap) {
>>
>> So max_ptes_swap is actually max_ptes_nonpresent. But due to
>> khugepaged's max_ptes_swap config name, we just keep the variable and
>> related function names that way?
>
> Yes, that's how we handle it today, unfortunately, for historical reasons.
> Mistakes were made.
>
> I think we might be able to convert this code to actually only count swap
> entries, and simply reject any other ones (migration, hwpoison, ...), but that's
> something for another patch.

I agree. pte_none covers not faulted in PTEs (zero covers read-only anon)
and swap covers swapped out PTEs. Other non-present cases could be
1. transient (like migration) and they can wait until they are stable or
2. never considered (like hwpoison).

>
> [...]
>
>>
>> SCAN_SUCCEED + folio != NULL means to proceed with the pte, while
>> SCAN_SUCCEED + folio == NULL means to skip the pte.
>>
>> collapse_anon_pte_check() probably needs to document this?
>
> Not really, as you say it's straight forward if you look at it from what's
> actually happening:
>
> SCAN_SUCCEED + folio != NULL: check folio
> SCAN_SUCCEED + folio == NULL: don't check folio (no folio to check?)
>

Sounds good.

For this patch, feel free to add

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
