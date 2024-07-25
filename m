Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3214A84
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 03:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721877810; cv=none; b=ceAzNc9HDKapQiP7qTlEzY6SObTnrUNcW9bBDViX7XW8T6s7XKTakwuutEZFsn8kYLIZILXhCrgzUCKc0WOqwWqg/Nh5AWu3iw6BMvSiC8RGtGW0X01856Y/nqkWGVF/oU5bT+Ih9s51ngm1/n/phcVLAkG5mKg+D+PNp4L+GU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721877810; c=relaxed/simple;
	bh=ng3MSPKtyG9OgXEeYkmn4fozuvxnAGYk3aAAFBmLre8=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=hye4poGg5PzAxHzt6rWh4AUNb2VLEQLk7BifNYUv2Z8/EFPPAANTYQ28T8W7eIBg3YblrYe2cmgtypZDGHmnk3BpTqBr4B3Udb2Y5bzOp/1CLs9nTSHQuJuL95aqty0Gp+OK456o0XlVlP53ofWcdO9Wo1Lg6WDKWYIIYlf4QwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=Uxqy9V8a; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="Uxqy9V8a"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fb3b7d0d3aso2663675ad.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 20:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1721877808; x=1722482608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTE8k4Xtav3leE527QlrLLpsREQH2LrAwQwbgSK195c=;
        b=Uxqy9V8aLqywuAgM8c43hfJpe/QjEo7atB0AU+tZ/Du14ff0owTNQcZIEtonxHzXP+
         B6NMmxiiFeGswXbijT//BiGoW3wpYfVQ3eIeo/Nlv4b+4vCDa1YRCorqvEo3mtav5ihV
         m9vMwONLD9RV9AAxFKrXBzPJz6RbvVUmfVz7w9tUKz/ty8sd5QQx6NczN1eQoXKrNwFz
         cKjImrndafFw+J9rILhYWezK2SY5oh9QRb8ALARX4zX2i07/QrXlNar1WVj6C8xGjFML
         pi8U1EddjPAbme6eV0f0EYpAheSJ8/xcnVV+rw8T+qQoZ4lDYBvJjkluZVOIEem+8UYJ
         o4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721877808; x=1722482608;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTE8k4Xtav3leE527QlrLLpsREQH2LrAwQwbgSK195c=;
        b=Xj8wXs+JnZsJR5Tde6ZVBYLMaSXvsxxsWr25kDPl31KjO5G7fZo/70tP+U/uBuu4Mp
         941dRn7Tty++afeoq+lDBrp0J3eTWgI4oZVE+q1rcSbtEwXLlKA8iHhcYrtZOB376Abz
         SFVYHKirtOymtdJLFu25/O/2A3hiX62gFkAfcB+wtebxWFfTk3oLINEbpBII5KGZthJv
         ABul4UnN6sZ068Jck2j+tmai3AJnXuElr1niGjGOVbJJvH0ZLgHavhzwBGkP28ABKOvm
         yqqR9ROoLtXEOq7J1wZPOxTnEBgFR3pMYLtKkAd+9VjRXJM2GzDjoSrCKlXltu1A6dL9
         3MWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxTxNYCVOTRKi8CUf5ECuRFWOyJ2zBYDPq2m4apdNSqTAMBMUpVNsSi+eZIqcIYRdHTQvXmiTGNsOt2b8HfxEtqscMDii38jU+
X-Gm-Message-State: AOJu0YyW2sA7DvW3L53D2pca2XeKXzc3tmE96j0s5YS6E+zr6zQcxGmH
	+AbQ9Hz5kGaifv+9xTxpxGmX65qd+87ETE67uWzmU7IzVrO0gnuLuASYIKS/N3I=
X-Google-Smtp-Source: AGHT+IGKdmVEgqPrldLhr2mxPHSbU8xFGw3cUdaIe+udwlpFod7DeQVhk2V4YNFDZRSHwo5qxGrUnQ==
X-Received: by 2002:a17:902:f68d:b0:1fb:8e98:4452 with SMTP id d9443c01a7336-1fed9262e28mr7130605ad.15.1721877807944;
        Wed, 24 Jul 2024 20:23:27 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee5734sm3134035ad.135.2024.07.24.20.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 20:23:27 -0700 (PDT)
Date: Wed, 24 Jul 2024 20:23:27 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Jul 2024 20:23:25 PDT (-0700)
Subject:     Re: [PATCH v7 09/13] riscv: vector: Support xtheadvector save/restore
In-Reply-To: <20240724-xtheadvector-v7-9-b741910ada3e@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, jszhang@kernel.org, wens@csie.org,
  jernej.skrabec@gmail.com, samuel@sholland.org, samuel.holland@sifive.com, corbet@lwn.net,
  shuah@kernel.org, guoren@kernel.org, Evan Green <evan@rivosinc.com>, andy.chiu@sifive.com,
  jrtc27@jrtc27.com, ajones@ventanamicro.com, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
  linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-28424e23-c9b4-407e-97d8-9dbb09101781@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 24 Jul 2024 12:14:00 PDT (-0700), Charlie Jenkins wrote:
> Use alternatives to add support for xtheadvector vector save/restore
> routines.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

b4 isn't applying this, either on top of your last patch set or rc1 -- 
the base commit in the header isn't a hash I have, so I'm not sure where 
it's mean to apply to.

Also...

> ---
>  arch/riscv/include/asm/csr.h           |   6 +
>  arch/riscv/include/asm/switch_to.h     |   2 +-
>  arch/riscv/include/asm/vector.h        | 225 +++++++++++++++++++++++++--------
>  arch/riscv/kernel/cpufeature.c         |   5 +-
>  arch/riscv/kernel/kernel_mode_vector.c |   8 +-
>  arch/riscv/kernel/process.c            |   4 +-
>  arch/riscv/kernel/signal.c             |   6 +-
>  arch/riscv/kernel/vector.c             |  12 +-
>  8 files changed, 198 insertions(+), 70 deletions(-)

[...]

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index bf25215bad24..cb48092fdc5d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -845,10 +845,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>  			riscv_isa_set_ext(ext, source_isa);
>  		}
>
> -<<<<<<< HEAD
>  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
> -=======
> ->>>>>>> 0f260ac829ca (riscv: Extend cpufeature.c to detect vendor extensions)
>  		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
>
>  		of_node_put(cpu_node);

This chunk isn't applying, and it's got a conflict marker in there.  So 
I think that means something's gone off the rails?
