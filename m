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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC424C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 02:15:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95AF861A2B
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 02:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhCZCPW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 22:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbhCZCO4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 22:14:56 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E37C06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 19:14:55 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b16so4598505eds.7
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 19:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yfLTItRhgpZ23bSwgdO5SPj+tOEYQfJHOmodFVR83zU=;
        b=C//M4CaWpt/Cvj7YAaOCpCRbjGd3tli9dU2K+F1oLOhedV2/Grp939XSus5/wchXnn
         evX9VJeTI6vQwAi4kx/yb/VVSm0cT0OpJxTIOj/5Poy1ijpgcE0xtW8RmzpNG4SBwbHr
         0TyATzGICMDDZlTUhHQvFC79nZ5WKyoVfmWvnB4EolCp76/g5KuZQ4ygwQ0iVNVz8cC1
         NDxgw/RFk5f603DHVqp58zsEjfavEtMAw34dlk68qmLz0CtU+cOSOJwOKSbK9DCEu0gS
         jVkcSw0NcEy518YWDLTMSa+qXsNCh4xJlM+ha3IllMSEuT0cLpKEU//RNFnmsfjBikON
         k+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yfLTItRhgpZ23bSwgdO5SPj+tOEYQfJHOmodFVR83zU=;
        b=UExPWB66mo5xNElywViHAsuE8/0OmgLdZXeAEXC5PNCvYq1lmKkB8JyVuSMubOh+8W
         /f6DkAgBlMG3FJS6AQi/C2j3DQiN2E4vLAl8miYcJ77Fn6cqXb8rdIeatwkoXsxXcngf
         zC6NlXhUuPlzFXxXwWeu5suH+N5FA9KmLqnXbvh0Js3wmggINxOk60wFQFiepZSdd37z
         kSF61HIda6adr1XBw6hWHA72pNPjeKTIyc2GUDSxoYqHGGPkzikGBrkNOf9EHY45p6lU
         WeFE99reFFx7uyWyaxT3G93xPZxsbwYhSoOTqpXXHEUQwQ0HoKAhUTia7KAzrdPAgqsU
         Ci0g==
X-Gm-Message-State: AOAM530+aCe5LLfTzUlqjUWl5YAMUyTB5lTLCtxJGdOJSuUsX5rTLuXJ
        dYdJ5773H4MwVOpPU2H1s1ej+3bVfK3kD/EbbR4=
X-Google-Smtp-Source: ABdhPJyBKv1aHn1TZAOKngYxgU96nUTL9c9HJakbVY0A2N/2KcVl9j0YMGPpbsDwfL/VRaeMOcwQ29/Gzf9tTizsjis=
X-Received: by 2002:aa7:cf14:: with SMTP id a20mr12309931edy.49.1616724878953;
 Thu, 25 Mar 2021 19:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210324150731.4512-1-siyanteng@loongson.cn> <e3a1546e-070b-c9d4-0dc9-e8bc6d67b1ab@linux.alibaba.com>
In-Reply-To: <e3a1546e-070b-c9d4-0dc9-e8bc6d67b1ab@linux.alibaba.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 26 Mar 2021 10:14:30 +0800
Message-ID: <CAEensMwYddFfSaNEyYoMuKj=FnCS4duntQFgvoBUsFRC0J55eA@mail.gmail.com>
Subject: Re: [PATCH 0/8] docs/zh_CN: add cpu-freq translation
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alex.

Great=EF=BC=81 I'd be happy to do it. :)

Thanks!

Alex Shi <alex.shi@linux.alibaba.com> =E4=BA=8E2021=E5=B9=B43=E6=9C=8825=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Cc Wu Xiangcheng,
>
> Hi Yanteng,
>
> Thanks for your work! believe we active translators could review
> for each other. :)
>
> Thanks!
>
>
> =E5=9C=A8 2021/3/24 =E4=B8=8B=E5=8D=8811:07, Yanteng Si =E5=86=99=E9=81=
=93:
> > This series of patches:
> >  translates Documention/cpu-freq/* into Chinese.
> >  add .../zh_CN/mips to zh_CN index
> >  add .../zh_CN/iio to zh_CN index
> >  add .../zh_CN/riscv to zh_CN index
> >
> > Yabteng Si(8):
> > docs/zh_CN: add cpu-freq core.rst translation
> > docs/zh_CN: add cpu-freq cpu-drivers.rst translation
> > docs/zh_CN: add cpu-freq cpufreq-stats.rst translation
> > docs/zh_CN: add cpu-freq index.rst translation
> > docs/zh_CN: add cpu-freq to zh_CN index
> > docs/zh_CN: add mips to zh_CN index
> > docs/zh_CN: add iio to zh_CN index
> > docs/zh_CN: add riscv to zh_CN index
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/translations/zh_CN/cpu-freq/core.rst          | 105
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst   | 259
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++
> >  Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst | 130
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  Documentation/translations/zh_CN/cpu-freq/index.rst         |  45
> > ++++++++++++++++++++
> >  Documentation/translations/zh_CN/index.rst                  |   4 ++
> >  5 files changed, 543 insertions(+)
> >
