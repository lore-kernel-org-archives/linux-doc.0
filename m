Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24435DA43
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348679; cv=pass; b=oJkRrX12/NRcoe5W4MZPJIMLPrwIFMjWD2ixBHgz4VFglKCQ5wbccK6BhveV/g07YBrNMB7CBOY+FfmxuwRrSdXMf2p7n0KYZCkO00kppTid74VmvqnglQjg+qE+fm0HbLJCbqxt7ARlrkTGFrDqIMnsTey7RZ1RvETcAVVb6Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348679; c=relaxed/simple;
	bh=XHlZItdK9pHZDtShz/g2SubgxMlbGRtAoD9tOKGcWfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uvem5PLhPPZVWgv++k1xWjFZI1+AO0Gw/EJ5CQxJ0gH/vbByIilHX/dNU5If6hzPSjutNkp8g9+N58ynV+RLjQt6m5tmesUSlJ0Bp+lP+0zfJPEikarcnM/YQqqsNQvRHxR52SvIjbyGrJfqWRas0rLEHp1nrrbVEYx5QXyQaSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vMgBG+gl; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vMgBG+gl"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50e61648f10so6711cf.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 00:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779348677; cv=none;
        d=google.com; s=arc-20240605;
        b=XMZI/bXAzYchrULC2saEqaHdaecjy0iqbV/IPi7WFbrip6Urop60YQ/Dqq46LBlDGp
         O1pgy8nEblJV/BWmw+aA38Z9GaeUmprzINeQEJNzKHN0Dgh5rA/OID7N+2aUVBOpQbd+
         kyhT0zuid/1p6wwlnHzCX+qqOjE8i/Kikxn2LJcYcXV/kmqdVFwNDVlq5/ceLSHnI5ML
         T3l/DdDrbJH53T/Nhe3KdG2/dMGyjXtTvBS3OJqvMKETdEoiNhrJs6NBgYG5Wq7IrPM9
         MDzye5X7fyjqUUfghLtfKYKF+B93Hag3yKK9rFMAhhyErgZrSlPJ5TI8XIS+FB7j+qdR
         nb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1nov9/2BtMfIFSe84psXHPo953z02mFT+vkGOoJChBc=;
        fh=n6FfZrgOM73R2MuWD0bmtqETRntHx7Wad+Y3gef7ar0=;
        b=AMhj9fBmYL1hhpQrMXWIGkNeUXemmM6/RaOKGXbGoxIROuvt8NyHA1qOWGrL4fcf6J
         A75VvkQfjEbSlAHMBd85H6P+/2IfeSjDjHB2viGkZm1aQDJzi1wyuZJFsV449tsQFXm4
         y6fZRk373Qzqf/gETVFwzfei0pmfSYgfRfdXqgWgtwQbHtq58OjYs0zRJtQSjjobrEhe
         V3f+6sTKXpqQe46BPuSsMPI4MLBgkN0hWWT+yQlohMg/L4+ZneZBz5kvAx0ERgYchp2G
         KWHzmkwB6sf0V4+CFZukLCPB50wP1dN4IjU6q2VQ6CeuFKRz/eejMze2aMXym8cHELUr
         x8kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779348677; x=1779953477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1nov9/2BtMfIFSe84psXHPo953z02mFT+vkGOoJChBc=;
        b=vMgBG+gl+TJmqz7EJrkxlO+cmw34zZITmz3M1CSGrp42FzHn1JgRe+y2jxAOU0PB5P
         7sDkQs2g4djNy3gDoohAVF0+NxIiQFtDcDG136xGO87w5kzZ1KgeNdSs4HewqYWTNvPV
         hV53phfFXwrjYrBD4MyleuvzRVwinutKcijNNYzvjvBKYiE8wJj9s3PIt/xaHftvWjdO
         g1pqyHfvVoAsb4CgMpNxnn8Q3YLWTHGya4OgNUAwzRnxxENnnSA/gDvYqI20b6JGDyb4
         rxPzXz+V2A/XtyIr+sCTLJRUkOrgUOjujx3aTsyKmWQClgSeCTiJkyqUPwz62AQIE45h
         rLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348677; x=1779953477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nov9/2BtMfIFSe84psXHPo953z02mFT+vkGOoJChBc=;
        b=jbDAGBrsAlGiBK4YZ14hehA44FVypLtct/akQJhw4Rmp7ZbW50aYCNETCwWGU6zz3y
         0ELWQXY+fXuUYWezDq1cp5rr6lxDCmlV4hN/w33QIBb5CZbAhJRaRDpguE1W9wk7WCaj
         Ai3pREseQpjV+1uGyErCOpyBT2Of9wTmb2Y1c0SzID3z9QCBsn+XSDYy4pmUcxu7dOYb
         IXCUR+ZartlDkOIsW8qjAD06jzTi2/sQd8B1QE3GBTUjBJSZrOMw77LVl54URF/fAa6z
         aFW7tN/HufwqcbPZYTlGowzf5VpDRdknagodpbGiBY5otGNVzUur1UApmFh4BLUeOAvf
         kmcA==
