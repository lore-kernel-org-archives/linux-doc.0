Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6F8C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 13 May 2022 19:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383755AbiEMThI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 May 2022 15:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379948AbiEMThG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 May 2022 15:37:06 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21CC53E22
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 12:37:05 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id q10so11312083oia.9
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 12:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3RxQPTxtVrqqVoiaHfpMeR5z0m/4z2ervHUzJOsJZ9g=;
        b=HVDFRvfchpN7PSr7N06wi5d+LNSlIIt5soxH3QJ0+gRBVr/dSg3cRv/Kfvc+wdo32N
         pibM/02iUEue6Qxq/rOTds4X5rjrw8cvNTSdnZnzhOEgDrBLoUvFjtWAdyj7d2Fx9lmY
         pLyD/RPmCSmos2YTVv3X/wr2j4M2h77vSHOD01u8pQyumY7R6aOwyYLtD1gUssCgTSP8
         kU3Tupzqd99Tu0kb6YusiYStRndmJ1gpmeq27VqYWLNqjul+u3ecx0MnP2hZIVnL6x2B
         28OLuzcm2pIx8EfHUdyyHbuZB0sHYpa7hbo4deW3vh6/bY1itk3QrppPHft2Y5zqdWrU
         JhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3RxQPTxtVrqqVoiaHfpMeR5z0m/4z2ervHUzJOsJZ9g=;
        b=o10DSjXrTeUYCjxhiJEvn+Za3NUJAOf/GhMt0gdGZsdvH91ZkocmekB8ti8DG7olkZ
         Uou3RB8C4QCctOIfuXALGVdzslXLrljCT2W2uAL7bNjkuIITmnf0lDzQl+wvfqqQmj2d
         XFY8KbTopAMFqxIyVhQe4iMy/KEfqWVDNNZwP12UBAmFzcRt99EoNejYuiKE1ahwn52A
         NklXTFvO4lOw5LMlrTiw2YOCLwlHUlfebzXTVcsylZm766zT8evVx5td69ObG44SjSBM
         sWGGDUPSm7q4NoZ5Vo3Mf7sP4d0aTHt4R6qfOcjZORFTgDd5w7BK7uM+UM48qavvnmIG
         FyaA==
X-Gm-Message-State: AOAM533BZdr5c4hc77k030QnRKOt/PI5mTG0ZC9GZsx3yti0+8RYJUzF
        XAokDSHkzq8KM3VIcPFdgO11zEN0eaWtdHFNPzNzug==
X-Google-Smtp-Source: ABdhPJxWTRI3eJZGbOSFy6qinBe+qvnKP338Acxh4EVCUelHqXY2P0KnwIfZ1lbbLdzxg/wN7GyADeKG9zIM/k3ibQM=
X-Received: by 2002:a05:6808:2125:b0:326:b51f:bbc2 with SMTP id
 r37-20020a056808212500b00326b51fbbc2mr8695466oiw.13.1652470624894; Fri, 13
 May 2022 12:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220512184514.15742-1-jon@nutanix.com> <Yn1fjAqFoszWz500@google.com>
 <Yn1hdHgMVuni/GEx@google.com> <07BEC8B1-469C-4E36-AE92-90BFDF93B2C4@nutanix.com>
 <Yn1o9ZfsQutXXdQS@google.com> <CALMp9eRQv6owjfyf+UO=96Q1dkeSrJWy0i4O-=RPSaQwz0bjTQ@mail.gmail.com>
 <C39CD5E4-3705-4D1A-A67D-43CBB7D1950B@nutanix.com> <CALMp9eRXmWvrQ1i0V3G738ndZOZ4YezQ=BqXe-BF2b4GNo1m3Q@mail.gmail.com>
 <DEF8066B-E691-4C85-A19A-9F5222D1683D@nutanix.com> <CALMp9eTwH9WVD=EuTXeu1KYAkAUuXdnmA+k9dti7OM+u=kLKHQ@mail.gmail.com>
 <CD2EB6FA-E17F-45BA-AC70-92CCB12A16C4@nutanix.com> <CALMp9eQAFz_wzC_SMiWD5KqP3=m+VceP=+6=RWEFbN2m7P7d+w@mail.gmail.com>
 <73BC3891-34DC-4EB7-BD1C-5FD312A8F18A@nutanix.com>
