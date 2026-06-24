Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A4137F00B
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333854; cv=pass; b=YwBWn7rxZ1i6SgcLAAad5lIzat08sPWC6Kpsyb6tUxVoE1UIfW/pzNTr2SpaC8+KVSCM/iafZO1VLgKv+CBNx3zKxavkZxIhJ8Cpj2Eh1gbVPKaDs92F+mLvUIcUy7RvwZRnQM902Fm1jbOk33oMgbZaoCUwSD/XhGXPIzyIsf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333854; c=relaxed/simple;
	bh=QyhcqbadZWN+AG6WcwYfzT9ILGIvGzGDjWcEDHa8YsM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWV17WxdfqgpZ97AH4czIV1I5j2fEGMDoBdxyYe+/f+HvjGi7wbURWW63BongHlkuFdScGnnCqFa1w82UEjLE1a4UISFo5Ac3zU+Sul85m61PpgoE3wTil1/UrKqRwxH9WviZO1lAh2peNuCwDQj/r2RpUIx4u5O4RNhwloQ7iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JSkv1ByO; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JSkv1ByO"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13986d61b4eso593254c88.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 13:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782333852; cv=none;
        d=google.com; s=arc-20240605;
        b=ibeuTHpG4oIC7JviPHv0nIutL/2mmrdWHMBUQ1nSaNKKN3yRQmOGXdIUeKihy55K5w
         wqgzL8angEnkFZNOdxRF0jEaBMn1/+ujN0Xj8zL1J0/a3q+Jm5VP/cjrUIWixEmjr9DK
         1etwKE5/jqmvlaDBfoClMadMvBF58kGIIz8GDzo3VxSVxu3VxfcLgsb1s6tI5v1fopjk
         tbpliIaV6IYkPnVoljAwXbwMYc+gqRnQCTIM8mox8iFkkN3mOe9nvhtua70/Ve+z2mmI
         Xni/mkrz9zM1HnpB6mjWkPuM09htg8sIaYpHYbqmQaG3+3R+nPK2q+akGpmqRTjEIw7D
         l+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        fh=7ytz0lvNsVq4a3aM3x1jNAXaPcinsD2QRzxufaPbOlE=;
        b=H9oJQp72VnzAy4d2GM8hgvvxqVO8mFNg9XI0pLGTnSQxchYRZK2Jcjm/G4nVF7zQec
         rhm8cpoR8UHNlJf4SU40l9iyCbpUcmEIFE32Hzkl/wtY2DsDTO9bkDB6xf8zyJrSMVPR
         tcd27aE1eD5YobiZZkNipgw2RXKtP8ll7kyvKIVV9qERYXVmJTtXWjjsv5WoHrkxrMSj
         WTHpGq2zRjrW7p5XNPtdvGAIH2rCrBsVAngz2D2zu0fA1cauFOH2pLgWBYuFZISVktIW
         QzqqRxhXaL97K5mCFXAeCd2mFH5odv1YQ1LpA4eYhc0GJB1oYJIJIamU9rikeWMcKIaf
         zX4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782333852; x=1782938652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        b=JSkv1ByOJCbqB3lKP23YrYbT+yH7RufFZrgmn4j/W8qw6G5kef45xY9CunSp1hBjKl
         KHgVhL5ObhUsvnwhujk91Y67/6q+5ENJ5W776GmqArB+gXTtg+DIFH3JaFJNxCbmJgx2
         xK1qHRd0fYVk0P6hcWRVYj+0lEjKw/IRQzc4/bPK98RF9CScDpgGhyhJ+aB4yD10Nn48
         x058kobRMDvgeK0FribCHSLJNszxKB2rtE0mEA2S+CpTC9JeLDOuZC5qZs737sz/P9HV
         FvvFbAnWU8Eix7XSgeUEQs3GFnal1lCF03gEvkFky91ryDTf9BXSrKyKy2IGAXpkxAmx
         c54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782333852; x=1782938652;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        b=nnScaAhArh34Jp83Qf2ztFafKdpkj2YYOx3L1zpoegVlyAgmnlLr/11OfHKbhF7ngJ
         IjlRSKaUX4EydW1FFaXmwCxfs7OXojeUKOoXf0l747/YEH2X05HHOsZw5SKNrhAhdU8X
         mnr9ueOBO+YzWV4i+QgR+BJZgD4zVGbNIr6tUhuT4ZPzqOaVE7jClhoMtkY7m0Ee8ebf
         sdk/PPPfZ37BpvjNRvQ5Yfu+bvzgd4qRVz1PKZXUDuZjj21nC+vtrFqe5L4lW3yMWW3J
         antATLGkSyTH6tk/Sl5KSuMfENR5pCYdZFRmFmIG33813/meo8cwIJno1+wv74g9p3Zp
         VVSw==
