Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BB37D13C
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779398829; cv=pass; b=p8EyR+fHScDlrvAW7aANhh5Tuao4V5/1ESACReKpB1VeOyRENvkhIPQpcfD24IRcaABfnAfeberdVe3LeuIpjsZ2eUvfLfNcEAvXwuDCDQFPRZ6AxALumxmbyWT6XSiH3fz7932MfNb4MIy3kM46fGjlKJT0TvIXtpb1vOO+pCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779398829; c=relaxed/simple;
	bh=+LPjIhTg4BXMNC3SwV5cz0pp6+I5UIaFhnvuSezWq/s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOzy3vOq1Gq6ODN8GcbiX2lZN+0a/SMdzrKS5imRihT6roJbYhwT2eAPZFY59uRPgUm8j3hHpcvTVIwZTXRiFg10MZXHtGpze86AbBup/fj79l2UQqrS3JCSJ1nLdRnpWCbjnqE94YyrTW/Ey9IMzP1kZKZp5hc6YSmnf9PPkIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i2ZKStgL; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i2ZKStgL"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-632a055fa9fso2465423137.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 14:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779398826; cv=none;
        d=google.com; s=arc-20240605;
        b=AKds82HuCnbuNtr8wNcwgD+JccoWi1EUJa0cVt4izMOblPRBJEp22lAw9A7AQsD7Qu
         5jMev3O4QhpJ72lOoSH68EZRcngHKagpQEfHGkKoX4YUzJKEyOtGNZn2v/4Cs0oPL+kH
         Jx5uzFqnrTlHmCUW1z6fo0Nejb6hoCx0CWXFoR4M1s/Yx4eXzWU15E8LvwkrwLzy/pne
         1r6Lg/7iajYFyL6YzgiRwPvipUMrNEiv5f7QV9y5xfsKBlOeQr2P0fc3w0MFmlvZlAMm
         LltWG+EUr9sgHw6LMRQ9Oo3NeHc3jH0Nq1bysSnQ9SGtyZDEckLL56GRJ4N4Vgo0nupX
         sSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jpWgFYhhbnAeBja5/b81jA1gJjkVzB/mfvPZ3ghPp+g=;
        fh=REdfAQrMhrPjo8gqXEg1OHM4Kw50BgPG2MpI7Eh7cGM=;
        b=Ypx/Ip9IWCVAWkhMSaA1g09TJDRY9HuI7MVP99d+Bo4tN5ub7wEbugg+S0h+jZJvr/
         /U+eBjQ5XW015/ZT5WtpH9IgudkF6AjVsGBWOCzN+077O5Y76GTQQ5lWt1QtSH5KADLv
         8O+IaInqLwBUAjT2xSMhIshNWl8XSv5UALH4dqxdRwabdNAxJYuMQZFVCET+pozAA/Fe
         tlIfljSH2l4Um+GCYRb1ZigbGB5GYX1L7RGUl/3AtNaqTT1PhCiD0ppOuLU+F21NS5HW
         uPF5lnjke3YfmNUtXTAo79T/Qylqej0Gn7X/umE273t8G9mMGcHiA9UNpoYIOfi7Mgt+
         ncdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779398826; x=1780003626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpWgFYhhbnAeBja5/b81jA1gJjkVzB/mfvPZ3ghPp+g=;
        b=i2ZKStgLDsBl+EtckDy+IFV6GwFoCyTq8ms5MhpksZrJFhPTPgYDzE4iLPE0jlQiYq
         RPytCYF9tgxi98dzeSNO7o20oN7oAbXFFkjGahSY9c1rtQyBfTsDGTa3hiCm3gricSEA
         +lvk6l8IZYWPlD7Q8cjdX+DEbNNENAb9xELah3owOCujqHQ3/3wXNGvdsdltot0q4zOj
         VsspnhWUL9TN54ZKsXNn3cG9lXobPnT2/A+PnydSGSmxJ1hgNttuQsUr6IVAPqdCue9F
         uNC31VfApIwrqQS6h1UWMDgEIOLkKoCnhxnQggo/Jl27YorS2eNwvegmfe5j7BlLd9yy
         C6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779398826; x=1780003626;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpWgFYhhbnAeBja5/b81jA1gJjkVzB/mfvPZ3ghPp+g=;
        b=sW1Z4lVHW9uBKMD5aJzLczM7PRSPdcATIKWSlEA5JBJnMekiJ5kdias0vVTgkttUBW
         P0GW3AzwqJHXbIl7lI1mqOVHflC7xuTBXO33ycnPDxT5iRTpK/T7KXMP2c8wEbb4t/gm
         iXr9jiLXivnyH6oxikVnxV1rWBtGUQWADxlXjmjlUc33o5ZjiG3ZFnRz56EX2OZIiAR9
         ShKwKkwNJQzoZvIl+f0EBVOFZOufHBVIKrpqprbfA4iFu9QUoTABdLPrBM8X3e4/AJeG
         Hpy1leQaEFDm6v0/U6WarvXi8yo9IkEQhnoaiBswQug7F/ueyLboBITrZWdK72faqOXi
         e0gw==
