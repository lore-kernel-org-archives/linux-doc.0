Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C493161A1;
	Tue,  7 Jul 2026 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436155; cv=fail; b=V5KcwfOCCYceXeeLr8slq95+BZRp+gcv4Q7J9p6WYbk/unk8P15j8NALA9tF/DF5hVeMBM64k/ZcOWC89BprYYo+xOh/CfHGavv5djB3Em04gP4m6MaPIQYBvSQ67YKuiGJfU5LyKfoTg6MMenhyJvvURHuMjRihkMRe5klBnOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436155; c=relaxed/simple;
	bh=lricLdkiSNrIVfEkZEH3jHJiV6aa6aw8fXEVE+oXuDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V3qlkZdbd1lFtbGT0H+w3RbYv95nnhWnKSEM0L8QwvXrC45OxHixDsgUHstgNilCKiKFTKIDNd9heZMuMxp9GkziotxHKSoP5UzCOKbVnhopDk1pM77o40vyp7nYhF6NRySPlGLXCeumt19uiZ0mju0Rugu4zmP1DhC8eMaXY2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BKENlXBS; arc=fail smtp.client-ip=52.101.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BKENlXBS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoBfEEzTslVIIHVJVB2BzcBSNLh2429PpIvClg+2c1Tv/5kkCL9tC/w36F/xZyBYBLdMZjdkWSHnrMvZGHJZcVTvk37zVlejbOfyaZYKxM4uBZctzmhg0I2f0fYfnXMW1MmablwwAgujvqlx8Ci95TGRMwXYeP3+r1oIlNLMz7T68Ww1DR0AT6oQpZV72lr9uGb1eT7Ht1YPGds8YsHoHzzHNXMfAb7r7vtN9FKlHrpU2htd8sIsQENnv4RKP5AImYeN1c9Ip+JBvBP/Aj9ZUaLSNvkmt859l0UlfBmmkqJqToN9m1Z05RAof+wlIIF0b7Tb0HWDqPeYh4hhq/AzHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKffUsmNRKSqxV4f745RCzfEVkkGvWVwcFdthO7zp1w=;
 b=LUW4STmym2rEFJbQGLa9pTWoUoJzKQA04w/bGauM4pCOgVDibk52CEcBmv+qlMtlC/CBOGbiSaSlYz5flJ0QdWFUbHlK5VjmVPLLtdN7rlJycB0h6VHLanycSwKPYgYTb5OseO5NKIxGUp9npcRjZfhwtQLKoYfP2yrK+7GoC7rNES5NH1us7V4L//ed3fMIPv0IjXPDiXcFIkndwjsnKetMWnI5owHndYXj91cJr3MlEDzBQpcaxQt84lS/qOnWXllaktEDqsIEk0HyYQuUOVr6rnoXhDpLGxCcenJc1HCAkUhtXYbCCHlnDOpA5dWw77a4fFNadMOmCEmv309PjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKffUsmNRKSqxV4f745RCzfEVkkGvWVwcFdthO7zp1w=;
 b=BKENlXBSQBteiWwSfaY1E50zLUT7rqWTBlvavg9JphK50NGU8Qr9h5ibX22geNuFgjDVTAjTgT5nEbfEmoclOWxQJsrTh2UM/iG+5PvI+bpfC49GSGwrUTT+JcTmbGH34hon0b31YZ4KL6mH3vF+o51kmrRkqECSTmgDk/YXSBhU9ofxoBHP2QmH+fesNH84ABvM7VPjGQe+nLAWKRNdQ0A825Z0vZEe3u9xkQYO40iPwoOTyomr2EYrNARKSDLCecRrwBTYfJGf+uEUVPelcIrs00wIS/Dz7OFDiEKcOXPbwXsqcN/bdFunkJ84G2YyxyuQ0Z9rA3BSVzns1fEoUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SJ5PPFABE38415D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 14:55:47 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%3]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 14:55:47 +0000