X-Forwarded-Encrypted: i=1; AFNElJ8zOfIBijnlBCulLgFSdxzBLHuVQdR0o3p9WDx79kX6yMmE8WUtDaKYVjsYPArwptH0n3OnMc2WGV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwiYka4OJejPqJ/JdUxFgZTfYm9v/vqE3FP8EIeVFo0ubYSwF8
	GWSHcHEp8Y5G84N4/vwg1YWIqPru9b4TIHl/r+ruCbz2PAT8c1dAeyREOt39rS8jChRvimrggP6
	6CJNHf+UFxpT+QAighl8FdIooJ6iFf2QK3r1B65hs
X-Gm-Gg: Acq92OHKAMSnX3uMDKpn/lcxlg1CnGcWIGlS3uxId/d9JeJPiQ9oxOb5lEZUHmAFY4H
	0tin2CcQhPOFTAEina12SDtsLnORYLsyKDlxI1+gYAuFFpWOWubx+8rF9hrZLqYe3WNIBrunr7J
	RxpTHQOwk/rAoK4geC/ZOeR5C+HIZT6YcDL7q5sbY9eRnjat9MqNI0eb1jgcul8C7txmLJ9Mi1l
	+oVC0YUoqYtZVpL/MQsqSM1PUer+ZWevosVDTDiIO5TVIq/S8uK3W1UHjoR1hbDijyk2E+kPlwX
	scRqAjCX8OXokb5qcjc=
X-Received: by 2002:a05:622a:9005:b0:516:4f62:85e6 with SMTP id
 d75a77b69052e-516c54d8a37mr5382941cf.17.1779348676536; Thu, 21 May 2026
 00:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-16-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:30:39 +0100
X-Gm-Features: AVHnY4JV7zINIc5-OFXxSXoQ_2kIaSiAQNVZEIUteRP4GKUxLGDjyOPiw4qGQa8
Message-ID: <CA+EHjTxcadguOfOo7RpJVtAzcY5JAFZTbrAT_wcN6akMi8gCUg@mail.gmail.com>
Subject: Re: [PATCH v6 16/43] KVM: guest_memfd: Use actual size for
 invalidation in kvm_gmem_release()
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> __kvm_gmem_invalidate_begin() and __kvm_gmem_invalidate_end() actually do
> not specially handle -1ul. -1ul is used as a huge number, which legal
> indices do not exceed, and hence the invalidation works as expected.
>
> Since a later patch is going to make use of the exact range, calculate the
> size of the guest_memfd inode and use it as the end range for invalidating
> SPTEs.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Want to look at what Sashiko has to say? Seems to be a real issue:

https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=16

If I understand correctly, the fix should simple: use
check_add_overflow() to validate the offset and size parameters in
kvm_gmem_bind()

   int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
             unsigned int fd, loff_t offset)
   {
       loff_t size = slot->npages << PAGE_SHIFT;
   +    loff_t end;
       unsigned long start, end_index;
       struct gmem_file *f;
...
   -    if (offset < 0 || !PAGE_ALIGNED(offset) ||
   -        offset + size > i_size_read(inode))
   +    if (offset < 0 || !PAGE_ALIGNED(offset) ||
   +        check_add_overflow(offset, size, &end) ||
   +        end > i_size_read(inode))
           goto err;

What do you think?

/fuad

> ---
>  virt/kvm/guest_memfd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 050a8c092b1a3..9f6eebfb68f6b 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -370,6 +370,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>         struct kvm_memory_slot *slot;
>         struct kvm *kvm = f->kvm;
>         unsigned long index;
> +       pgoff_t end;
>
>         /*
>          * Prevent concurrent attempts to *unbind* a memslot.  This is the last
> @@ -396,9 +397,10 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * Zap all SPTEs pointed at by this file.  Do not free the backing
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
> -       __kvm_gmem_invalidate_begin(f, 0, -1ul,
> +       end = i_size_read(inode) >> PAGE_SHIFT;
> +       __kvm_gmem_invalidate_begin(f, 0, end,
>                                     kvm_gmem_get_invalidate_filter(inode));
> -       __kvm_gmem_invalidate_end(f, 0, -1ul);
> +       __kvm_gmem_invalidate_end(f, 0, end);
>
>         list_del(&f->entry);
>
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
