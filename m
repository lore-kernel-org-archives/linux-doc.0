Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380812F49FD
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178718; cv=pass; b=JM8QwtkHKFVGRi4/PTn5ctgwkh/uSqtlNDsz4iLlb1c1SQItCm8qpzdK6TMuOZIqvIB52KIuBfUhkLDcnQal6/R7kOfpYxu1x1z8sg4UWjP3mCWln/79jlovvlHTR+or9FOBFDm3yTp2WqyTdAsFlbRI35+oa8/g3QG3WmzxX7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178718; c=relaxed/simple;
	bh=9Gtd+5W8SMTR25ZmPIeA+8FPrVOqTlN7XkJgDdQpNlk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIqW1t6ZaQme5wOUnaBm8XMglKb1JQSxQ1fA34Zx8PAC514V3PD/abk1sdBPYRuokoeCgfiZtcXK67XDR4pgdj8V101zklYGIhz3uWeiqvu2Tmtu/eG4JYuP9gSWKcOYC5ap3Emie1aaaufLOoxW2NPHm3E1a8crSAcWNllmaxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y9cxe9a7; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y9cxe9a7"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95d18b33f93so658205241.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 11:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778178716; cv=none;
        d=google.com; s=arc-20240605;
        b=c2w6Y1+DAWpi04OzwGFx5x24UfJM+OyGw+UwUfz+IkeE7pjKqW1RNo2c74JUIMQkcd
         5gi5FjDJu7ElYgHDzsGxV+NDgVr3GCr3DuzpQoiH0RaHyzJ2+PQfsDjvcqbQoutaL95K
         YcZqtdknUs7f1HCbsH5xGsVANZoa/0LM0QWGR9t+msqmsEg8cqMq4Pp7q5TMalZbxydK
         NqEEabXfr6BTAc6IMGckaovP435fSh6ItLK6A75c+EoSx24F8fQb9HqYhpYiXJVtTsci
         +r9dpLm1SOw6HWYiyEDsVeF+1EdF8PiUXN41/3D2Y8paNlmEXMgT2/6wriPhQd0RT2uj
         mUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        fh=9y1n3nzW9yIYnU2KFby9ptx+pB76ZIE83bqBmjUnNBQ=;
        b=AHIdy/LFWElpn/KBHc9uo/Na1St1vGyik5xfpYBEdXmtj6So8JD0T7Jqh/PuGj2Gor
         m96IHktquLFmrFWBqlv53vuhVDKL9MD+zOyw1vmLmVT9VYyIaDJ34ZX6dM5cdFpUa/Io
         PrjjbbGjz1b+Ke2vN12+CuFD/F2l/iMLEW2c6nobBbPYKMW3FVBAIbKF7aihgo9mcNpX
         JHYgp6DVmw/GHtP13YDVD4YWD8hCSRWf+Wz4WZsnwX5bmgHhQ8x66Y7dG/ZGREOQVVQp
         D7ueV8KExmSTBo0o602HJmGtqaQveV7rUxuO1HGg2GBlrT5cIFj2cm56DbU2bLfA5OGY
         z4Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778178716; x=1778783516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        b=Y9cxe9a7HFizfWlIgAijSTg+sNOKPTCIfD5vBOU8y8Mz/QzE/FeerqQ/A2UvBuNAw2
         SBJCjy2e9x+XrkotisFuXDN1fRpLDdslnUKMz7KTp+mWIp5ZjnvluGkicFwv0WLNLI5k
         W521Q4uM1HXHMZDeGy4rTjT3wadbifQg1CiGsO9Sg+r07nzPaM9y1jf99mIjsHCP/qlx
         eAQwh3MNgEfls42ChDhMIMwg1OxbbKaY/0UCXoxdsH1YSSv+/YKUdiT/XB1WlHklBfW2
         gwgP37FB3EkaYPkfJ/o0nlF6PrzisFdCh5IOg1DrZctdmHN1lrUn6ml/EJIZzIjwRbAG
         6MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778178716; x=1778783516;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goCC1MXS8+Hmwnd2WWRAT4Rp01B0ycJCM1C1lBpTnIs=;
        b=Mw9ULzCW5zdfXjmhUeRxQ9XdCilAzliaOcIKj+SeQIvLUWdIlpr6iy9NVCseLDkeRJ
         yqdeReAsillpWNQkWRatSrIVLKrKsptprxmqFjCSLoHtc+ShNXYutvCrnkYLnGaOticZ
         6PFEL/i4ghnNSJe7xE5qXL85kg5oP/5WK5qw9qcwGLezhrkmZorsOl0JTeuUJq3GSqtV
         Ln22gHuwRNcAtJr2itOsZYzE2wH5Y2VdtDgFrh1FNqDejkyENs7DanXBI5f2X1kzpH5f
         Jm5PBgyYJp87p5j+LuWQ/V5Kqb6O7OiVZgrV6ZAF0BRPm7EnQwpGwtSRnJJprJ63XJIo
         t3bQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Zn8Q05NDZgr6zxuHRyOMZwD+HsSaDAuIH3snoWSijipMSFtgFBIBx/luCFYn/7WsLuXGHw82BXGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjW0oQNecdmxYwDMqE8DZK+ErVzQ4GdpyjzhukRYZ5nT6N1Fq
	y/tPmRJ+BgwzP+/TnCcuStrl8jnak3LrGoaUEFQ4nWt1KEUXcnozMnuTXkGTCUIAMMV/tg3BMzf
	SFSe2uK58mF352KuqpX3GAoIKAZ/K49N/j/jZFR6m
