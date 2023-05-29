Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B4AC77B7E
	for <linux-doc@archiver.kernel.org>; Mon, 29 May 2023 11:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjE2LiR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 May 2023 07:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbjE2LiP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 May 2023 07:38:15 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3D1D9
        for <linux-doc@vger.kernel.org>; Mon, 29 May 2023 04:37:50 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-565c9109167so17781237b3.2
        for <linux-doc@vger.kernel.org>; Mon, 29 May 2023 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685360267; x=1687952267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoBEV3k+mp3G2hTQQ0To+BOyb5fQb9lyHNZaR49GYHU=;
        b=ut5MJvhBhJKojVYlk2cxRjOBoW1KLjBUrhQf1nfrqlb34LZjvbT0KUmUhgyl3FDl3u
         rRcgpULH9udsxqIKaA7j8Y/klwMa3AqYLzl/SesP0ZCreRyYQx4L2Eg+3Ec4SeujSuAD
         Lo85iIXK834uNNVUiNvGVnr5N7wA1x65pJseRkGSNdapGczC8O+NlXa1jULtHIf6yhFl
         dP9Iq4LN0pMHtC904YvXGjM1eNbA7voRcexFJyBaN59PmGOraJQdWOCdivlrXEEavhuK
         FkwqgcPby0CpxSRWzsgTP9stNRA4+P7mXTwYpinhaXFhMlaa7usm06hZASQ7VcA2pKjM
         kb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685360267; x=1687952267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoBEV3k+mp3G2hTQQ0To+BOyb5fQb9lyHNZaR49GYHU=;
        b=BAJNqS4MH3fuZj/yl36kfoQ+588+t+bLZErLMuRG2i5c6F94XKrLi740CAXK7ZUInT
         ScYur7SWCvvFaKNLQ9GVDBDO41SEXSqKM+v3iIxBZxXl9XmTyaMtCaGDyCeM3ktBBNP7
         ww6g6GVYP5ax/OiM445aXuMYsuNn7AOlDj0o6qD1uAvbgYAt77FLPPnKzXZBwNAnKXab
         3M6PgFwTf9tp7qlvLQ57f0QhpjUEN7SDENxTOW6+IlGPUd4LmMl8qD8cggszmG8JP6uB
         ow5lF+fVlSbWuShgAYgiUP3FnltZ5TcwVOqq0TuySTwo5e2lgU98k3xHFh0TthDT2FHv
         FdjA==
X-Gm-Message-State: AC+VfDztgnKLRfRnwH1kvFHeFgCXeioCzP8I1MDNwfNyjdWe5l2EWlG3
        01KCdxvFYYNdjtAmT6P6mlhGIbBRc4MEbSpHpzRDHg==
X-Google-Smtp-Source: ACHHUZ5p2vilmWRQxNQEN95NJfAxWvpExjUU9mxsfIG0POxhZXTmyvfucsmHflY2abuz5V35HiQwG0iSAhMreQBIubE=
X-Received: by 2002:a0d:e084:0:b0:565:f045:18c4 with SMTP id
 j126-20020a0de084000000b00565f04518c4mr5503703ywe.4.1685360267197; Mon, 29
 May 2023 04:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230528142127.37330-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230528142127.37330-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 13:37:36 +0200
Message-ID: <CACRpkdYDtVy3gJYnD-y-fzSQEBWJJRU2QBYMoUzK7y1yTK33qQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Kill unused GPIOF_EXPORT and Co
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, May 28, 2023 at 4:21=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no use of the  GPIOF_EXPORT in the kernel. Kill it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

That's wonderful.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
