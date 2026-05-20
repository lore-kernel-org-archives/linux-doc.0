Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088F35F162
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 22:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314647; cv=pass; b=PgJdXJn+f3SqxQJgHJBvu3Oe+zDQkA/O3dk7GjOrbdHjaptwipO5mlkRujRyOs/sRyDIcReZW8uUaeUXy2MwCMHiEJ4aaQ8YDFRXgg9ELe7PJatlUYd1RW9Mz4WDswaIQn+88GrkKv7CyflagDwkggUJcl/Bs6yQ/eozlabQSY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314647; c=relaxed/simple;
	bh=o95rfOHFgJHNn7OjrZb3oTyna54O2JGL22GSkfMr7TI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KT0uX4lBfqNcg6vniuTBMvtrok3gYKZuK5TdJaLSRxSyLrDopS0L+Mq2THqq7+81qz95AFFiUfRyMn15ep62svujZoKDH8hAFGNHw+HmXh35gw+eOgw0QYk0xQvy4NK71efci5DFew/csoa/aM8IV6kqA/jUQoF7hvh8fqnmOOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3EmepI5; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q3EmepI5"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-575602688deso1890809e0c.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 15:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779314645; cv=none;
        d=google.com; s=arc-20240605;
        b=fe10wGyQ5MWGA33TIV/okF+usVoRlBhlLsuvVcXAG9VHu2X7oc/Bl+pIoennooyhE3
         RT8mrx03soppgj2RqosBaSjXd/mmNMBYW44SFxtPt9Cjj8zH6CKgCIC0Zg2+auTvW9Or
         8KQ87JXzlZOu+XA+refuyE1VilYr49oqu2nzYU58PcQMQMEOsxWiPLa0oXeCZZlwTDMt
         P+uEgex4EwQ8YDkHEA4wflF1FLzMHghBNY5xfwABP3oH9hThm+bhmM3pwceWhrEFq2vu
         /fEOPqXcjrFOPmmMV0s6cel5RVuG04K/z+L3EPBmdYLT+VyDhDxtOsvoQt7kmqp4CUwf
         5kBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=9JThRUESw7nrWZ9dm2cNUbYGQDtPpp53TQuS0A6S/n8=;
        fh=wBZJCWk1A5ZXdHVN4O8GQbUw/xPgpDW9zwRIbVQdD98=;
        b=dAMkYcHpOUN5jd5qErgKammPLHmjIytSOX9YK0EXK4+F/D7OazwWYTXBficgz8jbQ6
         RsrAZLNisaJOsTmxDZDzZa92I9smyRT4nswPs3tXJ/rTnUtD3Pmbh5A9Npq+nw+4juGq
         S68M+ypH/iR9w134vQIFrl2osw3LP9Wxsfc5xpDLpdoe8wYoix9yHcedAjFsQmaD9IY7
         FmVK9dcV9MrcWz6IdhdksOUkJ15HR6pF0Ib8cJBUtkaliBgzBInIYJvMsU66k/NVWYrl
         0b/sABEksJdOn1nkCv4ix6Tn8tQYSpCyS6zN4rY7zij9PI+wMV5T4FA/B2iqRLR5+jkm
         8PoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779314645; x=1779919445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9JThRUESw7nrWZ9dm2cNUbYGQDtPpp53TQuS0A6S/n8=;
        b=Q3EmepI5xCjM/UbrJMyjazBEEPvUNvpMFGxaJTWcCaBCoKBqpmgmVW9nSj96/V0UvR
         YU4SKxefFwTz3vPzyLWtYsQMbMDIZ1+PRFdzrpVNZah5ht/4Lau9SK5Z7Hk2aK9da2QZ
         ElYgUidOH8ZfxbgraipKdjfhW9iC5iCfZ89Q6AG+ReETL2u771mN9ccRwV+LUdYfW+87
         3QCBG1HE9Y3QYujQO861kN1FgiHZbEDNl9xgINQTIQmCpP+kV0DzmjIfElgG3v10zea1
         kXlNWkoqCpFMDgRX93W7Q1rmzGH2debKRDFM5OR34S4Px/gk4DYaiQJX04LkqOmRpVIf
         pbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314645; x=1779919445;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JThRUESw7nrWZ9dm2cNUbYGQDtPpp53TQuS0A6S/n8=;
        b=C4esAdtwWBiIHFq8qj+T4hiTuK6p+bxGrZO6UI1gFNTkCveyuMdQYhRbWCuZ/gal2c
         8CgDGq9po1WpmNnaouKvlfZ081Bl3ihqqSM78r85cL1vi1VDkBKSV7XRhhLfvu8HsG+L
         f5hsVgN9kB0f3jpBiblqYWh404x/91SAzxxp7e+KLlHANlvTx8sfupWuJEcwBS1mo2jm
         qUXgf/Vqd0CZ4ra6yrOWRXhIh6L/Ya27UwfT/LF3UubqJEvp55Vdt6+HShZUXPqKJoEi
         HqU0mKKTiJODqsbR1AcEzs7m2hrOry60ZUNgAySalJ9nQ5u1QuZk7C9851Yrl9rhcpPX
         3TOA==
