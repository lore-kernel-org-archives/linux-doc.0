Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88940C43334
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 19:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346163AbiFMTAQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 15:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244262AbiFMS7L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 14:59:11 -0400
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01olkn0160.outbound.protection.outlook.com [104.47.20.160])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC7D43AC3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 09:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJwrwdgzA/+mxQNc17ddzIKD15CXXuAtnwsswobuDJ4Ce6P6s3H0it3EAE2NB6R+vLTB9RxR4w7SpEQ1WT/oe7udhBfwnkcLszLQXqBXdd6xnSVssKLvxBOpaOPGwCodtnSF4DJDnR/OWqLNvpAhhTZwvASP2QaRqpr18d8Qy+1CvfZpElhlZvhPyL+BOZhaQfyWoenyoac84JxmEwTZxE6chPhp2j4S97ArVxvLiYBTV74pF606bhiGNBnHWO/GHxWJbVxhIxMlCqci0g+NhStbwWUrRWQAtQu/P/fMG0hqnDgIq7eVVG4LhP8+tx6v/LeYEZavZTaSRXdm0X2jEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMg8qunJUHk55haQuHTaL1VZnP04mRGWb9hvlc0v4cE=;
 b=SYlKPKF1RHhl11SfCgHThfMF4E+ZlLDytY2JTRxrM/JMK2JUXyXH0l0DTB/nHF6hsE9/sJN7HVkq4KaQUrU0g0NDwOSI9WHrMvft2A8cKppDa40K6k0RzOhH++g+O1ZGmIQaEKFR+U79W/my1VXJuXrWRHDHn4x2Kch4vq6VGIvE+W4pqPwcOt7sDwTgsCijqJPBzVn/v/FNueO1XKXEZJbYRF7RyWSFABSi3EXcxq4q+2s8FfS8uOFrHJA88RUNCQm5Nk2MAnor2tWwZ/gOTgyTyScLXnoKnYIv+9EYH5R62HN+Yj1OwVVtm+AWq1VGwkT7eqyoGBcEBQosk9Lvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMg8qunJUHk55haQuHTaL1VZnP04mRGWb9hvlc0v4cE=;
 b=ZCMPxNa0MYszH704n+p1EqWxLluXrn++N7X2BKjaroY+q0v3fIlDdu2olE6aRpiztnPW+Cf6tpsc0sgr1/kJPHJeW8ul1NTAn1R2N7TW0KnTX7xVI/4+TANxsCY24Gke5PoAESfkY6NGxsq1+oWEgcDe9VrFp3A9TuZOtkqtkWeUKMfvBsclFYc3XvKiB17mBNzFM4B3fDuIp6J7NE+gav1vahK8WJM1j3w2SBHnB9+Xs6J6bdKdVg8SWZ5/JqisAGFwFMzBzMknyCzpkuqsKrMBVxqs44vdHsU8xEOfaA3BPWlHOB5m/yzQTizQTltgV8IbDw6thyo/yGCSYYNPGA==
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f9::12)
 by LO3P123MB3017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 16:16:12 +0000
