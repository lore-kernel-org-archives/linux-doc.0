Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2E4C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 01:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A008461166
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 01:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236677AbhDPB4q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 21:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbhDPB4q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 21:56:46 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE86C061574
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 18:56:22 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id n184so303181oia.12
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 18:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0PcfClE8y50mBhLd3XNHeLAfC7e1DJonn8WVmRE7DwY=;
        b=m462GoVNUyS0HRzoVCIR8FdLgMdEJEuMFTw57evCx2ZHqAOR6iP6jB45Mxh5Tu/2TB
         FHARMNLFvt3Pi3z0YWGYOh+brzuGIcRFcl3stefY0a/WYJwZ7wxUR7XFU6ZTDHj8CO6m
         Bjx7RkXRQhU21hzChGxIxQZzCEArbNFyqHgcmA1CWOKNohMFMH0XgE9btDmHjgnKWom7
         3K65e6CEoQ8tVn4PRuX5hl9aQb4bqF6iGhudZgF7gFhw+2QscNmgfuQ11MSyQZ9od3X8
         UndFpp2gfFvStjj6yZ9BBRr7OpvmA5vG/Tq/GCBvbI8BKMfXIFPwzNmegHr/F2jlFGli
         W7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0PcfClE8y50mBhLd3XNHeLAfC7e1DJonn8WVmRE7DwY=;
        b=udEAwNrZjalJg6wglS064JkoBq3dCnDoREF8A4oNZK/cE1Nsica4CBf30Yl8Xa4b4f
         wJVxNyBoeavNLnDJwyCxyDbOO4pIy4iC/gTWHGmHL9lq+57DTMSj2Z/fhjL2a8bWPwPT
         27E3TWOXj8EpqEsdYoWnc390ZsiTUqbzCo+yhitaeSGrcQqhWoI+iWyxW3AmRKPXsV8i
         7AZGHsymcsez7poH80NmbQTODqE3x15Lp8ejwGtnoomNLpPo2fFK+7jvIszjzIqxnHHe
         IvpGwc6Ya4NxuUidXFmrwakNIFLTVlQqLAyskVfsKtK7W+q1Br4/W6LGzqotNYBimpEQ
         PeQQ==
X-Gm-Message-State: AOAM5309TljDJLE640OoPx1ks0m30KYOWdwbZVkcXd/ElbQ8rVJkAcyd
        G4cmQnwPDXg4dQ4vsBXtt7A7IP6A3zg9Xuwv3XHonzNswdAU/lhJ
X-Google-Smtp-Source: ABdhPJzwZDnQso12UuEC4T46wZsQrGGqY6AFoM6nQOJYH7HHhZScs3jA/8522OsTUY50++/unu9B+3bFekmEIeeSQjU=
X-Received: by 2002:aca:482:: with SMTP id 124mr4705954oie.130.1618538181862;
 Thu, 15 Apr 2021 18:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210415063838.2341827-1-siyanteng@loongson.cn> <87y2dj4lvw.fsf@meer.lwn.net>
In-Reply-To: <87y2dj4lvw.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 16 Apr 2021 09:56:11 +0800
Message-ID: <CAEensMyd=yeLaYwoLr6P3qnenj+DbcAqsmTamhAT=uy8nKHtOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] docs/zh_CN: add core api and openrisc translation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B44=E6=9C=8815=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8811:18=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng@loongson.cn> writes:
>
> > This series of patches translates core-api/irq/* and openrisc/* into
> > Chinese
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
> > Split 8-11 into a separate series
>
> So I am now totally confused.  I have two "v5" series with the same
> subject; they are evidently different but there's no explanation of why
> or which order I should put them in.
>
> Please, why have you done this, and what do you expect me to do now?
>
I'm sorry.

I'm making things worse and worse. I just want to split into two
separate series,
the first series is 7 patches for core-api and the second series is 4
patches for
openrisc. However, I didn't change the subject of the cover letter,
I'm really stupid.

Thanks,

Yan teng
