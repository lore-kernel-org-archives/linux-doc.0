Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38A6C43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E51022228
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X04ds4sw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgJML3C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgJML3B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 07:29:01 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63BE1C0613D2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2020 04:29:01 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f21so20035061ljh.7
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2020 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0fe/rUPknWKjJHQfNjjMwuy0QlI3MJO2qD6YuDAy3qE=;
        b=X04ds4sw8SJNth6bHlu9JhQBVORr5yXBEE2b8Ov6oelmRazUaaNvD13K/TWOr7gyQd
         JtSzTS0gJ58yo0XSpqWYK1jQHHs/1WMjRF3P1PTENrCFQnIpZ5LiVmcWjBwm9T+zuUW2
         SObFz5u+I6H+0434419wjVX6I/i1yL21PJbuy64REF65mLZ1WpcTPD35PS+JZGo92Aob
         y7O2v7+WQ3tMF6CnPEJ6hDtes809zD5L1gVi2BClPDgRPJuYgAoZ+OVqNAzmgAcalLmv
         x31cXMyUTmcv177luuQPMuZSOZ0Nom9Ci2+XWlhVqB1ZJJtUZ5FN0hrOTB5f9PgVV+6l
         pixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fe/rUPknWKjJHQfNjjMwuy0QlI3MJO2qD6YuDAy3qE=;
        b=ml2p4cXt5xL6cxbzO1qi9xOs6L/yDMPqFhVqbMcSjF9vmMc6OnJbqJo797oIxQjhak
         gFN1IKO0EU4Jx3FoSwm0tLc+a8rpBkkxOyJNVgEhY5clZH3OGoSc97hEbHhkAKFN+K45
         95a/fqr+9wJIDSMeAU4ZfvHGZNFTdo23JlaWykdgBJ/PRQrmMYRV03oLK6MPAz11qA9q
         wpgZB5QV5SJapxixnPmgHwo/7DCjBrPHyOTfQIcWkhxEhkSNEg1fRA1VOqbSYevNChSW
         trslDj3e+sPOSpF5DtchrBCGeFyzpVPQmyedAo/X7/uortjOsZe5bu+L4L1p/tf83m8L
         WPrQ==
X-Gm-Message-State: AOAM532zPDn/131X+eJz2VXGj16YI8Y+y3aQyG9n9y8WIPFh0NZTHL7F
        8vl0eUa/66Hh8wdw/hrxt0ZiC3RKHK2roLao1tBvrA==
X-Google-Smtp-Source: ABdhPJxOlDao8AKCPBsqF7gTeRCRcVgwmk5ldXZOHlGJBEkPdQNH+RZ2Xsbw1swjy/dOe6vjwFkeKOoQY7F5HG7Wnf4=
X-Received: by 2002:a2e:9d8d:: with SMTP id c13mr11367812ljj.339.1602588538772;
 Tue, 13 Oct 2020 04:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <1602065268-26017-1-git-send-email-sumit.garg@linaro.org>
 <1602065268-26017-5-git-send-email-sumit.garg@linaro.org> <20201013022157.GA47751@linux.intel.com>
In-Reply-To: <20201013022157.GA47751@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 13 Oct 2020 16:58:47 +0530
Message-ID: <CAFA6WYO6zNKtxhpNpTpqAjZnMPrEygs1k7Gwg3hwJV8Ynrr=qQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] MAINTAINERS: Add entry for TEE based Trusted Keys
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Janne Karhunen <janne.karhunen@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Markus Wamser <Markus.Wamser@mixed-mode.de>,
        Luke Hinds <lhinds@redhat.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Oct 2020 at 07:52, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Wed, Oct 07, 2020 at 03:37:48PM +0530, Sumit Garg wrote:
> > Add MAINTAINERS entry for TEE based Trusted Keys framework.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 48aff80..eb3d889 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9663,6 +9663,14 @@ F:     include/keys/trusted-type.h
> >  F:   include/keys/trusted_tpm.h
> >  F:   security/keys/trusted-keys/
> >
> > +KEYS-TRUSTED-TEE
> > +M:   Sumit Garg <sumit.garg@linaro.org>
> > +L:   linux-integrity@vger.kernel.org
> > +L:   keyrings@vger.kernel.org
> > +S:   Supported
> > +F:   include/keys/trusted_tee.h
> > +F:   security/keys/trusted-keys/trusted_tee.c
> > +
> >  KEYS/KEYRINGS
> >  M:   David Howells <dhowells@redhat.com>
> >  M:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > --
> > 2.7.4
>
> I'm sorry but I think I have changed my mind on this. This has been
> spinning for a while and sometimes conclusions change over the time.
>
> I don't think that we really need a separate subsystem tag.

I don't see it as a separate subsystem but rather a kind of underlying
trust source (TEE) driver plugged into existing trusted keys
subsystem. We could relate it to the RNG subsystem as well where there
is a subsystem maintainer and specific driver maintainers.

IMO, having a dedicated entry like this brings clarity in maintenance
and in future we may have more trust sources like this added where
everyone may not have access to all the trust sources to test.

> I'd be for a
> new M-entry or R-entry to the existing subsystem tag. It's essential to
> have ack from someone with ARM and TEE knowledge but this way too heavy
> for the purpose.

If you still think otherwise then I am fine with a new M-entry for
existing trusted keys subsystem as well.

>
> I also see it the most manageable if the trusted keys PR's come from a
> single source.

I echo here with you to have a single source for trusted keys PR's
irrespective of whether we go with a separate trust source entry or
update existing subsystem entry.

-Sumit

>
> /Jarkko
