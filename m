Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DF37C109
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692702; cv=none; b=gILdpvm/R1o3YJVXhN8ao1kYS0xHPNZZpbr3Gspnbqh57zIB660ZM8Qz5FUTPSi8UXuZhXGMBMdbNRXsqhlpCEU7wZAZa9R0m51/hisbVC4tHdu7GAvPykUNqiqgcwOt2Sif6wchiK9EAjRX1CrLT9bJAAxESyW7Fp+EOvrS9W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692702; c=relaxed/simple;
	bh=5DASDcrdCFVsZOprMrejQ5Q/16NZy+mOibkZO8FKsFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KpnGkh3hkYIEyc9k/cGWTB9TZEQkR0obVHYxp5ZT4yDIbL+Yjo/YkdcP1JKQcBM//8hR0wGieNJNiZOY+K5Xz/GnPLPd3qicmwqsXf4sTajEaVnxYw00c+Uye98uYlAe8ASZRGphefbsDer/evHrQOmhIkD2odemzc2p4YPgESE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YpNqCqgr; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YpNqCqgr"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so137260a12.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787692700; x=1788297500; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96v/IU+xqfPxFBmAPsTHt7ENr2LiLEu2VL8xEjm4RVc=;
        b=YpNqCqgr9Qi2JfAImSrI6w2yUCiAZ3opY0ZCZHEKI0g5jf7s7bdSxVYDXW/0K01Pmp
         hzNPSYSvSPpog6sKVZ/BrbDX0xaUMSzkjDKPSqNvYOCAA2WwDd9EZ+qBj5ZAIG4Wvwph
         +ZyWU9IlZSq4wEJx5BFdPTpaTIpohsaHamQ7tyQqBV4XCkARGvQSEy+2dLVpjEcZT3yk
         6GxAJzpzlhCjExDTDLydwTuJw0Jm4rIm+otd919wyBypFyDK/Fn5/PFowNFZT4v00zAV
         WVAYkii0nvMPLICihVmdUeobmjZIJoE7fQGlgXwYOa4UHqfMHUupCM9loroxWL8eG2kA
         6hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787692700; x=1788297500;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96v/IU+xqfPxFBmAPsTHt7ENr2LiLEu2VL8xEjm4RVc=;
        b=GWptzLszRHDYnHHbZ2Jaz3X8dck74YJjkgf0SXEQ8Zof9MFsJsSCK1Ju2QTSskKnPr
         JwIFBtSF9yknFRWziqM0I0jyRnv3am3JIQtmOQnzTJDuGX4NEp7cgZ8jfQGzo8kyzufT
         c6VK6TGWRI3ddeKnH0lyr1OHQYSi+50jkNS31SSa6IyvTErrJW6jp55+TmsXQymybcUu
         7QvAdXn6epfJYa3eOT9j4V10fGv9pLnC1gdzr1cTkVvVWbmbXuXcmz/ARkA6e03Gbav2
         uUbRPH1Sdswm9m16U21jMOiLByqXy92fUQCNyAYGeqywITg6ZBF4zBq45niE7ohvVrbB
         Gobw==
X-Forwarded-Encrypted: i=1; AHgh+RoInfhz4sIesc/vIU+6cCm6qhNWSomPeZOA/iVCE9VOKZcfc5YssOPCp/Z9hBn2nznBYLoUgdUeHt0=@vger.kernel.org
X-Gm-Message-State: AFuF++l/Gy/TcmgR7aRPXMbELZjDkS4Npv+eQsWmmImE9rj7agy5oFem
	ZswpY2y+TWWJM3dW62U1ZDm8d7qgZQqjUXweXpc5cVWVfn2MepiIRdhxdCwRymWdKA3n3FthwYK
	/B+JaIg==
X-Received: from pgp16-n2.prod.google.com ([2002:a05:6a02:62d0:20b0:c86:5f41:8c94])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:2290:b0:3cc:3d08:da3e
 with SMTP id adf61e73a8af0-3cf76286186mr2809631637.2.1787692699334; Tue, 25
 Aug 2026 14:18:19 -0700 (PDT)
