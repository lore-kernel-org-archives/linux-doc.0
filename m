Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EFDC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 03:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD71664F18
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 03:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhCRDrn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 23:47:43 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:23106 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhCRDrM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Mar 2021 23:47:12 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210318034711epoutp02dd8a02b24b2c003a66ef349fb1b84ec5~tUx5T6zr-1410314103epoutp02A
        for <linux-doc@vger.kernel.org>; Thu, 18 Mar 2021 03:47:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210318034711epoutp02dd8a02b24b2c003a66ef349fb1b84ec5~tUx5T6zr-1410314103epoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1616039231;
        bh=PHmFgzr+6R8SyvjEE3eRyFnvzb3xwnz7wsdsLz8WB88=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=t7vlmebweBU6guZq7SQg7X9QmtExRffLX+nyFIqFmVyDj7nm39HqZBixVyXocoxNc
         djXPiM1UNSyx5ER4P9tFDZb/qqhxvcmKphrJVD12GablFJxwyBciIGv76FMtMOfpey
         RyCBUTNFsO0WuGlnqeIzxa35oxQMGV0nY/1iGvLk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210318034710epcas1p2f5945589d33a236a43192798e6d27585~tUx4o7-zj1974019740epcas1p2Y;
        Thu, 18 Mar 2021 03:47:10 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.162]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4F1CdT2CfZz4x9Pw; Thu, 18 Mar
        2021 03:47:09 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7F.0D.63458.D3DC2506; Thu, 18 Mar 2021 12:47:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20210318034708epcas1p434f44292962e53f5465c49772e70d99b~tUx3RY28D2149021490epcas1p4Q;
        Thu, 18 Mar 2021 03:47:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210318034708epsmtrp2ea8185f1526b78d38470d002616df16c~tUx3Qp2312865828658epsmtrp2H;
        Thu, 18 Mar 2021 03:47:08 +0000 (GMT)
X-AuditID: b6c32a36-6c9ff7000000f7e2-f5-6052cd3dbb46
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        56.32.13470.C3DC2506; Thu, 18 Mar 2021 12:47:08 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210318034708epsmtip2ac43e70a54c38efe907ab2459a51f8af~tUx3E8Mg13184331843epsmtip2o;
        Thu, 18 Mar 2021 03:47:08 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     "'Yanteng Si'" <siyanteng@loongson.cn>
Cc:     "'Mauro Carvalho Chehab'" <mchehab+huawei@kernel.org>,
        "'Steve French'" <stfrench@microsoft.com>,
        "'Gibeom Kim'" <gibeomii.kim@samsung.com>,
        <linux-doc@vger.kernel.org>,
        "'Huacai chen'" <chenhuacai@gmail.com>, <siyanteng@gmail.com>,
        "'Jonathan Corbet'" <corbet@lwn.net>
