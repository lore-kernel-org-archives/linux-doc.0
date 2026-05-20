Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2DC3783BB
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 13:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285142; cv=pass; b=VuncdZZiNRtfQYcZs0L2nXZp2oU+v458hiz+aObS729Ciknws52cAXDMhRIRooq3nALQNHdtSNI9v41aaUnmvCqneXMOdSrSDu6/WGA1QbyXFNj3Za/0oye+00e8NJRqUSDuwuj8ee73dGwrs8XSOik1iI0s2tkpMmKeiNckS4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285142; c=relaxed/simple;
	bh=w4JDDKhr2QiuCMCCR6/SASV1LBSfLF+z9c67ox8kPyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zxpnsqv5VJnST0G3EzAKWLC4FoWf91AkNWI/c9Cp8yz/z+sFvFWUKCg6ZR/l1LyaRQk/SCsA+hif9pb3zlaaFjEfizuvc1pqV/bFo9zlD1LcFRFtL31shOSn3VNkwRPTnrNswprOdVSxA/cGXipz7yer5gHk/XonuD72C0QLK5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JEyQqXV5; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JEyQqXV5"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d864c23bdso5021cf.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 06:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779285140; cv=none;
        d=google.com; s=arc-20240605;
        b=YlDpi1acHeQofq4mTiOeAOnubOtmg1kQkoGm3uBenzxzuY1pI+xvSnzsAGSDw5c7T/
         rXNSDOSXyhHmeWwnpeUrvngbk38C7bgAUlkedNqEqF2bpolS/j/Oygr7m9IbdAE1NrGM
         7gQCr+Yc/IciA4vRUO60QF+JquU9llA2v9SELMxlrNYzMxPdTahriVs5cBd7mvAjxCdg
         YUQuxRiCwvkMvE5HVtr25GV0Pq3BuXsidPMcEx6lZjDp/AeIYN3rhcmU/X8TKA3MGzfd
         LlpFQopcC2Mh0BbBTiH5VAddwB+Gj3YiXJkn0e+NTV3I7QPfW38JO19wLZh4MFYjmrY4
         3A5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Worh2JLSPSAyI17eyly2xWvvXK0uXozd+nOzIiXznLs=;
        fh=nlXKdTLSzihCY/mPMAn1jfspvUPL/gjbB88VLW7hCzs=;
        b=Sxhdv0WJJ+x0JkvWZt/H17A16vQnXhqRImRLft8SHCUFIHg62sr+ChDP8fmiMLLP3/
         hq9LPVGxT/VfmaC/i+r1XNKo+M3Dl6LYCXl2SYVC/cw4FOHnJ+8N3WIR6DkFlCoG+ZcW
         uxBvprIyh0Y4M2+O05uU30CTGy4gYXH3q1Ps/u5TUcko5xm79X4l1yu7XP/mMA1uaF+6
         uzb5G+ouD9Acb7JJIW6PqO32SLhWMX5QSW63epQJzmBU/WaGG0tZjIlT4u8af8SwWA2A
         a4Xn/HzvqMHC+Mw2WiCuU5bU1ArjoWjwieuwZLx5LTIliPXZGPxxrIOi+G4T4XwzOsoM
         gDVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779285140; x=1779889940; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Worh2JLSPSAyI17eyly2xWvvXK0uXozd+nOzIiXznLs=;
        b=JEyQqXV58y49pCE3VSj965BxBt9KtCI1q0VfE5iVBx6duPp97gEGU0eKShxEbo2W2H
         bQ2zWudb7RzDEzp2lga13vpIjXPTW+j0wUpfky6O2RIhcnUOClmG4sWraH6Uh80PDGIt
         4GTElZR3uJglGiljfsp0nRbRnMErYVxUcz0U6w1AyGeNNhRm00m+IXkOkbjnl6MBkLcR
         1Tus3wVizU2vb7P3h3IWrnRx6HXZzeqqFBkNDmhgYK2TRhZQnCe3VRGtKmNbnjzs/Me/
         IsavoI/rBhQRB6VR1VhXr6sc1aV3dDaQ8Pa0ef995DCZWznE/+UTPANBSfIBmldaSI1y
         VbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285140; x=1779889940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Worh2JLSPSAyI17eyly2xWvvXK0uXozd+nOzIiXznLs=;
        b=UZ75HMprMfBQyfJ3UYHlmdt5mGTS2hpxE85rA2RE+5z+KO6NFCU4lrZ1IPXJI5O0CM
         e8J0lPkrXP6GEdMzTivae3D/ToFYXlg6F877btdcPT3PjyampFbxdUXLWHCaqbyKhzjZ
         eN//nO+wHwSV8p65TXhqohr+JgtOJL5Darcv0Yj5XgyZuYEfXw1ek43mk/OPcsyHwSzf
         rvzpvM6hoBnfClbjmHX99UjxgG1dC9wqT/Iq74Ro5r01sDhwImpWVBAcx9uIEqjPl7Gg
         XC0x+ETYmHokD6SNDf0EnpWcHcWiEhl2+r93kqD/zsEmH/1MInu9o5pjNVnRxLhhnzTr
         rzHw==
