Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACCA468C15
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851185; cv=pass; b=e6QEWJFqHB1jtEN0gmGEI0VS/TBkBgkmdBjUcczIEGE4pjIWLQS/uGUxI17U8ONA0JzOsuqfZVwHM9JcqRwHR+KKa1OqXoV1pqzl2UmXiQ9ewpZF5CR4theQLAHuCWRXvw9Xd035sNyKUhCgFMOqgsza0n7MZx+N16NOSfgrLoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851185; c=relaxed/simple;
	bh=G5AgHHHY9jv0ygOB7Vo21BSZnxPwBZqAq4GmulyN/nE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcoYXi17+lWdTMsSCDZ8fBIPmA/7890XDgCxKQxj20gci74Y0VOQeKxUk4lOOdNBNTGOmP2I5RvGHB9Zp6iyREO6wR/JSsegbbCUfeDQLM4KDOYrcj3v4ko6jQT7kNJFSrbypqoLN+eBfR683oUWNm8GmvNk4qwZK0/d9aj6yLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mWtq8nly; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mWtq8nly"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca957432c7fso3271664a12.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 06:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785851183; cv=none;
        d=google.com; s=arc-20260327;
        b=TamfrLpvXpJ+QvfBr2eP0cgDmNptEOfV1/EV8Ci2y+a9LU4+cpW1T332WD3p7i1q/D
         ghzw1jF+QyWUH+GM9D90lv8jk//pDAB+3cm9l4VokIwCFBI3w4JsZFXxaYDXBQdR0e+Y
         LIZglnesBerHrd2j6yXPaU0pMDR/XziThhGzMBeEJPsDlWX/OETbmSp/3s3j9zlclLzN
         Z1tmZ5M94lOYUmDfP4nbP6XwETYG3caB1ywotnNeGav0laXjh4FW1zTMsEqXDdQMT57R
         73RLjDsyQ/LduVdCn3IMXYw0eUIJivLxJUTDu7coZVYEb+Mijb905U6McoNE0IBD0K4W
         4Kwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        fh=ryG7YiY3oiGc8+qipOiJOm+rri+8cvZQQe9oyxhuFJc=;
        b=DnnjIOreSFkKN3mgZPQ2lD0t5/e8Hz3qKTNYL5TjA2wmBnlZlE9k7DL+W7Jv6Bm2b5
         SBjElE6IciUcSAWNiecFx2A92r/g3tkBrj/huL9bfvKGDfjopLekRmvgH7IyPom4ENp8
         WLdjiBLgKxzYlYAQS5WL1I7LPF0aYrIle5cEVo+zvuZ4Eo4PuF44IgryIL0etMis7DxO
         hfr9w8zx3nv1geBHXcLpOqNeRL1PieWMGIO1oIkI7oWLPVxkHOgdu2qinLjcqpkRJLF3
         GeDHWXZzK7gyOnLotGu9Dv+8pkW6Mq18r5tzeKdITIYqJgHKcAyfHUkWOkNXLb+01fYb
         BBCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785851183; x=1786455983; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        b=mWtq8nlyYrl23egWBWkK24KaXetJVtg8kZISMcfdOwRnWGcHvZELwtAmKzlUcugx3N
         5OxRIsf2aFLr0ihT4DWBT4uVPAINkrpOl8/fIQkglhwEhE9XTA4Wm0Ar+XCLk15cvUmk
         CBQe4T20SEfQYj+jNmOj7pBbcHWQ7Y2OlRS2X/Z1ls32NqAqagUbYEZ+5jW/guBtE34v
         cKDVmRsfIfwqaDf2oW758H6ferBgjJ8Jcw2MMqGET+n0sZt2IW2Y6us6UwRftFyLQ4v7
         Hk3bc6HbM9kbqmfF5uvgTGdRi/GSgnNTdOAI03Tx93fbMd0D0/tUTwNIUkAf2mOlwdKH
         X67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851183; x=1786455983;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53G6mJGAaV7ofRwgRemJGkr5zkTXgvKFenxfcvtRtyE=;
        b=WXY/FHovb3Y2k+v6xS/sSsfz3pXK/eRC9LnnMVSJwetg6xfnBvIdAxnZgMJwjjqoEk
         6ulIQL6akFmL+UWX/qhSF76YzPsQuJur7EQ73WIlAh8/DL0j9soSZRCrpjv2ZjsjZ/3Y
         vW1D3mhmE0o2BLmHEnxPBemR2P/skKBhQmjstKCaeS1Sohw03w28ZaFPuJx8Guxevix6
         jNLwnm65PioOXuRK9N7SSnsWvHyXHQAEvYylGUkUFaQxXwKtobeU9MlCzf3wbhng7yS/
         hh2HsYWLii0qCj8rq0k5eikeLPpCNdU8Xjs9VzBrcoe47AW5rDK7+Vv64qEi3O64sqnc
         86rQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTU92nq3ROoW9cWAU6W/55BUvBKnB+W8/MqbB6k7zC91K5hiw0BxOcz7RSAykEPzaiL5cgoLSIdzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO2iW9xEmVJCBSJHBaS4fqpFYYRrUrVDYoq0Uk73KVEdfaGidz
	V51YBYNKZ+XGoPahS3IL9AeRpcZ+N2SJGrLhmNIONziloVeOxOf85NZgbiCGr66oT+LpUIqKSzG
	JyMv55zFQvOtUbIc1TCjICG+N4Vg6YPE7aBrtSjR7
