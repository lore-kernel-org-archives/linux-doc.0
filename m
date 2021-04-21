Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552B3C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 01:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22B5561415
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 01:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234442AbhDUBf1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 21:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbhDUBf1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 21:35:27 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD713C06174A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 18:34:53 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id h11so9465017pfn.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 18:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CrandOQ7+aLDU0bvcDkjqLF9g0uhiDS+goUodsmyGKg=;
        b=MteEXcitIJyIdZVrjWiJOt2RAtLy2DDrkISys7whrB9roWODNIDgLZv/o7YmQ8XHMv
         Sw+6WwmqhEjRqyqCeTywvypYunxjuxlOXrI2gI5y3MVRx8xhByTUofnJHICDcwV05Imh
         FpYj1W7/N2hE5oYQvjavzvbR4uv+QNAD+BJA8t2CM3WSZ23Xhry8oGKJcIolNQpsc8ZJ
         rT2zH5d8woOxkyWKFVmXEmBSscgBy6Rg0a+nr08/csNacxoPKolxiaYtfIt0znQfKRug
         auUMntQ58cwQKtCv/xrXGLnbbeQk0R3fK3st3un3ny6clnYOVEUVdsvbCYa4pNvuMp82
         eFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CrandOQ7+aLDU0bvcDkjqLF9g0uhiDS+goUodsmyGKg=;
        b=PmkkYn5O7y2CGhBoR7Tf7c+h3DHPR0RbaWyBCQOZnQCXlFqQOQrjd5xJvX97pWRSAw
         QkdFcdrEWq00sTcYajabB7GogOl8DErBK5vFOFJkdHLegL/eZfoUXZ3vJgLMgMUTWsgp
         NY5tIeykg9ryjzxOxZJH0xADYNjcJ5ThXMVhmM8kFDe3ntEeB3mq6VKZ74PIZ1QT85rW
         IkCj1xGgUIC3GKWGoyDYIGBUwPrPJNIgihj18NWcueli+S//ywH02FpbprRqiGvjIKRD
         AHt11IRsySdAk+BPFodwWxZTenM6M04rhnpQzqHXWQH4v6QjQ8I9zXbCvrwD1/78Levb
         WomQ==
X-Gm-Message-State: AOAM533L1RFaj6PjWFpuEfZ3LwxpFaDrcDdJHelAb9JLf/AIBkeKVLvk
        8SgBADyzb2NT0KxpBE/5jYFHzbzT6X7H/xOlysU=
X-Google-Smtp-Source: ABdhPJx2ifm+sFpxKCPhxeSa+qcOj0lwzPwM+ar6fxpv54oK2sHriSWTAwD0AKSrLAgAhsMMUOQkI3I/TuiyNJqscwY=
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr8486254pjr.179.1618968893475;
 Tue, 20 Apr 2021 18:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618568135.git.siyanteng@loongson.cn> <87lf9cip3m.fsf@meer.lwn.net>
In-Reply-To: <87lf9cip3m.fsf@meer.lwn.net>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 21 Apr 2021 09:34:44 +0800
Message-ID: <CAMU9jJohxSfv4kKD8rCDqeXentA9Yqan0NVNR2JfYYD=aKmXWg@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] docs/zh_CN: add core api and openrisc translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

OK!
Maybe I misunderstood the patch split=E3=80=82~>_<~
And next time:
when I add a new file, I will do the associated index.rst changes in
the same patch.

Thanks,

Yanteng

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B44=E6=9C=8821=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=886:11=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng@loongson.cn> writes:
>
> > This series of patches translates core-api/irq/* and openrisc/* into Ch=
inese.
> >
> > v1 -> v2:
> >
> > Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewi=
ew!
> >
> > v2 -> v3:
> >
> > keep the signs number equal to the title char under Alex's suggestion.
> > Thanks for his rewiew!
> >
> > v3 -> v4:
> >
> > Add Xiangcheng Wu's review sign to 0002=E3=80=810003 and 0008; Thanks f=
or his rewiew!
> >
> > v4 -> v5:
> >
> > Split 1-7 into a separate series.
> >
> > v5 -> v6:
> >
> > Modify the Subject of patches 07 and 11.
> > Patch 11 will not be sent if not modified. (name repeat)
> >
> > Revert to one series because there is no need to split into two series.
> >
> > v6 -> v7:
> >
> > Send patch 11 to the series. Thank you Xiangcheng for your help!
> >
> > Yanteng Si (11):
> >   docs/zh_CN: add core-api irq concepts.rst translation
> >   docs/zh_CN: add core-api irq irq-affinity.rst translation
> >   docs/zh_CN: add core-api irq irq-domain.rst translation
> >   docs/zh_CN: add core-api irq irqflags-tracing.rst translation
> >   docs/zh_CN: add core-api irq index.rst translation
> >   docs/zh_CN: add core-api index.rst translation
> >   docs/zh_CN: add core api translation to zh_CN index
> >   docs/zh_CN: add openrisc openrisc_port.rst translation
> >   docs/zh_CN: add openrisc todo.rst translation
> >   docs/zh_CN: add openrisc index.rst translation
> >   docs/zh_CN: add openrisc translation to zh_CN index
>
> I have applied this series, thanks.
>
> I have a request for the future, though: when you add a new file, do the
> associated index.rst changes *in the same patch*.  Among other things,
> that helps bisectability - we'll know which patch adds a build error,
> for example.  It's not hugely important for docs, but is a good way to
> approach kernel work in general - don't stack up lots of work that only
> becomes active as the result of a small patch at the end.
>
> THanks,
>
> jon
