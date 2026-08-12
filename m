Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF64503F0
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541715; cv=pass; b=adNuzFQRN2XkloKZWjh0ZmlPehK5jNeRnccAAuhDq0UPdNtdUoqPONINeKVtXLy+FIdee/YfhVx/flYNcmxKhSBMzT6CRO3ATiCoV9yVqPWn/cv4igJD+rnoY3uPHyFY+8ZXcW5ySF5N3H2su/dIOXpSbTBc+vhDzc/wq6JMf/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541715; c=relaxed/simple;
	bh=Qd0DA5nheV/pXBjB/+20R2YQSj6wjwSeW68i3S2Fko4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBY06AlMUp4ePpo3EBXItlqS1I5kOeuifPUgeTQmDhS2qCBXEUxwIp3XlyNfTXyQszm8Gdww+Rkpequ0L1sATys1btWIuuJkT9qb9ipBUpt466zGpvAtFB3OvhL6WDxsjctOMpPwU9SHjSD2V9tDUw/9G7AqV6nCgNr2QDLNuVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d6cdPoRv; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d6cdPoRv"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c10e86e52so228491cf.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 06:35:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786541710; cv=none;
        d=google.com; s=arc-20260327;
        b=PVwyS7ff7RZldNRQK3lExrXcxM96g2NSJog7pJUps26VkNN6Jj/UoRKLsjNgwNaMfA
         yCmX+0+QEo4WLLuYarr/g34/yzAxnjmvDhevKO5JRt6PJ/V7o2yTgHMyTb/vIcSK0kJV
         b08DsBb5WU9x4elDyPtOLbk2WFTKKhH3XXrZpDFvyB/ZLEEo8fOZluwIIpJOtdo1/Epv
         euRyfUWYX/UdoG1rsrtiA9IoOyDqDPTxtT9HnGi2VUDenEtsdCpBAIPqCf6PTm4ttN2c
         ba9a9WWhnTlnPLnESd3Gq3bfdzcwAxNeRC+I/b8jNoamQx3W/2GikG1v1botIpDHbsxV
         Ofqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=btatRIN/qVx6m6u+kKi9+q5rHWXBFe/go9/mpyrKKkA=;
        fh=2I9WmerwrDoWGmkVoGcuNLdW1bwfHntIGhONkCzkviY=;
        b=QSIMaju2zFPF4tAMebeXy/rh7ufBJ18DS3GX4lYCkrMjofIpWpDVZLeNMObsCJezD0
         IN4igNc4zkc2Ek7U9N4S67AfrpP25FmOylG04QRRgY4U6fL8LzMYUV2ug70ecYYsHXBb
         nTDY2FDSKWA1w8ffgIV04EC5eb4g92tUDL17uTyIRHTy05d2cBXCNt2ZPkGMaO5mJeYL
         Q4R4brhC+DjKtLgJlMv0iFBUH8C0o/a/pmdmDjuOu7EWuGd2YqZiLnMnLr43I/qThjLu
         rCYxSSEtifYuNZXYKfT+UebdFhDG7QI6y1nMnysl97x2jyYFS+6HDjViOz0fmVmIFJL+
         zGdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786541710; x=1787146510; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btatRIN/qVx6m6u+kKi9+q5rHWXBFe/go9/mpyrKKkA=;
        b=d6cdPoRvZLtbyQOxdILVtHHSWKF/GQGf/zERGvY3/BzBHVWvov+zxPMSX2kyHlICNu
         +0hb1Nac+n4kZVPFWD5giqXCajCunsRCxt3aVabQ6aKBx2CRzoOoXdnr7AwOmeGgKpuD
         udDmOnfv1Ksi+hQQpagcD7i0GvF7ESEKICfUMOVU3Xwq8UrMX99Dbx/92eUDY8+8IO0z
         YYBIegDZhK3t5vFWVOnteSqfDRmGzRB88bIhUECPjxnmW+NH8yGh8yKO9DClXqgcwY5G
         URk9cnGcr+4GjGWJAodya56YhUG2tlfuyU5JR8ZNi4312tTS5EMPTLJwCNjHhwxF4plp
         k/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541710; x=1787146510;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=btatRIN/qVx6m6u+kKi9+q5rHWXBFe/go9/mpyrKKkA=;
        b=DohqACgzkvJwQzpSO1khOE/x+Tc2VG9Pqa3F76dnQLxOaJqn0VmpC3Z6KbxDAtEwoA
         liKGenTG2J1E2TS8bVal2Q9KnTJkVuUtVHhxpu91tgNBdId+/TpLWg4IboQ18la7I2PT
         tZBemspxwRcndDbo446tM2qNAyh1R2shDzPoRaypsw55+cmL9SZt4omtQw6A7tgXWL1d
         YLl/ReR17R/vmWeNrYbdVcyze4uQRcaD11ESVXsmwm1HUMXRHhNQGT+yAMBhN+FLjuin
         NUv3Bpc/RwQ8EGOW/hKUY4swDi5iSMbKAysDI+9Df9XLw6O5RAKUa11Yh9K2+fj6Z4lj
         qt6w==
