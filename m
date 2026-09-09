Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265C15616A5
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967976; cv=pass; b=pa5YbgCtVCbAN8fW1Ie8bay3D2fgNdCOmOnonyd1rLy3BkVii/K5WkbNY+UH33wsQcF56dta39twumnJ2he/czelzQ/1fRhf9J6DRJI3/+NXQs+Hzgbl5VbrfR/0TMmcS4T52tPGe8Sze09VCg3IfFJmVhpGZfQcpgBy9J3PWkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967976; c=relaxed/simple;
	bh=uhhQTIaQc8uxwzQ47gAsGq8TmGrfD2ovEMzuW5mE1Bk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEwzqJJtxJNEiE0OYSAtrBEN5j0wi9VIuuGdeKwQP2fvaIJ1RvWL1nn0d6i41PqV+eeMRoKn1rZlweP4Ry0SbP6uDMF0skO8pzU+ceikJlD1LpZuBQnFfmu6U6jt/K69LYMbRCmZbdySJEkzFr2tUNY+AR9Jjyn+Q2Rh89KDTeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pa/3XfJX; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pa/3XfJX"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91034716d1dso89178636d6.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967973; cv=none;
        d=google.com; s=arc-20260327;
        b=CxbVGSo2IIQW6znJ+bAlwx/jK5ZGrVi5SkYjSSNdmU32uyLi4k6syZuAzhg2JkWItT
         F1kzQbD4dFFqfbdx5P96SGb3EXEfNRqxOJx4HSb7gm1qmid2pd8VxpKlZd4gddM5DoLr
         qqoioENE0Zp3mPFyoUjcQLbrMMYsCYSDdp09YdgQOLwvHJUP82FFl3XRIMiHilV2igSK
         mXag6OhNIKHcLJvDz0flagqZ3Rm8B8BkkZiY87zQld7BJTd1sn/ts8MQK/k2K6mOcdsw
         rrciYjm8uu3WeAefF7ryV0mvOrLv8Wns1wXeIasHxYGMeCalMV/Get9yZyqYhbuMwBh+
         WSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=+0yQ0IytrFR+cprTV6f0ILvHwq0HfsKregN1JLnR5qc=;
        fh=r6ojAnJ6fsPblGFjDIa3HHC+4wLEdu9bJiL4Wn6wYug=;
        b=l97aGcm/+TGaND3sZ/vpDaovcwjQDkJpXN2F1C00vuQNoEmpFCA8Zv6Ri/MKm13vdh
         MypAineGeJtj9iUlFqv616EFUwUOLi/YfGkeqERvnFYumTLTaWXQOshB+Ww2jNYjIb5L
         gi9binbqhFCYrnSYpv4B8lt5zhO0xvRnlW1UXRSKTKSAODgDqos0GR5YDyULb4ALYkqB
         8BuFQHNHJCoqN5CHT9nHEhbept7KQAsHepotL1Ag3nR09zHGLOHdrFLqq/M0JWB6RWGV
         08fCM2NaxQEyMynm/z6Ps6nGe3f/uDcNxxlmkoSLtyJ/Zwi+rrWh7JoFKeV72Oj4WDhN
         Adwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788967973; x=1789572773; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0yQ0IytrFR+cprTV6f0ILvHwq0HfsKregN1JLnR5qc=;
        b=Pa/3XfJX1Z23SmoW6Qgtk5M2jiLZeIH0RAVXKxm5hqL7iIUwEQjskVSrOr8EHX3pjV
         I4RPGlA+VmHOywvJJagD89UGg049dcpbdaWcTR3+IVEcVQ0pKM1UBN7wiupm+KJiSiCD
         Jmelck7lCe0pWyONQ/+v6gL4dWbiOVFfJZbQP2ZvvrlU98dtDkBmEpMkglPRGlqHGxHv
         3zha9R84ROcHrKYkduq7rAOfRAf+wF1+OrPNSIQIzAxgPm768gMa5xOzuK5UPMHtbdHV
         PzUoXJjpoY8dGFA8ioOAWWDUVSiHuJUhjBd5HDhetk4Ls3dmhjt/hZzoZkYtOOOEmhmQ
         CcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967973; x=1789572773;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0yQ0IytrFR+cprTV6f0ILvHwq0HfsKregN1JLnR5qc=;
        b=M6yOK4sp6zfp7CtmdLTo7gUx+UsvjcGbigsPBXIgwno2jcRMfbF3UYPxn5wsVFIfF7
         qFqmn+wEyVxPDIU183erJB0SiZ30ET4XNaCL8gECR4qjGWpHI5nCVmf2O0xdcGf+X/v1
         nlq+u6QpbWc5xoH5YlEV4XfIKKQl8pRqBl3oVDXXtbuvbU0WrYRzXOGKYsr15ziBNQ1+
         p31ZoWg0P8DKdKNz6+jyjetwowyUFzFEwDtwLmeIBN4aNOMmCsylPrkD7Fpre8toJ99S
         ZfQDKneUD69Hx4w1ryltPR677HRNa3lMRO+kK/rPagloy+bGICLL8VnQim0i/8ABmRsL
         2JXw==
