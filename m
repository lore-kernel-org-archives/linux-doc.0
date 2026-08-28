Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC43B058E
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 04:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890801; cv=pass; b=C0J8amtUTLJvTYRxHmb+XNvOWPpajFrZn2P+NkpiQIHm9t7EjM7rIB3AS1XSTXSs8D7cpIDpodho9cO4MbwB/qV1EhvvFf1W1fEAmKWWKBtzlK45IZYsqlHSnbPTe+Y077pgSHMDoBiMfD2P862t8eQN441B4iwR//a0wsuwNGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890801; c=relaxed/simple;
	bh=mTQhz7RgMxAC3d9Zq6Msa7p3Wk1sBx7SdhDb5OizNys=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/4euj5Zv7UOsXIOOoJPZCWOeUjSb0EyPO7b4Tdh3xwSDZBB1Rj5122tL102eGASTFLxZXOI1yQpu8PI50VAt5BQ5eyGKqQWYW/whN/ki4s+PYjFCMw5ulnG4bL/dIZeD12mcgdaGsu4khUQVr/Q018H4M1SPD9287kWNMl7/Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=srbbmPsk; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="srbbmPsk"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso2181316d6.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 21:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787890799; cv=none;
        d=google.com; s=arc-20260327;
        b=nNjc7nZSV7/iLUSRoUVXr8W26lPsUrPqq/HxJ1KnJLvEqHovhw7nseIR3NoZPWDqQN
         pjd3012JimDRWZksXfmUnm3T+wu4sYFufrfqHEsT20eDEsFHTyDIBU8T8wczex+vHmOt
         /skP42wTHhbiv1pl8Kc7MAmkmUR8g+khDJWkrHUWluI35gK8kqmr1ELnXCpKmlwqiFmw
         6WxSr7Vnda0cPjrdZbgh2Ubod8XMAV0ZNbzbP4QyrVS+s4O5tBYX7GqP1wnaG7xECxKA
         NReZUBZEqwlg21wEGRHzM7PVq/h8CVAZj/ogmqmjVSE8vXWGvFtmnIoPRE1zrigWlk3l
         QX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=QCDy9v0wvCJe6b4tDkyj5x2hkmiUIAeHKOf5Q690ANY=;
        fh=byqkBlJDi9HTEnwPF0CPaCHZYcO2qwyYgCdaDcqTnjk=;
        b=MVSA4q0C2Orx95gnqJi0a/MB2nVh8EynGPc0TKxEs3aAD1Hg+bY65lpkq64UnQGPTP
         puTzAQ6q3wR01DBJltadOLngm9w6WKa0k31vKjVanAVTsAnI0H0VqBE92m1+GygmFOga
         uXYRkX68beTXcAxjYUc7wUHkqAdNAXtTrUfQL/lZCpqjn5sovRQwRoeWSmaIhQiiEEnu
         WqAiUg4o/f9GtdMUgDXw+fDqt9FN4ss5+B4GSuXyCL/Od1vgvnSC1nQ4JdmPq5TleN60
         +qwqHCi+FTyx9knH0FWkNt0+oKL9qp0ZB9MpQDOjyGBpeo13VpZJx/Gafsm4Kae4zdkJ
         Iwww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787890799; x=1788495599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCDy9v0wvCJe6b4tDkyj5x2hkmiUIAeHKOf5Q690ANY=;
        b=srbbmPskM51SfvHLy1ZZPy5wqi5pSxCobpWjCsAtf9kdwbwev+Xzpwi6U163DrfKMz
         EGxcCb5XQX1Dianl/W2/dd91aW7aDdhaaeW6C8RGa3DJvQheicg39H1I9M0yGft6epVx
         FMBQBfmBQWhd90GZWLA3cHE/1c7j4RKng7E1q8OgfxXonFab78oK+/zUg+OUfTz2iGCh
         0XFkoUpzu2K975n1NolP8Xjrf06b0xWylV6V8L1LhpKm9+eGjTAApjskU/A7gWYqKZUw
         uJnA5IVLt2Zjr2ly63TJrSO56jUWMlZt9SDTZmk8Nqb8eN3+n8XkqQ3vw168TbyBaGNE
         NMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890799; x=1788495599;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCDy9v0wvCJe6b4tDkyj5x2hkmiUIAeHKOf5Q690ANY=;
        b=caVM8EcgYHLg35a19L2fFoq3wKvMXfP6QNJyiAq9JweQpjynDHE11DfRv2TJdFMkgW
         R2nnXRn8FoRoYFXVCIb2rn5pvMYUIuv+qPSlr1tLiD/nvlNkATcb/yv6iAHGFWEwT2O6
         2OKTYCeH8yAV39U9kWvPzWMWeFLNiGvYL5f0SlBcolvg38fDxGEFzL73DLUq+TblWh3o
         va1ejCk29b/Q2FhiJOX0DELWbo1wj6DczjXy3xE+hJx3fLdHqbbNyt0J9/cy9ohKkiFX
         TgyMCN+1e6fZhZIGqO78S8ZS1wbzc+iqDnJreckvdd5CDC3yiGXES6ucZ4WEX+wBWEdX
         g6LQ==
X-Forwarded-Encrypted: i=1; AHgh+RommPhuj0wQQyBMaxcp6kNyfqRzx8yTV5iChYSdYVvfKkr4No4e5tPOrdWP5E1YDgODPsQIYUzecjw=@vger.kernel.org
X-Gm-Message-State: AFuF++luzv5CtCSZMlgT0o3Ds9GKUXq705zxA/9ixXXaDUz3r6WlkXca
	VFDbd1Qeo0ZtZkYz+/1vTtQaVYkyh8Ewj1DGinHg++kAAoWSUwyoQwBP8ptTLIALR59I3OLnTuS
	zE6pQO9susjhUueK5581wQcmshWk3KDPKUZC8F/Ob
