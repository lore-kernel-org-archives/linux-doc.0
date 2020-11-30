Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A86FC64E7B
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:00:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F25AB20789
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="crZNzZUj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgK3RAl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:00:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49867 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729015AbgK3RAk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 12:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606755553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I4LH1qAWvewXopVUKwwVaGkrglwVm5xN/89Xs5ZOgWY=;
        b=crZNzZUjTxAfnJGrZzK+CftL/sFGd5Fd3RIJjx9Zs6tEfvNezsQ346gIA+W0JhSj6iPfDQ
        /etVGsv5UfC+UtZd1Sj4nMshqrDhJ2ts1TlTgFzawCGwR+JPb6ZMratLRe/evSg8EE31iq
        DVWrpNgvI8NR0aFFqoeRxyVrt9B8/tA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-TzbBFq4cOBuV7lbU8JAsXg-1; Mon, 30 Nov 2020 11:59:11 -0500
X-MC-Unique: TzbBFq4cOBuV7lbU8JAsXg-1
Received: by mail-ej1-f69.google.com with SMTP id h17so210113ejk.21
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 08:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I4LH1qAWvewXopVUKwwVaGkrglwVm5xN/89Xs5ZOgWY=;
        b=oZxWtuDecvoTeVH7NCdHIDzH3KKAw5en1zUlt2KKm3JBDD1I84GxV65aavYtOwXFVv
         smRXSqAuOds01MlpBcjC5kiPvoquSbjG8DiqlhT8aT1uiRoHy+PgIShrW0UTERlcPpfg
         V8glh+JgWcNezv4CWDiw763lI2gyHgyio9XrCMWJpl0c5Gn9LXxWFxjEdSwVan7EhCdd
         UmDhny+U/WB+f33moUxUuJl64UcxpR3fgKyZqfz8wtU4TuMlOVl54/S9TaKgZpKudgcA
         wDK8Dxly0N00frJ1PZCJTNTlfpLEHe/TTdyhZ1kljviziC2w+BY/R/DDF9SdkM2MZNjN
         29nw==
X-Gm-Message-State: AOAM5326V+UGTXj7Rl/c1L8Qb6CozKr2N7Tj18zFLb0K6jCioHsZN+IZ
        z8nLp1lY/W6O4bt8VXCrL4HTrmflK+xu6+W3VPb9bTiiT712WvfF0bMYIjzr2zgIYSquN4UH1r0
        QbQRT5uku+nsjJ/gLfbHD
X-Received: by 2002:a05:6402:3089:: with SMTP id de9mr22702675edb.100.1606755550677;
        Mon, 30 Nov 2020 08:59:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymalDiKWug9j4JZvUBqiNMbGKSfPpmio8hUaihWWE//+uuNfXrRRf4dxPmhiVrO8rpujqrlA==
X-Received: by 2002:a05:6402:3089:: with SMTP id de9mr22702648edb.100.1606755550512;
        Mon, 30 Nov 2020 08:59:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id k17sm8658535ejj.1.2020.11.30.08.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 08:59:09 -0800 (PST)
Subject: Re: [PATCH 0/2] RFC: Precise TSC migration
To:     Andy Lutomirski <luto@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>
Cc:     kvm list <kvm@vger.kernel.org>, Oliver Upton <oupton@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
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
 <CALCETrVr2bM4yJTVpQULN+EYVQJuWGCvjX0SMFsCRy6BwqZc0w@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <26444d65-083b-5df4-52c9-c1cfad556b10@redhat.com>
Date:   Mon, 30 Nov 2020 17:59:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALCETrVr2bM4yJTVpQULN+EYVQJuWGCvjX0SMFsCRy6BwqZc0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/11/20 17:54, Andy Lutomirski wrote:
>> I*do think*  however that we should redefine KVM_CLOCK_TSC_STABLE
>> in the documentation to state that it only guarantees invariance if the guest
>> doesn't mess with its own TSC.
>>
>> Also I think we should consider enabling the X86_FEATURE_TSC_RELIABLE
>> in the guest kernel, when kvm is detected to avoid the guest even from trying
>> to sync TSC on newly hotplugged vCPUs.
>>
>> (The guest doesn't end up touching TSC_ADJUST usually, but it still might
>> in some cases due to scheduling of guest vCPUs)
>>
>> (X86_FEATURE_TSC_RELIABLE short circuits tsc synchronization on CPU hotplug,
>> and TSC clocksource watchdog, and the later we might want to keep).
> If you're going to change the guest behavior to be more trusting of
> the host, I think
> the host should probably signal this to the guest using a new bit.
> 

Yes, a new CPUID bit takes longer to propagate to existing setups, but 
it is more future proof.

Paolo

