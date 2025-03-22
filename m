Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01C51F3BBE
	for <linux-doc@vger.kernel.org>; Sat, 22 Mar 2025 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742645170; cv=none; b=ZHG1wfBm6u6ei2CFk980gT+d3KsZNzls6WHwQJIKC+f5fYUfdTSYcOzeF8Zr1lX85WrlIsGUlCW2yDtJDeThkmxrqHXqnD3gCTE81Tnab25i9xIxXjaFAyypopFR4dABzZO8f3dAbJu3sYno5mFKWg0Vr1cAreFeEIma+xz2Lfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742645170; c=relaxed/simple;
	bh=oOwIic0xoWcK/W7bScwvvNxG27FtWKsUDiBHcGLGMEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uax64FL6973qBbcFAwcONpxOKD3WLryC8yXmBxyOD9BC0IZmyt5NwxC6aKgf32uHaGpb9O9KkYtJs9p1Kl7P453Hgs8lGynETOqaf0jD7W0cjq1bIooKGO+q2eDpKuHttD7PmMcv42XluI/U7wFn2g2rdFbyNUDE8af03YOEZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pfVWZLGf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pfVWZLGf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe574976so16828425e9.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Mar 2025 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742645166; x=1743249966; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKCRWgSlF1v0cutxAi8x3LCFESHSHWoNhfvIYKSJItY=;
        b=pfVWZLGfHoQsMmWHi54ghr7KbiyyJFpAMemHA4DI398Vhpz1z/JsE643sFQ1ehK9zl
         Clw4wgHobbHkiCQXGyiU7Eqj6nStsGZz5jalsceV3p31r5hpN89/3D39dBQCN672KKhY
         SlT2poaxnVeXaFVC5PpFbax3DQh5ipvKlna28PGbWmGvwKg60CnFyq4GuSViWAbNAaHE
         b6nQbieQAmhXUuyUeZL+6TAJtCS7BfvAmIsFfE8Xt8GwYRtvBdSwVUzyjIulhBEqH10m
         8CmvdvayXOc0Vo+uLQJ+81AL56LPVMRdXEh24EohL+YfeAwVv85vSlJfwMRS6/HhLA0B
         DoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742645166; x=1743249966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKCRWgSlF1v0cutxAi8x3LCFESHSHWoNhfvIYKSJItY=;
        b=SKbZhO5hs5t2K7maJys3SexKZWDVTkFItyN/cZbJrWb+xKTNAjzH71o+9COwy0rMEn
         MdLMT1ptFVd2zf1rrCpu3sMoCUsWaDPoCYnTZABOOhsR9IZx5umIU/fEmW+fV9vyCT7Z
         wUSVYmnAanK+c/RbdurZMSr6F7Uw847p9lAvcBazLQFfTLqst4zR7BXIGG9zBOO6pxsR
         eb0zeFLUQqizg8R3kIpJz/+ynxunji/GwvJHI9RML8PWfwTI0Oo4+JQH8Bt1q1SO8bLz
         mRFwJ814V3IHvFAo7mr/LfKt3yV4JVsaA8iNfeNPbLUsmLgK08RZO090yasYHHSLgYSZ
         rXSw==
X-Forwarded-Encrypted: i=1; AJvYcCWPqd4FzCm/jcl2ikPCqkV05fWmtw6gPAefSbgX+v1AqDXLZTsKieQWDOugbXYn0mtYc20tj3oqfWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrnvJOMQeHs3+i19+6EDM49eIZnLh5qSPdNVtWLd03n1TDnihK
	ADosgpmK7nGT5QjABC6jWJhl418+FVOQdN8Nc20BQqfA221FQG1jrG2+uNnqM0Q=
X-Gm-Gg: ASbGncsd5xNt6xGwkAKD0QmrcJxvrF0E7DvcJ442iOMAg3p07X42w/f2+xGx4iIztiC
	gIK0KSFAejT/mHtu/51/4O4pGocGpIEge+4bowBNiJQltOcQ1m0+SW4nwzoyiu5pk1icNErCi8k
	P49cSCsa4sxE1KowQ/EVSuIwpW9UQ12noI936wIiC9S4BXVRrb67wKZCYJ2CyRjyaGki7EgLc9B
	kzarYJztRUbGwTbLqy9rCDu4moxVd37qRe7jxGHAabxlG5GlS0AH+fsbuxViJi2Arl2rum3sJDM
	YqkvCYCJz274yNbpY9LiWTp5RghtmDg5F6obSVxInbT/hctTBU6s0fVxJHhLwepBQiFwjBUKEg=
	=
X-Google-Smtp-Source: AGHT+IFTfC3V3Y+aXvtwsAGDzN2r/TELBK33hItKDRr/I6qX4Pf8OQOcC8wMhwn6dPn+tHwLQGn1PA==
X-Received: by 2002:a05:600c:470f:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d509e190fmr61771675e9.4.1742645165642;
        Sat, 22 Mar 2025 05:06:05 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef23esm4932401f8f.81.2025.03.22.05.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 05:06:05 -0700 (PDT)
Date: Sat, 22 Mar 2025 13:06:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 02/18] riscv: sbi: add new SBI error mappings
Message-ID: <20250322-cce038c88db88dd119a49846@orel>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-3-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317170625.1142870-3-cleger@rivosinc.com>

On Mon, Mar 17, 2025 at 06:06:08PM +0100, Clément Léger wrote:
> A few new errors have been added with SBI V3.0, maps them as close as
> possible to errno values.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index bb077d0c912f..d11d22717b49 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -536,11 +536,20 @@ static inline int sbi_err_map_linux_errno(int err)
>  	case SBI_SUCCESS:
>  		return 0;
>  	case SBI_ERR_DENIED:
> +	case SBI_ERR_DENIED_LOCKED:
>  		return -EPERM;
>  	case SBI_ERR_INVALID_PARAM:
> +	case SBI_ERR_INVALID_STATE:
> +	case SBI_ERR_BAD_RANGE:
>  		return -EINVAL;
>  	case SBI_ERR_INVALID_ADDRESS:
>  		return -EFAULT;
> +	case SBI_ERR_NO_SHMEM:
> +		return -ENOMEM;
> +	case SBI_ERR_TIMEOUT:
> +		return -ETIME;
> +	case SBI_ERR_IO:
> +		return -EIO;
>  	case SBI_ERR_NOT_SUPPORTED:
>  	case SBI_ERR_FAILURE:
>  	default:
> -- 
> 2.47.2
>

I'm not a huge fan sbi_err_map_linux_errno() since the mappings seem a bit
arbitrary, but if we're going to do it, then these look pretty good to me.
Only other thought I had was E2BIG for bad-range, but nah...

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew
