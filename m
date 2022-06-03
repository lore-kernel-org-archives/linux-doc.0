Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF739C43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 15:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245482AbiFCP1X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 11:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245481AbiFCP1W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:27:22 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01olkn0186.outbound.protection.outlook.com [104.47.21.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBA255BF
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qlr2nPT0+rXg0dhyZZ4PBx9nkOTIcHXIhMkTzaYco8jg3O2Q8ZaK84buxxbwF0VvrCbQdck6NVRmQJpTUwqSQpZ7f5GeSqkPdgC/LhUblX0Nhm3ZvVH7SdSJJ+a1/ffdKg13m5d/6ZbO5KpjW8CJoPypKLpDj6MW9jflRtfcV5QTUSFMjlpXDmm7wMxn9N5w4croThYLyo6aM5D1Get/2TMcI05KEPStlmm7tvAqiJx7o75QM9bW8L8XDV0gG13NdY2KO5QHyaEKMoiww+LvZZ3qzfd4BAycq2032wYADLsDJ5Zv9lqb1tXvTxWhlpu7oC3UeUyAHSnZ6EkRoMcjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZS0rjUzhjDplcxiHi7ZvHoPmc14fVxg+ZCHsM96WZI=;
 b=RMaFiRcuiO5CzoQ0Fv9Z3opE8HlfOhbYHBGYwtnGSwTFKrd/gEqi6l3/QVAANlA5AHagG0LXIZID09uL99VnSk3OcLYsEJKl10lP8zjBw3LmRIhELjtSanIDXqrshqQRcZWn7rX/JK3ar/4F+xxAyZiagaXAtUCv1TSFARgKbWFgzHaxD0sQuuQ8geZn1YnBcWzcQoSkQ88t9piFqUU5c+MxcZwFhzeGDhFFODf2/JboyueTPS1wKipGDsETqBEhxI4e47nvj39MXfdu2vAaWaxNu2a6ZJTfx+dEslg5O25JOP2WsvZErvu0Qr9+QOoTiWbB0WdD5GBPEftNNIaRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZS0rjUzhjDplcxiHi7ZvHoPmc14fVxg+ZCHsM96WZI=;
 b=MrL5v4lvOGyu2nUMsg/vXWAnQq8fIyAHCL3WKXMx2PhWzQQfWo39CiQVHYRbsQTGW9/p0FpdmIuQhbYESYNEUMFLTGKE1KCBALn7yp3fSkbEYwsBzr06fPRQOwbMz2rvetpcDegUAsaCNz28FnOe7xELO8391FyK+quFub7IiMoQPz/Lx1VFDYFJ0kl3bOdpQ+RIDiDl/1B+Saw1wCSSEzoCbvOARwCKaPk+m2b9VS3B8r0N23Hp3mLu1BtCDmmIDksjEzxT4r4mc/ebFqy9R1Yo23FV4bT9fSMqICnOuJk6JNp9R0iNlrzt2Qz9MW346wJwMUWJZWZ39Ft2iv+Ftw==
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f9::12)
 by LO3P123MB2810.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 15:27:18 +0000
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd]) by LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 15:27:18 +0000
From:   Adam Turner <aaturnerpython@outlook.com>
To:     Akira Yokosawa <akiyks@gmail.com>
CC:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Thread-Topic: Sphinx pre v3 -- removing support
Thread-Index: AQHYd1Ink4AKnVoTM0Ozr7tCYnrwmK09x/UAgAAGBC0=
Date:   Fri, 3 Jun 2022 15:27:18 +0000
Message-ID: <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
In-Reply-To: <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 34eace9f-eaa6-c52f-2b08-c15c16b413db
x-tmn:  [Cq6+3hACR7i/8RDi1ckNjArSoOa+kjQX]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6ac3a90-7160-4503-db7d-08da45758bf4
x-ms-traffictypediagnostic: LO3P123MB2810:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hHYlBWws08IfqCmXn4fbXt/FDeQTPlIs1CAK6vp1OSSTuWLYEdDgZPKJma1SsLBTwENDUVLCgDYzp0q1UKtX27z6zem4S9FmpNeCPtmYjQzPVBo6Sl9Qa59tre4lOakxouBKoBbyWyI5TuTAskBAHV/14IyATpmZiYnN6jSopL+EDQmUTdES+i380EllXlsl4hOkHjWWPEgmGbumzbzJQkfzHWqLc04siBTvyZTLcJnM2mP/1LbB5k+iRufq8pAm+uv7xMEnRsDGyzfNpCaBsGK1YhG3fnQTwa7+HRV/c4U6/hijAZc1BSm8QmP+OSFA5qUoC4R8OTWQH1NiFTw2ExlTFkdXoEY38QLCyOidjYkOJRdQCaDUbE8Xu4n+mWzjxNbcHcX9QRI4nJ7JweMs+FCeuu531+Bwe4QSKS5heUAz9g3/cfepVf12PY0NjP3IadPLNwS0xvGWg0tZTQOktXMxZbq5+tijNg7HRP5ZqT+H3x2Xy9LOV+FtBNuFxbI9MCTMB5fOQCmuJjAhXueXPU/fyUQL112fFA9frhWIA9hGLkHSml1OrHueK5J0bHOii0GGQ4Ap3oUeDac68qczYtCXMwwY9AfYA1Y0dJij5FCMUwwCGNsT7nSszFls202o
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ETGcbLp7exyW9vLfe3xWvM8xsPvf7heS8ttUbXtg6vSSK3ltjOL6SWbTUY?=
 =?iso-8859-1?Q?KRBh0x1ZmmbHDjjw4hhnNL8GtDLi+BL1ZG25a+VWGDCeSXI8jyMfL5pJNV?=
 =?iso-8859-1?Q?Htvq1oLRkdoWfeIwY1UYhxXoUujGVBdTbqoZejeUZaaavXFPGhEGLv2RHU?=
 =?iso-8859-1?Q?YrQ6TMlOHCUoPIMS41BtW0SL0Wa3i++wnAcH8lXyMp7yqIyKhdr8H48WS9?=
 =?iso-8859-1?Q?CqXXH/vepzACBcY5xo1T/YpXJrlUgWBGydFQqBe2XbxUNlm2qnZDp0zO3U?=
 =?iso-8859-1?Q?WPZARjU8i/MAthXygwz5MzFcIVHuV25qGAltdkrCHgrjx9orh6DoI0iDOJ?=
 =?iso-8859-1?Q?bB7ao8cb37uW8KvdhIgY+IQecvhYzahdqCYEipKthxw88YXLNU61YMCCu2?=
 =?iso-8859-1?Q?hH5CrJesjaogLrS+3DYlC9rPL6XZr215MPyAnR5zxaqp42iRStcOJn1In/?=
 =?iso-8859-1?Q?wwj2y+QJca6olzBBZaaum+dTqK6CosH1T1ks56KODsYMMVqSIPgGLS6EhQ?=
 =?iso-8859-1?Q?JOo8hJtoGBhIENUGZ/kyWV6oKpIf0YLqgN+bGkGCliTh54ykFaNhHc5x5F?=
 =?iso-8859-1?Q?qy53mgaRguG/Zz78TaNAaHUyzYYsll2GMlaUK/rMCHpp2CdvsL7Uu1il7E?=
 =?iso-8859-1?Q?oW2K6lbtK/AEbdgDrYqO3xchGurV2qjPFcx2N3y+hyqx3DAtU2/DL3QzEH?=
 =?iso-8859-1?Q?hzvogSelVJyB/Q0PJZ8t6dL49cxs/keHBUtm4JOOxNxC/14dPB/Uv0yk5R?=
 =?iso-8859-1?Q?+eurYqE/i5OAai5PtudQ2gm82Yy4ewEEbuq5tyBXOUnH27X//LdYHUpcLs?=
 =?iso-8859-1?Q?nQh8GxyvSP6ZsKi5gACef61S4kZONgkb5Q8RHGchsPdKPRLGm8nPAVkDJm?=
 =?iso-8859-1?Q?6w3LEGdCI7WJud3GriQrTCK6hz2+jjGJCTcu+Za3YDdRXbLOjSnt+ZAywd?=
 =?iso-8859-1?Q?l+3Jng94/afQAPEE4iZDK0Ad7fxgS/1Lwx2OrWgujUO7qvhcp15U2lX4Q1?=
 =?iso-8859-1?Q?xj7ioJjFmiXnhOSr5Cr2D6GyMPoiABNzf56GjCE4LNz4vAklQCaWT4CKLU?=
 =?iso-8859-1?Q?C9aZBxDSA1b8cKBtpjLDmLMyrk55yK6+v7w2iO7GAHkA32ZsIoaarn8cgA?=
 =?iso-8859-1?Q?VRQBI97nYyaxIUf3sO/LZS7PpPNDAErt/0LLRUw9Ww7p/T6SJ6vmPk4umm?=
 =?iso-8859-1?Q?OaVQx6SkzeMZayyueexrMdmUC6fWPoJnMexVDrgXt2o6evvjSNcQuULW2H?=
 =?iso-8859-1?Q?D5/RmF2osZGtsvScVuCjW7/fz14g3w308pDu5CiPce1LQI3GOGEdUJza9V?=
 =?iso-8859-1?Q?JpwXCP6OwJVmLctA93Uuwd/5yIklTO70gIl6lO+DZFXwAkxZ/EnL8U2qFd?=
 =?iso-8859-1?Q?wCM5u5i6N/3Vuy6ZShPBQHqWSMhZ3X/u5tTdukVujA87TAT/cK83YVPZrv?=
 =?iso-8859-1?Q?3QL+llqi/cdH14T3YLohIHj6PAHnfW303/6skjUAYKPzNRrF1AVYgcoNig?=
 =?iso-8859-1?Q?g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ac3a90-7160-4503-db7d-08da45758bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 15:27:18.7448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB2810
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>> From Sphinx's perspective, we'd like to remove long-deprecated code.=0A=
>> What is a good solution here for both sides? The intertial option is=0A=
>> for us to delay the deprecation by another major version (removal is=0A=
>> currently scheduled for Sphinx 6 (2023-05), and we are currently =0A=
>> releasing a major version every May.=0A=
=0A=
> So, can we assume that there won't be any backward-incompatible=0A=
> behavior changes in Sphinx due to the removal of those long-deprecated=0A=
> code?=0A=
=0A=
I'm referring to removing support for the "c_allow_pre_v3", =0A=
"c_warn_on_allowed_pre_v3", configuration options [1]_, and the =0A=
associated support for still parsing the pre v3 syntax in the C =0A=
domain [2]_. This means that pre v3 syntax in reStructuredText files=0A=
would not work with Sphinx 6 onwards.=0A=
=0A=
> Or do you mean that after the release of Sphinx 6, pre v3 Sphinx=0A=
> will be removed in the PyPI repository?=0A=
=0A=
No releases will be removed from PyPI, but if pre v3 syntax is still=0A=
used, Sphinx 6.0 would fail to properly parse it.=0A=
=0A=
> These questions might be too obvious for you but I have no idea what=0A=
> you mean by "removing support".=0A=
=0A=
A=0A=
=0A=
_[1]: https://www.sphinx-doc.org/en/master/usage/configuration.html#confval=
-c_allow_pre_v3=0A=
_[2]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.h=
tml#the-c-domain=0A=
=0A=