X-Gm-Gg: AR+sD11Z03V8/xrUfk2XDH7i0SNtpDOWdM70l03Ap08KsODCDjhWUFEXiAcieNCpObY
	PQdef25P7RU8KmcGa+1dA3jWNDOqcdI+3NKN0ggusGdb4Hl6xpnJciDEYT+jUNYOmuHP+mRftv6
	6l5up9+iHlyYeODjqT/dasfMEc8m8cBmVNNK6jS9lw6AwB6WHYD0UhxbFbYejWaLwtoZEpdfD6X
	eMozmttIApgObyh+ELDpX1Prd073dFrU6hY+dfolt0f/S5nBQNiTGFL/KuYx3CSK1TrApiWCrjI
	NTPXMipoOeYGcdf/bXkLpuYBEEv5GOnd344BLDWqtuPeU2qeuRhAN7VXQjB1y+Zxz6t5rs45L2A
	zbfVgR7gBfYB40DnCUockKEKDHaAAkwOjwVVg2HkPsA==
X-Received: by 2002:a05:6214:212b:b0:90c:4e5e:754b with SMTP id
 6a1803df08f44-90ce0f45ea4mr46165856d6.28.1787890797765; Thu, 27 Aug 2026
 21:19:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 21:19:56 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 21:19:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ao9CKMXAX-hScRSa@google.com>
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
 <20260826-gmem-inplace-conversion-v11-15-0a15d8a799aa@google.com> <ao9CKMXAX-hScRSa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 21:19:56 -0700
X-Gm-Features: AcwNN1UAGJ-fGOM9zD_UvTf06ZrP54h7-np3dJjD_6mMPjXqsGS1LGYTBF7LEzg
Message-ID: <CAEvNRgG7n6F=dW9V_QqQPDDgLiZ7x08uLDanJgSzerNtN8sqBQ@mail.gmail.com>
Subject: Re: [PATCH v11 15/46] KVM: guest_memfd: Call arch make_shared
 callback for to-shared conversion
To: Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Aug 26, 2026, Ackerley Tng wrote:
>> Omit support for calling the arch hook to make private, since SNP, the only
>> implementer of the arch make-private hook today, would actually prefer
>> making private only just before faulting memory into the NPTs.
>>
>> Calling the make-private arch hook would require iterating both bindings
>> and the filemap to find the intersection of bindings and allocated
>> folios.
>
> Why would KVM need to iterate over the bindings?  Only the RMP needs to be updated,
> whether or not the RMP is currently reachable is irrelevant, no?
>
> Subsequent calls to kvm_arch_gmem_make_private() from kvm_gmem_get_pfn() would be
> superfluous, but that's already possible, e.g. if an NPT mappings is removed for
> whatever reason.
>

make_private takes a gfn and pfn, so __kvm_gmem_set_attributes() would
need to iterate bindings to get gfns and filemap to find folios to get
pfns.

>> On top of that, SNP would need to figure out whether to actually
>> make private based on whether the memory is about to be faulted, or
>> whether it is a conversion.
>
> This is a non-issue, no?  As above, sev_gmem_make_private() already bails early
> if the page is already assigned in the RMP.
>

I'll remove this, you're right.

> I don't care terribly about how SNP handles this, but I do want accurate reasoning
> and justification so that if/when we revisit any of this in the future, we can make
> informed decisions.  Because unless I'm missing something, this is an optimization
> choice (eager vs. lazy to-private conversions), not a complexity tradeoff, and it's
> not clear to me how we decided the lazy approach would provide better performance.
>

How's this, to replace the entire commit message? I hope it captures
points from this discussion:

  When memory in guest_memfd is converted from private to shared, the
  platform-specific state associated with the guest-private pages must
  be invalidated or cleaned up.

  Iterate over the folios in the affected range and call the
  kvm_arch_gmem_make_shared() hook for each PFN range. This allows
  architectures to update hardware metadata or encryption states to
  transition pages to the shared state, instead of leaving hardware
  state as private while guest_memfd tracks it as shared. Transitioning
  hardware state ensures that guest_memfd upholds the guarantee that
  userspace only maps shared memory.

  Invoke this helper after indicating to KVM's mmu code that an
  invalidation is in progress to stop in-flight page faults from
  succeeding. Calling the invalidation helper also calls the arch
  invalidate hook. For SNP, this kicks any vCPU with a registered VMSA
  within the range being converted out of the guest. This ensures that
  make_shared never fails due to the VMSA page being in-use and is
  important because if make_shared fails, the RMP table would track the
  page as private while guest_memfd is unaware and tracks the page as
  shared.

  Omit support for calling the arch hook to make private during
  to-private conversions. Making private lazily at fault time aligns
  with how it works on other platforms like TDX.

  Furthermore, making pages shared only requires PFNs, which are
  obtained by iterating folios in the filemap. In contrast, making pages
  private in the RMP also requires the GFN, which would require
  iterating bindings to get GFNs and the filemap to get PFNs from
  allocated folios. Deferring the transition to fault time avoids this
  additional complexity.

>> Calling the make-shared arch hook and not the make-private arch hook does
>> leak SNP-specific details into guest_memfd (as in, why only make-shared
>> during conversions but not make-private?), but the additional complexity is
>> not worth taking on until guest_memfd has a user actually requiring an arch
>> make-private call.
>
> [...snip...]
>
