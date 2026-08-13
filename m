Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAEB44E65F
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645808; cv=pass; b=r6RV5Cf2bSR1GuEZBF8YzR5nN2ZKgC9a87gsW5rlLVpndij0wbl33vfdhVmR7PasyWIGBMnx6URn1sYILzFLM/sQ/sY2P1SI5/osPo2e/KiaRtEqpZpLEO5yDXLcHZVrZdgNfyWFxHdYK3mRo8RUGaoFw0+c/zAcCTQxhYmPnio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645808; c=relaxed/simple;
	bh=Ska3VU67p+Zg8LuYPgjyex6VZBA8Ya8GmJinliOkbPU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHL2Vl8WOGypXvTf7QXP8H9EjvS/f7dev93lfSL/S/gIWpEZq9mWFkWlEtcHC87koZzsjTyndErmmS0KOot5neZymFo2yfegAs/vVbOB0H771hYTywaxtto16SApGR5vM2Hmq9GEByZEr3Tze53gW2aGRqbwSGAWCl+xclBGgfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FxSeiGNo; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FxSeiGNo"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1022569a12.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 11:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786645806; cv=none;
        d=google.com; s=arc-20260327;
        b=gxaIPaxtmtLYJLAHMmo3wXXhTZzE59oealgmp+/UlqTFYq4XH0Sutc33krsBtuUE4h
         KHQ5yyytXDuGR5WXxX/KkmVB7qfpbtRCzn4vfgWgV5F74QKA23MBCZSK7dW13tB5qUTj
         hBMUTxN+4s1Xs1GVpyrT9acflXyER8rTWsPw3r3onMVqqUoPfT+IPlUwEO4OlnS6wH12
         b9rpHYH0+J4VclJ+2clYPgoIDagkea1bG13OGVFI5XotYyehV6Ry3GOoGlUHZb3xtja+
         MGmW3+1qZRzwxTgY7iVkGKvDL6OkpMRlar0LpqnTfVkcWPDr43hG6WSyJfHEHXE8xd6a
         7XCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        fh=4fWx7iRhhHSB5T1sWxvPewo3g1SARM/QU+mb5CH9iME=;
        b=kNJZzlr4kaqok9R6j5LxGgexq+q7s1xGNqSuakZfOiRm1HLaRsv9BMuU0TXHFr1yXz
         VUXdW2g950YVwimJLq+rrz/Xa34hp+7fyqkDtkCl9kTHWOEY2KquDNWqzBJmeXt0awB0
         7nbTg56W8s0TY4yJj+8sVSF57ZyCFCpVoAI4eSwSt1zdVnrjhfOf8vl+rspDDxYPrwEc
         g/3PuJvYPs0Nvqgw0H54/uvDtCooIRzTqndD7nOb5NrLSMKgC9VeKfjjQ0OJZfuw9O7F
         o0u9TKGuFaPzCnFiBomYYjBTIegYURSPyO7hUQWhnt0NvQ0ow5AL/4cPx6HQFbjLT1es
         5R7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786645806; x=1787250606; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        b=FxSeiGNoTbDkQ5btiixJQf6+qIPgn3wjc/zjD7iSumTCzWzYCGiQxPJYKAsQ2wQzYa
         wup4t3QdhSIa7XDAsMw9t3AR745AQjJSWPdOfo3BLCJtz5kZdEm8K5l4MeaNdjmzNLQX
         O6A8uUVHT7GJzd3p9ZdTNhYUG+M7E8Zt658Z0+fxNzEVb6tz2eeMal02dalzeiZuU2Sp
         /PCSQeFi3PO3X8FBJUQaLpZc5RvAO5TLNtg9ujVJwhiH1Yt684UULON+yFrPVqWQAs+K
         CxlaMl0Dm0zdYykzqs0RY6zXglWnNRTq3lc2BElABhkjiktcKj7RE4Pa0Og6jhT8PwHe
         k/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786645806; x=1787250606;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trV1VhVsvTuMN0KspJ0QoTvh0FqK6gua+XSXYlaI3MU=;
        b=F5W2TBc/wC3NFStUl7C6uaLwNpHb8QFUgatOlr9yD5OQeRI4G89qT4god9hS3PYF8z
         S2E9tqD7vy5BD4v4j6g7+YqVWMggIdY4UoCj6Kch9HvJXK9PsrijIM5347kGLG9c2Wz7
         yFcWdis6614yT9Fu4NxIHOF4Tuc57iBI4LazwgEww19DSRRx4mljjdadlXn+25yom3ha
         OQAzhndzTu+CqEGN0kZSrDgYrJPYjPZFyViE/x5mUOGtvnanRPA17UzbbLat+8c3qxXY
         X/fhnBa4hSA5QabUWdYRKTqcthNICsfmHm0dTnzF6Lj6EzMZ9qs0vb6IXZawIWs9O7MN
         YD8g==
