Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4584E1DC
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709060938; cv=none; b=cue+YMumztztBEyv87er9GxfyTvO/w/CRWNHOjuNW6+KAANAtm6l2U9d+TYSg/+SDkrIUa0mZxOQFdokcXyNsG3VG4rmlWDAWImk5jlKo5PMgO6oXMT+QJJ5w/Mn4o6XQm6ik+AS/48fS+mGsHTCYUX8pd1Rst7SRJc4/6fJ2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709060938; c=relaxed/simple;
	bh=73wabGAltLGPlrbwx5dEuZuw5LGsvnG/XNxCGcyGdEc=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 MIME-Version:Content-Type; b=gna6m68UAgcL4+xBrmPviIMde78BGAVijrbtj7VdwOm/w1154yjMAUEypc2sgImFSUrDwgQ3/RpTeIISEaRWVeBjkVCw1OUQZQPsAAj4VKF3ukOWzce1iWn0I40l+CWq38q0Q3Aj+NyhgsJgCsNInlYA9utX/4Z/s6i29bB7t5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDcLqfa0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDcLqfa0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6de3141f041so3015139b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 11:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709060937; x=1709665737; darn=vger.kernel.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=aDa40DJKClW8mXYqnyP7bggV377JTuxgqEkMOwvAuyk=;
        b=vDcLqfa0WUK0hRIAR49yMaDbMLLePg7UCxDiuzjeWczGsuWY8N8AFq7OL4j3Dec4RU
         TCsGv5yrh1SCpqIn8mc7J4RRByf0t16mtu6V+D+2w+efHZDtWmkVUNa5fe7vXwKHfc/y
         UPNAeN3wbr2QKxeb4BvC/hBchLASSdQ6/e5mYT1xUmlxdGdTYvcWKmKN4Ju+ce9plyvc
         vIckt3dacJzm5mERoyqN53mbATQzwkMBqFUqcH8qOfSnBU1HIBOgsXZSosnRHfa4vuV+
         +aroAjl/6R0kjN1Y+xFMm/BlycpghfEGPPIFFb3Juhj+uLYF4JIfWHKlm8McPqZ7gJzx
         q8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709060937; x=1709665737;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDa40DJKClW8mXYqnyP7bggV377JTuxgqEkMOwvAuyk=;
        b=bCA44X2LYdfbSCQgZuJjJTZwz+I6w7xUma4lcUp8dk43vrFiiYtUybxTPXBaAXY0I9
         OaSfXV2+kKgvkVQzAb9KczQsEVqmyOhoyJzynbNGrY5mnhbybrM3sscviPkEfQADuTcM
         zwFub88cIbP/eYwhD+rmz79Qc3JDyYNAeVMGzSoBm/5jPbiDqRIEjeAbO826SfeJxUEW
         1HcOo3MvqUFYhZ9RM+dNR3r/gNjYa+wdYIu4EVtzVip2Bx6p+sZVMpDf/hl8+HiFFKW8
         qLfr1GW3XLZm/vK4Cr9rJbKI5TKLZ81qbOUCs4PbKqh8OX+Jsyi3eLNjSb5bjavlACQp
         ZUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGG3RbW9VTMh4WKlIzFOwa0ntLrQsv8oIw3rs1gspqkmTMIu1PYwRyvSV6Ew0knGV8hmlCeaW90INR8CsMvkyzCBviHCHc5qRm
X-Gm-Message-State: AOJu0Yx1WfDxppO+lJR0NcFgPFOB2Qs58t2x0UDuOICq2ljR5ZuW9XUc
	KjA2DisfXcijB/YsnKGprTiaJzsZ85EJvBDqoDL0wyOF0M1C5I4jbVNDIQhHsvw=
X-Google-Smtp-Source: AGHT+IGtXhFFwEJ+AgMWI6EdwH6IahppDs+nYPC080WdpMAQ57X/AOuTkrytFfwmna6ljKJ3aYPMfQ==
X-Received: by 2002:a62:aa0c:0:b0:6e5:54a6:5a9c with SMTP id e12-20020a62aa0c000000b006e554a65a9cmr1287142pff.17.1709060936644;
        Tue, 27 Feb 2024 11:08:56 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:d617:f08f:e330:49c1])
        by smtp.gmail.com with ESMTPSA id u3-20020a62d443000000b006e24991dd5bsm6713883pfl.98.2024.02.27.11.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 11:08:56 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
 <87sf1n7uea.fsf@linaro.org>
 <9b899b4e-7410-4c3b-967b-7794dac742e4@sirena.org.uk>
 <87ttlzsyro.fsf@linaro.org>
 <4adb0c7e-34a1-4c50-b011-6e31ef8813a7@sirena.org.uk>
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
Subject: Re: [PATCH v8 33/38] kselftest/arm64: Add a GCS test program built
 with the system libc
In-reply-to: <4adb0c7e-34a1-4c50-b011-6e31ef8813a7@sirena.org.uk>
Date: Tue, 27 Feb 2024 16:08:53 -0300
Message-ID: <87plwh912y.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Mark Brown <broonie@kernel.org> writes:

> [[PGP Signed Part:Undecided]]
> On Thu, Feb 22, 2024 at 11:24:59PM -0300, Thiago Jung Bauermann wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> My rootfs is Ubuntu 22.04.3. In case it's useful, my kernel config is
>> here:
>
>> https://people.linaro.org/~thiago.bauermann/gcs/config-v6.8.0-rc2
>
> Does using defconfig make a difference for you?

No, I still get the same result with the defconfig.

-- 
Thiago