Date: Tue, 25 Aug 2026 14:18:18 -0700
In-Reply-To: <CAEvNRgFhjbgC9Ng1qviPx4oE=qihUwiBcsYOgJG3yOU-nLG1hQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com> <CAEvNRgGvxMus6pp=xuDYOumH3Ge4oi0=YKjTaFykFHwXuzRDwg@mail.gmail.com>
 <54d1bd0e-c27a-4033-ab97-02cd9579a620@intel.com> <CAEvNRgFhjbgC9Ng1qviPx4oE=qihUwiBcsYOgJG3yOU-nLG1hQ@mail.gmail.com>
Message-ID: <ao4Gmn5tSZMhl_nX@google.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 24, 2026, Ackerley Tng wrote:
> Xiaoyao Li <xiaoyao.li@intel.com> writes:
> >> 			KVM_SET_MEMORY_ATTRIBUTES2 ioctl on guest_memfd file
> >> 			descriptors and disables the legacy VM-scoped
> >> 			KVM_SET_MEMORY_ATTRIBUTES ioctl for private memory state
> >> 			tracking. Only the KVM_MEMORY_ATTRIBUTE_PRIVATE
> >> 			attribute moves to per-guest_memfd tracking; other
> >> 			attributes remain per-VM.
> >>
> >> 			This parameter toggles KVM's in-place conversion
> >> 			capability support.
> >
> > I start to think that the term "in-place conversion" seems to read
> > inaccurate. I think it is describing the shared/private conversion of a
> > gfn, and in-place means when a gfn is converted between shared/private,
> > the backend comes from the same gmem page, thus in-place. But KVM
> > doesn't enforce the "in-place".
> >
> > If "in-place conversion" describes the shared/private conversion of a
> > gmem page, then "in-place" is redundant because the conversion a
> > specific gmem page is always in-place.
> 
> Hmm, a few people have raised something related to this
> gmem_in_place_conversion module param's naming: Xiaoyao, Yan, David, and
> Sean's response is generally that it is confusing, but can't find a
> better way out. The main consideration around module param naming is
> that it should be named for the benefit of the admin. We want some name
> that admins can understand at a high level (for some definition of "high
> level") what this does.

Executive decision: use gmem_in_place_conversion.  I hear (and largely agree with)
the complaints that it's imperfect, but I don't think it's feasible to find a name
that can perfectly describe the nuances while still being somewhat succint and
intuitive.  I.e. gmem_in_place_conversion isn't perfect, but everything else I've
seen is much worse.

I'll make sure to call out that gmem_in_place_conversion is imperfect in the pull
request, to give Paolo a chance to veto my executive decision.

> Do you have a proposal to resolve your concern, considering naming,
> documentation, comments, code, etc?
> 
> >>                       Whether a VMM uses separate backends
> >> 			or out-of-place memory management is determined by
> >> 			userspace VMM design.
> >>
> >> 			Note, this parameter is only available when
> >> 			CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y. When
> >> 			CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not set, in-place
> >> 			conversion is unconditionally enabled.
> >>
> >> 			Default is Y (on).
> >
> > I'm looking at the doc of KVM_SET_USER_MEMORY_REGION2, which reads
> >
> > # When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
> > # userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
> > # state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
> > # is '0' for all gfns.  Userspace can control whether memory is shared/private by
> > # toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
> 
> I'm not sure how this snippet from the documentation connects with what
> you'd like changed.

It's flat out wrong once in-place conversion lands, because it assumes PRIVATE
is tracked per-VM.  Something like this?

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 4eb7e75a7473..c9769e5e7329 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6383,9 +6383,12 @@ on-demand.
 
 When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
 userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
-state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
-is '0' for all gfns.  Userspace can control whether memory is shared/private by
+state.  If in-place conversion is disabled, i.e. PRIVATE is tracked per-VM,
+then at VM creation time, all memory is shared, i.e. the PRIVATE attribute is
+'0' for all gfns.  Userspace can control whether memory is shared/private by
 toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
+If in-place conversion is enabled, then the starting PRIVATE vs. SHARED state
+of a gfn is determined by the relevant guest_memfd instance.
 
 S390:
 ^^^^^
