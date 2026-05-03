Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022128.outbound.protection.outlook.com [52.101.96.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7225A22F74A;
	Sun,  3 May 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777822873; cv=fail; b=BNkkEXya7tMVwBLhZ7RrTeOJsEITZRDBzNOXbDC1wHEjM/GWaXc7kpyFirRpIBULxdS1ieYbcUCOkU1SHiVuTPVbk13bBfX3mb278DClepQQWAtBL2nqCNSdPVIZ+qWCYn8QG/jRHMoO7LXRy5IR9U9VjJ3bKgqqH1GQBeBZ/zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777822873; c=relaxed/simple;
	bh=pznwCNpS+lZ+Km02ByCS78jD/eC8r9Hj8BkJluquh1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mgZ/c4/u5f0JAup/uYAYhmIxjxzpI3kc6O/I3vSqRAzMKiLlPjdi1wKy1ST9d7DrCG9PiAMgqkx6WP3yH92s37Wu4zeVWiFZigug2QpkuWVQ4ewKETaKN1u59KUmwkh3f9fkcRn9kJOCAj/CSyWGfeWA53x8uL2wNeQthw4zamY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhNfiGaOAU3gEsvzMq1DVJ+tM2Yau2wN9a9Ojrwsvdwl6QsCqsAcgn82Fm76Kdnqk+/RIHRaCq1vwHNq7WfcskZAVtAQ3B+oy/Cs/RyncIu/CLGyV6EBB1jBdP2VmvOeY/Ah0YO2LFk70HGgXUzRyGPDb7jd3gzpmms5IJtIObhnCy1wPU9wSa6cZoGQT5W3PDt/jNpTKQ/c57maEBRkmNZDZI1OvImb3h99pfA3FfyOAebsmZfxAKHJNUiUViy2O3WbN9+VK7o7tALnZb7yxERngxtrqnUf49c3WqijIbkNmtKMjcswASKCJtdT+mGiuBps5F/93dkNftamvQm9gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW5az1r+K32bzzb+OBkUo/cZKjy/8j9qxVND3VGgFbI=;
 b=RuqxQgnsnTE+I0vATvUqXcs02TilDSGDpy1tX7Vrt4LkgdlcoKGuhv4q+78B2MPEJDNWVwTDL2T7dUB3XmPzg3oFGZgmOWd07nolO8i+BkAfFDYDvKesvlSQfoeGZYmRXXjbSnKBML0KjpkYSoJA774VdXrnxCga61g+KL7mPLoieBEtxLyICOvY4pjFuOc742sWJlkqBCYb72aD7VyYbbOmcM1m8ePaxwhuNw0wbhHJq4sc1xkeIdxsaMi6LSqtu7eOaRQ99/H4jg9EYokzGW+VLQYNdpVFLBBNV1JnHxZt8FKhCZkGCpyedB0WiOUxOfrkQ/kYJSN0ud0HsrENjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWLP123MB4066.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:8d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 15:41:10 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9846.025; Sun, 3 May 2026
 15:41:10 +0000
Date: Sun, 3 May 2026 11:41:06 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, tglx@kernel.org, akpm@linux-foundation.org, 
	bp@alien8.de, rdunlap@infradead.org, dave.hansen@linux.intel.com, 
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	bhelgaas@google.com, bigeasy@linutronix.de, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: kernel-parameters: document scope of
 irqaffinity= parameter
Message-ID: <y6s6siwvpn5vtr4ys7z6kgrhbp2o4dcecwtmbpbqjnmlhq55ot@t2jplfdpw6k3>
References: <20260421150911.42404-1-atomlin@atomlin.com>
 <87y0i0bk26.fsf@trenco.lwn.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxxcqlsmlduigv53"
Content-Disposition: inline
In-Reply-To: <87y0i0bk26.fsf@trenco.lwn.net>
X-ClientProxiedBy: BN0PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:408:143::34) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWLP123MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 84aed53a-9342-4dbe-127e-08dea92a6609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	grt0Hs96CWjhukC5Kd8L2/UmYiJS4P1Xf+hMp/rIa+ZcrmX7SAHYNHJs5itzJu1cs8WTh+KRVKCHCRvWtAXIpNPPKUVpBrBF57EfXTADzxf9dK2PgXmI6WCvmhgY3cRLqXuBdQjyB+hji0t1B4U5Sg8sJzpCjOTvb1k8c7mBg0CxjnCF59zx+u0vW7nlbuY6Irf/VcKVqg6c3JJsm0IVdHq136Oud2XNfWIXafFtg0LHj/ju1laov8eA/CkDa6r0oZPisBTpaNkPc6ML+lN3BdIpRgvpB9L36lN0Kiu5LLGutzsexgpawGmB/tP6BYebRUBJFGisgte5u2trvPjdUK7aysYQocuOtl6ujfSquBpzCMM+DQxU1qpDzjTQ0tRKiN9UxI9CY72CHMQYKr6bzuJoCOQ7ZU5QWaEvn0WYhK3VfOYwVcG4llcilYWf/qRqhRYtrHL8mV6n36bR+6KvAD2Qru2maANiSuVQeCyv4U9Vq/5GnQzxU7TQkIKcyQgA/oScHWTMrWC2lKw2pnESk9bHg16YG8b1z9qzfDQFHg9/QQlucLdDcW5x0e1gkZOykbKavNndpm/OMYpu1U8Xepax1nx+B8x/YHYfOJYeJbHotLGCq0k4nmtnWHOmrdeCOLZ/+qAEQMg5K9XQpZsp1KuGVug612UAsz1vnQYgiqH4eGeK35oLQmWizY7n/y/V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akdZVHcrNVhYem5tWFFCb3N4dkFzSjdFVkEyTng5RlpSKzE3UzRsRkRYd0Y3?=
 =?utf-8?B?UVoxUVRkWmFnUkVTRDZBL3hoL3lWejJQb0w2R2RPalZNTWdEQUVwY2lBSGVL?=
 =?utf-8?B?TE85UXNSUXNVVFZDcURLUEQ3TWJtWFpIOUlQMTQyUDBFcXUvSFNVeW1qRkFj?=
 =?utf-8?B?aDNTNmNoKzl4K2dxTCtvYkYvN25VNWlET2NacW9mZGtRWGkvNWxUTzlKVUZw?=
 =?utf-8?B?anF2VlliMDFRamZnd1ZuYmZ4aU1rMzhlQUM4M2pnZnY1RzVNaGErYmduMkhX?=
 =?utf-8?B?emhLNE96c2pFcUJPcDlzZGIwcGhMdll6Y2t1UlNuQjJVRm1YK2cxQ0V1c2dr?=
 =?utf-8?B?eTN1ZzJBVXBQK0hvRjhPdmt3SkE4K0tZSjdlNnpUYzd6aGgrU2dMd0JwS0JC?=
 =?utf-8?B?dTNkVzVUbzg2c3ZpMGdTNHVXSlI5eVVMUDdVNWlsSC9FOS9Xd2NNUFZydHlC?=
 =?utf-8?B?TTA2UHR6c0pLUndReVdnZGdTMkNDYlpkbEYxaHQ5RFFodjhaZzFycThwejdU?=
 =?utf-8?B?bWtuMGw1djFVU2tiU05idXIvbGhvK3J2UHdQU3R0WnNZazlKcEpuT3FoYitz?=
 =?utf-8?B?eFlEQlMxd1IvZzExd2tnZy8xeVgrNGVLZ1VHSUlHcFZ6OEpnL1pxdXp2bUJM?=
 =?utf-8?B?RWg2TFRDZEY4SlBPcG9ZSG5VdU5RUGNmVHRQeWpmaXZOdTQ1bThHd3FTcHc3?=
 =?utf-8?B?RHd2VXkxbmlkREkwS2o1RVA3ekZ4SEtCem42b2JCaGJWaHcrK2EzN0E3V2lH?=
 =?utf-8?B?SURXY0IxWVhxTW0zN3dYTTdjQVpleUJRMVdXOHJQQUNXWmhEWWU0RGJCYmpV?=
 =?utf-8?B?bmlXdTRQanRvemRUTlgyS3pKM3lDN1A2cGV5ZFp1RHVpY3o5WVd2Y2lORm1O?=
 =?utf-8?B?M1NJY3NqODNRbWFmUzdMSzFGWHFvVVNISDhVRXNQQkdCVWQ2YnpSSTRWNXNM?=
 =?utf-8?B?N3dqZkR2dm5YaitoUTViN0gyTUY1K0hHSGxBdnJaSzlwNStXOUZGZFZXTWV4?=
 =?utf-8?B?QzRCQy9SUjFvaGFpUTY5Q1QvQlJCL3ZsU2pOaFRMZEN6TmFLQTFhbXh0dlZh?=
 =?utf-8?B?UDJIVWVmN3JhbThZelA1TllhZGwzbmZiM0VVRmJqOFZNTi9lTk5KTzk4YURr?=
 =?utf-8?B?azZCRFVYWDY0ZEF4NXA0NUdxcy9yU2ZUbXBFcmQ2NERaRk1SWmN1QnpBQzk5?=
 =?utf-8?B?TDRCRnJReGlON0d6OXFPNThGbDhzOE1mYm10Z0s1OHUxMjQ1VHR6NHpxVTQ1?=
 =?utf-8?B?UWh0RCtEbnhhcnUvQ1BTNk1YcWxrdEI2VnZQdXMrVzdiTlRHR04wRG9mZ3Y3?=
 =?utf-8?B?cFBqaVNlR3locWtSSzRLdmkrZnowY3dndmZ4MzBwcU9LZ21lZSs1TG42ZzhG?=
 =?utf-8?B?S3V5RG95Nk5pYSsxa3U1YUFGV2NQVE40SFAvclJpcmNadzdYV1FpVG5HOHpu?=
 =?utf-8?B?U0dKa1h4VDk4ZkZ3ZmtOYWJUNTM3eTMxTithZmliT3crd1Jxb3RpZlhmRjNy?=
 =?utf-8?B?eHVRVXQ0RTg4djVCV3FuUVNSd0JvNytTcUlqN1B0NndXK2NVSmNPcUZick9I?=
 =?utf-8?B?VnJWN2VyN2N4ZEFTUWxvYkc3YVpkUzZRcDJsZjlSVlBPOUNvbFlMSFlYWlpF?=
 =?utf-8?B?cHZqWWZTK2M2T3ZDZVpQZ2E1aHBGUllpK1RNQzVwenozc21FeXFQSDloT0wv?=
 =?utf-8?B?Wnl5YXdOdkh4U2hodzVZRG1rbElTc0dTbkFTVWdtU05TZEVrOTRWUkQ4L2Yy?=
 =?utf-8?B?VHVsRSszUmpVS2UrdDkyeExsa1lqeUlFT1pRdmF1TWpMcGlhSDZOUCsrUCtw?=
 =?utf-8?B?MXRaVDBHcHNCR09xRXd0TkdTN1hLZ2d5b1ZhcXdsZnpLeHBoRmoyOUpzQUQ1?=
 =?utf-8?B?blU5OXBWNHVSRUFNMHg5eGFHVXZwSEZsOGRQaG1JQU8zcFNnQTB3Y0t6V21j?=
 =?utf-8?B?OS90ZWFPWE1CdHE2TTNUWFJ0eDR5TUhlZUZydVJ0WEpGWGxGc2xwVzdYRlB5?=
 =?utf-8?B?Y01MVzN6U1J3LzIwUEw0dXZaaDFocmxnVXFBRG9BV284dUpoS2tCSEd1ejlr?=
 =?utf-8?B?U09tQlVpY0NFQVE4YzhqdjhWL3VMalhqNWx6N0ZlcWRCTXhhRjBhbXpRdUNz?=
 =?utf-8?B?bHl3eWxZWGxZQldhbkFDdGdHYkZ5MVJNV2pFdjRZa1JWdkpuMGVyY1EyK0RS?=
 =?utf-8?B?cTA2UjF3Yll1dGNreVNOVWhzamV5OG12S3pYeUtIWTZpVUlPbTF6d3VOcmVB?=
 =?utf-8?B?Uy9tc2tzSnZvcldvTXlwOGJtMWFlcFBxTjdIUkp6eEV5bzBhc0UvYzZacnYv?=
 =?utf-8?B?MXVSSzRjUFlKSzExL0NIQzBnaWxXdHVOVkZraVl2ZlVkSTd1Ulo3dz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84aed53a-9342-4dbe-127e-08dea92a6609
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 15:41:10.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eXj1uWYnVnbu1fLx9aDvqZ7VZXfjZ/Hqjdc8sUUQWFHLpjtgqSpF3STvNGmKUtKxlHxx+kIqelejxUZdlbwtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB4066

