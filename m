Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF62C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 06:37:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A97364ED6
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 06:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhBVGhU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 01:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhBVGhS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Feb 2021 01:37:18 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69712C061574
        for <linux-doc@vger.kernel.org>; Sun, 21 Feb 2021 22:36:38 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id a16so9873955ilq.5
        for <linux-doc@vger.kernel.org>; Sun, 21 Feb 2021 22:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lpcjqf1hbrBnMjWQ8Om6GxuiaDMFl3UnkWg/LxZMzuo=;
        b=Y1XIsbQpC2ldj4HJBHK2sZbP4+1L9+tT5LCe+dGT1MuiuYV0tice9oSqQU5BE54sqn
         5VD8ClCjLw1HedPYW1YMkmeDg18JvbyrSUAA1UgIqhqBRs1MSGTFyfWyMcP93BgxzEGa
         eMMz8KQ5UKwR/mJD7AAtI0VK1Vh8MUBmsWpEm/QvdS+9xgq4Zqu8UyDTBOINIucScQgb
         uAhG0ztUfHevvQH9DanXYW8j8Z5lBu8PcrRPnaauX9vKp96bL1yRPYe7v7o+gnUk+nJ3
         /roc2b0ctE5zUA4C/i6539u6fz+lAWQ3z6w96kjWIRzTW9Gfjgdyn64PcbR2Xjnecu8c
         AwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lpcjqf1hbrBnMjWQ8Om6GxuiaDMFl3UnkWg/LxZMzuo=;
        b=BlROlfpvn2I2xkxMLCjXcbj2F4W54UhDYdF0weZzWYF2nLG8YEkOiIr20KIFyHSvIY
         5Y3Sfuc1KqUphtjda1PySR1xsKKTI/cC93XFCos5DRTlr0sj839r3/n2wk4jlKETeT9Y
         fsXWk/V2CoZlHkHvmIVfMf0pqTsZ6jeS4ogDCxT7H3OKK1HNKh/6hxOzFz5JAMt1kRyL
         3tINNDz55FF3rLmEeDFye1gLy/Bad3UrvHP+qn/efR6g5XNwPAGChg6zJtF/gwcEhhqj
         tIrUCxwrDt/3s9908yBy4Z7uXeRuVSTpt81c2wyWeyp2FjTUNP8M47c6hlSXiAAZ/mxb
         cTDg==
X-Gm-Message-State: AOAM533WfPA9dvaxCDaWe6C7slFEmdEzNWaFNpMzQwfEjIZlY8iV5My0
        EnOvHY/3Gh1a2xevt3lCGPfaXATCRXKES2nRr2s=
X-Google-Smtp-Source: ABdhPJwfiWWiJalAWy/qK4rCm+POkUmeK+j+z9fPeQTcSm1v6yj/f1t5a9hDQR96D+J0mWR1zM3fUdZ33h/C1Mjswkc=
X-Received: by 2002:a92:1e12:: with SMTP id e18mr13804306ile.270.1613975797773;
 Sun, 21 Feb 2021 22:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20210222055930.10454-1-siyanteng@loongson.cn>
In-Reply-To: <20210222055930.10454-1-siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Mon, 22 Feb 2021 14:36:26 +0800
Message-ID: <CAAhV-H5MyUgrYP8XFLVV8SbZYz_f342mF4Mj=jVi2TO6Jt6Oog@mail.gmail.com>
Subject: Re: [PATCH 0/5] docs/zh_CN:cover letter
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Yanteng,

You should describe the series instead of use "cover letter" for the
cover letter.

On Mon, Feb 22, 2021 at 1:59 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> This series of patches translates all documents in the Doc/riscv directory.
>
> Yanteng Si(5):
> docs/zh_CN:add riscv boot-image-header.rst translation
> docs/zh_CN: add riscv features.rst translation
> docs/zh_CN: add riscv patch-acceptance.rst translation
> docs/zh_CN: add riscv pmu.rst translation
> docs/zh_CN: add riscv index.rst translation
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
> cumentation/translations/zh_CN/riscv/boot-image-header.rst |  67
> ++++++++++++++++++++++++++++++++++++++++
>  Documentation/translations/zh_CN/riscv/features.rst          |  11
> +++++++
>  Documentation/translations/zh_CN/riscv/index.rst             |  29
> ++++++++++++++++++
>  Documentation/translations/zh_CN/riscv/patch-acceptance.rst  |  32
> ++++++++++++++++++++
>  Documentation/translations/zh_CN/riscv/pmu.rst               | 233
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 372 insertions(+)
>
> diff --git a/Documentation/translations/zh_CN/riscv/boot-image-header.rst b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
> new file mode 100644
> index 000000000000..3e9a9abb5d6f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
And what's this?

Huacai
>