Received: from LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd]) by LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
 ([fe80::a5dc:2258:460d:8bdd%4]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 16:16:12 +0000
From:   Adam Turner <aaturnerpython@outlook.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Thread-Topic: Sphinx pre v3 -- removing support
Thread-Index: AQHYd1Ink4AKnVoTM0Ozr7tCYnrwmK09u9aAgAARAgCAAAWTgIAABRcAgAAHJICAAFqXgIAPUBOAgAAFewCAAAMCvA==
Date:   Mon, 13 Jun 2022 16:16:12 +0000
Message-ID: <LO3P123MB2681B5638A09A83208095DCDC2AB9@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net> <YponOKPBgE8pgBYD@casper.infradead.org>
 <20220603154229.sj5sfeaehbkfzgin@meerkat.local> <87tu91vis5.fsf@meer.lwn.net>
 <20220603162615.wto3fywuvs2wlb5r@meerkat.local> <871qw5ju1m.fsf@meer.lwn.net>
 <20220613154059.oeb2kfp3j2amqat5@meerkat.local>
 <YqdfJPiQmYkC2uyT@casper.infradead.org>
In-Reply-To: <YqdfJPiQmYkC2uyT@casper.infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 51bc461a-7e24-c01b-f681-877487a83d24
x-tmn:  [AlbQYwleROm7rdS9zVvFwVavWj/E0QaX]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fd4fff1-7a26-4fbe-3ee3-08da4d580877
x-ms-traffictypediagnostic: LO3P123MB3017:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7PndfskDfaAH9N8g3YbfMf9BBpjD6lh4mkxF2BnQIA1pmOAGbqQa4xs+FIzKEeoZ3j0Fd3X7/BG2zZjMjxKwl12aWQJaAV8+bSrqP1kgXeg630e/++lxasao4YHDxdBRSuSDTWsJbJh07LeOGjj9J93aPW1NiubyBmggLdyRwf1qQ+KlsCGjoisFHt1m9M+vajwMmREZcbgYe4paeUxotU75ZxwzQFa+oEpsTMjkav1eDnMovIki7vpqBnkfpeOmewOtSKI9gzHT3ma5BXDlm37LbflMvp00K0Rm8FgmJdHFsxHE7ktoqBDKf/aN10k/g7LrTUeR6DEIQrAdQ/EqJ0Jd5D5lGZnWukqY5gs1KWfUIWJ4N7vtOPFKA55l9XG796+x/R2U3fA29tV/eWrQWk76bNMHe/D27+EqfIrzU5CQYRqYlGJdRoaiO7uvavsdo9fxpgLtrMZKjAwTE5ts/Y6bXkKYWIMcHtWvGX8BcfA7awTfUroXgRChqp7j3ss0zTTALgvOEsdARkWG2YAVpt8yHBp8bHnSuuIq1f8m5cN9lmQoWH1GzFT80dU9KEAFlf6BB7jlncf44alPlXE5RbejBWblFIWWoEUW84Kek100iXJ8t0gK4SRO1cIuqojq
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8GNgbL2KTPBehKIRdNEc3XsQO8CtBdyYu3NR6UUs/sF5pngp/ugCZVImcP?=
 =?iso-8859-1?Q?PEG42Ys7MDzrJNj6v0+bZkUpxNmxGAnDK9PX/bhtkgtbo8G5GrbExqACT3?=
 =?iso-8859-1?Q?ME7h8w6Tqkuu1uVv9KykUpYFPggISDZZ8mY9K4LKXtEm6b8fwGP6On7ni1?=
 =?iso-8859-1?Q?f/JRI9oCxJi0N2zls6796wF9PUUTwr7zwULf3tWYFHHHeVD74xv92mC56L?=
 =?iso-8859-1?Q?Imiw3fFDgEnSNpp6hBb+ndjopag/BHDEQaNX3ocZNh3MFOaogrtTjsSERw?=
 =?iso-8859-1?Q?dXv5joeZlC96EJyzfudJUD8XNa+Z31FwZxD0BKH8MCJycpeqMm2moLeqss?=
 =?iso-8859-1?Q?1vXowblsEHWe1o1zvrBlq+sccL8AiexUw6gjm1pXql3i87mcd467Z2+P+d?=
 =?iso-8859-1?Q?7KQt7B0DahnqZyOpurLSHam0gLTrt31TBvBEV7QcF4FPf9Xg0c4F2ujziJ?=
 =?iso-8859-1?Q?O0gh0RjOw9s1seM83NTZippNzL2N2q0fXdX8Ej1Lyf5hoSW6N8QDww/6b2?=
 =?iso-8859-1?Q?XQLcIjPv2fsPai7kGSjKff2QpOBJX3RkN6GKZPgbdm953kRvSYpDGXixnZ?=
 =?iso-8859-1?Q?QuZx/xtdHZTWnSpgK2CIVrUr74hQz8/SjWvDBpojwKrd3m1gj2EP5waKge?=
 =?iso-8859-1?Q?nAiAlQ9Hkmf1//a04q8D6sGx4L33EZbbEeXgKWUSTl+gGcETtvJgsbMoog?=
 =?iso-8859-1?Q?ufmnR4nxV1RNOGjuMW7tU7tKQ5qid7ZjXmjTAr0JwJM0lx3unP7thq01XY?=
 =?iso-8859-1?Q?rzjkQHuj2/iCMzjW4iF5/kZ9LudmdaRcVuvuMkVJ6VGH9iix2pVCNU3jLu?=
 =?iso-8859-1?Q?EpEtvtwKhITBq2UD3FBPQliw4eIJ6PN7ALA3B+XM+UhhHc1tr2cUUEmzBU?=
 =?iso-8859-1?Q?rA96ELSd03QAvBHiugmObhSFMPlqRcutHjDuqYtVrDwlEfROx2FpoC9Wvi?=
 =?iso-8859-1?Q?4BHynDijYaumjL7loNBTQqa7HgjaqBYcT9rP5q7RzNO4uSyM8BNLkdKaR1?=
 =?iso-8859-1?Q?C181KqT1ACX2DSiTrT6rbbvCxDO428I3KvjNGz8ICmaZ9CuCe+f6pR88pF?=
 =?iso-8859-1?Q?WLPtPFXXiAHq6HSm6r/0e+IpSkD8CMV5LV/CqwyDN3dmtqZX2QunrTXc/Y?=
 =?iso-8859-1?Q?v8eDQq7qJXuLNLDN/60iOAogizbmszd7Q/OhSmF63IKu6JNPZZ/JpFO7tL?=
 =?iso-8859-1?Q?pFKAUNI80Jf+jXRcElPlKSpFwOj7XycFGQds8BuACDApB7H7CORbvYtdPD?=
 =?iso-8859-1?Q?jtPSmF9JSiTHte34pQe8VoVQyQEv/kW1kk0bisZO5YzRtwe2VELfsny5u8?=
 =?iso-8859-1?Q?zFBDlWIRVqrfyqQcGbG8VlAugTmpUlJUIJYF+V+jM4pQ6Mq9r7NCeLSkRy?=
 =?iso-8859-1?Q?NYRdO4jfOf7Zx3fUuTVwMBsXhS9gzqfTYtWKNLog0u5gxAvFRS1omf1hl9?=
 =?iso-8859-1?Q?zQ4N62eTVsMfcXSx3ahSMjGm0/eH35zVfJzsUtCjX+OwyxnflHiXqlCUZ7?=
 =?iso-8859-1?Q?k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd4fff1-7a26-4fbe-3ee3-08da4d580877
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 16:16:12.0370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3017
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Can confirm the bug I mentioned is now present on at least=0A=
> https://www.kernel.org/doc/html/latest/core-api/mm-api.html#c.folio_add_w=
ait_queue=0A=
=0A=
> What should be the link to 'struct folio' is instead a link to=0A=
> folio_add_wait_queue.=0A=
=0A=
From a skim of the "view source" link, I think it is probably a problem in =
the kernel-doc directive, offending lines copied below:=0A=
=0A=
.. code-block:: restructuredtext=0A=
=0A=
=A0=A0 Filemap=0A=
=A0=A0 -------=0A=
=0A=
=A0=A0 .. kernel-doc:: mm/filemap.c=0A=
=A0 =A0 =A0 :export:=0A=
=0A=
Happy to take a look on the Sphinx side for any regressions we've introduce=
d, though I don't know anything about the kernel's documentation tooling so=
 can't help from that side.=0A=
=0A=
A=0A=
