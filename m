Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3B0C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 02:47:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B12C061005
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 02:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbhEQCsr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 22:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhEQCsq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 22:48:46 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203E6C061573
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 19:47:29 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id d21so5170626oic.11
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 19:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=431XNN5JRS8LOxY8NoXFZAq5Dq9EgupPMADykdvJSRM=;
        b=fN036M9cFoq9IxNIk6LNVpJw8hdhd/6qMERzsmxDONjpaMvt+wD+beUAMyoTj6rime
         q4e2pRv7oDdNJNIgPwCWXvqIkwh59wqUUaMnAk2eBkCRqWxCGU93zheeactz1zkb5qpV
         TfyT4cepREE+bkdncRo6gPI6wPVPX400G8Dve1ulmDDo8M5Vye+T4Yih+v2bFk/yJhJL
         JDQPmZFuc2HBq6WJG9JuFEK1a3lKex/dPRe0uhXc7Qal5dcTEnIQ59OsgPQbIYhcBGsX
         aXROI24sYZdXF7iER58UwJEDvNceaBhMS/lHjBB2n6oRJNrkNkWigf+y7dF04VsiwwJw
         CmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=431XNN5JRS8LOxY8NoXFZAq5Dq9EgupPMADykdvJSRM=;
        b=gCZGJM/zqncUpQL5VrGIhHYHPPuMsC4hw9v0qDAsn2Bo6oI0FIcKCoM7x6Ijoj8z2X
         FmfpjZtddx7faSw+1ronCXsumIo89B0zb3Xhnw/U9486YedvkaHYwVu3eQEj6kAMDhUg
         aRs0OkTtGwTkkXUfloxA9AGbtZi7NioJk7AamuKlJ1vsI/v04PgBhRKzGPFEGKVQrEob
         OnoUjR9maWwkjwptRpbEq472N2hxF5CQWLKVU0X5VlwmMoDslLpO0LSoJleA43nDP5BK
         4rIYGX6WoK3Mq4YUBGo7h+Ki8qwNeK2SADzmBrs7jCP92AnoqPn0N7uAVwtRMGeCfllp
         Cd1w==
X-Gm-Message-State: AOAM533OP06QF8rvjgBk6le7MxHjgQo2ErUIquofLdArttIPEY2LW/BA
        ICtqJTDjCWd7lA3xUfXiMJxcWLEL2ADTJ80IOjM=
X-Google-Smtp-Source: ABdhPJze0pzaWpC84jstlqdl7uVsV/butYBf+gaS7buXVp4vtKk2hA2WijgAcGm+SsAl+apvEMxcEHPkMWYf7R4AG4c=
X-Received: by 2002:aca:5783:: with SMTP id l125mr41964446oib.130.1621219648611;
 Sun, 16 May 2021 19:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621062577.git.siyanteng@loongson.cn> <88c52f48d18d6a6c16c6dbb63d9b89ccad6824aa.1621062577.git.siyanteng@loongson.cn>
 <2ad36de2-abdd-aaf8-34a1-097437a70f7b@flygoat.com>
In-Reply-To: <2ad36de2-abdd-aaf8-34a1-097437a70f7b@flygoat.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 17 May 2021 10:47:17 +0800
Message-ID: <CAEensMya2dOvZgAUHaCn4MToB=6sYfdXFrTWEyHmhhcQ-=SCqA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] docs/zh_CN: add core-api printk-basics.rst translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jiaxun Yang <jiaxun.yang@flygoat.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8816=E6=
=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8B=E5=8D=887:38=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> =E5=9C=A8 2021/5/15 16:10, Yanteng Si =E5=86=99=E9=81=93:
> > This patch translates Documentation/core-api/printk-basics.rst into Chi=
nese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> > Reviewed-by: Alex Shi <alexs@kernel.org>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Good job~

Thank you for your review!

Thanks,
Yanteng
