Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4E380FEB
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 19:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329203; cv=pass; b=BwzWzCXI53TANoTW2O3de6Tl20b1DNydXuXkR2+Q1z4s4oQWBQ2Z34VjdkZEYnZaauGzUi/6GFPPmc9nl6MiFD5sDAWaGDlBr5u4WGhnZKKnXDH3qCHwJZo2nJ19FWVBrL6ffNWz3ulbwBz/ribM7Jzq58vhzHPKcVpzbrAJgyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329203; c=relaxed/simple;
	bh=twcHfAFi0y+ft7B9oCr1+JB4Kl9qeBvn6Oj93bDxxCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGs9fcIMx6PzX8FHKxgDL3KiBks12THvN9x/3SWZvZKkDQZtm9q5MgjML/eSQLBOG1wZQlzYgEsP3IkkMWplOCjPIB/DuXvuQ36k8mGBLsLZJSYVvAnZN9BY51PKFjYKy56vWsB9mfV+8Ur/TatMENGG8NhfqdWnkm/jvfDLPDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VqMoMnvy; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VqMoMnvy"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5177d1ff061so58641cf.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 12:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782329201; cv=none;
        d=google.com; s=arc-20260327;
        b=HY+arUurfXX33vgQhFhAD7yDw4/7t4SAxC4+w36Bzla45aTLv94iu2SYZXLQgT/4gq
         b0YwoVx5H6TzSUZD97dc1cOjnZx8Gmj4nTN6VoPZI6XtJfSxT3GWzE8eS4bpiSz+dwLS
         5/vJYNiaCBX+kUC6uiAwoceE3NK73coDO//dBM0FtB0IRlcINxeC9p54bqhH44fUAAZL
         ovgDEHLhr65ksJMd9cbf/iYVvpu/9W0BE/zwv16ZUdAB3lVAJY2Y2xFEkziKj0cPUCb3
         fzvxRH58bM/qsVgISmr6GRx/z5/WhC/ViL/5XIEz1dkxJbKGLcgJGlDy45M5JIeckQvO
         ouqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        fh=zXB+PT9rSsDbc2vVaRCnxkLrDPditWTW3B2WeKY0qqU=;
        b=JybrIzcUo+VSK0rYPzJmRJIe8V0EUhXy5de4kKq6XnNfkoHgKOQhkO2mlvMqrRFS1V
         cZBzifbvVROUdEezBxJTwMVLQPBn5Emv/sNhMAv7Phpq9fYYaZzxQv9R6AbeoTv55tDq
         AA/BYuqHg/4rn5p/Ml8vZrC/VF7biGvtcfX+caj99bSNxZe9b/0u9QVO+db1g9+K2M5V
         48ftutbTL5WXL76K8KMrVVid3ZVO1CYBdzl8MRYUsz9psvLyPEPIqsq3VOJgSRfhn2t8
         9ndl0VS3qHeHUdSYqnsRNqu+LULevsy2GGXDQeF7FsV0hm1mRn6aAsLMYJRQ2gjRXWEv
         eung==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782329201; x=1782934001; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        b=VqMoMnvyGTso0wSVwdCJw5+babz+LBzk3k1sAMD7ejF5T/USCT3wjDHLsUbhGmO0Sv
         lzCdrDG+KnqOwk6MCFvihS8x7wxcqkZM/F4k3pV/0VGGiDv04+6XXHkz5nyfcdCpJFpi
         VlFIk5h2ffP4lA/KoRBCqxjWFL3nm4Eqh4OG6h9y8j1E5C/kxxYEkJcEDuH0YKKeU3iK
         36B6vJ5SJpSX3KvusJc6zvKK5rOuPFX6PQJLY9NVdUKjxz/CuEMZ/2iMEv6ucvFTf3OL
         xEvpO2hTgxPaHqMmTJg4m6wcpfZpBORcQE5pIVl+7tZUx8BSSX+6ADzTTgsPM4/irs0h
         j92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782329201; x=1782934001;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YjWrR34fw6nkV452WVsUflbv5W3gEPx2vCWL5i8qEHs=;
        b=qeec28R0uKYPB+0RR09cJqAt4tzvEBSkkjKb0wa56mLyIDD0Eltwt7997CX8ZXrIl2
         adLbsBfK6rSFt4fk+gZDyAr+VkwV2LBfdNiMbTaWpbDLiuY7jnNQYlcVUxqqIfVxwIGs
         N+k+seMnME3er/qJc7I9McDHoRceu3uvq67EB9+bT34ybb06x4r5qt5JmBTA+C3US635
         rgW0BYQ6L+bIT4whOA1jzZ0eHPkFB0N5sRak86v28Pc8FdycJsFYbbCrC2Gj08tjblNp
         NlovmTRlzuEVXYkKtJLqWAsu9xXPgzieNi7SCaNKuWd03CpWSYhQnQRR9UQm6k/7+5Vq
         MDPw==
