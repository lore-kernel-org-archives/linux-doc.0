Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF73AC77B7A
	for <linux-doc@archiver.kernel.org>; Thu, 25 May 2023 15:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241849AbjEYPze (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 May 2023 11:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241382AbjEYPzd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 May 2023 11:55:33 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D43197
        for <linux-doc@vger.kernel.org>; Thu, 25 May 2023 08:55:31 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-25344fbd703so1733349a91.0
        for <linux-doc@vger.kernel.org>; Thu, 25 May 2023 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685030130; x=1687622130;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJhJfniAgX/K6aNPg00s0hgGDGDmvcJtzARRej6TGOA=;
        b=JAaXmQsUiv1MMYlIIQMGz3uobblUt+My3r9AwWFGnhn64piKXxlgqJS5+wucLy7MX3
         8W/3BpF8qOQtu6SAArifGNKD3hCklvCmZpEX3UU9dlx0SdajPT2NtDYQWrTbkKG3Ojnf
         863L28cxpMROTC5dUKAGZYr2NkUtGUp1du0EBjsmVt7RAfEl4M1yaJle7dEFJ55egM3Y
         358v2Bftq3Nn8nSX2IALvmQ4d07XxVKxWUIfpH5C4Ty2GctFW5EfeIuFOkZEb8C4vLGf
         88mD9zkeC8Arr0UFhwosZRucjhhf4/uUv36ml6I9iMBgPxMHsLjIA9pZx5KYjuTACVIa
         61mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685030130; x=1687622130;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJhJfniAgX/K6aNPg00s0hgGDGDmvcJtzARRej6TGOA=;
        b=g8lDKPFt5UGu1AA1pxdqBjGzUAVPieWHdiCLVHkdIyID3eHI3HkQMf4eLK0QnpzR9O
         sRxhCnQfAzTW+tlfUiogg4dlPV4PvcTuCN7Ix11C9xjqxc5WVXAa5H3GujBocVLUZjNt
         Nc7tXXqsp1Oo0Im3U3iq9041XqwCY3YEjLDh/Qb2ekyOUuxdMzzKuv/CCyt2Juj6bloM
         mI9uAjKGyv2egK4JkTK7ZoEBiZvkpS+Ki62c1zJoLbRtMhm9zCWz4IWNinkNgZ9OC0p2
         LGvyM2t2nUYq9hjdKFf5sHNy7wXiCwaea0Bccz3vBvnkZbLJYI6rWt2SL1FZXeXCk65P
         G9Kw==
X-Gm-Message-State: AC+VfDyweIiErDJrzxRrlyTm6A0SXVNlts4VER4rU3g6fDG/L84E2WFF
        UfYBkCj/8StGOnOO+uzyleJdxspniE8=
X-Google-Smtp-Source: ACHHUZ47p24uic5C5tj2sNPe5bf+qa+viyHFYH/qvq+YqkWURKU7nrdyH74GNV/lKXtUyQjQgvbLXa0+QgE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:9804:b0:24d:f3d9:48b5 with SMTP id
 z4-20020a17090a980400b0024df3d948b5mr505815pjo.3.1685030130685; Thu, 25 May
 2023 08:55:30 -0700 (PDT)
Date:   Thu, 25 May 2023 08:55:29 -0700
In-Reply-To: <CAFg_LQWdSnNOd+VwTu8pQezL7qaN=4L_YffHVQUQWJiV5U76wQ@mail.gmail.com>
Mime-Version: 1.0
References: <20230420104622.12504-1-ljrcore@126.com> <20230420104622.12504-8-ljrcore@126.com>
 <ZG6i3sqOcZDg/UCG@google.com> <CAFg_LQWdSnNOd+VwTu8pQezL7qaN=4L_YffHVQUQWJiV5U76wQ@mail.gmail.com>
Message-ID: <ZG+E8YtFtCbKn7fi@google.com>
Subject: Re: [PATCH v2 7/7] KVM: selftests: Test pmu event filter with
 incompatible kvm_pmu_event_filter
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

On Thu, May 25, 2023, Jinrong Liang wrote:
> Sean Christopherson <seanjc@google.com> =E4=BA=8E2023=E5=B9=B45=E6=9C=882=
5=E6=97=A5=E5=91=A8=E5=9B=9B 07:50=E5=86=99=E9=81=93=EF=BC=9A
> > > +static uint64_t test_incompatible_filter(struct kvm_vcpu *vcpu, uint=
32_t action,
> > > +                                      uint32_t bitmap)
> > > +{
> > > +     struct incompatible_pmu_event_filter err_f;
> > > +
> > > +     err_f.action =3D action;
> > > +     err_f.fixed_counter_bitmap =3D bitmap;
> > > +     ioctl((vcpu->vm)->fd, KVM_SET_PMU_EVENT_FILTER, &err_f.action);
> >
> > This is completely busted.  It "passes" by luck, not because it's a val=
id test.
> > The size of the argument is embedded in the IOCTL number itself, which =
means that
> > unless glibc is being very nice and using a macro + typeof + sizeof to =
sanity check
> > things, which I highly doubt is the case, this ioctl() is passing rando=
m stack data,
> > a.k.a. garbage, to KVM.
> >
> > In short, drop this patch.
>=20
> Thank you for letting us know about the issues with the patch. I will
> drop the patch as suggested. Would you advise me to prepare version 3
> to remove this patch?

More comments on the other patches are incoming, please hold off on v3 unti=
l then.
