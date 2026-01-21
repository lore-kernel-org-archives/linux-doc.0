Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E687A1FB1;
	Wed, 21 Jan 2026 17:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015549; cv=fail; b=KCGOVkxk63Z8TkJt8kfUSJya98rH/bpPBAZ+RoD3nX95jg4biUEG3zCv03rRtCw6CnXf0f0v/6WbEyFocDC6jvnVitfzrdTV9dwKZe1dLESN/sIMoc7BpjLwlU970ckeZQTzs7Q9Oy5OKytrGuQ0UGW2ClMf5ObpiEn3QxNHb8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015549; c=relaxed/simple;
	bh=0QnB23oG68Wgfk9b/MFOpKl59GhkVy6R9PN6AcCe3OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CIqjDxHVgSCCtSC5LiToK2Az8fhmy8c5WIg6/8pySQVevbB5J2PleeScBRa/9Mb9TuyJ8u2eafmCudsOlgyrHAtwvM2n/JoLKV4uCvRLS3olgrSYoxbC0vjwEO07j0+6GpiLSsahC1BqF4z85Vq4AVrKRDYv3t4oRChcRnBCet8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c4ZStg68; arc=fail smtp.client-ip=40.93.196.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c4ZStg68"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFwiaR7MlU2dV1SyGTCwKBexkBNsBZNIxq6QF6KXyKAsHqIjKPGsCURAPQyajcy3pzJFGaanmD7yvR9ugoHAkcBIYr8uWh17J9HgOxZWCO+DC1+BzuCOVg969EvNtrdIOSVT23O+oP6QK0iC+UnzwHyhelY98rDTQVn0FM1QrymdoXoaMrC7hUjhPC806+E8WmpM17ypSBWCbhtx3UrgiTtKm3PpYmFasxrwANx+rWAjCOZN3JSIl/WYxq+sqvQbrdwCD/+oY9W6CSJUa66qfj1ErMDBxQigrJRTjNpmWL/YJnkB5mBoWq5tpfzY2n03qy8bg6iW63z5nP467ecz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaldlhhIaBIBQfoPVnTWbisuJL+VF56mC8sbBrRrKUk=;
 b=HuR+4N+ycG1aNFWjAtYrbivhMziS2QzsKHoCpdUv45S/xxcLpAQESIcan2TNunm+bxp/av0iRHTvRCuKjx2Yrxo0Iu2HI8nyHqESGFRSAl77zsTTsBKqyrcA/WrtBRKicGJniQNyKaCUFkVBcGTgt7hnbWaXsUH9dSoqiunVm26pm2wh+Ek/P8fpLsnof/l++oGZoApBciO6+NcGYIlaqsQzqQA4jOuyUdYbBQjo+6tXT4NrMziwXEj8LT6LWYi4Hm2SZhpVVWHuojoRdgS0bkzSi5NVeISHPh3YGaVbuYWAhJTF15V2QtGfIQNhWxc/fnMheQs0LcKO8mVc7Qc9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaldlhhIaBIBQfoPVnTWbisuJL+VF56mC8sbBrRrKUk=;
 b=c4ZStg68TyDuKofrVLtug3JAlwPZzbXGPZyp+wtkKgnjSl2fcLddhwVbge7ooYgSkuWSxg5N7tDqOGGScT1/b60YY9eZE+HdGqP+0wBxyPEBcmgs20AO0snVSJvallv28LBV+g7lUiKZrHXXtZo4kjX2ulhpoW5CmeByjl1x86m24gjISUBrvitSFyPnXdgtW2M3uDi2Wx3xco7fJr+lengcQP1TuNI8hSjJQjMhnKyadaONsubXuX+lAvMOF/+3iRyP/p3qRz1rGXtJ+X6+js4mJh7qjYimVPio8DJwtVmFTuX0FMIPGq2dyRZ+4FGGPEorgTVze3VTKJiaa0xchA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.9; Wed, 21 Jan 2026 17:12:18 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 17:12:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv4 05/14] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Date: Wed, 21 Jan 2026 12:12:13 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <EB8941D9-B6E0-41DD-9C44-038D21583E17@nvidia.com>
