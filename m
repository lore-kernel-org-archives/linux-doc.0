Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9557A391842
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727229; cv=pass; b=rkr41jtK+zRE6y+CKuGQXgAZ7CHMmBf3sF+BD5+Y37dDjGYBBgvlLXPQd8aMjmZ2RA2RbIopc9y4XvN8b9i7aYtzZOH2UpBSoKpjZBEmTHFCF3vQmq4Fv0Ye8qGE/FT/O/z9Uvr5oWuWVhEOnCdgYn5KUWS1iYrVHWerHT0MDZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727229; c=relaxed/simple;
	bh=/vyKACkfCL7rXCyIYMwbLdrFfGENnqR/w0Bj9SikPUU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrksbB4o84PM/v+gYf0fypwKS50oZl/nTO3z9tVad6i1LWIxIpFRZGOEQdg7gNvD3TIcSxwCqAgROwpQsIsZKsWC7P0W1+CgFT7TZyM0R+QENkvy0OmxqvXSXC9PeAuFGOtHAK7HWLmg0T0ZZ1/HtlOD3ukk9CIhXKBYz2yFqYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bm4A6INi; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bm4A6INi"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52d8679c149so5430951cf.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 23:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787727225; cv=none;
        d=google.com; s=arc-20260327;
        b=h24ssb43RqmRBhL/MhpmDFnQEify7vAIKZ22HaZwAUyFRi2G0dE6Xx9B2ZRwa4vnss
         UhIvabztsNJp3u/sDmPL78abkaTmONTL5tjB8wjKhJKkbeNgajWj8ndekP0uQCZqvBef
         ePIM3JPQLtbAmGSDRIjrRZJWfWVvcJVDfin7aavTkTGUuiedF4XPFP/q9i9ld3bTw+8j
         LoAQ4oE+PQHQXKE+5wf3yrDZW9ya8yzY5kpDvvpUKl1pT1+EHAfWIL+pctF9iuDqhsNG
         M2t3lQDYcKsdH8PmVi6xE4kyUEzXoDVfeLBBM3DWLS3FFpSAsx4uAdiMrA0ZrF1qHcO2
         iCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gunoR0/5m2ShIW1cBAYYWni95R3wXjfnlI5bo7Tk+30=;
        fh=KsdoIsBWXAsvtef3uoqWbfxdGHXE6cVTqCIPaN1sdXk=;
        b=lxBaO+QOd+fMZK+lLALvZFRhepSmEQ+EStgxk6AS00iN0qftUsL//Tr3a/pm3vzr2g
         5A2dSqsOycHAyocPQS/bY4WGiRRKH6gjWmHTVOgf+y4wGBl/0Z1fox8GjqeoKikqmJxY
         wVNkerfDKEZrg0sDy/e0KsYfzC6OXu1OlK/0AWDC8Jr9M+keDnLPlBfVC3ogvs3QiQxm
         TVNxofTI07KAiSo1zJ0HMcCkuWfrHMKgjmNNsdLD+W8SLX09hCLAgu/hDduMllVmKzwb
         47wv5ktEywaWkuLR2N8Hrw+34iL9FS//ZQoDNMbxN6rGdDSL8ApHlGwF9eH72tJ2Uiji
         zNnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787727225; x=1788332025; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gunoR0/5m2ShIW1cBAYYWni95R3wXjfnlI5bo7Tk+30=;
        b=Bm4A6INiIvlrIYG3BZeaxd87P4ldXOztZ8a7bNAl2HvU01024nRBW4IwbkEZwLBD7z
         GVwXXamxuDMINoHIXgawtxrPSl57PFbimkE42Wp7RBaDMKPcfJzIrsS6j/75Sa8gYnRt
         LMgaLSTCgNdXF4Fx8NA5WitVhT8ziA8dpWlBRUSHVVGrmGWJCIfba67QmmVZ+8TIuXgA
         dPa5lmh0ANKABgJ5E4uQjPv+IVQNrSvDo+QTCpqggb0AjLCMIgknWBm7Hko+vwPp4VUH
         BsaoPiuFObRudRZdPIWOu+RVVmcaqCW/E9Rl1eCoXFnjg6icXue8CFD/ICyxvUpma9Ds
         k3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727225; x=1788332025;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gunoR0/5m2ShIW1cBAYYWni95R3wXjfnlI5bo7Tk+30=;
        b=IEHeaA7mElWwnLhmyZUsSSRgvpqA0qAaGv3lV7gsnqNA7Y9SLmifoPZc0yxSVUroVi
         M0L0WlrRXuRiUccfcdLBQkeNvn50jqX/QgdgaTnTS+EH+Modx4bAKP7hnywa8axJQ87Q
         VTlVId5frURY6nQLEfJfbXhrWi6D0GM7zCm9SlxDFiD2JO0yMM1w+ugZtMYeU5DZAR+0
         el71Ni4WzsDk7fHFJoHWpMl2NTBBVyRog0jMd3IM8ha3avbBnYT6wmK3hWnhACRVkks2
         fQZdAAPdATduJvLFnum7FnEbuATXSirL6BnmWnbnp1GjK9ks3wIg5BqqV30arYnkS0xW
         wn3g==