X-Forwarded-Encrypted: i=1; AFNElJ+7QaFuYbp5pBoLQO7OqC5mQ2q8j8U4/ZOAbR/DHvMNukhF7yME8yMFDwJ5aEY7KfxWYnQwXcVpVFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+C8iQc3pKq70IMEAVrSXhsyxOqgpQxSs0DDzypPdGlh6IIQV
	ot/CCaflB5joc0nouSKvFd7R0MWS3fswqXY5O29nvLDXvdGt4qln6Z7FmfAB74mTYP9gb+voYEj
	5QGlTwG9cYOpESe/GOLMTDsMmB4yexWBAJYTgnjto
X-Gm-Gg: AfdE7ck+6q1IkxOqfBmeavrBWHnxQl4+4k0tG5awaXlksVxA3k1xxd+8g1WfzlVXnXL
	AlPMilBiJWeHI935rKKMIN6h13XSf+6/ck2Y9z9pn8+GzBohmHNHOaQ6z9YfhV/ygo1ktptZ0S/
	BaZtQV80ShdSBDBZFF/7gSwvTqq5ZMQFtVP3tCeBa8SV5CsrSor1uFfTWefbfdB9AbAAZRFl8P8
	N7z0FCe0DRK/3Bz8pceToSWCPmzmo4wyFgzXd7GQFfHQevsQJdHHencMfN02+0MAch2IRLsepK8
	/bpiYcEf
X-Received: by 2002:a05:622a:a0b:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-51a6ec5b17emr1608501cf.15.1782329199083; Wed, 24 Jun 2026
 12:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-29-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-29-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 20:26:02 +0100
X-Gm-Features: AVVi8CcGG2L_WGfgpW6JtuTQk7CHKKes1x1HHlBx2_zfm1i0mgNuuyxx0bG7ikM
Message-ID: <CA+EHjTw5dJ4HRoN5OxeKaFTgQrstUTVcb6-x3xgWEa-BBk3ZQw@mail.gmail.com>
Subject: Re: [PATCH v8 29/46] KVM: selftests: Add selftests global for guest
 memory attributes capability
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

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Add a global variable, kvm_has_gmem_attributes, to make the result of
> checking for KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES available to all tests.
>
> kvm_has_gmem_attributes is true if guest_memfd tracks memory attributes, as
> opposed to VM-level tracking.
>
> This global variable is synced to the guest for testing convenience, to
> avoid introducing subtle bugs when host/guest state is desynced.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/test_util.h | 2 ++
>  tools/testing/selftests/kvm/lib/kvm_util.c      | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> index a56271c237ae9..51287fac8138a 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -115,6 +115,8 @@ struct guest_random_state {
>  extern u32 guest_random_seed;
>  extern struct guest_random_state guest_rng;
>
> +extern bool kvm_has_gmem_attributes;
> +
>  struct guest_random_state new_guest_random_state(u32 seed);
>  u32 guest_random_u32(struct guest_random_state *state);
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index d5bbc80b2bf1c..b73817f7bc803 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -24,6 +24,8 @@ u32 guest_random_seed;
>  struct guest_random_state guest_rng;
>  static u32 last_guest_seed;
>
> +bool kvm_has_gmem_attributes;
> +
>  static size_t vcpu_mmap_sz(void);
>
>  int __open_path_or_exit(const char *path, int flags, const char *enoent_help)
> @@ -521,6 +523,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
>         }
>         guest_rng = new_guest_random_state(guest_random_seed);
>         sync_global_to_guest(vm, guest_rng);
> +       sync_global_to_guest(vm, kvm_has_gmem_attributes);
>
>         kvm_arch_vm_post_create(vm, nr_runnable_vcpus);
>
> @@ -2286,6 +2289,8 @@ void __attribute((constructor)) kvm_selftest_init(void)
>         guest_random_seed = last_guest_seed = random();
>         pr_info("Random seed: 0x%x\n", guest_random_seed);
>
> +       kvm_has_gmem_attributes = kvm_has_cap(KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES);
> +
>         kvm_selftest_arch_init();
>  }
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
