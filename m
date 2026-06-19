Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8830E37419B
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866329; cv=pass; b=ijQnSLKzS/DAM12K83nL6CAV6PQCnPQqO53BQonqqjHBflxt+f28omXMzsMQJy4SAaAudeKzn8DXIRRrRzn3MQG58ByQF71JsVCXsJ7V6S+eUpuGf76ILzGnorjkFWIU6v7G+HbGVYS4lKdZrkjZrUiq5wOq0t8NMFAjd/0Wqgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866329; c=relaxed/simple;
	bh=FV+HhQxDLV3ClDVmAYwBBibFkDhfDGLaaVmYDJKEf4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4CWOBisyXfLqQf86KvTemYuPi/DFHKw5aYq+mGjEQrOlAEOs1NHfEXG9JK30a6euYhhqRpOOQ0EDqbkoXhWmv5+55mS3LdXEbt45NbeClZgqRfPkYut9xBuLGym65I2oYL1h82VfkQ6SSDyLj66pE4GU3A+PNxGeC7ctDJEL3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e/flVJqm; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e/flVJqm"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5177d1ff061so146521cf.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 03:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866327; cv=none;
        d=google.com; s=arc-20260327;
        b=PrsqNOx06DQAbferIbWyjvuJwcw6PJXK3XQKO22Vt9sf6KGHqyb7TkXyO5lJItg2AB
         XxArgOAPaHhXzzgPcd16+6flkkormYBqADmjyO3NJdV0QvDlqe/N8Wc3d60/ilS7Ic7K
         rH7sSJqBaqr2hpmg1BpspYh+RXQiFLawnGm0yXd6Qec+NKB3OlRszYPj8EI1ddxHNFJw
         Ofn+Nj8fcvIx9v9h89aGGeHDwPYE0p0rpaS5FaT4cPkvjX65GiJkKAdH6QyjdDIka4EH
         RNDJJmUP0vI1j/n0gLRQGEqnUyo2f+vnJdYR5rPtS93oE78z0lcsHhDxrOlwSq2B0cDR
         c/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        fh=nnLWNy+/j7X9093mg6AUWA2umK/OwYEeEvSktBxGbco=;
        b=d1wtQrFgo0lbRhX7lurt7OpMS/+d8Fs5dulVw+WjwpJbcba5Md+M4Z6U99N5kcb9Q+
         PuxJWY5/ooEMNnZcEzy4vWPnYXwxNfByrAw68UM8nLcmN6/+Zng1TN34bCj73Z8bcoqs
         Gdmhw3ZVq8Iy7GhPEiRnR+EvBi5kbHXyWBAyKp6ZmODt8dsHUorGdI+Lhf+j4fCrnskU
         q7LJtt/ldDJMIjHNAGbwNcxhltxTwCwI4WqAZ/A0gcZEbPmCrsrbiFm+SDsXPO0imcUz
         jhYlBd7M9qLsyHRp5EubKq+y6eptQ2xq/mJ3y8KVN6S0J9EIrBcaJQmpd6jXt8MQkPLu
         kAsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781866327; x=1782471127; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        b=e/flVJqmGPutL2J62kpQyfrqZj/S5ZnHKtlsC7HcAsS3CXMPwVQuqgs6EO86Al65Uy
         FmaZpmOvgKWy6ZBmDuARHeCcX5Lx2PtiMi89RFIHqZ0soQFxGH0jNeUyL+I3CJJWocrC
         A0BB7GoyvslRf65Rurn26dVQS2560pPol7HTovCAvlUvK2F05AKsA3bmdqXWqsWg4fWi
         ME+f8ZZwXY6lECXddc92I6S+wMylWv2MsjpsoSxQv4hfv4hAwA2pnxte9KEuaULV/+TU
         WiJKTeL2v45PsELmjDDSaB7roX0OziVablI1hymfDNVkJEKAbjGzbl2P9mbv0MnG/G01
         shfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866327; x=1782471127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qqrLJidqwZhWczfBA7HD/HFgW4vaG9cXUmJMg4P1TGM=;
        b=Echh2ZZphM+VU0uTOuPVZlaOWcKd7x7A/UAVRddtZyMgcQXq8qmC7mzLE0t4uqVZnM
         FSKWgyl/sG/0b/FNXfYhQRpCH7jur12wjf9F7uHIbpphi7mhhfzdSsjn+u8k/VVjC7Eb
         BPLFlLZ6DlaKgaIfekYygIIe2GICiZmRf4FxTbO2MMkjBODcADTlzKA3RHlhpNTofEk7
         VDMl90CpJUy6/EJwEzWgDbTdcsj9J2YA+xaxdVyfZ0Zs3DjBMhW6j89we8e2D9v4Msfz
         juWFYcoJXMRrZUbqCXPvfiX0xGxno/3Tp8YUmQ7ORSDjk30Dr20Inm1tijty41Xjc3m4
         gSuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cu13JZtQiM42hErJDSpZXgVoYA/ykbiJ0JAdipZKx9B0ZI3YNvh3SF4qsFVgY/x5zKzaHHdyIWeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxdja46ymdNPMynsWEigCIlkgg7xppKA/Nvnjm4Nw/qBAxPTl3
	TBwkrfLV7gvRGJOV0uE1B286rNaq9pzqA04v6+v7S5sH9AY00Z/3Hl6WgiYljYkmavnnLXqDVAU
	gsgVmpgD6kYYc7+TuW47GpHOITtXcPzj/lsktMxM6