X-Forwarded-Encrypted: i=1; AFNElJ+skedUCNm/RkALmYdaik9Rxb7bVJD7pkHYXaAhVv4E+EZPDgV5GYLKhwoAgRRKqo81eGGK+mcm8ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMflgt3SJR5XpC4QlNyLUdKiRe4yb9R9DgQZCCqDzeZdNH+kiU
	alM3midb0dzhis3pxzRFB7/f/tWFX2Je770m405BboHXRGxwtTwPreqiDj6wL3yBlaFmqUScack
	1l51SUGHAmg6F03irO4s3eZ3mpnj8w/QdAfhTIBoP
X-Gm-Gg: Acq92OG8qCc6h+tzsIox6bmWubz0PK3w/CxFRyARFIE9JL5scdX72CSgq5K5jY8BGuA
	a8EX+ByhbchP8uYzvSqlAAAR+UUqKXm6c3/C5Rca9hw1+L0SXg9laLWiMZwEliqgxTqV6ETUbuN
	PmUsxIGtWMS7yQcrIx2uh9SJgjWCEZ2GckMmkSW51GOI4Q5uDWTaIujhb5C0W5BUZEKQCUAX0W4
	HY+9WEGKV1BPng2Gz6YLyt3z4Y8XieMh2F0+tecLdNMCQ11uTga6m1bpfn5KL0GIBCqUzqawFQP
	wDG6eYFEIRNM2u3eeic=
X-Received: by 2002:a05:622a:5d4:b0:516:4197:361 with SMTP id
 d75a77b69052e-5167937f111mr19778701cf.4.1779285137735; Wed, 20 May 2026
 06:52:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-8-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-8-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 14:51:41 +0100
X-Gm-Features: AVHnY4J85RRb6CNplqSCM30M3DMf1Y3bV7iG1C3rTvm3LWaftfTfmZz57_1_-Dw
Message-ID: <CA+EHjTx+WbsKB66_0_1a3=vBkEdoeqJG9QOfZcUTuT8MYc=TtA@mail.gmail.com>
Subject: Re: [PATCH v6 08/43] KVM: guest_memfd: Only prepare folios for
 private pages
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
> All-shared guest_memfd used to be only supported for non-CoCo VMs where
> preparation doesn't apply. INIT_SHARED is about to be supported for
> non-CoCo VMs in a later patch in this series.
>
> In addition, KVM_SET_MEMORY_ATTRIBUTES2 is about to be supported in
> guest_memfd in a later patch in this series.
>
> This means that the kvm fault handler may now call kvm_gmem_get_pfn() on a
> shared folio for a CoCo VM where preparation applies.
>
> Add a check to make sure that preparation is only performed for private
> folios.
>
> Preparation will be undone on freeing (see kvm_gmem_free_folio()) and on
> conversion to shared.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  virt/kvm/guest_memfd.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 9d025f518c025..4f7c4824c3a45 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -888,6 +888,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      int *max_order)
>  {
>         pgoff_t index = kvm_gmem_get_index(slot, gfn);
> +       struct inode *inode;
>         struct folio *folio;
>         int r = 0;
>
> @@ -895,7 +896,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>         if (!file)
>                 return -EFAULT;
>
> -       filemap_invalidate_lock_shared(file_inode(file)->i_mapping);
> +       inode = file_inode(file);
> +       filemap_invalidate_lock_shared(inode->i_mapping);
>
>         folio = __kvm_gmem_get_pfn(file, slot, index, pfn, max_order);
>         if (IS_ERR(folio)) {
> @@ -908,7 +910,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                 folio_mark_uptodate(folio);
>         }
>
> -       r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
> +       if (kvm_gmem_is_private_mem(inode, index))
> +               r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>
>         folio_unlock(folio);
>
> @@ -918,7 +921,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                 folio_put(folio);
>
>  out:
> -       filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
> +       filemap_invalidate_unlock_shared(inode->i_mapping);
>         return r;
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
