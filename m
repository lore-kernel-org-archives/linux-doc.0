Received: from mta1.migadu.com (out-55.mta1.migadu.com [95.215.58.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5A734B1B0
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541837; cv=none; b=BgAGf+rylXe1g7TtgxCvkQwvLrWr34F9ADG3SicnSv48K3NyMk9Fz7wXMegrDug1Y5oLLEw9r/TTyAjjXa+u8IGj48gbKhbshSEoMLI05FNrIpOPCCSY/CHhQUJmX3AsGTjpLPSJBUwLeoKrdu7qprT1ynKXQn8Sk4/jiTUyv1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541837; c=relaxed/simple;
	bh=9Xb9EfUOdgvpGqMkiydwEhSmxQ/7eEZavJu7C2JawOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVNTAgG4etnj8nD6omXDHJ6sIN4B9hT2ns6Rk31Rua0Y/miF6JhAZxjDWH9KsbZbBko1jZg7vCEb6GMNIJYiTrMtNnpjmcDEH9D8h5eiR3MEmpXv/J1p8ObGt+SbdRVV2I62qu9TQZj+l53/wBTzCYKzAszJY+gm9Cv57Ve2oB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fxfSo4Ep; arc=none smtp.client-ip=95.215.58.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fxfSo4Ep"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9Xb9EfUOdgvpGqMkiydwEhSmxQ/7eEZavJu7C2JawOQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786541826; v=1; x=1787146626;
 b=fxfSo4EpYD1DaPadwQvfYozoxHsongLUncByaknHSR2ojcOJAYtnlTMML6S+rjRIoc5EoJM9
 xXa/xVp5TODP0VrfuwBzG4fGcqJyY2k9EgTGoC+/1Ezw8n1JGehZ4YrJA55bEjnAiVKCSIHWhaw
 kotv7j8A/RF5oT9NObVx5f3w=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (209.85.160.178)
	by smtp.migadu.com with ESMTPS id 9dc53820408d3a05;
	Wed, 12 Aug 2026 13:37:06 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c15a5b265so229331cf.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 06:37:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHCuQdcY/Jafk6e5vEKR2T/lK3kdjHxHomW09sk6uPO+uYtcoh90rtGinFjH7DSIHTJ1xyRLVwCPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIeQh0Nrjkkx6BofaI4NqcLGeWPdoKw99nUgZfgWixWd5t5N5O
	UvjzGxyt/XSCl6o+nUI6DjMhNYWqT9ARl/ytB6PN8mAwOvKtdSWq/QVFHprZaH1lAJC6rCagNtM
	4/aQwipHroKilrnBlcT49eI/GEx/Fp8W2VqbJfGg4
X-Received: by 2002:a05:622a:40cd:b0:52b:4ec6:52ba with SMTP id
 d75a77b69052e-52d61f23159mr20522611cf.6.1786541825229; Wed, 12 Aug 2026
 06:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com> <20260807-gmem-inplace-conversion-v10-15-2fc18ee6d3ba@google.com>
In-Reply-To: <20260807-gmem-inplace-conversion-v10-15-2fc18ee6d3ba@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 12 Aug 2026 15:36:28 +0200
X-Gmail-Original-Message-ID: <CA+EHjTxmA0U+RxULtiZtFRvBzhcbCMgj_kTO6a9fqkPvvyrh0A@mail.gmail.com>
X-Gm-Features: AUfX_myT7Ln5tM4ht32h0TuFrnmnlLxzcErRjugq3csyVB5j1YAHRpRMYVzjI2U
Message-ID: <CA+EHjTxmA0U+RxULtiZtFRvBzhcbCMgj_kTO6a9fqkPvvyrh0A@mail.gmail.com>
Subject: Re: [PATCH v10 15/41] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
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
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Aug 2026 at 23:52, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> A guest_memfd folio is safe for conversion if guest_memfd holds the last
> references on it. Any other references on the folio may indicate another
> user, and guest_memfd cannot convert it to private if there may be an
> existing host user.
>
> A folio will have extra refcounts if it is present in a per-CPU lru_add
> fbatch. guest_memfd does not actually participate in LRU, but
> freshly-allocated folios are still added to the lru_add fbatch for batch
> LRU statistics processing.
>
> This one known "usage" of the folio is handled by draining the lru_add
> fbatch. After draining, if the refcount is still elevated, then there's
> truly some other user of this page, and the page is not safe for
> conversion.
>
> If the page may be dma pinned, DMA is obviously using it and hence not safe
> for conversions. If the page is still mapped after guest_memfd tried to
> unmap it earlier in the conversion process, it is also obviously not safe
> for conversion. Exit early to avoid unnecessary draining in these 2 cases.
>
> Provide a drain status to only drain once ever while processing a batch of
> folios.
>
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  mm/swap.c              |  2 ++
>  virt/kvm/guest_memfd.c | 23 +++++++++++++++++++----
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/mm/swap.c b/mm/swap.c
> index 8e965c8ce9aa9..9f511b97ab110 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -37,6 +37,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/local_lock.h>
>  #include <linux/buffer_head.h>
> +#include <linux/kvm_types.h>
>
>  #include "internal.h"
>
> @@ -995,6 +996,7 @@ void lru_cache_drain_for_folio(const struct folio *folio,
>                         *drained = LRU_CACHE_DRAINED_ALL;
>         }
>  }
> +EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
>
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 896699afcad9d..030af0855f8b0 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -8,6 +8,7 @@
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> +#include <linux/swap.h>
>
>  #include "kvm_mm.h"
>  #include "guest_memfd.h"
> @@ -542,11 +543,26 @@ static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
>         return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
>  }
>
> +static bool __folio_safe_for_conversion(struct folio *folio,
> +                                       enum lru_cache_drained *drained)
> +{
> +       const int filemap_get_folios_refcount = 1;
> +
> +       if (folio_maybe_dma_pinned(folio) || folio_mapped(folio))
> +               return false;
> +
> +       lru_cache_drain_for_folio(folio, filemap_get_folios_refcount,
> +                                 drained);
> +
> +       return folio_ref_count(folio) ==
> +              folio_nr_pages(folio) + filemap_get_folios_refcount;
> +}
> +
>  static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>                                             size_t nr_pages, pgoff_t *err_index)
>  {
> +       enum lru_cache_drained drained = LRU_CACHE_NOT_DRAINED;
>         struct address_space *mapping = inode->i_mapping;
> -       const int filemap_get_folios_refcount = 1;
>         pgoff_t last = start + nr_pages - 1;
>         struct folio_batch fbatch;
>         bool safe = true;
> @@ -560,9 +576,8 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>                 for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>                         struct folio *folio = fbatch.folios[i];
>
> -                       if (folio_ref_count(folio) !=
> -                           folio_nr_pages(folio) + filemap_get_folios_refcount) {
> -                               safe = false;
> +                       safe = __folio_safe_for_conversion(folio, &drained);
> +                       if (!safe) {
>                                 *err_index = max(start, folio->index);
>                                 break;
>                         }
>
> --
> 2.55.0.654.g21b8a5bc05-goog
>
>
