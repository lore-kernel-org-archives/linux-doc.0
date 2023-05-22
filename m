Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA72EC7EE26
	for <linux-doc@archiver.kernel.org>; Mon, 22 May 2023 15:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbjEVPDR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 May 2023 11:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234391AbjEVPC7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 May 2023 11:02:59 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1D2E5D
        for <linux-doc@vger.kernel.org>; Mon, 22 May 2023 08:02:27 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-53065736d52so3341925a12.2
        for <linux-doc@vger.kernel.org>; Mon, 22 May 2023 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684767746; x=1687359746;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fziBUujOdJNTcKGtA3v1WWZ5akyg74yfYnasIYCQmVE=;
        b=HcZv/RpK2iBwC+f4vi/2f3lsrUt9sB5Xp0sQoLPhl6BZvI5rq6oJ5seV6rkxUjltDh
         z+XaHfSk8xydvcuKnU141hRJLQM7v5oFtk8rtn90XKl7u4iiMB5pEMRrYLMu+5S0PfpE
         X/PPbfRycd5kFT7jBcxn5y8lXFWLF+CBJiSwo10DwgBkq2Sq5I89XFdAhba9jCeZoVe9
         jWNxCVIYvpVNF/3zT21bNiJX2X5nhqJtxYfXsAubShMQqVRjg3K5PNAGtD+PV5xM8RT/
         kJ5JLjneNERnVI6oYbBxlQb2J2TTW+g0IKEEB0z7YMKJxtYLO+JP7vJFn1t6oQZNLEji
         MWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684767746; x=1687359746;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fziBUujOdJNTcKGtA3v1WWZ5akyg74yfYnasIYCQmVE=;
        b=X541Lgloj7ING6MdnsuHon87vA9nu1RSiuEyO4Kwgc2yEG04f3TbQGUMFf/pCFlLx6
         aX2+hsq27a7q7FdSPyPoX9fCMVMuOR1aX6myJmzD4YsL/Y11QPHGgPrl4NFzCe6BiKG7
         6NQj2M/3eyamfRt6RDGkPiUPVmETgkecDunbShYkLjmnh85pTYLDrX5De1kisA1/ZUOi
         OyElf/vp5gk3eJoeUQ0bBdoNnoKHTd5V+0M6sl1rtI844KlJV3VF0e/5zgovwKdjAi5D
         E4MDP01JktkW1jyHxI9yrQ5BtIgd57bSHnMx7l3oJsxc3coFe/KynMnIik8UBb/1zo6m
         V0JQ==
X-Gm-Message-State: AC+VfDxbJMp5gW3AGV7a7HxmLJkqxSa3lLZQ7jVe0wBQoAqqn896e6/a
        MP4OiWYSKliVppPghdgyCIBWMY0m8y8=
X-Google-Smtp-Source: ACHHUZ5ERPoEbvr+APfX86NeehfWSJRtftrHA1EpWYpuPBCCqx86gSOrtlzcu9bkQmisMJ0L0wFjRF9edFg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6854:0:b0:530:8be8:5ab6 with SMTP id
 q20-20020a656854000000b005308be85ab6mr2513207pgt.8.1684767746328; Mon, 22 May
 2023 08:02:26 -0700 (PDT)
Date:   Mon, 22 May 2023 08:02:24 -0700
In-Reply-To: <CAFg_LQVfECWsmcSXJWnnyJK5mZAbjdCTX-RXP3aoDAECTspqkA@mail.gmail.com>
Mime-Version: 1.0
References: <20230420104622.12504-1-ljrcore@126.com> <CAFg_LQVfECWsmcSXJWnnyJK5mZAbjdCTX-RXP3aoDAECTspqkA@mail.gmail.com>
Message-ID: <ZGuD1LRE4MkKg++D@google.com>
Subject: Re: [PATCH v2 0/7] KVM: selftests: Add tests for pmu event filter
From:   Sean Christopherson <seanjc@google.com>
To:     Jinrong Liang <ljr.kernel@gmail.com>
Cc:     Like Xu <like.xu.linux@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>,
        Aaron Lewis <aaronlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Jinrong Liang <cloudliang@tencent.com>,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 22, 2023, Jinrong Liang wrote:
> Jinrong Liang <ljr.kernel@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8820=
=E6=97=A5=E5=91=A8=E5=9B=9B 18:46=E5=86=99=E9=81=93=EF=BC=9A
> > Jinrong Liang (7):
> >   KVM: selftests: Replace int with uint32_t for nevents
> >   KVM: selftests: Apply create_pmu_event_filter() to fixed ctrs
> >   KVM: selftests: Test unavailable event filters are rejected
> >   KVM: x86/pmu: Add documentation for fixed ctr on PMU filter
> >   KVM: selftests: Check if pmu_event_filter meets expectations on fixed
> >     ctrs
> >   KVM: selftests: Check gp event filters without affecting fixed event
> >     filters
> >   KVM: selftests: Test pmu event filter with incompatible
> >     kvm_pmu_event_filter
> >
> >  Documentation/virt/kvm/api.rst                |  21 ++
> >  .../kvm/x86_64/pmu_event_filter_test.c        | 239 ++++++++++++++++--
> >  2 files changed, 243 insertions(+), 17 deletions(-)
> >
> >
> > base-commit: a25497a280bbd7bbcc08c87ddb2b3909affc8402
> > --
> > 2.31.1
> >
>=20
> Polite ping.

Sorry for the delay, I'm finally getting into review mode for the 6.5 cycle=
.

> Should I post version 3 to fix the problem of two "From: Jinrong Liang
> <cloudliang@tencent.com>"?

No need, that's trivial to fixup when applying (if it even requires fixup).
