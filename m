Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69435F189
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857551; cv=pass; b=NXsr94rowWN31/qdO7WYYVZbWsKbR2E1Gr3hWRwYdKUBnJ0MqLFQlV1slXgx/DmVMr0OaXfzwI6rirpxYnMn0AHlpgTh8qrxExyT2bMjBORoVT6MFPYDcM3cXTVGguQQNEmu83dDoN6K/tZbVkl8PfoKNnwsTSQZUEpTRDuHDnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857551; c=relaxed/simple;
	bh=aURqg38Q2gAlcr/J29NBP9ZvAVEI/c5mS9i6CA7HUZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8/rcoowqStxCAetuW6YuycRk7P0Ihz+3moeU09O7q363krF2AaUGGpp5UJNRE1fl/jSFXI6RygdwhWoo4T1zjXNXsTB90wzlB3TxJezZbR3DYa0Zoo+hbRHQJB5sypDJ6s/i+tq0/+qFVikhVyGADIsOleqRqGjEa0vnCzAegg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aHDKUn0o; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aHDKUn0o"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-519ed52bcc6so102401cf.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 01:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857547; cv=none;
        d=google.com; s=arc-20260327;
        b=YEO1S3ywl+Pu+sC9FBOJDC+UWkZ2veo6/V4QqR0Gpe4jW7R/uHPxlL/XxBZfxA2mFX
         e1sJEIalLgikodRmBXNQyydWOmO0poarJWybrTJ+O+hedpRCPVGc2vv1I0JD7GUmbi/v
         irOcnxK9uUdJ/sULIPHJBF06/dFvv8OG+trUrsSsY38yGVgcGmEDRSJfWVy9nBcJbuVN
         AcAEde8OsAkvrp7x1Fj85qgx21EMzcBBMN7Jk2BlCyIUzCtdbBc2khiuL7hx2I1/x5UP
         Z4eFo8l2Zolo49dRZzOe+keLT7ifyL8fEK4BbKf3DgclOnznxR+5VsOi4XXsFo80i5Q1
         inAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        fh=wE3//jbWMpa5PkErj/omqASO8vRqvUBq9F5wC+ZwJRc=;
        b=QVlakgsFRxPmbAgjdWtBqb8Jd1v5lq9/tu3rP2nxLrD2mqvX7ChachBQKkB3S/3Zpe
         1seNxAb9G/YY7MLx3ck2LngDS7OeTjRZ2GoTYDT9DpJkR5Dj9YKJbYtUw6XENJjSnbpa
         ka2ETL1IqCe222q58Ruq3LteE3crjvogOWAMaeCTeSThaNyLQ3iuzYH7tbiReehFV3mk
         7Q2B4aJIc6hSOzbCSLfnQaAU6hp0gJ32H18PYn8CgXLVnm1zegtZd+H9S3PvVxUyuIGJ
         x124WaCwBxV6SbAl9RRmIp2WIRVZSBe2ncD9G16CsJb+/602wG+22T+Q3Pmx7eXhDzdg
         oCyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857547; x=1782462347; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        b=aHDKUn0oEsPciDKO1kSZo0NLWv4KKT0Z+YlhPbhSqvJu1CxsZRYy9ugfoIFsNp1LIj
         yrqIOlaXmWAih8ZPF3Fg2dnH2D4Dtn/nXcsi/q71iCrrrHkvi1J1raYKaOIoihfDsiKg
         gLiBxgRimBSYWR3a8g1al7a28aj49lDKZLogGTIGRlvhZ8Dre03eKAH8ZH327BjN4fTG
         Aj11FXph/mPXRURYpRM3zxOArhd7x04zXayFCxi6G7IMg4iIU9v5suZdTmwYsCZ4w3um
         uIiRw2U4lGX+GHWb9jsEdGpP+VJndkZFN6H/tdl/VOV/tC+SgVwiAnAc2DsBfORpktPa
         zsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857547; x=1782462347;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        b=sbDx32kHJn7fPSlqUY/gZW46lkxdRxiRbRN/8lzT3nNF0QoxzZ+h/dO8ZouxxYhOxK
         z0DyIXPWWM/YBp5V6O0JStcI0LdYGJIP7NPYkSivR8sWxmYu2HawuSfBlNdq/d3L/jmR
         pzZqAmfjrT2BiQkRKcDPwswnx94LEpTuagMdcJXkfSF1JNCyH+AWum2k4bETw+kBz8VQ
         mVFemlm2JpkmiwgiCFIaCl2pt3E4C3bhqolSiDKMF/hGVIBs638xRfkcV0555/4eHXlW
         yoPMX3608/242g4T84W0xUNVSbztVeygETHA7ts8Lfu1BZ7N6W+ToAY1gYz8wEDSlZTE
         CbKg==
