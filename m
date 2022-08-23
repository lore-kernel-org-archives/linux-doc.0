Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30890C3F6B0
	for <linux-doc@archiver.kernel.org>; Tue, 23 Aug 2022 21:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbiHWVUm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Aug 2022 17:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiHWVUj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Aug 2022 17:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B016DF96
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 14:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661289637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kDxp6lecacjb98wPWPmNSJC/XwpRER4yjzQFhNWbLNM=;
        b=LapdVoMNAGWTWjgpYmYLQ4vonCfDxnRcX87VFp6LI/MIQza07lHAjkG3gwtlJAYFErD5ZC
        60BfNaR7hrlV0Fy/hozixRuxTUGU8S9k0b3HbsS/5yq/qcB5cYO4Diaum/llojJurNEnF2
        6EV0BP1QnUatMkqkNRh0GZoPmsl2x00=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-56ijCO2rPGSrEeS_F0HedQ-1; Tue, 23 Aug 2022 17:20:36 -0400
X-MC-Unique: 56ijCO2rPGSrEeS_F0HedQ-1
Received: by mail-qt1-f198.google.com with SMTP id h19-20020ac85493000000b00343408bd8e5so11447806qtq.4
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 14:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=kDxp6lecacjb98wPWPmNSJC/XwpRER4yjzQFhNWbLNM=;
        b=z3aeuGC5bwna9/VSnp+p9hmiiWRsdRIoJ7xB9U2K4vR9CaGuUkDZJlBRtpfAkGn+EH
         LmgMUMj307q5VYf2JogyfCD0kvP25rGPFwkceoqFBuaAX1I8OhKtYS5IZFbEVEozWVch
         NQWgHwjJkOQupPsbU/hHjZxu8Zy/idWxmIT3TASqPATWJ+6UFtwPcU8iet6a1OjjOHb3
         4Cm5DNDuvlXx9lPYCEX9cy385TXm7O116SFaQ7pg0OpJNmCK+S9jFgjLvbx7+WSpYHg4
         MJ4CEBnfmk+Ltr5+7SH+pIJsMsZB/5AvMuqfFKtkxutCS/2HkrMchJp83dPSiBiyR6oW
         xsyQ==
X-Gm-Message-State: ACgBeo1YkZuXvVZYZKGzGfgKUjnEUrL2oHFEUijfhu3gKilR3PCRhcjr
        ARliql9domh19UP6g4kXmHlxP8o8sTTJz1iO8C47NXXpOnkPkZG8HScF5pxfcMVFXzUr8j7J1YC
        BSyPtKJPTT5NCRypnj40E
X-Received: by 2002:a05:6214:260e:b0:496:a6eb:94f8 with SMTP id gu14-20020a056214260e00b00496a6eb94f8mr22195721qvb.85.1661289635333;
        Tue, 23 Aug 2022 14:20:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4GdFOFVsCT3Z0e/Gt12h73jfCtvxPLR/EbAAo1gDtVfbTot9LLeAXrj+uVOfZeMFzXQ4FYkQ==
X-Received: by 2002:a05:6214:260e:b0:496:a6eb:94f8 with SMTP id gu14-20020a056214260e00b00496a6eb94f8mr22195695qvb.85.1661289634982;
        Tue, 23 Aug 2022 14:20:34 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id q8-20020a05620a2a4800b006bb756ce754sm14406977qkp.55.2022.08.23.14.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 14:20:34 -0700 (PDT)
Date:   Tue, 23 Aug 2022 17:20:32 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Gavin Shan <gshan@redhat.com>, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, pbonzini@redhat.com,
        corbet@lwn.net, james.morse@arm.com, alexandru.elisei@arm.com,
        suzuki.poulose@arm.com, oliver.upton@linux.dev,
        catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
        seanjc@google.com, drjones@redhat.com, dmatlack@google.com,
        bgardon@google.com, ricarkol@google.com, zhenyzha@redhat.com,
        shan.gavin@gmail.com
Subject: Re: [PATCH v1 1/5] KVM: arm64: Enable ring-based dirty memory
 tracking
Message-ID: <YwVEoM1pj2MPCELp@xz-m1.local>
References: <20220819005601.198436-1-gshan@redhat.com>
 <20220819005601.198436-2-gshan@redhat.com>
 <87lerkwtm5.wl-maz@kernel.org>
 <41fb5a1f-29a9-e6bb-9fab-4c83a2a8fce5@redhat.com>
 <87fshovtu0.wl-maz@kernel.org>
 <171d0159-4698-354b-8b2f-49d920d03b1b@redhat.com>
 <YwTc++Lz6lh3aR4F@xz-m1.local>
 <87bksawz0w.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bksawz0w.wl-maz@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 23, 2022 at 08:17:03PM +0100, Marc Zyngier wrote:
> I don't think we really need this check on the hot path. All we need
> is to make the request sticky until userspace gets their act together
> and consumes elements in the ring. Something like:
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 986cee6fbc7f..e8ed5e1af159 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -747,6 +747,14 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
>  
>  		if (kvm_check_request(KVM_REQ_SUSPEND, vcpu))
>  			return kvm_vcpu_suspend(vcpu);
> +
> +		if (kvm_check_request(KVM_REQ_RING_SOFT_FULL, vcpu) &&
> +		    kvm_dirty_ring_soft_full(vcpu)) {
> +			kvm_make_request(KVM_REQ_RING_SOFT_FULL, vcpu);
> +			vcpu->run->exit_reason = KVM_EXIT_DIRTY_RING_FULL;
> +			trace_kvm_dirty_ring_exit(vcpu);
> +			return 0;
> +		}
>  	}
>  
>  	return 1;

Right, this seems working.  We can also use kvm_test_request() here.

> 
> 
> However, I'm a bit concerned by the reset side of things. It iterates
> over the vcpus and expects the view of each ring to be consistent,
> even if userspace is hacking at it from another CPU. For example, I
> can't see what guarantees that the kernel observes the writes from
> userspace in the order they are being performed (the documentation
> provides no requirements other than "it must collect the dirty GFNs in
> sequence", which doesn't mean much from an ordering perspective).
> 
> I can see that working on a strongly ordered architecture, but on
> something as relaxed as ARM, the CPUs may^Wwill aggressively reorder
> stuff that isn't explicitly ordered. I have the feeling that a CAS
> operation on both sides would be enough, but someone who actually
> understands how this works should have a look...

I definitely don't think I 100% understand all the ordering things since
they're complicated.. but my understanding is that the reset procedure
didn't need memory barrier (unlike pushing, where we have explicit wmb),
because we assumed the userapp is not hostile so logically it should only
modify the flags which is a 32bit field, assuming atomicity guaranteed.

IIRC we used to discuss similar questions on "what if the user is hostile
and wants to hack the process by messing up with the ring", and our
conclusion was as long as the process wouldn't mess up anything outside
itself it should be okay. E.g. It should not be able to either cause the
host to misfunction, or trigger kernel warnings in dmesg, etc..

Thanks,

-- 
Peter Xu

