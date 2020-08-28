Return-Path: <SRS0=skC6=CG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF60C433E6
	for <linux-doc@archiver.kernel.org>; Fri, 28 Aug 2020 08:41:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E973C2086A
	for <linux-doc@archiver.kernel.org>; Fri, 28 Aug 2020 08:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3nMQOdr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgH1IlQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Aug 2020 04:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgH1IlO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Aug 2020 04:41:14 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E415C061264
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2020 01:41:14 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id d18so421292iop.13
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2020 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rv9t9DBMT4Y9Uv16M/8E2uBNqN9bviSqC1cfMDj55qk=;
        b=O3nMQOdrhgjp6pS91SYY1V/rXLQgfKSIVRfsltF1r3lM5xYWjM/3hPwTifUchnhBE+
         cmbau7uFPuSgsqd/68IVYDK4FHCm/lfYzfVg7K3e29J6HZ6Ef1Or2+6wluD1hkRq+2G0
         1ETSdruDkdU8FyzBQy4yjKSi/XyjlcyJgmQwyMU+SRCQ37xSkwnHvj1VSa7xU7QgARj9
         3A8yLY3Uu7pCN85wgCo5cUUCkbvCXdpjcDjyqKk9y9MFvw7HBi6+VnGTKC1fSUswjwCB
         K05hk9A2PKgFCMDBkCbnIDXWedvJ9QXfAZMkzqsR+m4YX7no1t8v3O4O0dwtCM5cSRGQ
         l2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rv9t9DBMT4Y9Uv16M/8E2uBNqN9bviSqC1cfMDj55qk=;
        b=f1iFsDHxhkhwRhbnNx6ansYxgPFmJ6eosUBGy2zYsKoeA8RDAnlsvswlM7jyNAiwzZ
         sB8V+RZdEHvLahreTR7Gym4HwLBPz77gYFwya8pUlrpCMXKJxdb9yRAmMNiYvS+94WV6
         ig8BFBFvcaG5i+hlMP1KDlVR4D4XBrG4Rb40yqrDVdMfadsXwY1cip1y+t0W+zVWvcSd
         c9hD0VRxfseIkoYoHdNAWgHx0KsXl3RC4u7A/YrPysAy5oZs9CPg+5B2RIdFAf1ob0wf
         l1/+PhnE/TDpRaRp9Xjg16HU0UeFDxSitMJLSLyJVroQEGpCZelnRAXwsd6jleVFmcLv
         AKtg==
X-Gm-Message-State: AOAM533pHO+6D0vmpISbjN889D8EIkB/9DFapqY6WYJxn71qA+ORzZO3
        WJtN4ipQLmjZ0946G5d88VskPUeWnQfPr5rPLQ==
X-Google-Smtp-Source: ABdhPJxIX0fJi9w6dYvAGIo8yULiAYghXMHvu5eHGaixZLaaGSv3j99yakmktgVk8wFUKdTWYhT3m0gbG/uomOq1HDA=
X-Received: by 2002:a5e:9e0a:: with SMTP id i10mr455714ioq.41.1598604073846;
 Fri, 28 Aug 2020 01:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <1597241133-3630-1-git-send-email-kernelfans@gmail.com> <50ccd1aa-797f-bc97-d675-8d6732d9ae06@arm.com>
In-Reply-To: <50ccd1aa-797f-bc97-d675-8d6732d9ae06@arm.com>
From:   Pingfan Liu <kernelfans@gmail.com>
Date:   Fri, 28 Aug 2020 16:41:02 +0800
Message-ID: <CAFgQCTvy0UGq73AxBmGKPNZATRRggGLkSqksXJaz_-ZOj2YCrg@mail.gmail.com>
Subject: Re: [PATCH] arm(64)/kvm: improve the documentation about HVC calls
To:     James Morse <james.morse@arm.com>
Cc:     kvmarm@lists.cs.columbia.edu, Russell King <linux@armlinux.org.uk>,
        Marc Zyngier <maz@kernel.org>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 27, 2020 at 2:10 AM James Morse <james.morse@arm.com> wrote:
>
> Hi Pingfan,
>
> On 12/08/2020 15:05, Pingfan Liu wrote:
> > Both arm and arm64 kernel entry point have the following prerequisite:
> >   MMU = off, D-cache = off, I-cache = dont care.
> >
> > HVC_SOFT_RESTART call should meet this prerequisite before jumping to the
> > new kernel.
>
> I think you have this the wrong way up. This should describe what HVC_SOFT_RESTART does.
Yes, it is a wrong way.

>
> We want to remove some extra work kexec does on arm64, and both implementations of
> HVC_SOFT_RESTART on arm64 already do what we need. The change here should be to document
> that the D/I bits are cleared after a HVC_SOFT_RESTART on arm64.
>
>
> > Furthermore, on arm64, el2_setup doesn't set I+C bits and keeps EL2 MMU
> > off, and KVM resets them when its unload. These are achieved by
> > HVC_RESET_VECTORS call.
> >
> > Improve the document.
>
>
> > diff --git a/Documentation/virt/kvm/arm/hyp-abi.rst b/Documentation/virt/kvm/arm/hyp-abi.rst
> > index d9eba93..a95bc30 100644
> > --- a/Documentation/virt/kvm/arm/hyp-abi.rst
> > +++ b/Documentation/virt/kvm/arm/hyp-abi.rst
> > @@ -40,9 +40,9 @@ these functions (see arch/arm{,64}/include/asm/virt.h):
> >
> >  * ::
> >
> > -    r0/x0 = HVC_RESET_VECTORS
> > +    x0 = HVC_RESET_VECTORS (arm64 only)
> >
> > -  Turn HYP/EL2 MMU off, and reset HVBAR/VBAR_EL2 to the initials
> > +  Disable HYP/EL2 MMU and D-cache, and reset HVBAR/VBAR_EL2 to the initials
> >    stubs' exception vector value. This effectively disables an existing
> >    hypervisor.
>
> I don't think we should remove this. KVM on 32bit was the only implementer, but if there
> ever is another, this is how it should work.
>
>
> > @@ -54,7 +54,7 @@ these functions (see arch/arm{,64}/include/asm/virt.h):
> >      x3 = x1's value when entering the next payload (arm64)
> >      x4 = x2's value when entering the next payload (arm64)
> >
> > -  Mask all exceptions, disable the MMU, move the arguments into place
> > +  Mask all exceptions, disable the MMU and D-cache, move the arguments into place
> >    (arm64 only), and jump to the restart address while at HYP/EL2. This
> >    hypercall is not expected to return to its caller.
>
> (I don't think disable the D-cache is what the bit does, it forces the attributes that are
> used for a data access).
>
> Please just describe this as the on arm64 the D and I bits are cleared.
OK, I will do it.

> (it might be true on 32bit, I can't work the assembly out).
I will leave 32bit as it is.

Thanks,
Pingfan
