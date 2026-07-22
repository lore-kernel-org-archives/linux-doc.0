Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE3403E89
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749232; cv=none; b=qfVUa226cK7lTM6lkbeOafTndQQ2+1TYG1p/5+WqbRKH746WPzEDiZhzK/+hNJemisLMYl26TX1D3Cg8y0+Ayly1qZINemv13ZXDfgO0AhOccSQ8/7J+JCB3eMrYbHD+L7zwFd9+933/oZ6dSykalxgw3Jd8aR0r6UiVuhUls1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749232; c=relaxed/simple;
	bh=nyBkYgKwOn4jVc5C8Fouc1FeTmY3h02EMe0OQ5ytqsI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XuyQ6tRRRVdp95sE0WsJVsKCUovYhdTLU8DX5kqAWBdP/O7TWbGw1rTozZrXEn2Z2Ks9SfuDKNJPAhSCJ7QsCdocmTBlFxPsWkYSqNidAcatBJSw9FYm4+MHB3Z2ri7lWpPGDYFJ7YGOuPmIUHELeJcOhxnAerUqW3ZSvW8n4eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hovqb5P3; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hovqb5P3"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6dd278512so3307147a12.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784749229; x=1785354029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ptao9s40NBhMm9qoNoLOa2VZyEW6G4SG8hWVVOs/sao=;
        b=hovqb5P3n8VEqY52HNZccABZ9r0eeTb7CNfrnv5TVVoQkGIanFwTwexRUwgjHgPApg
         DGB2wDB6xXbra5LEz4UL0Y7qJRiv5vR+/i9JArTfesPNvf+gJjKpnNamlGuK539oakHz
         M3uv5FqGreIid2H4tlUK4bSkVxgAE8pVoVa2NyqqsO29PF8u94hUgHcfn8R9Cw7/2/PF
         hHxP01e74ara8BggeSQOMMD/H8mltABdBNXzJI89LVSwjYLtpoCkJAUxcGIL88XbTPHc
         bjEXrTSDRj2GYVp3x0rglPMtmzr0LvFRTH26JWu/If/DLPrTWMa426GRXsnETvEUt54g
         JnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784749229; x=1785354029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ptao9s40NBhMm9qoNoLOa2VZyEW6G4SG8hWVVOs/sao=;
        b=oh5spBazaVSGBHQ8X2Y8l4rvZLKl5ebpKeRiR9bs3BC9+9x5kAtwxugTVBlM1Tbah/
         thNCYs5LHKemdX0bL+vPrimtvY+cq92uRAdMWbs5b95qzIUkqPhTi7TPaxx9sJIkGa+8
         ZfPmt+rfZSeiHNtstoM8yCFl53uQRwZ0Dc//0QSxj2h8yl1tIiqEsOISsoZyhtHct4ju
         pPmzmealIGC5EMi+e2LU/hJzk3hR4wxIUZZx5lGLW55AjpMbpqJlYVowotJZ3QfuNx8r
         lW6WMufZtCrZXY3tpCXYvwUhK1ngicyWtkjODmQt5eM7b3HKyGvdQm7esJf+KpLK+cgI
         yLtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiC4f3STLVztB+JyF8F+7TfSPaY7f3iBdu5OgxSREVoV3e+o79Q9Bzy0KqEtczoqpHd1sRq9K89tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4zlwPYMkZqGf0iYwU8xXzJjTayjGKTcwmX1xSGnRYtVd2fEq
	O6f2z0Ilh0oAzKWSm81zeC5sGlPOBZLdnJgJxZCrSbFLdiwT9p1sszz0sCpzEAETEDmI3eQKFYf
	g6aXQvQ==
X-Received: from pfbhj6.prod.google.com ([2002:a05:6a00:8706:b0:847:840c:ba17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:299a:b0:845:c6fc:2821
 with SMTP id d2e1a72fcca58-84e2b8a6521mr317062b3a.22.1784749228959; Wed, 22
 Jul 2026 12:40:28 -0700 (PDT)
Date: Wed, 22 Jul 2026 12:40:28 -0700
In-Reply-To: <20260718014500.2231262-7-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260718014500.2231262-1-rick.p.edgecombe@intel.com> <20260718014500.2231262-7-rick.p.edgecombe@intel.com>
Message-ID: <amEcrPzZELfQ4jU9@google.com>
Subject: Re: [PATCH v7 06/11] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 17, 2026, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Use control page helpers for allocating and freeing TD control structures,
> such that these operations can work for Dynamic PAMT.
> 
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically. So the kernel must ensure PAMT backing is installed
> for any 4KB page being gifted to the TDX module, and must tear down the
> backing when all associated gifted pages are reclaimed.
> 
> TD scoped control pages (TDR, TDCS) and vCPU scoped control pages (TDVPR,
> TDCX) are all handed to the TDX module at 4KB page size and are therefore
> subject to this requirement. Replace the raw alloc_page()/__free_page()
> calls for these pages with tdx_alloc/free_control_page().
> 
> Switching between special Dynamic PAMT operations or normal page
> alloc/free operations is handled internally in
> tdx_alloc/free_control_page(). So don't check for Dynamic PAMT around these
> calls. Just call them unconditionally. Similarly, drop the NULL checks
> before freeing, as tdx_free_control_page() handles NULL internally.
> 
> No functional change intended when Dynamic PAMT is not in use.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [sean: handle alloc+free+reclaim in one patch]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [rick: enhance log, reviewing, rebase, with help from AI tooling]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>
