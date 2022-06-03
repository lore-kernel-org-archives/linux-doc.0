Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3F0C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 14:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbiFCObA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 10:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244009AbiFCOa7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 10:30:59 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01olkn0147.outbound.protection.outlook.com [104.47.21.147])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622294C786
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 07:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaVZ6ewV9S4nr2CmllCM6QAafKCfAV+wESu8GZx4eFrF/j5yhwWjNqzuheG7n5ifWRnzGLAOodXKdKrLVRBe/KYNK05Om7gCvxkzTZL+YjnoQg9xb37Bx9ospq7cPpUBCR7CyMZlqqNtGVHvwFy8Reu+qlzOzHFrdKwtN0TsPbbFBSKe6Bk5bsb7aNJkATmZG7kqAqA5jCvNqOjK3+3pXupHiVLWxc3df5zE1EqZy3YnQiqyvV80D+7jct+YXs/D7zkto80XJjMH3X/GpRGkDtuRj3imHYS9ujjFnkBCi4/kNaL2lw8IDeo0ZnVewXSNSE83zt5sguPAIetZRRApzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+k2pX+fWQDIOJ9ghRDWUXJOsbcozg278W+CeZzv1YU=;
 b=e8hdMgXdywWuuhAbZ9MAJsawSVxnlpsDdLuj+SEF+e+rqZgfgRM9QfJE0Igp9K5bZIzWZSveCIjeFZkYUjPvIrXxO0ppkoFcXgyrxc3FDiQbYg7DLWoQbgPLv8l+3f/DJpEvn+4gF0UJrnEMWJ1hJECjHiFibMLwNnChyaWsxnrqp9HPECM3rgNwnzuvux8mTA6yTjOwJfgmPnCRxobp91/udPKK4gY2/DyaOg9/biOsW0Xl1T+nhGyt2PNBuJOHu6PcsEidgJhcvE3yiwKHXyij2okrlCY9fI7D/GeHttdCKIpNK6Tyxd7JEPt4HCHoT2K2bUHap9mU8gkd/u4i3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+k2pX+fWQDIOJ9ghRDWUXJOsbcozg278W+CeZzv1YU=;
 b=kSnyn9vBDkbuDEqnxhOfIFFKoIURhGooJLzcqt3IXdgGJ++qq+IBJkMjfjU9yasSSILosLMDZC1DBJIts5+QQJAr3GbgOxGIkEMSwpI+PqDqDsWmS8TOSPNe+5r/+WxOj0pP5+MAgPCS+Z2lmqQyatntZbPhqhAW7d4v+7ghNWMnPdSrf/4U4JijZzEYDxyD2ojp1jfIvbnwwHtTugkBSwIZHCIkIRQEpPYCb81TdZkNDsZNCv2Hyn18Dpipj3hKL1xvwuROH/dbVihOZj8iMm+8DRFSI+YuNoMV8D1/Bq0rqgZmg2na5pXbJV6NTOAfb5/1EXGR9pSxdPw+J89o0g==
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f9::12)
 by LO4P123MB5123.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 14:30:56 +0000
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd]) by LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd%5]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 14:30:56 +0000
From:   Adam Turner <aaturnerpython@outlook.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Thread-Topic: Sphinx pre v3 -- removing support
Thread-Index: AQHYd1Ink4AKnVoTM0Ozr7tCYnrwmK09u9aAgAAB4hU=
Date:   Fri, 3 Jun 2022 14:30:56 +0000
Message-ID: <LO3P123MB2681ADAA6BD2102ACBD86622C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
In-Reply-To: <877d5xx1xo.fsf@meer.lwn.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: c9924fcb-cb60-c818-f462-b79daf0bdcc5
x-tmn:  [nADi9xb4LBh/PpwIR9loWtauf1NUVefk]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61cc4bac-8cb6-4dea-f976-08da456dabfc
x-ms-traffictypediagnostic: LO4P123MB5123:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BU9W9D+cJqwWZU5sIdH8U+vENrjn9tVYMJUlgrU7taN/4Nf9deS9v9EsjKRgQrcPJ1zaqYRUvox7kg7Wk0FpvQ3B5mQguFnKoaBeQ38Vz5xVBqz6YBWT9e/PQidLlxdw5pKMrLf5kULGjzdUq21J45EhV1+y8X4CiMGPA7oBi0pdN7LpCctH8PQbSDg5L87rHPSzNiPVKbZdsLNAbLAUFym6vwbeox0o8F0coP+s0XsMYjv/nZqgWoWbVEdjB89tWqCPc3lgMSu4xTOCjZfJKzvf+8krhjekjq3tE3QLFQsH3BaTKjwsf0Qv53Dm7ypmsvMEJZwxtd+swr+VeCCuKuWJuSdbaAhBUqfESm1TLdC94E8wa+NVA7Nkj3UkIkotsK+I8UhFIVxLWuh5ETTASTAt7nTMP+BzrAPL5yZovmKRHjEM9OG2tMrTfz8DRI2n9QC6g1uZ+s3IpTNuqaCEwepyse41PY9mc6IUKG56J6vD/2RLiJr7WtrbU96CJ5OKGl/Ui+xUENmQLNEbYpSHxAzzXjYctspdd4zrpFCRWxAOrLOHeyYBMgGjzdhqul631P+VLYaJOAqoG9u6cRQjJKHtnFBXOt77K1nXvP3GgvnjhPgc2kAR236phViLeGrI
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?namywCRoYCO2NdDyV7dHN+/z+gy11bCdXku8KxX2gOILgyr1rYk09AdrOn?=
 =?iso-8859-1?Q?u7aSUjoGesLnQFNKrAFlErU/Vl56WeKM3HEULfdrHTkSjvv2wxa8911/op?=
 =?iso-8859-1?Q?xSGIwu3HMdtIMAPcr6SMRc7j02EiCxU5RRJDzq7vCNgRP8M7UZedvl/3ka?=
 =?iso-8859-1?Q?PnN4Q/InBIysCE8PhxfyzakhcgDSUH3w74QtHVSPbj/SJx9QQG7L0gAVoA?=
 =?iso-8859-1?Q?CPCPpXVuavRTnB4wp9CD/CQGG5fBRGA9X0xODF8po8w/RHFAT7PGDA34gX?=
 =?iso-8859-1?Q?dSkRXqrejJaRdBn+6G3t8IfphtSnsRuaG40vm8qgrEQ7j8xcdx9Kw7Tieo?=
 =?iso-8859-1?Q?5MvZqwuLsN4yn/0sqQmLr/TIVdqLxu0VVzwUBqyeNilBjnl/q32fOefqm4?=
 =?iso-8859-1?Q?O1aCpitd4rvh82ynYj3H00eX5l16rENDs5o0sXnw4gVgj6RfMs3bsAd6/P?=
 =?iso-8859-1?Q?X6+oPAPsLyhoDqhdwoWkmKyEGsrM9WMERujfbylf1hPCIpJQjRNMERPGY2?=
 =?iso-8859-1?Q?JBHTXe9Spuhk///ql1SP2WJAspyEaq68HMLjVk+z8QtVTbYOqr7cP61ofU?=
 =?iso-8859-1?Q?Q7A6lmyRjLDgH9ifvthwhjo25kH4VoAqQ4FY6mIfr0sF4MlLzP2GwTfp8Q?=
 =?iso-8859-1?Q?hJJPzAcXddvpr1Load1bE1uf4GNYcXQCmfBWIk1NbuA8535yXKnkFkDGQ1?=
 =?iso-8859-1?Q?+Kj+Bu2A1e3iAnADswgGiqYZ8vh9a4D0VpVvwpFPq18r2DFJ25FBqOmrl0?=
 =?iso-8859-1?Q?tKABlh7X4EGeWep6eB4XozCyXf6OT/pbtl5tsjm488/ZvclYrdtl/70N6Z?=
 =?iso-8859-1?Q?C/JPU6lu7r5juuoxID7dNbiNH+WnPK1rtynY65I0Ad5F7nCiuOQp/dpJqg?=
 =?iso-8859-1?Q?DMBeLH7NKgpEp4rH4B3dLpiz73wSH7eivyNqxpy80qrEQA66fTS7JygqL1?=
 =?iso-8859-1?Q?eR8JBM7QiLmEdPIjqtkVQm14i6vQAgEhjSM3YHJwlPgMo8PNX7EMIut2/f?=
 =?iso-8859-1?Q?tvqFqXnMtbQnx4FITpAOO2EhjY6bwj+6mqXS4evZaBsNuafcRooldO6Q86?=
 =?iso-8859-1?Q?c1QgOJtTzICj66w0R20xpApcgATnVYr1hYDTNnPlWQ4PSNGTq8SuaLRfK0?=
 =?iso-8859-1?Q?5KmEYCqC+xIvRII4/NxuDBQaPDXm9WsV8hjXCF2pAMRUlT+RGg1XcedL1l?=
 =?iso-8859-1?Q?H9TLEXylGHQCKCmxleXpRfE5Lfk7I7qc0l9sAJMTMgr1jJyAbQHkqK5I3N?=
 =?iso-8859-1?Q?xbt2vMELQuvRcErBCPd2QkfSIsvkgL7wduTgS0240/y8SuRRDCSChC5sPP?=
 =?iso-8859-1?Q?G75j1kp0YJfbRciY2NOQpk4ATzZWKqItzlNkWGzhfI0j9n0q6zZ2T30l0m?=
 =?iso-8859-1?Q?jlSAjGQ/oxvy+wotdhOdKIOth1iFl6uqfmAlJZv08s3h9HpO86WiydV90R?=
 =?iso-8859-1?Q?ggt7cOqRo7uPZAsKF5Ow7+1oh+eO/xNidxCob8EAoLZwXXlGXtdb4B6QfH?=
 =?iso-8859-1?Q?U=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cc4bac-8cb6-4dea-f976-08da456dabfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 14:30:56.5112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB5123
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> We've been meaning to raise the minimum version for a bit.  Going to v3=
=0A=
> might be a bit of a stretch, though.  I still do most of my test builds=
=0A=
> with 2.4.3 just because Sphinx got so....much........slower with 3.0.=0A=
> I've not yet had a chance to try out 5.0 to see if that helps things,=0A=
> that's on my list to do soon.=0A=
=0A=
Sphinx 5.0 should be faster, I changed the logic to cache and reuse=0A=
the core publisher objects [1]_. I haven't compared to 2.4.3 though.=0A=
=0A=
A=0A=
=0A=
_[1]: https://github.com/sphinx-doc/sphinx/pull/10337=0A=
