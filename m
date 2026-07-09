Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C391E633C;
	Thu,  9 Jul 2026 05:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783573508; cv=fail; b=gv1yavsN9+9qnlGbb82y6fEju01r/Y2aZa0+TyijcjirL78Xseg6tsU+n8i0CZO96yu6UprGsrm/yd2RSiLwcnxLDjxWpJr2a4OA2ZQ7arRrX4XYVULtzGJjCVMwb8jlL/K7xaqo9UOvtR3JVKDT+sbQFauhHAqsLGEzHkITKmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783573508; c=relaxed/simple;
	bh=aKs60+wL7EDRzV2AY1W1riW0/yjn6I7AxOXA5svWgb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZtEwU9uw4HXyCd8ttUbetJP7cNkDVGIpc0whzZh4uc2gVDjYakhoz5v2pAYFBx8wum2aTb/p/z9Jqk5uZ5aYfTSxt/Wj6zGph23mIKTwrTPMNccehgJpPDp0yI3xFU3fHUcpCI1lXLJmU0NNMGtl6aZ4glxGKvk0bfunQHVO7xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=POKL5jML; arc=fail smtp.client-ip=52.101.61.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="POKL5jML"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCIrkW3M7j4m8mJ16olNXqgNd1ypbxjbBjhHVjcLtZPjRob/V8pq3cdOet4gpExbLMlKOeZXe4PAX4P8Xr30Qf0qo3Sxl7fx11EsiROQ0qM3Q5YMLfENYGWhK3ODi/n0v8zOJ1DaM4E4Um1GdDXfuUvFQGue298ECUegLJAUCa4wm1sOGkwIE7jrx2GyKeMf7qYQ3VE2uZ39QACxI/UyjYq+pd4LNxew7m44dIGaDH+469Wlf667iZ6pyCfKtRox2qZCxXS+BKEQV5BsRXYBth3NUZuun8+Zf14i5quUzBP1vueYWw8l0H0ocju6JzIPWolcxSgjSEXaX34GhBmzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtX8rBbtoUXs7PDMfYBh0zPvuDXYFHrC8P7KQI4qNDs=;
 b=BhUv0vTojU/1vXRcvxzamRCzbjIdUzcqZbezkLI2/W84RjwYGNSaDkQQ8HW4c0Lr4ZvUFQkMGLtKQ8pbSde2jJNPcojdGEz1UZ8yXtfXrpnqaXQSA/FuaHAPytS+a8AFUz8Eeu5B+wjnLgjJYNNWmvXZPBbX9yMbwn6PKx5FelOke3/w7aAPVDX22R5juwG4vBkiHWykX0OSdrt7leWej4gTLANi2dZkzVFb9k6RwXeAJsinfEChSwAmc6/pCbXqzUY77AZBQnpv9iRDHTsB4Ds6m83Ln0kEmxdnm7x9L/rBeIZki1SNtHn7lE2+ZiJjA8dmNeZgcQksYRpIYUKBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtX8rBbtoUXs7PDMfYBh0zPvuDXYFHrC8P7KQI4qNDs=;
 b=POKL5jMLp1CNRL2KZB2kN72VXOpL5eJy1sYaoXxOLqt3HkH7fEitRqQb5yTcXWXKHBEo3eUOtvxHANS41QvOSkHuepcF9rtFuzgHRyjY3Q2/raJYWN3CSSc15Eb4VpeFgeAs+AOHBf+va5Ei61TitrkHMQxRKybP3DTeRA8ONYRLDS3pW+gbQwKs/aHrX16kR7wYOc0q98zEXE4HZVDdE1n/s3298+31TGzNB7YxrO1NGO8Uiw7e/GufeSJXrZYykzhnkdovGl7IkmkNt6zJDden+nJpz9LcD10rY9J2fx5+RBqS+SgYvc/G0E22Bf6z4P7Or3HvtlOoHHWcRRU2rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 05:05:02 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 05:05:02 +0000
Date: Thu, 9 Jul 2026 01:04:59 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
	corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/23] sched: Introduce cpu_preferred_mask and
 steal-driven vCPU backoff
