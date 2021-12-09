Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE521C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 17:33:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243035AbhLIRgg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243033AbhLIRgg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 12:36:36 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9470C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 09:33:02 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id o1so12149810uap.4
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 09:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qP3g9nlNYDMENZEHzL2wqEYDRc45i/aGbMBrExAATOo=;
        b=m3pmqGsc8v9HBk9e9nLU0tB7U2YleEsbO84fu40vMqqFzE/8g5T4adWzkBIh++tT+q
         XIUCntXkaeDOaBZlJxT7J+sRs6ClUebuGWm4D/PDVXrOkZOWZRY8n7ljzuQs6zW/kX1x
         ATKMDBws7M7AJ2jZ4X34vtXcQHS2thaEwjkTgMPT5hOs4O3za46thhy8THLpqYh4LdQ+
         UO/XOeW5tEWx/aLsL9kh5UOT0T8VoICQ7cvbQXQKVNl+pZiOOIOtLJRukG/bsMOGwRHs
         WblSTjYqgZr1FsDEfNk5An418ViuDE0RFPXzVZK0MaTCUxDXS2QqpFg6ce9fKaBReHU9
         TcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qP3g9nlNYDMENZEHzL2wqEYDRc45i/aGbMBrExAATOo=;
        b=OJagyOOTLXtN48e7V0GSWo6xzc/Gkx+w+QirEbTEEFXCMKzu4HLvYQe9R3nW+ldl7K
         SJiuOjY6gzKCSW+2kiHvgSjr91EtIaspL/J2deas280n7UbS4xACp5NNsihV6ICayRdJ
         p1riWS3J5uKzpTZWxJBumDzzGAEsoIM7KQUDytiLMhXJxJwlstOcXp96ocZeD1jB1XY0
         ZSkXmaNmr4CK540K6vE7YpgGjgEHCGrqi016Lt9T4rm4ixnRY1Vpqt4n8fz7bSEj/KuN
         qxgH9R9QCfRnGFlolOzEZfO0/yInKxqb5sc0i2vadp9ZjzUqopHD/pOw0/2/76yx2d8V
         QRqA==
X-Gm-Message-State: AOAM531YOkNKK1C724HGcxjYURvym5IwZbeOQE/j3/HjVbABnKUMmXzy
        CBd+dszCnie80MwyBMifeL7BvbJhLV9PiUFsJ6cld0AZuwwXlA==
X-Google-Smtp-Source: ABdhPJxM2yDBC9m9jvGibJ4CBcR2KmoAtU6TJoQr7TtBkwISP1CrPKABbJDsWddIBHUJvYqGfSb1eQ2q5wcbiPcmXtE=
X-Received: by 2002:a67:b208:: with SMTP id b8mr8729651vsf.77.1639071179443;
 Thu, 09 Dec 2021 09:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20211209090744.544938-1-siyanteng@loongson.cn>
In-Reply-To: <20211209090744.544938-1-siyanteng@loongson.cn>
From:   Grant Seltzer Richman <grantseltzer@gmail.com>
Date:   Thu, 9 Dec 2021 12:32:48 -0500
Message-ID: <CAO658oUc4gFPA-OW2gXO07_yrPEx7Vxpx7PaVBZmQeZGDTMhzA@mail.gmail.com>
Subject: Re: [PATCH] docs/bpf: Add libbpf into index/bpf
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 9, 2021 at 4:09 AM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> Since f42cfb469f9b ("bpf: Add documentation for libbpf including API autogen") which
> introduced a warning:
>
> linux/Documentation/bpf/libbpf/index.rst
>
> Add it into index/bpf.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/bpf/index.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
> index 610450f59e05..bdf66f57f910 100644
> --- a/Documentation/bpf/index.rst
> +++ b/Documentation/bpf/index.rst
> @@ -17,6 +17,11 @@ libbpf
>
>  Documentation/bpf/libbpf/index.rst is a userspace library for loading and interacting with bpf programs.
>
> +.. toctree::
> +   :maxdepth: 1
> +
> +   libbpf/index
> +

I may be wrong (I'm confused easily by mailing lists) but I believe
your tree is out of date, this was already added in patch
5931d9a3d0529dc803c792a10e52f0de1d0b9991

>  BPF Type Format (BTF)
>  =====================
>
> --
> 2.27.0
>