X-Forwarded-Encrypted: i=1; AFNElJ/CfLIC/La61lKICAcFQMqpyoIfmnyIE8PzsSCKO/w2mK7iyDeMcA8guITGbkysRs6DtmuOndXDuG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKp2uDmwt77rSrYWmBsXJp7U85qpdv7VxptvignIgYjCm3Abnv
	rfsT500fSCmPMGOvuhlY9PO6RFTnylRzeBT49/oID+kGDK8jRRTIA2JZC1YWUpKqD9DncFUZwJH
	EUAklsWabtE1Hp89eVcybtSmACVz1hIaFzCwHne8M
X-Gm-Gg: Acq92OEJJBZlos5L/BUPGa0Nc0OlX8X+HWdBs0cuoSVGSowvYBXtlmwMP3LC8dJ75mv
	AZlykVcAYoIilNXuXkObtjpfQiLKWurflL9CqKy/1BkWjmszG8sejnw/wDlKehC8TUDpzDUzilT
	wwCoOGkSg0hSLq133Cf/zRLLEEdvfKWVE2MCgmzAQSIWWMIcktLQjfxHzxb8YamNr0LaOh+ugpr
	oDehpIBhM/pVE5NPZIUt0tzZkM7YY697LqmZYrFQHOQW1fSODaL707cQta8JCu09A0M0dNRqev/
	fCG0NcrF7ppoHv+QP2KK2+7jd+GijtdPQOoWzZdrHJwqDqE20uCOYvoALZyQ4jUhdtyGlPFDB92
	pHNB7
X-Received: by 2002:a05:6122:c87:b0:575:a6f4:46b4 with SMTP id
 71dfb90a1353d-5842700dc5fmr95996e0c.9.1779314644642; Wed, 20 May 2026
 15:04:04 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 15:04:03 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 15:04:03 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-20-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-20-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 20 May 2026 15:04:03 -0700
X-Gm-Features: AVHnY4Kk5AWPmehPTXT0rrzakigDAOdp5MPH9_MZKvxVyYhTvoPj0_nMCwFjLrY
Message-ID: <CAEvNRgGfWNG_NgC7v70BsZ3CJUu2Nh0KQQBwDdDrcu26=cB92w@mail.gmail.com>
Subject: Re: [PATCH v6 20/43] KVM: guest_memfd: Enable INIT_SHARED on
 guest_memfd for x86 Coco VMs
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Sean Christopherson <seanjc@google.com>
>
> Now that guest_memfd supports tracking private vs. shared within gmem
> itself, allow userspace to specify INIT_SHARED on a guest_memfd instance
> for x86 Confidential Computing (CoCo) VMs, so long as per-VM attributes
> are disabled, i.e. when it's actually possible for a guest_memfd instance
> to contain shared memory.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  arch/x86/kvm/x86.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 1560de1e95be0..6609957ecfea3 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -14172,14 +14172,13 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
>  }
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
> -/*
> - * KVM doesn't yet support initializing guest_memfd memory as shared for VMs
> - * with private memory (the private vs. shared tracking needs to be moved into
> - * guest_memfd).
> - */
>  bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
>  {
> -	return !kvm_arch_has_private_mem(kvm);
> +	/*
> +	 * INIT_SHARED isn't supported if the memory attributes are per-VM,
> +	 * in which case guest_memfd can _only_ be used for private memory.
> +	 */
> +	return !vm_memory_attributes || !kvm_arch_has_private_mem(kvm);

Adding a note here from PUCK on 2026-05-20:

Michael pointed out that it's odd that when vm_memory_attributes is
available, guest_memfd still can only be used for private memory.

It is a little odd, but we don't want to investigate the complexities of
supporting it, and Sean says this is working as intended, in line with
deprecating vm_memory_attributes=true.

>  }
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
>
> --
> 2.54.0.563.g4f69b47b94-goog
