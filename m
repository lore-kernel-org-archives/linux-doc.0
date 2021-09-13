Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE20CC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 18:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C54F761103
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 18:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239594AbhIMSWq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Sep 2021 14:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240927AbhIMSWq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Sep 2021 14:22:46 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CB2C061760
        for <linux-doc@vger.kernel.org>; Mon, 13 Sep 2021 11:21:30 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id w8so10225334pgf.5
        for <linux-doc@vger.kernel.org>; Mon, 13 Sep 2021 11:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6++MUHqyHKCB5FgpZ/mPI8mWFFcZJMAIOAPJiYxj2J8=;
        b=I8oAss5KvNOxSzhenZXmIesL1MTLaeyUnk6Q8EYJv5KLYqd1LxYtn/ptQxgv3SD+T9
         PsQ3lmeYGUOmkmNBEchDt3vbOWf9cDZ90nOdyyxe+PJxS6IItldgrzQgOojUBQJ9bxR0
         MyBt75NYyvzrKbm2331lHF5jPUnLM/Z4/K+PyuyXMBjivWPXQ5CUE0HDc1dRbLaZYOKY
         BxXw50eAQgSRSTQ7ePnQPyXCKvYAlFcNZ3SQ6pgwqdpfVP7+nhLYaOvgheq0lrdxWlWB
         3bBhDAN6CcQfyLsrTyRTzGqroPXLKVttcyRR7ITwmfGoVYHHNY4Xpa/Dj/oY2lcBFm/W
         hDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6++MUHqyHKCB5FgpZ/mPI8mWFFcZJMAIOAPJiYxj2J8=;
        b=AkvBloiu1WBdFYJPZ9Qi1rhodBxzp2I68nfrHft79VFQPlauCZDLkdQdvI5MKZInCU
         iClCQ3/Ni5at07nRU+Wf2VkqEQCGDzJu0v9sOssPikQCyLvfWh4KG2825blb/o1R2QgN
         Cv+NJKfKn69X+xmBDWQQOVvQPVl04+Ldj1Le+K0hehDaVIJ4Q3qTivPLeDUT7zLKsCxJ
         REDAfIz3IOeQdI+7iJ/vXt6HA1RyjIo2k80O9Ps63Fq7tG2D1LuEr/S+ybhHvA1oe9O7
         EIbE7lnSOUxS3aB0P3Mkk6Zj6N6qiw6IrTMg7nNuceaAz5jeakzo28K/8iLzDYmMuA53
         wqmQ==
X-Gm-Message-State: AOAM532PZL4s3g++HhKPzp8UT3klN8+SetH89WeQawGLDyPHqWlv/9oF
        SDqtp8Db0xcWWYk3TcB/gjnpmraGYesyNQ==
X-Google-Smtp-Source: ABdhPJzgg07OWjq2bQtnbrD/FW+0dCRqz+/2tJpzVzU6KzTpUZG3HRY1sfxYtkNoWAuSpFfjZ/hUlw==
X-Received: by 2002:a05:6a00:1a10:b0:412:448c:89ca with SMTP id g16-20020a056a001a1000b00412448c89camr811832pfv.86.1631557289837;
        Mon, 13 Sep 2021 11:21:29 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id x13sm4547221pfp.133.2021.09.13.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 11:21:29 -0700 (PDT)
Date:   Mon, 13 Sep 2021 18:21:25 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Eduardo Habkost <ehabkost@redhat.com>
Cc:     Juergen Gross <jgross@suse.com>, kvm@vger.kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
Message-ID: <YT+WpdnGodZE9krY@google.com>
References: <20210913135745.13944-1-jgross@suse.com>
 <20210913135745.13944-3-jgross@suse.com>
 <YT97K7yXyCrphyCt@google.com>
 <CAOpTY_pyeOo2Kh-r1cEFk2XL4g8A1mxQpP1y62thWk2mh6XUUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOpTY_pyeOo2Kh-r1cEFk2XL4g8A1mxQpP1y62thWk2mh6XUUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 13, 2021, Eduardo Habkost wrote:
> On Mon, Sep 13, 2021 at 12:24 PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, Sep 13, 2021, Juergen Gross wrote:
> > > KVM_MAX_VCPU_ID is not specifying the highest allowed vcpu-id, but the
> > > number of allowed vcpu-ids. This has already led to confusion, so
> > > rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS to make its semantics more
> > > clear
> >
> > My hesitation with this rename is that the max _number_ of IDs is not the same
> > thing as the max allowed ID.  E.g. on x86, given a capability that enumerates the
> > max number of IDs, I would expect to be able to create vCPUs with arbitrary 32-bit
> > x2APIC IDs so long as the total number of IDs is below the max.
> >
> 
> What name would you suggest instead? KVM_VCPU_ID_LIMIT, maybe?
> 
> I'm assuming we are not going to redefine KVM_MAX_VCPU_ID to be an
> inclusive limit.

Heh, I haven't been able to come up with one, which is why I suggested the route
of making it an inclusive value internally within KVM.
