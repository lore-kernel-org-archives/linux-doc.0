Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85651352026
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967517; cv=pass; b=B5JXfSpWgNAF+RNt4nOVDtIdc0keFJYmB6kglGjebpsZdTZdudG7PNUXUjHo4DLodQ2X/Rsa4KjanplLoSwlH65BIV3xxw6Vc6QpzS97kQkvaaHu40KVTCucbE2qIYeBQjb/WCSn3dLbOLvYW4vr3eI8dgdXcioQGuDiAHmifnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967517; c=relaxed/simple;
	bh=uTvLvNOiD2VaPyg22uQpYQwhoB6nWQlo6kn+/rYg9tw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnbPGLCPtF2Er4SnKtCh54X/EkjDBjzCJSp2OdKmIwmqrGwKpzZCKQNGC9ptouZC4PCRMxRO0N2pnr0y4mGItYUN/4wCaaSm2vQfXglhFe9Y0uslYzcTg3RU+lqMwyMKBJ/aZV5eimhaFMpqb5jYEMntxUgSzedc627Mxq88jOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U2y3P8Xj; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U2y3P8Xj"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-671061b015eso1218231d50.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967515; cv=none;
        d=google.com; s=arc-20260327;
        b=kycL/pVVyl8DiBGFX2tahQNPxiZVtcdAJjH2PWdl7mNVsoWQdAWHw/znRPEckDXFNB
         KynKyvKhGcVNnu8jUCOPZZ4RZkq3ZTTOhE8umtTv7DmEGWla9BRehd7XBjaXlul8umps
         gZ9e5bfGLaR5cVlkJj8kevSjOATz7GAa4P2zURlE8hAVEcq/8/6sLlAZIyNPp8MBmMkK
         2WWfXE7ZZURDoQ/cece2Olt4ejpX58i5ZWWWOni7y5B2DAikq9ekKJFJv8SaUG89ulv7
         4ypangIokgrOTeES7E2E51cpiJDJMsxAJNYukmWHsjWCo8iC8oz9IcjbQZCs6YiYAltQ
         GNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        fh=fxtMLymskGoqGg4cL+dDIDQM3OHA6ARti3zZK5YYvIw=;
        b=rfFtwB/UTJO9N2Aj+hcQlIlEvIq5osgxWGA9m7eBH75d/2IRRmO73//C4i8aDe0UU2
         Nn51+AkKKO59Ova5N7Eurf0v28wM1zx1zPFqHQ7TZGnlJH/1+OZnC8kwQYIvpZAdxUM8
         xvE0mWs0S96DIrzCPpIwQYnPPnsqSEA4rYcsZdmQWwejv3YlcYb/DlhnUvqsGGGBMbCW
         /Ow8x9YZ3zo6mvtd6aShNwZq01APenXOl9cWvmo8rHyZu/qxBsGPF8rIXMXSo4Z8EYmK
         9qzWQXLvcsICAymp75gv537D3alyDXLbYtFvAVQGNx343PSt4QgBQlwSIKF2tUwGWmaL
         lGeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788967515; x=1789572315; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        b=U2y3P8Xj3QeUVp4xZOITQEYDK9FZM0EaBg6fTTU19MJNlzeN3D1eTZXKJz3oxxW5Vx
         3txMBG7CxGTFH3KoiBcC8UmWooFrRXj+9/e705fKKaZG9JY60eA7Ct13WQuXbDCkbpMO
         67mrDhr4v25ge6UnoUokCmEHLkANhahEfDkLQ4eceLl9eFpXa+Rr4C+EtQSLe+YZr2Ed
         WAfEsb+oukc/56CLc7NOO3YvJE4rk72Y1faXOw33qKiqCK5KUghdJTj+27nNGARsHtEO
         MtPwYirQR+qBS86NS1D6lcFNvzTxYBxZFV3+u+ipEl+IysUb5HDMTkBuABnUIRJtQOU0
         0pMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967515; x=1789572315;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4jJh3TX4gx98qaUfn3Q4oVt1KTvxUkS7IflLLQjx2I=;
        b=WBnKGDGzVGPwIa6VJoz8Ny/upJXhrpFA07KPpKtNDHko3mMG9o4cjihKssQ4rilTTO
         8h4OAvwh+gGcLO/tt+WaY+Jb1xfIcj4My6m9tCqrVRoX6IfhfnKWgcKnEV503Fx/OkBW
         gr/VYZuF3zdG9HfFNdkoLmeoKOzZ47EQbht+WvW/cdmXgahWZwJ4LeNgWaIZxV5Ash3B
         Bt21dBoPro2InTygSnVteTjA1oKKkt1RwCrD087Ie1+uf2t60AuknZpTL4817vocfr7j
         V1XpPT6HNLTfhnQplfsqM49TWj1zD0EU2ZMC7WgZsrJxJ5tjFco5jgDgafTQElPWYoJ/
         qE+A==
