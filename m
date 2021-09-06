Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A91BC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  6 Sep 2021 11:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AC6561027
	for <linux-doc@archiver.kernel.org>; Mon,  6 Sep 2021 11:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbhIFLV2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Sep 2021 07:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42347 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231815AbhIFLV1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Sep 2021 07:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630927222;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j7VH8fL3glvum3Nt0WVFPZDDHGKO9yZkd04H/l3akBA=;
        b=Qj05cyGYy6ALDy97812fK3Snt+vbujbdmxBGJd7XaaaCA8G6fIOF1SxIIO12/u2OKbLHXt
        PZLY0pGw+chH+qDO1cyDuIPnNIUouDotKfyRClvQk/8CaWWS1zuSFryL9/9OibLth44nxZ
        w4u1vMESFELlQ1Lqg2V20AzLOK9LcMs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412--d0p3mhvNeq3tJv08f0bMg-1; Mon, 06 Sep 2021 07:20:21 -0400
X-MC-Unique: -d0p3mhvNeq3tJv08f0bMg-1
Received: by mail-wm1-f71.google.com with SMTP id c2-20020a7bc8420000b0290238db573ab7so3783276wml.5
        for <linux-doc@vger.kernel.org>; Mon, 06 Sep 2021 04:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j7VH8fL3glvum3Nt0WVFPZDDHGKO9yZkd04H/l3akBA=;
        b=d9VfrljIl7X1XppD4NHd1YZbdSfnkO5p9bWvlaQHrO1pQbI72y5M+Ei9V/e7BVYas1
         AykNlLC5EUl+XAf7CDM+73Jr+TYAJPWr2iLK/BuVBJ07HuRM1Tj4HZ+kWGPJmG0NHsOn
         N1ragV+U1eq3Cn9u8bGwg1bFMJItWkg1VgpUYTpXoLYJj2jcu3YSW+LMR3Wc1B2z6Ck2
         YyPZn+2pPx9hOoSdi/zirDThUFyGT5MxtWeRTqxwhDKhq8HRkmQADchu7bJ6iducRykL
         10GZTk3F9sl7wSN6hQyc3Cd1oeGHHyLg19ItOoTNQErmPdNCyXhmj4YMr+fob8o3lzZm
         n8ZQ==
X-Gm-Message-State: AOAM530mWA1hqSDKhIg31lR3fxYVRQas192h551jJPeYUT0hkL9k76Nj
        8ot1ZGsFLxuWQV7SLfkIWfMuGoEXLRjsa7oBHlYkUYej698drIlAREIVRlisuEiOgtlEcjzP11z
        AYgcRDzZeSwT90TPDq+Yh
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr11072646wme.119.1630927220113;
        Mon, 06 Sep 2021 04:20:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnnpEuWDhXm/HsiMYhbswprAY/0U3Qm9lUNt38ZqMW4d4O9iigvGYH5X6vA70t10AlgvDOaw==
X-Received: by 2002:a1c:9a0e:: with SMTP id c14mr11072600wme.119.1630927219810;
        Mon, 06 Sep 2021 04:20:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m11sm7585194wrz.28.2021.09.06.04.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 04:20:19 -0700 (PDT)
Subject: Re: [PATCH v3 6/6] KVM: selftests: test KVM_GUESTDBG_BLOCKIRQ
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     Kieran Bingham <kbingham@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Andrew Jones <drjones@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Johannes Berg <johannes.berg@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Jessica Yu <jeyu@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Yang Weijiang <weijiang.yang@intel.com>,
        linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20210811122927.900604-1-mlevitsk@redhat.com>
 <20210811122927.900604-7-mlevitsk@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <137f2dcc-75d2-9d71-e259-dd66d43ad377@redhat.com>
Date:   Mon, 6 Sep 2021 13:20:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811122927.900604-7-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/08/21 14:29, Maxim Levitsky wrote:
> Modify debug_regs test to create a pending interrupt
> and see that it is blocked when single stepping is done
> with KVM_GUESTDBG_BLOCKIRQ
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   .../testing/selftests/kvm/x86_64/debug_regs.c | 24 ++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)

I haven't looked very much at this, but the test fails.

Paolo

> diff --git a/tools/testing/selftests/kvm/x86_64/debug_regs.c b/tools/testing/selftests/kvm/x86_64/debug_regs.c
> index 6097a8283377..5f078db1bcba 100644
> --- a/tools/testing/selftests/kvm/x86_64/debug_regs.c
> +++ b/tools/testing/selftests/kvm/x86_64/debug_regs.c
> @@ -8,12 +8,15 @@
>   #include <string.h>
>   #include "kvm_util.h"
>   #include "processor.h"
> +#include "apic.h"
>   
>   #define VCPU_ID 0
>   
>   #define DR6_BD		(1 << 13)
>   #define DR7_GD		(1 << 13)
>   
> +#define IRQ_VECTOR 0xAA
> +
>   /* For testing data access debug BP */
>   uint32_t guest_value;
>   
> @@ -21,6 +24,11 @@ extern unsigned char sw_bp, hw_bp, write_data, ss_start, bd_start;
>   
>   static void guest_code(void)
>   {
> +	/* Create a pending interrupt on current vCPU */
> +	x2apic_enable();
> +	x2apic_write_reg(APIC_ICR, APIC_DEST_SELF | APIC_INT_ASSERT |
> +			 APIC_DM_FIXED | IRQ_VECTOR);
> +
>   	/*
>   	 * Software BP tests.
>   	 *
> @@ -38,12 +46,19 @@ static void guest_code(void)
>   		     "mov %%rax,%0;\n\t write_data:"
>   		     : "=m" (guest_value) : : "rax");
>   
> -	/* Single step test, covers 2 basic instructions and 2 emulated */
> +	/*
> +	 * Single step test, covers 2 basic instructions and 2 emulated
> +	 *
> +	 * Enable interrupts during the single stepping to see that
> +	 * pending interrupt we raised is not handled due to KVM_GUESTDBG_BLOCKIRQ
> +	 */
>   	asm volatile("ss_start: "
> +		     "sti\n\t"
>   		     "xor %%eax,%%eax\n\t"
>   		     "cpuid\n\t"
>   		     "movl $0x1a0,%%ecx\n\t"
>   		     "rdmsr\n\t"
> +		     "cli\n\t"
>   		     : : : "eax", "ebx", "ecx", "edx");
>   
>   	/* DR6.BD test */
> @@ -72,11 +87,13 @@ int main(void)
>   	uint64_t cmd;
>   	int i;
>   	/* Instruction lengths starting at ss_start */
> -	int ss_size[4] = {
> +	int ss_size[6] = {
> +		1,		/* sti*/
>   		2,		/* xor */
>   		2,		/* cpuid */
>   		5,		/* mov */
>   		2,		/* rdmsr */
> +		1,		/* cli */
>   	};
>   
>   	if (!kvm_check_cap(KVM_CAP_SET_GUEST_DEBUG)) {
> @@ -154,7 +171,8 @@ int main(void)
>   	for (i = 0; i < (sizeof(ss_size) / sizeof(ss_size[0])); i++) {
>   		target_rip += ss_size[i];
>   		CLEAR_DEBUG();
> -		debug.control = KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SINGLESTEP;
> +		debug.control = KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_SINGLESTEP |
> +				KVM_GUESTDBG_BLOCKIRQ;
>   		debug.arch.debugreg[7] = 0x00000400;
>   		APPLY_DEBUG();
>   		vcpu_run(vm, VCPU_ID);
> 

