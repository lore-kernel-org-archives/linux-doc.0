Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD0542047D
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 22:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289092; cv=pass; b=U2pzF6g/HFWPilIiznygwOkhTnIDvyd4tZJiT5wllb7S9M8yygAsHejNDgPBSkqSuBsmKbdtz6xCoOPgZ8H9sU5yIWroOgayIpQEmOoOmLy6AvS8BOVl08o4TFiX6RsLbWUq/V2cq0ftY0AgSBw7BxTFsqzkd8fT94vVhITO1Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289092; c=relaxed/simple;
	bh=QyHE3recU+YgckuL/EubHuVec7rhNZz4z30xRjcK4e0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nru0Pvn2JrDORdovFwwgJbhFSHvVrP3WM2E9BXANon8YjeKucd0FdsBD7aVr9OyKW83KXVRtYaN9jSOwOcD59Sa60Zh95PVUuiZR77zbL/p6Qo73e1ql1yOEbzq7mSKOr4f9HdJu1r/EJP0T6LCzwSJ2Rue7pWnc2c60kyEgOUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CvuOtUQB; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CvuOtUQB"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532d63f434fso5214101cf.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 15:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790289089; cv=none;
        d=google.com; s=arc-20260327;
        b=q4kpOExQLJdVPjdQARYTZKjJhISDTwoftjj6hyKFT7QfiuE2UBTduxWWMfsg5EolgX
         zp74Iu7Rn4SqcBvgYq1o1tgijP9OSP4TGwIVmreby4fMu8CLBHMRRHvBW/0MaHPXYimI
         GWCn8/J+RiNCgAjxiXQ12fHtTmZSXPIw5e8Nsg+p3NIrPl7Gg/B9xWMIKlDC/g7fkJG/
         LnDizqJqW9sG3SGlhuXauu57C0qVg1GI+b0REMzmtH0Xn3KkMcc4dzETPI1TADFbwDcu
         5dXWjxR/KaYtISbfcOQljkuiFXVNaxheSHNnC6gk/i7hYo8huix3RdsveT1KJ9/xEDl0
         ZZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        fh=/34emfnD0CsexIE1/z0Ht3hbbkWmREmMOaQqa2OvwYk=;
        b=OPNXEfvF6PDvYJCi8rDVMP+u7velIiwxu04y3xYyHisbzKdnEpi62yKkt+FcriX4bP
         /5OPDVoYKGfToT1hGjJE4NLcA9gnHKp5My3J2So398GSbrNfKdBx2vEu3TGwC4NebWqA
         fSscclnSHLZrDKkikCu0eKPAHNeDJxBF6y1glJ+r/5pd3ed9CZ9TSErPzyB57710UGoF
         2/JgTGDyyQZ65t2HGc8vw4tWgEEPpqrUa6JSiCsCn/cRkBHb6xrxQNtMi7ZWrtafaggU
         P+NJ87TEcYqqdDqxupbFrSXA5Vxa36CL+cHRW812UCBsUxiRJP5hs2J1bjsIVy0UsVxP
         DOlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790289089; x=1790893889; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        b=CvuOtUQB/B4NTpiIDVO0oU8xoIsonreGdXZVXw+78v7q5YrW8DRlFGYMCN/VBUc8/o
         iStJentZaoI9twayKt9xqPL4Cw0lEq6J8aWdENNeqkW5iOMhDcHPUuuz+TEP/dzXM+XD
         lOvy2Fxusw/H+NQynYSRCFYhcccPNiOXt0Dquf7WYm9YFLY9RBjgqyEI/6jCln8qG0a+
         Zesms6H6dhFYDz9REiTFRfRUEVG31ao+j/KiuNLF1UOKUsn9vGO2efLveO0xpbRX/6fG
         xoJF9lUTMvbWYpBW5X1sPYcJqRkMf5UvAzUv9NXVa998IVRHpFfx7HABfZ4TNWuvN8oB
         7q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289089; x=1790893889;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        b=ieTJGygJ3V4J/OaamI+yGj/5EYpIC4yt1kRcPzBOh3NU1qFMusowz/U2DM0NOGROKq
         iH17XyInD88WfitqfYJo+6YQkohngM6dhkkuJt9auOFDOMjLaWEgenERLZaH9Y20WLQf
         dNcYJuP3mcQSz+tvHhP1USjq3n4UsuU65myUTJ+esIPMWtxHxHI9Hr4HH44raYSvqoH9
         sF9zUcujBqg/LDccHBecvWgafVsg8zWu0I1z7iBAeoaRxEgvo+/6nFotipP05agz8COX
         Rl/whf7Hk3x+zNlVZRDPqmhe/zSycX9glpRZ6s6YhvvJ1atrUO5rJVZZOFIMhWuqVhIb
         nixA==
