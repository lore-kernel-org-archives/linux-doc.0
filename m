Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D89314D2A
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128443; cv=none; b=h+8I8DTX+HmLACpL5vMahKQNAyT4iICZTiQ25c3MrShOxnt4F6/XEyjylPKsZCVHTZZ9aIsHeX11YETq3yq9uoZjNCFh5Ogo4ONWSPqHjYpKJrs6wGek8DYEMWiL/gNe+oIQrZEniwqrAUHF32KOjyIDTmeNQEUpbGyoN3DZ/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128443; c=relaxed/simple;
	bh=bsLcKTPJEYIr6iWd2hSD2/QqBkscjLQjYwtElmBwUuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppvFl6HLNeWwfJTD7YAovDoUbYDYKlBH0RPaqugLniS91KOQ2xLbl3WhNT/5AAwG1sfS5MeyywV2jfmvQ5ZR71YZR68jSB9UwlcHZkwKyHsw9ZqjYMxQdrvmD+Ks+ftCDuYKMnkvknaxIB7ZX2ZXdlmrGy1HGYquRr5muagcZW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5eXYtvb; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5eXYtvb"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-33c4252c3c5so4841822a91.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761128441; x=1761733241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+BERCfgvcR5X/QpiR51/cu4DL63bwSFg1M/A5GNtaI=;
        b=Q5eXYtvbRn1VEpYB+ckss1F1GCQzUuvuD/3fl40yNikmpxtheQ7sMn5qQvpyDoulT+
         NuvQXfh9fYXtofOxyEbl6d7RyO70TDEpg64rLRY8Z4vUP9uKQlEXiNkM1M+iM6F81x/F
         ua9PH5RaMRdzQEV2yy93eyH5PdcySO3Av4XbIIZheaM0qTCVtAjaw4K1QPiveyzwKtZk
         IHMzU7jBq7zstnoUb6xfZhwSbD/kOa0yLlP1eyBnchlHBEhyO1/otNkfaRLrm8zT1jgP
         a1tsraAlVachrcTJG4BJNiELwejevit8YN2V0suucIcaXRrV24RUpbMYkEFrEBAwVusc
         SddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128441; x=1761733241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+BERCfgvcR5X/QpiR51/cu4DL63bwSFg1M/A5GNtaI=;
        b=qqbZIH2ZmFWTmPxJQXZ5t2cyAMRA0cmJNWW/GQsFFG0q7vzohDlcgMFc02qTr/T0nm
         WS6DIfjd3+CHJJ4xbryqzZR+dfAB5GlnuBQ5UAfcW/eGpJPfTYNa8zRxaIxE4uFw1xfK
         LhscaNLw2/IjZQq+gcvWS92Yuu1UJbL+nJ19dS4OzJBnN5yeaLlxcqKwd9mbYbbsLhrz
         GvhMs2ercfegyrKGGNoqnKjhohuU23jqx+eIvzvsdDnoAmdUlcQuqQb8waOLaaw6LuRA
         Vzy+dZXGbMlowBca6UROeurRD/PJoWWSG1S0H8/jz2B8/gvxlCGFSvy9wiTFSS+zR8+n
         GiCA==
X-Forwarded-Encrypted: i=1; AJvYcCXNGiSe1uCGDccqwjG4PVmlJbCLtJuDLUgCZJS3xe8yyQAP1b3QVMFd3Fyaho14yrfTrAlW64Bww64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6aNVdKeBPWBROiGci8EjQiWYlCJYvLGqzCTQ+3Bc1pkjnEfF
	CyfPv5mk8dWv6yEFygwE5VwPMIuFZA/VUzOPRzpm5I9rCB8BXBQq2b2wpNlhitOP9nI=
X-Gm-Gg: ASbGnctCRwHS9wLnChMWtS9oIMqQguRI8S4XZ7prAyszIxEWgvejlyml935nW2j1QLO
	iRVOdHG9UjcywkiDZmO/JVeWb5rBWsvNNtku/8GiQ+2eSq8b4bO6pLrkYrGaXz8YlqgCJ2UwOSK
	L+O50ciHpR0rk/Roxnr+zACWbm0ubQGApZ165Foz0hbZNf68SPD90t6cucKz9lF21fSZZkVmvch
	GCb2xcXcEYlmZIRPZD28JIhxiDsmu2iMAPEi1wveu5UY0qMBE/K9Qeb7Y0nFiZGag87DTAYWBJK
	IVCPxJLVBeqtmfkRlvjKlGE7uWdHkYUPVPF5J7Gl6+9RjySZJDL9pXzVtY7Vg2QyZ36TVnwplYm
	lpFrhlf+HBKNDH4WrLlPCNvRVuvDXh7PWLm83kX7YJQZgreSkf31LqqMIRCqSRkpcYpVrrTVoFA
	D/uBeOdBylF0Nb
X-Google-Smtp-Source: AGHT+IEPudXWObjJLDv2XWqM26sgZsiKQXdb5QBSpUD/P+viWtBD0+IrqTmFx+e1SWZr7yyFfz4vMg==
X-Received: by 2002:a17:90b:5105:b0:32d:dc3e:5575 with SMTP id 98e67ed59e1d1-33bcf8625b0mr23541723a91.5.1761128440788;
        Wed, 22 Oct 2025 03:20:40 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223f0124sm2159272a91.11.2025.10.22.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:20:40 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:50:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Joe Perches <joe@perches.com>
Cc: Ally Heev <allyheev@gmail.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, David Hunter <david.hunter.linux@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
Message-ID: <a6yf3ms7smzjfcm54z7khg6g3zpepqwxcbhwzm74dk33famolr@s2at2tnyxoed>
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <5e11f1bacb6430e1331f02e3e0e326a78e5b0d12.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e11f1bacb6430e1331f02e3e0e326a78e5b0d12.camel@perches.com>

On 21-10-25, 10:06, Joe Perches wrote:
> There are many uses in drivers/opp/ that could be updated where
> the initialization is done after the definition like the below:
> (I've added the opp maintainers to the cc's)
> 
> drivers/opp/core.c-unsigned long dev_pm_opp_get_max_clock_latency(struct device *dev)
> drivers/opp/core.c-{
> drivers/opp/core.c:     struct opp_table *opp_table __free(put_opp_table);
> drivers/opp/core.c-
> drivers/opp/core.c-     opp_table = _find_opp_table(dev);

https://lore.kernel.org/all/45a64ff434a027c296d1d5c35f442e51378c9425.1761128347.git.viresh.kumar@linaro.org/

-- 
viresh