Message-ID: <ak8r-xZ_xxLI8ach@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-1-sshegde@linux.ibm.com>
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c80270-bd73-4d4a-5708-08dedd77a1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EgNnOVeL8fPw6zQwWLLZQkvSYcpWG57kQivgTP53ySMdYsqjx/QILJHSSV9usiWkbjh4lowU1FgK7SQPhpfpjfOGlYV/gHyzDJ8PwXyp806MpCseofXJ4ZO8+bm1CueMsZHkxDcWcbHytm05QOKJx/xQDySy7Y9EJ18s0F4UqZ+JsesIt9xZMAe9IDhoO4J/Bw9WxxjqQyNcFHM5RO6YCSafO3yattQV9YzQ2VxCMMmxEQWzeaLgNRLxa7LDGL/Lwr+ka4bIATdEVpNwYW8Rw/AFa1J7yiU9reDFd/fU+9WpbptPGZIgwVp0xBpGwUIA5BQU6fhYVWuY9YqEQCQkQeZT0sdW4g8Ney3B6VXPDrZLDOLhSXcUkMQvuBBqHQY50wgj6PB+0HEdAJUrPOI6X3WCG6Ylh8vzefPLuCs61rCcHlcmeL5meDjYReIyNT5n/jH+CeXhtRT9XLnHC/RM4suHrI0dH5sL6odKxTS6ELEPLtbi2W0QoYgwZMx7e91f/UUF9nxmu37FCqGf4Bt9zf4HsvOSXOgr2Ef7NOaBBvYyhhLY18cOGpRSZtCA8vZFM9bD6BiFfmRDKL5CnN+oCDziLziPvBSzZuKWNbxuCZxGNNhA0P2Lgtp7abk1Cm4H6wxHw/1QT8cL5kDJpFxf4/G7Z8aP2ghhu5AjMuFdEfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G+EftcGqaGYvEXY8ZnIk0T0v44NF+nroI3pUZK4de27VRj2946gTm38rxdDx?=
 =?us-ascii?Q?Ly+6w9bxOkGDCFfjsMJqRJjb3oRNicyXnyilX8RYXADWDGS3kcT/bHFiA9U2?=
 =?us-ascii?Q?L3Tli4/dmyGYzzcJTiwaf+27HmU3pRVyybv9ePvvTAmVomtuuXIly8EF6qOW?=
 =?us-ascii?Q?1aUzZ+mtcLmwqeeJoO2qEXggbqwRw/KvSFfh5ZcYaSv4G1kjlPWfCrSuvi7D?=
 =?us-ascii?Q?MzDS7SKiqvxVkFNOCWD8qCLiJFpljq6nXJuD5NNBuaP/MWPWVSGjalRzrM4q?=
 =?us-ascii?Q?G8EZBiZZkTdw+srMNx0SJc5R1X8i6HZweTtL6K4bmOomh/q8gD0eZeUlxsrv?=
 =?us-ascii?Q?KvLLcDk81+4F16GZWS5i3agw8Tt9xNTIEe17Mw3/M2kw1vBhJO8/Exy1agC7?=
 =?us-ascii?Q?wk7xQPK9ZUdIhU0RBZ3c7FQBCni+F+doznCCcFEciqVkDR5TvZBlzcWILk6X?=
 =?us-ascii?Q?ZkhDtugOsFen5e5Q5ZGpHO1CIJ2Ik5vD+1W6bT8fAzVpzQgSCgjMQTPOn2U0?=
 =?us-ascii?Q?XnHTMoVDjycSXm0bM8K3TmchdOqFn4DZx3TSMo2BWDzMs3wUu0HtQjB2KULN?=
 =?us-ascii?Q?UQMPd3klrQs8n2c9Rw4dzR73OKVW25NkWrXS7SA/1wfbvCY4qvzpeZ69/yiI?=
 =?us-ascii?Q?SZcAkYmQ2ewSX7ACYrjtjHPqMVHTzSO3/gbJUcBDLzoFY3L2ABpb7WPcBm1Q?=
 =?us-ascii?Q?DvGT81Mwz4U2pe/unHRCdh47e8J05GY5Tz5YfvhRXCIucEGxxVZvtLN6+Sap?=
 =?us-ascii?Q?nqZhG1YnQmXr/97Wb9BDKldGbIEsVHpBH8AgpQvZkIUGA7CM8VyOGa+cwJRd?=
 =?us-ascii?Q?z2/dO7jHs/C9c7khQnzetxmoxSzHrnVzyLugGXRoj1KQF8Qt5ON07hwJUtTG?=
 =?us-ascii?Q?T8H/XkolgGd0bM2YQ43QHY+jQH8S3Fgig8Fptp3+haMv3umCW13SoBDh5IIj?=
 =?us-ascii?Q?s+vxiUwTBbYlZgcOBhu2zGbhhWnsAWsi/EJDgCp+TXm7P/nzFC4FrVy1xpMw?=
 =?us-ascii?Q?0oAyZ5c33GPpf6FolmAsm3bwbFUPZGkYmCjcSMi7bTU/pw6kXWfvikRuIVno?=
 =?us-ascii?Q?Ssyei9colddu1RW4uU37bFCjCDc3/7LuX6RKxNLyACAR5zB4g0DStLNNwdt/?=
 =?us-ascii?Q?E6fd/JZ0I6ibIGUO3iDAC1pujPm5/7LV+4mFa0PSeOmjHJOrn8U91T+BN4Km?=
 =?us-ascii?Q?j16yNZOECk/U/7RonDZHDqLmuHPmgnAnURb1cfDAiU4KqdQQXNIqIaxwe5JY?=
 =?us-ascii?Q?PXwXJFHeZ4Wf6RXxqyrtOBqkIPODYiPenJ7egeam3guKjNkYyYqkTxOmAg/a?=
 =?us-ascii?Q?PmZcBXDKMRAg6OS0+HOuvzsV5enDVZuWLLMYKzxvLZ0twUAspdihQdfNFIil?=
 =?us-ascii?Q?a33pUKbZ2ceqtQ6R3uCqjipy480wvkmPn1p+sUJM8s889TSXfYUUr565pMbp?=
 =?us-ascii?Q?rFDNfk2Ps+HdjI+STSHKjR2kj9Td9cES+Ap+dY6z4Y/a0uxoIzPr+OWYufrq?=
 =?us-ascii?Q?FkSLxfvBuS2FaOR71hBVutRoljW0kx1NARCCE1ltjvJj1t6RqTlZ0LW65kPL?=
 =?us-ascii?Q?FMnbJ0r5t8FLyXhjq7Uf3aV5QTuMOliDNNJiziRUPYcoRAsl3GZSqmrLWDhQ?=
 =?us-ascii?Q?eGl1T1B4PGinDkuB5/aM144VIdpVnxManTmods/7yz8DI8Z9j3EuBUi8IwqZ?=
 =?us-ascii?Q?uD/Dh4yKogAY1YzXofy/451HhKW5TRKU7SiErDgKNzW/p/mzDs54TWhiC7YK?=
 =?us-ascii?Q?DBQX2frf1g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c80270-bd73-4d4a-5708-08dedd77a1d5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 05:05:02.1232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09XfUbNs9HMd0lrg+Nax8v85RTXiqOTpFB00LHTsA0y7kuAkq9Potid2SH0vC/Mw1gqyTmV3T3Tx9EvoM1a76w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076

On Wed, Jul 01, 2026 at 07:46:31PM +0530, Shrikanth Hegde wrote:
> As mentioned in previous v5[3]'s cover-letter, I am looking for guidance 
> on the below concern that will arise.
> I think there should be a MAINTAINERS file entry for new
> driver. I don't see a drivers/virt/* entry.
> Either as a new entry for driver or a few file in SCHEDULER entry.
> Let me know if/what I should add it.

There should be no new unmaintained files in the kernel. For the new
driver, create a new entry making yourself a maintainer, and relevant
people - the reviewers.

If you decide to add me, please use the

Yury Norov <yury.norov@gmail.com>