X-Gm-Gg: AR+sD11331i/hQ7yN6kVNu6sHZJkQxO2Zb293sk98MGL+TaNyVsGIoFKo5CaWKYmj4F
	7HLbFouMUA/qrm0Ha4STzsnUJ/P7A7teR3PcSZj9wCNQckYsUFCyScSKzD77h1+DeL6y7oVQoFS
	1Z1HCQ3Yb2U7pjJYB8ui4UtI4WXbsdNoTl/wHUxZOS74lqKNaj4vNLhl6Rha6XDEwJ9LU+hd4HE
	6rzLhz79t29oAraLHGZKhA0E4wnVdLPEM4fjsDS+JXUsTKE3QgLekk9wEFNhc+IC9CQHomN0YSW
	4mngr6LYsF0huyivctpCkJqSk93IFA0bMDuGiRwnlE4C1M3xpA9tPqjjx739QeLipm7BzlpHOfG
	6JTP+fGXpeio=
X-Received: by 2002:a05:6a21:9f10:b0:3b4:931c:3c7c with SMTP id
 adf61e73a8af0-3c92a7bb452mr15042590637.44.1785851181842; Tue, 04 Aug 2026
 06:46:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 06:46:21 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Aug 2026 06:46:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <amzIckjuwf0JfINI@google.com>
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-1-35f9aec2aed2@google.com>
 <b78bfee9-29f3-4044-8ac7-f294b3cd0ad8@intel.com> <amzIckjuwf0JfINI@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 4 Aug 2026 06:46:20 -0700
X-Gm-Features: AUfX_mxGk5RmzD5OeFVHjblIz9X-b3hzxwJd1etRfElQwBfbfA_qJlZkICUGG7E
Message-ID: <CAEvNRgGJ4DQuOVafc8ipd8NGP+6y=dcwSZPGOjtrHBAGO7sB9g@mail.gmail.com>
Subject: Re: [PATCH v9 01/41] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Sean Christopherson <seanjc@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jul 31, 2026, Xiaoyao Li wrote:
>> On 7/29/2026 8:35 AM, Ackerley Tng via B4 Relay wrote:
>> > From: Sean Christopherson<seanjc@google.com>
>> >
>> > Start plumbing in guest_memfd support for in-place private<=>shared
>> > conversions by tracking attributes via a maple tree.  KVM currently tracks
>> > private vs. shared attributes on a per-VM basis, which made sense when a
>> > guest_memfd_only_ supported private memory, but tracking per-VM simply
>> > can't work for in-place conversions as the shared/private status of a given
>> > page needs to be per-gmem_inode, not per-VM.
>> >
>> > Use the filemap invalidation lock to protect the maple tree, as taking the
>> > lock for read when faulting in memory (for userspace or the guest) isn't
>> > expected to result in meaningful contention, and using a separate lock
>> > would add significant complexity (avoiding deadlock is quite difficult).
>> >
>> > Co-developed-by: Vishal Annapurve<vannapurve@google.com>
>> > Signed-off-by: Vishal Annapurve<vannapurve@google.com>
>> > Co-developed-by: Fuad Tabba<tabba@google.com>
>> > Signed-off-by: Fuad Tabba<tabba@google.com>
>> > Signed-off-by: Sean Christopherson<seanjc@google.com>
>> > Tested-by: Shivank Garg<shivankg@amd.com>
>> > Co-developed-by: Ackerley Tng<ackerleytng@google.com>
>> > Signed-off-by: Ackerley Tng<ackerleytng@google.com>
>>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>>
>> <...>
>>
>> >   static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
>> > @@ -60,9 +68,25 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>> >   	return gfn - slot->base_gfn + slot->gmem.pgoff;
>> >   }
>> > +static u64 kvm_gmem_interpret_entry(struct inode *inode, void *entry)
>>
>> Ummm, I'm not sure on the name. It doesn't look like KVM's style?
>>
>> Maybe, just kvm_gmem_get_attributes()?
>
> +1000, "interpret_entry" is extremely vague.

Was a little stuck with naming, my frame of mind was that "entry" is the
attributes, so I can't get attributes from attributes. After you pointed
this out, getting attributes out of an entry makes sense.

Will rename to kvm_gmem_get_attributes().
