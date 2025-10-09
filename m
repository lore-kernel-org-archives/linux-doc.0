Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5007517555
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760028385; cv=none; b=ANJ12FShdfcXtzEBf+GTcGCXLcxQri+oiBwUir4Px6eYolTHhY4iufbwHDzRz03isQ7pECekR9+75IxwlD49SMQIOOU9jstdsxn3w4AvqoT/PYMwokUy3d1BdaH9Bp06hCdxa6rm2hbK3VFUkOC+hTrgGrSjh9NFpJE1qFMCJ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760028385; c=relaxed/simple;
	bh=uKkoVdHHQpINnOOc7yMyxMdnFxyYgw6tts6v+l9uMss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zl2XR+N7Ey31l9DHnhZTk5/MtBi852qngqJ709ENRU5N1IFqjxydb2wddwBhIxUGSdLKNkSA8uSLeLWBoUPUZpUl3hWhITBbXSWoQiaBTdZk1AriXhR8wDALWs7HYc57NbJnI1iqqRgqExkunPHqZ+MdLOxAopxCPgCoJj3ZnBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gxy8k/6i; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gxy8k/6i"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-93bd394fab0so35476239f.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760028383; x=1760633183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l69sAA+RqcMkjrNYYlZnvTMiAxsxuDk6BohwO3k0jM4=;
        b=gxy8k/6iWbaPBMaHcPa6UBOZfPQZMJvh/8QzxvONUjVvaAbPF3qMZ+gZ59XeymltuN
         Ft+vsm/hd6x/LYrjz99UnNAFNcFnkfZbub9wJ+f0/Ozh9IgHWOMmmb39RjmFFcN0CacI
         qfAWvA5zcyCNy4Ce9fQ7/xo5NE9lMl9uium8PPZNlW6wDX4J9wrfwZxJtQ4SqjkOwjTZ
         4RabWJxQ9A2smqPGhX+0StTD7h8KPQKMsYp8x7NRiDCXtnjQ5wTBcsP6nRLZs+eWD2sV
         aeh1O84ypCXty9yPQfJxf66OvPe2oxowpOWWVH3gfsCUCIR0MYlFRnmmWrovIx4JXwFU
         6o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760028383; x=1760633183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l69sAA+RqcMkjrNYYlZnvTMiAxsxuDk6BohwO3k0jM4=;
        b=H5fDAyvNuPtWjByVrZ1rnNXOyai7l3vMswQxGBCvxkhBzC87y57ZG9cuGp/4dvfCjl
         Ru2uUZZ313Nq9PGNYI02mdU54HH4s6Fs1NWgGBZ/14dhu4y76GKJN7l+3AiWNlXTPPMo
         51S5Qvhq399cmnBs8v222Ds+RPbuLS6zCWvYM2HQW0fYD35y2yY2Gk/mobWtDKLuGF9L
         fl0IJFkvr+Si5GUyPiqsvJ20KF7L+tXEFNKd42bFk+C1WQifE8AcFN3/UPeNbkfW2BjW
         xi6WGNKPfz8CVHr5hFuZScZybxL4jBm3ASmAo2C3gyWLrmfwcvFcKkqNuSdHx4uE+3Pi
         D0XA==
X-Forwarded-Encrypted: i=1; AJvYcCXx9uDznrXPGgRJckscwcJE73dvZEF2/EloDPmlP4EPozqpfPXLH0MSdC+q+REJ+kF0bjfbx2CsZpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YylTfCGnRDf0MET1/aOcMwoLHXibzftK9iyBzp9arM8bjg/z77+
	RWO+gAwxpfnIyTVlEl7Pqw32wslFbEA2wsLEyAnz/J0LBvdrpIGs1A3IIw/9Q7izgSg=
X-Gm-Gg: ASbGncvq3hnX0UR5oLAg4G86gfoHScSyFFNjQbixU70EuNpsA81LF2z0oZD+5KztSBa
	KnkhFQSMYox937Qsev95jExhynFmcn4hKWoBH5VM+eBJuNLfWWnQzClVWv6BeWvM8gTED+cYlcB
	uNK0nqen6J3y+53tNh9897nYWDFpOhdD1oaZiWdxXAjD2dLgjj7HPfLbxKZvYNJs4hRSLOHlga4
	v3hFBa0o0O7WX+DVIrxtDk0kYPd3Xq9KXpM4N7LgZCPu83fDU/aj+MITdrakuKzx/SUfpNQrrEr
	JlTIgkZDm7gQ8kN4C0mhg/gCmN0Qt0NgZysDNPqm0jg+3Jf+BLXSywpbdk10vqdn0BZ42++uFN+
	GR7CCqj5eTX88uQi6URknP7qML/yLmz7pUqA0tkvpldEaiOhOUZXeRbYuVpA=
X-Google-Smtp-Source: AGHT+IHb56VLYwDyYpisbd61rv4b/ynpgAfxpu83YRCwm5JW7AaildP7fCF4cs3XdphAf5nkTFwpyQ==
X-Received: by 2002:a6b:e916:0:b0:8c3:e106:74c2 with SMTP id ca18e2360f4ac-93bc4119105mr1227233739f.5.1760028383330;
        Thu, 09 Oct 2025 09:46:23 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e2594a558sm8145139f.7.2025.10.09.09.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:46:22 -0700 (PDT)
Date: Thu, 9 Oct 2025 11:46:21 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alexghiti@rivosinc.com, shuah@kernel.org, samuel.holland@sifive.com, evan@rivosinc.com, 
	cleger@rivosinc.com, zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, 
	Cyan Yang <cyan.yang@sifive.com>, Jesse Taube <jesse@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Nam Cao <namcao@linutronix.de>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] docs: riscv: Document hwprobe for Zicbop
Message-ID: <20251009-27aafc23cb2a92c1c9b324b2@orel>
References: <20251009134318.23040-1-zihong.plct@isrc.iscas.ac.cn>
 <20251009134318.23040-4-zihong.plct@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009134318.23040-4-zihong.plct@isrc.iscas.ac.cn>

On Thu, Oct 09, 2025 at 09:41:53PM +0800, Yao Zihong wrote:
> Update hwprobe.rst to include documentation of the new
> :c:macro:`RISCV_HWPROBE_EXT_ZICBOP` and
> :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`, following the same
> style as the Zicbom and Zicboz entries.
> 
> The extension bit records support for the Zicbop extension, and
> the block size key reports the block size in bytes.
> 
> Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
> ---
>  Documentation/arch/riscv/hwprobe.rst | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 2f449c9b15bd..3b9c9d7e1409 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -275,6 +275,9 @@ The following keys are defined:
>         ratified in commit 49f49c842ff9 ("Update to Rafified state") of
>         riscv-zabha.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOP`: The Zicbop extension is supported, as
> +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>       mistakenly classified as a bitmask rather than a value.
> @@ -369,4 +372,7 @@ The following keys are defined:
>  
>      * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
>          vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> -	Instruction Extensions Specification.
> \ No newline at end of file
> +	Instruction Extensions Specification.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
> +  represents the size of the Zicbop block in bytes.
> \ No newline at end of file

Please ensure this file has a newline so the last line doesn't have
to change every time we add new keys.

Thanks,
drew
