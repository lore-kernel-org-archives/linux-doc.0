Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52EE136E10
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711552260; cv=fail; b=YJPovUY0y1CRZKzeFOcna2WOrfeFk9U1qyOf6EE91Jz7Y7Nv1IsqQw1gHiosGPLSyG3LOZBqu+Q6V9j8mXl2/1cq0ZEUqV/zyKoZCj2cgB1Sz2LUo2o6DgqxfK2JVpwqsNUlWtCZBRjTXUKhJzCDLKfNn9oBdAGEYR0WKMixMik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711552260; c=relaxed/simple;
	bh=PtwvNYiSBJnD/A+QudSTfsfhrj0svwfsy+3gsW9lv5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dabQB4eSxB1cpFh5WlD1/ELHpwPLIUOZTIW8rbqXfVHdG/mSTbtCdPSyIEMcHQcYyEpyUkfPKcN9QqLhFcOhBlKAEUSwa5/5CNqGDtWC8wegBrOqT8ZJDmmhDsb/DNS9k94u1yG8cLg5Ji7mhIiTF0iXhte5G1YBytCSJnYh14Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B+dTOHOi; arc=fail smtp.client-ip=40.107.101.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B+dTOHOi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2G+bVDjeBnwck5xAaIjpIixgDks+z8r+8Tc/YvVLMEyWkWMVXSsXhSyv2ZGvtWHXOD9O03YGgxGbe3Z2OjOD1DUy84uDMWDcWWXm3q8JtntOM/Gy45osi/efef14A60f6wN0MvrD0llC74Hk0d/WhyjIqMirqltkqaLxnrjv8CxUiLC5fT/EZQFJIwG0N9C68vva4RRIyHrgbMor7mOY25giVPBwoUOKeif/9AvzNTWDpCYWnjLtzVuoRXnHuwGSY6wLpGpwPAKwsJSvl7/UzrTvzu2QQbnsDPHpAqHyRXWUVv7eroJmBJaH4jGOoej0JYpKS7kr9li5jGp7Iu6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I963zttESVazroC/pDSzRtLUo+ss8oB0ivJO5nBq01g=;
 b=U+HEsX7B2NITUpqURihKq1Je5tXLQ8n7rWYBqHW5akUUvVooYxlSwMPF5EynGhqWaDrHKZ4t+wyafm4q1115YfXFvGjvqtIfA31iQqBj99lWWvhACzRkPESWVl2SNRTkHcqjQcJPq6jhspmug/iPqYtHlTrN3YdpP+UXqVSiJWu76nFnDYlPQoCZFjQd9EuntE+PCKCdPsP/RDc/TnDlAzlLfsL06Z4uZi1C6ZpB/MXyNLPciE78Dq19wQFzqAfNNcCTy5SKem5SUSa2dP3aFLz81J/xOyDlBA0TNWX9YjNw8LE7veheroyArLLV17iNwfKI2+SLLiR4GKvCetpnfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I963zttESVazroC/pDSzRtLUo+ss8oB0ivJO5nBq01g=;
 b=B+dTOHOiv9GfehlxKDR1c/ul9U4QWqPm++Y7oGcEMPMj/jWq/m3ZExdFXY7SVd4OzGETZglv/6il3G848Komgn5UHxIIbBMs29aHP+Sm6EnCVcXR4+C3pXwKSNiTR1L9j/5RbHrs8oNl483F3KQmPrkiSv/j5S6J2nOYw1/ADu50fLEywi5BCQyyBM/49Wrovmk6pZeII40aqY4cn8gYgphyMOx+bZtk8Stxoj6FyQrbfTzLUMkjtu/t53XKavQjI5EdNFF1bWZpahiglpcYJlEQ7Uykw6x//a3M1dx90lsH+p4rTVnNzgh71VRZQ5NkoQIQ6UVpD7DF/E6bsi+7nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 15:10:52 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753%6]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 15:10:51 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 2/6] mm: memory_hotplug: use more folio in
 do_migrate_range()
Date: Wed, 27 Mar 2024 11:10:48 -0400
X-Mailer: MailMate (1.14r6028)
Message-ID: <1AF9E259-6189-4558-8929-598679808C06@nvidia.com>
In-Reply-To: <ZgQzPVdfF4lFaqs5@casper.infradead.org>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-3-wangkefeng.wang@huawei.com>
 <01BB19DC-3807-4954-A04A-55518301B6BA@nvidia.com>
 <ZgQzPVdfF4lFaqs5@casper.infradead.org>
