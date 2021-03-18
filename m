Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3AEC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 03:44:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90D4F64F04
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 03:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhCRDo2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 23:44:28 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:48733 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCRDn5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Mar 2021 23:43:57 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210318034355epoutp04b7a1b197161b3c4ba7db74cec81b09e9~tUvDGKE4h0312603126epoutp04e
        for <linux-doc@vger.kernel.org>; Thu, 18 Mar 2021 03:43:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210318034355epoutp04b7a1b197161b3c4ba7db74cec81b09e9~tUvDGKE4h0312603126epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1616039035;
        bh=R5PAIR89jNJrslFlC1Qoqb8yIcANZlwWDmKnWLmlffs=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=K5YhxfMUTrDPFHaRM9Lif8PomXeRFgRh4v89h9eqoEkOQ6dCI44F4enuIq5pgP+U3
         KWywsxzD0v14w+89b/vEGe6R+3H7UQsupY8DU2rO4Kz5ODgaWvUlztOUEyB5KEViUV
         jlWT8gqJA2jtJ7m1k45SBoRKILIPKI0uJ/b9tvDo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210318034354epcas1p1a349cff22cf079fd683898b36c6886be~tUvCOmwaD2378623786epcas1p1l;
        Thu, 18 Mar 2021 03:43:54 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.164]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4F1CYj3dxQz4x9QB; Thu, 18 Mar
        2021 03:43:53 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        FB.BC.59147.97CC2506; Thu, 18 Mar 2021 12:43:53 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210318034352epcas1p25e4b5a2b6325b26a1ee8415e50d4d16e~tUvAd7eOU0987409874epcas1p2Q;
        Thu, 18 Mar 2021 03:43:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210318034352epsmtrp1873d6350483368eec76244798a6270db~tUvAdEYkx0141801418epsmtrp1X;
        Thu, 18 Mar 2021 03:43:52 +0000 (GMT)
X-AuditID: b6c32a38-e53ff7000000e70b-72-6052cc793ef2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3E.C1.13470.87CC2506; Thu, 18 Mar 2021 12:43:52 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210318034352epsmtip1381aa942165d5e46f48c60526d5d3bc9~tUvAQNA0g2448224482epsmtip14;
        Thu, 18 Mar 2021 03:43:52 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     "'Yanteng Si'" <siyanteng@loongson.cn>
Cc:     "'Mauro Carvalho Chehab'" <mchehab+huawei@kernel.org>,
        "'Steve French'" <stfrench@microsoft.com>,
        "'Gibeom Kim'" <gibeomii.kim@samsung.com>,
        <linux-doc@vger.kernel.org>,
        "'Huacai chen'" <chenhuacai@gmail.com>, <siyanteng@gmail.com>,
        "'Jonathan Corbet'" <corbet@lwn.net>