X-Forwarded-Encrypted: i=1; AHgh+RqH8JB0nFboC8O3H+wSnk1HltDGilCFtsz8H5pwv54spgnpSQ2BCVrhVySH9+GAyUaAnIzQP2Vt+yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwioS1kq6Rlo0zycsZz41Z/q6sb1DhQPUH+Zj6HhW1a8BVMSmbn
	Uc5uaJ43cMuo0yzJXaULfoyx6Aex/ya3n5u2uFDYs1vBoJvQeR90PmGd7jUtjZR7OLlpVrDkEzP
	xFlSrxnT3m7E1yy7PZrIa6PExlAqJ1rp5b4chX52M
X-Gm-Gg: AR+sD112SZU1wx4fWj9npliYLj/Mve418pxwT/O7fycDwOrqYUO8aOJCfSLvP3OgXBl
	IUp4N22ZoM82AxGaCSgcEqlizAK2eEANUIhVNQF+crKO8/mNCK+FxfUOxE97GZTKvcaTfZzWGLX
	Yev1tDz4Sv3Em7I0EZOX8x9hkSMiSq1FNkikLf31nSm7Xz1Q5PKGgPKEveoTnNEcxm07vCZ3fMR
	/wNokh52vHrWLfDOHVK0g12PBkfQEv2g97mHK5CXkk600HXO1PDYLQzxFfQI6T/m0uv/2ARbcK3
	1dIQ+Y0JXI5QNpyanELqYJyrOKdlvJb2MOciaETnBo3m3w4jKW/yrxE8nYoAkONaQYk849UTJep
	tlOPV7mz7P9L737mma6w9cjkx6W6Tog8=
X-Received: by 2002:a05:6a20:3949:b0:3b3:3506:cf3f with SMTP id
 adf61e73a8af0-3cc572e1e2emr8851350637.1.1786645805191; Thu, 13 Aug 2026
 11:30:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:30:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:30:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <anzm_YLft-J7pxiy@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <ed483d25-d908-4248-b8c7-862dd35dc6d4@kernel.org> <annnrGR1noVuBkCc@google.com>
 <69c86172-9175-46cc-895e-9ecd449332cd@kernel.org> <anzm_YLft-J7pxiy@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 11:30:04 -0700
X-Gm-Features: AUfX_myERGap35A1bA3IvemF8mP2h9L2MeL4s3gAw6GC_Dq7e6Qb6MukNKA94AI
Message-ID: <CAEvNRgFGt2Unre=iuXhdg+ZFjWQcewObA54h-R4mBcpfksXdKQ@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Sean Christopherson <seanjc@google.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Aug 12, 2026, David Hildenbrand (Arm) wrote:
>> On 8/10/26 17:01, Sean Christopherson wrote:
>> > On Mon, Aug 10, 2026, David Hildenbrand (Arm) wrote:
>> >> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> >>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> >>> index 65fbce46b63f4..9477ecebbbced 100644
>> >>> --- a/include/linux/kvm_host.h
>> >>> +++ b/include/linux/kvm_host.h
>> >>> @@ -2580,6 +2580,8 @@ static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>> >>>  #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>> >>>
>> >>>  #ifdef kvm_arch_has_private_mem
>> >>> +extern bool gmem_in_place_conversion;
>> >>
>> >> Is there a "supports/has/enable" in there? And should we call it "kvm_gmem" for
>> >> completeness?
>> >
>> > It's kinda stupid and definitely more than a bit inconsistent, but overall I think
>> > I actually like "gmem_in_place_conversion" the best.
>> >
>> > gmem_has_in_place_conversion and gmem_supports_in_place_conversion are misleading
>> > because it's not just that guest_memfd has/supports in-place conversion, it's that
>> > that KVM is tracking PRIVATE in guest_memfd and so in-place conversion is the only
>> > option.
>> >
>> > On the other hand, while gmem_in_place_conversion_enabled is better, it's not
>> > quite accurate either because userspace isn't strictly required to do in-place
>> > conversion.
>> >
>> > As for a kvm_ prefix, IMO gmem_ is sufficient for a namespace, and not having kvm_
>> > is consistent with most module params in KVM.
>>
>> Maybe we should have a helper function instead of accessing the module parameter
>> directly, then the gmem_in_place_conversion could just stay file-local and
>> kvm_gmem_in_place_conversion() would be used by other code that wants to obtain
>> the value.
>>
>> Instead of the
>>
>> #define mem_in_place_conversion false
>>
>> We'd have
>>
>> #define kvm_gmem_in_place_conversion()	false
>>
>> just a thought ...
>
> FWIW, I'd rather prefix kvm_ than add a wrapper to get a boolean.

Could you elaborate on the rationale for a wrapper? I don't really see a
reason to encapsulate this boolean since this flag should be global to
KVM, it toggles between tracking shared/private status at the VM or
guest_memfd level. Since KVM is a module I guess it's already global
just to KVM?

On the naming, Sashiko did point out somewhere that
gmem_in_place_conversion as a global might end up shadowing or being
shadowed by something else.

Prefixing kvm_ was one of Sashiko's suggestions too.

I don't really have a strong opinion on this but I'd like to know what
to put in v11.

Will using

  module_param_named(gmem_in_place_conversion,
kvm_gmem_in_place_conversion, bool, 0444);

help? The module param doesn't have the kvm prefix but the variable
does.
