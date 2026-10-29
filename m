Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793278364;
	b=EYU0eRFVzaZbR1aj7SQrCItLw0safX87+MLFeL8FZJCyr6YAZBNDTm4tbOi/vHajM/5Y
	 LUcEQOfuMRCAKnAVgHQU4YB54YDLtQEVzRWlKOeXl2PszuHwLDxlwX/CD2tpDF+9Zycbo
	 SdasEECJ694tFJ8jEF/kb3L1BHQumwMUVgXkx3ast+IqMe+8Ptz1ZaRST7Nlkckseyz1c
	 EuhHmzJbl1fn151s1aVLoJH7qtSl3dy2DEF7bf9Jq6CeXdbPdBN4bBFCleNQ1YcIcZ6z2
	 xIMt+23FsJzJdGbqPz1nTeehT5xhxUbHXH6iPVcgqpe7BfAc+V0E9PGaKGAriUolrvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
	b=zzy6dkN4QpJjc7njJZ9Ghz1hAbQRyRBk0mQal/4jjTNnOC7kiMzp+Duy+OLH/uvewnty
	 KLZkSgv/VkvuYGYBNEYLHc+icHeK+GWBpxlLfROWi+rHEIQmU24NhsrHQcSdKTcWUEhij
	 I2qc1SzOnEV1002CbqBknw0sKB5R/IzBDa0NbnRpXq+knlZ9desHxMarmjIPkGnAAUecg
	 cnH2RC4eVqHuBXvWphOFDxiSAna55aWfJ/vEIcBE4OLyXJMQpPOJv3O06CtDa/yiQpKi5
	 SpnsB5TUJmC92L///P31x1KSMEkaNns0tinNHKH7ZcM/G60wxdqoQNYTOjtsG8MyOCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ilBWZNJq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6400606A31F
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 12:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6400606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ilBWZNJq
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c7b00a75fso23335636d6.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278363; cv=none;
        d=google.com; s=arc-20260327;
        b=l+xFHHRoV+rMHT2Mh5O0JUMVFd9ap6bUI1T1X/cDvSAboQ+lNHTzt0F/ugLb8Ozbqu
         GrjfwdWZf2oNroFyO12kirk9MSLsG9vYhxvfC9MMSsGsKcfgvc/8wIURSreiRCgvNaoY
         OxqNAwjh8BIB9t7fo52Y6wozxq0kvOjHSNfmW++Y/3BMY0gwR6sOpyCs3EyZ0qfhnoR8
         3y2mve2VeysGi0b4oED6MocltPnBQnTRBoD4oOidopLGyXI87XuDX3zHQZO5hmzd37Ij
         r4KBm5JBAUEn1wZDQNjzsToHlrW3ULLPWlOW54DdR4ZjyxgoPfUgI7/zhYTc2ypXC6+y
         sgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        fh=8BhPizIi1l9Hj975celBDJYgoo+qbDuupzXYqwakVhw=;
        b=WTHPT1Eg7p1r1jB1mkiGWtQktd3lGA5ZZFyEVYj4h/kHVEEA8IcbMPFIgRNYsGfZU/
         odyG8m3PkIlrlPuMr5HfJkVPTYAQEm7Dqw7Kb3ntogrE8FTfHCv3SA0BDCZ6FcpGqTiy
         Q9lsT+0XoeMk39nmJUL0mh0xc3hHa9iEjBYLmDCWBwIaZPuadArb3IREUph1uy1TpotC
         Bh4VzX94d63ghQiRuX598aP3uSCXrVUKHXRgADYEzHrwh4v8m/mXxQmzQlAROg6Mf1vA
         amG3mMcg3fhoHMfsIHSbtlh6Bj5+Bq34k7uviwONdNHE9AthmaDmaAIXZv4XK8gLaFc2
         juwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793278363; x=1793883163; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        b=ilBWZNJqMKptZvwkKrs2r7FR0ELwbpG7leCsdx7jfQxCDTv/k93OwjEufXvhCe0XID
         xibNckbWfyQTFPGne38psJQsKKrvMTJJdUQrdanZeOz0uHUNeBTeawL4MNhJjblH9PIZ
         fZlKI4CivX5tJ8PkFacttPvf+wR4llu5ZYaPk9JEPGxEXQ3BR/ekFNZPTLVjPTxSfuhU
         s5joSjQqJptEs99jZvbC2wWxLLtLFk1R7Zc5/St+4erii1a/eVPJ1zmACPUgBAS6QKjF
         g5vMM7efqUOyZxMUXtpdO36TgIHqhKOpKi0VWbuiV3m0U/xsOFgC0QRTl1rLSFYijegC
         ufWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278363; x=1793883163;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf2xViTkAeLxB49iEkeFNan7sx9Snfm1yj/XBegFK/Q=;
        b=C9v5mkCrkllYrV7yCN5iOnBliScgFiomIxHP/0G5NqH9u7lo0ai8LGzVrE/TZLaubH
         wk2O3Mu/FMhdt0UT4626hZvm9lDcKo/rMesTU7+aZ7tkCXOFyTTzPti8dgpkGejnDRYo
         ut8eh8cPO+Vrc5KIGHB6/mEmgkl8u/wcKlf+RTl31cNLvX7JaK53BBVqm91gq4MWTicr
         MpQCqB8Mi8lba9D0updEWZJ6RbLGFZyFkl4TdeAx8eEgesCYfcVNh+JrAL1g8xdgdp/N
         Gg4QxIYDCsYLEvyuRLOL8Nt46dBqX9SwORx+NqzvWT+oIZbebXhnvLEIhWyjCQc8ALn7
         BlIg==
