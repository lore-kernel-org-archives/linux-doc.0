Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF66C36F90C
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863843; cv=pass; b=ikOgHyzzchzy3RJG+93VRb70gy9Hg+EBNCjrbyXZIgZb76TPDM0Z1Wsiij/tb7wxN0gSvHIhK/zACBdo4TlxITR3IZjhLhA6BlA8RwvDBdzjaC8suOfDtRmZRv5tfHyep38LjpRzwvxUUeKDq0WbUbt5m5o9M7IUOZ0lVXJS5Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863843; c=relaxed/simple;
	bh=BV+WJdPUZX7SWJL6VMcYgh6IoDynAjqVpnJR9RDV5JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvO6RcISa8AuTl7qWKZwNz+inga9z7qSqCyTIVDDnaRDfBtwPjoSlwW4vm4nKDMJ6AhaFbk9nitjvrnNZpaR3bYIULa+TEPAhcQvyrmFxYVG37wAvLVXy70u1GC0eqhsJKalyRn6N0x7Yw8ekEjkTTKdp+FUk1xEonOwxU2J6tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wRylDAur; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wRylDAur"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51765531803so224271cf.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 03:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781863838; cv=none;
        d=google.com; s=arc-20260327;
        b=NmpMQ5kg02ssiIKDJxliCudYK0uDcw5ZuMhiAL6pRMibzfwyBl093j1OG31kBwba+8
         9nDcLwaWtD04FoaUlenS4tSCAVFaUtDjb0Pfl50Zk3OYYA5wQxZHKXy11tN1XklZFq3S
         zz5dy72cQlDB+4lcFsYlYW0fjjZjr+E7i2FF406TMJDZzXqaaAYyIcCOiQE/7O2VWO3u
         nc+OCW0Dh4wasoiM7PQb5XmF41RAjAJ69ZcmaZlCPkiBIVjL1l3yboaHBwz2yiQJYnHm
         sg3d20a5FdBHKmpv/GBlN34sJCKu6FfOd77KvKWbv6rkrT1Ij+OspH8MYFIFUfWysFHe
         1yQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        fh=JBY0BDgjbQYlcGdoa2cdp9fc5DUcNJIldAt37T7is50=;
        b=f6cizLzdJziXS25tSjq0QGC7VRVNvCOPTPw/krV0q9EeM4ZbZ0o/hZ0RnFR78VGirR
         3yfvB3fMCJl/Lw4tUX1TbJQF6Mx3koRCqVNYdBUOb7rXWIOyFU/R4DvL7G7HpLDk1Ai6
         DTcu9pr6BiGSWgFYjhzilaRXIKYRPxB3kuxqukrbbJFiw9+ylFbybOtA3fLxuet/9LkG
         K/7TKNVztLWkwFlxGqrRwn7Fd8Bp932qxoKAuf0wITQWIPAiao2ho8vPv8BuQZFaqL0Q
         rJYYYDKe9x//NbDzvUxSKGrZqFzHsteHfgOr+WJQN9v4YHHGg9bPWLMf9Y7KnpqiumdK
         ywmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781863838; x=1782468638; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        b=wRylDAur3F7Z4m64R5MYoCOVFjm9HnYTxfqBffHxRCg3Clh0abeRnjnAYrtK+d+4Hw
         nwrChDXTmIpU42pvkzmf8KW4Ka/z1RBN8GhzqkN4+WJNlYPyhgGdoDLA2VB1bpKwSn/1
         vVhVp/5gqUVbWGHtzJSbqXh5J4PePTiZKjRHeNasWnkSZqP4N94sUXdqlmIMB4ScdwU+
         72sx6qD8qbKmWxKOW+TJPOrTo9rGDwuWv48MT+zKHYfMG8AGXXy0JZB3lUPanfYO4YbX
         26nX7pn5VEZhLQRAT3YzCu9sOaMk6kFYrWyPHNjT4/06BQndanoTPoeuCBfwCnN249Qg
         HgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863838; x=1782468638;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        b=kcW5m8nvG2UmsB4seIsDIJin6Xl0orQ5HowpOF5pKoPoJBAUGRAbRpFzIxrCxOQPfN
         d0o410kE4L10LyRHq90zb8+a9a7Z8JHwBmuRdPAwAFKhjn3scMQwU1efTG2Asb+asUSG
         VHORSRp68aMdX5SB5x0Bj+LQlJ99+BYGotCWo0FB0PhNdlUXl0ip/FcUE206UQlSWEQW
         rqLoq5vQY+0Umy9/nQ/t3RJH0RXu6ZcQHf9E+DdWXKefq+UHH0aRm/edljSyv28SzSie
         IwxX29y2WoCuWo5J/Z3DSlbOw5D8pk7dPWbEwRfH0keD//4S/3M+d29swFm0qzAiWE7W
         EV2w==
