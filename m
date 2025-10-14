Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166BF2F657E
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437445; cv=none; b=f+8ZCS2xhsi4xxvJq3gdmo+EGKrWPjK39Jzp1JNAtsGrjLaX2drBzM0LXKHWX90ppzfRxQ5jmYl5l4zTf/OSBVS333lt5p4ImQwBErpbuyb5A92PzYv/myTqAVpLmegC5b8uVAMg9KKfhye3L7YY6poWPg14lyjoYXQdbMJl6uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437445; c=relaxed/simple;
	bh=NvHrsqobRMlVNo+tAxu9F71BW5DWp04J4+78E6v6/2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SeaxzHO9LkCpyWAdD15zVAjnbSEUY1kPMw6uLbrDFtQ+vuBaPhvo3OWgJ4Jzs3RN5cLs7qSn8cNkaywB7XwxTKB0/3brRCr6ir09KQoDxwRlClFNQu4eWIA8TQm66BpNjuba9nntyoIZq9x3CHR8WUqLbqSwf03eEfBp2ndhY5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJGus4q+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJGus4q+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so61084595e9.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 03:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760437441; x=1761042241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B27CnCtnwt2IGtR8SnAOo/nO7i1YaXCeSpoBrMXO7I=;
        b=nJGus4q+SYUIGvndAARIM3qO3Lktr1Z0SOm1vq1+sjfRbXZeH6sLkfSF0S7jXNKoAY
         Dy8fFkrCnXxwbaUC7wSzd3cnb/ANQpABHu0Zsjs2E93SgctEem8y0v783q8iifANnFGI
         DYTnlBoEV+cf+AZAn4fh513Qxvx416dxglUYMCBIm60Tixd2wluyqzYRLmRKShx1ir7z
         bA4iRcINkApQgVwOtfchyWghh3EB91tY1ab7RGV1lNX3D9o35dlYF/FwyBynpK0Vbcte
         +bdCCamUp1Jv/MqnUqCwEIy/ojaOTqskhisZzL45ct46yDBU7IHiU4H+rkzzuVD3qS7T
         /k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437441; x=1761042241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2B27CnCtnwt2IGtR8SnAOo/nO7i1YaXCeSpoBrMXO7I=;
        b=RYnqf7KaT082NbJz4QNxEOIvpE7vbbDYEaWU7gt13LbyVMe/QdYnmrpM9LlziRxRY7
         CPjbbenXj3zGnR1urBTqFAnho8K+qbluB38g9CZHB+vBmeyzAVDaE5VovrxmheEY5pQg
         wdz757Cp5DE7dLGDxQg9sXonOK/fxTM1ENhV7PVZMe8hWBMbFTimLTfkDfMeVsUOLBGo
         wg0SM/Mf+sbegwCmOzkD/l//ST7H9yXkP51MWbV5FiD1mn9GIR3uCYKRFT4zZ38Zkx4G
         hSv0xuPc6qm7OIdYcZkYUJIBj0LFqGbG+387bgUXYHeI2skEuAXL3xZuGsMqG6cWMP7r
         fPZA==
X-Forwarded-Encrypted: i=1; AJvYcCXnB9g3U2lEvrBg03c9VzrjmuFoaAEzqijbiENq/L0L8u38gkiabz3XFrWAupgxrRebYSxVpciWfo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgb4H6PYwDr2bBnrLtuqzD0UdTNAa2pgWGqyJaA0IxYiHLB1DH
	TP9cV7LRaEFFrP4UmGtwbdJUiRTK10dnq4fCe1dKb0OVKN2xNtXCxKDH
X-Gm-Gg: ASbGncsTZBTX835Grnk4YTZgce9lXwbnTTf8qJ0twUNnXFGv4/jW3hXT0dPre/FXOID
	YSOhof7qwGgGOY8XT7rUF1i1G/NL4E+t5/r8NvolVHQzieHW2rgR2gbRRME9FSbgTZLV7X4kn2V
	VfXoV4601aw6dm7sicKSufQg65Rd5xBtoW8By9ZwLPlJqeKoUn3+IwQviNpdcm0n+eO5nTl50SV
	WSQJw3laJx+hWNy24oRLKvUMsMe3WIWHBeXSSdrLxuvXVBiq+I2AU+ix4DCHTiTIMXF1z6IySwK
	qGzaFKHCj8+T2h15CjXPCZb+o2NxGwdF9HroPkUCXOmk0AP/h+/sr0mUIxLqP6dTLfAeWwFznfv
	W/VY59687P1ed5lEF2/0RNt6pSWq9Q7UfcG+nq5OjII2H3Jfm95tVY3TrajrLtxoVE/3+FMBQ62
	QDY20R0RokXXvOwHwT7g==
X-Google-Smtp-Source: AGHT+IFJLN+ZyNIVUulNgloN7eKBRUWfhH8DTaEyEj2PWqBPSZ2eXtCGpbEULmWHbXarmuQpgFVGnQ==
X-Received: by 2002:a05:600c:4688:b0:46e:4372:5395 with SMTP id 5b1f17b1804b1-46fa9b01ff5mr167772905e9.25.1760437441227;
        Tue, 14 Oct 2025 03:24:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf70fsm22150016f8f.27.2025.10.14.03.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:24:00 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:23:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng
 <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland
 <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [RFC v3 1/5] documentation: Discourage alignment assumptions
Message-ID: <20251014112359.451d8058@pumpkin>
In-Reply-To: <76571a0e5ed7716701650ec80b7a0cd1cf07fde6.1759875560.git.fthain@linux-m68k.org>
References: <cover.1759875560.git.fthain@linux-m68k.org>
	<76571a0e5ed7716701650ec80b7a0cd1cf07fde6.1759875560.git.fthain@linux-m68k.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 08 Oct 2025 09:19:20 +1100
Finn Thain <fthain@linux-m68k.org> wrote:

> Discourage assumptions that simply don't hold for all Linux ABIs.
> Exceptions to the natural alignment rule for scalar types include
> long long on i386 and sh.
> ---
>  Documentation/core-api/unaligned-memory-access.rst | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/Documentation/core-api/unaligned-memory-access.rst b/Documentation/core-api/unaligned-memory-access.rst
> index 5ceeb80eb539..1390ce2b7291 100644
> --- a/Documentation/core-api/unaligned-memory-access.rst
> +++ b/Documentation/core-api/unaligned-memory-access.rst
> @@ -40,9 +40,6 @@ The rule mentioned above forms what we refer to as natural alignment:
>  When accessing N bytes of memory, the base memory address must be evenly
>  divisible by N, i.e. addr % N == 0.
>  
> -When writing code, assume the target architecture has natural alignment
> -requirements.

I think I'd be more explicit, perhaps:
Note that not all architectures align 64bit items on 8 byte boundaries or
even 32bit items on 4 byte boundaries.

	David

> -
>  In reality, only a few architectures require natural alignment on all sizes
>  of memory access. However, we must consider ALL supported architectures;
>  writing code that satisfies natural alignment requirements is the easiest way
> @@ -103,10 +100,6 @@ Therefore, for standard structure types you can always rely on the compiler
>  to pad structures so that accesses to fields are suitably aligned (assuming
>  you do not cast the field to a type of different length).
>  
> -Similarly, you can also rely on the compiler to align variables and function
> -parameters to a naturally aligned scheme, based on the size of the type of
> -the variable.
> -
>  At this point, it should be clear that accessing a single byte (u8 or char)
>  will never cause an unaligned access, because all memory addresses are evenly
>  divisible by one.

