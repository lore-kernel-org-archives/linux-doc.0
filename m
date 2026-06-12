Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC830F938;
	Fri, 12 Jun 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268511; cv=fail; b=Y+l1kFan8SYYg0sUU+7+VycPba2PPn6x93jZVZqqQuMuz8T7F1sC2etWvez64hPvepNd4eHc748T58vsrgaKaZbGJAKoB5Vr9TALX2awwaRM2YtiS6uNVgLQGAdBW7248Yo9RXlLnZW4pDkcbfHhjOi0wxaT1dXdUS5ZwGe61SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268511; c=relaxed/simple;
	bh=w1ropqn7McLb+T4Bts36eMDtl7zwL0+vaZdkE/nwJD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DZb3uf54aaNpcPOQYLOKeohmSi8KPuhM51SXAoQG2vfeqlSFIkw1XMKztW1QRD4qSPLbx0EKWKKQH4p/e2ZOHfJbOeNVvgYbtf0A0ffCVIR84E3oiCvPrJnc1zI7//3iQ88Stx0mR+n2m950lxT+Nz0aFTuISwtFqnajEep8hAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l1Fam/D+; arc=fail smtp.client-ip=40.93.198.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l1Fam/D+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bANDBx/+SGKTvOcYZfpuAKiHdclvg8b1BfasSlNjeeyfrXFkbtbhxRFlQ1YoNpnHnakQuWrZZvebMolWnhMAnf46w544gFGzJLIorQU4K3HaKHipe7LoJChTBAr8GIWK3x8mOVGMAXZ4AjmXAD6+TQUccdV1T2JkDGYHKwN7knvNgXKHxbVNVyqgRdnX2em2M708SNPVVanhRi/GpZWg2xFX7r3LH3LmCbGV7VbHc/OOpEl11G2GmF4SOkBU0hhFzIdfWExjCv9YZY42pNZne/7d14B6HICHlNkfrpwkwIhA1qbIgZH+o7Y96iUXt5hKXD94re0hkuQ6t4ybD43xRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1ropqn7McLb+T4Bts36eMDtl7zwL0+vaZdkE/nwJD4=;
 b=r9HOtg7LUt0OzATfr+IyMGFb/Me8o1/209Itd5lKtetUl8CFJcAspikSZSB/661r333W2YzT3rIzmLq5CATBa6JPYM5Fgt+fDXZnD1D0CTAt6pEBrwS7fQfbRN0M/Fi29j66czT5HT/hI1YSecIZlZzSGy2Cl0rOoeCYWoxqa1Jdn3/h1pds9pzPkF5pQDiuFg8LeHTJLYiQ/U11AXKKIGikKygMaY87GqkA7V3Iuf6OebOajxnS8xOhTV8KR9AZ5aon+AZ+N5DxUWDN0oyKhVX+2DSFre9i/DkPuiV5HqY4nD0Kifp6R0j2zxO+sKx0w4dMT6khGgh216W2whfAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1ropqn7McLb+T4Bts36eMDtl7zwL0+vaZdkE/nwJD4=;
 b=l1Fam/D+cjcwjgoOq2R6/K23U7PD1SFJhIPVCuLmqClnnToETTOCvXokfh8A/lMc3VFmUPJ5C+fdecmt9Ymq2heBb2Nryrqg329m6VuK5kIncu4H9a9hGnEpy/0U5hfJLexe2SUeQXCmQcwz57mLO0M6Z5Nwt8Tn9n4mM4nTfi9CpXLUQXnDI/E29e6qlPl7nBEfRcnOdqDDDk6trKbT85/IkSJ2jlzYQWLxyB1/ctvB/CQ5Z4kj9d16uLzNNO16fBMK4QcF9jBOTPZJhKnWTx+BRhyCTzAesDuouT4SEqDfat4ty6ajNwd/HAS8ScFyJx+E4iBGdqG9iO09qoxD1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Fri, 12 Jun
 2026 12:48:26 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:48:26 +0000
