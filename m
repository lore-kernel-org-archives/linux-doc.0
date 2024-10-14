Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51E1D89FA
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 23:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728949762; cv=none; b=qibGDKMb2nmYKMyxKNJ51uA4gZxGbkd/XFRQkwQIsJVVsEGU9PK3vseUphEJRZ8X35Xt11fAjAjb4DQXOjNbIrhxicH7trMmJNetyjNp5XO4IMM+RUxDhlz9VUF7P2tREb0Np3/tWnhETh+05iiVpa+G30pQD8xB4+vrKsuZg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728949762; c=relaxed/simple;
	bh=1SZ+jfinI7KnF20uWq+5MiVKe7evA6ps9MC+h5JnAKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqzxrkylH2B5FBEHqpK9YEV/OrncFldx94W+lFzo5+MOT6s3E9AIr/32V/mkwBiixI2ncXERcuJTCaEhfDy5EdNmylRi/qq0G0deRfZRlTeFqjBg08qxRzNWvHQUSDOwgknKRBbC36stGx5CbISWz1nnALesk0SGEYi2ELmSbmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4gZIBAbm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4gZIBAbm"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a0474e70eso291994266b.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 16:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728949759; x=1729554559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SZ+jfinI7KnF20uWq+5MiVKe7evA6ps9MC+h5JnAKA=;
        b=4gZIBAbmXgMngcMGOdEzLFMrVuIhioYRlNLl7eDALx9Od7dFttDJ+fPgSm6qLuAqXq
         zvrLFPzqR2Fz2ucqNevLXwsCwyTbYV6oF4cvjjjW1mHoNE83439TzUWbBFy8xD2PrMG8
         aE1PlRDeP9H6T0KW6tMJL7hJKIGlOjIwjAq/SX2wGAAuOT80wagHxyGwEotpFtoCsS1d
         FjZ50o72Yqza+ImIP3hbMg5GdbvJZjUfgXSxNpMm2wcfv3FTVB0fRlBWh9VjEA7GyxyD
         6Ajg2gw9ui4JmA40AEQAWtFkNzvukfjsY2Cr19+j+qVFIbLqISZei/3QGZ+Vo4ZopgmX
         Pywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728949759; x=1729554559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SZ+jfinI7KnF20uWq+5MiVKe7evA6ps9MC+h5JnAKA=;
        b=tRLvJ4Sa+kQPBGUmoZrdqtTzY99fJnGWuirUHoJfafNjEenTX72NOGOOLaOMR8ib3y
         bEZG0cTQW9yRt7UoBzEwc/PIXjzmcEHpKvIDXhcvTIpUGYdo3f5R33U9nw132Ox83EFz
         DxZCyyjGezFibGCohsVwP5IivHRmUNfIPCnk5tNqcaF6zV6iRsiws+zlVDTqBkErQ0hy
         lFo+mQMwWypDkfw91QS9LeZTXTiYACHwvgMX6miflDuyITKZEHi6+3ob1ufBniY0vx/y
         hVDjVS8VOgx+vGGGrSiIJ/PMpMBfhGs86CWU5tRBcbBYYVpymSo06btfIMPi+q9OtkMU
         DHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkSoOA+0MKAbSdaIEqIKvVQvCaK3mv9b+wkMdFjCRasGVgPUC3pn4u1jjC+nPkEzKvB5aAk+L0EBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqKRQeVziVw74nfseGqcXCOgmT8LTE3Qbqx4CPDp1tLyHlQ63
	eKB3UW3yIdHT6wljIHj8qx3be1jEmgQAckptDcTbwbiCjUZb1My+sws54JcbD6iK0ys0//9zyUe
	JLd902EYZOJsrxxOrrnFRxpxG+wFCSFT8uvGv
X-Google-Smtp-Source: AGHT+IF3LTkRo2bNnzsq5dT0NEdsT3wmUih6L0PdgKsa4EEm9X0C1vz+srf2kxl0ec7RLeunLrfhzidYV/TpVSBkxmQ=
X-Received: by 2002:a17:907:e6cc:b0:a86:94e2:2a47 with SMTP id
 a640c23a62f3a-a99e3b5a86dmr831600866b.15.1728949758341; Mon, 14 Oct 2024
 16:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014203646.1952505-1-surenb@google.com> <20241014203646.1952505-6-surenb@google.com>
In-Reply-To: <20241014203646.1952505-6-surenb@google.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 14 Oct 2024 16:48:41 -0700
Message-ID: <CAJD7tkY0zzwX1BCbayKSXSxwKEGiEJzzKggP8dJccdajsr_bKw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, 
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de, 
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	pasha.tatashin@soleen.com, souravpanda@google.com, keescook@chromium.org, 
	dennis@kernel.org, jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 1:37=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> Add CONFIG_PGALLOC_TAG_USE_PAGEFLAGS to store allocation tag
> references directly in the page flags. This eliminates memory
> overhead caused by page_ext and results in better performance
> for page allocations.
> If the number of available page flag bits is insufficient to
> address all kernel allocations, profiling falls back to using
> page extensions with an appropriate warning to disable this
> config.
> If dynamically loaded modules add enough tags that they can't
> be addressed anymore with available page flag bits, memory
> profiling gets disabled and a warning is issued.

Just curious, why do we need a config option? If there are enough bits
in page flags, why not use them automatically or fallback to page_ext
otherwise?

Is the reason that dynamically loadable modules, where the user may
know in advance that the page flags won't be enough with the modules
loaded?
