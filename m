Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9347C43461
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 01:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C129611CB
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 01:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbhEQB4s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 21:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEQB4q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 21:56:46 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789E6C061573
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 18:55:30 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id v22so5149095oic.2
        for <linux-doc@vger.kernel.org>; Sun, 16 May 2021 18:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DCglTXjPPFjyH8GNJnEih6ZLH2nsgGbLx6Ja1YNxrYI=;
        b=dWAbSL+4SpSYMUp6OvILD0lxB0wNaBABtEAParLwKteB44iP7nA0zeLN1u3CDlSf3y
         yhF1MlaF0OQVtwes7PM+awk86rYmJFbDcOz6udlHxz+cSI14aOrvh7a3jHC1TfxK89TY
         qTD6fUT6o9ieD4BkS+44g1wxBgK2NH8g5hCQNdEL3evnkOgevwkLQd7tdGACmI3KbAvf
         ImQoZqrR/fUV1fp1bJsrxC3bSPNTY/oG8Z4lLAes9E0FeX62QaHR47d/uRmOSneSazlW
         gnCzjcq5bTi6r59ojlL9DmAkXw/Wi1k/8uqzXjC1XDns11KAPy7+Bco1EJ9CTez3XTof
         aJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DCglTXjPPFjyH8GNJnEih6ZLH2nsgGbLx6Ja1YNxrYI=;
        b=dcJDuG05zpibqXopzSNL4igaS/UWivqXYsTtcpYJieAiLBA7iMwPHtatTq8BLCI3Vf
         uiN4RkG5UEC3mWTPOkGdyCYw3ja7ZxN9wqaTCSWL4EmGc7Ypgzl3IGvGLtCwrM8watcZ
         kcmP4WIHnpjgGX8ij/h3ZgH+mWvzRhc+PGIBrDDfReKFtCuq9Slc3ObQDCYfq6Nf6sTC
         RRfEekf6730uIO0d+dciBB2gOUJ3P0N4FeZdKvkJrNOt+18dpKUy9C7j+8dum9TWrlCa
         hWc9o0B+Hen0wbNPHhz3XPVHeIdpO8nBiR1SxP3M51BJoGajI64Z0ttBPYQS6NOxUG7Y
         uDhA==
X-Gm-Message-State: AOAM531ZDOiRSx2gwPl1g29WFmkGZAgC/DFAc2NXhjwHhzVPMg6BmW3H
        AxTzklzsHRrx/CFRpMSd7uYMraCa8smY6jzxBR6W2RGlToPZw7+e
X-Google-Smtp-Source: ABdhPJxCtj44LodnkUJ10w0X8FKZovytIVSYt7sbHOgqkjy7+7OxUeM92tG3F7qGD3GDypYoyj6/7JyXqVbJrx/pH3Y=
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr24751247oic.103.1621216529903;
 Sun, 16 May 2021 18:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621062577.git.siyanteng@loongson.cn> <e8a6975086ad54b5abdde2b816f6fa06dc98fcf7.1621062577.git.siyanteng@loongson.cn>
 <87f7bb59-cb85-de95-4e8d-72784686b9b9@gmail.com>
In-Reply-To: <87f7bb59-cb85-de95-4e8d-72784686b9b9@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 17 May 2021 09:55:18 +0800
Message-ID: <CAEensMydFLpmUaCHUYwQ7d_WR+HDbPboTdMAOA+H+FUqcaur_g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] docs/zh_CN: add core-api kernel-api.rst translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=8816=E6=97=A5=E5=
=91=A8=E6=97=A5 =E4=B8=8A=E5=8D=8811:30=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2021/5/15 =E4=B8=8B=E5=8D=884:10, Yanteng Si wrote:
>
> > +=E5=AE=89=E5=85=A8=E6=A1=86=E6=9E=B6
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +check the functions in security/security.c in kernel source code.
> > +   :internal:
> > +
> > +check the functions in security/inode.c in kernel source code.
> > +   :export:
> > +
> > +=E5=AE=A1=E8=AE=A1=E6=8E=A5=E5=8F=A3
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +check the functions in kernel/audit.c in kernel source code.
> > +   :export:
> > +
> > +check the functions in kernel/auditsc.c in kernel source code.
> > +   :internal:
> > +
> > +check the functions in kernel/auditfilter.c in kernel source code.
> > +   :internal:
> > +
>
> Too verbose w/o much useful info, Is the following better?
>
>   APIs in kernel code: kernel/audit.c, kernel/auitsc.c and kernel/auditfi=
lter.c
>
>   =E8=AF=A5 APIs =E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=
=E7=A0=81=E4=B8=AD kernel/audit.c, kernel/auitsc.c and kernel/auditfilter.c
It looks great, but in some cases, sentences that are too long have
some difficulty with a new line, and they are not neat after the new
line.
For example::

=E8=BF=99=E4=BA=9B=E5=87=BD=E6=95=B0=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=
=A0=B8=E4=BB=A3=E7=A0=81=E4=B8=AD include/asm-generic/bitops/instrumented-a=
tomic.h=EF=BC=8C
include/asm-generic/bitops/instrumented-non-atomic.h and
include/asm-generic/bitops/instrumented-lock.h
...

how about::

=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=81=
=E4=B8=AD:

kernel/audit.c
kernel/auitsc.c
kernel/auditfilter.c

=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=81=
=E4=B8=AD:

include/asm-generic/bitops/instrumented-atomic.h
include/asm-generic/bitops/instrumented-non-atomic.h
include/asm-generic/bitops/instrumented-lock.h
?

Thanks,
Yanteng
