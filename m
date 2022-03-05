Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82611C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  5 Mar 2022 16:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbiCEQVw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Mar 2022 11:21:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiCEQVv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Mar 2022 11:21:51 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AED3464A
        for <linux-doc@vger.kernel.org>; Sat,  5 Mar 2022 08:21:01 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2dc28791ecbso108468947b3.4
        for <linux-doc@vger.kernel.org>; Sat, 05 Mar 2022 08:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YVpz9jkaN8xgXapW+OCIFGYjSrreSaM2yllavLjOOIc=;
        b=mjSf3Qzn6UM8w0rJowMn7EVE1ol9pl2PThCSxbQ9JEHISoTGBvh5Hh4m1aQwy6Bxql
         +yIxmnlsux8EA7F7YdNjiU1n5NzqiWbaM/aR9gDE2KGRX7SZqD7/Ry+UHzHObUnRL9mj
         i3qGwMudQ/Snjk4YfWQj3/o30UNcIOIG7bbYBu9y7voxZmlKj2PBda+/5hL6zzBg34Tj
         jAEb4DvMQzVW15TFqgzjNf9fjKhe3samtq7UpR1gZLNXlBnhh4yx7Nqp6GpGcs6bNZXu
         YQQAxxyRFilXCDYgV/ZywY4Tcb7AFN9B2dba0TjT/EWXYseocE31VVk7sp5X4F7wLJ9j
         1auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YVpz9jkaN8xgXapW+OCIFGYjSrreSaM2yllavLjOOIc=;
        b=0TZf1Prgv0k1pup1Q6A+1TKtrFgteBsaD80v1VMi19se0HI1sfREdTxop6FHRiQ4Y7
         nKkXctXNFvMzDDi8oElmUXIEcxVzFBfqm1DE703zDnPwfWDM0uPp31OvgsSKN/KOrmw3
         5m/VeUAo6AO2TsI4QP+3AzCf1YCPg5XdM7QKx9lJuWDHZ1jXIFRyQuic3TPuDxMREl4c
         jGB+A9M2AGeofw2TDy29XGwspoXBITCL+gKCatL3VoTcEtFmgaILcsk4hQc3xB9dMboq
         I96EIIDsjTnW88neFrQenU9FNRZ/khMDtgQKg/fDEss9qoPm3cnTiKg8GJDPcvYqQI+n
         oIJQ==
X-Gm-Message-State: AOAM532rg10vgkMvJF+iqoP/FgbyP1czok42o3CoTaScsmD4qGE+vUWc
        RUeewrN5C51fRioaeutXfp0WU+cUHL6bApyv65E=
X-Google-Smtp-Source: ABdhPJwdrxgEGUBFJf5DvovDi2lTV+6CwLdHpIPl7tCZx1Xr4vKMPNJpPzCDB5mn8nsMQJzoKQuNe7/jBtNSjTPqOX4=
X-Received: by 2002:a0d:d9ca:0:b0:2dc:49d9:db56 with SMTP id
 b193-20020a0dd9ca000000b002dc49d9db56mr3035002ywe.92.1646497261250; Sat, 05
 Mar 2022 08:21:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646294349.git.siyanteng@loongson.cn> <ed0830eaad6b9832204e753bb571d21e87f52130.1646294349.git.siyanteng@loongson.cn>
 <CAJy-AmmQxxADyui0fRJt_L9ZHYEi_KgJUk-8ODyd25r+OU17xQ@mail.gmail.com>
In-Reply-To: <CAJy-AmmQxxADyui0fRJt_L9ZHYEi_KgJUk-8ODyd25r+OU17xQ@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sun, 6 Mar 2022 00:20:47 +0800
Message-ID: <CAEensMz7DpjquKe-1Dg0c=oGfg5PL5PynCqPguRoNrFiRuu+Vw@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/zh_CN: add devicetree index translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2022=E5=B9=B43=E6=9C=883=E6=97=A5=E5=
=91=A8=E5=9B=9B 17:54=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Mar 3, 2022 at 4:09 PM Yanteng Si <siyanteng01@gmail.com> wrote:
> >
> > Translate .../devicetree/index.rst into Chinese.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > Signed-off-by: Yanteng Si <siyanteng01@gmail.com>
>
> Uh, it's first time for me to see 2 signed-off from same  person. :)
Will remove gmail in next patch verson.

BTW:
I will probably switch to another email address at some point in the
future because the loongson email is too hard to use. I can't stand it
anymore. >_<
>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Thanks,
Yanteng
