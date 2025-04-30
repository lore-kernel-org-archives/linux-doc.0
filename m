Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53531EB5B
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023243; cv=fail; b=i2Ufdwfy6XSWDOBJMdLadpHw5LI4/BrDv4H2EcNR8njAnnispuisVu+9oKYOxtGcMgm4nmaH3AS/OeKwQZrikPdda27yUyJUmNODgdTvrCgOONEHJJPJBLhzBTL4fqApk5u2orors8Eeu1WMOdEFQWTaULyaRI+Ywx7MzE7rUGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023243; c=relaxed/simple;
	bh=7Xeot3V/be+LDsBXRO4JYuA311ab9aonG5WLFq4eb+I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ea6pYZQc78TjH0hucXQBCXOihqzZd6vyOC+CdHjNAYZc6cWbOyEicksRuFbvh7YGkxxojq3Q10fsTUTVSbzOsvpDnecBe9mpvwLjVrVhQm2AvuO/+E8q2L7QWtxIkiy3/U1LcutfaI341BxiDEZym5GadAQFSxN4aOqyo6nt6RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uT1odzAh; arc=fail smtp.client-ip=40.107.102.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uT1odzAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5MhjuOrdxsX/DREJMhjKAI+t8iLKq7HLXeiIfBqldfq5pOcICQLr+AIkc9OIti9jH/i/d2jNcor8kv6S/o+eSiphZG8k8x9vBrSRPER7+RacViLainFjwlB1sQ+N+u5JU0odaD/1losLA7/2XIroMarnIaJ/+O9fa1po7LXitSDqALflEvc3gbAEFXIX0wphyWmOmhfUb9zB915RkFHMlyZ9ikEGFHaQ6Pez5TMNpk7LaAJ2+RfFyqa9+n1rFitRaK/05hg2o3wJO/Bj/Ga7fF7IgFGrspVvdGSCAi0wnOcPgs2cXM8LnQ2NxWdgN5sskty4ozEHavw7lbwvuhfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Xeot3V/be+LDsBXRO4JYuA311ab9aonG5WLFq4eb+I=;
 b=Oqf2AcJFzUg5cSIcuwuXmcJwneQg/jCd4Exz2nyu/pILbPqpQSCpXr5HXn8uURG8Kf/Dt7lfgydb9P6es0o8zFbl4EiRFxFNURahbalUcifLl7C3kIskIsSX6Gh2onPave41+gxAjIP9oX+1kzj2sae17EovvWJctK7PPRsgROF4uyeXUcA4I5Ciu2nbRVS5Z/SlEt8RRnLYIzLJRMhFkLI3vmus/K0h15uPYTdE5D3gmE9e9NJe3iBLm78n5fhBoUoJp5RTSw+gGX031xbXqtXIBmsCluv5fRR+YMoYN50D8WqAMaA7O/h/CUOx5TDxMU9D/DXV8F4ahVD5jqYj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Xeot3V/be+LDsBXRO4JYuA311ab9aonG5WLFq4eb+I=;
 b=uT1odzAhi59ZVdJrsseg4LTv+/vVATSADjnq1cSfTN+7F8EF7lQueSw3kJszaqdYi9ahuLylHz07oCsfIpXPoCO5+VSDtx3on8s4KPgviBlyoKSrfFj4a1wf0Qq+d7oV7amnYz/Qpm/P2lVpUddpqU/PYX4ZAOHld7Oup7kkkj0IjZ38YgpZTJT1mYdaYfa5WQv9r+4Fi5a0/+86fBRHWizX78A1P7IWnp7C6eg5r178eT0ZMenm3+juztGZUTg1rDWWQ6YHugwW+ENn4I6+7D/dvNnNM02f/evL4ZXFQVfxjBaFIjYD0CqSRS/Pvf3K1XITX6awqELAkK1100P/gA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS7PR12MB6006.namprd12.prod.outlook.com (2603:10b6:8:7d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 14:27:19 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 14:27:19 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "viro@zeniv.linux.org.uk"
	<viro@zeniv.linux.org.uk>, "rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Thread-Topic: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Thread-Index: AQHbuS3WOq2ol36oCU+Gr+S7Jr/w7rO66zkAgAAKWoCAANuSgIAAdHMA
Date: Wed, 30 Apr 2025 14:27:18 +0000
Message-ID: <49df4b2db57f1a431ee18f319325306ac5d13f32.camel@nvidia.com>
References: <20250429173958.3973958-1-ttabi@nvidia.com>
	 <2025042900-emblaze-enlarged-47e8@gregkh>
	 <758ad68deb989eaf8a22ac2bd96915bed77f0f4a.camel@nvidia.com>
	 <2025043059-lustfully-endurable-0efc@gregkh>
In-Reply-To: <2025043059-lustfully-endurable-0efc@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS7PR12MB6006:EE_
x-ms-office365-filtering-correlation-id: ea7b986a-57bf-48c0-4184-08dd87f31d0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUlpNHY0Z05sTzlpWlRwRSt3NCs4YXg0UUlSZUdnTWx1d0x2UEJjMTF5VktH?=
 =?utf-8?B?ZC9BZkhuSmdiOE1FamYzanRkNkVKZ1BqbWRFTzFMR2dKNmtxL01yM1JTZTNr?=
 =?utf-8?B?M2o5S3JFU29ueGI2YVF3dTVzbEFCWHVBRmJMYWs2MDJPQ1Z0WnhFR3hVdFE3?=
 =?utf-8?B?OGtBalRoalh5V1VsTlIzL3JteTdFdWFmVlFJSWRNMm1xUE00cElLeDQxYjFI?=
 =?utf-8?B?dnB3Z1BLaWRPUUxBZnJwakVENDdRN1JJVWRoellpMjlIdlVnMFZaYTFNd09S?=
 =?utf-8?B?ZDNRRyswcDdxeUdUZzk5L0ZQN0xabE9WL3V5SWxQMEVtYVFWUlhZbVBzdUto?=
 =?utf-8?B?eGVWSWE5Y3VIUVlYck9pSVh3T0p0YUpvK2d5WHcrTjduZ0tHWHVJMG5oOGNy?=
 =?utf-8?B?dWIxYU1ONVBWTWpnb3plRkF5RTMrZEVwVVQzd3d1ME00b2JGWWRHQUJOOFcw?=
 =?utf-8?B?MXZzQS9PVWh5OHZ5b05XWlMrUzZYcXd3ODdDKzRJbkl2cEMwVWFoYVdBbzAv?=
 =?utf-8?B?Zk1hUk1mTi9Mc21WbXRobjNuUjgxS2d4emJpMy84V3R4OUp3cTBKdGp2Ri9D?=
 =?utf-8?B?bGxuMytJY3hrRTVpMU5zZlFXUGtjZlMyb0NqMUVXS3hwbmlBdjh2d1dndWpq?=
 =?utf-8?B?c3RkSTEvNi9GVmVYZURHcGwvVGxJOGZLdWFvcHNjZW12bXQzZ05GRlR3Vm10?=
 =?utf-8?B?SjliRmVMdFlrY1FTZU9nVzJ1dEY2VWY3MkNVTjhKRDdxY2VLWGdWdzhKM09q?=
 =?utf-8?B?RDZlUnFEZ1lIYXVHTzBST3h4ZjFPU01ZTDZRUnVxcGNBazd2S1FpejlxMUdV?=
 =?utf-8?B?VGJFNDJtTGg0cWMyVmZOUENnRko4dkJxV1RsdmRwQkFqVDdzT3UweW5GeUtH?=
 =?utf-8?B?S2Jramk4R3dWRXFnY1JML2pPRmJPSEpLNWYyOVMvcEhyd2pDeDV3d3FESnRP?=
 =?utf-8?B?NTVVdm1IbjFEQ0dpVVFwL3BYN25mUTN6T0lCb05UUlp2TFZpVmFNcUUwWWZX?=
 =?utf-8?B?RExrU0oxeU5TQ2N2RGFva2pjZVRTeHR3SkJYWG05c2UzditEaDZITHVMWlhE?=
 =?utf-8?B?SVlTS2Y0SjM2VTVGbTBrYVJuemhJYmRJR2E4Q3M2R2xQRnNmMTZCQnlIbzhV?=
 =?utf-8?B?TVcvc0MzQjRBM3ZkRk0rZnVYemllZFZiOGVUNUgrVWFSOERyQVVSMlZqV0du?=
 =?utf-8?B?VTIvS1lCZWtkejZoNzNpOWhaQ0lFWmRkKzNkS1JWQ2VVZXBZdTVyd3drbW5C?=
 =?utf-8?B?VFR3TkhYZG45YVhSbWc4cWtpT1QxYjFOYnhGemNFYVpORUVCMmFNUnFzYlVz?=
 =?utf-8?B?cUk3MGU5d0hjRzdHMXcrWFJwSExyWWozakJvdEJUZmJsVU02NkJBc0l1eWdI?=
 =?utf-8?B?NXYxUUkvUkIrSEJTT2J5dU9md3hZVjFYVVF5c2VlWFgyU1kyTk5mUWVzNDFK?=
 =?utf-8?B?bGJqSzczaitWYkxrbnFDVHFta0l4d0ZqcE5MLzF3QU1nY0xJcjJsREFodWVU?=
 =?utf-8?B?TFhRVGpqWjJZK3E0UkdJUStaOG16QWhWdWNRNmdZMERTVnl5RmJ0eW5YNnJC?=
 =?utf-8?B?U3BzVmJTcUdEWTV3UU51VkRTdEt5NGwvQ0oxMjBjZlMybXhnc052NTZSK3Iw?=
 =?utf-8?B?SThudHRQWHZjajhwUWxPZDNrTFA2ekNmQjdUOHBRVFM5UlB3aUZiejJ4d0Fv?=
 =?utf-8?B?UVpTU2JtalV3V1lPWFgrYStWOHdmL2tvMUNoRUpmZ090S2xwWlZxZ3FDMzhl?=
 =?utf-8?B?RlRSUEZjcjZ1WTNVMWtWcDJGdUo4Y1hDSWpCNWpPSUJJOUdOVGVzRytSOWlt?=
 =?utf-8?B?UkxYcldnYUpLbjh6VGFtSURFOENCRndHdnVoRGtkU1NuTjJZN2lSTzNmdHRU?=
 =?utf-8?B?RVBqUTl6OWVnQ2FmQlc3cmU0SmdzeFNpWUQ4am0weWpOUU9JRHdwVEpGY1Nw?=
 =?utf-8?B?cWlaRkpJZmFncFlPaXRZQjYvMmg2WlBEVEx2bTRubGZxeWloRkR4QnlIdGM3?=
 =?utf-8?Q?b7DtS8NjjIElPy7GLU+93YdQjbEr5E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czBXMGt4VkZSSy9wblhKdnR3NmJUbFZDV0VnNUdvVFg5VjZwVy95UGJRako2?=
 =?utf-8?B?SkEwRnBHYXhzQ1MzZWhlcUlQUnBKSUREb1VqKzBsdzdmR0MzNFpwazUrNmZN?=
 =?utf-8?B?SkdWVzY1Q0d3RmpCaGRCelFHeFovdkxxTFdLVDRiOHBqb1MrY0ttVldjb2Qx?=
 =?utf-8?B?N2VZaHlUMy9UZzRWRFNjc0lxTEgzUVFMM1M4Wlk1SFBiRFhwOHorSTF6aHBv?=
 =?utf-8?B?RUtKRG9rSHhPdFNWaFpGWWNqTVVNMzY1ZjdYK0pZNldBVW5oc016SE9wQXNK?=
 =?utf-8?B?dGxlRThIcWczTVlEemVNdzVQaDd6OWdId3RYYlVSdi9GeUllY0V3VTRwUHBX?=
 =?utf-8?B?YWJzOGNBUXdQNTlYY3BrclJuMGpXMHRzZzdaQk5IcHQvRUlhQVU0QlI2dDdH?=
 =?utf-8?B?dGg4WS9Ud1ZZNGdwZUp5cjczZElDUk5XK1p6MG5oQmErUENGWXVmZDBGSGpF?=
 =?utf-8?B?OGxja0hhTU1JeWVZRDFOekdlL0hpVUFpRDBYT2VrR1RxU3RZVDJRUER4cE9O?=
 =?utf-8?B?RWpQdTM2aVl1eEcrcGNVeGRQM2tiQTVrMGpwWGp5cUNqcWdnQkZGSmJiQ0Zn?=
 =?utf-8?B?ZExndzBaWEVHOE9MUDVEM3VOcGx5bEp4WWxEbWdxZ0ZUb2J1SjY1cnhoMVMx?=
 =?utf-8?B?Si9vUjdxeXpjRkVXWlBJNnpyb2pNSEMxYk9LUDdoTnVDWVYvRUhjN0Zmck1o?=
 =?utf-8?B?aEozRXBGTW9Xd04zNnJ3eUdoc1BRUE5hK2J2OFhaQUpRMDRQK0NydnJxR2w0?=
 =?utf-8?B?UDRmVGc0YVdmTDhkMld0QS96NUplTk5KNU9MbVRrNHNGb2NHcnBqQUlaK3Ex?=
 =?utf-8?B?d3VmM3UvcWJOemVTRjVlNDQrbTNkVENiYUcwVnBjbFdoN1hwcFQvS0w2U0Q4?=
 =?utf-8?B?QUZ1ZnNEK1VDYmtXUElaelRSZXVHS1RxMHRySFZoWThUTjRyOWt5VmoyOVpY?=
 =?utf-8?B?SkZPZUxNckdwRTc3UHZYNmdKZXR5ZGdVZXJoSUgvc3gzN1pHL25FMG8xOUpG?=
 =?utf-8?B?a1VLMVNFZzdGd2x3THZqQXZUTWJVdE5qRzM0cWlZdk9aNkU1Wm1YcE9yTWpn?=
 =?utf-8?B?dDZoalRWZ3c3a05waDdsVTZoeUg2R1J3dFdENkozYU94WWdNclI4Wld1eHNH?=
 =?utf-8?B?UUt3Y2Zmd21kd2hEakRkUlQwNTFPNG1neGQxd3lKTVJCYWlpOFZ0RWZLK1BE?=
 =?utf-8?B?ZTg4d1F6Sk5Pd1hiYlllUUFVb2M0b205R3VpSG5iWko0WVFsQy9saHhxRzRq?=
 =?utf-8?B?S0lXSW9HQW1GcGhZN3d5NVBQZVpDUnRMZU4zUzdyKy8yN2RwUy9ndm1pUjdu?=
 =?utf-8?B?TlgxRUdyT3ZwYlh2eUtNY29PdU1YZlp1Z3ppd3JOQ2h3cjZMRkMzTWxxNG1p?=
 =?utf-8?B?aVNlWkcrM3cxMVZwUll2YVNqVVVkZHJZM0RhVXI2eHF2ODVKbVhkSlhSbGVX?=
 =?utf-8?B?cXVxRlFMWS9TVjdzcGdvQnlZT2FsYnpORExVZjNGTjZvdit0ZXRzWStCZlhq?=
 =?utf-8?B?enBjQ1lyT2VnVjA0MlVvSFE4WTRjTStVMjd2aE45VDRUdHR3TnlNemhNT2Jl?=
 =?utf-8?B?V0s1VVQvT3YwV21PZjlxUGEvUUdnZlBSRTFRQ1IrNjBhQTRDTW5uVWdkK291?=
 =?utf-8?B?eE9JNHhnVHdWZXJyQTlmYnpUSFdNbWs2YTNyU1dYb0Y3Z1hadDlqTzQ2K3hv?=
 =?utf-8?B?N2xkendQdjdqbGkrWGZZM2dRK2NVUkZ5YWZwOTdmdUhBaUMxMFh1SkYwU0NK?=
 =?utf-8?B?eUovOGxjVGZ3TVZtNnRlUDA1eU5wR3JJMTVPTll0emw2TEVXTnV4dXRYdWQ1?=
 =?utf-8?B?b3JJT3lxMk9KUlU4aUhtcFZSd0lJU2oyd3ZpT0R1MlFyZWR6blNqN041aDlB?=
 =?utf-8?B?R3JiakdCdDhyTFh2SmozeDZXdnFTNUlERG5vaFpZbnVNR3ByZFVFaUpadFp2?=
 =?utf-8?B?Ni9rUkIrYUpUMnhlZk9xVVZtaFlCYlhLQ0NEMzdITVhqc24yRjRUb2tMRkdQ?=
 =?utf-8?B?YjRBSU1wOGtSeHE5UlZ6QXQxd0VrUVUyUE82VHZBc0FGa21FZ3psYWNKUnN5?=
 =?utf-8?B?ZVJwV3ZLd284b0ppbzROanN1MjJhMUgxbVFPeThTYnVOZHJBZHRnUE05ZnJT?=
 =?utf-8?B?b2NsN0RGYmJRdWJjT2g0OEhZTnI2YmQyckIzODdJNWhQK0lGaWg3TjNpVFpZ?=
 =?utf-8?Q?MaQDlQS0dFG6CFbNpmEx/BdHIlSy1g9mUazuKBYjOf3c?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DD7E2F79CD6104485AF2997A95CBBF0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7b986a-57bf-48c0-4184-08dd87f31d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 14:27:19.0310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gm/IQHDltthXVCHljr7w/TVwZhK3bEELAg7j5hwJH6vXXZssiGA+iGFwYQnNZoJR355j9mri/kYj3olTsZ11JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6006

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDA5OjMwICswMjAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gPiBhZGRlZCBiYWNrIGluIDIwMTksIGFuZCB3aHkgd2FzIHRoYXQgZnVu
Y3Rpb25hbGl0eSAqYWRkZWQqIHRvDQo+ID4gZGVidWdmc19yZW1vdmU/DQo+IA0KPiBTbyB3ZSBk
aWRuJ3QgaGF2ZSAyIGZ1bmN0aW9ucyB0aGF0IGRpZCB0aGUgc2FtZSB0aGluZyBhbmQgbm8gb25l
IHdhbnRlZA0KPiB0byBzd2VlcCB0aGUgdHJlZSBhbmQgcmVuYW1lIGV2ZXJ5dGhpbmcgYXQgdGhh
dCB0aW1lP8KgIEkgaG9uZXN0bHkgZG9uJ3QNCj4gcmVtZW1iZXIsIHRoYXQgd2FzIHRlbnMgb2Yg
dGhvdXNhbmRzIG9mIHBhdGNoZXMgYWdvIDopDQoNCkkgZ2V0IHRoYXQsIGJ1dCBpdCBzZWVtcyBw
cmV0dHkgY2xlYXIgdGhhdCBhdCB0aGUgdGltZSwgdGhlIGludGVudCB3YXMgdG8NCnJlcGxhY2Ug
ZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKCkgd2l0aCBkZWJ1Z2ZzX3JlbW92ZSgpLiAgVGhlIEMg
ZnVuY3Rpb24gaXMNCm5hbWVkIGRlYnVnZnNfcmVtb3ZlKCkgYW5kIHRoZSBtYWNybyBpcyBjYWxs
ZWQgZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKCkuDQoNCldoYXQgeW91J3JlIHNheWluZyBub3cg
aXMgdGhhdCB0aGUgQyBmdW5jdGlvbiBzaG91bGQgYmUgcmVuYW1lZCB0bw0KZGVidWdmc19yZW1v
dmVfcmVjdXJzaXZlKCkgYW5kIHRoZSBtYWNybyBzaG91bGQgYmUgc3dhcHBlZC4gIEkgZG9uJ3Qg
dGhpbmsNCnRoYXQncyBhIGdvb2QgaWRlYS4NCg0KPiA+IEkgcmVjZW50bHkgYWRkZWQgYSBwYXRj
aCB0byBOb3V2ZWF1IHRoYXQgdXNlZCBkZWJ1Z2ZzX3JlbW92ZSgpIHRvIGNsZWFuIHVwDQo+ID4g
YWxsIGRlYnVnZnMgZW50cmllcw0KPiA+IHNwZWNpZmljYWxseSBiZWNhdXNlIGl0IG9wZXJhdGVz
IHJlY3Vyc2l2ZWx5Lg0KPiANCj4gVGhhdCdzIGdyZWF0LCBJJ20gbm90IG9iamVjdGluZyB0byB0
aGF0LCBqdXN0IHRoYXQgd2UgbmVlZCB0byBzdGljayB3aXRoDQo+IG9uZSBvciB0aGUgb3RoZXIg
YW5kIEknZCBwcmVmZXIgdGhlICJyZWN1cnNpdmUiIG5hbWUgYXMgdGhhdCBtYWtlcyBpdA0KPiBi
bGluZGluZ2x5IG9idmlvdXMgd2hhdCBpcyBoYXBwZW5pbmcgaGVyZSB3aGlsZSB3aXRob3V0IGl0
LCBwZW9wbGUgY2FuDQo+IGdldCBjb25mdXNlZC4NCg0KV2VsbCwgd291bGRuJ3QgeW91IHRoaW5r
IGl0J3MgY29uZnVzaW5nIHRvIGNhbGwgYSBmdW5jdGlvbiBuYW1lZA0KZGVidWdmc19yZW1vdmVf
cmVjdXJzaXZlKCkgaW4gb3JkZXIgdG8gcmVtb3ZlIGEgc2luZ2xlIGZpbGU/DQoNCklmIHlvdSB3
YW50LCBJIGNhbiBjaGFuZ2UgdGhlIGRvY3VtZW50YXRpb24gdG8gc2F5LCAicGxlYXNlIHVzZQ0K
ZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKCkgdG8gcmVtb3ZlIGRpcmVjdG9yaWVzLCBhbmQgZGVi
dWdmc19yZW1vdmUoKSB0bw0KcmVtb3ZlIGZpbGVzIi4gIA0KDQpXZSBjb3VsZCBhbHNvIG1vZGlm
eSBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUoKSB0byBpc3N1ZSBhIFdBUk4gaWYgaXQgaXMNCmNh
bGxlZCBvbiBhIGZpbGUuDQoNCg0KDQoNCg==
