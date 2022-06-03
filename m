Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C350C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 15:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245535AbiFCPad (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 11:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245531AbiFCPac (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:30:32 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01olkn0154.outbound.protection.outlook.com [104.47.21.154])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0821513F99
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmrVp7Hgh6o4cxkAbD5lpcWLmroJe81jAfj/jeaVvtPMZxv5AvEDlUElmAeVh28SsVgEgLfkob7tIeCdcLHiA5zdHQ+GQ0hU/HBM6UiNfF4zrFI7W96H0BG5g2zGkOEUFRsuvzG3VPu294LAqf8kQZNA1hzdlWIPGnQ0wBWFNQZU1t9NHi0AJQ+cImILCoPSPh4rTHH02AvQZbx+GSyLIJJbIlliEZXUTI6mSWCjp/+00vWo8T3puMoC/3tIZFl2XmpTPaUtv0krxBqdYZqXculO2iivk7p5acF2+7yVditlNYAezqSlY6UWB1EWgy7BGvl2PxZCIYfBraT6TVOYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvFmWch8ufvre6+zvJxUPhfC6dQ2P03GfjEW9w8Rqs4=;
 b=gaAdiFvaYgqAo9hjrB3jp+VdU2wvJdn5QDy64IOqTlPeqmYAdJ4D1c8JIb/GmyPu9Bg4H8ws84lwDrJaqSQF7JkkiZCJREtuLBX0b/kLydF43i6YZSn4gNW/k+/Yo0gCkLjtRNzaPx0V2GXo0bh/kXicDHke1bMe42wO70h0ECaJt16cR5FZ5aa9DSJ4+CWcxxcLEZuVe2FDDC5Do1AnzHHTvEH+grvKo7AhfYRUlwMikZD6tvk5G9Jc6E/QxUGTy5e8zqeknvqngSOd9C0zOy7/v+QxfIqo/8T0likLurp+XdLX/DFkOXJ5nuCzqEItHBf+w9sipRJsDUhLcxRd8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvFmWch8ufvre6+zvJxUPhfC6dQ2P03GfjEW9w8Rqs4=;
 b=Py1lf/mdluXwRQEAVeuA6Q32RhqexHK9NRXbq8XOcEWKstk4CKCYyeHm8HmyPQRB43L7AgOPRxJ+ZOWB3C1iXRxxe6CUJkyIjuCPHSTEiUoUHyDsqVnSE/5Ts9V8j0jYlCOgXxoES/M4VRyzWXpljr5q8gFSOo7OFqJsnL7lUAiiDpOhqKwf2zi6aY4fJ6plF1qreJx4iqaZULZ1AJPKA4ow8bQktFD9fJB8WIEFpGtEBvvUDz0JMGuDAo5FdzCcAAz4Q12ozc6lLbpSvFQFj3pyAtQz+sTvmo1i/acpgUU6wLg4IhuJpV2W8bwAq9nZaUoBSAqTIhUggy8yjXj2Bw==
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f9::12)
 by LO2P123MB5263.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:200::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 15:30:29 +0000
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd]) by LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 15:30:29 +0000
From:   Adam Turner <aaturnerpython@outlook.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
CC:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Sphinx pre v3 -- removing support
Thread-Topic: Sphinx pre v3 -- removing support
Thread-Index: AQHYd1Ink4AKnVoTM0Ozr7tCYnrwmK09u9aAgAARAgCAAAGy7A==
Date:   Fri, 3 Jun 2022 15:30:29 +0000
Message-ID: <LO3P123MB26812980BECD5299A27BA163C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net> <YponOKPBgE8pgBYD@casper.infradead.org>
In-Reply-To: <YponOKPBgE8pgBYD@casper.infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 5bedc5d0-a111-3263-6e18-7d549bbfafb2
x-tmn:  [W6isw4aKTZ9bIcOHXOZ2aD3yvOS/5ud4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b37c1e0b-ad2b-4a16-d637-08da4575fd81
x-ms-traffictypediagnostic: LO2P123MB5263:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4dZNb0ggQnKtpKbRN7SUcLRngf7JL1oNky5s6oeM/aDSZjCI/wZyfV8g183bEYfBgy9oOKbba4u5JL2bTH0aZcHjVneX2MAv20QgEgoP8N7z0gpGav5Rmd4bRtQU7JKynKWSvHltoqsW+7pQrCXJ8cph5ruvQurV1jvXHmSTYljYwZsLXF7TJ3DCGKSBE2QrLErwi6sgnigvKxu1l/8f9Bo8Z28MbjjkzRhaWPXzL95XOaHkANtoaxKKzPsum78gUaou9bcmXb7U+u1F2NEUcDy4gpWa32VhxLz6pyOr9Caxn8MOX5bfsL6p8tFhO8aDrHdyWVsNEICgOvnwV7UyKzEPKmkEVCIH5rLbF5t/AGHHWYLbRoxZ9rnEHtGFEAnoCmhwA0ngkwtqvWKwBLpL989FE2xVfVG/WrUdl9Fbhbd68WHfz5dAmWAkp6t8Vn9E7sBQs9Qz9kG+3F8kwVc/0Dx3h81DN4YvtN5BXC1ZH6zR4l79LVJ57G/Wj+OPDPxN3k8iNisfuD/Biw0+2s8URJ+CpHUqFKGA04V5Y0bvWwVA873QCDN3fGv3648pHJbOLatWXUGe64ePuvY5sMxbIQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SQntH3aSF+jGYe9RkNodarVVG8WqCEUlbimk8uSYzk3sOgK+o0BD3w1U/o?=
 =?iso-8859-1?Q?oEsEJwryEo6D6j4Qw5EuQnXdMCqt0kD2egvtuD5sBglSP3xNz1/KJI9tzM?=
 =?iso-8859-1?Q?1lKFzi/ETnhIuOv6Zsl8j3gHSExCZCrepEcSZpnLbWmGsgAaQJXL2qRth9?=
 =?iso-8859-1?Q?gGb4K8C2Rbm1kDn29nNjn6RHBf5k4WLmfsCDW2VhKXOW+rTNYVYgiQfl+5?=
 =?iso-8859-1?Q?+guUqk6kqTmZ5uvwifwRHGASf8yBmJntFxIHZsjzGIx9yxZWmIHrLdfSHd?=
 =?iso-8859-1?Q?vxDli6Riz7rZx7GAuQIkzSVv8ziG1PCPnJsGwTZ1Qyzp/LkU7A0DPi8eLY?=
 =?iso-8859-1?Q?Kh/l6e+1N4zOSgQG5ZHDBP76UGM/Y0tWplGxxlEly4gY4KEkw9gQONqcr4?=
 =?iso-8859-1?Q?ilck4DhTT7D0iVhJs2PawaPLSYymW+cPNu/djE53uIwZBiNNOV9Yiu1ms2?=
 =?iso-8859-1?Q?cUGEoZN36p/4YLqIK+JEybh0NZoWsY7g+hSZR5gIN0ZGRJh6qqobUiQbsX?=
 =?iso-8859-1?Q?er6vbTDJFs9JR4jnB0DXHkfF1m1nnAcoqmb8y+xgstM/7dDx592ghloYZN?=
 =?iso-8859-1?Q?Ju7eZqvWn9wkEGrk9vu1TsmDoZ3PJnIbabQ2NVDZq0T9CfmqXdutbn1kuR?=
 =?iso-8859-1?Q?RJi9OzNsbjKX7hCp0NMercYzipucYucVIp1PkZLywlW38E7reJowRVzRhk?=
 =?iso-8859-1?Q?B1CoDXcfZrY9esfrJHC/MwlVRXxDocg4sE+MVvYI576p1xsZ5MspYmXlWh?=
 =?iso-8859-1?Q?hmM8HTtNRAKphratxZAqlng7y0niDF1vnDnYm4ya7L5Gcfn5nIuyQtRnSe?=
 =?iso-8859-1?Q?wN3soV/ZBpFDsXQyFOgTVLZ8VpcRnAGAwJhzEPOt0zgemmuCJpxKWEDgmm?=
 =?iso-8859-1?Q?p55npMjkHNoFkcpOy0Q07QItXc04bCdj4gZLF9wd1B2VhqdeUL/DYCdwRI?=
 =?iso-8859-1?Q?8XFbsexPKZ0ASPJM6YywDVNVOXFAGFbD2CAoSxRkApa3tFGvovFHKrnIVz?=
 =?iso-8859-1?Q?Rkxw0W8Ql1a736x8hN8bP5BNyYsc/9hksd+oNgaR1MHXVd12X3uWzDEBVt?=
 =?iso-8859-1?Q?A5zxMGA472CelCVp15BHMY/tfEfrUm5U+Ad594znt0IqWD3z8Tx2S8GBB7?=
 =?iso-8859-1?Q?V3hOcwbbWfyyXvL6L1Pmltyc7gxILUIbz9QkckR24QbngPjuACyhKW9dr+?=
 =?iso-8859-1?Q?CDHKn13yQDqVmaFKZcSDlFhuSisYz1Y3F6Q5XbQouYL2mrClEmdji03WsE?=
 =?iso-8859-1?Q?wyyzKRH/ngZ4LnGyN1Wi99jVxsHZJqBBC1I8XPdyaBbY4dirwBaupuhDpb?=
 =?iso-8859-1?Q?SCKeW87tejnNDtvK6A8Sht49ZeYweux7Pghhwtykfao2p5FsD/kjWoCkj1?=
 =?iso-8859-1?Q?XrBmpfnzzTtA9iSiv4mr0KGqZG04pS83cYRXQqRaJO65DWiNP2SZ/1hopY?=
 =?iso-8859-1?Q?gojqoKCtKo+YQ7veebDjZvjJC+2WtM5/ZlBPofAmeytdfqPAgZz1VgzHyC?=
 =?iso-8859-1?Q?M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b37c1e0b-ad2b-4a16-d637-08da4575fd81
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 15:30:29.2668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB5263
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> There's a bug I've been meaning to track down & report where _some_ links=
=0A=
> are broken when building with the Sphinx natively installed on my system=
=0A=
> (Debian 4.3.2-1).  I haven't bothered because (a) life is short and (b)=
=0A=
> it's not affecting the kernel.org build.  If we're going to ask=0A=
> kernel.org to move to a newer version of Sphinx, we should make sure=0A=
> that the links won't be broken on whatever version we pick.=0A=
=0A=
> An example:=0A=
> <span class=3D"kt"><span class=3D"pre">void</span></span><span class=3D"w=
"> </span><span class=3D"p"><span class=3D"pre">*</span></span><span class=
=3D"sig-name descname"><span class=3D"n"><span class=3D"pre">kmap_local_fol=
io</span></span></span><span class=3D"sig-paren">(</span><span class=3D"k">=
<span class=3D"pre">struct</span></span><span class=3D"w"> </span><a class=
=3D"reference internal" href=3D"#c.kmap_local_folio" title=3D"folio"><span =
class=3D"n"><span class=3D"pre">folio</span></span></a><span class=3D"w"> <=
/span><span class=3D"p"><span class=3D"pre">*</span></span><span class=3D"n=
"><span class=3D"pre">folio</span></span>, <span class=3D"n"><span class=3D=
"pre">size_t</span></span><span class=3D"w"> </span><span class=3D"n"><span=
 class=3D"pre">offset</span></span><span class=3D"sig-paren">)</span><a cla=
ss=3D"headerlink" href=3D"#c.kmap_local_folio" title=3D"Permalink to this d=
efinition">=B6</a><br /></dt>=0A=
=0A=
> Other than that being a big pile of html, that <a href> around 'folio'=0A=
> should be a link to struct folio and not back to the c.kmap_local_folio=
=0A=
> anchor.=0A=
=0A=
> I appreciate this is not a great bug report, but I find the entire=0A=
> build system beyond my comprehension.=0A=
=0A=
Do you have the reST source behind this rendered HTML? I can then try=0A=
and find a minimal reproducer and see if we can fix within Sphinx.=0A=
=0A=
A=