X-Gm-Gg: AeBDietbyN8ke66qaWSDEBZ++h0xPbuCnxLYHvpstQIeys5KbA1iOiO9toEBa+acUek
	cJWTZ+iwsXE6qi+U4gc3gfE6fNAaHlADrV+vMvPtFBhvjKsV7rYjEH2mC9szU1ANQivPN6IySDV
	MocH35QqJrclD44CQvnyfvnMUm0/xRWpZGcwXNhHiqTYyT87DqXY9UAJijRLk8aVJC24rTMl+hx
	Nt32TwtXljQvcZ6vF4KtJMYh0hnJ2rHMvngJEF3JKQJpYY02mqNuym0eNxB07BxvWkqpf7pJLTr
	8/zIfDM/Y9qV5zdczMgsTmJCVQKcwQqJVeGl5LBgcxXbWjYGB2ztnfqY+zAZeyjsc4aLOQ45fjg
	L2fkN
X-Received: by 2002:a05:6122:6304:b0:56b:a7de:7129 with SMTP id
 71dfb90a1353d-575702cc825mr1528185e0c.7.1778178715530; Thu, 07 May 2026
 11:31:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 11:31:54 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 11:31:54 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <byywwfin2aenobdwuesqihm6nzxyx6ecedwgbt7f5tvaaul6fi@u7bmexpavwdn>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <20260428-gmem-inplace-conversion-v5-1-d8608ccfca22@google.com> <byywwfin2aenobdwuesqihm6nzxyx6ecedwgbt7f5tvaaul6fi@u7bmexpavwdn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 7 May 2026 11:31:54 -0700
X-Gm-Features: AVHnY4IrLeBlt83AneVyVg35mAkmDcan1kch_gmoyAe0Nsgg7IVb__9uDe3mtms
Message-ID: <CAEvNRgFGc7SRy_hkfSH3X=Cu00CP6wMHBJO0+55uebKTezWVnw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 01/53] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
To: "Liam R. Howlett" <liam@infradead.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Liam R. Howlett" <liam@infradead.org> writes:

>
> [...snip...]
>
>> +static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
>> +{
>> +	struct maple_tree *mt = &GMEM_I(inode)->attributes;
>> +	void *entry = mtree_load(mt, index);
>> +
>> +	/*
>> +	 * The lock _must_ be held for lookups, as some maple tree operations,
>> +	 * e.g. append, are unsafe (return inaccurate information) with respect
>> +	 * to concurrent RCU-protected lookups.
>> +	 */
>
> Can you please elaborate how you see inaccurate information and which
> information is inaccurate?
>
> Your comment is incorrect and misleading as append will not be used in
> rcu mode.  Note that you have not set this tree up in rcu mode.
>

My bad. Thanks for clarifying about usage of rcu mode.

>> +	lockdep_assert(mt_lock_is_held(mt));
>> +

In the next revision I'll remove this lockdep and use RCU mode, and
kvm_gmem_get_memory_attributes() should get a stable result.

The other lookups using mt_for_each() in kvm_gmem_range_has_attributes()
and kvm_gmem_get_invalidate_filter() retain the lockdep since those
operate over multiple ranges. Those are called from paths that require
holding the lock to exclude other operations anyway, so the lockdep
requirement does not cost anything more.

>> +	return WARN_ON_ONCE(!entry) ? 0 : xa_to_value(entry);
>> +}
>> +
>>
>> [...snip...]
>>