X-Forwarded-Encrypted: i=1; AKwUvBw60qsdtxUNDGpvuv9vUN59bzC5DV2W97KNRCEbB9gKx+BkyAsYLoG8XjRIauMzwwKj766lrMBY0es=@vger.kernel.org
X-Gm-Message-State: AFuF++ky+H4VPuZ11yq7Om9jaJVut/mvxA2chdpp220exBY4Ho6QzUB7
	Rr5gaKnzEKyb9sgZNGsZ7WlW6M8bEqjCwzQJ2x52sIgbTg+DW9tY+Jms88ogekuCHauH6HKeTRI
	cqgC5Sc5Cvt9EpuEec2SuV1LnDXXxR7NWcfCIVWrX
X-Gm-Gg: AYBFou0ZkW5/21zpcBc7duwFEYBmsmSlHPgO4H5tRSpApCaBXZ/VZMqQ8CGPJglmINL
	NPqyHU2FD3kJj/+Ahd8aDmisMlYj2aT8r81JzvwfaZZ3zl2Nz9VXtV4a3S2q4bOc8uvBSsvP4py
	nV39rL2DApwPX8tfgJzNXKG9JHFFJkuK4dDcsY2BOeA/BfVyjfihOo5F7PGg40VVEHx/LbR/QZw
	sPADwVVzFUm1JBgiBHJF15rly6ELoTOEHAEy9rQEMdkxHRHQ0MXoAqdECq19tgwvn9y15b5qtXC
	Jw+C17CphTnWuXFprZOZ7S0opIlbPXutZRQe99rcGs++gQS/x+n0PB+STTSJlKm9mXrMxt6mEKl
	yh1VmUZes3AwE
X-Received: by 2002:a05:690e:d0c:b0:66c:c7e4:2ff1 with SMTP id
 956f58d0204a3-66fb59519a7mr10665340d50.15.1788967513698; Wed, 09 Sep 2026
 08:25:13 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:25:12 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 08:25:12 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-18-85e5fd25252a@google.com> <bd6c9c74-e374-a9d3-ba1f-8b6f430894fc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 08:25:12 -0700
X-Gm-Features: AcwNN1XO0ky4otDKucsugFRBan2HEERm69mRZ8ScY2_txSdjnOuds0rILhuqOBo
Message-ID: <CAEvNRgEkkvk11_atVj9=+OBym-7SbSMB7MpHcoN6-Q5KS3Lb_A@mail.gmail.com>
Subject: Re: [PATCH v12 18/45] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
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
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hugh Dickins <hughd@google.com> writes:

>
> [...snip...]
>
>> @@ -926,6 +927,7 @@ void lru_cache_drain_for_folio(const struct folio *folio,
>>  			*drained = LRU_CACHE_DRAINED_ALL;
>>  	}
>>  }
>> +EXPORT_SYMBOL_FOR_KVM(lru_cache_drain_for_folio);
>>
>>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>>
>
> I don't mind about the virt/kvm/guest_memfd.c part of it, but I'm finding
> a KVM patchset modifying mm/folio.c there hard to deal with: and notice
> Sean also suggesting to separate this part out.
>
> As you know, I've worked up a patchset "mm/fbatch: drain lru_add_drain()
> and _all()" which finally removes the problem lru_cache_drain_for_folio()
> works around. In the initial version posted a week ago, there was no
> lru_cache_drain_for_folio() in the tree. Now 7.3-rc1 has it, so I
> intended a replacement 13/25 in my series, giving you just an empty
> inline lru_cache_drain_for_folio() stub (and enum lru_cache_drained)
> in linux/swap.h.
>
> But that won't work for you, if you're adding an EXPORT_SYMBOL_FOR_KVM()
> in mm/folio.c, and of course conflicts with my removals (in context both
> above and below your EXPORT line). It's easy for me to remove what's in
> mm/gup.c and mm/folio.c, but I cannot remove what is not yet there.
>
> I've wasted hours on this, hoping not to trouble either of you; but
> seeing now that I shall have to rebase anyway (an unrelated mlock fix),
> I'm electing to take the only clean way out: I'm going to submit this
> mm/folio.c part of your patch to Andrew tonight (with a shorter Cc list!),
> in the hope that it can be accelerated into 7.3-rc2 (or at least get an
> mm-stable stable base-commit id) which we can both work off independently.
>

Thank you! Will use this in the next revision of this series.

> Whether that's acceptable to Ackerley and to Andrew, I don't know
> (just as we don't know when either of our patchsets will go further),
> but let me try.
>
> Thanks,
> Hugh
