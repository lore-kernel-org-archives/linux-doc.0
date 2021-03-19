Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9258BC433E0
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 03:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6569964F1B
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 03:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhCSDfs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 23:35:48 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:49568 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbhCSDfn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Mar 2021 23:35:43 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210319033541epoutp0345ebb4ed385bea94a607ce19190a28b9~toRJu7F2V2283922839epoutp030
        for <linux-doc@vger.kernel.org>; Fri, 19 Mar 2021 03:35:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210319033541epoutp0345ebb4ed385bea94a607ce19190a28b9~toRJu7F2V2283922839epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1616124941;
        bh=t4uHrKdLok/DlaLBM3AOqx1mekA+poJFQDpFemQ9Whg=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=AXaEErROScnTkmISRCLZPS6pxzD80tlV+zahVx0TOfYkVbxqiazdIb+CsdbkJYDgm
         GcT3B7vlZ8vmi31PgvyqYCo868zWqE+Bh5n/JX59TCNNvSqvdQwQ+2sRLUtVFtHkLV
         6Z//5bc+JGXbzv0RtgRTHuX76K/J4avAVoXZrISY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210319033541epcas1p1bfffc7782ac2bf6336712750e2f90b8e~toRJLsHn80905609056epcas1p1Q;
        Fri, 19 Mar 2021 03:35:41 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.165]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4F1qKm2JHMz4x9Q0; Fri, 19 Mar
        2021 03:35:40 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        97.51.11962.C0C14506; Fri, 19 Mar 2021 12:35:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20210319033539epcas1p31aeda4c2274e038fff77f67d165a5acd~toRHyoZkd0198301983epcas1p3U;
        Fri, 19 Mar 2021 03:35:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210319033539epsmtrp159e65091c10b8c2c3cf124a9d54b827f~toRHxbG2t1599415994epsmtrp1Q;
        Fri, 19 Mar 2021 03:35:39 +0000 (GMT)
X-AuditID: b6c32a39-5b5ff70000002eba-e7-60541c0c6f0c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        97.1B.13470.B0C14506; Fri, 19 Mar 2021 12:35:39 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210319033539epsmtip1f7c979692130dd8ff79b2c545b55a6a4~toRHhyxoJ1557015570epsmtip1x;
        Fri, 19 Mar 2021 03:35:39 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     =?utf-8?B?J+WPuOW7tuiFvic=?= <siyanteng@loongson.cn>
Cc:     <mchehab+huawei@kernel.org>,
        "'Steve French'" <stfrench@microsoft.com>,
        "'Gibeom Kim'" <gibeomii.kim@samsung.com>,
        <linux-doc@vger.kernel.org>,
        "'Huacai chen'" <chenhuacai@gmail.com>, <siyanteng@gmail.com>,
        "'Jonathan Corbet'" <corbet@lwn.net>
