Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDA27BF89
	for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 03:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343288; cv=none; b=eBkVExZrVd+jKVh3eVgSpuXAkasbcum9Gxy2LNDSw17yc/kPjdePzVaH1rsXGRwI95kDF+TmujGzeJcFVGj/4AT3LCrQoHO5R5MA/JgFBIIX1k5G3CS0WJ+5KQph3hIv+Rm/iYzhQYHoBMWixBHUW7eGXIzGoflRa+JbKdY5PqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343288; c=relaxed/simple;
	bh=tdqBmESetdGGPc6KO5x2xTxdoiBPMTYDt3kvVyCIxUM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZSj2/WPcHA00oKYGbS9tHnCRFLkYmAUR76Gm9cIiVQXvr3tKiD9wy4or62m8rVb2fsbglIn+0jE7SQYFUCep8jcEVdEVuPIpPVXVTKTb8zs2/E6P03rm6UvUXUBn2eR+1mLGpStXHKhHilqtlKgNcbGvZVU9f8zO4LYt+78ky8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=toUiFLMT; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="toUiFLMT"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22650077995so21254515ad.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 20:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744343286; x=1744948086; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7dlryhVy6NeWg3O2Okngw+V+H7NewUDTwovui9xGS0o=;
        b=toUiFLMTfFq4KH4yzXIU1qVJ5/CuLkaVAHkcbEfKieMsrmDYyyvZcKPw0WY4bKJa8j
         m9ivc8JAyL5v+4RWKuXWy+dd+ZtCe49KunVI4WNrDDHpumnzexD7opM4aXtx9zhR96SA
         CoMlOpS2M1EmgAy8YQXZLuhymB99mAVp4U7AdDgP62gGXkGkZS1iat6Ap2CiBbwl+Gbv
         N2zeAk8RaguYFUnACOnOvyiFVGfVI1aNwwmYHyLesYYwmFi0nQckrHiUBD57zjbZwFhp
         OdRqLLq80Gx5Y/H2ni3NxFoVwKnxHPasgDUoLn2MyvBPc32/JZPeGep/wTHM/J46gvWF
         5McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744343286; x=1744948086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dlryhVy6NeWg3O2Okngw+V+H7NewUDTwovui9xGS0o=;
        b=uVRZf4ifAek7Zs59f49YAV8q4rVQjqgGPoEC1DaP4AAHLoTancimfTLIeIUJ7BnhsJ
         ODo6VDr62XL3w+Vo6Qj1ONh7/e/FaukHSujXcnamhJqxk/I+Gyi5pzeqO6wSVmLVncZB
         djDc55k1VIZpypW/XYpa4HnsRkyBlBhCquyD4nwzxnBi7e2JpFjPuhZaEQcp4KPNtqsq
         WSukZ4wQi70cP3AScg/e65uM/nKsUbpSjxMfNI8WyHKvY2+UAtVcdBRYGdAvgCyVP4HC
         96Va0LzCFsTJRr/0imECCGSMrsOHb2o4FNMZOT4+Xb831+tI+tsaHg1Hh20qRBm2662U
         8vYg==
X-Forwarded-Encrypted: i=1; AJvYcCU9M44haQvzLA8SO0+cnTS4zms+8MmgSW6og3TZfE+opRqOV+pxfKm/eRaEALProqulgFZv3CWPbAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe1wco8dOx9w/VWdMhkFbLhXVKScJcwV1chBmjR+266A3250jE
	9ay0IDOinD8xR2XIelMPXh3MuFzfaqbS38dNCmOQD8gV28nwi7n/vuSDKy5X+Nmu/ilqx3ZNUKZ
	Gcst/nYp6xEcW3tPeSQ==
X-Google-Smtp-Source: AGHT+IEOZPbbuwHUT+vSKb7YqC/0TcONKVVdEEEvZeXr5rZzrszLtokHPfZVQrxjUuNtcfTum+JkVNbqScaVm0pW
X-Received: from plks14.prod.google.com ([2002:a17:903:2ce:b0:226:4240:2027])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5cf:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22bea4efe58mr23857515ad.40.1744343286238;
 Thu, 10 Apr 2025 20:48:06 -0700 (PDT)
Date: Thu, 10 Apr 2025 20:47:48 -0700
In-Reply-To: <20250320015551.2157511-13-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-13-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411034748.1781232-1-changyuanl@google.com>
Subject: Re: [PATCH v5 12/16] arm64: add KHO support
From: Changyuan Lyu <changyuanl@google.com>
To: changyuanl@google.com
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, rostedt@goodmis.org, 
	rppt@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 19, 2025 at 18:55:47 -0700, Changyuan Lyu <changyuanl@google.com> wrote:
> From: Alexander Graf <graf@amazon.com>
> [...]
> +/**
> + * early_init_dt_check_kho - Decode info required for kexec handover from DT
> + */
> +static void __init early_init_dt_check_kho(void)
> +{
> +	unsigned long node = chosen_node_offset;
> +	u64 kho_start, scratch_start, scratch_size;
> +	const __be32 *p;
> +	int l;
> +
> +	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER) || (long)node < 0)
> +		return;
> +
> +	p = of_get_flat_dt_prop(node, "linux,kho-fdt", &l);
> +	if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
> +		return;
> +
> +	kho_start = dt_mem_next_cell(dt_root_addr_cells, &p);
> +
> +	p = of_get_flat_dt_prop(node, "linux,kho-scratch", &l);
> +	if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
> +		return;
> +
> +	scratch_start = dt_mem_next_cell(dt_root_addr_cells, &p);
> +	scratch_size = dt_mem_next_cell(dt_root_addr_cells, &p);
> +
> +	kho_populate(kho_start, scratch_start, scratch_size);
> +}
> [...]
> +static int kho_add_chosen(const struct kimage *image, void *fdt, int chosen_node)
> +{
> +	int ret = 0;
> +#ifdef CONFIG_KEXEC_HANDOVER
> +	phys_addr_t dt_mem = 0;
> +	phys_addr_t dt_len = 0;
> +	phys_addr_t scratch_mem = 0;
> +	phys_addr_t scratch_len = 0;
> +
> +	if (!image->kho.fdt || !image->kho.scratch)
> +		return 0;
> +
> +	dt_mem = image->kho.fdt->mem;
> +	dt_len = image->kho.fdt->memsz;
> +
> +	scratch_mem = image->kho.scratch->mem;
> +	scratch_len = image->kho.scratch->bufsz;
> +
> +	pr_debug("Adding kho metadata to DT");
> +
> +	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-fdt",
> +				       dt_mem, dt_len);
> +	if (ret)
> +		return ret;
> +
> +	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-scratch",
> +				       scratch_mem, scratch_len);

While testing on ARM64 today, I realized that calling "fdt_appendprop_addrrange"
here intercedes a bug that prevents consecutive KHO-enabled kexecs.

Suppose we do KHO kexec from kernel 1 to kernel 2 and then from kernel 2 to
kernel 3. The firmware DT got by kernel 2 from kernel 1 already has
"linux,kho-fdt" and "linux,kho-scratch" in the "chosen" node. And when KHO
kexec-ing to kernel 3 from kernel 2, kernel 2 will __append__ the its KHO
FDT address to the "linux,kho-fdt". Thus the "linux,kho-fdt" received by
kernel 3 contains 2 address ranges. Kernel 3 would fail at
early_init_dt_check_kho() above.

I will fix this bug in v6.

> +
> +#endif /* CONFIG_KEXEC_HANDOVER */
> +	return ret;
> +}
> [...]

Best,
Changyuan
