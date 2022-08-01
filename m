Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D101C19F2C
	for <linux-doc@archiver.kernel.org>; Mon,  1 Aug 2022 22:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235437AbiHAWdu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Aug 2022 18:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235426AbiHAWdl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 18:33:41 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5359B2228E
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 15:33:39 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u9so14603831oiv.12
        for <linux-doc@vger.kernel.org>; Mon, 01 Aug 2022 15:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LI7JfBTHXcIfr/9UgMaMzqcZcXHkE1NiQIHzTU9OMbY=;
        b=cF+PM2YAd/AUT5qzQ0nJgW7ok1vFg9j5ZWOyJvGxFUYr7Zvy6AanzGkLbB529Gl+Qc
         YO0AcazHdcSnFyDrtq047WoUQLzvGI1DZh5TKK7xC0VpxBOn4CICGP0cnP5x/zklP9Qi
         99CZwd4H+SfwuCwqCcvmMHs1IXVcieCMIfit0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LI7JfBTHXcIfr/9UgMaMzqcZcXHkE1NiQIHzTU9OMbY=;
        b=s4wgVrGxXpW3mUmY5XynfLKaZK77/KnD55Gyuon+saEqO5PaLz8HwWURfMZZKm64k8
         s8EIXDvrBQ1iAdxyePUvVk91ed48oaVahP2wnrQnkl5ul63A9SSpyMqYyqpTnrb/Uz2Q
         iGuoRPO32xMPdCAErmSFSMaTw3D27AtMfVA5x6lNR0khsZk0IUdnxw6HNViXcVFCJILD
         PCynpkXvfKkl6W1MqgGx5VDCygCg2uFusQpZeYPKCS1lO5sgFV0SdUbIhRtTk4a/4Avj
         ljJzk4s1SzTpG6CIeUXKrRN3mH1FsXigVbFI+VUS9C+bdCofZJ/xLPZ95XvlgxiiyXS+
         VWZg==
X-Gm-Message-State: AJIora9ow9709RFtsbQ6rEJZMP1AZZfsNWxwR0gUA+l/Y4dQGvQadPm5
        Qt92ifjw3tqEC41jTzPFjb1yJbol+9FrUA==
X-Google-Smtp-Source: AGRyM1uA/P6CsCRLbRC6Sy5b/JVo8KlixZQazamKa7L5gFftxQCaRnTuL3esLehiKkFUdm1IW9kOow==
X-Received: by 2002:a05:6808:1520:b0:33a:9e5c:d323 with SMTP id u32-20020a056808152000b0033a9e5cd323mr7072687oiw.210.1659393218354;
        Mon, 01 Aug 2022 15:33:38 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id el31-20020a056870f69f00b0010e3f390ecasm3369526oab.16.2022.08.01.15.33.38
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 15:33:38 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-10cf9f5b500so15342531fac.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Aug 2022 15:33:38 -0700 (PDT)
X-Received: by 2002:a05:6808:14d4:b0:33b:1489:8752 with SMTP id
 f20-20020a05680814d400b0033b14898752mr7607300oiw.174.1659393206929; Mon, 01
 Aug 2022 15:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220504232102.469959-1-evgreen@chromium.org> <20220506160807.GA1060@bug>
 <CAE=gft6m75T0UC2DBhfFhuSMW6TK7aatD_04sQ18WosgGVsATw@mail.gmail.com>
 <CAJZ5v0gxq=EA_WWUiCR_w8o87iTHDR7OC5wi=GRBaAQS2ofd5w@mail.gmail.com>
 <CAE=gft6V6RLc-d4AOuRUVU2u1jMGghDRSrFqiCqMCLxemui8Pw@mail.gmail.com> <CAE=gft5OYAgosqmwNkk=Cwoooeg93Njmnzfz=gwCaLB0Ts+=sw@mail.gmail.com>
