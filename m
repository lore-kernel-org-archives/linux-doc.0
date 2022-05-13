Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E040C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 13 May 2022 03:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348597AbiEMDHF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 23:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376668AbiEMDHD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 23:07:03 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2146946168
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 20:07:02 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id s18-20020a056830149200b006063fef3e17so4084540otq.12
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 20:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=297SZhnbfakt9y0BHFgnqzkCZLJUke1XogmQGvDK8R4=;
        b=m9HMjtn3t15regA8x1GltDY08DyPBuI2H0RawHwVfEekwc56tea1CeNnXrDCzfMSsr
         T6LDfkOGVAxHlFZ5blEteba7l8cHTjFwQsUqaL6bexFl3C14r2qGMsjZsHwnYnSgSU/l
         YMC1c6z2iZHeQDptFxo+AJbSFYLWexKpQLb0QbGWGws60uTswZkLayRv4fx9VDHM4LoT
         jpWYlcF+Lkq6g3rCH49AYvRHONXLVW/9OnDDxHw0N461nY+PU4Bdzg+F+HJEETHXBI+V
         jpXhR7PTGYzYIxiM6kBPMM2W64m5Uh6TgfeVIPR8WRv0Rsk9kpCzIIgej+KltjAUZptZ
         N/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=297SZhnbfakt9y0BHFgnqzkCZLJUke1XogmQGvDK8R4=;
        b=A+ACQ1ldrb9SKij9+3x0ZVBq788lM5ZIZgFkijkLkYpF/0XI9fX4w6ZcKSGUiEv8hm
         wwN8gaHKvP345dD5SaVXHWjQD9MRI792Rq1+fIf/6SADqbL6EYjSPZo++wqIoMJEhzwK
         bBjnvqHoAdUi4fzTBLF3V0uG4iAihrjFbxuFDpaE/aG25k3LLOGS/pD26kVzVXuF+6Y3
         AYPMkrHrmMChQ5IcahVxsIDVzK4Z4YCYYIgFGfTIVJZJd4xoSSrkpcIOt8rTifgqkSCY
         WoYz4eGAqiMbguQRiHn9Y94CgS2O++6hGunoIVVSmx0Ahv57istK4r2saRmJd89h5RxN
         6uxw==
X-Gm-Message-State: AOAM533kkrYYceGjDb8BZMrTfpLGtRLoCUH2GX/bN32UvLfylU2fk3Bm
        oJb1JM74XYa8m1O7i/UmpvrvGvtoOdrmBkawfQA68w==
X-Google-Smtp-Source: ABdhPJyAHsbwyCL+EjpEVDEWDEyvsYMPlp0+rwoKbTCFj5OxYrQ77Dt4TinjMnxcKF4zxhJZi4KxoVhSgYkgN+dsYak=
X-Received: by 2002:a05:6830:280e:b0:606:ae45:6110 with SMTP id
 w14-20020a056830280e00b00606ae456110mr1143445otu.14.1652411221187; Thu, 12
 May 2022 20:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220512184514.15742-1-jon@nutanix.com> <Yn1fjAqFoszWz500@google.com>
 <Yn1hdHgMVuni/GEx@google.com> <07BEC8B1-469C-4E36-AE92-90BFDF93B2C4@nutanix.com>
 <Yn1o9ZfsQutXXdQS@google.com> <CALMp9eRQv6owjfyf+UO=96Q1dkeSrJWy0i4O-=RPSaQwz0bjTQ@mail.gmail.com>
 <C39CD5E4-3705-4D1A-A67D-43CBB7D1950B@nutanix.com> <CALMp9eRXmWvrQ1i0V3G738ndZOZ4YezQ=BqXe-BF2b4GNo1m3Q@mail.gmail.com>
 <DEF8066B-E691-4C85-A19A-9F5222D1683D@nutanix.com>
In-Reply-To: <DEF8066B-E691-4C85-A19A-9F5222D1683D@nutanix.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Thu, 12 May 2022 20:06:49 -0700
Message-ID: <CALMp9eTwH9WVD=EuTXeu1KYAkAUuXdnmA+k9dti7OM+u=kLKHQ@mail.gmail.com>
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
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 12, 2022 at 5:50 PM Jon Kohler <jon@nutanix.com> wrote:

> You mentioned if someone was concerned about performance, are you
> saying they also critically care about performance, such that they are
> willing to *not* use IBPB at all, and instead just use taskset and hope
> nothing ever gets scheduled on there, and then hope that the hypervisor
> does the job for them?

I am saying that IBPB is not the only viable mitigation for
cross-process indirect branch steering. Proper scheduling can also
solve the problem, without the overhead of IBPB. Say that you have two
security domains: trusted and untrusted. If you have a two-socket
system, and you always run trusted workloads on socket#0 and untrusted
workloads on socket#1, IBPB is completely superfluous. However, if the
hypervisor chooses to schedule a vCPU thread from virtual socket#0
after a vCPU thread from virtual socket#1 on the same logical
processor, then it *must* execute an IBPB between those two vCPU
threads. Otherwise, it has introduced a non-architectural
vulnerability that the guest can't possibly be aware of.

If you can't trust your OS to schedule tasks where you tell it to
schedule them, can you really trust it to provide you with any kind of
inter-process security?

> Would this be the expectation of just KVM? Or all hypervisors on the
> market?

Any hypervisor that doesn't do this is broken, but that won't keep it
off the market. :-)
