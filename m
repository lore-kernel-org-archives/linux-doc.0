Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57735C4361B
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 09:10:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 152A523B75
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 09:10:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgLIJKV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 04:10:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41260 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727899AbgLIJKV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 04:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607504935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z8HlquEoW4X2q/+qcVSM6H75qDDj8W+Dq9wZut/Sz5s=;
        b=OsZ0bIonnXTORI237wlYn5X4VKEJwgHmORSbvBSSG174d1mT+/9EWRvl5E08A/Z0O5ZBJb
        FhjqNVTgj84j3IN+WwCdF3GGKIy3UE2v2taWRflUX5753C4Z1Gz/w9fNzjiANvTGqWL5Oi
        OUiyVIc+q7rS4+ToXEJl1BMelfPUP84=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-yr0yJb7kOsG8w7ol1K1sbA-1; Wed, 09 Dec 2020 04:08:53 -0500
X-MC-Unique: yr0yJb7kOsG8w7ol1K1sbA-1
Received: by mail-ej1-f70.google.com with SMTP id 3so345515ejw.13
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 01:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z8HlquEoW4X2q/+qcVSM6H75qDDj8W+Dq9wZut/Sz5s=;
        b=kg6kTcIAsqlHmJbJ9IM9N1u4lmO374XoRVuIv7P39msd+dgIVe5Ijnn1AEjbD5WTCy
         ZRnqt9LJ9uyCR483BuPPNqGsnXww0HzdF0Zue5OCNzRQwn/vxmHDHvsaLsKyX8fxX8FG
         8UXRNDL5xArvj21cmJPpm4ru0uHE6On5bj+7unieSfEQ65X6QUEeSldJSqA21QKyHuzT
         A73kHCxK1zaN4yQxrLN+AMGg3wBsASs37QQkEBpS0A6vOqUS1oeeksJbBFf1buFvRpB1
         7f/ibYZmW1W7Ieh7ZEymxZyQyosW3W15cqHS2luOK4fG29MDS02zmD1V1mnTXbNtYTIr
         z9vQ==
X-Gm-Message-State: AOAM5312MrKu0BBxuIOiXPYJTFAaKX04Zr9MEpNi2H8Wz9GhCtyr/Xhl
        lFx1aXGsJH4iGe3eEsjXt7dLBbZnhJ2rI2ouAWNDsyOn4geYeADtp2KD2bWmdzWJwN6QNugozlD
        Szfg7ty/NC5xhS1XvYdMO
X-Received: by 2002:a17:906:c193:: with SMTP id g19mr1169797ejz.393.1607504932109;
        Wed, 09 Dec 2020 01:08:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyCALCpD/nDA8Lmv55gbFxBTmrGaC6FbUiJ6kN1W5/lZm38nY8tddFPlonjiINu/+QS9+lYQ==
X-Received: by 2002:a17:906:c193:: with SMTP id g19mr1169784ejz.393.1607504931925;
        Wed, 09 Dec 2020 01:08:51 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
        by smtp.gmail.com with ESMTPSA id m24sm868412ejo.52.2020.12.09.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 01:08:51 -0800 (PST)
Subject: Re: [PATCH] KVM: mmu: Fix SPTE encoding of MMIO generation upper half
To:     Sean Christopherson <seanjc@google.com>
Cc:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Joerg Roedel <joro@8bytes.org>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <156700708db2a5296c5ed7a8b9ac71f1e9765c85.1607129096.git.maciej.szmigiero@oracle.com>
 <370db207-7216-ae26-0c33-dab61e0fdaab@redhat.com>
 <X8/sWzYUjuEYwCuf@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e1dc1cd-b175-86be-b33e-0456ecbd50e8@redhat.com>
Date:   Wed, 9 Dec 2020 10:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X8/sWzYUjuEYwCuf@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/12/20 22:12, Sean Christopherson wrote:
>> #define MMIO_SPTE_GEN_MASK               GENMASK_ULL(MMIO_SPTE_GEN_LOW_BITS + MMIO_SPTE_GEN_HIGH_BITS - 1, 0)
> What if we leave MMIO_SPTE_GEN_MASK as is, GENMASK_ULL(17, 0), and instead add a
> BUILD_BUG_ON() to assert that it matches the above logic?  It's really easy to
> get lost when reading through the chain of defines, I find the explicit mask
> helps provide an anchor/reference for understand what's going on.  It'll require
> an update if/when PT64_SECOND_AVAIL_BITS_SHIFT, but that's not necessarily a bad
> thing, e.g. the comment above this block will also be stale.

Sounds good.

Paolo

