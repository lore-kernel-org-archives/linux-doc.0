Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3F5C4361B
	for <linux-doc@archiver.kernel.org>; Sun,  6 Dec 2020 10:11:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F53E230FA
	for <linux-doc@archiver.kernel.org>; Sun,  6 Dec 2020 10:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgLFKLP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Dec 2020 05:11:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35454 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725794AbgLFKLP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Dec 2020 05:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607249388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xji8+FhOghfu2/XZrvV9/OViBfo6B1ROea5bmQqV1JA=;
        b=a4g/Es2XRiHIuizYz65dtt1pOwMnBtY45rJzzclp0f3uTuLzKqXOmniVJhWWaSq3K5tFMj
        wa2pUxar3TNweYqgV/2+wrz+68qM+zhkiRjyPkOtYlKwHCkSoLoX52nSSvVjaM7OXNXmRI
        DC0vEYKbWW936xITvdQUd+72EPs9ljs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-geCmYDSGNgqs5WmXbWHUIA-1; Sun, 06 Dec 2020 05:09:47 -0500
X-MC-Unique: geCmYDSGNgqs5WmXbWHUIA-1
Received: by mail-wm1-f70.google.com with SMTP id d16so1351846wmd.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Dec 2020 02:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xji8+FhOghfu2/XZrvV9/OViBfo6B1ROea5bmQqV1JA=;
        b=md3hCWdCaSD3ESDS0gspW7sbF84JTgeJekdI8vYccZymDKT3lqhVcUOYj8Pcw+gUDF
         PgR0HXW5pJase7RNiJmo5fsTqjro76wem0Kaam4f28gW96OvPxH2/DDXgRqBpbjFd1PN
         CjAHrhT8BBovqkcYo560z/dzgtjcNCNfAUbzzN9yklKQkdP3WpDGzpZg7BrUkO+w4KMY
         UXD1E3wBVTClLEH8/PPEQrMP1AGW8ZfABD7L8OsNObHEI84ud043yi821ckoG+ZjMAoH
         IRC58D299ML4dAFM3HQ/U9qeQ4TQXwEnORJcZEjl6h/omqEbBMY0Z6ngkX6hRmFoxQhF
         tFWw==
X-Gm-Message-State: AOAM532fbZ6NEn/b7UOP5Rrtj3hCaeGrVT/XfQsAO72gHanIFLjOvJXw
        ZVIQqZpKDFPr99z83JWQeMamyjzw6/A56m5qvbwNKOLKODKA3nk8fz5BZiCaIbJXgqBKcfNu5Ry
        +cz2EjZsY9fpiJyjh/qGq
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr14416581wrn.307.1607249385965;
        Sun, 06 Dec 2020 02:09:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6VBLcLDbM240XPEJbqvQy/D9PtV57yuW3xEvKi5G+E3Gz9EZOlYSr6q6a9ziYlzURpJ9FlA==
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr14416555wrn.307.1607249385766;
        Sun, 06 Dec 2020 02:09:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id d3sm10226839wrr.2.2020.12.06.02.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 02:09:45 -0800 (PST)
Subject: Re: [PATCH] KVM: mmu: Fix SPTE encoding of MMIO generation upper half
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     Sean Christopherson <seanjc@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <156700708db2a5296c5ed7a8b9ac71f1e9765c85.1607129096.git.maciej.szmigiero@oracle.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <370db207-7216-ae26-0c33-dab61e0fdaab@redhat.com>
Date:   Sun, 6 Dec 2020 11:09:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <156700708db2a5296c5ed7a8b9ac71f1e9765c85.1607129096.git.maciej.szmigiero@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/12/20 01:48, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> Commit cae7ed3c2cb0 ("KVM: x86: Refactor the MMIO SPTE generation handling")
> cleaned up the computation of MMIO generation SPTE masks, however it
> introduced a bug how the upper part was encoded:
> SPTE bits 52-61 were supposed to contain bits 10-19 of the current
> generation number, however a missing shift encoded bits 1-10 there instead
> (mostly duplicating the lower part of the encoded generation number that
> then consisted of bits 1-9).
> 
> In the meantime, the upper part was shrunk by one bit and moved by
> subsequent commits to become an upper half of the encoded generation number
> (bits 9-17 of bits 0-17 encoded in a SPTE).
> 
> In addition to the above, commit 56871d444bc4 ("KVM: x86: fix overlap between SPTE_MMIO_MASK and generation")
> has changed the SPTE bit range assigned to encode the generation number and
> the total number of bits encoded but did not update them in the comment
> attached to their defines, nor in the KVM MMU doc.
> Let's do it here, too, since it is too trivial thing to warrant a separate
> commit.
> 
> Fixes: cae7ed3c2cb0 ("KVM: x86: Refactor the MMIO SPTE generation handling")
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> ---


Good catch.  What do you think about this alternative definition?  It 
computes everything from the bit ranges.

#define MMIO_SPTE_GEN_LOW_START         3
#define MMIO_SPTE_GEN_LOW_END           11

#define MMIO_SPTE_GEN_HIGH_START        PT64_SECOND_AVAIL_BITS_SHIFT
#define MMIO_SPTE_GEN_HIGH_END          62

#define MMIO_SPTE_GEN_LOW_MASK          GENMASK_ULL(MMIO_SPTE_GEN_LOW_END, \
 
MMIO_SPTE_GEN_LOW_START)
#define MMIO_SPTE_GEN_HIGH_MASK 
GENMASK_ULL(MMIO_SPTE_GEN_HIGH_END, \
 
MMIO_SPTE_GEN_HIGH_START)

#define MMIO_SPTE_GEN_LOW_BITS          (MMIO_SPTE_GEN_LOW_END - 
MMIO_SPTE_GEN_LOW_START + 1)
#define MMIO_SPTE_GEN_HIGH_BITS         (MMIO_SPTE_GEN_HIGH_END - 
MMIO_SPTE_GEN_HIGH_START + 1)

#define MMIO_SPTE_GEN_LOW_SHIFT         (MMIO_SPTE_GEN_LOW_START - 0)
#define MMIO_SPTE_GEN_HIGH_SHIFT        (MMIO_SPTE_GEN_HIGH_START - 
MMIO_SPTE_GEN_LOW_BITS)

#define MMIO_SPTE_GEN_MASK 
GENMASK_ULL(MMIO_SPTE_GEN_LOW_BITS + MMIO_SPTE_GEN_HIGH_BITS - 1, 0)


Thanks,

Paolo

