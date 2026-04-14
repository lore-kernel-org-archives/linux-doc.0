Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022131.outbound.protection.outlook.com [52.101.101.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605422CBE6;
	Tue, 14 Apr 2026 20:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776197465; cv=fail; b=b1T0Kq7Xyt7yNnQCArlQtF61PrxfYQ5gkTrDtkbRtNXFR2sHvL2ZR1sYFQoJeaE2GlKv38VKW/adiSZYstSNpHXkn1z5szZXjPe/KPIziV40MEMAKz8QbjkvJ6qm/l+jhtZLJaagEfrtUqkEpiPjiLxQb17ca3TLtFebKIsb8SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776197465; c=relaxed/simple;
	bh=q6fKvsHk+5rHyILnHQFR/vOA+pKXL3DOf6tPioZtL9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OQvMp3sSPWOeBOPo9r0J9ZjnXHe7tkPhT/E7IScDc2eHxB6XP6lM3ezM/8wkVEk3oJCzQtzQFreV9CQYsr0Uo38T+hCrtiDpCUpna1jt44Tw141dybtvf9qGTRGhrGiag6y3uNmVj59p1TKnZ7J/cokTvJRcLh+qd+2xdXOMwZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a76jluFif7qbvDgTv+e1nWdiWQZoTAFKhfJledO+XZzYxh1rW742WypqBFmIymRWUxnEPFdtkGyXC1GOqdEoqtnG7zjPj9USBSph8Gs6vskoCbdebA6s9oONUMe+tDh18+D2l9SVRX36/QIo3jITZE5trBZvMpTqa5A4aPuwTJ1AoWlsmBX+VarEDZSzTr6hpUeccMoiyT9O9rTc/VONHNSKYXsZxf5jasMff3Bfh6YmHCrXyY4MsXat/lD1fhgt/+nCsj2a7GeIk/0efZE2egBfyalBhLT+C4iHd+W/fE7qvG38FPAe9cKVF7sNyXvP20YnQay/b2t9rsPir8ZHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uNZ8g6x1w48hrdZh84zjz/s0uRQHv2nzm6BitfwvMk=;
 b=bfroHBGd1WGmPraJCgBkYgZszBaN/onZm2Efn/4tfJgynEDsj3lgRyg3k3MKURMIL/Jk9sg/WKMbpFbJDderffV2tud45ogc3VIsattC6oHQX2ZN6aPY71EzMm482iHKBIqAbV9uGqgiEYB7kCQlPt4uIYz8xvwrxB3CjTnilJmeUkbIQLqdz/0ruuPJ0ApyiBKcmRRdP1trUnozARafSpQlGWns9ROcoZit6308HVQF9PuKPfPXbm0BYgdEwkgg2IGo/A+kOzkTyWSm+cjdxCXDanmHe/w61G5pTJ7NrcxACGMzjcNj0HgFc1vCmJIkHdKq41PxxqCpJc2Xhng2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWLP123MB6994.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 20:11:01 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 20:11:01 +0000
Date: Tue, 14 Apr 2026 16:10:57 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>, Jonathan Corbet <corbet@lwn.net>, 
	Ming Lei <ming.lei@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
Message-ID: <re3tscblxt6i3cpex6vmvvf4ml2otft7el634ib4bi4nlvpqb5@gfptge6ipu3g>
References: <20260401110232.ET5RxZfl@linutronix.de>
 <xhsmhlderi1f6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20260413155726.BpD5Eh0T@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413155726.BpD5Eh0T@linutronix.de>
X-ClientProxiedBy: BLAPR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:208:32f::11) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWLP123MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af9d065-2611-423a-c78b-08de9a61f2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yhlu8FGng+6IzFyDaw75gnPCWZ8tHVQL+0knVp/86Si7mIWdzQlBFOvnYmq0ryw+t/24KuvVfi1gpa0uHMMq7kqZqxJPyBXD3lHtPnZClQgFrL3RKT50ZhSq8uEP6diTWNvH4peVa7PjcP26vsU4SYktQ5j28jA9SkhXEdGwkFQpxVfabqF2/pi83+fAu+bpI6b3S00VI4d2NjHvnXm36ec0fnEwEi1Xf29QWkHhE3OdnQG21Ru0w4j76cDXaNJO1g+46ga23xT1Suf1FRjYipmMUaQqOBKrjw75sxdoxgH7IiRlsBdq40Q5daguy3cL7xIuw6vEgOfxw8O1lM4Wc3aNxXpEcfa4eh4A+bSW68s9EHVElD82zdQ4u4debgoXL6i3rSOXRmrg6kXiAuH+xKy6cTHHjKvslpT46MLhn9E4awRzw+ZICKybTZ50HyfpBW47OHX5gF9uqsuyMkmuUXXT48jzKtqswJctLsB4KBBuFUDZjrO6WTdew+ejtkgF5cTtz6xAqBbWFtTlR6LIigSwAnKhsPV8VsKm3mRgLZXzd4tKUnT2XjOnB4hPU/AWL7hYY8XTqzsNc4oGXKXHrRAKTEDm0V2AtIpaYFpUrRuemv3MKtihf/9XvibmhM8a9IjhSvr2MXrK+K1H9SEPOvq/UeJLA6HHNaa+m9QPj2rndDhJPY3uGcMx3eXjrCYUAnCJ8gBC6T1CdwqrUQ0D4j+AH9p/1B4z5IZoXX1KzVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTNYTkI2VE1qOU5KZHE0eGNLTkZiaFExVERqRVYrYlRjNW5sRGJxdHVnNGZQ?=
 =?utf-8?B?MXlqTmdhd1FyZzlKSnIzQ0NnT0ZSbm5VM3RjSFA5RDBwY0srR05xd29HMHl4?=
 =?utf-8?B?VlFMb2NCYStwRnZwOXl4cnJlUVVkZ0Y5a1B2QXpKQjVQREJYM2JkaEVMVHhw?=
 =?utf-8?B?ZzR0WUxtNEMxM0kzb1ZPZGdVUUN0R2tNZXVPTmUzUWZQTGREaHJHdlFsc1A0?=
 =?utf-8?B?bVVETnJQK0tpVy9ZZU5VWVh2YVExM1FCbnlzTFVUWW5WZHp5d1hTWlJqRWlH?=
 =?utf-8?B?cWl1NENFcGVSU09GSlFtVWVsY0g1Q3c1c09obUhZamU5THJMcGQ4N0RjYXFD?=
 =?utf-8?B?clY0bmUweXFDYmZrVjJxTkNNMldHSnBtc0xHdjFmOGRESktwR3VWNTlrNTMx?=
 =?utf-8?B?YlAreS9BR1Ntbko2K0ZlODY0Ynd6RUUyN0ZodXpqSlNBNjJPRUhqZHpTckxR?=
 =?utf-8?B?Q20vTkkzQVk2dXpoVUFjY1FpckM4TzUzZ1hXUzEwcTFMNFg4S2lLVDVPQ1Jm?=
 =?utf-8?B?RXpzSlprMEdzb1YxWFUyN3ovSVAyeExUZDAyR0szQnpyREZoRGh5dE54TGdS?=
 =?utf-8?B?aDNhQjBuRXZaKzZjbzBCeUo2UDhnZFNDOGRRdjVVcGZHOERPNThZdW1QS1c5?=
 =?utf-8?B?Y05seTVNSzVhcWxIdHhSaFA5S0lWNkZ0RHkvUndKNG1uN0picnlRZG1vcVEr?=
 =?utf-8?B?YzZXM1hwVUphbURod3J5VW0rNFNuM2l3R0JiUzJJVndPOXNFK2c5ZEwvQUU0?=
 =?utf-8?B?WUlTdUhuMzZqVGRpWlpYQzhaR0ZTTzV2d1VqZ2UycEtlUkZHMDQ5Zm1RWDVL?=
 =?utf-8?B?VkhVVEc3aFljb0h3dGVVV2xSTHFmU0xDUjlRZG4vTXFYTVFZWkRueXVpMjEv?=
 =?utf-8?B?emNpdVhDcDJHekp6SlVWWEdkbW9SbWFJRTFhWWVMYTlyaFRwRTZ6cGVkOUNu?=
 =?utf-8?B?V2JPcU5wVkNESWJ1dkZuTnEvUWoxWVV3TkV1UEhSSnZrbWJMNVUrU3JnNUpU?=
 =?utf-8?B?R3pzZzJlYlltbTk1TVFOLzVSUGRtMEdlczFYM3NYQ1hqU3BiRCtrSzBoelhw?=
 =?utf-8?B?S2xSNnl2NEE2Q1loSklERmdkZVd0WlhKQ2hWNTJPZUNrZWhqL2dwT1M3dUdH?=
 =?utf-8?B?b20xblV6eEUxZHhUbExLUVF0L2pVWis3ZUhvMWdOUkxweHZINU9pVTRDNFJt?=
 =?utf-8?B?dDNCYWIwZHRtRDJLMmZFS3VyT3dmMk1BcmVrZ2RaZFJQUG9ZMno4VXkzZ1NQ?=
 =?utf-8?B?RWRBcnRxYVFVcjRGOXd6MVhYNW9HbjZNMGEvMExpVG50QzJIMlZBMWtETmdz?=
 =?utf-8?B?MlhqQlRTK1NmVTdUcCtZc2krUTFCeHhtVHFpNWZNMldpejZGOWdiSS9qYm5a?=
 =?utf-8?B?ZmVvZkVBV2hqRXlJSFh6cS9BNnYzcnRDZ3V2NXBrWGhYRk84YlpiellEQmRu?=
 =?utf-8?B?TjlEcFdrRjJXdHBLbERhNG5lWFBNTFJyazAxZDNENGJqK1JjQnJOK3BDQzIz?=
 =?utf-8?B?azJXN0xqczZHdGo3ZEJEWUZQQlcxVFpVb3dGUXpMSXoxNTZpVFFDdTN2K2Ni?=
 =?utf-8?B?eXZEbUtQNTN5ZUoweGNRRFN2K2tuWkpRcTExL0VhY2phZlRsWDFONStjaStj?=
 =?utf-8?B?NkticmI0cGV0V0JTRWkwSmNpd01ZWFJtYkFqT0pkb0ZJZWhwSmJWQXZiUHhu?=
 =?utf-8?B?RkZCWVdqYzJHRU8zZ3ZkeHQ4bG5GNzR3aDVBTEYyZmthNWpta2dlYk1MTW56?=
 =?utf-8?B?SFpyQXZRejl2Z3daeGljR1ZHS3d6UVpWaE1zalB3UlQvaEJIL1ZsbEw1aG1J?=
 =?utf-8?B?Vk1GYkNHdSt1RUorcks3QWJlMGovcVJQOWNQMnJSb0tINWFUOVZWQWVJeDhs?=
 =?utf-8?B?RTFkRnBrVHJxRExZV3NpV2NJbDYzSEE4dTJzM1Z1Ukhmd3htSVFtaDRZTWxR?=
 =?utf-8?B?NTVKNVhWcmtCT0ZtQzJrdlRPNjgwYW8vMzhDb05SZnc2MjQ3MDMrbHVjUEtm?=
 =?utf-8?B?a0NmUStVdDNwWm5hT3V4MWFwZXFIbElIb1BUTTVlMHFEYUlCSjFtMDU5RVE4?=
 =?utf-8?B?QWN3VTQzK2Q0dTVpbitXQ1c2dEg4RlZGWWpYVFhEK1lsdk5RaVdzaXNrY0Fo?=
 =?utf-8?B?dW5xZVlQRlNxM1hRSlZ4NlhPemZzZWI1K0orZGt6U1p1UkVSRjViRzN4cUxL?=
 =?utf-8?B?b05LYjVRNGlxVVQ2a1lqb3NXVTNSNlBEMFJ5T2t1NEtEN1RtaEtiM1owbytU?=
 =?utf-8?B?V0JwckRTc2pucG9meUJtcHFQdFU5TUZ3YjFMbzA2TTJQOUtlYk92dzZseDNl?=
 =?utf-8?B?eHVyUStwd0R1SlluSGhJOXRiZUZiQ21jeXV6WktmVU9xNkp1ajRTdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af9d065-2611-423a-c78b-08de9a61f2b9
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 20:11:01.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHzfUihz3/IYC/EuOPSQlVQZnpWmji3BLeB3u0EI1J2cB3mxIXfFaGQouiTPBvMRKXyhWxhiHADCEsQ7rj5+aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB6994

On Mon, Apr 13, 2026 at 05:57:26PM +0200, Sebastian Andrzej Siewior wrote:
> For the managed_irq you could argue that this could also use some
> runtime configuration at which point isolcpus= would have a runtime
> counterpart and could be removed.
> After going through all this I concluded that it makes hardly sense
> since you would require callbacks in every driver using it or other
> magic "to reconfigure" but it already makes little sense using it.
> 
> Either way, I don't see anything wrong with using isolcpus=domain if you
> have a static setup and need/ want reconfigure at runtime.
> 
Hi Sebastian,

I completely agree.

-- 
Aaron Tomlin