Date: Fri, 12 Jun 2026 09:48:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
Message-ID: <20260612124825.GF1962447@nvidia.com>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
 <aiq5VigmtZq9GlAm@willie-the-truck>
 <IA1PR12MB6089049028A73A2078FC6831C71B2@IA1PR12MB6089.namprd12.prod.outlook.com>
 <851c4107-3f6d-46f3-b659-212ce4f69e6e@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <851c4107-3f6d-46f3-b659-212ce4f69e6e@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:208:329::33) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: ff325e18-a05e-4a31-98a5-08dec880e51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vGeRzR7e10YL0oCiglQ7Yyb07E8owHc/mBu9efS39f9vREc2NIA6x4+GzO9zd5OaQRLxYRGwqsir1bLlhwmPfim+ttJuUW96K+fc0BWWG3N+bUR1JQTRESu8NQcbYkeQB+vpIIkcEnvyaFYlvY94wcC6b38hWy81FmBvQyLvZ4rLX3jxbVCXMvlgD4QF7zVtVNBjhVegnVf5gUlk5vvQLFx+dkCkHedf83+4GfGFIQLOvQ2YRTFW4feCPwsvSDOjQ0L6tSpZmJtGnM07AEmNCrkZdPLQydjAviYgMK7ED+FFByypoakHaIzMm/lOnaquiWdwnTu3eVRHQ8ufqZqdWE8+627vR/3eIVGcYk6SjNFxiTUicNyKECwDGhRsQ6xSQq0NPYXCLn3fltH1djr2yvOrXTRXJ3KVx+Lvgwbnx7J6n4RBrsA0qJdah9/RWV/JbhmWZjwcH4Y8VzrPYmM4C49BF45ThmWPKHW9rPwD/kjNyHSFpQN2zHnsXurlNbddNjRjhMiH964xpd0z3it/n5NFMzrkP/NNqFAIaUWz1YMiHHzqx4GUD42lcvtOMOnwpcPS4+r7X0M69ayKz9H0BZFlM1VUIGB+CuaFUHpRrsqI74rnZf+KkrzbRKwoiAsbcwCMfi5XIqtK4qiVZYIu7jZ3V2W/aIMwH2OugKrD+uOI5rfzD55JC4FyknZuJLHw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f7xJMkp6Ejrr/7wxqqEug9OoYtx8Yj/ZFXsjYAauPZXUYnH0j+l+eNmjYXhZ?=
 =?us-ascii?Q?uFgrWE+bl3o6CBt9+/m4JFFKJGb0PjhlCG9FSMFxmYG3iredAiS5B1LOPpor?=
 =?us-ascii?Q?AC4PQurbDNwCNuvebzgSQgIqx/ZbbFdgPlgHvkX0/qKVslGvJWNcnRY1EA2W?=
 =?us-ascii?Q?d2laQfMETyDP+xJG9qETkBl8Wn+qgErVrbbo2e8EyaGEVM11tqiFPVo0L8xQ?=
 =?us-ascii?Q?IYXwxPyg793pXNkBi24L1KO/TQma4QyjzSVE1Ock2EaLoO1YJgLYf34+Wvfh?=
 =?us-ascii?Q?yOamYXd6sgvJ8dLr9LBpFt8BDZhb3t6KDj6x0TPBhqz0RzqxUH0fcjPIh/gh?=
 =?us-ascii?Q?PPTjHo0vPik2AKXG0afU5Mw1JwALlSa4Rbr5X00cNMbgbudNVXpcUGUsV+Os?=
 =?us-ascii?Q?yP8zG0hwzLOF7qCUFuZ1J1qcTfGX9FwwWFahOD7ndqSN7AVrWF05/MkGbFOU?=
 =?us-ascii?Q?OVcvGPzJhKTKjvXVmtho9NUXdmCXHeedWJv5RuSbzjY3miIv3Jx0c7mf7v11?=
 =?us-ascii?Q?m7qxChHDlZNN/Hoq5ys6hYKufnJuG7l1vj4KM1scJ0BLeQFUM4tE3YcwDiUh?=
 =?us-ascii?Q?bf0lA0eSZy1WDmoWxcL4D9DbeTZuJqYudhLAa/5se3rFqITLXLCzxyhp+sUM?=
 =?us-ascii?Q?pXiQCawqchjltiHcqcQFt1mAgsEQ8V8xZ0/Fvz8TT/a6rLP1VYWB6LL2cTuT?=
 =?us-ascii?Q?eNfCILzLX72NVEwjS7HiolORLhBVEh9rdMcUMAXYP3onnFJPHsuRKc9mzPTf?=
 =?us-ascii?Q?yuBTC3HOPHlYawm9ebd/fffDkGHvQJwTXNsg2XUYKcAmiOLBov7RR2PwsHB8?=
 =?us-ascii?Q?E9Tn2Gdwfi6qczn0EIISfNK8ZI1QiM7Fi+SA+Zuea7pBPXxyaUyBddoMGpdn?=
 =?us-ascii?Q?OuIECri0bhkc2aSUQDTW8Vzxfyxu+2LTO7hLpXelKNPH9DkhGVoL3lXVIb0l?=
 =?us-ascii?Q?JMZkhIhpAO/KC92jlSqLdMF/6Hvosc2e6+Tzu9GoQFTk9Emhx+Uj973lLiDn?=
 =?us-ascii?Q?GmcL5/gvrExtZ42W/atW7T5GdTj/0B7OoVdSUOpUqtkUFu5KsLYEOugoCqTg?=
 =?us-ascii?Q?KUm/ehCOfdjqZWT2LdTddmxuWHwxb36U/yrG6rU+bCLBufyKZh4BfAvOiCgH?=
 =?us-ascii?Q?MfYIwM1SzgoqXrgMFySeVlaY7KuiEekG3yeX7mncGx7J7OM74aiobpLAvLI3?=
 =?us-ascii?Q?mDU4XbhznaYLBT+l/rba+qeFK9o1Fox1MhZbdC1+iTc83RAk2KS21PbAWAQV?=
 =?us-ascii?Q?fBSNy9vKpZp1bFN/dLFozdNIY/lL/N0bhhJwLmJl3Uq1bJFLc8gzHpGboBDY?=
 =?us-ascii?Q?hPVM7K8cnxmRaERH4D1q/4ZsfqxxP9Um7/rhpMjKsaJ3gLgHtVYqnhPwW6AB?=
 =?us-ascii?Q?h5vAYYvPSK5t+V812dNzST1JP20jJgcLRPgk6tp5vIV4nSyYtwpI7MDdt1Cw?=
 =?us-ascii?Q?yoflXb5E44XMz7TWFTYgd/ouFj3UoNixKLyXZWkJHncjTRBVf98ad6QsoyA6?=
 =?us-ascii?Q?9/P58Qhc7rNTGrjBkzSwlC2dLHFQJKuoTPI4NypVTQfzavdgmmJ6yJTgRoo5?=
 =?us-ascii?Q?sHgxkKd0eyvqvqmF6j2+gMbSy5LNRYS0JH8lYcYMXzXhbvZKvvo5vXIXFMNm?=
 =?us-ascii?Q?meVS5x46FFEIh/lPFqDOqoZomxAYxs8CrYmvvQCz1ltI19+FqDeKccKF88DY?=
 =?us-ascii?Q?lItSM3CGYTRO3PuGVuxxZprPBnPpJIqXJ/g8M3fgVh01rqs4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff325e18-a05e-4a31-98a5-08dec880e51e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:48:26.0259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL6qJ8xqK+GcwNeFh7vw0MVE8TOzaLMas/VoLeWvqa+OuN4SLgsqfMFbVswvQhM+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8407

On Thu, Jun 11, 2026 at 08:13:48PM -0500, Shanker Donthineni wrote:

> For the scalar MMIO helpers, the workaround promotes the raw writes to
> store-release on affected CPUs as v1/v2 shown below. For the memcpy-toIO
> helpers, could you please clarify the specific reason for adding a dmb despite
> the documented no-ordering contract? Is the concern that some drivers may
> be relying on ordering across memcpy_toio_*() today even though the API
> does not guarantee it, and that we should cover those cases defensively?

I think given how arm implements them today the iocopy's are actually
the _relaxed variations.. I wonder if this matters to any user?

Jason