Date: Tue, 7 Jul 2026 16:55:35 +0200
From: Andrea Righi <arighi@nvidia.com>
To: luoliang@kylinos.cn
Cc: Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Documentation: Fix ops table header reference
Message-ID: <ak0TZ83oJfsNzRm8@gpd4>
References: <20260707094538.3033292-1-luoliang@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707094538.3033292-1-luoliang@kylinos.cn>
X-ClientProxiedBy: ZR1PEPF000077E9.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:918::45a) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SJ5PPFABE38415D:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9289bb-7825-4746-3093-08dedc37d3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	0hgCT5GPI04aRRMEPjuDEDW8xb17zNNWDZCclT2eRP3/4wvhF+Rbu8yQjAvPhNFV7Q3Ww5phYosfvr/8O2/srhy8a69Jllqc7Q+LW1SH2LOz9EJ7AWoytBrWuhAirkNg2Z+MxLW9LP3zVA1HqUq5QknNwuOm0KeOrpTk4oyzXAN+xUC/7JXDKHuD9vinhn6f/slb2UiOxWeNbqI8koyP0X4ALP98dauLkNXyDq254BdH9Z9DALZ8E80e4QpElMYr9/D6/aU0i4wuOMotkukRoi9ZplXzJiX4OImgMJm/j8DH54rBhFJAzFeyMqpn6vIOGngfSoRsV6xUO2Tm5SuHBF0P3CGu5dD+8cUtZbxVBwNeab1cH0j5o+V4Ezb7u20fGfXS/OY00yFATKS1mktOLxZe+QmZQseZB9GW6cykdcXgET0bGwrE4EatWTSJN7ZIHq1PRLx5vAJNw5mYwQ/P34wFboE2g9Fix2l7vTbaRilfwhJtbUzyaUPBDq5HL8lHsIe7Yw8h2xPU0CjMpOmX1ngJTuVynUlhAIa8ErI/Ez2bboemj/bzbRxBBEQm5SpBIbdaUHw3PWejufiyVB2BL3usNlDcEyTpklvFYocfZ7LuHCyZVwMlH0drs5UISHUYjSpIO81rMtJKMKeKLzsW7gmpUjFuBLcDNc/rjLvoPgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/tgRK7/X/ccwwLJdYzfeLuqZ/PSJL8eywwHAHsn02EEr1pNeSQfp3cHKR6W?=
 =?us-ascii?Q?iIoF/rfA2n8VZat4P6fZH5wwSAvdcyJQu4rTvLBAEvj+7AvKVJUAfjnsvUvh?=
 =?us-ascii?Q?Xm+m+Fchl7+OznsNO6pdAm+hefAFS4IEyKbp1e6ksSLxnfGsE5ZunWvhWXQf?=
 =?us-ascii?Q?Yn+3ssou2toZasrALPT4BjMBbASw02tYl2aVyDDbtIuI6AeWkgVOFCFraXl7?=
 =?us-ascii?Q?hDNo0GioFQjd9kD7O4yVgRuaD05AH/eiM+56pT5FjVUuVYaBFQPTFmwXr+Wu?=
 =?us-ascii?Q?Yv/zGoTKiDFmNCWRrStwOG09BxzvNWkAWs5snyjTdJyeUltLlTjjZ9yhDgVy?=
 =?us-ascii?Q?CfzmBan05R8lZYqy0N5GBTiL6cAipzplR5bnno0ab+isb2SzUQorkg5GBj5y?=
 =?us-ascii?Q?QZmVAH6Ig7Z0euo8gD69GPc1cR8vpA3xTkDgLP9AhrFAUSmgLHWRW1AZAqx5?=
 =?us-ascii?Q?C4yUBrZlOc2ov0STorvt4Ji2gZKepSuetnwN+v9UHpbq0JI7NLPcUD46uOmy?=
 =?us-ascii?Q?jVUyhQ5fue2X9LB6PqiVMy2VmgA9L4f9OT+vP5GMzb0DrxNhXifet+YKdS4S?=
 =?us-ascii?Q?AfWvDJcX/lq6IIkoCFD1zAzoKh4SQWSqoP2P5PzzXtE0jEJhXIrlMq1syoFy?=
 =?us-ascii?Q?hA7xFqS4sC8mjnU3qfIeDUfOYlxl3l0NPAr3FMfuKBHpK0BlEon98KG5CldE?=
 =?us-ascii?Q?Mg2rQqI3UqpEffeXyRz34YwHr6Wh8gh8y+E336IMMEvdQVqsHo6JtqtcfUl1?=
 =?us-ascii?Q?3WYw8PKdqWSW833hHQxeoCasa+doXxogVG7L2mHaghgPDL2LLkBaq03EysKM?=
 =?us-ascii?Q?E1SM+QO3pxmd2uOF7ODfzgTRtKKHhjr9/TGaNVPVVMVddDT0LQloWos2C2Em?=
 =?us-ascii?Q?zOEsed9Zjdo7+Dp7lWv+0mOBKI7wXghB0VRg+6j/UKYRBVwHzXy6OXlIyHwC?=
 =?us-ascii?Q?/thScn06iFDV58L0bYayp2B42ZXMZq47DzjjXtVUmUgvihvej5ZV9Xf4D9m/?=
 =?us-ascii?Q?XQngdASc7DG2gGccA5KFpqLiKtnf1xsPOboBcP0oXVRw6NUpb8PZ3qiwX75F?=
 =?us-ascii?Q?PPPNZFfa4kwkC8DQSN3298i473vGq9sPuUEr1+oHOlNnsBFSa0zeuW7IHavt?=
 =?us-ascii?Q?4YSPIQO5KnIMSsYCYb9MqZS2tQKjtYffURdgRctv6epFtZ5/dTXDIgeUOUvw?=
 =?us-ascii?Q?mGWiVlSKnJuXIGHpPbMHx9SSdx+J+I6JtnhSPcERgV+LyOHiQt9cIN5nYYk9?=
 =?us-ascii?Q?hRyfYHodQVAgK05y/2/QwD3QVk2Y5oop3HRPBqLJ2VZAylMAqzeHL3cWflqz?=
 =?us-ascii?Q?sivWtGb7ec+Owrm/b416rMNwKJ7o8sJzjSqdEEQnYDU3geLQjMyNys/LysLw?=
 =?us-ascii?Q?pF/boaDDRy6FCIsk/1W+2pMjZ1ojjwy10PF6XwU8IbdB2B4i302YY5qE7Cgt?=
 =?us-ascii?Q?Hlg1NvbCT6/gEtDP0zAKln9Fsg/eGRN0AqtIJsE++g0T7Fps1eh71tLaKkUp?=
 =?us-ascii?Q?EAicwuncm4KrEJv42nOb1gehNJN75yCesCm0Bo4GYyW/2DUk1FaZLyAIxC7V?=
 =?us-ascii?Q?1WgyReUIVCO3aLAPNH6WkTjYelR1LN9srcC/AbqhcN2AtYL4KZwQ8/ojdXjI?=
 =?us-ascii?Q?WBXEmeIyblH7xoh0KU99LCp/6A9/4L6FYvDvgF4pHkn6soFi5v4+S3h8VYYS?=
 =?us-ascii?Q?GhEc5GWCmsSZelaZHwKFpYaO7ZKO5KznKxBZmtJaCdDgbfsitXSDMRK/TaAc?=
 =?us-ascii?Q?F8K7I/xcFA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9289bb-7825-4746-3093-08dedc37d3e2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:55:47.3968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJS6kVDchWSaxunX3FFYQsqRKgXZMwacf1cDV1/1L7rk9e/PdBzYC3nHvdI21xksrdPo105OaHZtoLgsXlNcVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFABE38415D