X-Forwarded-Encrypted: i=1; AFNElJ9NsvMMKE486tUtPUtaUreeMb3crIrHvXd2k7bw6tOcFFK4RWLn8h7qzMo5/HaqZtKloKC2Zavvyxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KZA/eVFfPCqvmTTtUPC9EObzd12kirnNiGUiKQztRC1UKiX3
	sNrCgMS7uckzWcXtpIDTF08Xq7y8H43X/YxJRcCWT84A6xJLJxfyT4abr9NpW940q8KOVmAELYS
	7n+NswAwNN7ygYysXEXaQKlb3EFijsYm8wgl7IOpM
X-Gm-Gg: AfdE7cnl7jkL4ZqHC11ClJWY/RMGyoy3P2E39HmTYI+27sJ1oKXV9tAfHQv97HQ3aZj
	6RldHVl6yapYeCsxznDAQqXs3yfOy9r3gJDXqiVznzallRFPVhY2wr/tZH8C2jLSa7G3pKYRS5q
	MMg6O0fIAsyBU7e6YLVw7OZlKlleSvFZy0NYZ3hIglnu1V9i5drfcm5pr1V4ohx83FwzF2aaG9C
	kocrESrjwfq+m5Tbnt1oSoTfDKJE/C87CfA1e8Ex3IZHIimYEZcaF49TNIsmkxO6UjDkGvijw==
X-Received: by 2002:a05:622a:1b88:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-519e891c801mr4739831cf.7.1781857546581; Fri, 19 Jun 2026
 01:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:25:09 +0100
X-Gm-Features: AVVi8CeyI3PAg86WrGg3AslQ1YuW7acL6Ym-NulDiNjx1M0Fc6iTcS7y2ypGj0E
Message-ID: <CA+EHjTzh+iThoVnLOGbRDgacKFcvbBxx9m_72bhfafE4J7a7jw@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Introduce function for KVM to check the private/shared status of guest
> memory at a given GFN.
>
> This will be used in a later patch.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h |  2 ++
>  virt/kvm/guest_memfd.c   | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3915da2a61778..27687fb9d5201 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2575,6 +2575,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn);
> +
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
>                      int *max_order);
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 8101f64e0366f..bca912db5be6e 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -510,6 +510,37 @@ static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
>         return 0;
>  }
>
> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn)
> +{
> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> +       struct inode *inode;
> +
> +       /*
> +        * If this gfn has no associated memslot, there's no chance of the gfn
> +        * being backed by private memory, since guest_memfd must be used for
> +        * private memory, and guest_memfd must be associated with some memslot.
> +        */
> +       if (!slot)
> +               return 0;
> +
> +       CLASS(gmem_get_file, file)(slot);
> +       if (!file)
> +               return 0;
> +
> +       inode = file_inode(file);
> +
> +       /*
> +        * Rely on the maple tree's internal RCU lock to ensure a
> +        * stable result. This result can become stale as soon as the
> +        * lock is dropped, so the caller _must_ still protect
> +        * consumption of private vs. shared by checking
> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> +        * against ongoing attribute updates.
> +        */
> +       return kvm_gmem_is_private_mem(inode, kvm_gmem_get_index(slot, gfn));
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_is_private);
> +
>  static struct file_operations kvm_gmem_fops = {
>         .mmap           = kvm_gmem_mmap,
>         .open           = generic_file_open,
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
