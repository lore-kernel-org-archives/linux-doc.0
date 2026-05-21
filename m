Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507D34DB46
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365640; cv=pass; b=fFS0DCLI8sy61XJbWnm+cF1e+iyhGh02jyULoCmmmx18PRcShFFG5sYjx2jC3eXtEYDQVGRGpd3GujqKm6k7C6xPfc7KAjYJtuhzx21sR6pZ8fGxUfGtUH102g06Q+7WW31VsaREAKxcCigNGmhndf+/7CGWxQlR6VBPd2Th2ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365640; c=relaxed/simple;
	bh=LYJgALBMb92rrgNb+Wzk0+WAd9qpquSCRXx7gbDTCrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjb52SwC1HJkvP8tTiTzLOF+txxgyvJd9uBbyBNNdlxd8H4dZj7fYcJdhMDeGen0WkxbQzy5i7JD80WoAqcP98KN4dBCfbM1JiI6iYxsi0ifzT/BH2K7zgOIm25OYiNetca2VhF6imCvQNBtRSIZXae0kpFT+a6IKI4JI7Iz6OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ai2mvyeS; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ai2mvyeS"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d864c23bdso31451cf.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 05:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365638; cv=none;
        d=google.com; s=arc-20240605;
        b=eQId1TE51KfQiL4RO07wmWkJX5QC1xEQBTic+q5p9BjBFan7Xlq8ULxGQ+l6P4973j
         wFOW65lPW1Ai+QfmOPcfqoI/12kp28ENgwl7ePsVkmfp1sTbZ9Xlvt/dK65tQ56e0P8r
         enhZqZG0qv4BE0Np9UvluwaWzjMMXx3qhKkWkpa0NXzHc8/n0grEZsYnwqX3H8tiU9/f
         lPKMG74AAL/JhhVyDuQAzC2+h8W1vNUPGHcFoz3fOq3toARfMe8x5ohCOIo+wHByYGkZ
         aIGrddnMszALhjkBhxsyFLYcdBITMIuGeGWWzMBNgSAGik/oLR2e+HsN43pJUIVKYe/t
         IHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        fh=wqf3Ioxkw8ORfq3N9vxEqU69WovmioZP6GluAIi5lec=;
        b=G90Gn4HZMVY/QLd5aEtA9IRDK9fTS9Sf7nr4n4xe3mNkE9jq9CoKLitu0zlnUCm4na
         3rydXXsHHu42BSzb8GlHo+314pvHOsu+P9cAGquwuigRF2PcxuftN3kls/FdZwQ4zlKP
         tGVufsasY9LkFYJTZ3iSwTMahLzjDCgIR24SneZMw9Q026n1r/7f5a7aACytpABGAOD6
         Nj/fjSxit4A6deFq9EfssRkWFFjuQFm5+PRLtoQPs9egolSbUiEt59RipSQQMIiLXa9+
         WEmfD84vDwHUizGmOTzfe/Tvs9jZpo/6kHrtFD4vfAujwLj26NUMPK8LCQIbclDcK00A
         X2CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779365638; x=1779970438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        b=ai2mvyeSqWfWYz+Q7nLQxEDw82SQKcefiFjkOFabOHaNT+f6TCUGYxXfomzgDp+JNu
         ohkpNy3Fy/WFE7DL7qvCx2z3H1jAdqxSaEMmQ8Ykl4qZ13yKFlk64YeYaVx7Kw3j1nkL
         DZ5uw2U9mhZEMC758YycLMhPvjypav/ZxLgy3MoW4C++5YdcGYNw8Jr9yxZ393pHpUYS
         6HRtHVsnHFo6VxTVZ2NRbpOsdgeRv1LSVYP9EJzG9olzg7w45wS34vkddA/l/ON5Ae45
         E2F17SHzigYMl40bTRjcpdggWbs/BBCwj2eFlRtW0eYSofuwzNEK9ZpIMpCXwjLSqIST
         5MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365638; x=1779970438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJBi6kqgS/T+2nzhRr9ooN0dsVaPQuEMdq7fBLHxWNg=;
        b=gM9xrHS6hy/a+Gc97p7E9bvsmrBFMWQLsbDdjNY7C21VI/HsB0k/wDDX5gPwIyel8y
         devjomKNC82/w1FQl7KVej5GyeF5jzdo+C9+GsRwDkKJyPfLDGA/L9xMCQOAFfa3j0ak
         X+GYtelwSRsscqkLXcuWzSe2qBIykzv+T8q3lQ8SveaNZRkB7+z6pqfB/SzNDVk8rvXe
         xhkB8ukFzaKRVR44u2gJL+ZXBymzFf5BsmZcWsdltNOD8xzqRp2776IXGkXGaVXMRt+l
         nG0N5FDaZbDViwPfPD7H67qmMUibVAUpbSMSZn6zW3ApawvQ5Cd6HFHuWCQKZo0CgTzZ
         DXKA==
X-Forwarded-Encrypted: i=1; AFNElJ+NRCjrCg/FlCwZNo/3I5VeHIfj8q5nl6ftvx4TvLLhP4WU9wTsX+xhsbdwqXhdJ7KkdvIkxZASv/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzrzRGHngm6gs15ptfVP97TcTj8/1oeK/Fjs1qiifEsq4tIGhl
	D+DRFU40pfojqTpnP17jHRbwOqhoWgzXgaC116l1YMvFUT+y5kF3CrPNPYCwEtwj9BIHvVMSAY3
	DpubHtJtSydlPG2izk96OUwnRah6ex5xIxQfqAs3y
