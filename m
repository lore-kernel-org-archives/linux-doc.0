Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6009CECAAD5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Aug 2022 10:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344024AbiHZKud (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Aug 2022 06:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344011AbiHZKuc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Aug 2022 06:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DF91A808
        for <linux-doc@vger.kernel.org>; Fri, 26 Aug 2022 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661511029;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pLii0dfj1y7lFu87Lg22T36M6OnU1zUptup5Hy8q+CA=;
        b=OO2eonGXI9WqD0QmWdZnmaxtBbAOekzMpYI+f2KtcvxrIDcXWsOoK27oQWiCmnWAoRHATe
        FOjQM5g5kGBXFCRv7aP+wrFE0FfLVsVfdnpefR2C8q2RYyZaqpiV6wB+waagVuEv7Ux8RJ
        Zb71dA6MZmzsniqX861DzKSsu4NZlNM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-aLHG01nFPt203rf6RjXdTw-1; Fri, 26 Aug 2022 06:50:28 -0400
X-MC-Unique: aLHG01nFPt203rf6RjXdTw-1
Received: by mail-ed1-f71.google.com with SMTP id r20-20020a05640251d400b00446e3eee8a1so894226edd.21
        for <linux-doc@vger.kernel.org>; Fri, 26 Aug 2022 03:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=pLii0dfj1y7lFu87Lg22T36M6OnU1zUptup5Hy8q+CA=;
        b=4SWrE7YjuT9bjld8fw75k1x0I+2x4OyQWOfLP5WBNtysdjQd13mHRXMVBsI6EiuGHL
         8C/wTF6gWgFAspHpKJe+dSqfleHPGDvdW5uAMesDcnBZUYoy+RAzfRCwkX6SHkxFqWrP
         UgHLojEwWfM4UkK+GN2riwVwdVjljcOToGkbchlxDc261vnnu7fqUuXrAed3EI9M6CVx
         aGDhbkOOlc9TpIVV3tDTsqHbXX5Zb49i0dhwn9LnMJoK2sPbcr/HstP9V5vxajnCnz7o
         jdGIrLTe24Tb7U9gFkgGg3oCMZT3LpqC0s/OzWs/lUOWn+akyBxuGDnonyf8vS+C8W87
         KSXQ==
X-Gm-Message-State: ACgBeo3ko1FRl2a5dfgYbmuFuwQUk1FLlgGA2u4mXwmzfXFszodOlx4p
        hiEi8nbnDneMWakNdZmTbmUj/Efq9E/rSmGEDDVhx9xLxfm4pw9Pe9gFs37paTzv9Hfs7hZx9vd
        w02q1lnYM/syIHCnUxBrK
X-Received: by 2002:a17:907:84a:b0:733:735:2b1a with SMTP id ww10-20020a170907084a00b0073307352b1amr5021041ejb.290.1661511026926;
        Fri, 26 Aug 2022 03:50:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7I33tIVReqn9qteZcQFjZQwkCSQgOePSldWnAYXVK6po7eIEvLdgg+W/uNc+AQTkft1CgJvQ==
X-Received: by 2002:a17:907:84a:b0:733:735:2b1a with SMTP id ww10-20020a170907084a00b0073307352b1amr5021032ejb.290.1661511026688;
        Fri, 26 Aug 2022 03:50:26 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id 1-20020a170906218100b0072af4af2f46sm750652eju.74.2022.08.26.03.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 03:50:26 -0700 (PDT)
Message-ID: <9e7cb09c-82c5-9492-bccd-5511f5bede26@redhat.com>
Date:   Fri, 26 Aug 2022 12:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>, Peter Xu <peterx@redhat.com>
Cc:     Gavin Shan <gshan@redhat.com>, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, corbet@lwn.net,
        james.morse@arm.com, alexandru.elisei@arm.com,
        suzuki.poulose@arm.com, oliver.upton@linux.dev,
        catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
        seanjc@google.com, dmatlack@google.com, bgardon@google.com,
        ricarkol@google.com, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20220819005601.198436-1-gshan@redhat.com>
 <20220819005601.198436-2-gshan@redhat.com> <87lerkwtm5.wl-maz@kernel.org>
 <41fb5a1f-29a9-e6bb-9fab-4c83a2a8fce5@redhat.com>
 <87fshovtu0.wl-maz@kernel.org>
 <171d0159-4698-354b-8b2f-49d920d03b1b@redhat.com>
 <YwTc++Lz6lh3aR4F@xz-m1.local> <87bksawz0w.wl-maz@kernel.org>
 <YwVEoM1pj2MPCELp@xz-m1.local> <878rnewpaw.wl-maz@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v1 1/5] KVM: arm64: Enable ring-based dirty memory
 tracking
In-Reply-To: <878rnewpaw.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/24/22 00:47, Marc Zyngier wrote:
>> I definitely don't think I 100% understand all the ordering things since
>> they're complicated.. but my understanding is that the reset procedure
>> didn't need memory barrier (unlike pushing, where we have explicit wmb),
>> because we assumed the userapp is not hostile so logically it should only
>> modify the flags which is a 32bit field, assuming atomicity guaranteed.
> Atomicity doesn't guarantee ordering, unfortunately. Take the
> following example: CPU0 is changing a bunch of flags for GFNs A, B, C,
> D that exist in the ring in that order, and CPU1 performs an ioctl to
> reset the page state.
> 
> CPU0:
>      write_flag(A, KVM_DIRTY_GFN_F_RESET)
>      write_flag(B, KVM_DIRTY_GFN_F_RESET)
>      write_flag(C, KVM_DIRTY_GFN_F_RESET)
>      write_flag(D, KVM_DIRTY_GFN_F_RESET)
>      [...]
> 
> CPU1:
>     ioctl(KVM_RESET_DIRTY_RINGS)
> 
> Since CPU0 writes do not have any ordering, CPU1 can observe the
> writes in a sequence that have nothing to do with program order, and
> could for example observe that GFN A and D have been reset, but not B
> and C. This in turn breaks the logic in the reset code (B, C, and D
> don't get reset), despite userspace having followed the spec to the
> letter. If each was a store-release (which is the case on x86), it
> wouldn't be a problem, but nothing calls it in the documentation.
> 
> Maybe that's not a big deal if it is expected that each CPU will issue
> a KVM_RESET_DIRTY_RINGS itself, ensuring that it observe its own
> writes. But expecting this to work across CPUs without any barrier is
> wishful thinking.

Agreed, but that's a problem for userspace to solve.  If userspace wants 
to reset the fields in different CPUs, it has to synchronize with its 
own invoking of the ioctl.

That is, CPU0 must ensure that a ioctl(KVM_RESET_DIRTY_RINGS) is done 
after (in the memory-ordering sense) its last write_flag(D, 
KVM_DIRTY_GFN_F_RESET).  If there's no such ordering, there's no 
guarantee that the write_flag will have any effect.

The main reason why I preferred a global KVM_RESET_DIRTY_RINGS ioctl was 
because it takes kvm->slots_lock so the execution would be serialized 
anyway.  Turning slots_lock into an rwsem would be even worse because it 
also takes kvm->mmu_lock (since slots_lock is a mutex, at least two 
concurrent invocations won't clash with each other on the mmu_lock).

Paolo

