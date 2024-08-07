Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC83146A7A
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 22:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723069363; cv=none; b=PgjU5NJS1CqOIZH7BQpnsDGpDsoLvVHuS+NFLYtsx4g5J285MFS1Sd43RQEGmjSFxiWvdrPmL2bHx55JPBbW0HMuuTlRklrdxqM3sBUgA9gl9Eo1MNacF37SPkkwTlmvS3PJNlOdmCezol5iT12yLkU7NeBqNYl4XtU728fe6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723069363; c=relaxed/simple;
	bh=3btizCSSAKzA1J+IVvS5w27hk1nP/wRY5h7VZDI2y8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DCjsz3eoAOURzpxlbYw1Mt2w3Wzi+akRHQTyhD0Ep8KV8YC3G6tSNjDFkYdhrEYADp6k29HqrecJ+BgYm8qnjC7EQgDlq1TAJrsXeIHj4k7fnVTX9MIl6sSc905uhAuf+BWaKBrRSPi9MAKe8PBGxozW8MG7YqQccZJKqbMeCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=owfKrhbk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="owfKrhbk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso359402b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 15:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723069360; x=1723674160; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZVO8jPYcIWWyL3ex1mes3d5ZlFCIJ9T4CxX0DBumqo=;
        b=owfKrhbky9m4wOA4iJYhNPOT8hpdnh0vXsYiWFMNRqec7cuddz13AdKo+iK3CFaX7x
         O4fSycWbVugnKBX3A/n7SVdDKLh3/F6LFroNUYHBByUcEIb/oAKgj1Ebv2iFg1zoVd+b
         DcBxRvX8P1g30qq/CZ7P/ljAR9LlOO0diMeR1Xg6QJXwS8bwpbkTTjGg/UBu7/udjD/u
         TrS3ZrYerB1D02O7m/Wynl0Z1QKqDBDri8ZgBjMljikUxr3VVABWl7CWbknJnqMSXi+7
         Ua6FyGUDb+F4bRajQ4G5Kqe4jGv6eNwIEiCiOYZFbyir3xySUYpaUZlaLB3eJHD35X8W
         /NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723069360; x=1723674160;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZVO8jPYcIWWyL3ex1mes3d5ZlFCIJ9T4CxX0DBumqo=;
        b=NTgwInjRAw/wCY2E64sWXat701lyAp0BJcajXvc1mtbqjtEckWK9PWx8CoGXyFcPTE
         Fp3NutpSt9W63FlLhuhdbqXc4GJVDYVXnLLntS3jcD1nM+0lySAjZ6Jn/hKeT7eC1tV5
         TUdcm7TahiPSej7hvBFSp2bV7A0plmzdzpW4csakUiOJP9+hil7miUsXL+u1t3ZMZYG5
         /XCuiCB6o6nrB1zQQipOWpTt0hENpJEFC7vp/BbhdQDyH2Vl6byHWTwMUMhwADyzh87S
         cy9jXkIBCO0BkYZ/qvdxiyLNdFnRFZZQbzXYs5Jaknsg7wXa3h4bNh+PF086qYsE1ntP
         N5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXUOV1F2d5NI21lAmWxp8CAuhxIw8WRS5uAA/8UIyS+mx9U6SWUIgxITg+PQUu2o7kggtFFXvD4kO1ZVy/w/wz0xA6w/PQU+c9s
X-Gm-Message-State: AOJu0YwLpThIpfcUHvZA4MPkDw7FtUVjXUI0p73g4LxybpE74CUj4H2r
	31FAYuaB2IWq05vuYG0qO3KOQbYIvpekgB8QaBedXZalgSlmYidmdEnD8GWj0lo=
X-Google-Smtp-Source: AGHT+IH2Cc0g0B6ra70L5cg48YZJx7srHh+PqfLxpX9PDwnG8XSpUfpqxIf7dyUyWUuyhSQCs84ohw==
X-Received: by 2002:a05:6a00:1302:b0:6f8:e1c0:472f with SMTP id d2e1a72fcca58-710cad5a30emr137306b3a.8.1723069360049;
        Wed, 07 Aug 2024 15:22:40 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb228d37sm5911b3a.46.2024.08.07.15.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:22:39 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,  Andrew Morton
 <akpm@linux-foundation.org>,  Marc Zyngier <maz@kernel.org>,  Oliver Upton
 <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K
 Poulose <suzuki.poulose@arm.com>,  Arnd Bergmann <arnd@arndb.de>,  Oleg
 Nesterov <oleg@redhat.com>,  Eric Biederman <ebiederm@xmission.com>,
  Shuah Khan <shuah@kernel.org>,  "Rick P. Edgecombe"
 <rick.p.edgecombe@intel.com>,  Deepak Gupta <debug@rivosinc.com>,  Ard
 Biesheuvel <ardb@kernel.org>,  Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
  Kees Cook <kees@kernel.org>,  "H.J. Lu" <hjl.tools@gmail.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Florian Weimer <fweimer@redhat.com>,
  Christian Brauner <brauner@kernel.org>,  Ross Burton
 <ross.burton@arm.com>,  linux-arm-kernel@lists.infradead.org,
  linux-doc@vger.kernel.org,  kvmarm@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linux-mm@kvack.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 27/40] kselftest/arm64: Verify the GCS hwcap
In-Reply-To: <20240801-arm64-gcs-v10-27-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:06:54 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-27-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:22:37 -0300
Message-ID: <87zfpodlci.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

Mark Brown <broonie@kernel.org> writes:

> Add coverage of the GCS hwcap to the hwcap selftest, using a read of
> GCSPR_EL0 to generate SIGILL without having to worry about enabling GCS.
>
> Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/abi/hwcap.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

The hwcap test passes on my FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago
