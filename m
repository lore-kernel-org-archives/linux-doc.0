Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA54620DD66
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736932639; cv=none; b=N3fZA0u5v0F3G0vXmtHQLb1dTjTH+GlowlK6pRX7AmL4JuoA/fgG+I6W9SSlT4OJWayc5ASf5yKaByFnKE9I7ObIyAZ21DQpZMyznFnUpzr0Teqpngdkc6MI3S71oq+igsUUY8V2K3Ouq3fc4TSOiDYrbKv+XkfsFWWY/+0qQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736932639; c=relaxed/simple;
	bh=GOGQNtJtB4irbMbSiJEjSkZXN0utpLCZZos/RwC6DhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLyRcIfHIMz5r/pGa1iadfnsJkI7tIMg/xfOOw2z5ANpRa06SS98kxBSeYicnN+WphcvulfHg9MLLA6z0+8txRo5QIxeIqQQV6+IdNo1+TqUxaH08PX4WcJjMaIH4a2h60q+caHe/TI6wyz3yFh9SZLVLkRw1Yv+toKqZu1bBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=K6kkjoQ+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="K6kkjoQ+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43635796b48so3648235e9.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 01:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736932636; x=1737537436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPR0vSrKJLMo0r7/wQPbLykYZGu5on6q/CBisXInbBg=;
        b=K6kkjoQ+iGsYsC/DDehG8vOPCcuCm6ZOYJXlt3mubArtloeLEffQcFr2QksUPVVM9D
         tKtO/L2uiAzBEeMwKbiYvMd9cRbf8neE9QqtQWBLUe40nnbv3svi5OKU3Sbbf2zZTijp
         aK1jPKHwHDEM+pQNlrosHkxYWKUz8TEh9Ii8IukXNxdDCMYtqITdGQZYr+g3GXx+b0TP
         qyHfT0EUsX0jivTqKkhQUD26lw0P76GBA1usxTkgeZb6MbUzgMMeMicfEqgjBKAlHZnx
         tb5N4MbR2L1E3t7krE5ODRjoRkcp9NhAN9M89Cm1jvMq8cstecJhgHQMJe0YnfBQIxpv
         JP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736932636; x=1737537436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPR0vSrKJLMo0r7/wQPbLykYZGu5on6q/CBisXInbBg=;
        b=HpWdJg1i7J4VVhi8cGk4AjmJ8qu7h6HaAi7HYvtkon5vFWcbnzkQgwCGUT60rlM6fQ
         TVoPwJq2usHDCROaGOa0dkBNvtk3+x+lMJxinxBiIIjOAPcpjH3l49BYpgUDUso8q+jc
         EBnMvv92xkGRt+/4Gdn9kXubPZI+eCpEZ++3PD7rh6bWV5Ce27p/IdmugOcXu47SUJPl
         jmrUUElRnUgP7w8wuMYeccATkZ+vnA1zqowoMDuVtBriE5gaduKsEsM+NXnruC6YbIxb
         sXgWE/mjgSPoEk882tXp9a6NxYbxNh/zr+OBPbm6imBf+feeWZ8z4eehol3yESvDJlvU
         vFkg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Fp+iyfKpZy9Wn824q27d9ZLlvm1l0z3cYq0WZGd9vmC48lT3Zx5C/w3SW7HLHrKp+7pw0/6W5D0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbOqtgmh4qcr1aFpH7JHJ4leA4pvStIZXQj69toI7J8pfEkiI
	1yipl6gFh/yN4VsGWNWwy2hGdYzHSSKuRpWzVgzXqBbNluWZRFI+doU/R3q0MIU=
X-Gm-Gg: ASbGncuwG/qHIITa6KvctfKsdOR2RW32rzzn/G6NW+OXAtlvY+6LY24uUEQ8gWhjrtk
	nq4zuGxJFiv5mZivyWRjjy9+yZb4eksX3hwAKbuTf2f33E2+5Flr++l7WE7dZOKznrGL+TIgzGh
	oVy92DVEgmbouq/aNQyuyebP6C3FhXxE0rEpfjC4xhpitna0rwWitqtVZn5E/pdO3rWYkk5ZdFy
	2TtAEGBob9jb845g3wBONqdEWO2/hzWT/K7EV39QNxdMIdMhZuW3S1RbkHqfDtpkYMky2pX9EyK
	vmoOdGH6qUg+FSQP+9UlwZqhf9ziHSLlXpoyF4dAZw==
X-Google-Smtp-Source: AGHT+IEKwUbajcfYL3oDiXKeywStAiA7ujSjd3p63sWc1z3chviVk4GQ+jyIXySBHFmI84rSHpJJ0Q==
X-Received: by 2002:a05:600c:c06:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-437c6b26e74mr15223725e9.12.1736932635833;
        Wed, 15 Jan 2025 01:17:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ad59fsm16180155e9.16.2025.01.15.01.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:17:15 -0800 (PST)
Date: Wed, 15 Jan 2025 10:17:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom extension and its
 block size
Message-ID: <20250115-6a3da5301a44634ae704491f@orel>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <20250115024024.84365-3-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115024024.84365-3-cuiyunhui@bytedance.com>

On Wed, Jan 15, 2025 at 10:40:23AM +0800, Yunhui Cui wrote:
> Expose Zicbom through hwprobe and also provide a key to extract its
> respective block size.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  4 files changed, 15 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
