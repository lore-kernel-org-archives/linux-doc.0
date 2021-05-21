Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6804C04FF3
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 20:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0E59613EA
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 20:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhEUU12 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 16:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36491 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229532AbhEUU12 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 May 2021 16:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621628764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=538ECF91gJCkNsV6K0m49/DR+WsCYP9T9kKj+WEgQUw=;
        b=cSAL+eAFsA3PdoLglROQ5gDza85F+u2vXskQY/GoM4k4D5Gq/i4WIrC+Ghtz36jv+yuCoM
        YKS4i6hkt8/hDs104zmbfVZSs4qNsft/j5oWgnzEGoH2Ec3/Sruqv1x6ddm8zjACkdvUXy
        5chuVHBJJdDH0w5EAas+wqwYp+86E7o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-oPKMh2OzMAavtt24WgMuCw-1; Fri, 21 May 2021 16:26:02 -0400
X-MC-Unique: oPKMh2OzMAavtt24WgMuCw-1
Received: by mail-ed1-f72.google.com with SMTP id m6-20020aa7c4860000b029038d4e973878so7716616edq.10
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 13:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=538ECF91gJCkNsV6K0m49/DR+WsCYP9T9kKj+WEgQUw=;
        b=cePggKddHDSPg4EA8tAlUy2Zy78AsOd0Hr3AiHrws3ZpBGGO0LvMAq9hGIul0xwkul
         2kDlC+cJP0lFD3XdcJiYJvbkhBby4bxNIlFDe20beleNA/BDo4ULzrDifyC/9E+zWoSe
         g78J1hMA0GuT4QwuNV9ph36+Y7WOz9Z5C9Kij+c3GlKOvOTz7pAp042UvDExT3Ys0bxh
         l99OrhazeUlQcl1N/dUh6pDauToS/zyD8NwhdMeBgytaTfWT2/iEwBtdMl3ZqyJND6Ld
         +SVlvZ9ntgIombYl2p241J85tVKgkgE8er+U0OsI8hZ6XwgEbjcWaAKMz5NBgL1I9CEg
         Dcow==
X-Gm-Message-State: AOAM530+rQgAecY4Z/q10HKAYpzCCfRPLulmOfcUkGghAblEy+t2uYJW
        c6dKhD+jav9k6CfKmYfLIULQlztCWLe9qyt6XiExI0B6T83fOH/2qi5Fq2m7Jydl7H48VugEJwt
        EjJpvRmc3540asUYoegRD
X-Received: by 2002:a17:906:408d:: with SMTP id u13mr3539579ejj.128.1621628761495;
        Fri, 21 May 2021 13:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWdTt0OF6CxsPUnwkdM+BeqLBz1MEl7r1QIb+Pld1fs/jKvj4IlpWl2lFYHMg6LfydV3c3fQ==
X-Received: by 2002:a17:906:408d:: with SMTP id u13mr3539559ejj.128.1621628761262;
        Fri, 21 May 2021 13:26:01 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id l28sm4751766edc.29.2021.05.21.13.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 13:26:00 -0700 (PDT)
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Palmer Dabbelt <palmerdabbelt@google.com>, anup@brainfault.org,
        Anup Patel <Anup.Patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, corbet@lwn.net, graf@amazon.com,
        Atish Patra <Atish.Patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Damien Le Moal <Damien.LeMoal@wdc.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <mhng-37377fcb-af8f-455c-be08-db1cd5d4b092@palmerdabbelt-glaptop>
 <ff55329c-709d-c1a5-a807-1942f515bba7@redhat.com>
 <YKfyR5jUu3HMvYg5@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <00d96cc3-026e-bd78-db08-f9e98a4abeff@redhat.com>
Date:   Fri, 21 May 2021 22:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKfyR5jUu3HMvYg5@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21/05/21 19:47, Greg KH wrote:
> If this isn't in any hardware that anyone outside of
> internal-to-company-prototypes, then let's wait until it really is in a
> device that people can test this code on.
> 
> What's the rush to get this merged now if no one can use it?

There is not just hardware, there are simulators and emulators too (you 
can use QEMU to test it for example), and it's not exactly a rush since 
it's basically been ready for 2 years and has hardly seen any code 
changes since v13 which was based on Linux 5.9.

Not having the code upstream is hindering further development so that 
RISC-V KVM can be feature complete when hardware does come out.  Missing 
features and optimizations could be added on top, but they are harder to 
review if they are integrated in a relatively large series instead of 
being done incrementally.  Not having the header files in Linus's tree 
makes it harder to merge RISC-V KVM support in userspace (userspace is 
shielded anyway by any future changes to the hypervisor specification, 
so there's no risk of breaking the ABI).

At some point one has to say enough is enough; for me, that is after one 
year with no changes to the spec and, especially, no deadline in sight 
for freezing it.  The last 5 versions of the patch set were just 
adapting to changes in the generic KVM code.  If the code is good, I 
don't see why the onus of doing those changes should be on Anup, rather 
than being shared amongst all KVM developers as is the case for all the 
other architectures.

Paolo

