Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B261CCA47C
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 11:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351465AbiFMLJq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 07:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351704AbiFMLHl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 07:07:41 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF053389F
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 03:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyFl4jXFEqpPrGWs0F0xfrvDWD0GkeLNmUMRykwvY/NUUzGcYciBbS9bZ/4ISX9Sw7JdtPVfHY5pRNQUBADjAHHTh+R7M4sW1h01osF/ndPYg2e5IN2o/JA2JIc2YiRHUOOVaPUU3lbnnNMHxGslWa9/c8XwyJSDvjAxWiDx5lhKJre7H5LDpvci99gKNQOpz3G2Jv3F5Hd0Aw2j1CYaAShxhuENjd30KqkgNrwAk8ASYMYIpcChG3xCuB+E+FlIaYBU0E9JUG8s5w3aX6tPOQR+PtQn1LgRS6yaQrHuEhwTPHaBYcji1KksKE2O1hQRe/pRuGiEI8V7aZdTQm811A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8hKt6DeS08PRyJyMw0u1aDM47+JgmYVZ6cyEFlaooU=;
 b=H+ixmA0UXbXpV2Zml6U5z3H1pf4hZOzyeCZoRhW140eoX6nlSW+L5auPoBZMXCd/t4y11dO2LMXBK76MztlXzBMd9x7+9vT+yxmDnN9d+PVvOZfBpecvWLNuxadkpnBzVDC9mXA1zf+He6DLUz8x0OPNOW8JPNWn/sJn0C9+a1T1os9m5lNu3RXSSSIKOFaQ7tBG2Zdh7QlkGFzUIe2+yVJnit7tTsq5buSugbQmE++nCGHaK1/QVXJJ/SkXqLljj8C7WPLN/4fahoKzZTjDvXe4Z+lSAY61H33LhXwkJCWZaJkVdYINAmORUqoCfs8m7UK1oUpwsxEUwfJK6YXdwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8hKt6DeS08PRyJyMw0u1aDM47+JgmYVZ6cyEFlaooU=;
 b=Y3T1wWjzBWGGkWmGcP+ABY0oD9UzPf46nw0X5+Y5Yw11coOkWcTBeBjIjF4jGNOMd69el1A+BuTjnJbd5uLABUseeiBH6GHh7+gh9pSDils0Pli5wUi3POO2NiPB8jGfOWIz1V5H+pZ0quJBuovYmmzqq4kSP3ckgmDk/Swtu6IWbo6pSRvLBt7/jWbB6q9eDsKsLwtBir3YEBRp79V7IwvAnccP6bMr9kmf1+Rjwm9jCMB3kMkM9B60Y+rdrNxvNV0zs3OT7PrswrTHsp69uFaJ3gMQye3uxwMn8HQ78+5xlFuFkXUX4wPqjh3RHH3n8V/N6aGtsaNIJG0Q+nxcUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 MN2PR12MB4992.namprd12.prod.outlook.com (2603:10b6:208:3c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.14; Mon, 13 Jun 2022 10:35:03 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::599e:e8c6:16b5:2f9c]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::599e:e8c6:16b5:2f9c%8]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 10:35:03 +0000
Date:   Mon, 13 Jun 2022 12:34:58 +0200
From:   Thierry Reding <treding@nvidia.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Dipen Patel <dipenp@nvidia.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Move the HTE documentation to driver-api/
Message-ID: <YqcS0uPivDgpYqz+@orome>
References: <87a6apj1do.fsf@meer.lwn.net>
 <985966be-b7a1-c208-0775-d1cb4ff072cd@nvidia.com>
 <87sfod4zsz.fsf@meer.lwn.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DPBj7z0ikcrA3PTF"
