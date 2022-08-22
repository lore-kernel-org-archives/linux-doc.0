Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B7DC32774
	for <linux-doc@archiver.kernel.org>; Mon, 22 Aug 2022 18:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237524AbiHVS4z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Aug 2022 14:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238366AbiHVS4H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 14:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7383B96E
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661194560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6Sc/GFE/h4auZJmdG2OSNqDhNL2VL4Oyu1Hp2vRC3HE=;
        b=Nw83tg1/OYHthpzCVXPi7OuUSWE05fgMc+kx9OOP51J5BMydsfnfsLYY4AKv23jdOSKczs
        Tt5QyBR4QpD06R5zcxQq53A7+h2L1BFTE1D1AC0xBXZ9mH+BDRbJN5Y96f9Z4tZy1KAb7e
        mS1eYRvzOh0G2wMAHAUYV269KglW2lc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-674-G-k2YcFBNa-fTXqG91PTmA-1; Mon, 22 Aug 2022 14:55:59 -0400
X-MC-Unique: G-k2YcFBNa-fTXqG91PTmA-1
Received: by mail-qt1-f200.google.com with SMTP id fv24-20020a05622a4a1800b003445e593889so8887638qtb.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 11:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=6Sc/GFE/h4auZJmdG2OSNqDhNL2VL4Oyu1Hp2vRC3HE=;
        b=rX48Vp5G+xkp8xBgUeKDNXcPgx0uMPNm2nHvFiv0EN+4oh/6phYsfQuEce561MuwPd
         OB4VyPSxbmEwr4CmDjUfPUc9Z3u87m6Gd1dVNgcFGsvTLaCFtnpj4jQ4c9sGxUtabogK
         k97DEPsEh/XAYTOXympknnDXjOIa65oq8t0vV/W1UyYXxT5Ef7fXVGozv/cT1N0QZwsV
         N1RJPUA3fdBTpcjr/hBGgZOTlAkccLQ0RL4qhUVrDL6jfYOXiuQyN/c6sniHMjbpU4q2
         ikd/IdcrD5w4xl0qYZcfRUhHxH2/lGAbQW+faWiOV0D5oGcT9FOO9XTconrRT9IZfDCz
         SCbw==
X-Gm-Message-State: ACgBeo1kmKwkYmKaidLx71Lr8sduENZTCgT5qazH8ygAIHdP2ElYM8C4
        ZWMYti6eYn5X6kI8ayaoxVK7/NM7WsLpl1hiMRggED3KpwC2zF+4vFSHbADSuYvoVjnJoy/5GaW
        BONyhOJGYxArISW7C8WnC
X-Received: by 2002:a05:622a:451:b0:344:ad2f:692c with SMTP id o17-20020a05622a045100b00344ad2f692cmr9157280qtx.604.1661194558422;
        Mon, 22 Aug 2022 11:55:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4SPwSXVCYhU6Mx1Y/ng2/oG6o7hMCWS3u5m4ddUxyWRbRC8YCvqK2IPkivSnUKC63Wynm2Tg==
X-Received: by 2002:a05:622a:451:b0:344:ad2f:692c with SMTP id o17-20020a05622a045100b00344ad2f692cmr9157248qtx.604.1661194558179;
        Mon, 22 Aug 2022 11:55:58 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id n1-20020ac86741000000b0031eebfcb369sm9093468qtp.97.2022.08.22.11.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 11:55:57 -0700 (PDT)
Date:   Mon, 22 Aug 2022 14:55:55 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gavin Shan <gshan@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, kvmarm@lists.cs.columbia.edu,
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
Message-ID: <YwPRO0r2sfzcbgyz@xz-m1.local>
References: <20220819005601.198436-1-gshan@redhat.com>
 <20220819005601.198436-2-gshan@redhat.com>
 <87lerkwtm5.wl-maz@kernel.org>
 <41fb5a1f-29a9-e6bb-9fab-4c83a2a8fce5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41fb5a1f-29a9-e6bb-9fab-4c83a2a8fce5@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Gavin,

On Mon, Aug 22, 2022 at 11:58:20AM +1000, Gavin Shan wrote:
> > For context, the documentation says:
> > 
> > <quote>
> > - if KVM_CAP_DIRTY_LOG_RING is available, a number of pages at
> >    KVM_DIRTY_LOG_PAGE_OFFSET * PAGE_SIZE. [...]
> > </quote>
> > 
> > What is the reason for picking this particular value?
> > 
> 
> It's inherited from x86. I don't think it has to be this particular value.
> The value is used to distinguish the region's owners like kvm_run, KVM_PIO_PAGE_OFFSET,
> KVM_COALESCED_MMIO_PAGE_OFFSET, and KVM_DIRTY_LOG_PAGE_OFFSET.
> 
> How about to have 2 for KVM_DIRTY_LOG_PAGE_OFFSET in next revision?
> The virtual area is cheap, I guess it's also nice to use x86's
> pattern to have 64 for KVM_DIRTY_LOG_PAGE_OFFSET.
> 
>     #define KVM_COALESCED_MMIO_PAGE_OFFSET   1
>     #define KVM_DIRTY_LOG_PAGE_OFFSET        2

It was chosen not to be continuous of previous used offset because it'll be
the 1st vcpu region that can cover multiple & dynamic number of pages.  I
wanted to leave the 3-63 (x86 used offset 2 already) for small fields so
they can be continuous, which looks a little bit cleaner.

Currently how many pages it'll use depends on the size set by the user,
though there's a max size limited by KVM_DIRTY_RING_MAX_ENTRIES, which is a
maximum of 1MB memory.

So I think setting it to 2 is okay, as long as we keep the rest 1MB address
space for the per-vcpu ring structure, so any new vcpu fields (even if only
1 page will be needed) need to be after that maximum size of the ring.

Thanks,

-- 
Peter Xu

