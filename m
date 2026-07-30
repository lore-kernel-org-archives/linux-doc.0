Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C037FF42
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 20:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785443707; cv=pass; b=IBEv4oaAav6sCU9YV82WSqHTlb8k/kPrnXBczRwl2KS4ShQUfl607Mw39eb84mC9ONm1weir0X3+KEM+B2E9ROSkNNtA+d/nlHBwN+x46ZFl7i5ciXeuhPcRhu0Qc6cP1LY6iQh7NyJ7wE9uTKXXWysBO4+rceA/i7RLgTPFAYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785443707; c=relaxed/simple;
	bh=30g6+52vpLwa+w0jwIJQYFnjqb/F+49RsIdPCA/cCGI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4SVKQebPG+2gp+S5TfimU5ixWC3+ID9fHkzLFp6rA6pZU3ZSl7lkEckdQTtHdnKqFfWnVZmZEcG9fIPQyV4ar4ahia4tthPKlijMGj64ipACGT4NfcOV66oUFAKzGz6un2wHOY2g3fTyeQSXabuuJgmsF1gK64mNHYCetZOx6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FgE6wtnm; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FgE6wtnm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so326443a91.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 13:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785443699; cv=none;
        d=google.com; s=arc-20260327;
        b=NwZnbjEnlnvwEp5/F3wxyRFpBKBcreqB3p8Qn4kylAb0aZ0/l/ZXJW2AJmu8l8mn8y
         u2SbnFw6uZgWzQvPbADe9tsf4kz9vgilTyGirYhDRAA2ECE/imtx+OKF4/1vOwhr9MBb
         +DUgcRkd345qCFkizJy3L0nFulswdIrcDl6X3WznLcZwq4MCMZfvhBO+X2ob/qUvG35Q
         ao3QVZ9x14Bty2RVSXIn4tUiXV6FVfqJ3kP2U9B90zFl6lk+S5nOcCAmWUaek2l9n4Jb
         wm2abExLNgwKLATTAmFiDmHP9RDksxtGyZ9g06d/Duq02VNkD6V1/Ydb7fIRFpxDlSf0
         5D9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        fh=jPPUXpWeWIjFQ9CihIOJIyhFP0l8998IpIl3nh5rfaQ=;
        b=gs+dJEcCCzSZwkEQCEa4i9wfoTfe7Ax2qpBssmlhG0A9SP/Vv835mX0K7JVI6TslDh
         6Kn2G7pb1ZvENgTW7cFB44iM4ST+cwXpp9j5XJeQ6/MaAJ7Deg3e4+HTmunS5iZU7IYd
         rRbhfWLRq75+XtNS/VRO/Ke0N/3DCTE0lCMoKq205zcPCn//Nuq3TQJGl4gIl9YjDkxT
         L9OMdnbRLrpgwGt1gk7/xl2REQgoGqAU6DWzwkseZOH9oSA1peSxhJuTK1x32Ek9BmmW
         dQVJNrgiKZ4laK+TkFeV+9tS6M9xFB/KViMStwf0fs4mKoF7uIhHTuDnD9j9j4wNUvKT
         oCUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785443699; x=1786048499; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        b=FgE6wtnmAFYvzjw5wFWRd6huJNE8KA8k4l1SKooUBzxMVVwd+7U7VXuCU5YcS8WEaD
         Vrwj8/c1KYuw8fdTLncr9hVfiFepcy6j5dRZ9fvrnW83jJ19GTz2sSIBW5+2Q4pS8K9E
         UMd5Cbdf8rR/SH0v4tJFusrjrjdeJC2sNbMGc7S8mBDr4DcOPl1y6QQ/mQ7maFIYlOxc
         s6IGf8HwDp9a14sShNX41524Nmf94qkwdPAAyMei1hm6JRQTUL/5daQAaLelttfr7ZtD
         0BL/uLBgdiJNBdhVo0kkOdd7FcaoTCcJqUMGRL11vNgFqkNQTxkeQhFa6HrH7JjPNZNn
         hfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785443699; x=1786048499;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeYSeUDQaPUMgdnk0OR676C/F3UEN+xBjEeugnIWfJ0=;
        b=BBrrwV30ItQE3CN8wdkrfTal4BY4/OYDRVxjw6uLXYCzUbDMdIR0S21YJIonP056A5
         RJAfL3CJTFTPyXt5RHBSq+KoSsB6jv9bYOM+FPweTKQxZYJETam+vghl+j02LyGCp7wW
         gx7j5ZN9ZqsRmvQSPVoKODZRAnWSe89v5mZw+ZcWGL2n9z1OgZdZfO2bKzdTFQRFIQQf
         g7K1jGqxlxOHYKtbq673Kc8NW9BLuAVDMmsuxFE/oN/Hw26h08AT0odatZSUn9ZccDsF
         MuHWcStSrBKk/et6MCpjtm35hPxBO3XF2Kl3iWUcqrhB2oVKtto1+bJusA/CYWCKHTJj
         HTZg==
X-Forwarded-Encrypted: i=1; AHgh+Rqi/GfalnSutP/bvBJLvyazUy0SChPLFNSUQnHCoi7D5wXJQursO4T48IKfJihidtthtn3V9/2/H9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp86wl/EOj9LML4QtYJG3V5P+/vZLE2V4CnRVSsxt1ZRMM2FiR
	nUecxekEbFSAaMyYSjj2w/K7UmORPWtjahtVAsU6SF3kONyRdYGybHd2Y/DKYQ8b/PSUSNI8Lx9
	hnEv1WgfbOW/gXQENIdfvFgAtvvnXZzs1hq4mr6gW