X-Forwarded-Encrypted: i=1; AHgh+RoJFmIn6jfzIM36bDG7BKBGxa4AgUnhrrd3mt+VojkLohE/QFx20lNJyWbL0SR5FLsyefpnJiXT7vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWdvZUMo0jJZO6wmXPqQjW9z+ftmUxvMvyK/JWssJc0qGjRym9
	qg0OWOOuaYLWWH91DR6WHYekmoBoxkw10QzOor8yxnOrspjx/5O+TW+oUL/TbajBkwIBW4xPxHr
	HxYwMvzFCHhNC14TZdsdi00pFb8i0f6vsl7dRQscV
X-Gm-Gg: AR+sD13Q5PXr6Nc2CXwLheIvCqypdPyJUMOhKytPhdATmtYBoz4ImnGBpEmuYiTCd2K
	1I+EHpb3oZEs3qIenicziQYpBGpCfR6efgRz4qA637L28BhWZS0ktMh8KIIO4Hw8O8QV/aUisGF
	pfPd/gy5F9HztWc9Kc9A82I6vzbYMgzVmhMM6x2eMk3vdJA4I9SSJjNM2V6asCjRhYnkHdQRLxm
	C/dp94yUaDSlJTJMFiKHszd5nXS8wrl9ulaTYHFofbynW7wwfkvw9gKc80MdT2H0qzxboSCL5uQ
	swR3p3Rckk5x07Jw1Ihi0jHWZe9rIDVOcC8iWTsfvYXSEw==
X-Received: by 2002:a05:622a:e198:10b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52d65464646mr13714571cf.1.1786541709957; Wed, 12 Aug 2026
 06:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com> <20260807-gmem-inplace-conversion-v10-1-2fc18ee6d3ba@google.com>
In-Reply-To: <20260807-gmem-inplace-conversion-v10-1-2fc18ee6d3ba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Aug 2026 15:34:32 +0200
X-Gm-Features: AUfX_mzDGNX5m7h-J9AcKRPzqX1cpxh6BaIQgAnDEV-ghyjmfpFsGGynIKZZ1iE
Message-ID: <CA+EHjTzkOQD0YddPUs=2=yThG6s3=jQR2xwm+CeAedjyFaANZA@mail.gmail.com>
Subject: Re: [PATCH v10 01/41] KVM: guest_memfd: Use kvm_mem_is_private() when
 populating guest_memfd memory
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Aug 2026 at 23:52, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Using kvm_mem_is_private() when populating guest_memfd instead of using an
> open coded equivalent.  In addition to simplifying the populate code *now*,
> this avoids the need to provide a range-based gmem lookup API in the future
> as well.
>
> No functional change intended.
>
> Suggested-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index b596486d184ca..a11cf6dc785da 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -811,9 +811,7 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>
>         folio_unlock(folio);
>
> -       if (!kvm_range_has_memory_attributes(kvm, gfn, gfn + 1,
> -                                            KVM_MEMORY_ATTRIBUTE_PRIVATE,
> -                                            KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
> +       if (!kvm_mem_is_private(kvm, gfn)) {
>                 ret = -EINVAL;
>                 goto out_put_folio;
>         }
>
> --
> 2.55.0.654.g21b8a5bc05-goog
>
>
