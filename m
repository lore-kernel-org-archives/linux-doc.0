Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54402374EB
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708394452; cv=none; b=Wp5PCsN3np+QgdV2JpibF6Ppm5CuPXD1xPGzRnO6a9fSdGE9op/QGIZZ6HIe0BoY2N81S7V/Jnfo89hRAymW0q77CSEom8C05dVIGVh2Tnys7X7Eudh0AaTUJJR8zoXHYBaCHnvFUPOCjhWOxZ96PBYP+OWY0MpPUfI1YVTJR2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708394452; c=relaxed/simple;
	bh=qiYCOBCXkZA+S1xJHN9t4SVRhSQ71ysKQ9Kl/44/lHY=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 MIME-Version:Content-Type; b=ut2acA/uo+bsivHw7+RpUTzEH5AnUndoohdN3KOghYv0FYnSZCURYuaz5eiGGIKCRW/OWeWeB1/PgEC5EtC1XTJN33C2meomG5N2+dsp1LkakFDpVF+5RpPRZmjyr7si7pkpQ4MUqlTgSn+kVo1eRsUDN6mBGR95JV5LWAoX/m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URlVho21; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URlVho21"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53fa455cd94so3522574a12.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 18:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708394450; x=1708999250; darn=vger.kernel.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=TPVEuybRyh8o5XcrU4e2hriNxyZdgI2hibiqaIMVscs=;
        b=URlVho21yMR+Z+qZ71EA8PfKbTuWDMqmMZV9NTDt07CJBjJyVQbK4/RGHZIYPnzH6B
         N2f6rsZRAoVQcPtpMtktwRhOBooal9CvWgW938zAJhgMpiYhtM1xFCqPvOjlJJ3Z2dTo
         taMHDxMIuxB5Cob2ZufYifbQwRt/irAPvrIbUx7v4hZgRG/tgwf3KAga8qSBafRVBLwV
         xy2heh+04XdBPdQxZ2zpSfB6jIxVB4hui+Ih5Zv/JTXTt1mmW6ZAqh+vQWWHvbMNEctu
         Bc1OkUy9VfIp8UJS2X9RUnyyXE2JCgXwQ8ADilO8XVudBpIs4US5I6t1zAlEYks0woq0
         YDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708394450; x=1708999250;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPVEuybRyh8o5XcrU4e2hriNxyZdgI2hibiqaIMVscs=;
        b=adLTz7s0zBH8DLrAQxCi29u/Xemt+Mkizyk9/N+dmI7/O9UZTekitf15AS6rskyAL0
         qQwpZzpg0/5W7E3/rr2w5Bs8ewRIEllr/+JYWlEzRA69KDoibk9Ay3RZJw0huvqkOFZ3
         Pmw86/6WhgbwMs+mh+3bdfX6MqO4/RfmpDN5fwdcMbOIHwjUbVPHKelvvhbfoqTuc1Ug
         +yxiuJUu+1xdOZgBtBxhXYfrATfJxhq/O6GA0qhak1qZvSoVeI8AJFkSLK38LPxPd7Th
         Z/qluAH4m2s3JCRM3XEETPdhbNm0BCzaTzd70u92TrNMhMpyvrOxYETC0D71fnVpdbIm
         wQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVURx/c9lqSD0HcxXIA/mJy85/yvE7pHeAPef1T8e+6NAmxGoy2em7wyzBVciRQ7JMlZPYH9AQlljdaQ7Y5Eev1kdt8h0TOfBKM
X-Gm-Message-State: AOJu0Yxu2K1tBuOrW9IUI6xXR5psj6pD1ScGhyu3aZGW+uYU12zAAZoD
	jGBpM9F6XDFLIy86YCb4T5HxnA/iDd4/Xr7qWVwI5rcAgMedH/j73num2rqq/18=
X-Google-Smtp-Source: AGHT+IHQRCR15jZ5TkL4psb84wN2RgNzkdO9BEfcOkiOYvFiSNgotMA3Enz/ysz1JOMgmumVFviryA==
X-Received: by 2002:a17:90a:de0d:b0:299:3332:a649 with SMTP id m13-20020a17090ade0d00b002993332a649mr8755614pjv.18.1708394450582;
        Mon, 19 Feb 2024 18:00:50 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a328:9cae:8aed:4821])
        by smtp.gmail.com with ESMTPSA id z19-20020a17090acb1300b00296e2434e7esm6167416pjt.53.2024.02.19.18.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 18:00:49 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in userspace
In-reply-to: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
Date: Mon, 19 Feb 2024 23:00:46 -0300
Message-ID: <878r3f99o1.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hello,

Mark Brown <broonie@kernel.org> writes:

> Changes in v8:
> - Invalidate signal cap token on stack when consuming.
> - Typo and other trivial fixes.
> - Don't try to use process_vm_write() on GCS, it intentionally does not
>   work.
> - Fix leak of thread GCSs.
> - Rebase onto latest clone3() series.
> - Link to v7: https://lore.kernel.org/r/20231122-arm64-gcs-v7-0-201c483bd775@kernel.org

Thank you for addressing my comments. I still have a few nets and
questions in a few patches, but regardless of them:

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago
