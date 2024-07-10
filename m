Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E2918FA0D
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720604381; cv=none; b=sc1Z24QFUvtl+fiC/6q30fYZuoLpcet6pEF5ji6zFAQH8jnURaX2G7J3/J8pK8ZgYLf1jTCiYGFJQFJ0bxo95aPMtJna/WP6QL2Rfc+zWIW8eGZTZmOD9pZcR26JZbfO8+IAtPFue46+DCSJyvW5412pCOXxSYNOHANIjGBXvqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720604381; c=relaxed/simple;
	bh=cxtEiy+7tR/t7lkZzdUeJaDgyf2ynisU5m3GLGZQV+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZOBi5R+TpY/T5qgDYyyYPINd8J7pYzPtWBbroRpWvMkF2Dh5NYcGKYJUZBoLy/TlEHCA6/e2r5GUXyH7pcVv3FLyB/cIKfrOKV2WDZLdKxg4O4Ncq1Jz/96Zx0aLeMaPB9JTTMowi/+sHCW6twXCbLSbvYcYMAguA7rPvMxxbug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Aha13ut8; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Aha13ut8"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e9f863c46so6656194e87.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 02:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1720604377; x=1721209177; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARVuzbVHjxxG9dv9mtR/lCDpdt7FDrvxjkqdsUuuHF8=;
        b=Aha13ut8dblHu0ABPDwI2kSoZ9SFD7Bvf9rgZkld4VATzEQYgx0eqIQzx/2VdTHpF2
         1px2UkPPqR7oAUuqUcxiU6tjPtw0R9od6D5NJUSad2M5uHptuV15ayLc6vU7kw1umRkn
         O3BMOBo0OiXN94YsZyal9FZI5gFK3HCxit87kyQns7z/skvTDwEb5UlKw690vhHkTCFU
         iDLJBU5KTYS/kUcljpKezM1pkCXLUDTUkCMxwsl+FbmBvIYwskC7ww82+kRng0PuPI00
         mbGXVe9M8464iY2JEH9UY9ZmqLseW3zx+mC2r+NlRIHfIQtsLEZvpW4q7s2OTj3HsPQ4
         EsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720604377; x=1721209177;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARVuzbVHjxxG9dv9mtR/lCDpdt7FDrvxjkqdsUuuHF8=;
        b=kbA+TpUUxxZiGk6Q3TrpbR5n4ZxvJM9e8xtxhQVmz3NgJTHasTNg/A+0ts1Q3NRnOY
         PcVR+ctprMVmk2U7Ko40OGIGJ9b4f9hXezDIn6grBgWTCGru2p/DAodTYkLZL8Q3K/o8
         hGFFh5+DtCNvd25THQh5/RiavV5Ca1366XXso5Hs7wb5CbyJOY1CUb1sc+g6tCTbqJmj
         Fx6/tRHaiGfa8o8SaSwjlUGP/5ykJLtiXkYcMgJTbhyXG/RUVo02rFYdfUG53Z9tfYQV
         bLOVY4eb1Tt/o0E9alqTPR0CSZxmGk11UItNLkG1wnE3PdvYe1MGvjcJaTUeyIBnJd//
         l/xA==
X-Forwarded-Encrypted: i=1; AJvYcCXEPv8Pf8fj629TrUNIWpj3nWryoiSBMLnKIw2CKPNm+KoDYDXdDxkBxJAtMs0OqfuuTZhj/TArp9mhRgdyzIHnPH37o14gM+6P
X-Gm-Message-State: AOJu0YwzbrBZKu1GCSFo6iDi5wb2KSQVPQDxlJl4jXysn/QVXabQRD4c
	YD50DUuwhGgGihMPO850VyNlVTnvNjl0JsUMaIlLt/XBQ+YWPn/+MGOCKoncdv4=
X-Google-Smtp-Source: AGHT+IH5HuyWqm0xlysU+IQkoWroaRhheIPJ9ojT9MNnUnqo/Xdu38e9HBXnOtzD4O+1giys97jgbA==
X-Received: by 2002:a05:6512:3b82:b0:52c:fd49:d42 with SMTP id 2adb3069b0e04-52eb9990d58mr3224222e87.14.1720604377061;
        Wed, 10 Jul 2024 02:39:37 -0700 (PDT)
Received: from localhost ([149.71.16.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f74159csm73618475e9.42.2024.07.10.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 02:39:36 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com
Cc: punit.agrawal@bytedance.com,  sunilvl@ventanamicro.com,
  jesse@rivosinc.com,  jrtc27@jrtc27.com,  corbet@lwn.net,
 aou@eecs.berkeley.edu,  cleger@rivosinc.com,  evan@rivosinc.com,
  conor.dooley@microchip.com,  costa.shul@redhat.com,
  andy.chiu@sifive.com,  samitolvanen@google.com,
  linux-doc@vger.kernel.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Anup Patel <anup@brainfault.org>, Yunhui
 Cui <cuiyunhui@bytedance.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v4] RISC-V: Provide the frequency of time CSR via hwprobe
In-Reply-To: <20240702033731.71955-2-cuiyunhui@bytedance.com> (Yunhui Cui's
	message of "Tue, 2 Jul 2024 11:37:31 +0800")
References: <20240702033731.71955-1-cuiyunhui@bytedance.com>
	<20240702033731.71955-2-cuiyunhui@bytedance.com>
Date: Wed, 10 Jul 2024 10:39:35 +0100
Message-ID: <87jzhtmvqg.fsf@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Yunhui Cui <cuiyunhui@bytedance.com> writes:

> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The RISC-V architecture makes a real time counter CSR (via RDTIME
> instruction) available for applications in U-mode but there is no
> architected mechanism for an application to discover the frequency
> the counter is running at. Some applications (e.g., DPDK) use the
> time counter for basic performance analysis as well as fine grained
> time-keeping.
>
> Add support to the hwprobe system call to export the time CSR
> frequency to code running in U-mode.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Acked-by: Punit Agrawal <punit.agrawal@bytedance.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 2 ++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
>  4 files changed, 9 insertions(+), 1 deletion(-)

The commit looks ready to be merged. Will this picked up for the 6.11
release?

Once this is merged, we can send out the DPDK change relying on the
newly added key.

Thanks,
Punit

[...]

