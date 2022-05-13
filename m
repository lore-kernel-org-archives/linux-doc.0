Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4176DC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 13 May 2022 03:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376744AbiEMDvQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 23:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376813AbiEMDuy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 23:50:54 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC00624F
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 20:50:49 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id c22-20020a4ad216000000b0035f13ae7646so2504622oos.9
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 20:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mPYVRQJ3KtRd/5hxYP29jNpNRSc6Jp59FqIYzhOqd1M=;
        b=K4s3gtmiKAy6Wr3Hi7/dyuWMLJQ68rvmjcX+TiIHR5UrAl0xw99fjetBgRnTod5Ggv
         +o1WIV2fdnYlnTPmvG7x3GB3WtU0V3a2jul/mAwsYZNK4XligHFDze3EzOEdk9z+pG5y
         XzNVkL1ojJb1ROdHxH73QjcV6N7ZT3A30nRRPlPsNRvHEfCL/mu5eJCryNvLRsFA8APp
         6UUVtz/7Xy/zoYJSasRJAZCVkQfk0t+i+SmnURivBrQ5MSUUlKBa2pYaNp186yuCFBM5
         vrJozt6+Ks2AvyJV2Mfap3sW3o21n0DMIp11+GoWZ5Vb64TDgahD1DzeewknvUHxyIm+
         v8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mPYVRQJ3KtRd/5hxYP29jNpNRSc6Jp59FqIYzhOqd1M=;
        b=mexJerzyrUtME5nv3uZyRHg2cLGayHb6wN77DeUExhzQaOZ9V26Gc+S1yH1xQp3jdD
         qvohq5+BkfnArgaZ/ydgCX8W+YcLxhrZ03EGAeXjQbbb5hfCQWcUDrjjFxx9ov1VwFa8
         tc9b4N6ofb1t2JPhyofCIvsgeVTzN8h1g42PkME6+XPLCg2U747mpQUwxRmMECp4JMwy
         1sTHp+H4ZixkLPP0iKp174rYySmgejYjJFMcD6tfHbnUX/AdXlY2oT+8/OePBcPFrsk7
         x/MRlGbdENUVrC+QqwVE0kzNcx73qIjtMz64LzlecTsmI109mp6JMhOW56JlIEANQOZR
         1uJA==
X-Gm-Message-State: AOAM532OtSRrY9Yx8jrw8csbUZzBtsi7kPg4HCbx7VYmM/Fqy0AeVIvw
        rRbsXwvig6jr7iiBBwpnVHSf5QRx9eumDKEkMbYBCQ==
X-Google-Smtp-Source: ABdhPJwICkMlcUIyQFOuifhC0oD51/apqELrYwGehKJg/6ZjGNhvWlasNEJ4mHhProIjJV5t5Z0u2vNXx1zaJapzcbc=
X-Received: by 2002:a4a:d40d:0:b0:33a:33be:9c1e with SMTP id
 n13-20020a4ad40d000000b0033a33be9c1emr1198631oos.96.1652413847699; Thu, 12
 May 2022 20:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220512184514.15742-1-jon@nutanix.com> <Yn1fjAqFoszWz500@google.com>
 <Yn1hdHgMVuni/GEx@google.com> <07BEC8B1-469C-4E36-AE92-90BFDF93B2C4@nutanix.com>
 <Yn1o9ZfsQutXXdQS@google.com> <CALMp9eRQv6owjfyf+UO=96Q1dkeSrJWy0i4O-=RPSaQwz0bjTQ@mail.gmail.com>
 <C39CD5E4-3705-4D1A-A67D-43CBB7D1950B@nutanix.com> <CALMp9eRXmWvrQ1i0V3G738ndZOZ4YezQ=BqXe-BF2b4GNo1m3Q@mail.gmail.com>
 <DEF8066B-E691-4C85-A19A-9F5222D1683D@nutanix.com> <CALMp9eTwH9WVD=EuTXeu1KYAkAUuXdnmA+k9dti7OM+u=kLKHQ@mail.gmail.com>
 <CD2EB6FA-E17F-45BA-AC70-92CCB12A16C4@nutanix.com>
In-Reply-To: <CD2EB6FA-E17F-45BA-AC70-92CCB12A16C4@nutanix.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Thu, 12 May 2022 20:50:36 -0700
Message-ID: <CALMp9eQAFz_wzC_SMiWD5KqP3=m+VceP=+6=RWEFbN2m7P7d+w@mail.gmail.com>
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

On Thu, May 12, 2022 at 8:19 PM Jon Kohler <jon@nutanix.com> wrote:
>
>
>
> > On May 12, 2022, at 11:06 PM, Jim Mattson <jmattson@google.com> wrote:
> >
> > On Thu, May 12, 2022 at 5:50 PM Jon Kohler <jon@nutanix.com> wrote:
> >
> >> You mentioned if someone was concerned about performance, are you
> >> saying they also critically care about performance, such that they are
> >> willing to *not* use IBPB at all, and instead just use taskset and hop=
e
> >> nothing ever gets scheduled on there, and then hope that the hyperviso=
r
> >> does the job for them?
> >
> > I am saying that IBPB is not the only viable mitigation for
> > cross-process indirect branch steering. Proper scheduling can also
> > solve the problem, without the overhead of IBPB. Say that you have two
> > security domains: trusted and untrusted. If you have a two-socket
> > system, and you always run trusted workloads on socket#0 and untrusted
> > workloads on socket#1, IBPB is completely superfluous. However, if the
> > hypervisor chooses to schedule a vCPU thread from virtual socket#0
> > after a vCPU thread from virtual socket#1 on the same logical
> > processor, then it *must* execute an IBPB between those two vCPU
> > threads. Otherwise, it has introduced a non-architectural
> > vulnerability that the guest can't possibly be aware of.
> >
> > If you can't trust your OS to schedule tasks where you tell it to
> > schedule them, can you really trust it to provide you with any kind of
> > inter-process security?
>
> Fair enough, so going forward:
> Should this be mandatory in all cases? How this whole effort came
> was that a user could configure their KVM host with conditional
> IBPB, but this particular mitigation is now always on no matter what.
>
> In our previous patch review threads, Sean and I mostly settled on making
> this particular avenue active only when a user configures always_ibpb, su=
ch
> that for cases like the one you describe (and others like it that come up=
 in
> the future) can be covered easily, but for cond_ibpb, we can document
> that it doesn=E2=80=99t cover this case.
>
> Would that be acceptable here?

That would make me unhappy. We use cond_ibpb, and I don't want to
switch to always_ibpb, yet I do want this barrier.

> >
> >> Would this be the expectation of just KVM? Or all hypervisors on the
> >> market?
> >
> > Any hypervisor that doesn't do this is broken, but that won't keep it
> > off the market. :-)
>
> Very true :)
>
