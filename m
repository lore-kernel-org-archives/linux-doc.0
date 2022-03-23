Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A17C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 23 Mar 2022 12:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236350AbiCWMpo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Mar 2022 08:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236374AbiCWMpk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Mar 2022 08:45:40 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BFB75200
        for <linux-doc@vger.kernel.org>; Wed, 23 Mar 2022 05:44:09 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id e22so1470913ioe.11
        for <linux-doc@vger.kernel.org>; Wed, 23 Mar 2022 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l8ym8SgV3CD5/B8NUZIPaAPfyfzOyaAjOjmfGL+Cy8Y=;
        b=OwYrW0Yw1sBQ6YmBkcmX95PH9NM6pl+KWGX4rfIlc9rF851BslAzg4vLmHIlgNvgBr
         oN2zP0TAaqa56zWpgjncpMz9cwTWtRWd1u+S2XCDu3ymc+KGZ400/zDYI/CmVHGSutS3
         PNvyZI/Cw5VwJDCNgJWsn0mX7OE7ehLKMfSUatADfkc9vh+5JHu7WN2uEjJ0Lq/DqPz4
         Oi4nyiNJevoSxdaM9dR0i7xzuMcRUObld1tZ1RKITIcTvzibGVdPjOZ0O8TiuiU+/t3o
         hcraYqU7IQjtLI1lHhur0ZBsBku23TR+TKBdZEqGc3nWLFZPnYn0oMnXPbb3HgsEIBWt
         tTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l8ym8SgV3CD5/B8NUZIPaAPfyfzOyaAjOjmfGL+Cy8Y=;
        b=eBR4cjpxhl4MLX6IP7O3hzY0idycNiqAX27V6TQP4UPgSsKVxksCRm4Llq7xT1uVaG
         nnbe6+PkuEwNlaWvA1+k5FxGq1vTyiVy6/sUKNLbqJyiZeguhbSzflvp0jG14bdUDjY1
         NbtrthbQ2KBxYt2qHG2lKgFd/HCXt0dbJ9ed1dTIrT5JZiBN/EbsGK+TZrsvNrsMv15z
         rzh1R/MQBVpC3RClyOqlRo1TuG572XLjwMUq+1Tw/Y71JuQs/1WXeYGNnqNsb0jh4w2v
         VIB5xlZRyijdqKJnLwUIWulqG9kJngnDYHagFNdoB7Lb3o0gDYZgrOK8n9alEMAcgWnH
         4aOA==
X-Gm-Message-State: AOAM530UfasLVyirEx44i5VkiljRZnUVLOelGo5/tjOrGdX9aZ1PECMP
        0pj5QM8mNA0t3k1zAF91Hb9T3+h97yyWNWJ6pO8=
X-Google-Smtp-Source: ABdhPJyy2a83cADGK0U0hUXNoVSyzY8qYNf67epHFV6uNF+/6V2Ic0Pi6eADjKWftn80OMK3HfCbDvb9VxpUK8/7vMA=
X-Received: by 2002:a05:6638:1685:b0:321:4904:c9b5 with SMTP id
 f5-20020a056638168500b003214904c9b5mr6822862jat.40.1648039447215; Wed, 23 Mar
 2022 05:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <cffe009c8b94682200c46fb4d80313f603a65cb6.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <cffe009c8b94682200c46fb4d80313f603a65cb6.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 23 Mar 2022 20:43:31 +0800
Message-ID: <CAJy-AmnCfb+TvFmYfXmTCYSWYQS_w7Q01pg7RQX2Ry3Q7Q7fwA@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] docs/zh_CN: add vm mmu_notifier translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 17, 2022 at 2:51 PM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> From: Yanteng Si <siyanteng01@gmail.com>
>
> Translate .../vm/mmu_notifier.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
>  Documentation/translations/zh_CN/vm/index.rst |  3 +-
>  .../translations/zh_CN/vm/mmu_notifier.rst    | 97 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/mmu_notifier.rst
>
> diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentatio=
n/translations/zh_CN/vm/index.rst
> index c1f517da81f4..1fb80aa7a08b 100644
> --- a/Documentation/translations/zh_CN/vm/index.rst
> +++ b/Documentation/translations/zh_CN/vm/index.rst
> @@ -30,14 +30,13 @@ TODO:=E5=BE=85=E5=BC=95=E7=94=A8=E6=96=87=E6=A1=A3=E9=
=9B=86=E8=A2=AB=E7=BF=BB=E8=AF=91=E5=AE=8C=E6=AF=95=E5=90=8E=E8=AF=B7=E5=8F=
=8A=E6=97=B6=E4=BF=AE=E6=94=B9=E6=AD=A4=E5=A4=84=EF=BC=89
>     frontswap
>     hwpoison
>     memory-model
> +   mmu_notifier
>
>  TODOLIST:
>  * arch_pgtable_helpers
>  * free_page_reporting
>  * hmm
>  * hugetlbfs_reserv
> -
> -* mmu_notifier
>  * numa
>  * overcommit-accounting
>  * page_migration
> diff --git a/Documentation/translations/zh_CN/vm/mmu_notifier.rst b/Docum=
entation/translations/zh_CN/vm/mmu_notifier.rst
> new file mode 100644
> index 000000000000..9a85d6acb249
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/mmu_notifier.rst
> @@ -0,0 +1,97 @@
> +:Original: Documentation/vm/mmu_notifier.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +
> +=E4=BB=80=E4=B9=88=E6=97=B6=E5=80=99=E9=9C=80=E8=A6=81=E9=80=9A=E7=9F=A5=
=E5=86=85=E9=A1=B5=E8=A1=A8=E9=94=81=EF=BC=9F

Is it better to translate as "=E4=BB=80=E4=B9=88=E6=97=B6=E5=80=99=E9=9C=80=
=E8=A6=81=E9=A1=B5=E8=A1=A8=E9=94=81=E5=86=85=E9=80=9A=E7=9F=A5"?

Thanks
Alex
