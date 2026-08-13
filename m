Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C98F426430
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654922; cv=pass; b=bJGUaGfPeXA0jE+TsC81SP05GzTpsj6gDuCtuDMTu+ss3voz3WkJVlF1v7MTsteQRoMoq0V3VwslKsfliyVJ5YcssiY8lPreZje2w25i7yaUYqdddfooh+KubFqQx6ONW6zF3+HljELXwfEYoNyMyaiLx5/9TU2B9SG0kOpxh7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654922; c=relaxed/simple;
	bh=4zrSQCT5vVjl4UEAlv+oAw5eKuOMF43JfK53dz2A/cQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pid+Mvo+6OsQwc8qtCAgGTG7mThhmfg/RvjEU2V1mwpqgjtEfPn2ewe759/ZaYXwJXdBpaelW25toPPkcoomD/UTBIawCv1mRYYzljuPC2QSaVvdfVaEhGib6WPRdUIMHj05/te/UGXtRdhafE/dbaZZEyq07jPoX7zUMWMz758=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e2tTPiCy; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e2tTPiCy"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so286912a91.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 14:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786654917; cv=none;
        d=google.com; s=arc-20260327;
        b=FGMFBSGXUQX61aEm4pkwOOE4rN6/HdrLJjLytDEw+yRFQC922XXcYSe1PdptSPh6OP
         8vgpf/t7mTd19CsnsYrmexpxvoJQm9mjDUjDlZlf74HE4L6eYqsvjf53KQKkbrKibSMs
         HMrloURSVBiV+jVMaoZwwr+9DHl+JmqsRxALIJmS+4hF581Sdv37e7llY3BJTaxt7++5
         RsgLXpQSnxjlkvglYjX/2RFX/CfmTKMMMY7g8A+ko7W7dI6wEGKI0h86LyrXHgIuhBVm
         ZshL3XzWyf0igRJSzK9dG9V+du2UL5/oGJsJKNxd8YuYZDWj7nvlY3r+bTunXOjBkfrm
         EuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=ScWN871Op0fwwgzG1qLzviyqH/P4Azji6iscDLhHJjo=;
        fh=v/H5E0pgKAKmRw9ixpRDesGItLfdyc+aFWZjufsMKzI=;
        b=bVP9yjMLO5XxvqTgOs5I1e+AAHUGSgN7iTglXyFX9dGyp5hGLKzJSuv3XaPGWo+3Cb
         gkueyk8t0r6o/wWnewMNRaRKuVgTsO5eZxoGguRZrcUi8sn6UH0VKCGr5yfRdvRy0NDy
         DQDqDy9xXm6BeJhf/t9S8K85Q3cwbCbvJhIbW+6WyZ7zVUeIVCY+Cc/4vauqJ6tZPCkj
         7kH0yqomQV8krM2IGufQtqN8P14JeWzCTcod7wmdocTkufoefj67ak8wr7ppubhmSX9Q
         6CAtXX1usP6vklLrJVX77VZrU7jVfOxvL4sHKmPz+RpYET5cVj7NIQsIM6rGR9KqzuWf
         t35Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786654917; x=1787259717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ScWN871Op0fwwgzG1qLzviyqH/P4Azji6iscDLhHJjo=;
        b=e2tTPiCyhzn5HYv2cDsvj1Jm1CbEC2B1xT7QzEg2dSK116FfrQfKCo4m9IaWHOeyW3
         K/s8UE3DPBCvyhK9xR0E5+WpFd/bYBocyotK3JTkfEKRp1i4SkE2K7PG+2zFoo7j7vC0
         uKtoTqZBSP85NQ3B8aW5WKgH0r9+1z+zPSFPQVvt7Wgd4Ywn8NVtqdvyDzhk0PN4HlHX
         Wv8g1MhgHKGSA2WOs0XYV6l47zZi/qzXyHukDE4t/aV/su1slL0cMYZ/rJwVZIJphClU
         8u7UXgdjl57tzNmJKcourbKM319dhhbefdyZU7/dnCCri3ruWyHdTKhk5tv5oKWsdhS+
         8wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786654917; x=1787259717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScWN871Op0fwwgzG1qLzviyqH/P4Azji6iscDLhHJjo=;
        b=ElTv0R+O3Mibidl5bFpjlpp6Rfue7/GehCWwoPKtDTjUSJTvVAkGCNfBfvF+opl8t/
         gM9zdPZGQ5HFAbvXlmP1fQEdVLThXGLwlF/WMeXtajELWAa97ku0qB/ZB2hC+URy11Vz
         SHN/UqEMLpdXgb2smFmJxAsuqPu84KEIQYJbhvjPomWYmWeOmCL4Xe4z67Mjx4CVMMgu
         tb09MnCgbebJ5rohnFogcGg40kVe+0yqMmggL47prmLklPgx1CIKS5tW+EfnkdObXMmL
         QYfCY2OQfnD1NwfTy/SPInirDXUnO/kAbo2GhwYdFZOD1qusa+4W6ihwMhvvvwSmXq8N
         lj9g==
X-Forwarded-Encrypted: i=1; AHgh+RpA79hpDuqYtyjZMYXF4UZS4/bTdE6rx6W6uhLjHpWKPmNwfU6Frsk2QeXYLHS7GO6shR1P8FCWMRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSUEUPoj4xBKjrdvMjngGuU3+5vzaMU+Sg3WLNhNxReab/G15t
	TP/aevwH3eKSMd1ghmkZesMtI+Uv41i9gBkBspuXCZgV0TOD2I+BP4uGbDc81aVqY93YvTCCXZa
	CaMgEaCpSW9IZMajLRXUM2B0fj6E5EBQhaBPyxnXF
