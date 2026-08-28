Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917843A874C
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787955547; cv=pass; b=HEgQQxcSbCBq+k8axjXGITukA+we35ktgdsOKdkxIs+8k5BR6B6Evb5i/qDdyWd3h02IaDryf4lScWYT1ErXd5APq2f+6oULFVV9bVTAM149NFAFpUH4Y6IKIixXexyUzLnXqlqGkQ7WTjzlFeaKcTR/E3P+SNlxlIj5geJIDRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787955547; c=relaxed/simple;
	bh=BMIGDWFwkO1RXH8rR2UOhGKndRufLWtM6RTNgfHf9Uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARfQ7h5LgL1CbvYVZyNYayp0hkkcCAO6r4v0jvMUBmgxgEaqAgQ33IR8dpNV0sh/j9EOnjICAIbPzX3YDjvoQPsbG5n8Lj9zxYeI6MtjYhWBh4ZkId0Fe+OgPNZHDNV1DIv15iw4OR+VkPro6SyAr3O7SkdrOyQiHFNg8/4wPP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E3j6mVZf; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E3j6mVZf"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c10e86e52so47031cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 15:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787955544; cv=none;
        d=google.com; s=arc-20260327;
        b=jixg2HnOesnk8Dr93ClVz74Xl+om1KMGAmiVSM4n+KXiZPyrmC/syJBksj8e/BSgJR
         dkFufzylBW4UDeLLKD0eO+u0X2FyfT9CLzQycS2K+oGhrMI+6UliJHF21xy2kNJkrC1C
         labNzl9pM3hajw0Fjdq1PZgK9vTg6gocwQFvAXt1FZg575GxoWvaS57VFYrelqP/9/br
         i2OJSfGjeOBeF2YgKCGLmxWZ+Zr696JlbZmmdRXPopZelEfPMT2Kk1IfplkxLiiURTro
         vdnDZxVazXctnDYcWiQ8vGcCD7eS9Cf0MmPVkWKhbNps50vSJR5/9497xecsOxByT0Pi
         26Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        fh=FgVJJZqAxKQ/phV9SaS3sRvp+VzuLQZIp8huk1iqE9A=;
        b=WtXKz0rYNZZa7GIAO53d1AGRPZJem10pqqyU4P5lWlMS6toiZ4nXMEx1I3NGnpmtC+
         KLx2SncDXX0/qRUqJ5C5576I2Y677BqgD01i+/bCD+K36LEO9h5HwjCsEN/NishLfbrE
         3NhGbdk3WXTDWqvPfUKwIOwK/ck9P/zvPaJ4U8jkMC+OtFgmeUR85fpWTE3DKfO5jR1l
         PCek4zPPC2YvUvGTa+VzJW6k/yhfEaIs9fMxXPFb2nduwWvMp/1Au2U6yD4Z2voQgM46
         hSLBiqhNSHQKsAzgjZKtNNCmwoKLae02ObuBhhlcYw0Kel5c+HgGfhblqyMslu0tGeq1
         rfyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787955544; x=1788560344; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        b=E3j6mVZfc+2R0/xsFMmoqiZRFUt8BlgFX0tmfQUumgdM2tRi4iaJDaU5nIU5SOaGyf
         wTrC/K6vSXgmqZE2Va3x8oXsGwWcyUoq6SNGHEEe/qngfwU0VtiDSFnj+ueLw9/YOjok
         Y4MfGMZgZzHMAshYtHzEeSRm0XVJ75mmaiEuCHNhgdEn1l3gVAcGXjVg+swRIL1MNfaS
         0j4UL1XixaYTJP2x+AbwzhrT6LXuj86PlLjl38+0R2tILXULLOEPckPk76yGzdzlMx0O
         +rv4enFqzc6VIGM5RGpIkK3WPWEqoo9aJSBD1J71yFwvNvlX1vPPBcl4B8LAlRrPW456
         rjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787955544; x=1788560344;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Z06k1eL56A6jAeIm3cli0ZxCvEv3ToPuyXt4lMC1e4=;
        b=rCbnXxt3niAbw5O3uE0vTft1CasxgorWP04dEfRcyU4j8fFzJ2up1VF4SweIn30VBb
         rUj/FTVzumbXqtrHPrLE99tS/WLw7te/4pdlahMuF8ds4il3AQ5Pe3VILLPIYtl0GkxP
         /dG7UTR8NhTpUQV57SESd3NTXSS0Gdo6sI1ypbak2eEJotjVC3zZZ+W2YJq3r3E+V70V
         bjoQwz9xR5y8mbRkS8qS1TzaVedjfplnbC088n8GPOr0chp/BtoKkm3SjIRUlT2p+w+y
         +wwxv/5EXrCeZNr5Gi1Ox7HZB8+P+0Oe9u3KWJUfr5Bci/nU6ra5lcNcRievG155j4lk
         tCUA==
