Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1BEC433ED
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 08:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B75E613B3
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 08:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhEDIWr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 May 2021 04:22:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45240 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230024AbhEDIWr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 May 2021 04:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620116512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GhadwQE+exPzSFPPwlRcTnkbJ2oOmGADkphoNgd5n4k=;
        b=EYdBkQKrVdyS8Klmzyk3PmkuXjFAddeaBW8HKFAhCztXkunLtUQMI0DzukbaRj4O1dco73
        6AU5hrIGWn1NMo7ixLC2lD/FWy3pgYiNlLrNFVX2y781DwQ9c/Li/riadW+oqmpUDSjKFd
        y/eXSj/y0nZfuKOX/trR78oEeYUcBHQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-T07C5BwEPuqUz4zFpkiQLA-1; Tue, 04 May 2021 04:21:50 -0400
X-MC-Unique: T07C5BwEPuqUz4zFpkiQLA-1
Received: by mail-ed1-f71.google.com with SMTP id q18-20020a0564025192b02903888712212fso5889567edd.19
        for <linux-doc@vger.kernel.org>; Tue, 04 May 2021 01:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GhadwQE+exPzSFPPwlRcTnkbJ2oOmGADkphoNgd5n4k=;
        b=cmwLvNb08hVVeNLfr/rNzJ0c+PRgyIvT5XioaHd7Cm3Utj3djoM1sddlDg8qx1XtOO
         T1YRNkMbDwXl9UqatNu7tvqBfnIrw9TpqNzlETfIN1Kbvl/I7abksK6jl+BtMj7J6a3I
         sRL8sG40ZfyUOtdsjwd9fqPADJDQMbYnVe1dfRZQmYn9zmlNnyO/NJazdJkgmdwcQRB5
         ittG6TptbXzH6BnNfYLdmWG6QJUlSjHrdYsiu97HnCeOoQx15/yCFls9lW2bx9MwyiT8
         i8UK1McaLKVJm12i5TfQI5DjyfLuP9NqaVf/gw1fNSL3hpD+vOMCSTLDm2P3CD1isPNp
         TrkQ==
X-Gm-Message-State: AOAM531xMnorvtyn7Dz27yP7hsuHCTmmcV718rOhiYQAtJbMfpUhHrfI
        ndXRbAr7cRCnPFleM2xUS4VYShXrFzOIQ0yxzhXzurfebWEM93XWSkrGQirVhkYUvdEHlkc5bGy
        ytc/DeMy0GKWhzE5cJgHr
X-Received: by 2002:aa7:c30c:: with SMTP id l12mr24469543edq.217.1620116509418;
        Tue, 04 May 2021 01:21:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaVeUuxtPavqNx+CwxlQ0X1+K+Hn5qr9xpndSgFIyEPL3es3Is06zysstjxyTbN1yZ/OOt8A==
X-Received: by 2002:aa7:c30c:: with SMTP id l12mr24469533edq.217.1620116509277;
        Tue, 04 May 2021 01:21:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id ch30sm13593625edb.92.2021.05.04.01.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 01:21:48 -0700 (PDT)
Subject: Re: [PATCH v4] KVM: x86: Fix KVM_GET_CPUID2 ioctl to return cpuid
 entries count
To:     "Denis V. Lunev" <den@openvz.org>,
        Sean Christopherson <seanjc@google.com>,
        Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Shuah Khan <shuah@kernel.org>,
        Aaron Lewis <aaronlewis@google.com>,
        Alexander Graf <graf@amazon.com>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        Like Xu <like.xu@linux.intel.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20210428172729.3551-1-valeriy.vdovin@virtuozzo.com>
 <YIoFFl72VSeuhCRt@google.com>
 <0d68dbc3-8462-7763-fbad-f3b895fcf6e6@redhat.com>
 <be7eedf7-03a2-f998-079d-b18101b8b187@openvz.org>
 <63e54361-0018-ad3b-fb2b-e5dba6a0f221@redhat.com>
 <048b3f3a-379d-cff3-20b6-fc74dd12a98f@openvz.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <514b5373-c07b-ad34-5fba-f8850faf6d68@redhat.com>
Date:   Tue, 4 May 2021 10:21:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <048b3f3a-379d-cff3-20b6-fc74dd12a98f@openvz.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/05/21 10:15, Denis V. Lunev wrote:
> As far as I understand only some testing within kernel now.
> Though we have plans to expose it for QAPI as the series
> in QEMU
>    [PATCH 1/2] qapi: fix error handling for x-vz-query-cpu-model-cpuid
>    [PATCH 2/2] qapi: blacklisted x-vz-query-cpu-model-cpuid in tests
> is not coming in a good way.
> The idea was to avoid manual code rework in QEMU and
> expose collected model at least for debug.

KVM_GET_CPUID2 as a VM ioctl cannot expose the whole truth about CPUID 
either, since it doesn't handle the TSX_CTRL_CPUID_CLEAR bit.  Given 
that QEMU doesn't need KVM_GET_CPUID2; it only needs to save whatever it 
passed to KVM_SET_CPUID2.

Paolo