X-Gm-Gg: Acq92OF9Aq093/Y8bamHg6ApWfmO/74X9GWNWYLeMsBuyAquu1WChr9RgQ53KtCwQoD
	0HZm32Otcu6JWCxTadwViJj+km0f/XSOCP58DYFIpnu2UI9NbLxh8gJLmHctjVqbjIrNx4FFu+R
	u4ZL1v9qitCMtBxymy6cRtwQgGcBZYQcilyPskVMZOYQA0RYuE9R4bg1wgUG0gUOP/dQBi+IpTq
	W2PxP0JX08CYnQbpKWob3CPpGJ+ll9AS+3oTYc1IjXHdTLiu7gFTcG4pHaSj0wER7c/AR7qkSLE
	R7PCfo2CLe7DFqP/ayU=
X-Received: by 2002:a05:622a:a94e:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-516c552fa38mr6885881cf.22.1779365636942; Thu, 21 May 2026
 05:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-24-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-24-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 13:13:19 +0100
X-Gm-Features: AVHnY4KHC9HIiDmjKgEge5iH3VKNmS75Hv9JyZN2WMHPkcnLceuX40X-36gd_Tk
Message-ID: <CA+EHjTzfo0_uxHbrcntLdHLaLGB3uO41+JzcyW+vHr+u=VB5=g@mail.gmail.com>
Subject: Re: [PATCH v6 24/43] KVM: selftests: Rename guest_memfd{,_offset} to gmem_{fd,offset}
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:23, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Rename local variables and function parameters for the guest memory file
> descriptor and its offset to use a "gmem_" prefix instead of
> "guest_memfd_".
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/kvm_util.h |  6 +++---
>  tools/testing/selftests/kvm/lib/kvm_util.c     | 26 +++++++++++++-------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 2ecaaa0e99654..f19383376ee8e 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -690,17 +690,17 @@ int __vm_set_user_memory_region(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva);
>  void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva,
> -                               u32 guest_memfd, u64 guest_memfd_offset);
> +                               u32 gmem_fd, u64 gmem_offset);
>  int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                  gpa_t gpa, u64 size, void *hva,
> -                                u32 guest_memfd, u64 guest_memfd_offset);
> +                                u32 gmem_fd, u64 gmem_offset);
>
>  void vm_userspace_mem_region_add(struct kvm_vm *vm,
>                                  enum vm_mem_backing_src_type src_type,
>                                  gpa_t gpa, u32 slot, u64 npages, u32 flags);
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int guest_memfd_fd, u64 guest_memfd_offset);
> +               int gmem_fd, u64 gmem_offset);
>
>  #ifndef vm_arch_has_protected_memory
>  static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index df73b23a4c66a..11da9b7546d03 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -947,7 +947,7 @@ void vm_set_user_memory_region(struct kvm_vm *vm, u32 slot, u32 flags,
>
>  int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                  gpa_t gpa, u64 size, void *hva,
> -                                u32 guest_memfd, u64 guest_memfd_offset)
> +                                u32 gmem_fd, u64 gmem_offset)
>  {
>         struct kvm_userspace_memory_region2 region = {
>                 .slot = slot,
> @@ -955,8 +955,8 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                 .guest_phys_addr = gpa,
>                 .memory_size = size,
>                 .userspace_addr = (uintptr_t)hva,
> -               .guest_memfd = guest_memfd,
> -               .guest_memfd_offset = guest_memfd_offset,
> +               .guest_memfd = gmem_fd,
> +               .guest_memfd_offset = gmem_offset,
>         };
>
>         TEST_REQUIRE_SET_USER_MEMORY_REGION2();
> @@ -966,10 +966,10 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>
>  void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>                                 gpa_t gpa, u64 size, void *hva,
> -                               u32 guest_memfd, u64 guest_memfd_offset)
> +                               u32 gmem_fd, u64 gmem_offset)
>  {
>         int ret = __vm_set_user_memory_region2(vm, slot, flags, gpa, size, hva,
> -                                              guest_memfd, guest_memfd_offset);
> +                                              gmem_fd, gmem_offset);
>
>         TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed, errno = %d (%s)",
>                     errno, strerror(errno));
> @@ -979,7 +979,7 @@ void vm_set_user_memory_region2(struct kvm_vm *vm, u32 slot, u32 flags,
>  /* FIXME: This thing needs to be ripped apart and rewritten. */
>  void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 gpa_t gpa, u32 slot, u64 npages, u32 flags,
> -               int guest_memfd, u64 guest_memfd_offset)
> +               int gmem_fd, u64 gmem_offset)
>  {
>         int ret;
>         struct userspace_mem_region *region;
> @@ -1055,12 +1055,12 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                 region->mmap_size += alignment;
>
>         if (flags & KVM_MEM_GUEST_MEMFD) {
> -               if (guest_memfd < 0) {
> -                       u32 guest_memfd_flags = 0;
> +               if (gmem_fd < 0) {
> +                       u32 gmem_flags = 0;
>
> -                       TEST_ASSERT(!guest_memfd_offset,
> +                       TEST_ASSERT(!gmem_offset,
>                                     "Offset must be zero when creating new guest_memfd");
> -                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> +                       gmem_fd = vm_create_guest_memfd(vm, mem_size, gmem_flags);
>                 } else {
>                         /*
>                          * Install a unique fd for each memslot so that the fd
> @@ -1068,11 +1068,11 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                          * needing to track if the fd is owned by the framework
>                          * or by the caller.
>                          */
> -                       guest_memfd = kvm_dup(guest_memfd);
> +                       gmem_fd = kvm_dup(gmem_fd);
>                 }
>
> -               region->region.guest_memfd = guest_memfd;
> -               region->region.guest_memfd_offset = guest_memfd_offset;
> +               region->region.guest_memfd = gmem_fd;
> +               region->region.guest_memfd_offset = gmem_offset;
>         } else {
>                 region->region.guest_memfd = -1;
>         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
