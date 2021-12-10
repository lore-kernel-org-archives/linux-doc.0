Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA464C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 02:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbhLJCHR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 21:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235732AbhLJCHR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 21:07:17 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E1FC061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 18:03:42 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id 7so11296629oip.12
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 18:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nGay/nGEc6/wfZhaxHd+rWcsZzzwh9s2mXQ4t16PVRY=;
        b=ojqNKm2hvyFDPj15KOn5GsR10kttoXnVhJsybcudW2k1/t7JVHhnkuPFRhBhMPpAHa
         1r3PlLToX7ZcRyHRb3VhNcB6sJBGchE3DS3A10NVUNxSwKFGEUoWz/NwAKYotJPeKZiD
         kJ59pWrfzFxm8NXOPNrnHbTk2GIXOf7B1p8sZZU0F8x01yW7Ek8JU6etkTwyC3fmQBu2
         9Grk2c4/ZUOjJyMOXOUeB+n2QNO7qi5530djPD+NCUGacwa0cymM4+GXdWIA4yio0+Uv
         HXON9Cwh3kthNfvSoLIhIPFOIK1GcNKP6D+fsz9dYok1Cw3X+rqq3p95cRr72SC4LjxR
         4nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nGay/nGEc6/wfZhaxHd+rWcsZzzwh9s2mXQ4t16PVRY=;
        b=u6qNWQLk2vfzdh7VySgnTAHvGMCjhlw4m4FRsLvzOPOoe77aDde3qAMOKE27ea2mJG
         4iW/YiV04V2iYJr8y91TRfrZmmbJeYfLA4cLH+/oBoFdchRS/ZNVIpAyeErypTikefrv
         x7cy1XfUuVTTIBOtTzztdmSX9nILjh9rcNrXiybXaDHfaae+zpg+QxBqIiOr1ZkaU3iB
         WKoApm3FGN52wyx1fshWkSeMRTwMLMLi1cQtH2tv6W+5vxUMKZ0Wmng2HmzP+Jyb2kRZ
         LfMERtIIh2smxqojllmAIsCAlXeYXbYcP1FwI7wCYpnop5IVb3qYxNPhpXw2MtjKQlI2
         WkJQ==
X-Gm-Message-State: AOAM530CPeJXQnN+Iu4xe5yNitaBmdOl5icAolQg18Ok3P4euKuK3m3O
        t331c5dpjGP1SlDFgE5PPlqDLI8S327QG7RIcjQ=
X-Google-Smtp-Source: ABdhPJynjADAtAwLlgabhMd9lfr/1ienDXjU+GxoS/jxloPTWFz9EbzHGj3LX1hUn3BxkfUaayNJzFRTXWhyIroV+JY=
X-Received: by 2002:a54:4701:: with SMTP id k1mr10000237oik.37.1639101822258;
 Thu, 09 Dec 2021 18:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20211209090031.537846-1-siyanteng@loongson.cn>
In-Reply-To: <20211209090031.537846-1-siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 10 Dec 2021 10:03:31 +0800
Message-ID: <CAEensMz-gPpFFrsStetgcR=c3qYSBzX5_MRG-M2PCYF3Gso5Wg@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add two colons to page_owner_sort
To:     weizhenliang@huawei.com
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=889=E6=97=
=A5=E5=91=A8=E5=9B=9B 17:01=E5=86=99=E9=81=93=EF=BC=9A
>
> Since f7df2b1cf03a ("tools/vm/page_owner_sort.c: count and sort by mem") =
which
> introduce a warning:
>
> linux/Documentation/vm/page_owner.rst:92: WARNING: Unexpected indentation=
.
> linux/Documentation/vm/page_owner.rst:96: WARNING: Unexpected indentation=
.
> linux/Documentation/vm/page_owner.rst:107: WARNING: Unexpected indentatio=
n.
>
> A paragraph consisting of two colons ("::") signifies that the following =
text block(s) comprise a literal block.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/vm/page_owner.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owne=
r.rst
> index 9837fc8147dd..14b5c45f43a3 100644
> --- a/Documentation/vm/page_owner.rst
> +++ b/Documentation/vm/page_owner.rst
> @@ -85,7 +85,7 @@ Usage
>         cat /sys/kernel/debug/page_owner > page_owner_full.txt
>         ./page_owner_sort page_owner_full.txt sorted_page_owner.txt
>
> -   The general output of ``page_owner_full.txt`` is as follows:
> +   The general output of ``page_owner_full.txt`` is as follows::
>
>         Page allocated via order XXX, ...
>         PFN XXX ...
> @@ -100,7 +100,7 @@ Usage
>     and pages of buf, and finally sorts them according to the times.
>
>     See the result about who allocated each page
> -   in the ``sorted_page_owner.txt``. General output:
> +   in the ``sorted_page_owner.txt``. General output::
>
>         XXX times, XXX pages:
>         Page allocated via order XXX, ...
> --
> 2.27.0
>

Sorry, I created a bad subject.

I will send v2:

- docs/zh_CN: add two colons to page_owner_sort
+docs/vm: add two colons to page_owner_sort

Thanks,
Yanteng