Content-Disposition: inline
In-Reply-To: <87sfod4zsz.fsf@meer.lwn.net>
X-NVConfidentiality: public
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
X-ClientProxiedBy: AS8PR04CA0174.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::29) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48d7b07a-2a65-4bb5-22ce-08da4d286036
X-MS-TrafficTypeDiagnostic: MN2PR12MB4992:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4992A0BD1C2E4582FF8CC0A0CFAB9@MN2PR12MB4992.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 29UDNqN7nJsMy3hqBDSPqXpOLSyGkivdCXtyayISu+DcEufMy74WGU+msIzNKL4SDyIB1NoMVkDRNUZIzWyrDNQO59yEzFcjy1PE9ERcRkKk1Ojazv4gZdIyZSGCDKEHhZAdQPas1mLpM1uJHq4WD6hR1e9ySxiikng1bFhC9cp0sx2C+WuqkB2LEnNcJcyQyiO7OfFbyzxIQD2n3z0zXpHw8rA1lZehdH3cgW2I8OG5GsVymfJoSrABkkAyY6PqBlOS+sOU0rQ3TfPbgbJMAWZEuaSfofS8bBhgTSIgJUAwrET1SpFfWI8eDzaMCyRhE9zyDtm7aLR0ejx6Pb9UFmDFLHp14dLVA/OmEHLJ1BkuYEdMZ0aAyYEHJWs/J4VRVUMIsIrd9ayw/G9mTjfynsf1BAsLH2CoVZuZLV1tpRpV0ZHKGxs3rxVlFVJVC7yYjY/ceupC2HinmjCYRzb4tAgJz4z5w1/qc+pgCK6KRLClWLXB7HuiYGgvyAzWU6O43Mr1BGY6eC7Ch+d6FWSR5r1Ot3Ej1Z2sxlt7aA1eg1r9G5R58p8luAwsJlORYZu2s2TAEtF86A7TDr17NXmx13Lonnlj1W48TT0ceCXGTfQ34dmVA+nrWMwvYo2LcCetP7WcQDOQn4xky23XpTGTj8o4HFC+1ls//n561pAClnIQDTl5HEsLNl2Ob4uNYKgEkjipvswaHJo3Ntzqg+qzLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(6506007)(53546011)(2906002)(44144004)(6486002)(66946007)(9686003)(6512007)(6666004)(5660300002)(316002)(508600001)(6916009)(83380400001)(38100700002)(33716001)(186003)(86362001)(4326008)(66556008)(66476007)(8936002)(21480400003)(8676002)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PAF5tnoFef6rVrspCBU4WsvPDNlVmxewixZ0nlUYVYwS3EAg2zFbNiadmUcd?=
 =?us-ascii?Q?TS45gNnCT0K4BvFhNy0o7BJA4cCKbM9pcbULX2dLEMVsXx6e7ULggqxbpv12?=
 =?us-ascii?Q?Bai4af2Lf5PJx6Q43yQ3ynND2CpSQ+/2vCqG1tiviE9FKbv2Z2o4BrIIo6/Z?=
 =?us-ascii?Q?8/q5KeEy2NqYqVY6mYCrxSeuu+rW6KjiBuYM8lhCHCkHsUdVHiHF8Hh/6QKW?=
 =?us-ascii?Q?sEtI2GKM5j2AtIsEIJPJgliwSUI9SmRochZwJnSAHitfWMPS215pujKUkVQL?=
 =?us-ascii?Q?bOWV4QmoXDIQR34aM98BigDswwiuGas7nKu7YlBj4UCORluWyLst0jA7U3mG?=
 =?us-ascii?Q?cnoa5kGWQ1HFOhBOrG1Ypyg2l1ShrH/8RyNxozlOIXqRA252iNmxCTmt5F4O?=
 =?us-ascii?Q?ZuVr19NjbveT+fIPIC0q5I+FvAXrZLwYsr7+blWN3NgSAfynUac5L36HfM1w?=
 =?us-ascii?Q?FB7jdqEHjP0+1pXMGt2d9tjZRbFrDjliVgN+IYIC1d2SfU8VtYXbzjNkC/73?=
 =?us-ascii?Q?AleNwHqOGRLPBapugt9LlddDQcgSNqfpmdEtoHfSCyXFyv6L98ZpAobFsmsG?=
 =?us-ascii?Q?IncYrOc53B2/jz6QfEwheCnCCGdrCShZpStJ0PsGRNuqH2uy1OE9T71o9FWb?=
 =?us-ascii?Q?VhFcOu8Qp5YNW5F851pA046GpswP92L+MxboNA5XEqsquuJ8vFFFEWVKVwDj?=
 =?us-ascii?Q?GtgdAuyOx33JOAtP/OKda5exttrP4CZgfRvhd3LvfiQR+KGIjheZZBRWeBjr?=
 =?us-ascii?Q?Au/XfNebc+VlyaKSD+YcvqsBeogmTJtc64JhBg5Qva/fEC42BSJuyC6BWl6c?=
 =?us-ascii?Q?+SQuW8r/lz7e5GYuNRJhSIoJsG/9bN8YZaxRDA7YcAzx91EDQuXHaPnAvlu0?=
 =?us-ascii?Q?80pomN6Uzq5A0CLTMDU0FgjwadgzopASAK3AGRAuoQFitEqF+TLFv+OhObxy?=
 =?us-ascii?Q?Ky1/+lApHwdIORB1cg9dxHKrsSiUWZOv84KI1JTYJe16VtMMJSVcncfOeOiL?=
 =?us-ascii?Q?G3yh02GNgisojSmNaiWjU236J92RAmy1S/9uIYnGr0PNFj0CtaE6yxMdMmJM?=
 =?us-ascii?Q?uAx2Xyc6pB0CwOioVwNve5GhdIYJPtci3YbeZ+IbK3R6+jGG6dBMqXz4khQQ?=
 =?us-ascii?Q?Q+2VJerrjZslWBkI0nZJ1/muzBNZU5ltr6uWQGaNTfzsUgonf79VGhcflT1X?=
 =?us-ascii?Q?6Mm+iv8XvpzwREJHAvUtK94yErX9TKMY9XGQJ5r+lHKwSfB6dBhqL9IVLZgf?=
 =?us-ascii?Q?ELwt09rrVhpF12SkxvKp3LWr7htKewHe/27G76HT4oSKaL/TFqRUKg7STj9m?=
 =?us-ascii?Q?TjMJ5b4tWhTJjcgmIL1qYq5FDFjrrcyssjEX10rqGDRMeMMbMDx4vTQcjbX6?=
 =?us-ascii?Q?BXPp1dWbR8InahTpC9tCnxRXNk4qnIS4kN26yGs0OYyLSFGodh7uGgri5i8K?=
 =?us-ascii?Q?OXpu/i8JspULpAwGbmTVPv/Jt6ckJ9EWVPckEOYKlMGVNjYZN0YwYuChknE1?=
 =?us-ascii?Q?O3GeNHyyu6o4lvojVb7Kr6chYo1kP34RhmDju+kvUY7nU4mgaOn8x0emjPzB?=
 =?us-ascii?Q?veWoRXiWJRgto58F6N8GG9vSecvWVO7e6i4e8wAcUphvOhl05lerr6ps2eLI?=
 =?us-ascii?Q?J7biLq+ceG0mIgq3VSMZp2MnXxyungRuwCkDPkZciPlLP9HRGoU9+m0kyrcb?=
 =?us-ascii?Q?QvIstVm04UXVg9FVneWkqtCcynlRNxCy/VVXW1z/ewd8An0pKiU4M5vQOfYk?=
 =?us-ascii?Q?zyPOJnRuGa0akoW/bG5RN39tYgWTA77oNucKT9BkgExC5JscZW4KLRJRGRKd?=