X-Gm-Gg: AfdE7ckHWAxBZULmgZhb08iJW+i7kK4Z40krkf8hukPpaQEWhwQ1kjOpSdHv/7G7U1R
	9q24eYSFttP1kMNR9NMW8HJPOnGqSJzNi4LdrCWmSHlU9D9dKKQzYlfDtjIH9BljYQwIcZp3qo+
	MwjHQnNnD/XEz6OnlEIhhwl2pFx+gKIIp+XtU75evnNGCMuOatQtYofuIy0lF/v0BdU8VCTdNSK
	RDIgqMhA0lgBrFmGw2sf1JWEqLcWNHcI+C1g9ipLnSAjB85YL1/ro59dDTyNbeUyKFnVB9Igg==
X-Received: by 2002:ac8:5e0d:0:b0:50f:be7b:923a with SMTP id
 d75a77b69052e-519e890f9bfmr5827961cf.9.1781866326641; Fri, 19 Jun 2026
 03:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:51:29 +0100
X-Gm-Features: AVVi8Cf7maLTmO8Ms_Jrooo0n7Lq-o--etDJs7TRVCXqEuhsxAt-xpYkzSdEOcg
Message-ID: <CA+EHjTxOYWNeZ=2Atxn0iGQTOskR+Y3uiujWEOOfGLGcWadoUw@mail.gmail.com>
Subject: Re: [PATCH v8 21/46] KVM: guest_memfd: Zero page while getting pfn
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
> Move the folio initialization logic from kvm_gmem_get_pfn() into
> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
> kvm_gmem_populate().
>
> With in-place conversion, the existing data in a guest_memfd page can be
> populated into guest memory through platform-specific ioctls.
>
> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
> might contain uninitialized host memory, which would leak to the guest if
> the populate completes.
>
> guest_memfd pages are zeroed at most once in the page's entire lifetime
> with guest_memfd, and that is tracked using the uptodate flag.
>
> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
> can get a page, write to the page and then set page uptodate without
> zeroing.
>
> This aligns with the concept of zeroing before first use - the other place
> where zeroing happens is in kvm_gmem_fault_user_mapping().
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 90bc1a26512b6..86c9f5b0863cb 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1137,6 +1137,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>                 return ERR_PTR(-EHWPOISON);
>         }
>
> +       if (!folio_test_uptodate(folio)) {
> +               clear_highpage(folio_page(folio, 0));
> +               folio_mark_uptodate(folio);
> +       }
> +
>         *pfn = folio_file_pfn(folio, index);
>         if (max_order)
>                 *max_order = 0;
> @@ -1166,11 +1171,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                 goto out;
>         }
>
> -       if (!folio_test_uptodate(folio)) {
> -               clear_highpage(folio_page(folio, 0));
> -               folio_mark_uptodate(folio);
> -       }
> -
>         if (kvm_gmem_is_private_mem(inode, index))
>                 r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