X-Forwarded-Encrypted: i=1; AFNElJ/SsBaepOrS7xSs2eVGL6+lneYAWg5rkuC7InIPl89KUdcGmh34uQ7gI63yKo9md6/LakpI+jkvu5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOlJ8GAO/U5ibhOQRL63hfnLDbzUt+LXjK7gXcUFUFh5GTNYdU
	dUpt13/7x9M36DrtlqKIg/MbqWdzPFS01+Z6o1E0wDOPeRHYExbKFTQkCxcKN9wkGjnWDE/TZZu
	I2ExGo8OrTNGBGo7SeJiPIYdOmjIC75aDHzuieZeo
X-Gm-Gg: AfdE7ckGn/nFNHSi2EYs79W9sZ4fyR63sMNR+IOx16mP3SuYvTAJrt8HC/IFSnPpb4L
	TUOB8J3KqvkzUJWSd0JN9/eBKCoOJLmhdxpyWrZD2FgJtVMcZYbkpJKShjNgApI8BbpAAzGinrb
	xzeTRniyrl7tNU4oEc2Wr7/pxHV6NctohoJ2nGKIOzv8k7R4HZ9JAAb0Q/KhHVa3L9BGblIxT3K
	5uH9JF3JhVStNML+PVmRMnPZ8swdw5e+FFhSNJpYV1zHu/iDmFY4KBpMEKwcrv6ihDEOjt2L1i0
	05vN3JIW/585Xyv0Ec8qur+DhzHC35QVu7fJMFZdzUPc8VB0BNVV9LPqT6k=
X-Received: by 2002:a05:7022:e995:b0:137:eda3:e5a9 with SMTP id
 a92af1059eb24-139ad711637mr14297421c88.28.1782333850616; Wed, 24 Jun 2026
 13:44:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 13:44:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 13:44:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <2ef455c3-a3f5-4ba1-86ea-b96416d163ce@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-10-9d2959357853@google.com> <2ef455c3-a3f5-4ba1-86ea-b96416d163ce@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 13:44:09 -0700
X-Gm-Features: AVVi8Cc-v85YTGgbOrOpBNr09aOMCIpUVvlduJvADSpw08YaAcwUxrqW73F-Zbs
Message-ID: <CAEvNRgFYpTAi+F8iF_m3mQnP_hB+DWN1oTnhEQ5WWxduX2D5MQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/46] KVM: guest_memfd: Wire up core private/shared
 attribute interfaces
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
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

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>
> [...]
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index bca912db5be6e..e0e544ef47d69 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -926,6 +926,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>>
>>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
>> +static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
>> +				      size_t nr_pages, struct kvm *kvm, gfn_t gfn)
>> +{
>> +	struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
>> +	pgoff_t end = index + nr_pages - 1;
>> +	void *entry;
>> +
>> +	if (!gmem_in_place_conversion)
>> +		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +
>> +	mt_for_each(mt, entry, index, end) {
>> +		if (xa_to_value(entry) != KVM_MEMORY_ATTRIBUTE_PRIVATE)
>> +			return false;
>> +	}
>
> Patch 1 noted that "Ensuring every index is represented in the maple tree at all times".
> So I think the queried range should not be a hole in the maple tree.
> However, there is a inconsistency: in patch 1 kvm_gmem_get_attributes() explicitly
> checks for holes, but this patch does not.
>
>> +	return true;
>> +}
>>

With Sean's suggestion for patch 1, I'll update this one to default to
the "init" state if xa_to_value(entry) is NULL.

Thanks!
