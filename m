Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F213A3F0
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711552360; cv=fail; b=h+5F8/Vv5Ob9p310u2G9646Q3v535WAHT9g4nl33T/3VWmA4ERd+iWDSlWrUQN+Z1Obdtcfx7HOsu6RWJye/FMr1NCOprsE3tMMfea5RUQtU6VQO/k4PULS8OxPfbC7xEtrHREI+aaVa5s6rj+n7NfZtKjjx/p/BrDoY1tPwZng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711552360; c=relaxed/simple;
	bh=2pqhY83bG9RE9GBJpEPO19nNYBuUGisnhSC2wuM08DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L08hAF+ceczM7FinJJWSmSAkZggZVtLvxm63v5ksXwysj6WupGjkKRL/HMbMt3deC02xIQo3rbbS//xZ8Fd3qaCBE0EXyX1W/tM69Im1dgvhbDfDAkUXx0kf+Tm4swUBDNPqKKRszZXI644AG8w0cCbG8RwS/L4fMo+UwYK9J1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eSeSGjgy; arc=fail smtp.client-ip=40.107.94.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eSeSGjgy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceqo0iC8wa4B9TEZFX/OG8rtbMAJj9CllfM2uHTA6VhtoEnRRQ2RVM95FqqDZS3AEqYUWwVvMT8HjU5uT3fo2jZ1g15x0vUMgD2m4sY+PggbBRV0rKoGaPJeDuqKyH84LVFmZX+vyEIkOrbAe2NWG4UUkyRvMKiRuTFpbsJydxihydWacn/QD40vqP6quuVWElIwe+W4m6/z25/z6KiEnAl8wxiU8xgVHPcnZFW/LWACLYnHCv1rm6x0zLaQktHSOhH7rMMt58Fz02+6tZblRtEf57wGRe7mq8PpT8TuSDobiZuJG2dIGNT0rJStA/oZdu0ussoxUKSvjU1HVNEr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOmZA5SuqPnSmGiNeAnavt1d5AL6MR0RLxoO16YT82Q=;
 b=hoAHJlcbsQ3ow01byrXR8E2HSptNfPDGTysF6kz/3KT5r1vAZfHCAGC1AVPG/IiC8CfF38fWng9ZcMfDU0fFrb8hEbb+5HO1XWb+imPyfI/LeoYx+ZVfbFB6w6mtUvImT7QGWhPPbtBDcu8x02Kyd/+acx06dP9jAtRXgMo7FSJnIHUvgUolHdLrloRQd8hT8mB03HgXlSMTH5ZkQfjuAXJdZuL9HTAP2yLflzJpu2WsjogCYexxJReAyQIUYrqGyX1y0WkRhe0OGg02U1rHL4AnzPm9ZyQyP1sKsMNbePhPfXQ4k1Zci6Lg2OsF0iLkURn8iVkvNUUsMNkAJxJ8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOmZA5SuqPnSmGiNeAnavt1d5AL6MR0RLxoO16YT82Q=;
 b=eSeSGjgyYOzSmxW4bmSeckYWlWSRXKlxdmGliP5QSUqfR8WPPWaW6AbCR6bueCq4w0/meqxrXbaCRZ1HYSX17/IHuYXeR7gd1qZYW9PXsM0DNnwOZ2AgPIw8Duq51LlsISD/PgLbo9iCX6U1WCDlIQsM+JWZK4irFeQPAo6f4a2mDFHrfGMuqIb/Wh2lOtda1l09J5ZkfpTvtf0NvlsHMjzsUDh7+SBMmoaq1aIgdTLQ7tyijfFCUNwmruglAAfYFFIENrr1EutB7R1SWx/GdU+FB4u7duuDiCaUf2X0SYN4REF269p5OIk2xE0F5YOzbMA1YTRYJtl11xqXPNW6cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Wed, 27 Mar 2024 15:12:32 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::dc5c:2cf1:d5f5:9753%6]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 15:12:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, willy@infradead.org,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
 Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 5/6] mm: memory-failure: use isolate_movable_folio() in
 mf_isolate_folio()