In-Reply-To: <391b9b12.11cc.178483decb1.Coremail.siyanteng@loongson.cn>
Subject: RE: RE: [PATCH 2/2]  docs: filesystems: add cifs to the index file
Date:   Fri, 19 Mar 2021 12:35:39 +0900
Message-ID: <000e01d71c70$eeb6a0e0$cc23e2a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKBpTFN3nHQWl8/otGaCxi9GvZJQwMJJyE0AbSAHVMCCM+0vgK2SZtwqOmvnNA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmgS6PTEiCwYw1vBaP/1xktHhyoJ3R
        4tvuXhaLhW1LWCwezr7KaHH/7zwWizPLWSxuTZzP5sDhsXPWXXaPTas62TwamxYxeSzum8zq
        0brjL7tH35ZVjB6fN8kFsEfl2GSkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl
        5qbaKrn4BOi6ZeYAHaWkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTA0KNArTswt
        Ls1L10vOz7UyNDAwMgWqTMjJmPRuH0vBJsmKs20dzA2MrRJdjBwcEgImEt13HLoYuTiEBHYw
        SnTdbmeGcD4xSjR/f8wG4XxjlHjxbT9rFyMnWMfmzScZIRJ7GSUmfpvNCuG8ZJR4cquDDaSK
        TUBX4t+f/WC2iICFxJxtr8DmMgv8ZZQ4M7GXBSTBKeAu8XHqbLCxwgLeEiun3GACsVkEVCV2
        XW5mBLF5BSwlNl67ywxhC0qcnPkErJdZQFti2cLXzBAnKUj8fLqMFWKZn8SGv+/ZIWpEJGZ3
        toEtlhBYyyFx6MAudogGF4nWOSegmoUlXh3fAhWXknjZ38YOCZlqiY/7oUo6gP7/bgthG0vc
        XL+BFaSEWUBTYv0ufYiwosTO33MZIdbySbz72sMKMYVXoqNNCKJEVaLv0mEmCFtaoqv9A/sE
        RqVZSB6bheSxWUgemIWwbAEjyypGsdSC4tz01GLDAlPkyN7ECE6wWpY7GKe//aB3iJGJg/EQ
        owQHs5IIr2leQIIQb0piZVVqUX58UWlOavEhRlNgUE9klhJNzgem+LySeENTI2NjYwsTM3Mz
        U2Mlcd4kgwfxQgLpiSWp2ampBalFMH1MHJxSDUybVvYX9wawbUk2fXd71rIt1W9d0v+8arqs
        xMovJSr1cMEbJqNd7UefR8stTjne1v1lvhxzoMrrt//O/vtpf83V4eZEl/uPvulOWt68f8NU
        OVYJkWl6DJ7RJn98j948weAvz528UuOzy5L0ZRctD6+5Zpm8+3FmCkuXxD+B2PKe5/yd/rtO
        b/ugt/9rS7G1eXrmBhWV5glRra2cn3ZGZ8pxbDgmLcVefmt9Zsbat0WRR74uC5jRaxz6q8Re
        5ZbyRQu3frXv1Yyh/RdZ53KW363xd+j8Exg6q8cyO1HmHu9Ttm5/CwexLaWJW9ycI60XvtjU
        E1V2ajPH4R2WrfGndqzK3f53lf+bJO4oM4kn65RYijMSDbWYi4oTAQIROtc5BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSnC63TEiCwe4GFYvHfy4yWjw50M5o
        8W13L4vFwrYlLBYPZ19ltLj/dx6LxZnlLBa3Js5nc+Dw2DnrLrvHplWdbB6NTYuYPBb3TWb1
        aN3xl92jb8sqRo/Pm+QC2KO4bFJSczLLUov07RK4MnY8OsFe8Eqo4t39L+wNjO38XYycHBIC
        JhKbN59k7GLk4hAS2M0o8f7YQRaIhLTEsRNnmLsYOYBsYYnDh4shap4zSvzdeYEdpIZNQFfi
        35/9bCC2iICFxJxtr5hBipgFmpkktl57ygzRsYhJ4v6Kt8wgVZwC7hIfp85mBbGFBbwlVk65
        wQRiswioSuy63MwIYvMKWEpsvHaXGcIWlDg58wnYRcwC2hJPbz6Fs5ctfM0McamCxM+ny1gh
        rvCT2PD3PTtEjYjE7M425gmMwrOQjJqFZNQsJKNmIWlZwMiyilEytaA4Nz232LDAMC+1XK84
        Mbe4NC9dLzk/dxMjONq0NHcwbl/1Qe8QIxMH4yFGCQ5mJRFe07yABCHelMTKqtSi/Pii0pzU
        4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYom+oGGde4bvtuVWrnylik0LoJ1XF
        aA71o9s+XHr7raZAoj5p6dGZp+/aKeWkMygm5GldiJq8p241Z/4iUftJ95ZETpe7+zG7WIUz
        LYGnsIutXrPt0KbSjYUvmqO/x5yNFci42m62tHUr39zLNW5nTVR1smYveTb7aOjbZT6L1ffU
        Jq77Kh/zPNjh+LXXCqeraicdWe2pdPzc17st0st+CJmVSR6UNfidsyb5+OPdvo+KyoLFz7Ye
        DGuvWTO99MJGhvJPbs/1rYQ3rVZL1Nfc4viaST55I2fs+aInD7/qPXh2bf+6l2utT1WqTH3n
        VR6/eGeA8uHJJX8z5PaJr7nrcNlWa9rSJ4mSez+U6v5+rMRSnJFoqMVcVJwIAOYCI30lAwAA
X-CMS-MailID: 20210319033539epcas1p31aeda4c2274e038fff77f67d165a5acd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210318032616epcas1p2c5cc60dfae033e48bb26cabf81c3c032
References: <20210318032604.9727-1-siyanteng@loongson.cn>
        <CGME20210318032616epcas1p2c5cc60dfae033e48bb26cabf81c3c032@epcas1p2.samsung.com>
        <20210318032604.9727-3-siyanteng@loongson.cn>
        <01b301d71ba9$5f234950$1d69dbf0$@samsung.com>
        <391b9b12.11cc.178483decb1.Coremail.siyanteng@loongson.cn>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Sorry, I copied an index as a base from somewhere else and modified it, o=
bviously I didn't do a very
> nice job and this will cause problems for future developers. Just keep th=
e defaults, can I delete them
> in v2?
Is it really right to delete them? First we have to know what they mean.
When I see Documentation/filesystems/nfs/index.st, :maxdepth is set to 1.
Can you take a look more ?

