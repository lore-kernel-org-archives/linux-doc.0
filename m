Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6A43B42E4
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308680; cv=pass; b=E0eJGIYalEAZ/TrP6PBUTYjbuuQmN1u9seKFUVPo4uSminAYBMyfVCAkYLptv5MKhnQOxeS7py9CN1HBXwvhsGd2bNqRf20rYGU0u0bmS3ZgPDpO8l6UUTGtmwV4hGPBCExzgpUw4hFbzJJNqywIgVsZzTz34/kFDeOgcvhSDuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308680; c=relaxed/simple;
	bh=qwRcQ/ClJ9JG4ryGwIJuvq/o3tliB127/9EJbI1JGOU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK5Sf33WDdXMvUmJIT8axJvMoO+2o+Yka33Jdi61HqpkS84eR6KVxtEOB9jRlJbKCXGussMCvsWF+cQLkRtiakPcZSqyYTyRhuUa9/UNGJbQU90WLrXT+o0Qr1QWDrp04L88c8sgXw54SPUwWS08Kn3W12YD697j/vzro80Yzhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=arPYaw0m; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="arPYaw0m"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13981833e13so1254439c88.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 06:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782308678; cv=none;
        d=google.com; s=arc-20240605;
        b=Dq9rll2DEq2sYhsI4gXvQe0BjpODWzHDXZTLhnMdkjXvie2hivojLjm52mP2DPWmBi
         rAdAQ667sV9LiiowFsqjMHwhOmlkpzFkuMMd3DSviJs77K7H0wqrQVLtT/T3cSUCZNzg
         8MetU7Vq2xWs1iucEqZQ+us1DylFs3I/CFw29Z3sfUV8oWUqetrzRe0dKe745WIwq8HL
         PpLaR8T/e+v13hV7Tu61J4/cSeI4ZExHqdzbXWKDqP2UArAZM/VkWqmVDRAY95lsO8D/
         HS09fvD4OisBbYzFhh8NOUg3PQRTh776XC1ADlJaoyZgOG9gxopcDR7/2kzDQ2kxaOJi
         irzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        fh=O27L6uxLoaZ2mX1SQEUpw2rA1kaRb236nwdbAo0rxH0=;
        b=FTvhr68tPB8cOQdDz/1EHxRRoYo+KxRQpAZgLJFTof8vkDN1AyzYmt1tcCB5RKdcZO
         lhCI+zRgoGmj9yps70FxBueo5W1Jt7lJuFKlCtwEtOAk+LVXZK9+oMjc0QdrQxzrLfFm
         c68WCuOmPVIWxw/Z7NzLgIHL3JLYUeAycYGd56/yTpb9fJDZmBQRCJFvL6wZVvHCpvTk
         Vw2I+HPILTMMesR0zBPMEH6ShRDcZe1z0wQBERaqKtwYA+s3d9YMBpa8e3AGZjzyGaoy
         zoifLNFMXt+ipVwWrD2kP+GoRAm5DKpul9sQWei5jB+zzB99ZdYe0sTcom/L7tyxumB6
         oimg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782308678; x=1782913478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        b=arPYaw0meVRjPYrgms4OkOLXFt/8P2iuU67wri+g544HgClaDMzfIAQhy6BtPLeVh4
         2nSTG1S1xNZsTnS+t2dJfwbJ/WtjWp5jPYDuti7YH+wZSG1d0uJTdBdqVugF0F1GJqlm
         mz+2HQHL4z1TPCf9je/KZBzz5f+CiZiX0tyQKqwTjW/ln09HIuiZ6YRJDPKI20kCZR91
         3HAt6Csj4wOcpZv/Cji3sdK5CsaAUxp9ekhKCOUF/PICHIw1Igqy4Ciu3GdgYIPHK4QH
         H/WjUDgtm4HpMCfS4bUR0sZrBlSONDoE9rG/SPXL+VDaKdXX8ycoZFH0P8eihDqUY/Hr
         qBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308678; x=1782913478;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMYX25sMe8BokvDqBMKpyH1gjAy6dHukDWPb7UeMT1Q=;
        b=gdVrKTgmfKb9Rs3GWKFIDYFze2Fn3QLo96zOvkbU7VKRMeqRYYf4HZUupMWxv6OcW/
         JiCEsvJZJozfkdIhP4dhicuQtDUGf8v1lp4saiOE2hQUBK00Het9rllg/v5qLH6dpEtC
         YGszxqDTfb/qgBCt2ZOKNjU3k9hIkIN/mkG3wRouOO9BQydrxDHctekgD+y4tW80tBww
         Ll72k+R+Kjz7CJdACGXGoD3d+XeagRttZyBRjuPsgsl3jH0cL159WeT8rNpVkEUNoNYL
         d8yevYl+NznC0uU3w/7BzcSliPTVEKkEZQQfx2yIS+4VUKzLpLGfjmkYGhPc5t45gk17
         NwDg==