X-Forwarded-Encrypted: i=1; AHgh+RrFzQcZ7m7MR9fEHMjk99bAnygqipT9PY4wJ6revuNdFeiduav9nyz4WQiGPxHtybF9lbrUL+WBmrY=@vger.kernel.org
X-Gm-Message-State: AFuF++m+bjMlPn9eSdcYCzcelq/NZxa/jADJ4/hcO91RWxhYFGXu3M1n
	dodDWNSbZoBm+Tpuqp47oo71sXOjm4ZXsWspsy9ZEu4T/IC7CCENIo1v3Wo8yyvDkobiNBKaPd6
	PkNDaH4JYxH0XwoRHiYs+ibU8+6eVmUA5dF6b6Lvn
X-Gm-Gg: AR+sD12roEBYq0/qikypKsLNl3Z0CCJnkpAqTdsWP8MQiemk9KCnosP4FY9atMFc3f1
	cnV4evX7m3SxjskOubK5vDk3rp63Mf7rOgk/kmnCDYroT8V3qgF9ZNXw9no2g0ux9cWFwnSHXYK
	/7VkD2zthfUAiJGJsZLCc/FMDmVBhCL8BPJgwI1Mjnab5fQUgczozzFfbkWXvMKXYkEbfOEI5G+
	CIVpvFh6lZO8Wvkl7UxEVKBJdhSwC9Sf1LNbp3WoZq74JMJ9HGdzQOTp/Y7ns3RytnmkhztPWf5
	596UmNbBDyUH/O8jNCZZoiVqyo0oMzxwgBPLDnEnrafwls4Svh32wkpBgW03w9RB0j7lKv1+0tg
	=
X-Received: by 2002:ac8:7d8b:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52ff711656dmr4308141cf.1.1787955543697; Fri, 28 Aug 2026
 15:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-8-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-8-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:18:52 -0700
X-Gm-Features: AcwNN1VtKeCMrm5d0HiUDNcJteBwV9YWHV2SenRF5c-NodyaK5x5u2MCHt6fWJ8
Message-ID: <CAGtprH8XJ+SbxQLTowch3DR6N1NSMUKyVnGf0hv5N+iKWT3q7A@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] x86/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

> +
> +static int alloc_pamt_array(struct page **pamt_pages, struct tdx_pamt_cache *cache)
>  {
>         int i, j;
>
>         for (i = 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
> -               pamt_pages[i] = alloc_page(GFP_KERNEL_ACCOUNT);
> +               pamt_pages[i] = alloc_dpamt_page(cache);
>                 if (!pamt_pages[i])
>                         goto err;
>         }

If the alloc_dpamt_page() was able to allocate a single page (not
two), should the partial allocation in the "err" handling return the
allocated page back to the cache?

We observed similar failures internally with a slightly customized
setup which had retries for pamt cache allocations in the fault path
due to SEMCALL failures with older TDX module functionality.
