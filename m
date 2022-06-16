Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B458ACCA47E
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 15:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238597AbiFPPnf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 11:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbiFPPne (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 11:43:34 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4EB193FB
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 08:43:33 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-fe51318ccfso2386277fac.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/gQbIaU17eRw5sO/hecNb5FpluiGnQGygV2egDmXIIk=;
        b=ehE/gd4tah9jS/e8Ze0l+xwI3htCbpaNOqoUJX7AbepMSAJB7sjMCvDJmqYls5FM/e
         F+y7gfLeUntwqRbT824JObmT4UsnMPnZepY+gdttD59wtsyHuqRPnFlASHQpgPMKidRb
         BCO5iBlThav5VCTLbd9PY0Av71Kt15RjOCU8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/gQbIaU17eRw5sO/hecNb5FpluiGnQGygV2egDmXIIk=;
        b=nrzY6GcwMOdYM4XXaA94gVTvyZsP5tCxes2SrvULDeKtGwMkxVPui37+A0Ivy0XW7N
         xhvFP4f4AvUhSl++HAQ5mWzFHY6yyR+bAbhEnCkVh/CsECw1UdmWNmB4LW3G3UDyLhSg
         EqapZ2QMUNabClnEyA2M2JlAEuCFRm715P6HWIRG15qDZsM8n8R6aEaQPTZyXquapPYO
         j9pZIPbNogRsu1EfN20aRSG6IcEvqwPTtpr/wLMiL6/gGfgeqK+STtGT9vWZNE2RSZP7
         NnjIHpXIHeoW2vv8nKKgnfgZO/VeWw7WYMe0wYNSdOmRi++MPr4MI9zSbIzQRB6XEjbS
         wE0g==
X-Gm-Message-State: AJIora+Lksz+sLThwGp+5nXBbvhKIGWAxSzL/pn+N2Jw7bDGuM9WaOpE
        ofEaOD4rQp6IUBKmcDr6V8DkGSxanXsJjQ==
X-Google-Smtp-Source: AGRyM1uMLEA7O16lSrNavo000v7zD3kODC2QGqrOtYFoFQGeRmLxJ4cWN6vNoPn2DW2t7isvV6ab8g==
X-Received: by 2002:a05:6870:47a9:b0:f2:57ff:63a2 with SMTP id c41-20020a05687047a900b000f257ff63a2mr8613060oaq.295.1655394212039;
        Thu, 16 Jun 2022 08:43:32 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id r204-20020acaf3d5000000b0032e3ffc5513sm1000014oih.4.2022.06.16.08.43.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 08:43:31 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id k24so2336616oij.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 08:43:31 -0700 (PDT)
X-Received: by 2002:a05:6870:5247:b0:fb:2e60:26c6 with SMTP id
 o7-20020a056870524700b000fb2e6026c6mr3012759oai.241.1655394200150; Thu, 16
 Jun 2022 08:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220504232102.469959-1-evgreen@chromium.org> <20220506160807.GA1060@bug>
 <CAE=gft6m75T0UC2DBhfFhuSMW6TK7aatD_04sQ18WosgGVsATw@mail.gmail.com>
 <CAJZ5v0gxq=EA_WWUiCR_w8o87iTHDR7OC5wi=GRBaAQS2ofd5w@mail.gmail.com> <CAE=gft6V6RLc-d4AOuRUVU2u1jMGghDRSrFqiCqMCLxemui8Pw@mail.gmail.com>
In-Reply-To: <CAE=gft6V6RLc-d4AOuRUVU2u1jMGghDRSrFqiCqMCLxemui8Pw@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 16 Jun 2022 08:42:43 -0700
X-Gmail-Original-Message-ID: <CAE=gft5OYAgosqmwNkk=Cwoooeg93Njmnzfz=gwCaLB0Ts+=sw@mail.gmail.com>
Message-ID: <CAE=gft5OYAgosqmwNkk=Cwoooeg93Njmnzfz=gwCaLB0Ts+=sw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Encrypted Hibernation
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mgarrett@aurora.tech>,
        Daniil Lunev <dlunev@google.com>, zohar@linux.ibm.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-integrity@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Gwendal Grignou <gwendal@chromium.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Hao Wu <hao.wu@rubrik.com>, James Morris <jmorris@namei.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Len Brown <len.brown@intel.com>,
        Peter Huewe <peterhuewe@gmx.de>,
        "Serge E. Hallyn" <serge@hallyn.com>, axelj <axelj@axis.com>,
        keyrings@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 17, 2022 at 10:34 AM Evan Green <evgreen@chromium.org> wrote:
>
> Hi Rafael,
>
> On Tue, May 17, 2022 at 9:06 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Mon, May 9, 2022 at 6:44 PM Evan Green <evgreen@chromium.org> wrote:
> > >
> > > On Fri, May 6, 2022 at 9:08 AM Pavel Machek <pavel@ucw.cz> wrote:
> > > >
> > > > Hi!
> > > >
> > > > > We are exploring enabling hibernation in some new scenarios. However,
> > > > > our security team has a few requirements, listed below:
> > > > > 1. The hibernate image must be encrypted with protection derived from
> > > > >    both the platform (eg TPM) and user authentication data (eg
> > > > >    password).
> > > > > 2. Hibernation must not be a vector by which a malicious userspace can
> > > > >    escalate to the kernel.
> > > >
> > > > Can you (or your security team) explain why requirement 2. is needed?
> > > >
> > > > On normal systems, trusted userspace handles kernel upgrades (for example),
> > > > so it can escalate to kernel priviledges.
> > > >
> > >
> > > Our systems are a little more sealed up than a normal distro, we use
> > > Verified Boot [1]. To summarize, RO firmware with an embedded public
> > > key verifies that the kernel+commandline was signed by Google. The
> > > commandline includes the root hash of the rootfs as well (where the
> > > modules live). So when an update is applied (A/B style, including the
> > > whole rootfs), assuming the RO firmware stayed RO (which requires
> > > physical measures to defeat), we can guarantee that the kernel,
> > > commandline, and rootfs have not been tampered with.
> > >
> > > Verified boot gives us confidence that on each boot, we're at least
> > > starting from known code. This makes it more challenging for an
> > > attacker to persist an exploit across reboot. With the kernel and
> > > modules verified, we try to make it non-trivial for someone who does
> > > manage to gain root execution once from escalating to kernel
> > > execution. Hibernation would be one obvious escalation route, so we're
> > > hoping to find a way to enable it without handing out that easy
> > > primitive.
> > >
> > > [1] https://www.chromium.org/chromium-os/chromiumos-design-docs/verified-boot/
> >
> > So I guess this really is an RFC.
>
> Yes, I suppose it is.
>
> >
> > Honestly, I need more time to go through this and there are pieces of
> > it that need to be looked at other people (like the TPM-related
> > changes).
>
> No problem, thanks for the reply to let me know. I expect some back
> and forth in terms of what should be hidden behind abstractions and
> where exactly things should live. But I wanted to get this out to
> upstream as early as I could, just to get initial reactions on the
> overall concept and design. Looking forward to hearing your thoughts
> when you get a chance, and let me know if there are others I should be
> adding that I've missed.

Gentle bump in case this dropped off of radars, I'd still appreciate
any feedback folks had on this series.
-Evan

>
> -Evan
>
> >
> > Thanks!