X-Forwarded-Encrypted: i=1; AFNElJ9isTU1Y348aUDKRk6JQ41ZasFEr5e5Pm/WmMLGZx31zrLsgb98JYCJChptflV3sm0LWnxu//liTwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cpfXsM1YX50Fb9dWcqJi4XbhEZpxThCZvX7Vb5wENebn3/7Z
	qaLAeFAlnm575dHSI/Sru1tx40FNTqo0sY6M4rX6C8zjaprBFFBKOp36jXWvaGSzpiMGilms7nP
	7bTm3gX8DkqmMqdnWk+rRI2YH0NJ1dZf809V7rNlo
X-Gm-Gg: Acq92OETKTIgUDqjO7nmuNd4BUad6NVG/DmkAxdZNs8S145YXcMJC2qje9D0VsFhb/e
	HvkBNCVgqpFfDANt4aHeMKSriFG2AQUqMevo3jYE30KnnAcc221Tx8sbHopi29knEPIx9/9b4bh
	dKRs3qcqXSo09dx5EnOiqGNZm43cDHUy87EBdduS4ksgf7xll1Tdmsw8egV0J41D4bY984GjpQB
	ES1KMIDtPyC7M0e3YjSVZd8Nn0iljiNsKWmtmHgrBUAcbuO3OPSVx5+jTRlaKroTK/WGPAZUnZU
	t5/J69UTFtUgVm8Cs0K3/j0F+P546xY72E1f74lhrsgUmEgkiVez9mBXrHkyxZMR9x6H839XPJo
	2nHRW
X-Received: by 2002:a67:e7cb:0:b0:605:6773:611d with SMTP id
 ada2fe7eead31-67c7405f583mr398913137.1.1779398825479; Thu, 21 May 2026
 14:27:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 14:27:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 14:27:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag8G7Wq5PbEdKloG@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-21-91ab5a8b19a4@google.com>
 <CA+EHjTwrygfMrZZSw4y7-ry8fidW2x0C7iuF2Q=dnPNHUmNtUg@mail.gmail.com> <ag8G7Wq5PbEdKloG@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 May 2026 14:27:04 -0700
X-Gm-Features: AVHnY4JKrLHcWBnwxG_jlJLfen-f7c-olGgUCItaPr4oaASPSS6SIhxF205tXG4
Message-ID: <CAEvNRgFB8ydih9JTmsH06H32j38tH-iViZqN_eZ_gQAmXpw+Dw@mail.gmail.com>
Subject: Re: [PATCH v6 21/43] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, May 21, 2026, Fuad Tabba wrote:
>> Hi,
>>
>> On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
>> <devnull+ackerleytng.google.com@kernel.org> wrote:
>> >
>> > From: Michael Roth <michael.roth@amd.com>
>> >
>> > For vm_memory_attributes=1, in-place conversion/population is not
>> > supported, so the initial contents necessarily must need to come
>> > from a separate src address, which is enforced by the current
>> > implementation. However, for vm_memory_attributes=0, it is possible for
>> > guest memory to be initialized directly from userspace by mmap()'ing the
>> > guest_memfd and writing to it while the corresponding GPA ranges are in
>> > a 'shared' state before converting them to the 'private' state expected
>> > by KVM_SEV_SNP_LAUNCH_UPDATE.
>> >
>> > Update the handling/documentation for KVM_SEV_SNP_LAUNCH_UPDATE to allow
>> > for 'uaddr' to be set to NULL when vm_memory_attributes=0, which
>> > SNP_LAUNCH_UPDATE will then use to determine when it should/shouldn't
>> > copy in data from a separate memory location. Continue to enforce
>> > non-NULL for the original vm_memory_attributes=1 case.
>> >
>> > Signed-off-by: Michael Roth <michael.roth@amd.com>
>> > [Added src_page check in error handling path when the firmware command fails]
>> > [Dropped ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES]
>> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>>
>> I'm not very familiar with the SEV-SNP populate flows, but it looks
>> like Sashiko is on to something:
>> https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=21
>>
>> - a potential read-only page overwrite, because src_page is acquired
>> via get_user_pages_fast() without the FOLL_WRITE flag, but is then
>> overwritten via memcpy
>
> Oof, yeah, that's bad.  Adding FOLL_WRITE to kvm_gmem_populate() feels wrong, and
> could break uABI, but doing gup() in SNP code would reintroduce the AB-BA issue
> with filemap_invalidate_lock().
>
> Aha!  Not if we use get_user_page_fast_only().  Ugh, but then we'd have to plumb
> the userspace address into the post-populated callback.
>
> Hrm.  Given that no one has yelled about overwriting their CPUID page, and given
> that the CPUID page is likely dynamically created and thus is unlikely to be a
> read-only mapping (e.g. versus the initial image), maybe this?
>

Overwriting the CPUID page is by design, I think. IIUC if the SNP
firmware doesn't like something about the CPUID page, it can update
src_page and then return an error to userspace.

Userspace should then check if it agrees with the updated CPUID contents
and then retry if it agrees.