In-Reply-To: <20210318032604.9727-3-siyanteng@loongson.cn>
Subject: RE: [PATCH 2/2]  docs: filesystems: add cifs to the index file
Date:   Thu, 18 Mar 2021 12:47:08 +0900
Message-ID: <01b301d71ba9$5f234950$1d69dbf0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKBpTFN3nHQWl8/otGaCxi9GvZJQwMJJyE0AbSAHVOpDhpEUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmrq7t2aAEg3v7+Swe/7nIaPHkQDuj
        xbfdvSwWC9uWsFg8nH2V0eL+33ksFmeWs1jcmjifzYHDY+esu+wem1Z1snk0Ni1i8ljcN5nV
        o3XHX3aPvi2rGD0+b5ILYI/KsclITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshL
        zE21VXLxCdB1y8wBOkpJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BoUKBXnJhb
        XJqXrpecn2tlaGBgZApUmZCTcar5GlvBba6K75+nsjcwHuXoYuTkkBAwkZj1aBZzFyMXh5DA
        DkaJ3d8OMkE4nxgl1t2bBJX5xigxcfIpJpiWphWHWSESexklJpxeygjhvGSUuDJjOiNIFZuA
        rsS/P/vZQGwRAS2JzRt2gHUwC0xnkvjw6RULSIJTwErie8taoLEcHMIC7hKLZ+SDhFkEVCWW
        rbnMCmLzClhK3OxczwhhC0qcnPkErJVZQF5i+9s5zBAXKUj8fLqMFWKXk8Txa31sEDUiErM7
        28BekBBYyyEx//deVogGF4nDv/dDvSMs8er4FnYIW0ri87u9bCD3SAhUS3zcDzW/g1HixXdb
        CNtY4ub6DawgJcwCmhLrd+lDhBUldv6eywixlk/i3dceVogpvBIdbUIQJaoSfZcOQy2Vluhq
        /8A+gVFpFpLHZiF5bBaSB2YhLFvAyLKKUSy1oDg3PbXYsMAIObI3MYITrJbZDsZJbz/oHWJk
        4mA8xCjBwawkwmuaF5AgxJuSWFmVWpQfX1Sak1p8iNEUGNQTmaVEk/OBKT6vJN7Q1MjY2NjC
        xMzczNRYSZw30eBBvJBAemJJanZqakFqEUwfEwenVAPTiikpsbsUtkd/CDjjPEOP0SbQRPnS
        /J+ym7saIkM3fqlTneogcjjgyJdaxatau1cu+h/aURl7X/+1l1Te1nKGiyd/7/DKsnngsMno
        CrM629Qv2y0q7gpbFYSG7fRW+vT/1c21gqqnPQ525l8+tGTve85L1m8yyhUznNdu2LyiaMkF
        T/fAO6a323tYSi+sF9Z/9zlxq6bsxYbItBiOBaH3J17lnaM+9SZDu2v1b8eWezt2fNoW5Htw
        pp5G7Cvb2BW/UiXeBn9Uqn6wdeEvfqvZut7Bdx54bz7ZedOFR7bQ6tIk2VWxBhnT2ZRs3VZO
        PNLLrbXCo3T2somv+qVW5+enxuSf1t9e9X7t25NfPGZ8VmIpzkg01GIuKk4EACNp9b05BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXtfmbFCCwfZNOhaP/1xktHhyoJ3R
        4tvuXhaLhW1LWCwezr7KaHH/7zwWizPLWSxuTZzP5sDhsXPWXXaPTas62TwamxYxeSzum8zq
        0brjL7tH35ZVjB6fN8kFsEdx2aSk5mSWpRbp2yVwZZxqvsZWcJur4vvnqewNjEc5uhg5OSQE
        TCSaVhxmBbGFBHYzSnRMFoeIS0scO3GGuYuRA8gWljh8uLiLkQuo5DmjxJPXvxhBatgEdCX+
        /dnPBmKLCGhJbN6wgxWkiFlgLpPEmmPvmSA6djJKnFxwDKyDU8BK4nvLWiaQqcIC7hKLZ+SD
        hFkEVCWWrbkMdgSvgKXEzc71jBC2oMTJmU9YQMqZBfQk2jaChZkF5CW2v53DDHGngsTPp8tY
        IW5wkjh+rY8NokZEYnZnG/MERuFZSCbNQpg0C8mkWUg6FjCyrGKUTC0ozk3PLTYsMMxLLdcr
        TswtLs1L10vOz93ECI4yLc0djNtXfdA7xMjEwXiIUYKDWUmE1zQvIEGINyWxsiq1KD++qDQn
        tfgQozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGponCJ8vX/08y5Z737OjBc31vjzWJ
        PFTralS6Vz7ZS995l7fy80a7cwsW5RfLeZhIhVXeTVXeainvPEXv560fO/0bVj1qP3D/T+H9
        wH6zud8lnN4xb9kvGjDxkq7WLD0Rud09vzhZhDWs9FfHan3eyuBY7eEwh/+jK6uN3BMd62VZ
        ak5zLvSXWrKLzLXRuLL903Ibg2cvvE8cuCLoISV5eXbni0PvN7SvLRANW3B1+lnj61fj4ytj
        uC5u3DxtWqFKCZ+8wfqMt7o9TUH21zZ9ecaxxta6XN9Lt1hS75O4/3yFDRxHuXZVMaXPZsnL
        PVAcM2WXwtyrV2UFfbdvirz879c9PmmepROjg81bFp+PUWIpzkg01GIuKk4EAASKDxMhAwAA
X-CMS-MailID: 20210318034708epcas1p434f44292962e53f5465c49772e70d99b
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
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>     Filesystems has a new cifs folder. Add it to the index file.
>     Should address this warning:
> 
> 	linux-next/Documentation/filesystems/cifs/cifsd.rst: WARNING:
> 	document isn't included in any toctree
> ---
>  Documentation/filesystems/cifs/index.rst | 12 ++++++++++++
>  Documentation/filesystems/index.rst      |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)  create mode 100644
> Documentation/filesystems/cifs/index.rst
> 
> diff --git a/Documentation/filesystems/cifs/index.rst b/Documentation/filesystems/cifs/index.rst
> new file mode 100644
> index 000000000000..b4a487e9adff
> --- /dev/null
> +++ b/Documentation/filesystems/cifs/index.rst
> @@ -0,0 +1,12 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====
> +CIFS
> +====
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :numbered:
Could you please explain what :maxdepth and :numbered are ?

Thanks!
> +
> +   cifsd
> +   cifsroot
> diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
> index d4853cb919d2..bdba80ae2bb1 100644
> --- a/Documentation/filesystems/index.rst
> +++ b/Documentation/filesystems/index.rst
> @@ -72,7 +72,7 @@ Documentation for filesystem implementations.
>     befs
>     bfs
>     btrfs
> -   cifs/cifsroot
> +   cifs/index
>     ceph
>     coda
>     configfs
> --
> 2.25.1