X-Forwarded-Encrypted: i=1; AFNElJ+2JNxBNXHAPeM+XUixHQ9kPz6GPQAAA1oxQFiktsmBXiK+xREdCydbpvFd0H79DWQadqa4jNYq97Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC2mVnbJiqmzPRDmNVKAGaMF6RVLc199ztfoRFF/ce/V6go/QO
	TAEM1PFoGiizfgt4cXvsG7rCiPP1s4bCuxda6Ma7y1HxP0WX0fzq2G3rmCKiPi0lmvPHnqwYYBN
	gr69pf5SlayoJV3wTW67AftFcacNLQQeeudztvhZ0
X-Gm-Gg: AfdE7cksNvxMdw9MTMJ/WSWw6SdARo81AjaYLSUfWXVJfk8W3rVJ/CswEV3uad2b7KD
	F5icj8bxKyPN0u5k+Nt15SczlyWRgemGSFZZi8GDx4WtlW9aGHaPfUZLJ9gCLje8fUtVb+sO6aF
	DddZUe0PzNQ/WepoArCcgirvPqfu4M3l1OaoH7FGXMrv7C6paAo0M4SAFVroXM6EPHWJd87WWVW
	YWPCdQfXxLE4Y4vcbWDuWpFMJLvUb/gpXYPTK3lpsl+WsJWYQqZItYjY081legfaUgL3HWDdg==
X-Received: by 2002:a05:622a:353:b0:517:99ea:ab79 with SMTP id
 d75a77b69052e-519e8e7516bmr5933751cf.25.1781863836675; Fri, 19 Jun 2026
 03:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-15-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-15-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:09:59 +0100
X-Gm-Features: AVVi8Ce16E31U-w4-XubBsflwMOtK_nv4nwaxzfJhxldigbujwW2ZBTzRORImb0
Message-ID: <CA+EHjTx+3U++dnhGEkwh2SO82xMugAvvJ9ee1O__sxZCKL_X5A@mail.gmail.com>
Subject: Re: [PATCH v8 15/46] KVM: guest_memfd: Call arch invalidate hooks on conversion
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When memory in guest_memfd is converted from private to shared, the
> platform-specific state associated with the guest-private pages must be
> invalidated or cleaned up.
>
> Iterate over the folios in the affected range and call the
> kvm_arch_gmem_invalidate() hook for each PFN range. This allows
> architectures to perform necessary teardown, such as updating hardware
> metadata or encryption states, before the pages are transitioned to the
> shared state.
>
> Invoke this helper after indicating to KVM's mmu code that an invalidation
> is in progress to stop in-flight page faults from succeeding.
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Coming back to this after working through the arm64/pKVM side. My
Reviewed-by here is from the previous round and the patch hasn't
changed, but I missed an implication for arm64.

kvm_arch_gmem_invalidate() is now called from two paths with the same
(start, end) signature: folio teardown (kvm_gmem_free_folio) and
private->shared conversion (here). For SNP/TDX that's fine, conversion is
destructive anyway. For pKVM the two need opposite content semantics:
conversion must preserve the page in place (same physical page, the point
of in-place conversion without encryption), while teardown must scrub it
before returning it to the host.

The hook gets only a pfn range with no indication of which caller it's
serving, so arm64 can't give the two paths the behaviour they need. It
would help to signal intent on the conversion path: a reason/flag, a
separate hook, or not routing non-destructive conversion through the
teardown hook.

arm64 isn't here yet, so this isn't urgent, but the hook is gaining a
second caller now, and it's cheaper to leave room for the distinction
than to change a generic contract other arches depend on later.

Cheers,
/fuad


> ---
>  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 433f79047b9d1..3c94442bc8131 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -607,6 +607,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         return safe;
>  }
>
> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
> +{
> +       struct folio_batch fbatch;
> +       pgoff_t next = start;
> +       int i;
> +
> +       folio_batch_init(&fbatch);
> +       while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> +                       struct folio *folio = fbatch.folios[i];
> +                       pgoff_t start_index, end_index;
> +                       kvm_pfn_t start_pfn, end_pfn;
> +
> +                       start_index = max(start, folio->index);
> +                       end_index = min(end, folio_next_index(folio));
> +                       /*
> +                        * end_index is either in folio or points to
> +                        * the first page of the next folio. Hence,
> +                        * all pages in range [start_index, end_index)
> +                        * are contiguous.
> +                        */
> +                       start_pfn = folio_file_pfn(folio, start_index);
> +                       end_pfn = start_pfn + end_index - start_index;
> +
> +                       kvm_arch_gmem_invalidate(start_pfn, end_pfn);
> +               }
> +
> +               folio_batch_release(&fbatch);
> +               cond_resched();
> +       }
> +}
> +#else
> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
> +#endif
> +
>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>                                      size_t nr_pages, uint64_t attrs,
>                                      pgoff_t *err_index)
> @@ -647,7 +683,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>          */
>
>         kvm_gmem_invalidate_start(inode, start, end);
> +
> +       if (!to_private)
> +               kvm_gmem_invalidate(inode, start, end);
> +
>         mas_store_prealloc(&mas, xa_mk_value(attrs));
> +
>         kvm_gmem_invalidate_end(inode, start, end);
>  out:
>         filemap_invalidate_unlock(mapping);
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