Content-Type: multipart/signed;
 boundary="=_MailMate_C89DDADC-B275-4BEC-B81D-2ECC61EE31C3_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BLAPR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:208:32f::29) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d10f62f-de9a-42df-767a-08dc4e701702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xhqbQ5CtxuqS2m6ijQhlfZjM2Hwk23onnEynaUomqLJepvQy6ezumyft1yP5SukEVqxYqvxGbSlnQCK+37W9GMGSOjOiZhDlot9Ga00XITrtvCLX8pz8WayzJiRrtXGMwtGCkiD6iN0rjqQ6q+tWcOFASaA24qEzuYv05hou+Klk2VdADNriLAEFUC7rO32f9DssPhpKaVGAPrqvwmo1w97iRgs80hHTu6TE2SawY+fHtNurbKdgbrcs+SDJtxXsN6siOfIoRfW9HzipC6xSrFZkvRkmxXLkbNVOElalyhRmb3oaKCzwz16eobUOuhcY+pc7/0z5WebkiQZR5nDKVhkFFe8mGPiAYtL1K/aYyfp2BbdMQpPrk+ewJxaKlRzFwDVIepDM5LWFmGqdsDpI5r2Swcdac1R0P8OL5Pqb0w75I14xxPQJ39isJ9fTGU1m1IXIExCPR44VOGo1Y01Er2wldhy1GtmKxeurJACcJdE2A1HTShyrWM65f9PMnKcKAac1/9KmnQwmgsRGbc1ELz4tKYBuxEB4BRhj9SPlUFk6pv3/s/1ghdvSgQCBggwALWxc/0wuz8TmTPN9Nz8wDuXebU7J9DXGy1cmKF8Kjy7K7Cj46KCLSBehs4+gcjPG9pA2LTXMd5BJ1d9lsOdSQbLAUvLQLYMq556nm8jXZd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cVlYApRwhpSF+qtyyq/zT8hP9X3qDoSJ30D3fowSaf+BErw3hRtc+QSC0f3V?=
 =?us-ascii?Q?rMjfJfYtFihEMo2iu0Bl7T/DrL9fBlSlZ0ptMU7SFj9tGAhaD6rzKXhqQX9L?=
 =?us-ascii?Q?0tyH0Jk7PVtK5b9pf0R/mR7oSzk0/t686+ADpq3lS8deXHe0G2HmufgkAWOK?=
 =?us-ascii?Q?EQVUawnoDjU9l7GMPv6CtjTCGHxKiPKZFd46zmAj8fYJPnb//hcPzYdcPbkf?=
 =?us-ascii?Q?ME0LBUUdpd3sGJykPnAsvSlyDVYPvk93jDJoJCnaEJqQltxWzvgTqWWhnI/k?=
 =?us-ascii?Q?P+Zb+UELc4605QJ6NfJhEKMpvk9W4Tf+a271ZIIWYhJUH/P6QaPKqQSrjBEK?=
 =?us-ascii?Q?8nlbVo5Y2FltZR8Un4IWNnp+7FiN2AAYrzxoM2GMvrR2SZpOxQUpZUXArYbL?=
 =?us-ascii?Q?OSyGxFuiBFEPRDUsaqN2fytfXuzI5KPPfO6yjCEEQV3uksxDODMtPAwX118M?=
 =?us-ascii?Q?XxAAZu38nRbROdLo9Hg5/4AXfFAomr2OKjEPXRo4zrP5caJbSn6wh+kl9q7E?=
 =?us-ascii?Q?oijhRSiqGb6V90rNkt072A1pBcD9Ibw4MZ79XuN3eCDo9460uWZyZSNuANui?=
 =?us-ascii?Q?HDAvopW5Pn3iyz0Zf0cPMw1wLqk6fpawOpteBr8CuyjkMU1NPhjs4YhN8nj1?=
 =?us-ascii?Q?6laElr3UF147jl0/3vEiEI0Di8s769QITWjU7BC1XiLewHr6VXQJOXazscV4?=
 =?us-ascii?Q?Pj9MlD9XEKlMSeg/Tue7SJHI3IS7TD/lNn5j5XX+tr6NroX1U4yTc96ElP7i?=
 =?us-ascii?Q?R+FGn5ANGnWJcj250aOaaBNyjtY1vcUZ6dEXC088KgvSv/OBZKF9a+21xmGz?=
 =?us-ascii?Q?qxMamoti8uPnq/BlvlGKi6HFreRel8AR3Rq0CzH5LISmGK10EajKQEFHy+S7?=
 =?us-ascii?Q?76N4ZPWhZCxxKpwTQrB0QdNxjP3ZTiK5VOdAsaxLn1mgkJ3+s3pNDOeWfaLv?=
 =?us-ascii?Q?haTaiABV+Bc2xCum4fxQFn2MMkAjS6dLvnZMILkOV/fyrwPQhMOTFsVEQWdT?=
 =?us-ascii?Q?rVg4ACrKFPK7B8SN9Rmmq33JgvBVk9NGXzdGtaN0wyD9kyiD0dd/u5wQy1yy?=
 =?us-ascii?Q?O6Zz+60j2bSYU0jxjPafaEZQ2fseK/eSn6Y+DtbcxCmNIzgOS5dTfSWlmGPz?=
 =?us-ascii?Q?VHIoP3HBxCGX6bjBdwIQdeAhtQWoINAWk15XEiODUX4fiWSEL+42j5Ft/xM8?=
 =?us-ascii?Q?NwS9LZCEH2WB9iJqDgx5BZ3CSXklHrwlPDImoVqMdeUS0Cpll+s9ddQ5lwl9?=
 =?us-ascii?Q?xyG8VKWj8IuwWb/cpp8TiiPHsAKRbVBJ6oHAZdsGzQKiHeQjPyCPn30PHIzj?=
 =?us-ascii?Q?02jZ/ykjbtMpW4FCRt5rDoqCVDn8Xp0R4Pm31ZM0wJwnsOX/aR700k1BNSTV?=
 =?us-ascii?Q?dx249o7um34gzBW7UsID0C/Pp1If6l9o3pBoIUx+F9Tfz06fF8rvNVfPK2iH?=
 =?us-ascii?Q?bzy3aSlxdY2EVp9D7PU1S0sbxMK1WRU05F/9m2Swp1rLBxf2bKpjKt7IhK+d?=
 =?us-ascii?Q?wZ8m9hNb2agDqzsZlxrF3apJpEvc7YOaeNWAvE3c3SAc0daIrWpUK5pXFkcp?=
 =?us-ascii?Q?xRCu7WQh621QLMv9Ys058LFExZ85VBJ7QGZ5kwrt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d10f62f-de9a-42df-767a-08dc4e701702
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 15:10:51.0400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtiVa37goGbrsbwlUBlyuKAxcVAeIDjcG5xuUeGrS5J0AXAH5zC3dkO+JyFR9uke
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806

