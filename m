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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD4FC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 02:41:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51F2261185
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 02:41:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhEQCmw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 22:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233524AbhEQCmv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 22:42:51 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30ECCC061573
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 19:41:35 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id b25so5257711oic.0
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 19:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eA7M7YUanXE0mV2moup/bmHMm2RII094Moi/lG9a/Bg=;
        b=QclXu9oldW9jFK3+KCaNy1h7g0Go4Iu9yFfNhNLU2OYV8qi2rPVlIlGtoDlWrAqx0k
         oX9oHcbZ3Vw3GVwBorESCsLyq6DzxB6oo1oEKlCoFHKT/lMv0Y5JoYPjOI0HxCB30ysk
         7Q3jCujqy4MwI49yuoRyr/ZuOBYSQgt5hV0Q0jQTlOso4yajid2xZaIWZ3duciVzZnQl
         O43FbZ7xeP+CTXXP3zHWzBfD4Q9lcYm2qFT98buWEHqrPP1c9YutwaEm7pBK1wnVzNGp
         V0Ivj+SbtNjy0tDfUqZyhalF54zDlgf1PRViep05AH5e5JGAUjXxrSCa56mIxjpdjjr/
         HhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eA7M7YUanXE0mV2moup/bmHMm2RII094Moi/lG9a/Bg=;
        b=ipII0DuryUWWJaHflW2fnPYSDv9xWQx5N0oGX1kVi6jTbPLi4naTtDppPmVAc3U13V
         37Al2TaZlYFTsVFpDgn6Swo3/rvaKuHebOmTAuNpn/8g/DG9gONhjII+XSkiKjOWS8j8
         TV3Tk1PcZllPMt3goVy2IPeI2PriFl11UgsSy44aX+2V9+l6RNRT1GQAzzUOAZ+uisgB
         hgbmQ9pqwMxSk7skhRLyV7PdKJePVHsyG4F1LgDRIELEmkFsQ0SvLsI4YWcrrBDNG36/
         rtxv8+CJJEBH5wqjFysRZgur/ctHQYpe3wJ1JcCh9D0R+qZLK3Kml5a4MlIDPb3VD4ow
         V3sQ==
X-Gm-Message-State: AOAM530XC9PkTROCnTsDGywU9tW4Cd06NMjbq/rc+o/fjH6W22nk4N/C
        7w+WNWdkIWkY8xDlPX0aSMhw2KAV+ZjUWWZlcW8=
X-Google-Smtp-Source: ABdhPJxH1nWyZdRNVgN0Hi+Nu1HRPGZf1GX9d1Was5cWXr6h2J6JskFArL5HTYScWJnlQh8IpGI7RkqepFi0xQyJtbs=
X-Received: by 2002:aca:5783:: with SMTP id l125mr41952496oib.130.1621219294557;
 Sun, 16 May 2021 19:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621062577.git.siyanteng@loongson.cn> <ff5bfdf71ffbb248a7eca480bb7028fb7f30c083.1621062577.git.siyanteng@loongson.cn>
 <ceb73924-868b-8ee8-b46a-84d39da74e10@flygoat.com>
In-Reply-To: <ceb73924-868b-8ee8-b46a-84d39da74e10@flygoat.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 17 May 2021 10:41:23 +0800
Message-ID: <CAEensMz303g+TLakHBEwDm58EaH-DQPEkWaSe02to1nb4QujqQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] docs/zh_CN: add core-api printk-formats.rst translation
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
=97=A5=E5=91=A8=E6=97=A5 =E4=B8=8B=E5=8D=887:40=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> =E5=9C=A8 2021/5/15 16:10, Yanteng Si =E5=86=99=E9=81=93:
> > This patch translates Documentation/core-api/printk-formats.rst into Ch=
inese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> > Reviewed-by: Alex Shi <alexs@kernel.org>
> Reviewed-by: Jiaxun Yang <jaixun.yang@flygoat.com>
Thank you for your review,but
jaixun -> jiaxun? :)
>
> Thanks.
>
> - Jiaxun
> > ---
> >
