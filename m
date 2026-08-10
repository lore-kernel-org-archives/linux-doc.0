Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D99D438019
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 21:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397349; cv=pass; b=X3hj2Pxk7AMVECOGxk7OsvBw340wlllbikrqYQyZ+OhwuCNBMwEslEomLpGz6T1Uj/6iOOzCpcQQKbqN2vDYJxYmwU9ftbh3k1nk0m2Q3bS81FoUDd760KqcIj2oKKdUSd/bCS2hR9YG5jAsFGvApiJ2qwerZKd2vgwCNIyPGXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397349; c=relaxed/simple;
	bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIU6BXFvQb/J6S+DZyWuAWcaEOZe6U7XFu6vMDyS3YCs4wXZBMRCiaiXkrE8LcLCfsLl5lK1inWH5oUOuQGiMDeA1M4CKksJnsKIZgX8DSFgj/fwfoatSx8fGqPpGJweTYaw5vGVgzCSTI9hljft83ZL250dwdDa1TzRpWsf1NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sc84Gh/R; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sc84Gh/R"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso131468a12.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 14:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786397348; cv=none;
        d=google.com; s=arc-20260327;
        b=hKjf0HAwm2G6svcI/T0ij88+MyWSRjTzkhSg87BUsYFDPOCqebi9Iejb9JLmlHh4JV
         RlbpXgNsxPHL2Tj1ldi25oJua7P6qEgOimqZQzjLX4AI/EHTFe8E0jASqelOT96W8PFv
         WMnkvdpD4ZMqb/qUZYYcwl7EopqcrGDZiTMtRlL1+78PSDpq2Ov98MjTvA4l2P58r6pK
         mJsLMgjqH8Dw4j15Z+Dy3bneRHzLXRiPdZhx39xCXLOGfdRroxFpK7vZ+vlmTGvY3Qee
         FwJUZL7CWTt/XHhX7C/hhgP7apxKAk402rPt4EA0F1TH/XcffQUE6JnLDab2Z0bFuMCA
         v8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        fh=inlvg1Zci5JVwxcI8L6pIb71M/TLpduf23+qcmRYJvE=;
        b=rDuzBR4B0nFYHtiKnxIQaw2i6aMqF73WUqObXGqJevVcNTNe5jHAkFjqumN7OG7Ao4
         pisOL2RiELmDHxIV8Ay6QpYJXxHO59ivlDAG5FFU+F6cqzReYhSxVbdy/E2moBzZ1DJK
         7EvcxNMKf8/0lhcTq8PU1sF+pclKsP5wPAZ/l/doc9EeyDAGu2EEh7LIBJZ1u28lrdCl
         vJf8OADLGLQGBSRW6+sFU8vDOQh1Q4hBQNZ4lVIIYB4NqB1gsIlVGZB/s9e5hvbFWAx4
         sS003u4k/SfClN6U9VxF7gH6mqT74HS4wZiz35BK/hNRpehbdxmZ2pjjr8wpRmF9+Mve
         a98A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786397348; x=1787002148; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        b=sc84Gh/RC1fJT7FD4YKcWetEE7zL2nWKMj/1RSzjh/2nFq5aLkn/aYPRwl3ChtRsfk
         63ATih+/9geGVWmXhhQ+VEW8HK7suiKvASQfQoPC6JNmfrHvthl5vVxBr/HGNDwHzPAI
         VOWDGUeT6zemAzczPO8rRe2JltFMRTdBi1vluKQkS/cYOZfhEmbtsvSv+r5JzCk2E3RF
         Y0qS1GZZ5Wc1jhctkFQk+rjb2TTdPEZZCBneO3xv3rffcilua5vGRNfI1F9gPhpOgUJQ
         Gvf5du4fbcIrY7Tc+sByKjOs7hCsGOi09VBnQGOJccJjpbUCK2bk4SVwLf25NgGaLslQ
         lc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397348; x=1787002148;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        b=XXab6uC1QBEzKWI8kz6cz0pWA89BTZ/wjEMOW+03hR7I9WgSB4UxA9TlNHoTD+d/Eu
         WqEGTjmok64T+yfPdfTFm146o1v1ItSYccQbMVN8bKtOOMsdMI97x1gYgBSDJdlObNkE
         vodq2CeFrGN1PbMliRexbVNA3Nk80KnCwk+A8kEd6uPYgq8+/zf5SMzfBdTqpOhSiWeb
         Oujh5pVfXty8fokeF8HC+Tk4XNwnSALt7tfgOyCFcktyI4LBAQwoSGwYZ4mzuv1LOiFl
         o7sTLNvxgbOmGvlE/d8pFi3esgkvEtSZeUJZ9y51K35hb8ifXxizM0tUaj+LvJ/wQqJa
         jDEg==
