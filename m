Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456381EA65
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782345949; cv=pass; b=fGrLebyYAT0fWFiBM8O1ibKi4Ls8Xl2YrkpzF8gKEVkACeQIADGuFU4sCwaMBLS+LoM9QRkrfHXCrRBh7Fdv006J6C0uLjVmTg0bODXAqTjVTxznfJdAxHtXPujw8NOs+cqksWvhJiXbs8Oa623wMHbzW7bL8Ga6Atbj0sFgEpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782345949; c=relaxed/simple;
	bh=Vhp59FnIevSXEEdWsugGzaR2Idu0ffRc20bSQFGQLZc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bhsp5U/5bZjdWrsdhzBo7N6+uTy09WRpAC2HTgmUGwNjTN6BPD4+PUT4m4FUl1/t5blsZtBElTy5iHHkwAw0YPlWnAKNecX4yd10exP51u7mC9skwkv6xaypTJksT8hZvegimEZCL177nFBt2YWavwfyMZ8Hj0u4WdZu5VTCTSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hOKPGFlt; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOKPGFlt"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-139a71baa35so4316982c88.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 17:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782345947; cv=none;
        d=google.com; s=arc-20260327;
        b=UG311UQtl1SgcLP4uRGJ2QbFBdkkskP5gnCV7IaThdETZn0QSanL9/dQzDSjleANzu
         R1cgMlXQJobN7XhGvW1Qn7u4KUaIu1Fr4VaDoUUA/9AGXTDhJqWFXDTXPLf9LG0CEuEP
         wCTgXj30Wg6nKFz48qclCcPNrClj47bwxN36SbIW95m6kglKcUqRdBEtEf6U2uq6MnrQ
         JjCq3Qd7+DE/WFkMEe6lFwE8uvkI3uZzb+kmG6mx3pElvWzamwbg/KxIrhxpkYlIJHXv
         ujF66FU9yvuBL1SY7IXgL6mxMOnbjApLah2TKzx764sIEaJonCAhJdEJzMOmSTO7JB+G
         hvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        fh=hy70jvbiySSBA5zcGIrY5sptFeB0Dpag56XMvR+J11w=;
        b=TSsz4okKXu20fVWIsWjTp4DMY2vev8zCnKanwsMLQ4mnvIS8eWjk+mfY248TR3bT7a
         F3+T+LRyQBS14vm+bqmEIND/rcnvhUj4JyGO/XSyuraF0wcl0fkUbq3ddKM2jFzXeddd
         85u6JWTJntyWsSDE3hWK5q/jtVf+jB+YEud18OpJGFTFzmQQA1JZJYuPG2R/eI0qma5+
         wI0Jy33QIrwrYPfP9XsAMZJ2gljFImNUMFzBaUC5Y3F0Z8Ocvvx7/7as8DKqzwXgELSg
         O9Yx3pY7kXCaU9kdxQ9j8auJvwSlkSkK8TVzIX3xoxKcpi4SxyTDES1ik5MWZykDvQqE
         c1xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782345947; x=1782950747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        b=hOKPGFltRjIywh7NhJRbZLBxvpHmMPXFX5eXQxaEfRzMWfErqyPd5s76gliKoS+W2u
         O3edmbj7F1czDUHL9ObJdwL5DZ7Vm1lZZCMNG/qS4W7Kf14GLsWwtqeTmMHOkvT992zJ
         xWUxeJnJucTrrPj1WyX4RzFEx9J/uEVVFgDdTtuXo2AvrwN+fdn8Ajc7UkY7Ij0HwsL9
         b4CL1PDru8CIWOKFYjHR7w/asYibNAC9KTKgzRur6huZI7woizeUynaI/lKndRtz2xqR
         DDIS+rY4ueUtvNycgls1qPcJr2czRm9E3TnO05FgOziI3P0aFubRHKdrD9CPQqkeUS7M
         EOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782345947; x=1782950747;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpepC4xFaJGVnjf18g1C8zYeq9gRMdq/7IlUInDggZs=;
        b=KDB9fPvrFAMv95qBrq0On2HkiPNTQM356xVaX6Yup321GtCnsRAMGCrBTF+ca29HWR
         Snolr50wwlMYRNiERC0ySZ4TzOElbH8ZolcxiYyELVgdmHWMXB76JbeSt7tCurAglrx1
         uDt4gv/B+BcSyiH9l85NDQi3ui/zyUMzEQias2nHOQBSRsxhbV1iBoYPWwiZ+Q0jPeuh
         pczbeGAoHxdJxMahUVYW6QDCEz2BbU5T4IhzJw7YvYRgiBMF9B6jz+vyfkl4CX1KpiNa
         XvdQU0vCZn7RwJyGLvc/W9Zo4RyBXbLyg9wvJJyAAboD4ku3glMJIOsQk3z9GQlOr6hd
         iSZw==
X-Forwarded-Encrypted: i=1; AFNElJ90dTbPZgRupNywSb6M5Coue/l0Zzd3+VNxQH6tFfeue4kiMcbfYXSP0fiTcqNNI03dW27hkZIHSy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLXQhckbKqvjljoAkBuJkb3j+hHG02zw526w2Cj3dsd8mPk0pp
	6PuVTKqFEV/A3NJkDEF6HSuJabF4ityCRdVQ+LJQ6TLApLIZd/7gy/xp+ZqeIiO2OfrLwYosErH
	B9a5HN9lrhfGVAl1fYxFhhqfqRxhFlib3WnqDKlYm
X-Gm-Gg: AfdE7clYHVLvrMbiGoMt6tSWrm9FUOUVmkTu65clYe5NAH6WnhR+zAGepgfWb7e5Ne5
	jpAkGAsGyuJ6tmMZ6NtuPTLgAFOC9GEUW82ZnN4Qc1owlaCXJ/O5McNOBnr0S0lWoshh+tqODKV
	cAQYcO0+zAUcvvGHyZh2+Lrw2S41bj0+g6zjamHoabRsqHDb0Kms+YSqeL2lK1iBfV9k6DYZHZK
	La3VtEigbblV3laMrnOzYGAtP23ko1MVfkMaO5h8Dc6XTY5aHC0t2DNgAD1vtv9AFg9gkRYgduD
	0xV79/qhhA/zfFSV10INZocW/lUgADW2lMTPvAVLjF0pHklF5rugybX1irs=
X-Received: by 2002:a05:7022:e01:b0:138:49ea:f463 with SMTP id
 a92af1059eb24-139dba54880mr251235c88.16.1782345945708; Wed, 24 Jun 2026
 17:05:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:05:44 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:05:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com> <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:05:44 -0700
X-Gm-Features: AVVi8CctoVihMuJ7SOXsg73Uq4ZLzDcGYZqps3qpfVHZ_IQN9jIN9AXdoFf5CH4
Message-ID: <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
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

Yan Zhao <yan.y.zhao@intel.com> writes:

>
> [...snip...]
>
>>
>>  #ifdef kvm_arch_has_private_mem
>> -bool __ro_after_init gmem_in_place_conversion = false;
>> +bool __ro_after_init gmem_in_place_conversion = !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
>> +module_param(gmem_in_place_conversion, bool, 0444);
>
> With gmem_in_place_conversion=true, userspace can create guest_memfd without the
> MMAP flag. In such cases, shared memory is allocated from different backends.
> This means this module parameter only enables per-gmem memory attribute and does
> not guarantee that gmem in-place conversion will actually occur.
>
> To avoid confusion, could we rename this module parameter to something more
> accurate, such as gmem_memory_attribute?
>

I asked Sean about this after getting some fixes off list. Sean said
gmem_in_place_conversion is named for a host admin to use, and something
like gmem_memory_attributes is too much implementation details for the
admin.

Sean, would you reconsider since Yan also asked? If the admin compiled
the kernel knowing what CONFIG_KVM_VM_MEMORY_ATTRIBUTES means, then the
admin would also be able to use a param like gmem_memory_attributes?

There's the additional benefit that the similar naming aids in
understanding for both the admin and software engineers.

Either way, in the next revision, I'll also add this documentation for
this module_param:

  Setting the module parameter gmem_in_place_conversion to true will
  enable the KVM_SET_MEMORY_ATTRIBUTES2 guest_memfd ioctl and disables
  the KVM_SET_MEMORY_ATTRIBUTES VM ioctl. If gmem_in_place_conversion is
  true, the private/shared attribute will be tracked per-guest_memfd
  instead of per-VM.

Let me know what y'all think of the wording!

>>
>> [...snip...]
>>
