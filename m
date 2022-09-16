Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA541C6FA82
	for <linux-doc@archiver.kernel.org>; Fri, 16 Sep 2022 18:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiIPSKG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Sep 2022 14:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiIPSKE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Sep 2022 14:10:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D3A2A428
        for <linux-doc@vger.kernel.org>; Fri, 16 Sep 2022 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663351802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dGo9IIHnzVXPXPzRwNLgG2J2p1J5QcMOec8HOITKZNg=;
        b=TcvDb91UJkLON22XWVt04TMLE2I8atkLvCSeLnC6ygPliYX0Jx9fAkgDgEX3MdcERWCrbL
        p7XB3W60KHlU766zr+lyYmiThOgsAFpn/HI7aIeFTQLEdyD+zdXDcKVNF+VHJVOBBIEVjv
        1khXd9VqqmdG+n7iqWGhtqg4NmPGrIo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-_ft1KkgnNLGLxnkPGznz2g-1; Fri, 16 Sep 2022 14:09:55 -0400
X-MC-Unique: _ft1KkgnNLGLxnkPGznz2g-1
Received: by mail-qt1-f198.google.com with SMTP id fe14-20020a05622a4d4e00b0035cc376b1d5so4103318qtb.4
        for <linux-doc@vger.kernel.org>; Fri, 16 Sep 2022 11:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=dGo9IIHnzVXPXPzRwNLgG2J2p1J5QcMOec8HOITKZNg=;
        b=Kfc9gWt9/wfoGH5YA1VowHqolmoQF0Jy32TCtUtqbr0XYSbdev7VYm8chv/vi1fq/i
         I6/yqreJ3SC+GAGxrvEY3p1/SJbh8mrsMfmXcy2k34lWP886Vtsdy5O+bWTFbMwQPpHz
         Zh7IOdRTJVQRpVWmRVfEbrNFMX+KAx+Ep+CgHKO1fcs9pG1B5pyZPUuf0ORhrFRVkUtR
         9jPDM4q/X7O5Zq0jcYNPOZJKOwKkrv/uLkCLDEcClP/Ekw5YyQfbYCcKfuy10T2oYZ+9
         LmehkT0gka0wBE0yN5/3b7MSllEn7cE2gACgM7+lM/ZJ6GOyrdERk2FGwhLwlwZoKaw+
         qfCw==
X-Gm-Message-State: ACrzQf09TLmw7F0wXfMpNqSU9Q7tZFCtN9rZ1P5F4/+agKxCdxCS3pb+
        bpmbTIlYSwDumAtVGdMNd65k3vVy9qqA3WQdx6OIGrUHI8dZBi/oQsr20YTGS2aIxka4CH7FN3X
        OCDBHyIHmVgz1QR11rVIg
X-Received: by 2002:ac8:5f4d:0:b0:35b:ba2e:ce1 with SMTP id y13-20020ac85f4d000000b0035bba2e0ce1mr5516866qta.26.1663351795091;
        Fri, 16 Sep 2022 11:09:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Eq8nutd1y8SgkrtcXFUsUl9UMHM0MnxQbGXx8ngkMtdvW9XgFJl7Id6By2Z5c1AZ7GoPT7w==
X-Received: by 2002:ac8:5f4d:0:b0:35b:ba2e:ce1 with SMTP id y13-20020ac85f4d000000b0035bba2e0ce1mr5516842qta.26.1663351794880;
        Fri, 16 Sep 2022 11:09:54 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id l19-20020a05620a28d300b006b60d5a7205sm7398453qkp.51.2022.09.16.11.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:09:54 -0700 (PDT)
Date:   Fri, 16 Sep 2022 14:09:52 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gavin Shan <gshan@redhat.com>
Cc:     kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, catalin.marinas@arm.com,
        linux-kselftest@vger.kernel.org, bgardon@google.com,
        shuah@kernel.org, corbet@lwn.net, maz@kernel.org,
        drjones@redhat.com, will@kernel.org, zhenyzha@redhat.com,
        dmatlack@google.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pbonzini@redhat.com,
        oliver.upton@linux.dev, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/5] KVM: x86: Introduce KVM_REQ_RING_SOFT_FULL
Message-ID: <YyS78BqsQxKkLOiW@xz-m1.local>
References: <20220916045135.154505-1-gshan@redhat.com>
 <20220916045135.154505-2-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220916045135.154505-2-gshan@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 16, 2022 at 12:51:31PM +0800, Gavin Shan wrote:
> This adds KVM_REQ_RING_SOFT_FULL, which is raised when the dirty
> ring of the specific VCPU becomes softly full in kvm_dirty_ring_push().
> The VCPU is enforced to exit when the request is raised and its
> dirty ring is softly full on its entrance.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  arch/x86/kvm/x86.c       | 5 +++--
>  include/linux/kvm_host.h | 1 +
>  virt/kvm/dirty_ring.c    | 4 ++++
>  3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 43a6a7efc6ec..7f368f59f033 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10265,8 +10265,9 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  	bool req_immediate_exit = false;
>  
>  	/* Forbid vmenter if vcpu dirty ring is soft-full */
> -	if (unlikely(vcpu->kvm->dirty_ring_size &&
> -		     kvm_dirty_ring_soft_full(&vcpu->dirty_ring))) {
> +	if (kvm_check_request(KVM_REQ_RING_SOFT_FULL, vcpu) &&
> +	    kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {
> +		kvm_make_request(KVM_REQ_RING_SOFT_FULL, vcpu);
>  		vcpu->run->exit_reason = KVM_EXIT_DIRTY_RING_FULL;
>  		trace_kvm_dirty_ring_exit(vcpu);
>  		r = 0;

As commented previously - can we use kvm_test_request() instead? because we
don't want to unconditionally clear the bit.  Instead of making the request
again, we can clear request only if !full.

We can also safely move this into the block of below kvm_request_pending()
as Marc used to suggest.

To explicitly use kvm_clear_request(), we may need to be careful on the
memory barriers.  I'm wondering whether we should have moved
smp_mb__after_atomic() into kvm_clear_request() because kvm_clear_request()
is used outside kvm_check_request() and IIUC all the call sites should
better have that barrier too to be safe.

Side note: when I read the code around I also see some mis-use of clear
request where it can be omitted, e.g.:

		if (kvm_check_request(KVM_REQ_UNHALT, vcpu)) {
			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
			vcpu->run->exit_reason = KVM_EXIT_IRQ_WINDOW_OPEN;
		}

Maybe it's a sign of bad naming, so we should renamed kvm_check_request()
to kvm_test_clear_request() too to show that clearing after that is not
needed?

Thanks,

-- 
Peter Xu

