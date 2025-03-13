Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE66F266590
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 12:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741870657; cv=none; b=hqEbHxWbcWv009rNQwzc2oi26SnsVHFC1qm81AdSL/TdopLdoXe2aQ7zgUWYHw0sDndIHR75j5B4XPx04xpCTCRbsmOtUa7P+HTFadfl86GMv35fiqJEmpnW7AnOmObnVsuDx8g/U49xdj3pOw93GdxJOt7u14BYp9WxqyfakPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741870657; c=relaxed/simple;
	bh=3SJF7mpLxysqOLGs7s+q7f1LccNakiGDFqv7+deqaJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6pfZMWBRhyh3fbGTLHbb5lUZI/x4JPRDGnrRUbYsRfNc5yi/IYuUMmi52exrF/Wl2xXaihay9nPgHAIrzOWarFxP1H+lCSc0sT8QzM+ymDIrFbqYIseapwRThI50MuTgDpY/mZ77AXa00YqFHCGEm3rb22bkbhLreQjL+nNikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=APOaxmmg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="APOaxmmg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so5815075e9.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741870654; x=1742475454; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oU2CWGwDlIJhGLUqCxoni4cHhWUsK2iDFsgYYpF/oTQ=;
        b=APOaxmmggK32pxXRV68Rk7ps3GTf785tyvV1NoRdGow8T4TVJgHByJSrANXI4wyqHJ
         HHefvHlSgNUGh5DMal/5KsbjTtJ+XgyfwSk/CKlC50hkaC5pX2Yubu8+c5noE26g7JL+
         YsB7X7S1oDbUEalvVXLbg79kOdbDBCD82zricwFglb3VbUpLTSE/AZ+v2ki8Md/Z5trv
         taCeWZc8/TnH9fqWGL2Nkq26Hrnuog/oVL2lOFiRzNhd0bXILM/PMp+vZ6BFQGqefBgq
         pPng4xVPyagpcbUdhWCmOn1d39cPa2l8KGOOWadD2KTiMq2q4ewFFULdG4CMfGSrScxk
         6W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741870654; x=1742475454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oU2CWGwDlIJhGLUqCxoni4cHhWUsK2iDFsgYYpF/oTQ=;
        b=J/W6jzX2VZo2S+9MA8UxpQEzqnNNkoJikTWrBWgZej1UcNLPXso9odiWUQLZ3bPL+L
         tcBGevhgBZzotkG5g+w/XYYjAcsqP41/kjOuG0OjnwdOknZqOOsjEmF6eoa225viLaTk
         AeXC15jEQ6xg9cZK5styCy4yvHE1lwc8gXWCI4KgPiPNAlOtNMR7C2+IKB8fbvzd5bjQ
         vHJPZpKOP/V63mX9DtPOtJFXvIOHBHBdSdY3ur2UvtUbzspnOcBqijYlCUF+dZpjlchh
         ACvLPTi1hZdFfgYfIs+jPdg1Totva5p883PLsreZgzMcZqxp+XX5mg6mZkQ7MKdZu6fm
         STGw==
X-Forwarded-Encrypted: i=1; AJvYcCXkgEAh+6ZWmJFZsh66hwOpKQU1Ywjbm7NaKd1QPGCuh8TyMmeXeAoj0bAkcyPqHHVl2hMs6Tx0QPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFq/Zx3Txm0itGEmXt+h12Oam5dWSiYJxDBaYEDaN6+CXUaGdU
	vIMfe18V/pqFxnxUD/XmqYDZd/RwAe1BwRwKdWRjy/xYUBkn8EBjM/U/Id6DP00=
X-Gm-Gg: ASbGncuwPU9GabTS/GBXZiWWXfrUWiwfi9sKdcBlKKi3yXe9zuVDD7NABBcekTvBSOz
	nqHdjIsHb2YdkCrXcPFNN0jA4s/i69C/4tSiSZH7RjmO/Z9LteYf64dCdPWx+Uz6MdCT8svs9il
	LXC3zALn8Xlniu6SGa6ymXOtMfgaYDexnhRBR+q4riAsaBE/AXPng9Iij+koNzm27aMI1ZbKLwl
	Yjd7TapDFerlz+KhBdVu+txwMl32nR3lhSV7les3bz1Vq2EVAuEoxxH/0/j1wy8+PHsdgDpvAHf
	oB9oJPI1/XqP91U0/tjLsdHgRKRHtJxC
X-Google-Smtp-Source: AGHT+IGM1DblGtxykFocIp33D2K47p5ADdU4DE4GFvOo3U3iDj70FwK79o4wmAKz0GgKu55I89czxg==
X-Received: by 2002:a5d:64ac:0:b0:390:e889:d1cf with SMTP id ffacd0b85a97d-39132dc561cmr20667619f8f.37.1741870654174;
        Thu, 13 Mar 2025 05:57:34 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm2044096f8f.25.2025.03.13.05.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:57:33 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:57:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 05/17] riscv: misaligned: use on_each_cpu() for scalar
 misaligned access probing
Message-ID: <20250313-311b94f9bafe73bcd41158a1@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-6-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-6-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:12PM +0100, Clément Léger wrote:
> schedule_on_each_cpu() was used without any good reason while documented
> as very slow. This call was in the boot path, so better use
> on_each_cpu() for scalar misaligned checking. Vector misaligned check
> still needs to use schedule_on_each_cpu() since it requires irqs to be
> enabled but that's less of a problem since this code is ran in a kthread.
> Add a comment to explicit that.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 90ac74191357..ffac424faa88 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -616,6 +616,11 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
>  		return false;
>  	}
>  
> +	/*
> +	 * While being documented as very slow, schedule_on_each_cpu() is used
> +	 * since kernel_vector_begin() that is called inside the vector code
> +	 * expects irqs to be enabled or it will panic().

which expects

> +	 */
>  	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
>  
>  	for_each_online_cpu(cpu)
> @@ -636,7 +641,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
>  
>  static bool unaligned_ctl __read_mostly;
>  
> -static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
> +static void check_unaligned_access_emulated(void *arg __always_unused)
>  {
>  	int cpu = smp_processor_id();
>  	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
> @@ -677,7 +682,7 @@ bool check_unaligned_access_emulated_all_cpus(void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> -	schedule_on_each_cpu(check_unaligned_access_emulated);
> +	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>  
>  	for_each_online_cpu(cpu)
>  		if (per_cpu(misaligned_access_speed, cpu)
> -- 
> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
