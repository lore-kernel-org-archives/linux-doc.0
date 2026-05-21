Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA237F755
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347648; cv=pass; b=p59616w8T+T6GJP58Mael7xai22m03r7h+86O630QKiGI7553ViY6e/+/89PJOQa4ZmPxrFZn9KFNqkfM+hxxQIz/cez/jSJnVeeFs1md4YC+/RmXMpz560LC+twtnTlQHecrpd0BMEuQ4ITZqsXZvCDAwPUus7YuLsGfBhRZAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347648; c=relaxed/simple;
	bh=FwszKxRTkU5t0/z62X07EaM8UOUdI3Szs5D9p5DC8sA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHVIRzEwJN6CUVey6GVoeUlpvirk3VzyjQvrriR2C8K22TyyUFR6OG7hsemX5lVyMIJh2ZndZbWvvb9FlLqqlUzTFFF29SmCZ9AR9DZw+sqi926lXN4wIlLDsoXf5h3RaHMOiqL0qlgMJxqhrWBY1FaML/k17PGhbPrbnBtYSwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V5nnUbQG; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V5nnUbQG"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d6b393d60so5241cf.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 00:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779347646; cv=none;
        d=google.com; s=arc-20240605;
        b=e7tIkb3p18SE7Zwo56nPTZwy2S+p2ReSInBvOL/Qiep0Zvy67XRgoxCpqZy+pmbWv9
         Ed7InsH7B0xXzwK5xdLPHitM51WY877GI0LkT/8ZpgTKVabWL8TvMFkbcc2k0Yx7HqCW
         wVbTwikNJL4Aja8Rcyg0GCh93l6S1YH70s9CtZzqjb0w/8kne5vkc+H0+inkpxTZg1s4
         SOxCH++Vc8DRMzcTJogEbWM8vLcXrhaysWTsd83X+eit9+qEyz4ICGNrfJ+Agv7wV1t8
         rxWjKL5RwrG1XQ4Eq7WCWP+HQecn5QAdZ3uTCAYrjsYmlC7GuBjrzMlcrImSG3GuguUC
         A/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        fh=DTbg0N7MUyPw3KRkB+Ep+EI5RHrtc59BoPhfwIL5SjE=;
        b=S9PIuXE5QIQVU2+aIgURf1CrxkRlWj08eDFIR+BbEyLXYtSJSHCABVwQWkj9wySUOU
         qFlstK+80B7pfKwSMPIOBOS7A9TPzrFlh7K92SiRnhbbY4BNWoICvdlOomx93/ccv6tH
         4nK+3YELBS5enULR/JZZqW4T9HCGqxXUkLZM9GJNdcA6GelCOP1goQrvCYTBLWZcvEeB
         YQdImcL0UGH/2gF661fnI5dP3vOlAD9u05urCnQiyWupcBhONfRQ/ltJLK9I1E/72+bG
         jy+2PxwBSRZS/dbnG9JGu6SwsHd4tAMEv41bGWNRlSlzk8PrrrWezCo/6QJvaXhzaZYQ
         FPYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779347646; x=1779952446; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        b=V5nnUbQG/ujtVnB4x5oOn0VsrEazM25MSRq+D2fGX7H+mc4Xbw25rTx2FVTeapQP/k
         XEffiZssRM/2SWMVHHvTxZq167MBKWpda0ZaMvZtfbbbK/UCKbjNwb0e9jBaukozpXb0
         31GTFPIvPWebIDdzccwk/qevuYJhxvSOlev/0f49lm3NPqc8HAPlyBha41I5Eb7oWCqg
         nE9dLWXxtGiGY6kSZ8ABtCLDecW7a0uHWrEvGvc8yimscXYCB6k426NxHjb32v95F32C
         yEORNrcXckebk8rxncLd5WfdLNNNPovA1j/g+8zRqQVkd8e8zYofNgcFtstLTzBKPI/k
         Zi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347646; x=1779952446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNOn4o9NVeTi7pLeKizYhzgihd3OKpoLohhH00DuQC4=;
        b=GEvY1ZxDtqaQ9o2eT/k4Gjla7Cn+FzqjUQz7pekKt4ARAsJyfJQRGEmuTdWPi4bTzS
         Aywys9P+GKUBrJcTF9GOYnFg2CmpYfQnanurSAKOBUUZvP4go8+DhDQLd/Uq0osGgvDe
         eX18mDAJQ7EO0euarTZI29fB1YWtWJniTpgz1aw/izjQJmeNlmyyTTdOY9h1NvLS/zxD
         8eRxFzCd68ulurK29iSjk9vGO+YNB2+6oBrPmv0vvEb3XOXKA3S67GKbXsep9UZms4/F
         oEztl8keFJOUzCKuCmRcE34/XHSoIFto/NXwmvg9k/zvxUuGDLgU20aafUfsrty1+q+X
         2SCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9O8PcbemkRYgrVQYLmct6cLM/Mom2gKyjoHIXPyPXvOHrItTkH6HjX7Z83275QEBIw/UfvUVfyGJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEd8OLTh4iJb1OieJ1BPSlTaUP3dMX3yeVwAoyR2/SJakD57W
	qWa+13hKQ2r6FKjJ7PKRQsqIynk3YaJXPxwZWaKNx818IitOuk4XOuMtXkSuKhuD7z/xVXJwWBv
	WaP87COvcUo4/3vvmducT1hcCChBcPiEua4eKHDty