Date: Wed, 27 Mar 2024 11:12:29 -0400
X-Mailer: MailMate (1.14r6028)
Message-ID: <96E8196D-EE42-460F-9583-24E86B57EF49@nvidia.com>
In-Reply-To: <20240327141034.3712697-6-wangkefeng.wang@huawei.com>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-6-wangkefeng.wang@huawei.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_1242C55A-35B9-45DF-800A-98FB57B43219_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1PR13CA0402.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::17) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: c874da6c-044b-4e49-b9e5-08dc4e705309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xBCYl+D7qxFEX7B9goMtjcc8nf8B9yTK7dj2yznICFFsZpZDl5Hgohl3Wi/ACkjn7Sz1tFOJewER5Er4ozxkIku5xLZj88uWFslPjTNymhDvH6Y/r7WFDMiRJyJEHxy6iyxrhyvCUfHoi5Tgk16RbU6dZD6ZnCZFmFY19AGBe+q167Ql5SbCO6xBg4bG4CtqSeLGKHbJP2f++Ov0pPd7qznFoPusXvqo9WBPxe8U/yix6opQq6rlfV6dRPugE2UEHsvXOKIeQQyiFaTpqNwi/tn98+NZwwCQN2FrA6WYMKc7YBCZ56gWXRT+7MlcThyDoxJRGnDZZeILmigrsUpbSrKBb+37yXV77213JZ/VxzIx+wZPgyiTyLYH5lpB35ASJALgXF5q4YbpULXzk9kh/2hU9A3mIpfmhWDwmDWIPRrq6Skcw/kCdp0MMul8Xts+HRqqXXd32cITTS0Nla3EF//qumv6LgZQRlg0Nwke0/JYA7KcBOXbl6mjK+akpsbC6Ugh1rSOLePddFLkgxixP3TK/pvuphYFkDzmNenWBssWwypkIDEScxo+TcRvVpK8P1PG2/lWsPqVj5Oate45NpwrnhrvYE3WWb1oRcx9u/nZbpdgsB7lQxTuomsnk0OvPvqxPwCkASKY3Gm9JS+y9E/4ccZ58xKtRzdCBDw/Tus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xQIaKxjMIZFZX48OKXG5tOui/lWJsU3G8F/FtZbt0/WCt3mRMSDCd2VU+6LA?=
 =?us-ascii?Q?WtfjMLdok6huCyVuwI8pT0nbFEopTQ/VlZJLoli26NqnU5cv36RGQKMNCgqN?=
 =?us-ascii?Q?SRmwKDQlIMZEKkFU+0Za/nMuY5Zs8uBzIupuB4mvNNreb/wzd95FI156aSZL?=
 =?us-ascii?Q?GpsI8c/6PaPkXk9WmGzEWg+G6GwWAIJIKEYSBZT39ut8awFOo1WCfT8GUyw/?=
 =?us-ascii?Q?TIKWahgVscVot0EmzzYrNH4NM1UiKzctFN/GlDCD0kzJ8iLvHsYvj2Ia8amy?=
 =?us-ascii?Q?Vyk3Si6CQK9NmYlz1OeiJDrEXfYqi2YVn5/8F+rURpbOiIpBF64qYufIGC7V?=
 =?us-ascii?Q?BAmbMZV6DsDmfLdz5UZYEntGOUotICvBgZ+v/VeaUteYEO58NghusCXWnn2x?=
 =?us-ascii?Q?mwKnyLqsXbBoHkIyvCSK4ZqbIFIY8KvM+0ipKxwkuAxq8khugcgU6zCfS0FH?=
 =?us-ascii?Q?+1Xuqd/0ioXTzQf1bsM5HFCWk4zMhz4ZssGqR+w0UVNzRcWuTDfKq7oYTvTx?=
 =?us-ascii?Q?CluQ2iB2oMBV4yqLLIGZN7TVvKINaEBxnFZHGNHGHqqWH6HyOHwlmMm0fjp0?=
 =?us-ascii?Q?SkjWGau+BG7qITVvuZwctxk6ZRYbDRE/3mZr5Qj95cvAdbqWLY4zaibsGLHS?=
 =?us-ascii?Q?AQv36u7FDQPWGfsPBoG/8o0BFJwKajX9VkxFuMEHbLFIgqaxgoTmzHytaHcj?=
 =?us-ascii?Q?l2ECPHXxwPbo/FGVp0m3+H/CkVuhBOM65BhaWGPa3ZZqeaaClDh3A0GRiL+h?=
 =?us-ascii?Q?7v4H4jVKE3RFWOeV/suOA97xIGJoR092BHG32lJ0Co9FrGMb7E1RjWF2ndhc?=
 =?us-ascii?Q?AYNOV8KnVfF8UYbT3VE/q+arqK5FbZsRKOLiYMrpqd6z5Oh2aBSBBeuP7mJD?=
 =?us-ascii?Q?34TXZsY/pbcro9rwHKVChPBfVSJqER3NejupIJhhuUSXc4+5hpff8F0x/qT6?=
 =?us-ascii?Q?/jKtqlxYBYujAwr8q2IiDASZtxNS6yyPYktWG9YTniWV1AwZQdEke9er6K7k?=
 =?us-ascii?Q?ZaFupzrsiIBkK/IkNtO9ci9eDQV8l7xTzIiTWsN3WgwyGzPcTDtHqyQ8ovhw?=
 =?us-ascii?Q?VuBD46bgymAlnvwObKlgsUH6rlW0YrKWYRTvuzjTyn40+ftsHvGI1rSrWcCi?=
 =?us-ascii?Q?d6L52TrHamzxDMNq7hjH78/erB6f6FcHsqHrtS/NmI39J05Dn/KnExoIa9ME?=
 =?us-ascii?Q?yBRJ6AgAD72m+LDkMVBapLb+/jniWA24PCG2RCmV494CwrRRmZGfkemZmTxm?=
 =?us-ascii?Q?Ewu+1kiajZlKc6GWEKpT/zjDm429afJkT+P0onyyTe72uqhk1lzwLnhLclRi?=
 =?us-ascii?Q?T7cN0m9DZnUitG73WDhvmME+R0HfT1YiIJl23hGghFklL5sL2yuO+LykrenZ?=
 =?us-ascii?Q?XOVDrtUfRljJwjI7KDGfBirdAYpMmXiIviEE+xUYsDwhEs2fkTHkYrnarElP?=
 =?us-ascii?Q?eFGOXNazOrOrzcUIrxwBUpJ629goknFZXmj7RVYjrbl4F+KK1Tuf6phgzstG?=
 =?us-ascii?Q?5fuQi+byT3ZrEpuZ5OnGlUwxc7g/7aeBkoDjYc/8+Gun7524ARml4usrfFql?=
 =?us-ascii?Q?LnYfRLhgFpEX7YEZ3tixwFqpoOEKdLBtzAORqoB3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c874da6c-044b-4e49-b9e5-08dc4e705309
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 15:12:31.7300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9uysp4ol6I/CKFtAiEkeFLF1HxG5IjmWwI0QcHb6yDgBfUB5upIPIq0ysQimkTS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147