> Thanks=21
>=20
> Yanteng
>=20
> =22Namjae Jeon=22 <namjae.jeon=40samsung.com>=E5=86=99=E9=81=93=EF=BC=9A=
=0D=0A>=20&gt;=20&gt;=20=20=20=20=20Filesystems=20has=20a=20new=20cifs=20fo=
lder.=20Add=20it=20to=20the=20index=20file.=0D=0A>=20&gt;=20&gt;=20=20=20=
=20=20Should=20address=20this=20warning:=0D=0A>=20&gt;=20&gt;=0D=0A>=20&gt;=
=20&gt;=20=20linux-next/Documentation/filesystems/cifs/cifsd.rst:=20WARNING=
:=0D=0A>=20&gt;=20&gt;=20=20document=20isn't=20included=20in=20any=20toctre=
e=20&gt;=20&gt;=20---=20&gt;=20&gt;=0D=0A>=20Documentation/filesystems/cifs=
/index.rst=20=7C=2012=20++++++++++++=0D=0A>=20&gt;=20&gt;=20=20Documentatio=
n/filesystems/index.rst=20=20=20=20=20=20=7C=20=202=20+-=0D=0A>=20&gt;=20&g=
t;=20=202=20files=20changed,=2013=20insertions(+),=201=20deletion(-)=20=20c=
reate=20mode=20100644=20&gt;=20&gt;=0D=0A>=20Documentation/filesystems/cifs=
/index.rst=0D=0A>=20&gt;=20&gt;=0D=0A>=20&gt;=20&gt;=20diff=20--git=20a/Doc=
umentation/filesystems/cifs/index.rst=0D=0A>=20b/Documentation/filesystems/=
cifs/index.rst=0D=0A>=20&gt;=20&gt;=20new=20file=20mode=20100644=0D=0A>=20&=
gt;=20&gt;=20index=20000000000000..b4a487e9adff=20&gt;=20&gt;=20---=20/dev/=
null=20&gt;=20&gt;=20+++=0D=0A>=20b/Documentation/filesystems/cifs/index.rs=
t=0D=0A>=20&gt;=20&gt;=20=40=40=20-0,0=20+1,12=20=40=40=0D=0A>=20&gt;=20&gt=
;=20+..=20SPDX-License-Identifier:=20GPL-2.0=20&gt;=20&gt;=20+=20&gt;=20&gt=
;=20+=3D=3D=3D=3D=20&gt;=20&gt;=20+CIFS=20&gt;=20&gt;=0D=0A>=20+=3D=3D=3D=
=3D=20&gt;=20&gt;=20+=20&gt;=20&gt;=20+..=20toctree::=0D=0A>=20&gt;=20&gt;=
=20+=20=20=20:maxdepth:=202=0D=0A>=20&gt;=20&gt;=20+=20=20=20:numbered:=0D=
=0A>=20&gt;=20Could=20you=20please=20explain=20what=20:maxdepth=20and=20:nu=
mbered=20are=20?=0D=0A>=20&gt;=0D=0A>=20&gt;=20Thanks=21=0D=0A>=20&gt;=20&g=
t;=20+=0D=0A>=20&gt;=20&gt;=20+=20=20=20cifsd=0D=0A>=20&gt;=20&gt;=20+=20=
=20=20cifsroot=0D=0A>=20&gt;=20&gt;=20diff=20--git=20a/Documentation/filesy=
stems/index.rst=20b/Documentation/filesystems/index.rst=0D=0A>=20&gt;=20&gt=
;=20index=20d4853cb919d2..bdba80ae2bb1=20100644=20&gt;=20&gt;=20---=20a/Doc=
umentation/filesystems/index.rst=0D=0A>=20&gt;=20&gt;=20+++=20b/Documentati=
on/filesystems/index.rst=0D=0A>=20&gt;=20&gt;=20=40=40=20-72,7=20+72,7=20=
=40=40=20Documentation=20for=20filesystem=20implementations.=0D=0A>=20&gt;=
=20&gt;=20=20=20=20=20befs=0D=0A>=20&gt;=20&gt;=20=20=20=20=20bfs=0D=0A>=20=
&gt;=20&gt;=20=20=20=20=20btrfs=0D=0A>=20&gt;=20&gt;=20-=20=20=20cifs/cifsr=
oot=0D=0A>=20&gt;=20&gt;=20+=20=20=20cifs/index=0D=0A>=20&gt;=20&gt;=20=20=
=20=20=20ceph=0D=0A>=20&gt;=20&gt;=20=20=20=20=20coda=0D=0A>=20&gt;=20&gt;=
=20=20=20=20=20configfs=0D=0A>=20&gt;=20&gt;=20--=0D=0A>=20&gt;=20&gt;=202.=
25.1=0D=0A>=20&gt;=0D=0A>=20=0D=0A>=20=0D=0A>=20</namjae.jeon=40samsung.com=
>=0D=0A=0D=0A
