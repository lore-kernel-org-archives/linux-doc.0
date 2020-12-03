Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E4AC63777
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 11:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EFC3208FE
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 11:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388810AbgLCLn2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Dec 2020 06:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22951 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726710AbgLCLn1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Dec 2020 06:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606995720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z2/JUVMbgmiwF4hVlwNNOMPd3HZB9sBekSW1KAEyKUo=;
        b=eAAGNo9jJ238Io+nRPRPr61HV0KhM0SVlgw9GYABCjWwhgKGjAxn0msKRo+bTtb41mN1Vz
        AUYZwgUoyuLtQ67MsVP7zAK4VneqO6P8/dftmdbZ1Kg1eCmQj2faSgksNbf5MZ74eZlbHg
        lNNtcoH/KoMy8Sii3naNm+sW/snz604=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-1UHPin9AN5iUrYUdL3o3YQ-1; Thu, 03 Dec 2020 06:41:59 -0500
X-MC-Unique: 1UHPin9AN5iUrYUdL3o3YQ-1
Received: by mail-ed1-f71.google.com with SMTP id r16so822104eds.13
        for <linux-doc@vger.kernel.org>; Thu, 03 Dec 2020 03:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z2/JUVMbgmiwF4hVlwNNOMPd3HZB9sBekSW1KAEyKUo=;
        b=FYhbc3zlswdLy1juHIk3oPfHEtZrA92X0TKjiNyWFBlUH/RS9X6RkTIb+SyUr2AVP5
         ukcSZROUxWGD5RtT+VR4icn6yrPRFShcH6xfbhvHqPEU9tTZN7UvX2gr+XoE/NMOpUOh
         X9rjM2QNPG0rSVxEe0hKdNr33gHdD/YdcKrBb8cGCkM9aq7lwYWoRRNViDoQuH3rXphZ
         txe9AnkJCHaksP4dvmK7v6Orp3go3mqAwStnblEjSx+oEh+F/4HvcvoB64vHFcYbDFIC
         pWoIv56XpXs0guS128Gl1WaB+udvjVK0bnyYxvpidmu4hKjzAa3ob9L/eWoAygX/6f1E
         mDyg==
X-Gm-Message-State: AOAM531mRcnO1hXtwd9gtj2FysuCCHYg6fqTeR9u+2Fog9ZlteWiskkW
        1aknJN8aGOAzGvXcZ7ObYrRAd7R568mygLh19Kn1tgfdSTtzOvJweWgtEbwQZykdHL1xY90dE+l
        U2eXZ8GsMgf9M29pGVoT9
X-Received: by 2002:a17:906:2ec3:: with SMTP id s3mr2053823eji.133.1606995718242;
        Thu, 03 Dec 2020 03:41:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxW3JyLsSOLmxQokAFrQzTXTB6znHfAxgajBoxXmC9FZky84x7HveAqEGoG3zNV8WzQk1bLWw==
X-Received: by 2002:a17:906:2ec3:: with SMTP id s3mr2053804eji.133.1606995718043;
        Thu, 03 Dec 2020 03:41:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id z12sm677926ejr.17.2020.12.03.03.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 03:41:57 -0800 (PST)
Subject: Re: [PATCH 0/2] RFC: Precise TSC migration
To:     Thomas Gleixner <tglx@linutronix.de>,
        Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     Oliver Upton <oupton@google.com>, Ingo Molnar <mingo@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wanpeng Li <wanpengli@tencent.com>,
        Borislav Petkov <bp@alien8.de>,
        Jim Mattson <jmattson@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20201130133559.233242-1-mlevitsk@redhat.com>
 <87lfehfhez.fsf@nanos.tec.linutronix.de>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c78ac6dc-8018-11c5-2b1e-c201448472fa@redhat.com>
Date:   Thu, 3 Dec 2020 12:41:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87lfehfhez.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/12/20 20:35, Thomas Gleixner wrote:
>> This makes the random error in calculation of this value invariant
>> across vCPUS, and allows the guest to do kvmclock calculation in userspace
>> (vDSO) since kvmclock parameters are vCPU invariant.
>
> That's not the case today? OMG!

It's optional. If the host tells the guest that the host TSC is messed 
up, kvmclock disables its vDSO implementation and falls back to the syscall.

Paolo

