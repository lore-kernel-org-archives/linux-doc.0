Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3058C4361A
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:31:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91B9C64EEC
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:31:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348048AbhCDAbW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353181AbhCDADc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Mar 2021 19:03:32 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8D6C0613A5
        for <linux-doc@vger.kernel.org>; Wed,  3 Mar 2021 15:53:35 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id m25so15057998oie.12
        for <linux-doc@vger.kernel.org>; Wed, 03 Mar 2021 15:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cilium-io.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sJfUpwC5Q0AujFJkQ3bJRLWkfqFnVs4ZYKg21LJVuHE=;
        b=BFIWZ0u0+EF/YC1mA2Nchh2NeUUfh8mRSTWelXDcFLQm2vG0MPevPcPuTWmYwx4XeL
         1Xk+DQKrHnBz+sIjKI+ng4AK1/SgOuS6H+lXZPHBmnv0SNp8K6ZxJhG3ujg2ZeAJ2wwP
         d7F0hjQDdtCyevlcdjFr21rzFqYI/oWOvVzQ/mcUuAwV3ELOANllu1vNL2cwfRMCILdX
         1NKZHPNvRopqcWZD+RWrXQ9cw22ho6Mwsbg1ilG7UEz+4/MGONLMrpFxX+kz0LwJeJj2
         kZ7gUkarr8Usb0SLVN6UGeUgC2zXh+t4KgzmJD02xc4AwN5+e/9xJfZOFU7VpPwhA/Sk
         eJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sJfUpwC5Q0AujFJkQ3bJRLWkfqFnVs4ZYKg21LJVuHE=;
        b=ifrxFuM2aPKBJGRh1uOIvPG+enacsuquOLIWIz3YeitBkkiYSuhaSdXAHZUuQ0bRTx
         EzXhzusgPtt6vVRyWvTOs2iBnOI7zsqrltEoEmSO+X/wGytNQ5Tmdc892pw4XWEhBRFr
         QC3tFb8nUqiNliGYeP/qPbaFOcA6e21wmIVPhjNIhieBbm0mpg7iAjYpz+MEyamz0VtD
         fgPMX3BymOqB+oH9F1/jkLCIMuOMWT2lwcDV+1YhkA6NzKZlV6JNIaNoElgvSN7u1Eab
         GCF8wSSBYTE4CyaQ+1ji8wMzZVGqFU4CzIFE4Al2RkB5/+fmkCERWFz3cnDscQ68FE/N
         quCA==
X-Gm-Message-State: AOAM530Nxag3GvXlrZGSvpTxMcwiSQnRhZ4cviXjFK2kzGOAAU0r7nOU
        GrTmFeU+h3KZmdbUru7fIHnQS7F30pVK3uzLaSHijQ==
X-Google-Smtp-Source: ABdhPJxVhvbmRStq/JhsuTAFe5elO14d19je73tPaRLSxCTShXmLatgreMOoyRO4L0xaC9DGZmlwi8aJuYsRDzPNKKo=
X-Received: by 2002:aca:f50d:: with SMTP id t13mr1041539oih.89.1614815615117;
 Wed, 03 Mar 2021 15:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20210302171947.2268128-1-joe@cilium.io> <20210302171947.2268128-7-joe@cilium.io>
 <79954d84-ad75-8f91-118c-0ce2150a1c96@fb.com>
In-Reply-To: <79954d84-ad75-8f91-118c-0ce2150a1c96@fb.com>
From:   Joe Stringer <joe@cilium.io>
Date:   Wed, 3 Mar 2021 15:53:24 -0800
Message-ID: <CADa=RyzgsEsRpED34Bi141216de9ecbSUw7M+349wtDDKVy2dw@mail.gmail.com>
Subject: Re: [PATCHv2 bpf-next 06/15] bpf: Document BPF_PROG_TEST_RUN syscall command
To:     Yonghong Song <yhs@fb.com>
Cc:     Joe Stringer <joe@cilium.io>, bpf <bpf@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        Quentin Monnet <quentin@isovalent.com>,
        Lorenz Bauer <lmb@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 3, 2021 at 12:29 PM Yonghong Song <yhs@fb.com> wrote:
>
>
>
> On 3/2/21 9:19 AM, Joe Stringer wrote:
> > Based on a brief read of the corresponding source code.
> >
> > Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> > Reviewed-by: Quentin Monnet <quentin@isovalent.com>
> > Signed-off-by: Joe Stringer <joe@cilium.io>
>
> Acked-by: Yonghong Song <yhs@fb.com>
>
> > ---
> >   include/uapi/linux/bpf.h | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> > index a8f2964ec885..a6cd6650e23d 100644
> > --- a/include/uapi/linux/bpf.h
> > +++ b/include/uapi/linux/bpf.h
> > @@ -306,14 +306,22 @@ union bpf_iter_link_info {
> >    *
> >    * BPF_PROG_TEST_RUN
> >    *  Description
> > - *           Run an eBPF program a number of times against a provided
> > - *           program context and return the modified program context a=
nd
> > - *           duration of the test run.
> > + *           Run the eBPF program associated with the *prog_fd* a *rep=
eat*
> > + *           number of times against a provided program context *ctx_i=
n* and
> > + *           data *data_in*, and return the modified program context
> > + *           *ctx_out*, *data_out* (for example, packet data), result =
of the
> > + *           execution *retval*, and *duration* of the test run.
>
> FYI, Lorenz's BPF_PROG_TEST_RUN support for sk_lookup program
> requires data_in and data_out to be NULL. Not sure whether it is
> worthwhile to specially mention here or not. The patch has not
> been merged but close.
>
> https://lore.kernel.org/bpf/20210301101859.46045-1-lmb@cloudflare.com/

Not sure how close either series is but I'm sure between Lorenz & I we
can figure out how to fix this up. If I need to respin the series and
Lorenz's one is in by then, I'll fix it up but it's not the end of the
world to send an extra dedicated patch for this.
