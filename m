Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A891112D1E0
	for <linux-doc@vger.kernel.org>; Sun, 30 Jun 2024 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719741197; cv=none; b=Rq07PjVtLY8WaJ0A3JCUDOR9rK1BGK8ZwfGLIEhZVmzX26mIlS/OKpC8IWOowAh01ICxwqtqt3dHWIbvUc9OYjI8iPfUJseBe/Zks1sH1nKpF55hLaGojOlw2qvYmZoCg7c/c++Kd6QzitZGCfiydAlLB48uoWa3JQWmwsL6+eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719741197; c=relaxed/simple;
	bh=48tWzKXqrBuNTITJbFvFyQpBeuNJqHizCnO3J2qvL5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sX/XahQwM03h/B33JyP6buVovU5+M5CP5KYQ/baER2msxjnWlgaiRjHKW1maBpEwDAsG8AF9FkgIbpKj4osNUKZ6QMMYMvoGHSKN/T9yv/eUMnSnSySp6PoF5mhJ4HWDtBCJIMPVY9VRVzrDI/7R66Dv12c+cq5u/boS9gRhkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B2C3xgKL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B2C3xgKL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fa901ad6f3so131595ad.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Jun 2024 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719741195; x=1720345995; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fuqrLG/iyQEUDQZ+GHH+AA9MRCDZPgNYvRKehcIb46Y=;
        b=B2C3xgKLwDh3Cl2gZxkzhol+ojp+4TJxn37EW43RMsF8w5VDLjBY+PcZW+SNB8V91T
         FNNIz+K+E7lfmMlPAypUavlx3sEMFT3g3TH2k/kULdFjy8eBciGQPowrX+43vDCV3VGN
         GnAxCzPkoscy5l9bppTHDFCSU113/iiVBv+HWH5WXcnsaATw5jm/KlWAwEWqdwdo1kdu
         wsXd0FwuqWiAm9+9i9N6BVvk8iCBgVQmCZpDKaLfttuACkGkqwwxgQqz/CG68/2TVAvY
         f+QHCLUuBLGUkZY/k6xC5XK/jb/1nfyVgAPVM3BahW1ndMkoqTK+SyDXSewbS33ov3Xm
         0Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719741195; x=1720345995;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuqrLG/iyQEUDQZ+GHH+AA9MRCDZPgNYvRKehcIb46Y=;
        b=BqmKc3YkQDS5S3GKXmQ6vqi3uB2ZkpSOp1M0s2k3CqliEVrhmYH/CDUmID8yD61XPX
         +GsnEo5x1YHmL1Ux91wrA80iYuQlIGY3+jIVAVMAvu0CvfQJqqXVEmMqnE84lL6qH3P6
         /fAfES+XXcTsDfba//8sj79KkPJIopt00xARQok97j2jsRFDx4w3GE9U0sG3+zW8A99o
         UlussdJuQAq1IJMBN85SdxM986D33x2Gb6Aa6S7cXIMKycm9bMkweHfabErEn/lBmbAS
         1X6JudB0BHnxSlRgDgVroNLcxuFGidh6uKQxqXTIwQkW7Kx1H3Qk+pMvV20JOmOJPUbj
         MCGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq46cdPcedCwOGqcdopOmVaS2kw6ObgcswPb/oiC48Me8CL7oNdsOXDlDlDy+eLs17+wBOE5hUD5D7VhjGoIqg4MoSTOD26XKv
X-Gm-Message-State: AOJu0YwWkILO2IJ9vgizECgPbT1becmtHzWVK3qLTIlxPUipYyVCKLg7
	+xHKOVuA3za1jn+fc5jTb7axIZkhC/po131D0eGFUffMgPP05/atBWXW+EZUoA==
X-Google-Smtp-Source: AGHT+IGh0tdaPei75Qvv/3PC2bsHbzXwLxc5ZYZMwJ/JLo/HH99KuZQ9cFRZGl4AvEJMKXkY9e+sew==
X-Received: by 2002:a17:903:25d2:b0:1f6:794c:f409 with SMTP id d9443c01a7336-1fad8ef3758mr2142825ad.23.1719741194329;
        Sun, 30 Jun 2024 02:53:14 -0700 (PDT)
Received: from [2620:0:1008:15:66f9:a021:890c:52c9] ([2620:0:1008:15:66f9:a021:890c:52c9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e392asm43679945ad.78.2024.06.30.02.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 02:53:13 -0700 (PDT)
Date: Sun, 30 Jun 2024 02:53:13 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Jiaqi Yan <jiaqiyan@google.com>
cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
    ioworker0@gmail.com, muchun.song@linux.dev, akpm@linux-foundation.org, 
    shuah@kernel.org, rdunlap@infradead.org, corbet@lwn.net, osalvador@suse.de, 
    duenwen@google.com, fvdl@google.com, ak@linux.intel.com, 
    linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 4/4] docs: mm: add enable_soft_offline sysctl
In-Reply-To: <20240628205958.2845610-5-jiaqiyan@google.com>
Message-ID: <ba5f7c49-c601-c28c-f37d-d2c2e147e382@google.com>
References: <20240628205958.2845610-1-jiaqiyan@google.com> <20240628205958.2845610-5-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Jun 2024, Jiaqi Yan wrote:

> Add the documentation for soft offline behaviors / costs, and what
> the new enable_soft_offline sysctl is for.
> 
> Acked-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Miaohe Lin <linmiaohe@huawei.com>
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>

Acked-by: David Rientjes <rientjes@google.com>