On Tue, Jul 07, 2026 at 05:45:38PM +0800, luoliang@kylinos.cn wrote:
> From: Liang Luo <luoliang@kylinos.cn>
> 
> The "Where to Look" and "ABI Instability" sections state that the ops
> table is defined in include/linux/sched/ext.h. However, struct
> sched_ext_ops is actually defined in kernel/sched/ext/internal.h, along
> with the SCX_OPS_* flags; include/linux/sched/ext.h holds the core data
> structures (struct sched_ext_entity, struct scx_dispatch_q, ...) and the
> DSQ constants. Point the ops table references to the correct header.
> 
> Signed-off-by: Liang Luo <luoliang@kylinos.cn>

Looks good to me.

Reviewed-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> ---
>  Documentation/scheduler/sched-ext.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
> index 4b1ffd03f516..2771ea4cc14a 100644
> --- a/Documentation/scheduler/sched-ext.rst
> +++ b/Documentation/scheduler/sched-ext.rst
> @@ -493,8 +493,9 @@ a freshly woken up task gets on a CPU.
>  Where to Look
>  =============
>  
> -* ``include/linux/sched/ext.h`` defines the core data structures, ops table
> -  and constants.
> +* ``include/linux/sched/ext.h`` defines the core data structures and
> +  constants, while the ops table (``struct sched_ext_ops``) is defined in
> +  ``kernel/sched/ext/internal.h``.
>  
>  * ``kernel/sched/ext/ext.c`` contains sched_ext core implementation and helpers.
>    The functions prefixed with ``scx_bpf_`` can be called from the BPF
> @@ -555,7 +556,8 @@ ABI Instability
>  ===============
>  
>  The APIs provided by sched_ext to BPF schedulers programs have no stability
> -guarantees. This includes the ops table callbacks and constants defined in
> +guarantees. This includes the ops table callbacks defined in
> +``kernel/sched/ext/internal.h`` and the constants defined in
>  ``include/linux/sched/ext.h``, as well as the ``scx_bpf_`` kfuncs defined in
>  ``kernel/sched/ext/ext.c`` and ``kernel/sched/ext/idle.c``.
>  
> -- 
> 2.43.0
> 