--oxxcqlsmlduigv53
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] docs: kernel-parameters: document scope of
 irqaffinity= parameter
MIME-Version: 1.0

On Sun, May 03, 2026 at 09:16:01AM -0600, Jonathan Corbet wrote:
> > diff --git a/Documentation/core-api/irq/managed_irq.rst b/Documentation=
/core-api/irq/managed_irq.rst
> > index 05e295f3c289..8e973a7d1bd1 100644
> > --- a/Documentation/core-api/irq/managed_irq.rst
> > +++ b/Documentation/core-api/irq/managed_irq.rst
> > @@ -80,9 +80,58 @@ The following examples assume a system with 8 CPUs.
> >      /proc/irq/48/effective_affinity_list:0
> >      /proc/irq/48/smp_affinity_list:7
> > =20
> > -  This can be verified via the debugfs interface
> > -  (/sys/kernel/debug/irq/irqs/48). The dstate field will include
> > +  If the Linux kernel was built with Kconfig CONFIG_GENERIC_IRQ_DEBUGFS
> > +  enabled, this can be verified via the debugfs interface (e.g.,
> > +  /sys/kernel/debug/irq/irqs/48). The dstate field will include
> >    IRQD_IRQ_DISABLED, IRQD_IRQ_MASKED and IRQD_MANAGED_SHUTDOWN.
> > +  A managed IRQ will also include IRQD_AFFINITY_MANAGED. For example:
> > +
> > +    # cat /sys/kernel/debug/irq/irqs/87
> > +    handler:  handle_edge_irq
> > +    device:   0000:41:00.0
>=20
> This will not render the way you seem to expect, it should be a literal
> block.  Please do build the docs and look at the results before sending
> documentation patches.
>=20
Hi Jon,