X-Forwarded-Encrypted: i=1; AKwUvByhHcQRl8Q+saqAw7W0QWliRusBTL+YJLOGY2gDB1eCIxmNDZFpcuxRmYyjRulzUaXhvSXbYARs3HY=@vger.kernel.org
X-Gm-Message-State: AFuF++kPXvnrR8Fi/gyFpgJS5HAREmORGv66pT6rdV04Y4LU+wVq9kfL
	+TQ2yhFMGYVlD2My9KRT03nd8remlIxXtOHnpNSO1/J+TJ2GGXhWqwIYhDanYcd5GSXdG/tyKTP
	ZVIPMzSGCBN4LhoocXBxb5hB/kI9zzxlSG6R89Lfa
X-Gm-Gg: AYBFou2U30/5lpBnjGXmfI1sPGEoOtzOzHuteqbJUE16SF0pv8h9lMWiKx3eZuCal6N
	NYBhl73byGnua8cJfMhYW4hbYdNf8HOUuDfwRoOfVozELH7mEvLknGCIqY8qQHj/tIon+2SfGu6
	fatVIjfVNaLQjEWDA7UMnQ6tu9vkChvoAqHkSwdTW4Mz9APv+CEY7B36mVG890m0eSr0ts1v4m8
	8vxgMYfoaVRuCgoFmN7tZAjq4aVtQNrHjDPjjHZbI8LmjPnfFWAAf1Q6OkNESrEuLyRem1mpePS
	9us/3g66Gi3kV3IJMU2JZ3bYXYYFY+IOpzQurvkLWSad1bYN+iF0oMrmgnNZszoaLphXG450vJR
	poAogpq8MyVtTk8BMBuYFBw==
X-Received: by 2002:ad4:5ce3:0:b0:910:7076:b681 with SMTP id
 6a1803df08f44-9107076bb36mr33516746d6.2.1788967971471; Wed, 09 Sep 2026
 08:32:51 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:32:50 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:32:50 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <apcY5b2o5k04XffH@google.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-23-85e5fd25252a@google.com>
 <CA+EHjTzALzghuG5J-LFuG5pXJ4WgEfrMHgwkMHnq1U-D6yS7Pg@mail.gmail.com> <apcY5b2o5k04XffH@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 08:32:50 -0700
X-Gm-Features: AcwNN1UUq4SnqnO43s4JocxnzO6yIsHxwMjPp5Qjf0-uaaWqzT0IH1RML9MbcC4
Message-ID: <CAEvNRgHm6AbbUUayS=Smck_41CrQ7yXYCN5soFOYZ6N-YqtXNQ@mail.gmail.com>
Subject: Re: [PATCH v12 23/45] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Sep 01, 2026, Fuad Tabba wrote:
>> Hi Sean, Ackerley,
>>
>> On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
>> <devnull+ackerleytng.google.com@kernel.org> wrote:
>> ...
>> > +       kvm.gmem_in_place_conversion=
>> > +                       [KVM] Controls whether KVM enables in-place conversion
>> > +                       support for guest_memfd and tracks the private/shared
>> > +                       state of memory per guest_memfd instead of per VM.
>> > +
>> > +                       If enabled, KVM enables the KVM_SET_MEMORY_ATTRIBUTES2
>> > +                       ioctl on guest_memfd file descriptors and disables the
>> > +                       legacy VM-scoped KVM_SET_MEMORY_ATTRIBUTES ioctl for
>> > +                       private memory state tracking. Only the
>> > +                       KVM_MEMORY_ATTRIBUTE_PRIVATE attribute moves to
>> > +                       per-guest_memfd tracking; other attributes remain
>> > +                       per-VM.
>> > +
>> > +                       This parameter toggles KVM's in-place conversion
>> > +                       capability support. Whether a VMM uses separate backends
>> > +                       or out-of-place memory management is determined by
>> > +                       userspace VMM design.
>> > +
>> > +                       Note, this parameter is only available when
>> > +                       CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y. When
>> > +                       CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not set, in-place
>> > +                       conversion is unconditionally enabled.
>> > +
>> > +                       Default is Y (on).
>>
>> The parameter is only settable when CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y, and
>> in that config gmem_in_place_conversion initialises to
>> !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES), i.e. N, not Y. Is the doc line
>> wrong, or is N-by-default not what was intended here?
>
> The doc is wrong.  The intent is to maintain backwards compatibility with existing
> deployments if KVM_VM_MEMORY_ATTRIBUTES=y.
>

Thanks Fuad! I got confused, gmem_in_place_conversion the variable
defaults to true (because CONFIG_KVM_VM_MEMORY_ATTRIBUTES is by default
not set), but if the parameter exists, CONFIG_KVM_VM_MEMORY_ATTRIBUTES
must be set and so the parameter defaults to N.

Will fix in the next revision.

>> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> > index 05c518c9b8078..929fd3e1a01e6 100644
>> > --- a/virt/kvm/kvm_main.c
>> > +++ b/virt/kvm/kvm_main.c
>> > @@ -103,7 +103,10 @@ static bool __ro_after_init allow_unsafe_mappings;
>> >  module_param(allow_unsafe_mappings, bool, 0444);
>> >
>> >  #ifdef kvm_arch_has_private_mem
>> > -bool __ro_after_init gmem_in_place_conversion = false;
>> > +bool __ro_after_init gmem_in_place_conversion = !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
>> > +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> > +module_param(gmem_in_place_conversion, bool, 0444);
>> > +#endif
>> >  EXPORT_SYMBOL_FOR_KVM_INTERNAL(gmem_in_place_conversion);
>> >  #endif
