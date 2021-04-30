Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C70DC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 07:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7A2F6141C
	for <linux-doc@archiver.kernel.org>; Fri, 30 Apr 2021 07:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhD3HA7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Apr 2021 03:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhD3HA7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Apr 2021 03:00:59 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2756DC06174A
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 00:00:10 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id b5-20020a9d5d050000b02902a5883b0f4bso328235oti.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Apr 2021 00:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Tby4esKWeVGt+KmNV2WyuMp/kHDnibFbqo34oTQ123w=;
        b=mMeI7NJw0NR6QibhEMfbgFvuZJ/GdjKvS9l5RHnT2mlpmwf6h+e2OJyt9S+Hmq8SmO
         ucyhhWaDUf80AMu21OtK0MXQgO4mYuRJdYqFK81h9kdYTJLGeFKmWHcwOZN4u1KC50np
         RUuvgFiDuTN6nxGyE+Zme2Gnxg4L/suHKt13dGw/K/I+hy0cNd2k5BJBEXU6ZVLFDlCl
         khuQhXbzQMhfeUxGr4kmewP27KZpe9OT79hq3DrjMtsR/24TCA/q9ALR5OnjIHG2laJu
         N6z3etKYJA4tXqql/rTEILWErbgcJxb5CKc/ZnGtXggxjjK7AdLSSIc6HDyyieOldgSE
         AmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Tby4esKWeVGt+KmNV2WyuMp/kHDnibFbqo34oTQ123w=;
        b=p6yDfPi58uRkL/afsFlk8XPHvVyWqRcfmk4QHjFSswUqvssutCr2HwYc8EaN+45biG
         N5W4SwakLzhfQ5/qszXR4/NuyZOR0scfI723+qerIKJ1PMG8qK6CngzinY/rR894wp3U
         CCZzczHvnF/LNydIYFW+OdzkctMMDs4fU2jqrtqpvaAMC6BnUz5ASqD1COGuV3jH1irL
         B5NWI5PsOWUgMT3kKaPlDeAj08mTMN+Pen+PwiGyON7kPTfa0W8uktxMCl364qUike26
         azbcXsTaK4rq3ojkYfi6R0NBs2uscTXioZ2xTlIc82uZy3d5z+rUeoDfNl5cNEgBc9A2
         kZ6w==
X-Gm-Message-State: AOAM5322NPNLrVHQpqvdLUxMhzw+G4dREZ5zlntL5XT3eTsoz0QVw/cA
        is43oe4Kc0yDJx7ckbZU5Jdzv1ALV4x0na3deW8=
X-Google-Smtp-Source: ABdhPJxM2/jh1cKiLXwc054+ZLi3jFB0iQmjIf8NOxoKRktOtWEOrQvhHHHy1saDH/Ifq4p7Ur6iylo3Bv5EQialsdk=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2475285otc.302.1619766009569;
 Fri, 30 Apr 2021 00:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619665430.git.siyanteng@loongson.cn> <7e64ac33597d69635497b03b29d63e17f905c96f.1619665430.git.siyanteng@loongson.cn>
 <20210429151058.GA23087@bobwxc.top> <87v985cbi6.fsf@meer.lwn.net> <CAEensMxWmRppXmxuYEsq-jS-psQ8N1Zim-d+CCOckig__RfN5w@mail.gmail.com>
In-Reply-To: <CAEensMxWmRppXmxuYEsq-jS-psQ8N1Zim-d+CCOckig__RfN5w@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 30 Apr 2021 14:59:59 +0800
Message-ID: <CAEensMx2uidzxnwtvTyUs-XhkDEb28vGRxmE2xCiQf1p4MbPdQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/zh_CN: add parisc index translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

yanteng si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B44=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=882:26=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B44=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8812:16=E5=86=99=E9=81=93=EF=BC=9A
>>
>> "Wu X.C." <bobwxc@email.cn> writes:
>>
>> > On Thu, Apr 29, 2021 at 11:33:33AM +0800, Yanteng Si wrote:
>> >> This path translates Documentation/parisc/index.rst into Chinese.
>> >>
>> >> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> >
>> > Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
>> >
>> > PA-RISC docs are silent, lastest practical activity on 2013-07-09.
>>
>> Indeed...PA-RISC in general is not a hotbed of activity these days.  Is
>> there some need in particular that is driving this translation?  The
>> work is there and I'll apply it, but I do wonder why...
>>
>
> Just for fun, I just translated it after reading the English document.  ~=
>_<~

My web version of Gmail occasionally switched to HTML mode and emails
were dropped by the doc-list. T_T
