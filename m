Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27195C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 05:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234002AbhLGFcw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 00:32:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbhLGFcw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 00:32:52 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A57C061746
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 21:29:22 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id x6so15553732iol.13
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 21:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r5hP5CKBHJbhFNsCHBEVNu9Ibwt4p+gLXlSV29Bh/FM=;
        b=PPiDirD6XwotNK4kt39FyIpmqg/64kKfzsDS+zdjYNkD7dsRmvsrJggvKHIF5Wgecu
         k3WH33/t9xUdBulLN0GddjqJNcvuP27Voc7MU0bScHGcn9A2Kd6k6ryCFBFIzomWw/hM
         mMsey3FTWlKZj5RECma5dyiIM9M5DDqqkWuHO/XG0gTT13UoHvVfbQBebRuq5U9mHjJv
         BbKSf3QRg+lDe976ng+Ay3Exr8pH+kE14/eHADvu08yLsDZbxx4XQwmALaiL/mmYqWKr
         J66SKvIBl49dU07Y3ekmzUDBDZvFfOSZlluqvVhaX9QWhuu346O2oZjgtDTylg6WkSAJ
         bycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r5hP5CKBHJbhFNsCHBEVNu9Ibwt4p+gLXlSV29Bh/FM=;
        b=jCdvTTsT/QZVb7hYpbrC3lLsLZlJip9kBVw0uW3/oqTnQ15Oj/BhJUenNRtHl8FaYs
         u7XYHgrtFylOSR+0hWwimgBy4VlsLuLkLndKTBzCxzHlo0VkXfZkSpvFSTR8lMm6UX9o
         40h3ytVDwMmIoQM69KluhtClOFcUhrqi1kF5I+7Forx4c3o49tLxk4CkcgvhlLNlthTW
         L26hJQ3eaBUUpw/g/6hIYHvaOZHDkcf1W+Jcnz62mnOVm2Kd12SW99EKwZV3VcrcMv0b
         VU400EF6NnxFqcAcMtJgF1rw/8e+c4uY32eFqNOW6fEMBzI5AG4O5JXRrTIemhBy32Tt
         cjmA==
X-Gm-Message-State: AOAM532K4MZGUB6pey6UL0QsxdUKcQpxS/kufOTYD9fLx8ra2h47shvI
        uWcfcuJKvuumcjsCfLkSu5intlfa33xigFTcDiA=
X-Google-Smtp-Source: ABdhPJxyePoVWe6DhEYpUeCQ2/oUeNGdXcAnMOOKQIEv2H+vr0Pgn8X7Nco9GC0Wv48k2J2lTXZ6iJkQHlfpu+WxVtU=
X-Received: by 2002:a5d:9d92:: with SMTP id ay18mr39627852iob.130.1638854962265;
 Mon, 06 Dec 2021 21:29:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638517064.git.siyanteng@loongson.cn> <f9e66ba8920bc1bb3f1d67044f64712fa30db7c9.1638517064.git.siyanteng@loongson.cn>
 <CAEensMwbdxmjXKa2Tqqh4f2Bw--_8owW=W4ngFs2tU0fJrBe=w@mail.gmail.com>
 <35a537d9-0457-746d-7a52-897e45bd2932@huawei.com> <CAEensMx7qmK9zvK0kgoawhMdwPWNkBrEFXNr3oHmNJEznF+YbQ@mail.gmail.com>
 <f6a10951-8201-8035-e108-01a73399e1cf@huawei.com>
In-Reply-To: <f6a10951-8201-8035-e108-01a73399e1cf@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 7 Dec 2021 13:28:46 +0800
Message-ID: <CAJy-Amk8ZhtuWLwU9C52ZOwGxP8fRWPfGFTk--SkA2dME0wucQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] docs/zh_CN: add scheduler sched-arch translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     yanteng si <siyanteng01@gmail.com>, Alex Shi <alexs@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>,
        Yeechou Tang <tangyeechou@gmail.com>, zhengbin13@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 6, 2021 at 5:52 PM Tang Yizhou <tangyizhou@huawei.com> wrote:

> >> =E8=BF=99=E9=87=8C=E5=88=AB=E7=BF=BB=E8=AF=91=E6=AF=94=E8=BE=83=E5=A5=
=BD=EF=BC=8CCPU idle=E6=98=AF=E4=B8=80=E4=B8=AA=E7=89=B9=E6=80=A7=E3=80=82=
=E7=A9=BA=E8=BD=AC=E8=82=AF=E5=AE=9A=E4=B8=8D=E5=AF=B9=E3=80=82
> > If you can explain what cpu idle is, I'll use idle. :)
>
> Alex, I want to discuss how to translate the terms (especially nouns) of =
computer science
> and engineering into Chinese.
>
> IMHO, terms of computer science and engineering are much different from t=
erms in other
> science and engineering disciplines as they usually come from our daily l=
ife. Maybe it is
> much better not to translate them and just keep the English terms there. =
For example,
> there isn't a conventional Chinese translate of 'CPU idle'. We don't need=
 to be the first
> to give it a Chinese translation. Should we translate them into Chinese, =
I feel awkward
> because the rest of the text is serious and rigorous.
>
> On the other hand, an experienced Chinese kernel developer may be confuse=
d when read the
> Chinese translations of kernel feature names, e.g. 'CPU idle' here.  Peop=
le who can read
> the kernel documentation are not babies, and they at least have some Engl=
ish fundamentals.
>
> Futhermore, I think it will be clarified more clearly if we both provide =
English and
> Chinese at the same time in the case when there isn't a conventional Chin=
ese translate but
> we do want to provide one.

Right, some proper noun translation is hard and may make confusing if
user read English first.
Keeping some original 'proper noun' words with the translation is a
good idea. and it's ok for only
English if we can't find a satisfied translation.

Thanks
Alex

>
> The above principles are applied in my recent translation of sched-capaci=
ty.rst. You can
> also comment there.
>
> Thanks,
> Tang.
>