X-Forwarded-Encrypted: i=1; AHgh+RqW4yW2P4QdntLj9vuSCrBmYYk5Ay0/GwI3jdErtNuggPqVyVHLk9g3CUkVOmOayXcQ44OqSGRrekU=@vger.kernel.org
X-Gm-Message-State: AFuF++n4J6iA5uwtxvz2IP60poFduzaraVFYl061GVQ4QhyR2C/gD3ZD
	Cow/Fl7UhyCX1L/fxIp44iVBGfYYN+L0P3KTt+d1512F8t7B59U7eS7s/FQpafxLFeroMEwuFw5
	WE0p8W/tUttOr/bER5e5o1gSYshJJtbThDujcLwds
X-Gm-Gg: AR+sD123nHlgXTKUzCqjQ94VJJtTf841QBZwyoGOwwQMuNlgggQ7mTbBGqgyLMdbMiG
	dp036p6q1rXSI7kTVLZjeEaORD29Q545/AtnP4EQac2gDO7I78SQl5m07d00iUXYcmlNJlWmFbc
	TBzsXX4OUEG0pcR/JAF/So65v8mwAFQejg6gybcMSHRXAnGPnOnxUtdL09noyM2ZjnaKS29ar3b
	ZVINbDeysexhIY2AON8kxj7hSp3LmxfDfiZ/4U5Wqid18+zKU0fRF/RG+kdlnPu/K3JnctPyTjY
	FKYJtK2BlqLf16eY08SqAwSQ8AY4FTgl8oaoPNeMTeWxclViShefY6DPUDUZCsd6oENcxH2eY1b
	MdjisKD5zWqxOOfV8uVZp0UGZtGP40g==
X-Received: by 2002:a05:622a:1b86:b0:51c:fc4:a144 with SMTP id
 d75a77b69052e-52e4228ddf0mr40451941cf.4.1787727224807; Tue, 25 Aug 2026
 23:53:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 23:53:43 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 23:53:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ao4Gmn5tSZMhl_nX@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com> <CAEvNRgGvxMus6pp=xuDYOumH3Ge4oi0=YKjTaFykFHwXuzRDwg@mail.gmail.com>
 <54d1bd0e-c27a-4033-ab97-02cd9579a620@intel.com> <CAEvNRgFhjbgC9Ng1qviPx4oE=qihUwiBcsYOgJG3yOU-nLG1hQ@mail.gmail.com>
 <ao4Gmn5tSZMhl_nX@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 23:53:43 -0700
X-Gm-Features: AcwNN1W7XYwPjQi0IwDu9VBVz85rJlKXjtpX9LauU0RxJJUn8oPq1JlhbiQWidY
Message-ID: <CAEvNRgEHZZLXyhQ5HiHcTbCk65Y2Lb-fYu0fZ+LRMm1_eWgeSg@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>> >
>> > I'm looking at the doc of KVM_SET_USER_MEMORY_REGION2, which reads
>> >
>> > # When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
>> > # userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
>> > # state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
>> > # is '0' for all gfns.  Userspace can control whether memory is shared/private by
>> > # toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
>>
>> I'm not sure how this snippet from the documentation connects with what
>> you'd like changed.
>
> It's flat out wrong once in-place conversion lands, because it assumes PRIVATE
> is tracked per-VM.  Something like this?
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 4eb7e75a7473..c9769e5e7329 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6383,9 +6383,12 @@ on-demand.
>
>  When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
>  userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
> -state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
> -is '0' for all gfns.  Userspace can control whether memory is shared/private by
> +state.  If in-place conversion is disabled, i.e. PRIVATE is tracked per-VM,
> +then at VM creation time, all memory is shared, i.e. the PRIVATE attribute is
> +'0' for all gfns.  Userspace can control whether memory is shared/private by
>  toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
> +If in-place conversion is enabled, then the starting PRIVATE vs. SHARED state
> +of a gfn is determined by the relevant guest_memfd instance.
>
>  S390:
>  ^^^^^

Will apply this, thanks!
