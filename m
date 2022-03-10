Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1799C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 10 Mar 2022 02:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbiCJCFV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 21:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239136AbiCJCFU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 21:05:20 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47523128DD7
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 18:04:19 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id u61so8081358ybi.11
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 18:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=58kJ1YZrsCDTisRdGs4agSqXZwtZJuBpCUN5LREqX9w=;
        b=UIwNp0vEOVuxGj8VIb1dOWprlu0iR3x+T8PRLvldzgEKCX5A77bUIxMcowmbOmppdO
         8hhE3pYaX+MG3IQJ2M4dg6x//IiVyDljuB0vsgyq5EyRHEZ/B7F+SghZ9NYehWaqTvTl
         Lluv6VhE78ivH8Efov0s/I/nCHEUJ2pKFvhyT4ia6wI3MoSzfnKFlm/C4lhQna9CAigA
         lM0nBG1qAxfu7sHbZI5uUiy6+CMTFNsfUaFBxa+nSMPcOD9pxeDqzcdaXD5/Tc87Huv9
         HM2tyvUkSiCHTu4clB3XuxtVsXQXPF4Q/3cuUNPsrDnQVbRIcZX+15OevkwlxHe9+1U2
         AKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=58kJ1YZrsCDTisRdGs4agSqXZwtZJuBpCUN5LREqX9w=;
        b=hsU9KTcVpvoSdEZd/fZjDLe5+bjqBbcmNYsRtH88SO7IFC8xaDuwhMWj+h+FpJJnkR
         eeNYvEBdds4/ZQwL4CgJ1wOCsO2WsU2Y/LGVxvr5D1zcjEdIBckNy96zionD/p7REQv4
         B/m2M5W1JRA2BAkzYqvG7AhMjzlg2dAmhffI7rY0uRsYPYfKjx3q7sCTLIqkr2ry2XsB
         1Y5zgyKl6j8av9li3D9PoZOATHGR5doPoRQNYsCRuKoFq1PIKTw11zqnyUBF3uZN8MhW
         j5XaH4jtv4pnzfIIrBQz9czr/MkYYhA7OzU78YEgYaPJoKUHFwbArhDWnvGGSgtRdEQP
         dsGg==
X-Gm-Message-State: AOAM532iIkWrvP7nXLd/FaPSCeL62iiVoizPP4JRDiLFpGahzYjYE2XZ
        Gb3ZMDTwU1/+c1hOTIF9h5ur4kV4lUB3dmYGJH8=
X-Google-Smtp-Source: ABdhPJyY98F5Wcf6xbjCm/fVIW0jjnsBC7a+2mj36XV6G94DHibHBQbeGOpHs9ChcFFI5l5MDhqGMwB582ivkWOrFcA=
X-Received: by 2002:a25:fd4:0:b0:628:f1b9:cf1e with SMTP id
 203-20020a250fd4000000b00628f1b9cf1emr2297764ybp.104.1646877858457; Wed, 09
 Mar 2022 18:04:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646723249.git.siyanteng@loongson.cn> <e3b3c0c011c0e4a719dd98dfe9cfc6e933ee2998.1646723250.git.siyanteng@loongson.cn>
 <CAJy-Amm19P9qPxqx7v-Yc+5Qwo9BkNZCecfepeD0VDiAxOfNRg@mail.gmail.com>
 <CAEensMxTCsiXmYgJ1B+_p=qjbZMhmSeLChUtJR+ROy1jN624Bw@mail.gmail.com> <CAJy-AmmpEiP1MWCdJdzU_TXrkeZaDCSdasQ91PJr4rbESwQoSw@mail.gmail.com>
In-Reply-To: <CAJy-AmmpEiP1MWCdJdzU_TXrkeZaDCSdasQ91PJr4rbESwQoSw@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 10 Mar 2022 10:03:58 +0800
Message-ID: <CAEensMxWfUFf5UZ9frroW2DxbORfk+Hf+yAv-UnvCqsaqR4tCA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] docs/zh_CN: add damon reclaim translation
To:     Alex Shi <seakeel@gmail.com>
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

Alex Shi <seakeel@gmail.com> =E4=BA=8E2022=E5=B9=B43=E6=9C=889=E6=97=A5=E5=
=91=A8=E4=B8=89 20:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Mar 9, 2022 at 5:11 PM yanteng si <siyanteng01@gmail.com> wrote:
> > > > +=E5=90=AF=E7=94=A8
> > >
> > > as a parameter, better to use original word: enabled?
> > OK=EF=BC=8CEnable.
>
> Hi Yanteng,
>
> The word in original doc is: 'enabled', not 'Enable'. :)
Okey, enable. :)

Thanks,
Yanteng
