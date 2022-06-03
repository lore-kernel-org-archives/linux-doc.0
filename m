Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8A5C43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 15:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243820AbiFCPyk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 11:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243358AbiFCPyj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:54:39 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01olkn0189.outbound.protection.outlook.com [104.47.21.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D3150E0E
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2DHmlriA9lIkobe0u0EP6hJYnXC9r50JJfYo3MMyhIfo6VAwuF4974iD62BaPMbe5xlsFdJzMez+xIJX4c1Wua6w5FitpZpyWS2917IXvPQM+y//o3ZVPrXFgSiQaRsjIxcjjGz5cK5lCQlu6oOoBqsj6cf6J1mZAz9G6mOt4dMFWZ/iPqEf1843qwc/rWR2yOgfyDoq6XKvwVTXT6nkgA0MaHUAk/4K14ZzpwpdK6cHa2/axm3a+uMGsQHENidT22ETAzWZJ6HL04jgWQscJeuVLTB5jjl0XYsA/XoHXKi5wzpAyMdMKCJTcm2H6HYafZ3U1aKI5OX6eQVGB/YEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayIUIHYLesbnakGqCph2trPYZjv+FCxRG72nUDgF0uQ=;
 b=LJRSyBBPj4i7Tkkhkxrpjg3jZdEdpcZA8fLdAvByDlVy0x9Fnc+nWJC/d0q/l6pE3X8Kf/2fi1eJme7ahfkBU/+6hcEabPvfJkIEiJygedCOt6X9kiDzfK64Y7xwUoOHIFM//VLNPdBr3EhCvT4s6oqfOU4X7qdm8YlOUnJSIqIPMO48KMVW6fpNFTT691nymfPvxl0bNmz5okmG+pxQSM3+xoP7UzxyKRKQB1WsKsDik0+iAc8BZct/bMzg06YiZKxz3M/7ZeEnvhaxPMimU3T25dIXI8rnno3Tz8jOzJl7Z/MciY5/ROkFth6yQXPT/va4oqVkUfR4bHf3gdG59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayIUIHYLesbnakGqCph2trPYZjv+FCxRG72nUDgF0uQ=;
 b=UsihgWbwM1+XaN6hDkWUR/rAiKYS3thb/Y7W9fjXNWhpOV95GeZymk0GBP0N3HEWzbt1nLieDFI+NcUsVZDejbd9BUg1VYtC+ssiLvq6BXtSM/cGTsIGO549cmH/1n6CIdwuXB795qyAeyiFzaTcH89SESg1+CVizzWOV19WRVcD6AdIohh5tUsQfr74W1yAKexiwK4QiREe6oBYY0RH8USfVmwDe0EAOYaeiMX+UXROxLoro4HIoJd3++ygcJEFMrihvFpwfTYl2atBWVpC8PWZYsMfE32k/d3IY7GkSSzemmun2BuyTQ+wxIVat9VQm92Y2XyIFRgxYIBdWinieg==
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f9::12)
 by CWLP123MB5104.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 15:54:33 +0000
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd]) by LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 15:54:33 +0000
From:   Adam Turner <aaturnerpython@outlook.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Akira Yokosawa <akiyks@gmail.com>
CC:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Thread-Topic: Sphinx pre v3 -- removing support
Thread-Index: AQHYd1Ink4AKnVoTM0Ozr7tCYnrwmK09x/UAgAAGBC2AAAUKAIAAANWs
Date:   Fri, 3 Jun 2022 15:54:33 +0000
Message-ID: <LO3P123MB26814568842CC74EF831288EC2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
 <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <87ee05oior.fsf@intel.com>
