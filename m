Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F77C43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 14:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237239AbiFCONm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 10:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245070AbiFCONe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 10:13:34 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01olkn0148.outbound.protection.outlook.com [104.47.21.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F3F3CA51
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 07:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDKdcROCkxMe7c7XIKpOEdd+AbQNNHGZJaHlaV0OSVmilVz6qiIxF6mT7j0g9AdwYAEVw17o1NF29avurhqTK/T7fBRTJl2HduzRtmAZkcQBrAiR0PzJWFotqkEj1WjHP6BggEmDwVe6fW/9p3PEz2Rn2YTkCbKAix5UPg6MXs/EHiRHz1Lo7LxF1OpEgB6ZIlA7M8vOlF8MMU6Il2a+H3+c/AAswON3LB4y5GwBekLlrfyuvQUdvco2FaFMs5Ez4GiycvBsSFWwbCQj+MIqLX6nVgA22YynOZZ0bISJyvIPDC8uMrBJCRzN0SL9sZ0RUS/o0Nh2Dzev4PL5Y1AWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtV7VSbmeVUVE+IYLRQ/hgdnuweE8oBlXohSoLa12PA=;
 b=Hzxdnysmmd0YDFlnX08VKxEoJjhYWuD5bV1aKEkotqEghmzKFhWs3eo51boQz8NOeJYm1pa6EJ8LFOLLyATZTwlPwBe4k2FV1pWTuGhejBopAGLBMaDdzpN1KmvEFLTHnIwiRWZkbNroN628CsSBiM4imRdJgGuQaXom95L7oei6OSXAPi9Ql24aabA/HU1A/OxbVm0+KcuIoyVnj+dBeKzbYlIR+WTlOnBedeULeO2iZAChlEuXGOFvXWnyJWMwXqQgIMY4DYNswwCFG6m4haLlCokEeXHQ7XofpIFJUhojK3i1lJMpo/SeuY7X0iJ4r6rzEfmuUWfycqUiAfQuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtV7VSbmeVUVE+IYLRQ/hgdnuweE8oBlXohSoLa12PA=;
 b=jhNUbeKOjyrHPirRIf2Ln2LJlJlRVqyoOxBLsB3x3ubjsQQEGmJ7hJxrskm1fikbqiuSQN5wtf9U0Ky8nrNI26nx+8jIrtF37Z8yKp997grgU+Icpw19TtWnh2aghMeX4o6wB2r9cdUmerLC0ptho6WExa+tODWudkqHxgKXoxcUmmCLFCTG+d9LooFtQk3vOczDnqAGVt/gIFpA0G47LtL93ZFPbDjv8opMqhghPgWxkpPTYlsoC/uAQJ2IOuvyPHShoePVfjlsT2uEezIGu3Ma/7IH5H7UDh54BywkF4rY9vOZcTrrpqu1CXGBUDedkoc0wivVWtfZ2i2xA3Yxhg==
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f9::12)
 by LO3P123MB3097.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 14:13:27 +0000
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd]) by LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 14:13:27 +0000
From:   Adam Turner <aaturnerpython@outlook.com>
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>
Subject: Sphinx pre v3 -- removing support
Thread-Topic: Sphinx pre v3 -- removing support
Thread-Index: AQHYd1Ink4AKnVoTM0Ozr7tCYnrwmA==
Date:   Fri, 3 Jun 2022 14:13:27 +0000
Message-ID: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: df198834-0a5a-ed80-f75d-53d1c5e7399a
x-tmn:  [EIXyCdD3MJBRx1r2laMnJdwqoqrV5JnB]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 448e1354-1322-4e12-9063-08da456b3a9b
x-ms-traffictypediagnostic: LO3P123MB3097:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UtRJEjYo98pT2oqhCVVy5KyCa1ludXITE+cTH/b7kz7E9Puo1wohjz6tJYKXgs/EJw0NZpftF0n1sxhyDnGyqglfjBwtuUNmNCBzgaLDZ0KOEb8c8aqgNbT6yoPQEHWva+1NfRXQUnOXs26Mc2iZ3iNC0HqvGsbFsaFNe9jTwOfgsIiIcXbBecQhneMCsUC+TxdOuEjjWR333OfUiKDtQWC4UIhQc9KyyM6caUUe3Aj+qmQjpwzQqBwuKZFTOdd4IyRUhzxfFVFDD6IDXlZzb/F2Bg0uTBlkIdTRh+YdoARN+keD1sKtAUsGBwF8HrmF8YIrZgvJWIF3AKB9por37rS0zHJMaHUlav5HToQFezGYDzN7P2BusuC4e/0anJmsCjTzwQ5lXxUJhIxYxUFa2ZB/SkIYa3FMMEXVuUwiVvVGCLU27WRZDLtdBt+24zQRzxzCb/ThuH33tQJfprBxtVxl1I6w2B0p8IzKu2ztc1v8e/zSTOiskWuGwFFTVi4lZ/1+kIZrn7U50ZVPfG4+BbKbJeLpRSrFtbXZ6PfVaSjn4mbWWFSSpUI2spQBzx8lMy4/xM63DYvVBrducn8w3YwyvkVr86LJKnPVvpa6kFzxjnV3DSXDD5tiPFWRwaXj
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?yPAEYDvErHLjoAXhR0IkLSPTjaLzIGAdpRh+fPv8vzw8SAQpVb8CWq00Dj?=
 =?iso-8859-1?Q?5HY+3yZbuT6pGHh378RaVplbbJJ0ZjuTPCOP1n8o4nSlPYdXnjz/F9Dgsq?=
 =?iso-8859-1?Q?oiGQ4OAsByeJMGglFObcVrL+cZsFG2fdw9/3mmNugifpA6uF6cadvCsz2f?=
 =?iso-8859-1?Q?8r9nP4kJTUmLjhboGcuUODAF+wdeFTPjs1kD4JAiUyZmpTFr6C81VtEjWF?=
 =?iso-8859-1?Q?8+bRwrWB7wrtY5NvdhnsaElF/tIrFau53/SVkOoEzsM0cIk0M5VY45vQ3t?=
 =?iso-8859-1?Q?6EGhoV06EOUvqn2HZ0CA2PiLWRU/05iSy7UBOkMmwhC76baHYI1WuUXPx6?=
 =?iso-8859-1?Q?zVBtdVbAG2l7o7sgZSSN0oC97xihTx0ogUPQcuU9lnkQp6DZIxee7DiAHP?=
 =?iso-8859-1?Q?ka9ihxa7NGs992EpEDDgu7hJCyjjOb9oGs/nIGjlXNTxZpBpMj3YQFJtbm?=
 =?iso-8859-1?Q?sbhKPjOg5lToE135fUY7oYGxY/jDm7AYtn52UR4X2VPfyk6SyXVgGW9KN0?=
 =?iso-8859-1?Q?m3lsB7cVrUy+N1H/5w2Ftl+yvuTLwWy6TLGhKfkBpM0Yarw4r239T3uxy9?=
 =?iso-8859-1?Q?p0XNuaMn1nKwaTwuKnMTXn7nOXdBbW+tVs/YU6k1kvWFsAs88KWqmTRZfm?=
 =?iso-8859-1?Q?ur1ZnPvLayZf8lIQSSy6N3oK22BBMV8jfQd/KwKCihuLW1edUxI9DUNdUY?=
 =?iso-8859-1?Q?qpr/HNnOcLc4K1WXuEQT6IzGddKiwEgSROwGAUOqNJXSWP9urOt49CcQ7l?=
 =?iso-8859-1?Q?uZRUThScjliQJjfyiwcxStV98Rbv1HFU1bZhc+A7/l4rsjVGS8cacOe9e5?=
 =?iso-8859-1?Q?8rkt+Egs8HBcv/dBUgbLCb6Qpnayuuclmm4PzKPCmM/S07l8uUKX7PzNda?=
 =?iso-8859-1?Q?uvmsIjoIkKL9xIyzzS1kDemaXNMtlkpzl172TBcB2y8Len0MweV5DyA84D?=
 =?iso-8859-1?Q?CRhZ9DBBpOLB3SKkUn8mk2xBcyYUYA8aH1qXsmVDfXOUVyU8Q4V1RFSx0z?=
 =?iso-8859-1?Q?4ci7oa9WkGHL7q9FoSeImyAwcpCm1lI9A5CbpQ7NqQBZAQB3roZDrjp8+9?=
 =?iso-8859-1?Q?dBTOC3dD/SKFXRxg4Tr1dgoEXtCpI8SPbI+d2qaWRPus6EyY8cS4HCKpCc?=
 =?iso-8859-1?Q?+uTrFYIixlbdJeliQJ/mzGaQvLP4SjsCMoMzkp3lSqmQj62Os3ab3r1M0r?=
 =?iso-8859-1?Q?CO+xy8r71tkWOTN6pMyi2OrhdkjcSaVHWjZLDcljWbxHqCcwnJAN4efLUw?=
 =?iso-8859-1?Q?LffQpIYcKoRzfXUOvFs5EwjnEXtD22WvNenLCQOn23qobECTAxS1i3vw9h?=
 =?iso-8859-1?Q?tqCfuOAoUwxK7PxMqa5YW8d6wGp+MKycefHNim6fiZVeSRGtSvgBWc0rLJ?=
 =?iso-8859-1?Q?6i2CU0VvYSiOcK/SKD82LlNmFeYr5ZlrKkCtOYuKA6/jIGKvDU7mqsY1F/?=
 =?iso-8859-1?Q?+E1riIYpKWiYjTV00iOFuyc+C81RWOg6A0CDJlRheLHSekgrR58IhL+Elj?=
 =?iso-8859-1?Q?g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 448e1354-1322-4e12-9063-08da456b3a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 14:13:27.3125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3097
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,=0A=
=0A=
I was pointed in the direction of this mailing list by Jani Nikula in=0A=
[1]_, who said:=0A=
=0A=
> Thanks for the ping. I was heavily involved in the early days of=0A=
> converting the kernel to use Sphinx, but I haven't closely followed=0A=
> the recent developments. Basically I think I'd also be inclined to=0A=
> push for much higher minimum Sphinx version requirements than what=0A=
> the kernel currently has. The minimum at the moment is v1.7.9 =0A=
> (or v2.4.4 for PDF). It's difficult to maintain support for a wide=0A=
> range of Sphinx versions. Perhaps the best bet would be to mail the=0A=
> kernel documentation list at linux-doc@vger.kernel.org and Cc =0A=
> Jonathan Corbet corbet@lwn.net to try to reach an understanding on=0A=
> the recommended minimum version and version ranges that makes sense=0A=
> for both parties to support. HTH.=0A=
=0A=
This email is an attempt to do that. =0A=
=0A=
From Sphinx's perspective, we'd like to remove long-deprecated code.=0A=
What is a good solution here for both sides? The intertial option is=0A=
for us to delay the deprecation by another major version (removal is=0A=
currently scheduled for Sphinx 6 (2023-05), and we are currently =0A=
releasing a major version every May.=0A=
=0A=
Jani reports that you still require Sphinx 1.7.9 -- I have no =0A=
investment in the documentation development of the kernel, but he=0A=
rightly notes that is quite an old version -- released 3 years and 9=0A=
months ago.=0A=
=0A=
Please would you let me know if there is anything required on our=0A=
(Sphinx's) end that would let us drop the "pre v3" support gracefully.=0A=
=0A=
A=0A=
=0A=
Thanks,=0A=
Adam=0A=
=0A=
_[1]: https://github.com/sphinx-doc/sphinx/pull/10471#discussion_r888962744=
=0A=