In-Reply-To: <20260121162253.2216580-6-kas@kernel.org>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-6-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce45564-bf65-4507-57a5-08de59103b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkFSUVJoVVorTDlTU01qeGFwaHFQeDJUc1Vuanl5OGdIZ0c3SCsyM3h5bnFv?=
 =?utf-8?B?blpDekQ4UDRubm8yK1RRNnJoTmt2cUdVQUNpUStkR2RiQ0V4SUhEM3RHN0hi?=
 =?utf-8?B?YTdYaHdEMEd5eDEyME9CTm1yV0RXUnNKaFByZ29SMFV3dWhGOVF1UDVPVk1u?=
 =?utf-8?B?aVJURElJeGpoRUNaY3M4S01MUm5FbkFtSnhWS1RDMWE3dlQrdzNQQ1ZoRnhC?=
 =?utf-8?B?b1FCODlOb1V1Y3BldVJhU3RRR245aURNTW1sVXFvN2g3cEZWck1nWlhybDB6?=
 =?utf-8?B?MDYvVExrckNDRnBxU1pGb3hhY3FXODNKQmo0algxaGZ3THhzYVN2dDZPMHIw?=
 =?utf-8?B?ZmlUa29uaGhYc0RRQTlSdlkxOTVUY0lueHRoajh4VlB3dWpWYlNxVHNaK2RX?=
 =?utf-8?B?QjdqUkRocmc1ZTJQaUhsRmIvUmIzeHNQZUh5TjBWekdBeEJZdVBWNFEzUXI3?=
 =?utf-8?B?eW5YK1NzWXgrY2dYQ0ZwR3RiMzlWeEJiTWJWOXBkSkRiaVF2Vjd6QncraWxN?=
 =?utf-8?B?QTcwOWtZZEJpUklYb0RTOUhCa2FQdTNRZHE1b2NKMERUNTVvYloyNUlrSHNn?=
 =?utf-8?B?WGFUcHlPRldIR0J6RUYzWm1zZlh2TmNwRzR5VnBHSTRRcE1QT3lTd1Fqcmk2?=
 =?utf-8?B?MWpFQXcwSHl6aVpwNHhhbVJoUzVGR0M3aW9lNkFBMnpnNVVXdnA2bk84b0FR?=
 =?utf-8?B?aWJhaXhienRhOFc5dWZSTHpleUpCUUF3MlQzMFNQM0NvL1lTZVYxU3laMUlJ?=
 =?utf-8?B?ZGI4M3loM1pmMHJHT2hwcEpoYWtVei9hdGl3WGFaeFFocTdUSGtkTmN5cmpr?=
 =?utf-8?B?a2tTN3BlZ1NvTGRuZkdJTXNqczN6QnRBcVFqVHoyNFMxdi85anZ2elcxaldC?=
 =?utf-8?B?Q0o5NzRRQjlyRW1HcDh6LzBNTXgwSkVsb3dhTUM0Z2t0MEh4aEc4QVJvK0NK?=
 =?utf-8?B?M2Q5RUxGSVhQaDExaUdXa0RuK2UrYzZsVGJhbU4xNXpvMVZLVnlibXZtV0lx?=
 =?utf-8?B?bVZRcDF1MXpueGZCVFJMbXJRaXBGR3VRTzVMYlU4Mjg4MEgydElCS2UxN1h2?=
 =?utf-8?B?QTN4ZlpYRmkrNTNIekx2aUNmWFpkb0tLYVRId1dQRFJBSlJUOHgwcDBJNFhO?=
 =?utf-8?B?OGpvUWFDSnBGd2xrMWpnTEo1YzFEYVFXNy9lWVNRTlNVR3ZRaGk1ejRqN0pJ?=
 =?utf-8?B?TklYRWpzVFNlQWdNYzVuTE1vaVE0RVF1NkdPUUZ0OW5ublJHSzgvREdPS3Bz?=
 =?utf-8?B?cWVETHM1SDRiKzVpWUUwQlhNdnNOUVVsQlNFbzNoaFJrQlcwdHgycnh0T3dt?=
 =?utf-8?B?ZGt0QTZqWEw5a01INUNGOXVid1pmOXJjMmluMXd5TlFYd280NnluM0hVakJF?=
 =?utf-8?B?VUlTR2pqU01jNXZyZmxTaXc0SmFVWFlOaUY5cnFOSS9MZzJOaG4wTHpoc1V2?=
 =?utf-8?B?N1ZrV25qSWlIRVg2ODlMRjV6NVdDZzFMRVpRNGRHdXRZbEtYL016Yy8xeUYr?=
 =?utf-8?B?OER3UldWL0FsNzRseGtIYzU1MjJWVmVwTEVVWmlZQmwvaG5iK0ZJWW9VQStY?=
 =?utf-8?B?aGRHcisrSlZtOWZML1ZyRmNCRHM5SU1OTGhKd2J0SWRFNVdjYzhUL0Y5dEJU?=
 =?utf-8?B?T1J5SyszajZTU1EvdUlLTXE3QTJHS053OTkrcE9UbWM0RzlHaG96cG9xVEVH?=
 =?utf-8?B?bFBrMTlnWWpPQ2Jsbm5uZ09Ma0dkS1ZNQVZ3VTFFRXBHV0d0OFEycUJRc1FR?=
 =?utf-8?B?bzExS1ArbnR2cmEwSWFlNUFVUWRLdGdmVVE4VDVQRVVGUWY4M0xxaVB1SmZz?=
 =?utf-8?B?bytwV2txdVBwVHJzdmpiV0p5VTlOSGlhR3ZSaGxiTHlHOHZ6MkxoTVlXanYy?=
 =?utf-8?B?NHVFRkcwZ0VBSExPZ2xYcEJBSm5xall4Y21sT0ZhYXN6V1N0emQ5cElZb1pQ?=
 =?utf-8?B?MUNkbmEyRTJZdENtWmtUaThNdG1XbFF4K0cxRW9vcEN5SGx0Qy9USGJCTzBH?=
 =?utf-8?B?N01YTWpVSnh5SUxJVFZ5WFo1VzhNR0tuNmk4QVVlMjFLSEZ2VXdRNGx1bEdh?=
 =?utf-8?B?elVTa3NvMmg3dTVDOXBCTkpoWFJGNWlOQzBuNUJXWFVGRjBJeVhpbDZXSSs5?=
 =?utf-8?Q?iAHQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWh4V0NLcmE1cTc4N05oK0FZdGFoYXFIV0c0ZTg3RlUwK3ZicDI2eE02Rlh6?=
 =?utf-8?B?bC9IenQ2dmRaanRRaWFRR2g4V0dxOGxUMVBqYlpxVmR0YU0wNlVObzUyUGF3?=
 =?utf-8?B?WUVFUjE1c0RZOXk4R3E2TmUrSlpST1VzL29HbVlCZHhjbTJkVXhmUEFGTENh?=
 =?utf-8?B?dnVoTXNTSGxTTFVidExyZ0paQU8vRitNdnNja1VReElsZjdESXRRRVA2RnM1?=
 =?utf-8?B?bFR1SEtzM2R0QlNGZ3gwNWdBTmZ0N2t4Q1NTWm9aUmlETitnMW1IT09oWGJi?=
 =?utf-8?B?NThjSkZzMjRwOUp4STNMekY3R2Z2dWhSaE5TVXJoWVJLaktiblBTMzBwa21h?=
 =?utf-8?B?cFM4R3dmMjlDZHk0S2crNEFlNWZJMUduOGlYREpieTRFVmtVTGNpN1pCQmFW?=
 =?utf-8?B?R2lCcnBBeEtiUEpZUEhORjFGSEJiRlBqSkZweC9ROE9vQjE5YXMvNjNZaU5Q?=
 =?utf-8?B?S3VlOElGZHV0b1g5eWU0V0RrbnBlNWsyTXRpVGo3N1lQd3VvYnpzK1lKeC8v?=
 =?utf-8?B?emlKL3BhalMxQUpOY2o4TldvVVNXL0ZnV2VtTEg4am1Fb0pVUy96YlB1VGFr?=
 =?utf-8?B?bTdiOUd1TUt2SFEydjlPZURnMXhpTE5Da0dxRzlpRWprWmdFV0V5dnBranB0?=
 =?utf-8?B?ZVNRenhTSUUwZEh3V2gyUzhRTHpzSE1yK0pVanYrQ2NOb2Q5bGVuTjhjOWRV?=
 =?utf-8?B?SG1iYUs4TVhZajZqQlBES2M2WkVZZ1R0T1lGRitSQmpmMGJ4L2lGdlRNU3Js?=
 =?utf-8?B?REJQTHg3bmxTanBrRW0xckxvZ2M2Mkp5a0JUZWpKdUx4K2FpRHZaWDAxTS9T?=
 =?utf-8?B?WDhKOXlabElydkRoVWJ4ZlIrR01DT3hDMkFpT2xja0YzN1kwa1BqU05qVzUr?=
 =?utf-8?B?aHhtendVY2lqWmtxbC9oMGU1RnI4UGtLbC9nS25PL3JIcHpFS044dGdtY0dC?=
 =?utf-8?B?ZmhnOHU0dC8xT3pMa3BvYjVFcG5teHJ6QTZIS2lhM2JnZS85RTEyTWhhWEVR?=
 =?utf-8?B?MDVtcFlYZ3FJSUxvcm82S2d1MFpZdnJxNkZLNlJNZ2tIa2o2bXBsaDRMV1N3?=
 =?utf-8?B?aVdIRG8wb1k2eXVKblBYa1AxdDNJUGx0Rm1PMlFCSzNQNDEvL3N4Yi9EQ0k5?=
 =?utf-8?B?L25ZNEkvNDJXVFBwQzcrbWVQdnJJWlJaWmdHTzJFa1ZXeS9idU51REFCVGsr?=
 =?utf-8?B?ejM0emNRQk9HMWRtelFJbTRNbWxZSEIxTzF3UmpRbnVxTWJ4NGtJblNGNms3?=
 =?utf-8?B?L25ESWtMNTU4Y1hBSS9ZUzJobzh6a2dSdzdiVjludFhQalYyano3eVN6ZGZt?=
 =?utf-8?B?S01zL0w3UjFKeDJLbmx5STJiT3ZZSlJHcVArVFhDTklEZUhvU241aFpxYmhj?=
 =?utf-8?B?SVpOazhzdFQ1Nmxyc2x3KzgvODJiM01GZ01hZGlVL3VsYkpaS3g4Ui9JOHoz?=
 =?utf-8?B?S2drTEQ0SlI4enJkWlFPTjIzZXhIK3U3ei9yZGF5Sm5zYW9qS1k1ZGQzdVo3?=
 =?utf-8?B?cytrSEttL1lEODFaVTIwL2tjTmZERUxJNHhjMVpmajM3Y0FkdlFTQXB3UWwr?=
 =?utf-8?B?SFNMN3dlRFZzMTd4N0IyT1dydTNpNXVoY0pGdEZBenRmU0p3SlVCWkpEbWV6?=
 =?utf-8?B?WGd3cmtEV3EvSU8rY3BhdVFZZFpSczltU3dWeTdVbkR1dEp1NmVpR0pwbFUw?=
 =?utf-8?B?YWtqUFFmWmwwWmRTbHBvSDZ0R0dnV2lzRUxpQkZ5akFTeTd2U3owcHNOK3dS?=
 =?utf-8?B?ZnQvaEZBZGxJSVJOb1Bpc0JyOTRiYUEwLzRTdDBYN2RyUDlXSkpST1R5R3lQ?=
 =?utf-8?B?S1NwYldkRkdoNGZJanlMR1BodllmVlNaNTVoMjBCVTBsVVV0UVdCYVJjWCs5?=
 =?utf-8?B?aDNtSitIb01QeGZlbldURDdoTjdoWndVM3psMUxzNXo5N3k2aFRYSGpOdlBm?=
 =?utf-8?B?Tkl1dzlTblZjOHdXN1ZkWEo4eWJNMDVOQ09uSk1SUEg3bXNJbE9hd0tydlBm?=
 =?utf-8?B?U1hVYjg0YXNHWnJqZU9LeW1iUTB1S2k5RHdCekF1Wkt2MUt0QnExaGRwM1FT?=
 =?utf-8?B?cnBhalMvbExhU1YybHVqSmROb0R5YVV2UTNwdWRZRkFORjFFbVZMYUVrSC9Z?=
 =?utf-8?B?MFQ2MVo2bXYwaEY5dDBpOG5leGxYRUlMaDE1Y1BFRWNhdGpIWktDUjd4YzRO?=
 =?utf-8?B?Y21yWHJ1Yzh3ZVU5cERvVVExUm5hcFpBa1E2OEo0OTFTRDN0cGZIUTd0eEFG?=
 =?utf-8?B?TkdyaXlkK0thU1dFSkE4NkhxeXVMa0dyZkFYYVM5NmxPSzZwQ1ZZOEFaWlcr?=
 =?utf-8?B?RDYyYjN0WG5MREx1SWZvUTM5Qm1RR3JJdmZZeWZVZ0svRmpiUjAyQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce45564-bf65-4507-57a5-08de59103b58
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:12:18.4392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snwWABZz9u0AW/7o9DNQ6Qyk+440Sq+/L3AR8KORpdyhaC7kIaxU9LajXFFxUa18
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

