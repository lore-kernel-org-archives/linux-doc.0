Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487CBC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 01:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26020613B5
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 01:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345942AbhERBiv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 21:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345928AbhERBiv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 21:38:51 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06AB9C061573
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 18:37:34 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id j26-20020a4adf5a0000b029020eac899f76so100971oou.7
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hQHpVeOQsoaKJf/KKsd+0HFsCu8T2/czEMbKLQz1BJ8=;
        b=jMV5jSEaq/V2WsMYYfvE1iP4GaXzaYqjydF7G27VPCm+VRINmzw4n1bZtWVACJ6cJx
         Mypz0WgOFUkOEpfDyBryN3O9XOubTtceoH5XPmcznLfl8b93eKAB4CUiIKx0PpIx/aFG
         2F53hhWxSownBYk1Mt1q6TyL+24/yOgS+1KNKPmCjX8/yElWIMJHO4DSF5l7hEOzanm8
         3lSB//Y5dRfwHVAdsfAls/swLH3pUAAEEot+5ZzAZCzeyEbtpwB+8TXj3iuPIOppjHE7
         f+WY8+9OSqSvuJqitNxIDNOz4HoNOH4N01utB4QJ9jAZX/5GLPXUTl7mfl3LPNIkEKHN
         XQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hQHpVeOQsoaKJf/KKsd+0HFsCu8T2/czEMbKLQz1BJ8=;
        b=RNY/GidpBiWHhnhv9dc4YOuNmD4g5Uh6ckrpWi/m1RBCuQbmoAr1rXWU8lZN7q7DzJ
         5WSY3wowAz4rvtSp7rI7QzxhIij1/jj07A900y2g2QHt3k8LEg2Y5C+4Pke3Fk7nnN8d
         xqyjnR87InnHZuW1HBH4FfFKMrGSrv2olTTssvN15GIBI5xUFF+bNDm+Jx7N4EMsAI1L
         2vGLhyuHUYiieAIisIXFSBNs0DsO83vBsZNMiVoGhySQy1I6O3/GUNhmhZZzd1Z0VTuw
         OeHgOBook2lPdSH2zyBrEXlxKQP4PnB5F2ar95pvvScXkFoCBiXOZsRHyA8znXLbO5Bx
         Nj4g==
X-Gm-Message-State: AOAM531G0zyAxuPzyFcB5IbakBwpgOoW+ylRWaEmxlHblbrdKNJsXpVw
        Ux6sFVEunNEQLXDolmwsi+gfbbsrkQi5Fru9oO4=
X-Google-Smtp-Source: ABdhPJzlveD4hxtvnr+v9lG6ZfdhoqyQhuo4UBnuzD3Qpl5JOgOVdWzj3X198LkOg2sJyRQvye6aniXAppEdmiwphlY=
X-Received: by 2002:a4a:d052:: with SMTP id x18mr2227918oor.21.1621301853333;
 Mon, 17 May 2021 18:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210517133748.3461357-1-siyanteng@loongson.cn> <871ra52oue.fsf@meer.lwn.net>
In-Reply-To: <871ra52oue.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 18 May 2021 09:36:43 +0800
Message-ID: <CAEensMz6+xMxL_Wc6dZufT54mwtZsqzupzxLLTkirFyZcP2V=g@mail.gmail.com>
Subject: Re: [PATCH v3] docs/zh_CN: add core api kobject translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B45=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=882:32=E5=86=99=E9=81=93=EF=BC=9A
>
>
> One little detail while it's on my mind...
>
> Yanteng Si <siyanteng@loongson.cn> writes:
>
> > This patch translates Documentation/core-api/kobject.rst into Chinese.
>
> If you look in Documentation/process/submitting-patches.rst, you'll see
> that it says not to say "this patch".  Instead, changelogs should be
> written in the imperative form: "Translate Documentation/whatever into
> Chinese".  I'm not particularly worried about this little rule, but some
> other maintainers are quite firm about it, so it's better to just adopt
> that habit.
OK, I will.>_<

Thanks
Yanteng