Acknowledged. I'll resolve the above in the next iteration.


Kind regards,
--=20
Aaron Tomlin

--oxxcqlsmlduigv53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEeQaE6/qKljiNHm6b4t6WWBnMd9YFAmn3bJIACgkQ4t6WWBnM
d9ZwVg//UCO+k/9WbSF9yDqGJENJxub9I6ZrCTGobD1xKRB0m9w8PpuwJikINe/0
dGC/9qXRHbCcUau6X4+qqiMR9YkpjN6l89ru4vmX+WGTZ4VVpUGLGmAfQrocTsj3
f7tNfQz9SEiVDVZg8JwfslITyuAHgb3lq+pF1uehRB2ZoibgmOC/6OK1r/yvUDTd
Uo95BIkq0ey/Pe0NgohFI1RBmIGv9Jhg1fobt9Kak8gkGZcugxumsifWki4dJfpn
w+CfS22krx8tFCt56gd0A6sxWu7EQzovpRbhEViUI5w7fFbkLlMXP9i0GVCkj7r1
DNIn1FiK8r4+RI+2Q0mlZA7vFSVE+YTK8bOIlYcJj4/zdc0+jqLs0NmgEl5fzkoW
y8NtD9EmFZzybyobC0sCOfU14NP3Bzv6rT8t+pgfXyV5RDkCT5Nu1BIc17InG4Np
b5xzxWk0zpmWEEYH4tP8TtIAKnIT8lehthN664oq8seGVYWyAW1hS7L1QOFPFD3y
lAfguwnYN42u5S3EchEjPfc+KhnBPiwc6IJUI5KdrbdKb5LCbpFxsEiB+9TfTBB1
zf6WfkmJIpH5GDWMWz4g/FNqhcE3nh3C6ONn3wYVNzqAgMIZxYyc8kDlcrsTms3W
n+KUvrT3BX+xR1yKACib307A4XWqiee2Ron9ITfkrG7w52ATm1s=
=B1UJ
-----END PGP SIGNATURE-----

--oxxcqlsmlduigv53--