On 21 Jan 2026, at 11:22, Kiryl Shutsemau wrote:

> For tail pages, the kernel uses the 'compound_info' field to get to the
> head page. The bit 0 of the field indicates whether the page is a
> tail page, and if set, the remaining bits represent a pointer to the
> head page.
>
> For cases when size of struct page is power-of-2, change the encoding of
> compound_info to store a mask that can be applied to the virtual address
> of the tail page in order to access the head page. It is possible
> because struct page of the head page is naturally aligned with regards
> to order of the page.
>
> The significant impact of this modification is that all tail pages of
> the same order will now have identical 'compound_info', regardless of
> the compound page they are associated with. This paves the way for
> eliminating fake heads.
>
> The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is only
> applied when the sizeof(struct page) is power-of-2. Having identical
> tail pages allows the same page to be mapped into the vmemmap of all
> pages, maintaining memory savings without fake heads.
>
> If sizeof(struct page) is not power-of-2, there is no functional
> changes.
>
> Limit mask usage to SPARSEMEM_VMEMMAP where it makes a difference
> because HVO. The approach with mask would work for any memory model,
> but it requires validating that struct pages are naturally aligned for
> all orders up to the MAX_FOLIO order, which can be tricky.
>
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> ---
>  include/linux/page-flags.h | 81 ++++++++++++++++++++++++++++++++++----
>  mm/util.c                  | 16 ++++++--
>  2 files changed, 85 insertions(+), 12 deletions(-)
>