X-MS-Exchange-AntiSpam-MessageData-1: cQRDPYSzl+dZuw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d7b07a-2a65-4bb5-22ce-08da4d286036
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 10:35:03.6256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQlom4TWj4U9Rs3guX1IfUdQS6g79/NUgkbZDVw0a9Uiukmgts/QkSeBbyA7i/gDDfLDC9qCO9gkVRg92wjGqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4992
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--DPBj7z0ikcrA3PTF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 09:33:16AM -0600, Jonathan Corbet wrote:
> Dipen Patel <dipenp@nvidia.com> writes:
>=20
> > Acked-by: Dipen Patel <dipenp@nvidia.com>
> >
> > On 6/6/22 7:46 AM, Jonathan Corbet wrote:
> >> The hardware timestamp engine documentation is driver API material, and
> >> really belongs in the driver-API book; move it there.
>=20
> Thanks...I'll push this through the docs tree unless I hear an
> objection.

Fine with me. We can coordinate if other documentation related updates
surface that may conflict with these.

Thierry

--DPBj7z0ikcrA3PTF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKnEtIACgkQ3SOs138+
s6EVwhAAgwuXsxA9qkjcICoyGvnfZjpce+4fOBlzY1pC4pmiO40zUs0A9pDqFtj9
ZZi9qkziaM6C1wxcsmeZOkHoT1j9J4eGS6IzBTXHJxmZaF95o6J8tyf8X2EHBCuY
62lwCegfS2lDScJifY6a1etEXoU2D5pJVFyC6XzkIfswUfW9+R9d53sekqIduNSK
lgZBgzKy0GRT7p1zV+GVlo77bBAwr3qrCLJ3xoToeX2YUN2cDTRHgnu20Kpo0lla
+xITHsHJ0gc9so4E1aUhUmju8WpZZsFEgScH08CDoI5LOr3QPS39k4sLk7Rh7wVh
IUU+KifS04Yufy5a7za4rDlwoCQZL4VURDg7QwNWhY++J0yi9ZjI3jrVVZ1UNkON
0XboOqOgT65T1R1QnaHYW7P0FVbGD1ET3IPnlLmjtClVo+MyDfwm77gHh1/o6fSs
4xiP98ajO0RMWZZpGcRICIpWYNU6gAjtD5nDXC8QfLKcS3GfN3FpYb0qM9DX6vTm
ID/8ocV9Dhzgrf2V1bDN8yfuYyJD63Y5mZqxZdcjlxwjbNx0w0KV/moaD7fK3ly1
vd3vhMoIVRZuwS9W5gE1gligf1eMma2JY+aNW+wKsxeGdLOfXCi71P8ba827oCwF
5MF1rH7Ne3M0lgbp4RsCLnMCGB+8SgkIKZwlw+P1qcdAgx1EKuo=
=OHHi
-----END PGP SIGNATURE-----

--DPBj7z0ikcrA3PTF--