In-Reply-To: <73BC3891-34DC-4EB7-BD1C-5FD312A8F18A@nutanix.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Fri, 13 May 2022 12:36:53 -0700
Message-ID: <CALMp9eTwih5dyiZkdxR3W9fpaMGQ41YYu1qM42eDZzdhnmBi5A@mail.gmail.com>
Subject: Re: [PATCH v4] x86/speculation, KVM: remove IBPB on vCPU load
To:     Jon Kohler <jon@nutanix.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Kees Cook <keescook@chromium.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kim Phillips <kim.phillips@amd.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ashok Raj <ashok.raj@intel.com>,
        KarimAllah Ahmed <karahmed@amazon.de>,
        David Woodhouse <dwmw@amazon.co.uk>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "kvm @ vger . kernel . org" <kvm@vger.kernel.org>,
        Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 13, 2022 at 8:21 AM Jon Kohler <jon@nutanix.com> wrote:
>
>
>
> > On May 12, 2022, at 11:50 PM, Jim Mattson <jmattson@google.com> wrote:
> >
> > On Thu, May 12, 2022 at 8:19 PM Jon Kohler <jon@nutanix.com> wrote:
> >>
> >>
> >>
> >>> On May 12, 2022, at 11:06 PM, Jim Mattson <jmattson@google.com> wrote=
:
> >>>
> >>> On Thu, May 12, 2022 at 5:50 PM Jon Kohler <jon@nutanix.com> wrote:
> >>>
> >>>> You mentioned if someone was concerned about performance, are you
> >>>> saying they also critically care about performance, such that they a=
re
> >>>> willing to *not* use IBPB at all, and instead just use taskset and h=
ope
> >>>> nothing ever gets scheduled on there, and then hope that the hypervi=
sor
> >>>> does the job for them?
> >>>
> >>> I am saying that IBPB is not the only viable mitigation for
> >>> cross-process indirect branch steering. Proper scheduling can also
> >>> solve the problem, without the overhead of IBPB. Say that you have tw=
o
> >>> security domains: trusted and untrusted. If you have a two-socket
> >>> system, and you always run trusted workloads on socket#0 and untruste=
d
> >>> workloads on socket#1, IBPB is completely superfluous. However, if th=
e
> >>> hypervisor chooses to schedule a vCPU thread from virtual socket#0
> >>> after a vCPU thread from virtual socket#1 on the same logical
> >>> processor, then it *must* execute an IBPB between those two vCPU
> >>> threads. Otherwise, it has introduced a non-architectural
> >>> vulnerability that the guest can't possibly be aware of.
> >>>
> >>> If you can't trust your OS to schedule tasks where you tell it to
> >>> schedule them, can you really trust it to provide you with any kind o=
f
> >>> inter-process security?
> >>
> >> Fair enough, so going forward:
> >> Should this be mandatory in all cases? How this whole effort came
> >> was that a user could configure their KVM host with conditional
> >> IBPB, but this particular mitigation is now always on no matter what.
> >>
> >> In our previous patch review threads, Sean and I mostly settled on mak=
ing
> >> this particular avenue active only when a user configures always_ibpb,=
 such
> >> that for cases like the one you describe (and others like it that come=
 up in
> >> the future) can be covered easily, but for cond_ibpb, we can document
> >> that it doesn=E2=80=99t cover this case.
> >>
> >> Would that be acceptable here?
> >
> > That would make me unhappy. We use cond_ibpb, and I don't want to
> > switch to always_ibpb, yet I do want this barrier.
>
> Ok gotcha, which I think is a good point for cloud providers, since the
> workload(s) are especially opaque.
>
> How about this: I could work up a v5 patch here where this was at minimum
> a system level knob (similar to other mitigation knobs) and documented
> In more detail. That way folks who might want more control here have the
> basic ability to do that without recompiling the kernel. Such a =E2=80=9C=
knob=E2=80=9D would
> be on by default, such that there is no functional regression here.
>
> Would that be ok with you as a middle ground?

That would be great. Module parameter or sysctl is fine with me.

Thanks!

> Thanks again,
> Jon
>
> >
> >>>
> >>>> Would this be the expectation of just KVM? Or all hypervisors on the
> >>>> market?
> >>>
> >>> Any hypervisor that doesn't do this is broken, but that won't keep it
> >>> off the market. :-)
> >>
> >> Very true :)
> >>
>