X-Forwarded-Encrypted: i=1; AKwUvBzLU4KRuavyzTmuPXgum+KbN5GC44sw/CzywyWNO50qY3MID4fpRY2oCgchMCJMonS9Tbomp+OUecE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL739L9rDebi1rPcWNxAc7MYV0RI9pef2ijqR/+6A6RigLEtcED
	NRaiRehpK43RDM4MpCjTavTuoOjsl+cOSvGBK3LqYxQ75Fn06p7hTVRa23lXMb5/tOfPKnPJ//e
	3gpXnUhfWdNsf+kT7eTBPD0vSP6f7usGxK0t+c6ee
X-Gm-Gg: AYBFou2nAnLPQ3TH04InOq1coJlHIWf4K6xT0948BMmVWdDBXf3X38lq3x1qaDw8Dqt
	gUZrP3xysHjZgGcS82fb/jvZqAEgzPEFMu+CzegEzKH26Mekq+7qleKlddI322t4Ak7oLiSayFa
	7AP+7LHPCo6iD+ap2IhHZdl7FqYmGdZ9QThThgPL+cnuLlsxqszmJ02u24TMLmmykW1JsiNsKXg
	OYopGGc4feQLe8lx4vWyMB5aD6erkgIzyYnLKiXU0vNKQNdE/i3W/KABltrVNytDPvWYU8A4MjK
	IelL8b0zri9kIoq3keUBC1MTIIjXYY/SFBpO2ILCUZbFldCR6qDLJQr/muMJ6MPznjolxlfBxKG
	S6jrm7T8fYuzQqeHy2GB0/hVKS/QelZ8uwE7VJ8jbZoWaavCatVLt5dphwmpnNDMHdw==
X-Received: by 2002:ad4:5747:0:b0:91b:9496:6a18 with SMTP id
 6a1803df08f44-91c7d1ae53bmr83041376d6.37.1793278361370; Thu, 29 Oct 2026
 05:52:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 05:52:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261027154649.91571-12-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-12-griffoul@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 05:52:40 -0700
X-Gm-Features: AclHuK85LBuCmtDdaaOWg4OEyIMQUVa8mDtLyPY6JdCBNPTut6N07RXjZEiRQWQ
Message-ID: <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
Subject: Re: [RFC PATCH 11/14] KVM: guest_memfd: Add kvm_gmem_restore() for
 PFN mode providers
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jianxiong Gao <jxgao@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Mike Rapoport <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Oliver Upton <oupton@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Tycho Andersen <tycho@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

> From: Fred Griffoul <fgriffo@amazon.co.uk>
>
> A device cannot fault, so when a PFN mode provider gives frames to pages
> that had none, or makes a read-only frame writable, a subsystem that
> maps the file must be told.

Totally makes sense that guest_memfd needs a way to actively map pages
into the IOMMU page tables, rather than passively like for userspace
page tables and stage 2 page tables.

When the memory is owned by guest_memfd, on a to-shared conversion,
guest_memfd would do the mapping for IOMMU, which can't handle faults
like Stage 2 or userspace page tables.

> kvm_gmem_revoke() does not fit: it would
> zap the guest's and the VMM's mappings and reclaim frames that a guest
> may already use.
>

I'd drop this paragraph from the commit message, kvm_gmem_revoke() is
the complete opposite and isn't a candidate at all for the goal, which
is to notify importers that a page is now available (and they can map it
in).

> Add kvm_gmem_restore(), the counterpart to kvm_gmem_revoke() that the
> sample provider leaves for users that cannot fault. It only updates the
> exports, under the shared invalidate lock.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
> ---
>  arch/x86/kvm/Makefile       |  1 +
>  include/linux/guest_memfd.h | 37 ++++++++++++++++++++++---------------
>  virt/kvm/guest_memfd.c      | 35 +++++++++++++++++++++++++++++++++--
>  3 files changed, 56 insertions(+), 17 deletions(-)
>
> diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
> index 25fb3d6e2032..3255280884b5 100644
> --- a/arch/x86/kvm/Makefile
> +++ b/arch/x86/kvm/Makefile
> @@ -63,6 +63,7 @@ exports_grep_trailer := --include='*.[ch]' -nrw $(srctree)/virt/kvm $(srctree)/a
>  				-e kvm_write_track_remove_gfn \
>  				-e kvm_file_to_kvm_fn \
>  				-e kvm_gmem_revoke \
> +				-e kvm_gmem_restore \

provider --1--> guest_memfd --2--> IOMMU

2 is definitely required, but why is 1 required?

Between the first .get_pfn() or .lookup_pfn_range() () and
.put_pfn_range() or kvm_gmem_revoke(), the provider should consider the
memory in-use by guest_memfd.

When it's in-use by guest_memfd, then guest_memfd should use --2--> to
map into IOMMU page tables as necessary.

When it's not in-use by guest_memfd, why would the provider force it
into guest_memfd?

If the guest VM knows that the page is now usable (some other
communication channel), it would touch the memory and do a .get_pfn(),
that would be successful this time. Perhaps that's when --2--> needs to
be performed?

>  				-e kvm_gmem_export
>
>  # Force grep to emit a goofy group separator that can in turn be replaced with
>
> [...snip...]
>