--=_MailMate_1242C55A-35B9-45DF-800A-98FB57B43219_=
Content-Type: text/plain

On 27 Mar 2024, at 10:10, Kefeng Wang wrote:

> Directly use isolate_movable_folio() helper in mf_isolate_folio().
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  mm/memory-failure.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

--=_MailMate_1242C55A-35B9-45DF-800A-98FB57B43219_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmYEN10PHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUqmIP+wVjWGrnKWd+rI/dwi8lYtuQ+ZHfDTp6Rqwc
ZgFNLEkPnOhCmNfdkqgaxuPruStxewLDaoFcm3/UNFwfjpzhhpO992LKyOv0TLKd
2icsgaZ+7rlVyM7SO2ZZBDHLzMSUuv0+YFCCCKlxaBWyFph0vBRbzl6wAf2RWZ5g
/nMxkf6mS22M8toDxnR027Tyrcb7g/zEmBDLxeCaJLr4JiaWZlUh1yilyCmzN6/1
Or8bZVL7WX4ZbJ5vL/uvX3Fqy7rTpPRMaX/iRC4tonj5oOs6SfaWvl4tkRGWg9XL
xvl0ptqND4Yw07cZOjy5cpqmAL+0QX6dbNkglkV8/1YJ5N+H7G9PcoP+Og6tSRUq
nSZKiUK730bbQxYCrpv5IZUzOxXkeLOOK+wREH9rcpeqZButfyNdgzPEP934Sui9
0t3GpuRGarWuRedSlsX4ntE5FMrFdYizYKzjEIgOBzznOqeU0XMMLvAyUXGOjCcf
CCnMjcVcWgK5x7JTXNIjpMrsOLeTPLpbSjL8sgteqqi8lu/F5U1g1yB0CkFwVr9d
51p5T79x9CibDYAVGTFSEhnOcWzRcUd9A6Cld2bBFBTJt1ot17IoTLyKXQO+TcUJ
pS6m/p+XdwCfmpU4Po87M5c7KD2rqTQZp1f2EfK6WQOqxjP0GEH22dPs2BOQ0EK5
5ivTigrx
=BSDl
-----END PGP SIGNATURE-----

--=_MailMate_1242C55A-35B9-45DF-800A-98FB57B43219_=--
