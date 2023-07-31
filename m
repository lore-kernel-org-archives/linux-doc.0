Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F541C04A94
	for <linux-doc@archiver.kernel.org>; Mon, 31 Jul 2023 22:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjGaW3H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 18:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjGaW3G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 18:29:06 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2CC102
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 15:29:04 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5645bbc82aaso706743a12.2
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 15:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690842544; x=1691447344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ2LktP96v4dfRE8Vwz3CbzB0RzxRif3DX7AM2KfeLU=;
        b=W5Y/ZFO8fcDmdLpJ87+PfI5fOmpc9vEwXzyecBfLbCyZ0GTM8w90J+3zAzdpy6NJz7
         oN75grQ8eQDlRNXh9m0FTorlSFzI02DfJXMBs6hCwfOOPf1uibjhip1NDYHp2c+VaZrL
         Kww8XaqG/kSwDmcjbe//sAJ6As/LvmM7RqnYitr3QxxIAxvCtbZsksmiCzbKAlErBl5K
         842P4ApJ1ZtrFKthlx9CGhxRDI3Is4wJDpo6xtaG/OXydEHZQjVOem8BQc4b/XqjtChc
         69KezMVWzShyQzD07638xV5dcSLgLLH8IxOyNDvTi6yNRWD7hUlknbb7Lz54Pq0X8u5z
         eFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690842544; x=1691447344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ2LktP96v4dfRE8Vwz3CbzB0RzxRif3DX7AM2KfeLU=;
        b=h/ApFEnXJWmYLCbimJXVaZ6DIqY0N3LzpEWRIbVb2j7ON3b5k9WXg3jweah6KPrKhX
         1PhFqxHI5NnOEr4Y+e3qxkz4ORaFOnkn4Q69GlwzYxnn4t+2QwEgQf8bNOvslE+92eQL
         E10vQKftZWkC8ZGWqh1W7tBY54+ginjmb88Tkspr0TI7vPgbek7/VGxz3JI1yusxHBjW
         ZJQaIQ3OsYDHgeZ3DX39HcWSdpFIbDQzdeIZ2VPJcmVANU9GCaH2sE3cWKNtvzuu1oX0
         WPrPB1BmlEND5Cqa48NCDMSwILkcKvYLBDDMqHoVdRb8HfmzWH3myNQgbbxJ2ST7ICBe
         7VTA==
X-Gm-Message-State: ABy/qLbdm0zbFwM76EHnrfJjf3/IpnJKqZ+9J9leONyt6MAYYlL7sPnO
        FhbgO5tSbIvuN2B83nxHWXIDKA==
X-Google-Smtp-Source: APBJJlEUVR4VzSj0cl+vQ2Tn5yIlGKmK3ZbTpxqa/RsOvz61oB7ESg7499A8aoE+8LjqoQ/Hs4qsdA==
X-Received: by 2002:a17:90a:a683:b0:268:6339:318 with SMTP id d3-20020a17090aa68300b0026863390318mr10058262pjq.30.1690842543576;
        Mon, 31 Jul 2023 15:29:03 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id a15-20020a17090a70cf00b00267fbd521dbsm8239085pjm.5.2023.07.31.15.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 15:29:03 -0700 (PDT)
Date:   Mon, 31 Jul 2023 22:28:59 +0000
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v2 6/6] KVM: Documentation: Add the missing description
 for tdp_mmu_page into kvm_mmu_page
Message-ID: <ZMg1q59MV7/iQayd@google.com>
References: <20230626182016.4127366-1-mizhang@google.com>
 <20230626182016.4127366-7-mizhang@google.com>
 <ZJsLV+urA0Yrw6Wn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJsLV+urA0Yrw6Wn@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 27, 2023, Sean Christopherson wrote:
> On Mon, Jun 26, 2023, Mingwei Zhang wrote:
> > Add the description for tdp_mmu_page into kvm_mmu_page description.
> > tdp_mmu_page is a field to differentiate shadow pages from TDP MMU and
> > non-TDP MMU. When TDP MMU is enabled, sp->tdp_mmu_page=1 indicates a shadow
> > page for L1, while sp->tdp_mmu_page=0 indicates a shadow page for an L2.
> > When TDP MMU is disabled, sp->tdp_mmu_page is always 0. So update the doc
> > to reflect the information.
> > 
> > Signed-off-by: Mingwei Zhang <mizhang@google.com>
> > ---
> >  Documentation/virt/kvm/x86/mmu.rst | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
> > index cc4bd190c93d..678dc0260a54 100644
> > --- a/Documentation/virt/kvm/x86/mmu.rst
> > +++ b/Documentation/virt/kvm/x86/mmu.rst
> > @@ -278,6 +278,8 @@ Shadow pages contain the following information:
> >      since the last time the page table was actually used; if emulation
> >      is triggered too frequently on this page, KVM will unmap the page
> >      to avoid emulation in the future.
> > +  tdp_mmu_page:
> > +    Is 1 if the shadow page is a TDP MMU page.
> 
> Maybe add a short blurb explaining that it's used for control flow when starting
> from a common entry point?  E.g. walking page tables given a root, and walking
> lists that can hold both shadow MMU and TDP MMU pages.

will do. Thanks.