--=_MailMate_C89DDADC-B275-4BEC-B81D-2ECC61EE31C3_=
Content-Type: text/plain

On 27 Mar 2024, at 10:54, Matthew Wilcox wrote:

> On Wed, Mar 27, 2024 at 10:45:42AM -0400, Zi Yan wrote:
>>>  	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
>>> -		struct folio *folio;
>>> +		struct page *page, *head;
>>
>> You could get rid of head too. It is only used to calculate next pfn,
>> so pfn = folio_to_pfn(folio) + folio_nr_pages(folio) - 1 would work.
>>
>> And the PageHuge(page) and PageTransHuge(page) can be simplified, since
>> their pfn calculations are the same. Something like:
>>
>> if (folio_test_large(folio)) {
>> 	pfn = folio_to_pfn(folio) + folio_nr_pages(folio) - 1;
>> 	if (folio_test_hugetlb(folio)) {
>> 		isolate_hugetlb(folio, &source);
>> 		continue;
>> 	}
>> }
>
> How much of this is safe without a refcount on the folio?

folio_to_pfn() should be fine, isolate_hugetlb() checks the folio
under hugetlb_lock, but folio_nr_pages() might return a bogus number
that makes pfn go beyond end_pfn and ends for loop early. The code
below increases the refcount, so it might be better to move this
part of the code after refcount is increased.

--
Best Regards,
Yan, Zi

--=_MailMate_C89DDADC-B275-4BEC-B81D-2ECC61EE31C3_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmYENvkPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUvSoP/15yB0YWffJbT+nWkj3irolDJ6mPUTHcUO+W
kfWSmZVw22GuYuRm9Z+1Bk4wRjxqyEFZmYPj+ALmKwr6PEUH+nPcga5FW896T3l5
QRIGgtzzRvqbXaFXbE5Osle8HwmXadrTQQYco75sZK9XPmhNLpjcnwT4bKn8wNWa
DyQmuQsWKmcUUEidoEBQjSjNI3oewT8rYEoZbCkLeVuGWtKacQz0mMO79ewo/cQ+
r0/ilg0fPx80IzN4eQroL3sOLhrBlNaf+DQiKUSBkM2CcmqfjGw1Rr3AUqpyWsHa
regzIembZf1OiieW2BCQhMf48k9ez6O5MgazM7ozNN1929BeqeTMQf0SKMPPMCdB
yMq8K+vAd9Xz1jh0EIlb5dtQmiDrc7cY9UQSg7U+8HIw5ANTUBndlEEbNkHNWzW5
ZbRg7sflbojLpX95h1DBkK3vARr8QPER88LnFkwVaVrxWLSCnSGrirvcKrH6gYyN
XgevPQOl6ZG3/7qVTt9OruJfu76QKL0kPTVh2jbGJGhgypEpg26O7hYQ+83+ah1z
vi3rfK2DBMoDjzF2NyqYa5dQ6YfzyuC6Ld1WFo/DMKdVlyCmhkZhsa7gRaPa1//i
+SwsxwIikEpYgTLgRO28+yULHKVKPSzsHopo8SCAU+C3ZOuCto2nRTOz/3He/hzc
7+AeRLso
=wbjy
-----END PGP SIGNATURE-----

--=_MailMate_C89DDADC-B275-4BEC-B81D-2ECC61EE31C3_=--