X-Forwarded-Encrypted: i=1; AFNElJ/2Cxfa+Vj/c7jPe1N3pMz5N9sw4wxzCTjSUhAtA9Pn3UJkPrzbuC5hb7nXGLeVK4k6yAhfK49+Mpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvuAtuJE5q34Y7jr6turNLSK+T76O5/VzejiavPZ9Ttcb561KA
	OC21nI4P/fomfSJPHhVsrduD0gKrBcvQ4prOj56792rp3Wp3k/REUWbddrh84bxw56bQYQj8c0Z
	pxmQdOFht/XIiJuJBXpwBNqMUeHyfKx2rO/kZyVKd
X-Gm-Gg: AfdE7clynYk2aAsPTY1mxbgLTM/6Nux5wkaSy+27M13YK2IbIMd5Rvb5AlaHJhzeyW0
	4X1MHROky27Dg54AosdhF7AyzIS8sdpD9PEPs8ak4FXsG6hUES9Ue44qQliOco6NZVQfHDnDc3i
	xxE8dYuMdOSTrtFUxeAE+DY4KYJi9v51pE1FBk2YrligVRgXtzX47Q3szuNAl0mQGnbVnvbLwis
	e/dd+mkokcTW+nDTPhetzmp8R8r2LcjcnIYzj/DHTEBCDtO/S/88KIzMR06uKn6LvIZBYthafZ3
	ie3847LRNiL+dCFYLurLCSE/nfM7
X-Received: by 2002:a05:7022:ec0e:b0:137:eb26:10d with SMTP id
 a92af1059eb24-139c5b99857mr4976083c88.0.1782308676421; Wed, 24 Jun 2026
 06:44:36 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:44:35 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:44:35 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <96fb369d-dbff-4ed6-b1f9-0ce63d7d4ed0@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com> <96fb369d-dbff-4ed6-b1f9-0ce63d7d4ed0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 06:44:35 -0700
X-Gm-Features: AVVi8Ce7qJauzHB_wQ4GZOmMbMs8hfgU2sTfkjTDTjUh6bKjOQAsxLqy1nK_op4
Message-ID: <CAEvNRgGbBcrX5Fw3vNTsTOBNC=Ypi=9-S07674yPxLU9i4akjA@mail.gmail.com>
Subject: Re: [PATCH v8 07/46] KVM: Rename memory attribute APIs to prepare for
 in-place gmem conversion
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

>
> [...snip...]
>
>> +static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>> +					    gfn_t end)
>> +{
>> +	return kvm_range_has_vm_memory_attributes(kvm, start, end,
>> +						  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> +						  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>>  }
>
> This function is added, but never used in this patch series.
> Is it intended to be called only when CONFIG_KVM_VM_MEMORY_ATTRIBUTES is
> enabled?
>

Thank you for catching this! I think in some earlier revision this was
meant to be used from the guest_memfd populate flow.

I think the version of kvm_gmem_range_is_private in this revision is
good because it is symmetric. If conversion is enabled, call the gmem
range-has-attributes function, and if conversion is disabled, use the VM
range-has-attributes function.

Sean, if no new revision is needed would you be able to drop
kvm_mem_range_is_private() while you're pulling it in?

>>
>> [...snip...]
>>
