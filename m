Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E6835E944
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 23:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783381625; cv=none; b=CASWKVynpRxb1/4A1cteeqn0QFFaTv03E4lZAShdbxwO6ObzrxkkrldRCzvfVJpGQNk8fodsEt09uuMtvLZZ7MkJiMCof6scc2LHJEoWE4BxCHcbaZpiFu5FSl2wq/jg6xTNN81rbO3zy0zUGAZvvCo5CIUcNN1AjSE3Ot+xpZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783381625; c=relaxed/simple;
	bh=ZxoPu5hPF9Q2EClBSvzF/FJl98QidLmf5mhGdS5i5dM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E6oRKKjawrER1eYh8USrPldZMGbPeGja2lKv4v/lyfDc6DvgR1SkMxo1iLPC89wfmOFXLdn6GR8zV6Jr56cC6ajhsPFKWPRJOv+iQzFuIZNLhTBdNI0qB2+hkb97A/fiF2wLObxDZy+SUAAXft5uUZ7SnOu61jpTlQckwdvBPZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TVpVlMa1; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TVpVlMa1"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8952346bb9so3067845a12.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 16:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783381624; x=1783986424; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qWQdcsO2ad3MOocum1PCeCurOaAogfBMApPITrnBlDo=;
        b=TVpVlMa1nSrczSaDPAXQ9TgC36jnOY6q28lSpVGLalb9IGY9DvKG1Y4WejfWzooXOG
         5lQJEMM6YcXBSxWFrXKE4q+aW/lnA8uk2DjoER71X40px611Oq0dRRMdEtfAhnC6SPe4
         cQLg4qaNZD2HbEEVF7Q6t0ElXlNVqY0AK94lJ1Ot52abG7/lEjqMbKbrKTvJCIqR8ixk
         8XdZFciPSvwTkrSmqof9Ta4cr4Jx5eK++6I4izx5P4W/jfzGfzXBvqCWy6A4Awht/Uqu
         7bYOY6RUWKN2e8pr+7/EvK3YGGWuLBduDFV7jMlF7yIwl/lfeZKuoPrFXephVVwm05pY
         shAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783381624; x=1783986424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWQdcsO2ad3MOocum1PCeCurOaAogfBMApPITrnBlDo=;
        b=V9aRuWheanQzdsNCTyUUhkuBXq8dD4R6pWrexSnczPfWO0INJ0bGYNeVhrekuNh/9k
         6K/22JvRc24h9cDJCLxKb3HJMOquP/1EU4hMR8mE3t84R9Mg5LRzIo/rMNwm3ttPYgK1
         Ti7ZU+mzuxqMXR0cpfjbIXjcOSkFiB44gHKhmwsnXQ42Y5cT5xjzcr1kDwjVubarcsKE
         1ymr5hHCLgZDdS/5GGqGeeEWlfW4jbj1zdJm2nRmJyi1q/DIsMtf0GYOe/MYKB+Z5gGh
         GwXfIJBOeXuqzR3wOL1I+vsoJOqj8G0/6knXGjoyIcaRGPWxKcDUZ54cN7kyfLTTSelb
         pHkA==
X-Forwarded-Encrypted: i=1; AHgh+Rrd3FqopliDVPiAr8eXOALqFZHnWI9rfsAeVG0XRyvP3AKUS0g1zmvE68+iFa9v/xOwqm8hBidnrdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfhhuDuBwp8ALBcmXIXnZAo044e9Nl8AEVF0/cBc29Nkb+9D0
	GPl2D1Y4oKdEstmt85QsfnbjyXEQOgH6cD615hKTIDtGsQyvVNgN3CPTEkscOzq5QmVthFT2FLy
	T4ioIlA==
X-Received: from pggh8.prod.google.com ([2002:a63:c008:0:b0:c99:aff5:7089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:110:b0:3b3:65c4:c680
 with SMTP id adf61e73a8af0-3c08ed78deamr3358350637.25.1783381623562; Mon, 06
 Jul 2026 16:47:03 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:47:02 -0700
In-Reply-To: <20260526023515.288829-8-rick.p.edgecombe@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com> <20260526023515.288829-8-rick.p.edgecombe@intel.com>
Message-ID: <akw-dgBE_dycts0o@google.com>
Subject: Re: [PATCH v6 07/11] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, tglx@kernel.org, vannapurve@google.com, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, May 25, 2026, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Use control page helpers for allocating and freeing TD control structures,
> such these operations can work for Dynamic PAMT.
> 
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically. So the kernel must install PAMT backing for each 4KB
> page before gifting it to the TDX module, and tear it down after the page
> is reclaimed.
> 
> TD-scoped control pages (TDR, TDCS) and vCPU-scoped control pages (TDVPR,
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
> Assisted-by: GitHub Copilot:claude-opus-4-6 Claude:claude-opus-4-7

Exactly what assistance was given, and when?  I certainly didn't use any of these
tools, and given that Claude Opus 4.6 was released after I posted the v5 RFC, I
doubt Kirill did either.

And in my strong opinion, even if AI tooling was used to rebase the patches, I
don't think that level of "assistance" should be presented this way.  E.g. I would
rather a more informal:

  [ Rick: enhance log, rebase with help from AI tooling]

Because unless I'm missing something, claiming that AI was used to write the patch
is misleading and disingenuous.

> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [sean: handle alloc+free+reclaim in one patch]
> Co-developed-by: Sean Christopherson <seanjc@google.com>

Where did this come from?  I don't think me squashing two patches together
warrants a Co-developed-by.

> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [Rick: enhance log]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
