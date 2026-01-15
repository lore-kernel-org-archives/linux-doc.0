Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC15329391
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513693; cv=none; b=AzL6+uLPKIIooo5C4ndC3tOZ50L6tqFgfIFKmYkVUzqs9Ad8o6EpK+aMapfzgGmDafMd/NdgQuZ34NrPywwwNsHldGzJSIqVwyrlKl0zZ4JHTPfBVyCHEfNBRXu15xAXZ9o/DMAELpMgPmrnogVTr7mUK481cO4w5Vlz/jkUqq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513693; c=relaxed/simple;
	bh=MU9UbiYSxwq7GU1nltEpbwVASUYpa31Sn9dlFINSwh0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgR2D4kB4f5y3xRjSwSkFrRYmT+IygeFvsD7cuBjFbr+GsvDplmp1o/UZSW9vbZG8ksfxA1dO/bYa6qlI9INTTA74CHnmZPcBS8ge7XPC8VTwqSsUmpvyVBb8RfAZ3B34bu288PQTPIMfl6pvcl3PyNnvURcw6lcssogJoMPjb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cqSIEd9q; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cqSIEd9q"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ef31a77afbso1723968137.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 13:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768513690; x=1769118490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1tpnpSOuS/Js87YOF2H5fRocDrhGRoFky0mpImVftk=;
        b=cqSIEd9qiHPgHv9gnqDiu3reQxfeO0tkgd+5NyxqoUiXxTTY1xYs5N+D/Yx2VTOgAw
         oZhH50bnPM0uhtaWpNGAtaAjBrF9FHEA6YxnaaZr7riCjv1BNC6qtFmk69RNE7r53SHx
         VKXyzCi9Y0qQdep1iIB8vbfhubd3t1YJARk+m+3+wPLxcE0/tRfVXdnm1ll2ORSvmMwY
         3xsuvbANRR0TTYvFAw4FJATQ4OkmIw7nTyMGisctV+OhlabYE21bB5FivmZSc+CqXZ/B
         vvEqYQtxJl+71+fJSkloq9e0rjHwNgX9T+y+ekloRmiVSCZPQUApt7UCEsBuXHbYG+Qf
         rykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768513690; x=1769118490;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1tpnpSOuS/Js87YOF2H5fRocDrhGRoFky0mpImVftk=;
        b=OkcEl1h0kP41L6aLK6FXqG7ub2pCB2eIi3YIjqyrhb4oVPzsKIoqCJShm1htUfyMUs
         X9sCrMlQiqxx0MoF4LWc5jULukRwx/U1+9pR19hCrIEt7znElgSsrUaegyKhp6MUHwX2
         mM1Spa7aQP90CY5spwvRcpawiOF4CdRcAlLvoygoG0PiJpd2VxsMo+WLnMu+Apg0R0rh
         Q3OWSB4H+7zJ16AiEt9NB9qw5qmhK26YdY9IlRTQjlFPsOoHJz/054r+87Gh8qszOa5G
         OTgzcrHgxJb6Bn6IdTeFgc6T8HeFCd+/xKSl59PJSQbQZqM+bt4xzORbIj5wbLthHlrl
         DuMQ==
X-Forwarded-Encrypted: i=1; AJvYcCURUWFLUCglhQVgAF31aqGDS3+fFBOHdevehZWOkaVkAfKfh/B12N84UDpLdRcvcfzzheS7Hz5UBOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrNDDnJGOBn4/mEiyRx/uMCoK7lvxITPXh7Wp9MnTNSF/ReOpS
	Z5Hy/+2LDORpJ+DPkDf8ZrVlQ2RDdBSDBRWL1kscvN9+xD5OeEcfBLJWOvM4jSqud+vjaTPk7PF
	lPudi/35xg4AfT2sKAs2mF5sBXHR02lVp72K4oYif
X-Gm-Gg: AY/fxX7RqJLAC0ZBn5NBI2DobYWpQn15EVh0DzoCCY48wiX3FUy9ZfjYORHUObwot7E
	xEQEiTNtOcrmQ+KmMDT98XmkFyivuuJT0OMTqlP8FF3Jw4nJbsTEi8iL5ejMwDa3URBuGbDy/vb
	iGExMtawtsCV3MF5JKII3Wn106fiP49P/N9cILyqa4bVhPSjkgt2pbA5hWXDYDGNz0gSApa9HwO
	GdXR4vwqt5EKHMaYoBhfC5N6cV8fJSdrxdbqMLTWBtJvjrCgszD/WJQ4vMqgIJz/GKhaOjCg3Yy
	0xR7cB9IfI/NI9Obbh3syKuXaAQaCedGxVw4
X-Received: by 2002:a05:6102:f13:b0:5ec:3107:6b71 with SMTP id
 ada2fe7eead31-5f192508297mr1821684137.14.1768513689093; Thu, 15 Jan 2026
 13:48:09 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:48:08 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:48:08 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260114134510.1835-6-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-6-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 13:48:08 -0800
X-Gm-Features: AZwV_QhGkMBioMKFssSOB50hq7Zm3qSZq1aP9Of9c8wem-vUHGjRo2vWaCWRwKU
Message-ID: <CAEvNRgEhcTE70RLiQo2C_XUdF31qSkQ6yHwpUiXPWb6+6mmA0A@mail.gmail.com>
Subject: Re: [PATCH v9 05/13] KVM: x86: define kvm_arch_gmem_supports_no_direct_map()
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

"Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:

> From: Patrick Roy <patrick.roy@linux.dev>
>
> x86 supports GUEST_MEMFD_FLAG_NO_DIRECT_MAP whenever direct map
> modifications are possible (which is always the case).
>
> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 5a3bfa293e8b..68bd29a52f24 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -28,6 +28,7 @@
>  #include <linux/sched/vhost_task.h>
>  #include <linux/call_once.h>
>  #include <linux/atomic.h>
> +#include <linux/set_memory.h>
>
>  #include <asm/apic.h>
>  #include <asm/pvclock-abi.h>
> @@ -2481,4 +2482,12 @@ static inline bool kvm_arch_has_irq_bypass(void)
>  	return enable_device_posted_irqs;
>  }
>
> +#ifdef CONFIG_KVM_GUEST_MEMFD
> +static inline bool kvm_arch_gmem_supports_no_direct_map(void)
> +{
> +	return can_set_direct_map();
> +}
> +#define kvm_arch_gmem_supports_no_direct_map kvm_arch_gmem_supports_no_direct_map
> +#endif /* CONFIG_KVM_GUEST_MEMFD */
> +
>  #endif /* _ASM_X86_KVM_HOST_H */
> --
> 2.50.1

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