X-Gm-Gg: AR+sD131dolmiV4EzD7QvnNIU3wHqddUreBjUQvhCgm8xOBCsZPRTRY7F1bCVRok0Hv
	z4J9vRc1JtahJXr+wpIzV08rTOk2JA1RKsfrqP5sO1jmmkENeTVdxyj1cn5sV416vAig1k2u9i4
	x/SoVO2c3Wvpm795grBPV+IuZkWNqZkFt9Zi1OZcv8F4mJ7RA0llbSsPx9QgQTuZlhVEfILk6dY
	zoxHdiCHZMNrsuo2h1NE8i77xQWvpPIrbliKBo900NcReIhdv5lkqjNOLBxqOjry5FQ5kMQ28dY
	J+vyXId1RSA7BBAfkRfqh9slHsv1VQOHUFlPhOT3KV/8GTjY1CQMWj7M0AJceGy4ilJgvO+7D/h
	iLEZnq1w0a1WYIl5ImGtNGJCTDYSA0sSIcAs=
X-Received: by 2002:a17:90b:2c88:b0:38e:2c8f:a01a with SMTP id
 98e67ed59e1d1-38f9bda173amr3473378a91.11.1785443697893; Thu, 30 Jul 2026
 13:34:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:34:57 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 13:34:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7dafaa90-f3d4-4be4-a5cc-472163f18040@intel.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-3-35f9aec2aed2@google.com> <7dafaa90-f3d4-4be4-a5cc-472163f18040@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 13:34:56 -0700
X-Gm-Features: AUfX_mzoiUtQGNkPMfuHgGb11yV4gcaKdQOzK-P2tpO8oMq-FVBJLM1nZe0Ady4
Message-ID: <CAEvNRgG3qXrG2ix2MEcyVo0GXaen-Pte4gFAwEN+9AY=VtGU5w@mail.gmail.com>
Subject: Re: [PATCH v9 03/41] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
>> From: Sean Christopherson <seanjc@google.com>
>
> Though the patch order and diff of this patch is adjusted to what looks
> in v7, per Sean's request [1], the changelog still looks somewhat
> confusing and part incorrect to me.
>
> [1] https://lore.kernel.org/all/akVGZOeR1ytfkamK@google.com/
>
>> Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
>> on kvm_arch_has_private_mem being #defined in anticipation of decoupling
>> kvm_supported_mem_attributes() from CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>
> As I commented in v8, the "in anticipation of" thing is not correct.
>

What I think was intended here is that in patch 20 of this series, "KVM:
Let userspace disable per-VM mem attributes, enable per-gmem
attributes", this part

  -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
  +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||	\
  +    defined(CONFIG_KVM_INTEL_TDX) ||		\
  +    defined(CONFIG_KVM_AMD_SEV)
   #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)

decouples CONFIG_KVM_VM_MEMORY_ATTRIBUTES from
kvm_arch_has_private_mem().

I get it now, so CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not actually being
decoupled from kvm_supported_mem_attributes().

>> guest_memfd support for memory attributes will be unconditional to avoid
>> yet more macros (all architectures that support guest_memfd are expected to
>> use per-gmem attributes at some point), at which point enumerating support
>> KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory attributes being
>> supported _somewhere_ would result in KVM over-reporting support on arm64.
>
> 1. I'm not sure what "memory attributes being supported somewhere" means.
>
> 2. the kvm_supported_mem_attributes() will be renamed to
> kvm_supported_vm_mem_attributes() and it's still under the guard of
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES, what's relationship with "guest_memfd
> support for memory attributes"?
>

I think another way to phrase this is that if we don't make this change,
say, on the foo architecture where there's no CoCo and no private mem
support, kvm_supported_mem_attributes() would return true for the !kvm
case, which is over-reporting.

How about this, replacing the entire changelog paragraph above:

  Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE
  based on kvm_arch_has_private_mem being #defined. This improves
  reporting accuracy by not reporting support for
  KVM_MEMORY_ATTRIBUTE_PRIVATE when kvm_supported_mem_attributes() is
  called with kvm == NULL.

  Give architectures full control over overriding the default definition
  of kvm_arch_has_private_mem() by removing the coupling with
  CONFIG_KVM_VM_MEMORY_ATTRIBUTES.

  In a later patch, kvm_arch_has_private_mem() will be defined based on
  whether architectural features are compiled in, and made orthogonal to
  CONFIG_KVM_VM_MEMORY_ATTRIBUTES.

>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>> Tested-by: Shivank Garg <shivankg@amd.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>   include/linux/kvm_host.h | 2 +-
>>   virt/kvm/kvm_main.c      | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 9f78a466c6f3e..c125d2e8155a7 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>>   }
>>   #endif
>>
>> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#ifndef kvm_arch_has_private_mem
>>   static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>>   {
>>   	return false;
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index 902aa166c9c0c..9501dd8d015d1 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -2421,8 +2421,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>>   #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>   static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>>   {
>> +#ifdef kvm_arch_has_private_mem
>>   	if (!kvm || kvm_arch_has_private_mem(kvm))
>>   		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>> +#endif
>>
>>   	return 0;
>>   }
>>