X-Gm-Gg: Acq92OFK4gECTtKfbOKfKKrpqx5fYe4FeRKrv7qUo672GPKHYOpTOr4WYVKSABS6Mwn
	OILOReNdkq+zOBYyd9Q+heIrcN10PgzfXLqrlXfDN3+KeDsIwIrKY6ML891ny08XTpKEXO/bMch
	s5gRdeKxnUCaUFULH5sYvto8e6+jtaAvxKlcda/QcpF5+O06N2QV52wLMamKSACtvj6N+lnOxvP
	dPwU/BkdH0RtSv6KTR7cJ3lRWnDMe9QTG7eOOzywWyYwuvydRAyJP944zxQDqY6ZYUjkFId0ftZ
	TT9UK8GAY1WwK25UWb5z0B/Xrf6gDA==
X-Received: by 2002:a05:622a:9d8:20b0:516:4f62:85ea with SMTP id
 d75a77b69052e-516c553b726mr5238111cf.21.1779347645271; Thu, 21 May 2026
 00:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-15-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-15-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:13:28 +0100
X-Gm-Features: AVHnY4I5mlImmNgj6VU9Np6tF4MeIY8QXPe0q5_43DkzSppchE88oaKE6aKRKpA
Message-ID: <CA+EHjTyZx88qAjKc=W1GOTMLdDFpTjuJkAPJ3W6Snnyn3ta8tg@mail.gmail.com>
Subject: Re: [PATCH v6 15/43] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
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

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When checking if a guest_memfd folio is safe for conversion, its refcount
> is examined. A folio may be present in a per-CPU lru_add fbatch, which
> temporarily increases its refcount. This can lead to a false positive,
> incorrectly indicating that the folio is in use and preventing the
> conversion, even if it is otherwise safe. The conversion process might not
> be on the same CPU that holds the folio in its fbatch, making a simple
> per-CPU check insufficient.
>
> To address this, drain all CPUs' lru_add fbatches if an unexpectedly high
> refcount is encountered during the safety check. This is performed at most
> once per conversion request. Draining only if the folio in question may be
> lru cached.
>
> guest_memfd folios are unevictable, so they can only reside in the lru_add
> fbatch. If the folio's refcount is still unsafe after draining, then the
> conversion is truly deemed unsafe.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Not an area I've worked with that much, but it seems right to me:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  mm/swap.c              |  2 ++
>  virt/kvm/guest_memfd.c | 18 ++++++++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/mm/swap.c b/mm/swap.c
> index 5cc44f0de9877..3134d9d3d7c30 100644
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
> @@ -904,6 +905,7 @@ void lru_add_drain_all(void)
>         lru_add_drain();
>  }
>  #endif /* CONFIG_SMP */
> +EXPORT_SYMBOL_FOR_KVM(lru_add_drain_all);
>
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 034b72b4947fb..050a8c092b1a3 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -8,6 +8,7 @@
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> +#include <linux/swap.h>
>
>  #include "kvm_mm.h"
>
> @@ -596,18 +597,27 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         const int filemap_get_folios_refcount = 1;
>         pgoff_t last = start + nr_pages - 1;
>         struct folio_batch fbatch;
> +       bool lru_drained = false;
>         bool safe = true;
>         int i;
>
>         folio_batch_init(&fbatch);
>         while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {
>
> -               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> +               for (i = 0; i < folio_batch_count(&fbatch);) {
>                         struct folio *folio = fbatch.folios[i];
>
> -                       if (folio_ref_count(folio) !=
> -                           folio_nr_pages(folio) + filemap_get_folios_refcount) {
> -                               safe = false;
> +                       safe = (folio_ref_count(folio) ==
> +                               folio_nr_pages(folio) +
> +                               filemap_get_folios_refcount);
> +
> +                       if (safe) {
> +                               ++i;
> +                       } else if (folio_may_be_lru_cached(folio) &&
> +                                  !lru_drained) {
> +                               lru_add_drain_all();
> +                               lru_drained = true;
> +                       } else {
>                                 *err_index = folio->index;
>                                 break;
>                         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