In-Reply-To: <CAE=gft5OYAgosqmwNkk=Cwoooeg93Njmnzfz=gwCaLB0Ts+=sw@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 1 Aug 2022 15:32:50 -0700
X-Gmail-Original-Message-ID: <CAE=gft6sPkhNcz7+fJuDzQo2f8fM_0Wv_OWC9W2LyvXd6M6zeQ@mail.gmail.com>
Message-ID: <CAE=gft6sPkhNcz7+fJuDzQo2f8fM_0Wv_OWC9W2LyvXd6M6zeQ@mail.gmail.com>
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

On Thu, Jun 16, 2022 at 8:42 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Tue, May 17, 2022 at 10:34 AM Evan Green <evgreen@chromium.org> wrote:
> >
> > Hi Rafael,
> >
> > On Tue, May 17, 2022 at 9:06 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Mon, May 9, 2022 at 6:44 PM Evan Green <evgreen@chromium.org> wrote:
> > > >
> > > > On Fri, May 6, 2022 at 9:08 AM Pavel Machek <pavel@ucw.cz> wrote:
> > > > >
> > > > > Hi!
> > > > >
> > > > > > We are exploring enabling hibernation in some new scenarios. However,
> > > > > > our security team has a few requirements, listed below:
> > > > > > 1. The hibernate image must be encrypted with protection derived from
> > > > > >    both the platform (eg TPM) and user authentication data (eg
> > > > > >    password).
> > > > > > 2. Hibernation must not be a vector by which a malicious userspace can
> > > > > >    escalate to the kernel.
> > > > >
> > > > > Can you (or your security team) explain why requirement 2. is needed?
> > > > >
> > > > > On normal systems, trusted userspace handles kernel upgrades (for example),
> > > > > so it can escalate to kernel priviledges.
> > > > >
> > > >
> > > > Our systems are a little more sealed up than a normal distro, we use
> > > > Verified Boot [1]. To summarize, RO firmware with an embedded public
> > > > key verifies that the kernel+commandline was signed by Google. The
> > > > commandline includes the root hash of the rootfs as well (where the
> > > > modules live). So when an update is applied (A/B style, including the
> > > > whole rootfs), assuming the RO firmware stayed RO (which requires
> > > > physical measures to defeat), we can guarantee that the kernel,
> > > > commandline, and rootfs have not been tampered with.
> > > >
> > > > Verified boot gives us confidence that on each boot, we're at least
> > > > starting from known code. This makes it more challenging for an
> > > > attacker to persist an exploit across reboot. With the kernel and
> > > > modules verified, we try to make it non-trivial for someone who does
> > > > manage to gain root execution once from escalating to kernel
> > > > execution. Hibernation would be one obvious escalation route, so we're
> > > > hoping to find a way to enable it without handing out that easy
> > > > primitive.
> > > >
> > > > [1] https://www.chromium.org/chromium-os/chromiumos-design-docs/verified-boot/
> > >
> > > So I guess this really is an RFC.
> >
> > Yes, I suppose it is.
> >
> > >
> > > Honestly, I need more time to go through this and there are pieces of
> > > it that need to be looked at other people (like the TPM-related
> > > changes).
> >
> > No problem, thanks for the reply to let me know. I expect some back
> > and forth in terms of what should be hidden behind abstractions and
> > where exactly things should live. But I wanted to get this out to
> > upstream as early as I could, just to get initial reactions on the
> > overall concept and design. Looking forward to hearing your thoughts
> > when you get a chance, and let me know if there are others I should be
> > adding that I've missed.
>
> Gentle bump in case this dropped off of radars, I'd still appreciate
> any feedback folks had on this series.

One more bump here, as we'd really love to get encrypted hibernation
to a form upstream would accept if at all possible. We were
considering landing this in our Chrome OS tree for now, then coming
back in a couple months with a "we've been baking this ourselves and
it's going so great, oooh yeah". I'm not sure if upstream would find
that compelling or not. But in any case, some guidance towards making
this more upstream friendly would be well appreciated.

One thing I realized in attempting to pick this myself is that the
trusted key blob format has moved to ASN.1. So I should really move
the creation ticket to the new ASN.1 format (if I can figure out the
right OID for that piece), which would allow me to drop a lot of the
ugly stuff in tpm2_unpack_blob(). Maybe if I get no other comments
I'll work on that and resend.

-Evan
