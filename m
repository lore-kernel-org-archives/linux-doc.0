Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EB7C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 20:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbiADUBb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 15:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiADUBb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 15:01:31 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688CDC061761
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 12:01:31 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id g11-20020a17090a7d0b00b001b2c12c7273so2269359pjl.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 12:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P38x3udDv7VccpZiXoJefyN8u/f+VmXSebvIF1IMJ9Y=;
        b=qw2oIUC6W97Gros4OgiOyM9i+7wnsvMfbBO23Bw18z3JsaKNq/k2XsNKJCHIs+uVhy
         LmQ2DH+PIflhbQyURRzOlqUVA/dYVzQ12LkZXFq45gUQaxupOlYHXeyYVsxaSjASGl3S
         I3smWKwTp3QwUj7mR7TBDxgbLSUUQaBE7x1YudiYEl9vOXxoPnFxMLlNGowaNoUtOsY7
         oWzeA6Ag6CFEl7bhn8kaTJBmd9SsR0da/cCl2HOmLeD/c6hgdl1K8Vbn+irjyJggrDLD
         G7gxVyMzrcBVJdVBE13VgLzQVG1NPt9Ca/2mS6l4lsOJ1jvBpH4jMbyliEsT9CTHaVRi
         UB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P38x3udDv7VccpZiXoJefyN8u/f+VmXSebvIF1IMJ9Y=;
        b=OyUKrzyaDwzDFMp1H+Q3geDpdE+NfaxMzbY7s7yNFzi4yF0GLhzkxVq6lwV2cvII+q
         G/qALm9ymQrH/SQ5DdvMnFrzMPpM3rL8FuOvZRg8RH7mHPbHto/9EhDN0+8CW6C1RolI
         nvuChWngx46ASvTu7boAE+/LoM+7rtrovSlwvQzZQJuXVqw/VHWaVEvnLjLSL/ypPqwm
         TcGf9dLIkFzU9QWuMgQ4yskgddfcRCxhu1ECHPoC9IanNAvfJsEfH+wmk62ndv+TE6/r
         tdwTytaDLXuq5QWIXjqyxzTQX7ojrj/PWy9ae0WlUgAxkvpCf3rCmIQdRguUtwc1KbWs
         D9NQ==
X-Gm-Message-State: AOAM530lU3Xioz4OXTvRaj1fZz1+lBY4cZSXHMJYyOPy6UdNlFNfP1gB
        xDRmQNqBMbwwKB4W9I5AxFuNQg==
X-Google-Smtp-Source: ABdhPJwBn8VJJJbQjgdjK3BL5ElqCtvbbHY3YHVoqOGEuLZPAF39gjygq4zF9vcYOMP1k5rlARtrIQ==
X-Received: by 2002:a17:902:c94b:b0:149:22af:ed1c with SMTP id i11-20020a170902c94b00b0014922afed1cmr49705852pla.78.1641326490792;
        Tue, 04 Jan 2022 12:01:30 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id nu18sm160918pjb.15.2022.01.04.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 12:01:30 -0800 (PST)
Date:   Tue, 4 Jan 2022 20:01:26 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Yang Zhong <yang.zhong@intel.com>
Cc:     x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, pbonzini@redhat.com, corbet@lwn.net,
        shuah@kernel.org, jun.nakajima@intel.com, kevin.tian@intel.com,
        jing2.liu@linux.intel.com, jing2.liu@intel.com,
        guang.zeng@intel.com, wei.w.wang@intel.com
Subject: Re: [PATCH v4 12/21] kvm: x86: Intercept #NM for saving IA32_XFD_ERR
Message-ID: <YdSnlmO4dUnwRxxc@google.com>
References: <20211229131328.12283-1-yang.zhong@intel.com>
 <20211229131328.12283-13-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229131328.12283-13-yang.zhong@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 29, 2021, Yang Zhong wrote:
> +static void handle_nm_fault_irqoff(struct kvm_vcpu *vcpu)
> +{
> +	rdmsrl(MSR_IA32_XFD_ERR, vcpu->arch.guest_fpu.xfd_err);
> +	kvm_queue_exception(vcpu, NM_VECTOR);

This is still wrong, even though no additional supported is needed to support
nested XFD.  If L1 wants to intercept #NM, then KVM must not inject the #NM and
must not read XFD_ERR.

That this was posted multiple times is disturbing, because kvm-unit-tests has a
test for exactly this, and running it against this series on a host without XFD
yields:

  unchecked MSR access error: RDMSR from 0x1c5 at rIP: 0xffffffffa02478ee (vmx_handle_exit_irqoff+0x1de/0x240 [kvm_intel])
  Call Trace:
   <TASK>
   kvm_arch_vcpu_ioctl_run+0x11a0/0x1fb0 [kvm]
   kvm_vcpu_ioctl+0x279/0x690 [kvm]
   __x64_sys_ioctl+0x83/0xb0
   do_syscall_64+0x3b/0xc0
   entry_SYSCALL_64_after_hwframe+0x44/0xae
   </TASK>