X-Gm-Gg: AR+sD13rWQoIslhpTDTRWjmM9fS/AubLG+05zoPs+zFCjuNCnPcoDjAPtIKTV/Sy2hJ
	XfS8Gga8DBwhkxvr0A5VV4A/ukFV7L54QPBXyp3Dp6Rso0BMliGRG7kA6i5M0kzLpmtde1hYZU7
	z8n9fIyMkkotbwnTVhZenY144h3ORdPIUDL+jh5g63Rp/LrPHPZEcVGF+o+muM5vIgcgsELeFZz
	tGaQy/ZKeoyczavizV6MF6ip+YlD7x5TQX1xHVwdE1GWEnESU2LTqFKOZeKSEIIKfVX9SkSA4QP
	xBoRgzy0QGHoGio2GxB286/JpQm5UqYUfpYVwBsvE6e3uxa49g9quR2H61fgl/yEo0Kn1TD1Z5S
	UXcsJewNUS71JtMDACUBX7Hnmz7cxvQ==
X-Received: by 2002:a17:90b:3147:b0:38f:1a2e:6e56 with SMTP id
 98e67ed59e1d1-3933b8825fdmr709898a91.9.1786654916555; Thu, 13 Aug 2026
 14:01:56 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:01:55 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:01:55 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <an3o4h-E8mj6CUaM@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-12-2fc18ee6d3ba@google.com>
 <1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com> <an3o4h-E8mj6CUaM@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 14:01:55 -0700
X-Gm-Features: AUfX_mxCp5gPchMRxL80fZacuO-M5ybDdte9e0UhxtiZjcdkxnSatGLDZOBypz0
Message-ID: <CAEvNRgGpCVCGVjc9jCt9Yr+XypF=71h6eBahkXNkrXhfrtGY+g@mail.gmail.com>
Subject: Re: [PATCH v10 12/41] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
To: Sean Christopherson <seanjc@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 13, 2026, Binbin Wu wrote:
>> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
>> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
>> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, =
pgoff_t end)
>> > +{
>> > +	struct folio_batch fbatch;
>> > +	pgoff_t next =3D start;
>> > +	int i;
>> > +
>> > +	folio_batch_init(&fbatch);
>> > +	while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)=
) {
>> > +		for (i =3D 0; i < folio_batch_count(&fbatch); ++i) {
>> > +			struct folio *folio =3D fbatch.folios[i];
>> > +			pgoff_t start_index, end_index;
>> > +			kvm_pfn_t start_pfn;
>> > +			kvm_pfn_t nr_pages;
>> > +
>> > +			start_index =3D max(start, folio->index);
>> > +			end_index =3D min(end, folio_next_index(folio));
>> > +			/*
>> > +			 * end_index is either in folio or points to
>> > +			 * the first page of the next folio. Hence,
>> > +			 * all pages in range [start_index, end_index)
>> > +			 * are contiguous.
>> > +			 */
>> > +			start_pfn =3D folio_file_pfn(folio, start_index);
>> > +			nr_pages =3D end_index - start_index;
>> > +
>> > +			kvm_arch_gmem_make_shared(start_pfn, nr_pages);
>> > +		}
>> > +
>> > +		folio_batch_release(&fbatch);
>> > +		cond_resched();
>> > +	}
>> > +}
>> > +#else
>> > +static void kvm_gmem_make_shared(struct inode *inode, pgoff_t start, =
pgoff_t end) {}
>> > +#endif
>> > +
>> >  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t sta=
rt,
>> >  				     size_t nr_pages, uint64_t attrs,
>> >  				     pgoff_t *err_index)
>> > @@ -599,7 +636,12 @@ static int __kvm_gmem_set_attributes(struct inode=
 *inode, pgoff_t start,
>> >
>> >  	filter =3D to_private ? KVM_FILTER_SHARED : KVM_FILTER_PRIVATE;
>> >  	kvm_gmem_invalidate_start(inode, start, end, filter);
>> > +
>> > +	if (!to_private)

Should I make this condition

	if (!to_private && kvm_x86_ops.gmem_make_shared)

instead?

Will that help?

>> > +		kvm_gmem_make_shared(inode, start, end);
>>
>> If both KVM_AMD_SEV and KVM_INTEL_TDX are enabled, HAVE_KVM_ARCH_GMEM_CO=
NVERT
>> will be enabled and the logic in kvm_gmem_make_shared() introduces unnec=
essary
>> overhead for TDX.
>> Not sure about CSPs, but in a standard distribution kernel, it's very li=
kely
>> that both are enabled, right=EF=BC=9F
>
> Yep.
>
>> Should kvm_gmem_make_shared() do some optimization or the overhead is re=
lative
>> small in the conversion to shared path so that the optimization is not w=
orth it?
>
> I assume it's relatively small, but it's probably a good idea to gets num=
bers so
> that we can make a semi-informed decision.  E.g. if processing 1GiB work =
of 4KiB
> folios is <100 cycles, I think we generally don't care.  But if it's more=
 like
> tens of microseconds, then I think we do care enough to optimize the walk=
ing for
> TDX.
