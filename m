Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 404F27D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Aug 2019 13:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfH0NaB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Aug 2019 09:30:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38102 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726952AbfH0NaB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Aug 2019 09:30:01 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 33B9BC0021D3
        for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2019 13:30:00 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id b15so850669wrp.21
        for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2019 06:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=G9L7A4nBpy1D901YxUFl9Z11bC0ZxAJnfNz+eX7/gFs=;
        b=SL+ydrlCU0QTwFzIKOn/QMmbktFxIN3wxQmuWYwWefEOXYMCvWekEDL02NyCIaDDkg
         OvwI2Ezens1tc8/aRrmquBf6dllo3ehCP5zfoCT7Ij1d+eiPf8E/2dTGiXtbnN6+g1WN
         aVkr0S57Ysv4zaZzVOw2p4S1xV9TzZJPhLDmo+XMm62N6govtJ7g1pYFYRwFfjiJxGBb
         JVNJYHT5kRYFd304H7XmJGkgq981RKwsz22V3FFSA6o6Ov3gGiawEn8Zy+QCmJM4JA3j
         X4i3ilOYRcL2JA9xWde4sEd1DEfkVaNHsBc8MM0mLvH5sLE6/HXrABqngtN9IhvjEETJ
         viZw==
X-Gm-Message-State: APjAAAXLvhZ+Ez4azP49OcrHsOJLmEZYa9SVrjSrbIpLmN0hxiSo4ZTO
        ERqxC4KQ2kqp8R7jaBz0T690+uFO8qCYBLfCnSYPkXaQKftipWcbneOyqGOxai80TkcejfObnHF
        Yh+ikEmxniL7Goyt2tNk7
X-Received: by 2002:adf:eb8c:: with SMTP id t12mr29945884wrn.84.1566912598817;
        Tue, 27 Aug 2019 06:29:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmcmZOMUEodvcRMP/rKMW/fx1W1KyCJUxdSLmAlfcCk/OIrgSla8iFeT3+tZ5RICWmd9DdBw==
X-Received: by 2002:adf:eb8c:: with SMTP id t12mr29945849wrn.84.1566912598552;
        Tue, 27 Aug 2019 06:29:58 -0700 (PDT)
Received: from vitty.brq.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id z2sm3154237wmi.2.2019.08.27.06.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 06:29:57 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Tianyu Lan <lantianyu1986@gmail.com>
Cc:     Tianyu Lan <Tianyu.Lan@microsoft.com>, kvm <kvm@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
        "linux-kernel\@vger kernel org" <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Radim Krcmar <rkrcmar@redhat.com>, corbet@lwn.net,
        KY Srinivasan <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Sasha Levin <sashal@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        michael.h.kelley@microsoft.com
Subject: Re: [PATCH V3 0/3] KVM/Hyper-V: Add Hyper-V direct tlb flush support
In-Reply-To: <CAOLK0py2rvYkLPP9uQ6Q7y31Btu4XOsWr3Vsk6GtUDWvg5uUOg@mail.gmail.com>
References: <20190819131737.26942-1-Tianyu.Lan@microsoft.com> <87ftlnm7o8.fsf@vitty.brq.redhat.com> <CAOLK0pzXPG9tBnQoKGTSNHMwXXrEQ4zZH1uWn2F2mQ2ddVcoFA@mail.gmail.com> <87v9uilr5x.fsf@vitty.brq.redhat.com> <CAOLK0py2rvYkLPP9uQ6Q7y31Btu4XOsWr3Vsk6GtUDWvg5uUOg@mail.gmail.com>
Date:   Tue, 27 Aug 2019 15:29:56 +0200
Message-ID: <87sgpmlorv.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tianyu Lan <lantianyu1986@gmail.com> writes:

> On Tue, Aug 27, 2019 at 8:38 PM Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> Tianyu Lan <lantianyu1986@gmail.com> writes:
>>
>> > On Tue, Aug 27, 2019 at 2:41 PM Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >>
>> >> lantianyu1986@gmail.com writes:
>> >>
>> >> > From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>> >> >
>> >> > This patchset is to add Hyper-V direct tlb support in KVM. Hyper-V
>> >> > in L0 can delegate L1 hypervisor to handle tlb flush request from
>> >> > L2 guest when direct tlb flush is enabled in L1.
>> >> >
>> >> > Patch 2 introduces new cap KVM_CAP_HYPERV_DIRECT_TLBFLUSH to enable
>> >> > feature from user space. User space should enable this feature only
>> >> > when Hyper-V hypervisor capability is exposed to guest and KVM profile
>> >> > is hided. There is a parameter conflict between KVM and Hyper-V hypercall.
>> >> > We hope L2 guest doesn't use KVM hypercall when the feature is
>> >> > enabled. Detail please see comment of new API
>> >> > "KVM_CAP_HYPERV_DIRECT_TLBFLUSH"
>> >>
>> >> I was thinking about this for awhile and I think I have a better
>> >> proposal. Instead of adding this new capability let's enable direct TLB
>> >> flush when KVM guest enables Hyper-V Hypercall page (writes to
>> >> HV_X64_MSR_HYPERCALL) - this guarantees that the guest doesn't need KVM
>> >> hypercalls as we can't handle both KVM-style and Hyper-V-style
>> >> hypercalls simultaneously and kvm_emulate_hypercall() does:
>> >>
>> >>         if (kvm_hv_hypercall_enabled(vcpu->kvm))
>> >>                 return kvm_hv_hypercall(vcpu);
>> >>
>> >> What do you think?
>> >>
>> >> (and instead of adding the capability we can add kvm.ko module parameter
>> >> to enable direct tlb flush unconditionally, like
>> >> 'hv_direct_tlbflush=-1/0/1' with '-1' being the default (autoselect
>> >> based on Hyper-V hypercall enablement, '0' - permanently disabled, '1' -
>> >> permanenetly enabled)).
>> >>
>> >
>> > Hi Vitaly::
>> >      Actually, I had such idea before. But user space should check
>> > whether hv tlb flush
>> > is exposed to VM before enabling direct tlb flush. If no, user space
>> > should not direct
>> > tlb flush for guest since Hyper-V will do more check for each
>> > hypercall from nested
>> > VM with enabling the feauter..
>>
>> If TLB Flush enlightenment is not exposed to the VM at all there's no
>> difference if we enable direct TLB flush in eVMCS or not: the guest
>> won't be using 'TLB Flush' hypercall and will do TLB flushing with
>> IPIs. And, in case the guest enables Hyper-V hypercall page, it is
>> definitelly not going to use KVM hypercalls so we can't break these.
>>
>
> Yes, this won't tigger KVM/Hyper-V hypercall conflict. My point is
> that if tlb flush enlightenment is not enabled, enabling direct tlb
> flush will not accelate anything and Hyper-V still will check each
> hypercalls from nested VM in order to intercpt tlb flush hypercall
> But guest won't use tlb flush hypercall in this case. The check
> of each hypercall in Hyper-V is redundant. We may avoid the
> overhead via checking status of tlb flush enlightenment and just
> enable direct tlb flush when it's enabled.

Oh, I see. Yes, this optimization is possible and I'm not against it,
however I doubt it will make a significant difference because no matter
what upon VMCALL we first drop into L0 which can either inject this in
L1 or, in case of direct TLB flush, execute it by itself. Checking if
the hypercall is a TLB flush hypercall is just a register read, it
should be very cheap.

-- 
Vitaly
