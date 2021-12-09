Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407C9C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 07:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbhLIHJJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 02:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhLIHJJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 02:09:09 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53915C061746
        for <linux-doc@vger.kernel.org>; Wed,  8 Dec 2021 23:05:36 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id r26so7475375oiw.5
        for <linux-doc@vger.kernel.org>; Wed, 08 Dec 2021 23:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r2EegmfDqIX5F3f+moeQR8UrE5g5cr98WWIBlm48deI=;
        b=BXXSOrRPZWm4WST8XOFqn2gYGs+QUWtCm0OVBl1PPW5kwcex80jBK3+DF/hIzcFbgw
         PH6EveZ2/Pqy/64GrtjQllFYt7OpfgGvUccuZk4mX8VLP1Ebxe23hHsA/nOgFiEZVaYQ
         txF8moyMnL8XlrYL9IFKYJL02K5pktfkSVxj/GQfw3ZlpDzW4gT/mZB2memOllEtGnJQ
         UIcALDw8DCb7/rfcucxtiPuquS7Rw/JMBTQvxI36xHK+pkK28wGUhjJJwGmQ6dlHzdnq
         5GqkWCfpTmr3zN6Rj+xDQUJr1ElnE7XQuLrAhNfZumGHPkmRntTglBZfiK7uk87utYpl
         Hugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r2EegmfDqIX5F3f+moeQR8UrE5g5cr98WWIBlm48deI=;
        b=rClz0YzwwIY9ehty7oEMit+HaTMjR5dOBajX+7qgp9CZippvskg4ilQSzTM4XzS8Cr
         3RjOyWyMUbV75cbZqRvqhpc5GsWOOgeNK/nt7WZqTvnmvw5oTwEKWozJQsuCkoxlIRiF
         K+Kw7RWBLZlalEjFK9FhsQXa1WNwbko8YGBUUMgyo3SlST+PVc0s2QWfIx1B9T+tWQ9p
         QMnNwWr0DLVePMf3VCf2UIVRI2+gw4ZJLT5sDtjsVqwJZHgcTKutdb057oBFLCtHNVln
         TLJzhzQRw/JlCeKs43Oc+utM0pL54hU4cYnKjT//xEvVgt/2A9SSxgqQyXYzYn3Dx57A
         cjAA==
X-Gm-Message-State: AOAM530vlpPiYxrGWxVnjegbMZfXWh7Z6UCAd4ixj8bytTK1qXU1j9S7
        DuDRdpMvi+UH/K7r0+QtJZKQU6MJzWP67mLEAkaAlTcNH94=
X-Google-Smtp-Source: ABdhPJwYtDPHm2bvZYpmdXwIzdi+Q/ykCaeCRoz68JxwYvV6dFB1cXwoZFekA7c0slE2Mqqp24++lYX4n3281hjzwbo=
X-Received: by 2002:aca:61c6:: with SMTP id v189mr3934588oib.103.1639033535735;
 Wed, 08 Dec 2021 23:05:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638706875.git.siyanteng@loongson.cn> <6976a61ec50f837f482751c427af8598b30cc497.1638706875.git.siyanteng@loongson.cn>
 <87tufl39dj.fsf@meer.lwn.net>
In-Reply-To: <87tufl39dj.fsf@meer.lwn.net>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 9 Dec 2021 15:05:24 +0800
Message-ID: <CAEensMw0=ANs+=ZzJ5xdGcP6veatzHek++tcd7vcCmHYvyFmsg@mail.gmail.com>
Subject: Re: [PATCH 01/11] docs/driver-api: Reformatting serial ngsm
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2021=E5=B9=B412=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=BA=8C 01:56=E5=86=99=E9=81=93=EF=BC=9A
>
> Yanteng Si <siyanteng01@gmail.com> writes:
>
> > Added necessary indents and blank lines, optimized typography in html d=
ocuments.eg:
> >
> >  "1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl. 1.=
4 obtain base gsmtty number for the used serial port."
> >
> > Here's what they should have looked like:
> >
> >  1.3 configure the mux using GSMIOC_GETCONF / GSMIOC_SETCONF ioctl.
> >
> >  1.4 obtain base gsmtty number for the used serial port.
> >
> > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > ---
> >  Documentation/driver-api/serial/n_gsm.rst | 246 +++++++++++-----------
> >  1 file changed, 126 insertions(+), 120 deletions(-)
>
> So that is a huge diffstat for just having inserted some blank lines and
> such.  What did you do that makes it appear that so many lines have been
> changed?  What change in the code sample, for example?
oops, I will fix it.

Thanks,
Yanteng
