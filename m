Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF3439005
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986521; cv=none; b=onbDJA/WP7XWVv0lO5BTDJEuqHJYzaxVPX4GbWiQhA7FUXkzQVHZNLIRInd2v6fAPPxvz4RFG0vJ5TtxGJYs9glFg1/AlSillnllATd2cYV4HwcdNDbTQ7uUPKXGyJZ8ZkDIMqzCi8CwdXRc8jk2HYXKFSLH920EfaTNjOJvJBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986521; c=relaxed/simple;
	bh=7gYcfnNtAhe4lnRIsm+c0Bt9B1ZgRgZTPX6Ou1RlEJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ie5wcGELefPU6MhUMuYVYrmVMs/sjAy/m/JWgFEKXZBLfrmE3Lm+QY4ypLFUoc6mVDWKUPDA89HYCFXl+7gw+9lIG0FtT4Dk8ymJ7moOMEj7W1703tRTwgQjdauD3fmWg12INlMsYXg0AfIak9pbCniuw401WaWlXAi0HEnvvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkgPUsp/; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkgPUsp/"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c88e5f4aeso3021844c88.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986519; x=1778591319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6eoolunM8+Qnu8GKjHPLpBUZh/8jvI3CyH2eEbHLBQ=;
        b=DkgPUsp/2fcTgeZ4ir2VQ0CaxFGtQzKwo2hlDaaYpQUYJzdXPxZ1d4RG9jpKt+aCbA
         zgc/sDaOacURsKLDLYAwX1yJ7Kc09gy5EHBgdUEkKH7urf/H8dE2fUSTqf8JlYMFNXkw
         EEDfrcX241rZvyvdkO5tZTypztf75nw6MvgzUv25TWgoRWISzxM7mDH+RD7jjfHLNHzZ
         +lEoDu0gooOTVQ6ubxJzutRlNPpJwrBeOE28lxHP+X+IStHZbyPRg8cARQtKtR+c6OvQ
         BUkKI5o5LeWSnbLu+vOBksSXcAeRGrLOE8ECg54FqW4jT+jxORVl8nbLbhM60VtGAsbx
         2KtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986519; x=1778591319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L6eoolunM8+Qnu8GKjHPLpBUZh/8jvI3CyH2eEbHLBQ=;
        b=K27K9LzglaDmpLmRgHEpejapFv8XqBhobn2rtR27oTkMMF8vnZIka0kMPBhik40C7n
         1ZO58W3kUL6S7v7uZ1Fxfl7fL49sKuezTljiMQPoaTvx0EjaicQLkIIP3IROcrrnw9AB
         G6s28pRQUA4IL1jk+gngYxv7ZU5pmup88KN0oY1R+Etb4RqzetQnoMCI97Ck0b+5gkfx
         3p+VJQOQ1jyVUkWJtIiWq5Za/HvbZByK+MSWlrAp3kk1TFyHC3k7TfOQWx0adXXdW330
         RqN5SzVoTwn5iuR8prqaEhVzdlFSC/GRLN7D5Nv+EuBKr8ate9D7imCgIGywyUM8aTth
         SE9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/s/fcmthvNMvA6sBfbV8PMG8TLzRvAWxGQZcAEETAcWebrBf7QH13LFmZ053ewR1iZ9zogwCExl3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLubrKQjOoPEd9yerWrAg0X8GP3wSzBKZYy3iMYJ9Eyb7L2UbL
	TKnfCutqTzw+xqyDwTZDVGYW6Kq/xYLRupjnx/jUm21gvLTt139CDnhq
X-Gm-Gg: AeBDietN2zvLViLxjO5OV7dCfJqVSzJyOXGihCx/mNR8J0yfrIz2lme2s6in6pDy1Bg
	rIsx5JWI/f6dpj0bWQRx2+ebXDdej1ANq8wCC0khw0OKFgCEztbGrfQVHdhQ25rbGeYaaMHNXWh
	k+gEOSx3+eBfN2A9eHQQnaoW2eH32bihaZ3GewkEK9m9xxoGuS4JaRSCC5lXf5FCllI+89y48wH
	t3NgYQRdGJdX0GlpDGcA346FVLLKDpOFIf2A7CV5oo6h5fXmQ5rDC0G6C7EfuMTFcsdb4NA/tTi
	yp7fYROFnqotnwDJ1cQTR3/pOCSlAlJ1JZZIabK6ga3rPSlVwQJZEug71nfpdAV/0Y0h7enaZkl
	e2/LCwp5q61CY1H0lUVmDc1RIboBAHALawStdBfGCLGbGwaTrLHAJcGsgm9pL1wXZfPICKk2fV6
	UHIaXixFbH1OiB7VWxM7HrO2laoDl7vWlzdmjDWOVsJ9tW9xmnBjJhrR2qtg==
X-Received: by 2002:a05:701b:2507:b0:12d:de3e:86b2 with SMTP id a92af1059eb24-130a9ffb6e3mr925456c88.21.1777986519483;
        Tue, 05 May 2026 06:08:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm23229783c88.10.2026.05.05.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:08:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:08:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Philipp Hahn <p.hahn@avm.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Hahn <phahn-oss@avm.de>, linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] watchdog: Change suffix .txt to .rst in references
Message-ID: <955dcb87-5a78-47c4-99ad-23e77d7f599a@roeck-us.net>
References: <cover.1777972790.git.phahn-oss@avm.de>
 <bb1aa3129d5e52bc4c8e1ec3340b88f80f726fef.1777972790.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb1aa3129d5e52bc4c8e1ec3340b88f80f726fef.1777972790.git.phahn-oss@avm.de>

On Tue, May 05, 2026 at 11:26:12AM +0200, Philipp Hahn wrote:
> From: Philipp Hahn <phahn-oss@avm.de>
> 
> Fix link to documentation, which has already been converted to reST.
> Also remove apostrophes which are no longer needed.
> 
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Applied to my watchdog-next branch.

Thanks,
Guenter