In-Reply-To: <20210318032604.9727-2-siyanteng@loongson.cn>
Subject: RE: [PATCH 1/2] docs: filesystems: cifsd: fix document title markup
Date:   Thu, 18 Mar 2021 12:43:52 +0900
Message-ID: <01b201d71ba8$ea20c1f0$be6245d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKBpTFN3nHQWl8/otGaCxi9GvZJQwIQxc+/AeT8PMypFFfUEA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmrm7lmaAEgx8bpS0e/7nIaPHkQDuj
        xbfdvSwWC9uWsFg8nH2V0eL+33ksFmeWs1jcmjifzYHDY+esu+wem1Z1snk0Ni1i8ljcN5nV
        o3XHX3aPvi2rGD0+b5ILYI/KsclITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshL
        zE21VXLxCdB1y8wBOkpJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BoUKBXnJhb
        XJqXrpecn2tlaGBgZApUmZCTMfvCfqaCaZwVs8/uYWxgvMnexcjJISFgIrGvcT1LFyMXh5DA
        DkaJvXvamCGcT4wSk8+vYASpEhL4xihxZmEOTMeuyQvYIOJ7GSX+Lg2GaHjJKPGu4wcLSIJN
        QFfi35/9YEUiAloSmzfsYAUpYhaYziTx4dMrsCJOASuJJ/u+gW0QFvCR6FzwEOwmFgFViXlb
        P4HZvAKWErOOX2KDsAUlTs58AtbLLCAvsf3tHGaIixQkfj5dxgqxzEni3J8jrBA1IhKzOyHe
        kRBYySGx4dBDRogGF4l7j2FsYYlXx7dAA0NK4mV/G5DNAWRXS3zcDzW/g1HixXdbCNtY4ub6
        DawgJcwCmhLrd+lDhBUldv6eywixlk/i3dceVogpvBIdbUIQJaoSfZcOM0HY0hJd7R/YJzAq
        zULy2Cwkj81C8sAshGULGFlWMYqlFhTnpqcWGxaYIMf1JkZwetWy2ME49+0HvUOMTByMhxgl
        OJiVRHhN8wIShHhTEiurUovy44tKc1KLDzGaAoN6IrOUaHI+MMHnlcQbmhoZGxtbmJiZm5ka
        K4nzJhk8iBcSSE8sSc1OTS1ILYLpY+LglGpginr51nHPuxPHG64WpAjZHHoQv/1lg6eruKTl
        jVu9ORFR+RtYFq9Y8dcz9Otc8frIxn0cdZkLnz5L//TyK9/VfyYrlvxaXxKj9F31lLb3Lu8k
        Vpfph5bv6Jr9YEV5TEeNskn8LHOj9FuKv+KCrwWv6bhtsWjlNeekh1VvW5RbH9d+yDZeeWXb
        5Rlv2i87Vn/4P62V8WXVYTfZNLewxk/r5viucp6w5IdoS0WolNzcnIWBmRNstFKq+ZWFGyMY
        OZm3/tjRemHawgoXkbnGJ1MW3Xt8VnvbpsdSWV411qstty3ap/4+836Cl9zl3Qe5r/HKlCiV
        zUteeaVbnqnuqfzamT3/TpoG/Fdfq3BasWJLiBJLcUaioRZzUXEiAMSREv04BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSnG7FmaAEgxcPJS0e/7nIaPHkQDuj
        xbfdvSwWC9uWsFg8nH2V0eL+33ksFmeWs1jcmjifzYHDY+esu+wem1Z1snk0Ni1i8ljcN5nV
        o3XHX3aPvi2rGD0+b5ILYI/isklJzcksSy3St0vgyph9YT9TwTTOitln9zA2MN5k72Lk5JAQ
        MJHYNXkBWxcjF4eQwG5GiX2HZjNDJKQljp04A2RzANnCEocPF0PUPGeUWDphE1gzm4CuxL8/
        +9lAbBEBLYnNG3awghQxC8xlklhz7D0TRMdORokz7TMZQao4Bawknuz7BmYLC/hIdC54CDaJ
        RUBVYt7WT2A2r4ClxKzjl9ggbEGJkzOfsIBcwSygJ9G2EayVWUBeYvvbOVCHKkj8fLqMFeII
        J4lzf46wQtSISMzubGOewCg8C8mkWQiTZiGZNAtJxwJGllWMkqkFxbnpucWGBYZ5qeV6xYm5
        xaV56XrJ+bmbGMGRpqW5g3H7qg96hxiZOBgPMUpwMCuJ8JrmBSQI8aYkVlalFuXHF5XmpBYf
        YpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwFTQ2D3xjehd21M7+MxNLt6LZu8sZn1t
        wKSzJV6cg3+1yfXP6e/3XPVxm/rgofKEtP+vono02//+E9n5vOhS9/wzAX/CtkSt/L3nyNsN
        8uyZ/0waFb583tR0942cp8clhhThXq1tW5WPFO/U1ZaPZ9KzXPGEYYHGgq8FzyV2WK06L/OF
        65axUKr3sxPzpmR6MAr/vW0Qap9vrXtJIjB4Q2nXv2lTnzB3ZpksXGZ1h6fL5IWnyrtjx+tY
        5mz5MOe/9/JqNe8ymazQkn126rHddlfZ/He4V1rE2sUJvxHgP9rXZRGdZTNL5faC17d99kjY
        iGw2lSxdMzNPzmG+nvmMOI7gJb+2RTHvyjWaVvO5WYmlOCPRUIu5qDgRAMSODugjAwAA
X-CMS-MailID: 20210318034352epcas1p25e4b5a2b6325b26a1ee8415e50d4d16e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210318032616epcas1p13d33dab0d6efa84cfc92184f391c8296
References: <20210318032604.9727-1-siyanteng@loongson.cn>
        <CGME20210318032616epcas1p13d33dab0d6efa84cfc92184f391c8296@epcas1p1.samsung.com>
        <20210318032604.9727-2-siyanteng@loongson.cn>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Yanteng,

Thanks for your patch.
I have already applied the patch to fix this warning to steve's tree.

https://github.com/smfrench/smb3-kernel/commit/801019d874df84f5fa8d21148c2a82edc80785da

Thanks!
> As warned by sphinx:
> 
> linux-next/Documentation/filesystems/cifs/cifsd.rst:3: WARNING:
> Title overline too short.
> 
> =========================
> CIFSD - SMB3 Kernel Server
> =========================
> 
> so,just increase it!
> ---
>  Documentation/filesystems/cifs/cifsd.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/cifs/cifsd.rst b/Documentation/filesystems/cifs/cifsd.rst
> index e0c33d03f290..af3589da6923 100644
> --- a/Documentation/filesystems/cifs/cifsd.rst
> +++ b/Documentation/filesystems/cifs/cifsd.rst
> @@ -1,8 +1,8 @@
>  .. SPDX-License-Identifier: GPL-2.0
> 
> -=========================
> +==========================
>  CIFSD - SMB3 Kernel Server
> -=========================
> +==========================
> 
>  CIFSD is a linux kernel server which implements SMB3 protocol in kernel space  for sharing files over
> network.
> --
> 2.25.1


