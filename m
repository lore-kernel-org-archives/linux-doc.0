Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61781E48C
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 02:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708395482; cv=none; b=YylqEgIhXmu4NFmMSnqZSPncTNtr1vgBAuRN7y9flw5tC+8ufl/Qaluc0l2/uANpvT55zmRVHcs51B8XWkhrzjaJgd1hBeamUNp8c0rHCuF85WOoTf2L8rZNADVxmX7exHbYNleiXn2WapammEULJbK3eW1ss2j4ijSJnf31Hms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708395482; c=relaxed/simple;
	bh=kywl0E7Ccn+F6uJKh4GjD6fADlYLci1v7yF8jV6BqRU=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZgZahe/NDBudP8adaa0vCO6dJfYMHpaoXpU7X220rcSkh+ois4Dg5le8J7lOpfaOccVS0RUJ/GgbbSElXCK8iA7/QisyDixLLucOOSG5ypG2qqS2J3XEKdGL4PY0e3KKG4nNd0viquQRo99wXCap+mFn2jizcSI+jtFLxkvhbw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z06Eb/LT; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z06Eb/LT"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c15b7b36bbso853595b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 18:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708395480; x=1709000280; darn=vger.kernel.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hyy8ZTU+BTw5Zgz2454qzBwNJQ5zOkaDYTH0aZ4A4fg=;
        b=Z06Eb/LTVYrj0d6kLov8v9CnaJcVjTC9SHywklp707x8xI9/5xbazwUTqd7veY62LL
         Gn1M7muOQcCy9GthGJXC3/IX+5TSgaHPhxiL/QatESAdobQixooLxBpPCyT3Pj4aVIjR
         IthvK2q9/y8uydVL2UvafoHQzcLOUvPZV+HRaQ2PhcXm2t7kYIZy2vRkNDdJz5iccpGy
         Wmm4we/oSEDiHiz4Z/GlJPn3VFOtB3XZA42L+fUqO+u8v4XRXOCvEq4JqvYMMvFVWgQR
         StzXEtrgMw07bl2sVVIakJgGt0wgmO8nOXvJYSC+YrZykKVwmkpvAxw+VjiyImN+xXfa
         GHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708395480; x=1709000280;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyy8ZTU+BTw5Zgz2454qzBwNJQ5zOkaDYTH0aZ4A4fg=;
        b=LScpwcISxv8PIBM5Sttz9ww0o1cobsXh2XzyF7fdVsrv/5/ueNCYxV28ZC48nK0R4m
         MQhnIcg3B32CLvcL3SpW+9GqutyBzBlCkFoh0LKEdBB2jiv0J6gl2+De1LWmOPHrGnj0
         8OmfK0y+6Dp6tVyGISrTJgnT41FtD4LjoM2rf0Gp71vEW85+yuorvw4MxTixrp5eJx8L
         QbqMDIoF5fS+C/63gLWp7gb8DGNDd8K7uaainZ7bvk394oYeNPaXu1aVUx81ddD1pPNe
         A3i8+WaUHKCZdTaH6D43fzHAiBCMIm7pz1JdngNcWiMVzr47PfjL8KbHphjfN6NfUulU
         hnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuE5C/DPYcltvK6pZEh6XwL5eFHY66knGUg5fQI8OU3m2rXWBO6S01LFB5eAYnsLMqx5q6PSOkkTDWLRh6ldvE4zbc8REb37of
X-Gm-Message-State: AOJu0YxZwoAHkWGpqnViYcKfMG8sNaMA7+YC16sy1tjXVnAxNf3Wj7d4
	2PPAv+giZLyX/jDHHZq+d/sVkJN6GbSfgIX7OVkS0ZgNnZK2PeM4i0IC5yulNZY=
X-Google-Smtp-Source: AGHT+IG+AWqQMKARywU7epk4MPVFD1c38rPYRk/u1nDYjlo0ottYYY2CyLviBufhz/tQt6Ao3jO2qw==
X-Received: by 2002:a05:6808:2b06:b0:3c0:4455:a2fa with SMTP id fe6-20020a0568082b0600b003c04455a2famr15407500oib.18.1708395479877;
        Mon, 19 Feb 2024 18:17:59 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a328:9cae:8aed:4821])
        by smtp.gmail.com with ESMTPSA id jw26-20020a056a00929a00b006e45e51ba11sm3274807pfb.145.2024.02.19.18.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 18:17:59 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-35-c9fec77673ef@kernel.org>
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
Subject: Re: [PATCH v8 35/38] selftests/arm64: Add GCS signal tests
In-reply-to: <20240203-arm64-gcs-v8-35-c9fec77673ef@kernel.org>
Date: Mon, 19 Feb 2024 23:17:57 -0300
Message-ID: <87o7cb7uay.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Mark Brown <broonie@kernel.org> writes:

> Do some testing of the signal handling for GCS, checking that a GCS
> frame has the expected information in it and that the expected signals
> are delivered with invalid operations.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/signal/.gitignore    |  1 +
>  .../selftests/arm64/signal/test_signals_utils.h    | 10 +++
>  .../arm64/signal/testcases/gcs_exception_fault.c   | 62 +++++++++++++++
>  .../selftests/arm64/signal/testcases/gcs_frame.c   | 88 ++++++++++++++++++++++
>  .../arm64/signal/testcases/gcs_write_fault.c       | 67 ++++++++++++++++
>  5 files changed, 228 insertions(+)

Just FYI, in v7 I reported that gcs_write_fault was failing for me.
Now all tests in this patch are passing.

-- 
Thiago