In-Reply-To: <87ee05oior.fsf@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: cbb80fe3-4a6d-92f7-bad2-31ab14379bc8
x-tmn:  [/pbIx/SKcRZ8iHJiZePVz3337hA7ku6T]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd34d7c6-e1e4-40b9-ef6c-08da45795a82
x-ms-traffictypediagnostic: CWLP123MB5104:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFG0fY1ENYc6pxPMVNZJs4dutBNILucfRAmButFBpVef3eARxCC99KZ5tQK+wkF75pfUALi+UdKNrg/bxrjK3c+5CQkLWYkbrzZdiptS/+MfBcIVLKw82XUM2xxel8PKHel+O4w/YZ1nCdYbpCd0vh//Kf4TNP+ug6PI6uVvOsN930xclCPt/fReiYT12tm6fnWAOIx7qL8Q4vXeV7ELFo21FEv4G8ajuiuu1AxGFIkCQdm1zDXb1KCjWv6USpv8jbLw2hsm3+OJlFWg68aQSAwPEGrprd9m4L0d1ejWAlBNAHwygv6tMvdfSWU1nqP0EgVa2DEkBuWcIRhlJIYeOgVA/JGxj1RB1WINl1lPjBfKMdnYGNaQ8dPMKKIC02EXZzGP5mzVAJxCT6FAamxEhZumeqy6NHFNKpvcLtJjJdH8bkUuTCOgRGN7wWC5OkwFoWMHULTEYzwCu7An+n3pF5aSfyjo0viarOSn9d18wksWTdRTjaFwQeuKAfIqGTNzh5NagiMK0nOXBrmFGEHLRv4kJGINKbJySgvoajWRR7gA7QdI5FyWdH456tVngnJQDr8pgcK/DQLd5m4ugpLwlg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WNglopqEODrL2R7X4Wt6alwC9tm+F7JR6TrJnIUl1pacb9m/S8yE45dkBJ?=
 =?iso-8859-1?Q?wB0l5+6YJFX//tF4yPgfqwb9/9qRGhf7tYLEsYh1PN9A2CAJOUMTfgSUkl?=
 =?iso-8859-1?Q?UbROAArKG4JXAPmdX4JFrXK+6DeGSlAl3wync+aeYIFkSKDosXWWUUtuj9?=
 =?iso-8859-1?Q?6Pd6skwJtChOS7S7j8uG3v9pa4A+ykkUTdRdmEFz798594mZ7YIE9eDxao?=
 =?iso-8859-1?Q?ZbP+wZwNTbYdE263qp8dlB4yaAat85a4n7r2AeZeLDuOHkiwoB1UtfG1VA?=
 =?iso-8859-1?Q?ui3FUZ+RHNnMQEBGemn+Yd+hw/Zibm6GMFpoezQ3KSw6MbzUHl1ZjEAVbm?=
 =?iso-8859-1?Q?Tm3s6c++v0ONgxvqu0DgvasfZhijPAdmliC5RbVaBVemfdM5C/zx8xX3Kc?=
 =?iso-8859-1?Q?yn++LGEA+qi0cobz7dK4mPfbGdImX4QSpPexZElZjvMaNKfCECATX5UxRl?=
 =?iso-8859-1?Q?U8ghD/e5mbl3pCR6dbp2jFpgm7m1fl9zpMqCy2xh5vs0k7QX4NLcq2l3yx?=
 =?iso-8859-1?Q?ztXSjwYIAW3yoDiWz8pTMMPS6jlpcpjek1FsNPMx0GH8iU03njEoEXvE4w?=
 =?iso-8859-1?Q?5JJEsGiWRRzT2x/tRMwLDYt705sKinU0AjVMDadOdhdSoVPdfRbTE1sbcN?=
 =?iso-8859-1?Q?hyh6PJ4VIW2Z6tk6WUr3g3hJDztfy+E1c0Qnq819bxSVUwOXJ9u/0gvcWM?=
 =?iso-8859-1?Q?5ItHv/8Ls0FdVSf6vRhTRZIMx3TugmOkgTThKTduknBu63R0n45ADDxvvy?=
 =?iso-8859-1?Q?NvlAi2w8rOW2Q/KpqXFc4xSMQrBP50XUAw72aomUAGypP3vQ6qKYxtPHdP?=
 =?iso-8859-1?Q?18/AFos5QcBUKALSmpEZq0GQYyxupPtg71yWTTyAcQJIrDcDff76NIHJFl?=
 =?iso-8859-1?Q?0DIe3hhVmLlhG5LJxay8jO1HlaDzclZoOTrkbbwL7Khrp/rYE4bfNtTZkj?=
 =?iso-8859-1?Q?MHMqne95wWJc4wLJLfrDnQYH1DFopsESNfXPTIlkHSekGQNo1ZpkkRVrtE?=
 =?iso-8859-1?Q?6jInonO/0lKn06jWAQMRsvrzkOkV7Kg+TOM0Gjxy4i8Pv7vWxOQQm9XU3v?=
 =?iso-8859-1?Q?xt5hdB0gIf57vBAHUGviGXMP3WjNHYWSl6g+QdABJ7UPYxQhMMufWWd0UY?=
 =?iso-8859-1?Q?+b9RFG4lFyrls3BA3Hj+PDK8+7b8yYttQrCmCvsINTMfaMLZz/Ca12Pajs?=
 =?iso-8859-1?Q?vTIWxCKUpqGJXzDjB2ePRdu9bqcpgCuzdYMKlbOuYi76/t6W9R/cZMdbf/?=
 =?iso-8859-1?Q?7gfJTVDHtKheYD9s2AcikaWSvf6krOHM9enWA24AEh+oRf53Pj446gktLx?=
 =?iso-8859-1?Q?+l+CRgbQ2/4putYJulLGZRTLh8/WZuAqOmN3tP7ceVv52DPtl+IOoPXIjM?=
 =?iso-8859-1?Q?yp2cIs9iFu/4ouKQ/QGTiRlCtEUkIG0KTrbohsDVTieiRR27MXXgpD1rmm?=
 =?iso-8859-1?Q?HqVkKYlzzIeKzAq3rLdgAQpeMhJ1SSzwz9UqToLDr3pyoE6/8fvhMyMp2b?=
 =?iso-8859-1?Q?Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fd34d7c6-e1e4-40b9-ef6c-08da45795a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 15:54:33.8080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB5104
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>> No releases will be removed from PyPI, but if pre v3 syntax is still=0A=
>> used, Sphinx 6.0 would fail to properly parse it.=0A=
=0A=
> And that's the crux of the problem. From kernel POV I'd very much prefer=
=0A=
> not setting an upper bound for the Sphinx version. I think it's=0A=
> important to be able to build the documentation using the latest Sphinx,=
=0A=
> and gradually iron out the inevitable quirks that arise.=0A=
=0A=
> However, if you decide to drop support for pre v3 syntax in Sphinx v6,=0A=
> and we decide to stick to being able to use pre v3 Sphinx, we can't move=
=0A=
> forward to newer versions until we bump the lower bound for the Sphinx=0A=
> version to v3+. (Or we need to hack around Sphinx version differences in=
=0A=
> kernel, but I think that would be best avoided.)=0A=
=0A=
I don't want to be in the position of knowingly breaking the=0A=
documentation tooling for the kernel. A strawman of a compromise=0A=
would be for us (Sphinx) to delay the removal to Sphinx 7.0, and the=0A=
kernel to increase the minimum to Sphinx 3.1 (required for=0A=
".. c:namespace::"). That would enable the kernel to gradually update=0A=
the syntax over a longer period, as I believe you won't be able to =0A=
use the v3 syntax currently.=0A=
=0A=
Equally, Jonathan said he was hesitant to increase the minimum to =0A=
Sphinx 3, so perhaps that wouldn't work.=0A=
=0A=
A=0A=