X-Forwarded-Encrypted: i=1; AHgh+RpGBRuwmR4F3QULujgje4YDO+B3jIKmwjFfzvao/oL3u2KhbHby16YMO5J6kFpLfW8PDJTwV8CZzCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3VBXEXOCZsb56m13sE8ROSet2DZ0EOEZ2gl+B9fF3S5jHuhz1
	QAgmzqP3bOL5EPfkG5Nx8auYXEkGGnYysPyqZIZHotnEDjlSZJAJBOKLpYUnlRwAZ5Wgi1L00Zn
	xAjZFQk2KXS7j6KdcUqptAoO8PlgWIhpMBKBYEgq7
X-Gm-Gg: AR+sD12u1G1N+zMWQjkanUhojaNtNNoZwnznlWrysVf3/qhOJZaltN+/FqOHqvDyNQ7
	Oiig4ouAg9wifdcUxt/m2yfLgUaoMjzb6ZAlE9XFjfPrhshyhZXpu0uER0Aib9uTV5g7qvBST/Z
	RA/lglLGHYT3is0iANwEUWTsvDu3NkGN9XUroKXelKtvCVC2mgq3tTA0mKAhs4n8+n6O8nwclek
	i4iiP1K9JozsP4ETVJc8lfJgPW0XvRCvUfFP0RLOB5PlHLX+oiUuUIweZ1i9/n1ybMEsbBksEs/
	GfF6U+Mxg6O/lodfwZP6c3tQ/YJwWyOZMNaGiI8vT9erj0iAA5ho9k823k3TW6N4l+7stJKs2HL
	H6QYNL7tpdWQpkt7YXCikUokFiLbSY5UwbNY=
X-Received: by 2002:a05:6a20:4321:b0:3c3:b57b:6291 with SMTP id
 adf61e73a8af0-3cb85e6689fmr49405061637.18.1786397346906; Mon, 10 Aug 2026
 14:29:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:29:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:29:05 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aa545680-2fee-468c-ba34-cc9beb16f4cf@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-15-2fc18ee6d3ba@google.com> <aa545680-2fee-468c-ba34-cc9beb16f4cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 14:29:05 -0700
X-Gm-Features: AUfX_mxwV4sMMEn8xD5iLtETNHGAZsCJNscksNcNQT60_O-j0WNrenHXqsrVJ0k
Message-ID: <CAEvNRgFSdddvuT8ZJUPOC9BCAtBgx6Vk=UbbPZ0nTAz8M52dSQ@mail.gmail.com>
Subject: Re: [PATCH v10 15/41] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> A guest_memfd folio is safe for conversion if guest_memfd holds the last
>> references on it. Any other references on the folio may indicate another
>> user, and guest_memfd cannot convert it to private if there may be an
>> existing host user.
>>
>> A folio will have extra refcounts if it is present in a per-CPU lru_add
>> fbatch. guest_memfd does not actually participate in LRU, but
>> freshly-allocated folios are still added to the lru_add fbatch for batch
>> LRU statistics processing.
>
> As discussed, what would happen if we mlocked gmem folios? In that case, they
> could also have been added to the mlock cache (which we treat like an LRU cache).
>
> But that's just a comment regarding the text here.
>
> [...]
>

To make sure I'll get the wording right, let me know what you think of
this (will replace the entire commit message for v11):

 A guest_memfd folio is safe for conversion if guest_memfd holds the last
 references on it. Any other references on the folio may indicate another
 user, and guest_memfd cannot convert it to private if there may be an
 existing host user.

 A folio will have extra refcounts if it is present in a per-CPU lru_add
 fbatch. guest_memfd does not actually participate in LRU, but
 freshly-allocated folios are still added to the lru_add fbatch for batch
 LRU statistics processing.

 A folio may also have extra refcounts if it is on the mlock fbatch.

 These two known "usages" of the folio are handled calling
 lru_cache_drain_for_folio, which drains both the lru_add and mlock
 fbatches. After draining, if the refcount is still elevated, then
 there's truly some other user of this page, and the page is not safe
 for conversion.

 If the page may be dma pinned, DMA is obviously using it and hence not safe
 for conversions. If the page is still mapped after guest_memfd tried to
 unmap it earlier in the conversion process, it is also obviously not safe
 for conversion. Exit early to avoid unnecessary draining in these 2 cases.

 Provide a drain status to only drain once ever while processing a batch of
 folios.


> --
> Cheers,
>
> David