> diff --git arch/x86/kvm/svm/sev.c arch/x86/kvm/svm/sev.c
> index 37d4cfa5d980..c73c028d72c1 100644
> --- arch/x86/kvm/svm/sev.c
> +++ arch/x86/kvm/svm/sev.c
> @@ -2456,6 +2456,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>         sev_populate_args.type = params.type;
>
>         count = kvm_gmem_populate(kvm, params.gfn_start, src, npages,
> +                                 params.type == KVM_SEV_SNP_PAGE_TYPE_CPUID,

I think this makes sense given that writing to src_page can only happen
when params.type == KVM_SEV_SNP_PAGE_TYPE_CPUID (this is explicitly one
of the guards in sev_gmem_post_populate()):

	/*
	 * If the firmware command failed handle the reclaim and cleanup of that
	 * PFN before reporting an error.
	 *
	 * Additionally, when invalid CPUID function entries are detected,
	 * firmware writes the expected values into the page and leaves it
	 * unencrypted so it can be used for debugging and error-reporting.
	 *
	 * Copy this page back into the source buffer so userspace can use this
	 * information to provide information on which CPUID leaves/fields
	 * failed CPUID validation.
	 */
	if (ret && !snp_page_reclaim(kvm, pfn) &&
	    sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_CPUID &&
	    sev_populate_args->fw_error == SEV_RET_INVALID_PARAM && src_page) {
		void *src_vaddr = kmap_local_page(src_page);
		void *dst_vaddr = kmap_local_pfn(pfn);

		memcpy(src_vaddr, dst_vaddr, PAGE_SIZE);

		kunmap_local(src_vaddr);
		kunmap_local(dst_vaddr);
	}

>                                   sev_gmem_post_populate, &sev_populate_args);
>         if (count < 0) {
>                 argp->error = sev_populate_args.fw_error;
> diff --git arch/x86/kvm/vmx/tdx.c arch/x86/kvm/vmx/tdx.c
> index f97bcf580e6d..33f35be4455b 100644
> --- arch/x86/kvm/vmx/tdx.c
> +++ arch/x86/kvm/vmx/tdx.c
> @@ -3188,7 +3188,7 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>                 };
>                 gmem_ret = kvm_gmem_populate(kvm, gpa_to_gfn(region.gpa),
>                                              u64_to_user_ptr(region.source_addr),
> -                                            1, tdx_gmem_post_populate, &arg);
> +                                            1, false, tdx_gmem_post_populate, &arg);

And TDX doesn't try to write src_page, so this is good too.

>                 if (gmem_ret < 0) {
>                         ret = gmem_ret;
>                         break;
> diff --git include/linux/kvm_host.h include/linux/kvm_host.h
> index 61a3430957f2..b83cda2870ba 100644
> --- include/linux/kvm_host.h
> +++ include/linux/kvm_host.h
> @@ -2596,7 +2596,8 @@ int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_ord
>  typedef int (*kvm_gmem_populate_cb)(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>                                     struct page *page, void *opaque);
>
> -long kvm_gmem_populate(struct kvm *kvm, gfn_t gfn, void __user *src, long npages,
> +long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src,
> +                      long npages, bool writable,

What do you think of need_writable_src instead of just writable for the
variable name?

>                        kvm_gmem_populate_cb post_populate, void *opaque);
>  #endif
>
> diff --git virt/kvm/guest_memfd.c virt/kvm/guest_memfd.c
> index a35a55571a2d..6553d4e032ce 100644
> --- virt/kvm/guest_memfd.c
> +++ virt/kvm/guest_memfd.c
> @@ -858,7 +858,8 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>         return ret;
>  }
>
> -long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long npages,
> +long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src,
> +                      long npages, bool writable,
>                        kvm_gmem_populate_cb post_populate, void *opaque)
>  {
>         struct kvm_memory_slot *slot;
> @@ -892,8 +893,9 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
>
>                 if (src) {
>                         unsigned long uaddr = (unsigned long)src + i * PAGE_SIZE;
> +                       unsigned int flags = writable ? FOLL_WRITE : 0;

How about using FOLL_WRITE | FOLL_NOFAULT so if it weren't writable to
start with, don't CoW, just error out?

Like you said above the CPUID page provided as src_page would have been
written to before, so it should have been mapped as writable.

>
> -                       ret = get_user_pages_fast(uaddr, 1, 0, &src_page);
> +                       ret = get_user_pages_fast(uaddr, 1, flags, &src_page);

If we stick with FOLL_WRITE, this also solves the case where a read-only
mapping or global zero page are provided as src_page, since
get_user_pages_fast() will do a copy-on-write if those were the inputs,
making it writable before the write happens (on failure) in
sev_gmem_post_populate().

>                         if (ret < 0)
>                                 break;
>                         if (ret != 1) {
>
>> - an ordering violation with the kunmap_local() calls
>
> Yeesh, that's a new one for me.  Thankfully this is 64-bit only, so it's not an
> issue.
>
>> These predate this patch series and are just being touched by the
>> 'src_page' addition, but if Sashiko's right, these should probably be
>> fixed sooner rather than later.
>
> Yeah, ditto with the offset wrapping case.