<snip>

> diff --git a/mm/util.c b/mm/util.c
> index cbf93cf3223a..f01a9655067f 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1234,7 +1234,7 @@ static void set_ps_flags(struct page_snapshot *ps, =
const struct folio *folio,
>   */
>  void snapshot_page(struct page_snapshot *ps, const struct page *page)
>  {
> -	unsigned long head, nr_pages =3D 1;
> +	unsigned long info, nr_pages =3D 1;
>  	struct folio *foliop;
>  	int loops =3D 5;
>
> @@ -1244,8 +1244,8 @@ void snapshot_page(struct page_snapshot *ps, const =
struct page *page)
>  again:
>  	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
>  	memcpy(&ps->page_snapshot, page, sizeof(*page));
> -	head =3D ps->page_snapshot.compound_info;
> -	if ((head & 1) =3D=3D 0) {
> +	info =3D ps->page_snapshot.compound_info;
> +	if ((info & 1) =3D=3D 0) {

This could be =E2=80=9Cif (!(info & 1))=E2=80=9D like _compound_head(), rig=
ht?

>  		ps->idx =3D 0;
>  		foliop =3D (struct folio *)&ps->page_snapshot;
>  		if (!folio_test_large(foliop)) {
> @@ -1256,7 +1256,15 @@ void snapshot_page(struct page_snapshot *ps, const=
 struct page *page)
>  		}
>  		foliop =3D (struct folio *)page;
>  	} else {
> -		foliop =3D (struct folio *)(head - 1);
> +		/* See compound_head() */
> +		if (compound_info_has_mask()) {
> +			unsigned long p =3D (unsigned long)page;
> +
> +			foliop =3D (struct folio *)(p & info);
> +		} else {
> +			foliop =3D (struct folio *)(info - 1);
> +		}
> +
>  		ps->idx =3D folio_page_idx(foliop, page);
>  	}

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