X-Forwarded-Encrypted: i=1; AKwUvBz7l84YmsnPftEquj6jrF189dpG0Phm+r5eKsbe2lgtF9UIgU7fnHXcu8YilRgFuFSKFOf3Pa0vACM=@vger.kernel.org
X-Gm-Message-State: AFuF++nrnSsiW+y9qSA/NTLr0NDsVbGLKLnmAT73xdqPLLX8mwBkcfR5
	h1G+jkvUkzw8LvzPagswwRDOupwpDz+afoK/Ym2KI58XQmCEDPPAYNeItCLseZVEmu7rPynJshR
	5XJoboIEqjFI3HUjtHYLQov/tSjSWmSU/NMZVIiiF
X-Gm-Gg: AYBFou2m9pVZ0c63ZRIKIJgRkeZVYEzWCWmBXUjBElZl3ikSInA0q6xGCXdK76b6JFA
	wdEOaRFuZtwEkB7+yN5ujnCxHx5juFfLyHIABD+145zzLnBNHQqXszLhEavqojo9dDQHsgM8BBG
	LDrvHF1JrqC/mbmlke7vf+Cc6wSDgpyCQ/0rmMVS4000/rj9QyHClSYpBHThcbbV4RTGMXewyJr
	plkqfbSZfdh/2gmeKWqJMhFhnyrrbP5J3uI7MQBFakXdwTp9lNIgMh6UJnWxc3qVF13iNw181gr
	v0PByaYSMUlq6V1ThRPn+MLJtkZJzIaBqHvoaiwwwdhAiY1gX/mJL2g7jNaZWz5nVgsQwVRcZgw
	XeS2WTJ4cV0ddD2R1+DEeusaDtBuwcoW9vcuS3tU21A==
X-Received: by 2002:a05:620a:2b93:b0:936:eeab:307e with SMTP id
 af79cd13be357-93c43cc5676mr141474285a.9.1790289088659; Thu, 24 Sep 2026
 15:31:28 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 15:31:27 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 15:31:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <179028368162.2007072.12117327378679658047.b4-ty@b4>
References: <20260910-gmem-inplace-conversion-v13-0-dd6fbf94f4e1@google.com> <179028368162.2007072.12117327378679658047.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 15:31:27 -0700
X-Gm-Features: AclHuK8DxWsVWtzA-dbMsis8Esd8BT_dOvi97JucFF4AgqprHJknTuuePlOITb0
Message-ID: <CAEvNRgFpMwduvHPGJ5fLoVPr_iGn=ELzY4AcMGHESC6CkMyeTw@mail.gmail.com>
Subject: Re: [PATCH v13 00/44] guest_memfd: In-place conversion support
To: Sean Christopherson <seanjc@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, 10 Sep 2026 16:55:26 -0700, Ackerley Tng wrote:
>> Here's v13. Thanks everyone for the comments and fast responses!
>> We're now at ~3 weeks to soft-close at 7.3-rc5.
>>
>> v13 is based on 7.3-rc2 and:
>>
>> + Hugh's patch to export lru_cache_drain_for_folio()
>> + Another series [1], which makes kvm_gmem_get_pfn() NOT return a
>>   refcounted page to KVM.
>>
>> [...]
>
> Applied to kvm-x86 coco.  A *huge* thanks to everyone who helped with this!
>

Thank you so much everyone!

>
> [...snip...]
>
