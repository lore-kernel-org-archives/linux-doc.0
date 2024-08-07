Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444F8250EC
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 22:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723069607; cv=none; b=ndEdilT3W73GRnj8LE2B3w/XqWBAsqUzGa6sWZQKYpGdTb8Ei0yj6iIOsU3qoQ9NlXfbLP8QEZ3q+dk0TNFEqn7cgG6/B/BC3Z0XXZo7e9mUvqdANXNlYyeF+ILiNCnSNoQhypnH0xy6j82FIeopPoXNnn79wlN2iofd2JGjvC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723069607; c=relaxed/simple;
	bh=32biW44HjRkMPGPPp6hzCLrqIC8l+yMka3jm4zZkurk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hGJjivdnOWGbqTbeH1LpVH37wxiecKBnDj5zvWM03ONVktICoOppSft/5e9IvVUA0VGs+6bF6qQ/FaQGgF1s4/Cv5h5NX7wS/+FZI2Up/DvYDhnu+0K0+0prduFvFwGpNV/wvfiWqOfSIb2SU787PqKx6qC9tn21ay5X2mnLmhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cE0xkHI+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cE0xkHI+"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb5b783c15so328555a91.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723069606; x=1723674406; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBIy/YIYmaABmQA3j9o1k99kZxl3FitdDB149roFRGk=;
        b=cE0xkHI+/npPWDdkm6Q6kWCcDYeLq5vNnDL4TP0x2OUlksSKfl/u0ozTCqB1oxPfPY
         NM1/ifGqgY6sQBWE8tkodH3bYsFw4dT+69wz0OIqmaTyMk9/0dmdBw5PjdY2aV3ui6He
         on86miM5Br1e9zyA31+lND+6TDkcjaltWzpchuNGmPd/xy6X3UtRZCIQiD9mMCWvd+0h
         RpsJoKv4UyBR3Xd44s9eILxiAjByUwDzqi+gA2G/cBzbUAqclyRq8gBwFNJAjk2qATni
         cM/hFdisY8wNTf8IZYPx3V2buK36CnrwvfnQRpP93UBSh4Kxc3XzKjNIh+EfeS4iAD6A
         v+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723069606; x=1723674406;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBIy/YIYmaABmQA3j9o1k99kZxl3FitdDB149roFRGk=;
        b=GnnWevHeb5gnqZ4W8qRA924FzD2WzsKzWTY4/n9FXPMLHON9gKpGCc0f+iotEV3dKA
         O6+eigleGqG6JQLWZtYyCfsyoqlKM5ca0ra2GP0cFTdRmg1/hxcPUX0efREQ7aVzapSd
         nTm3LrwZ5Q8WzoQ1jwRGkbPtlR5nwJxuNXP0l8GYMLGV+k6VCzbj8a6+mlePMMpQh2B0
         VVAuOsxop+PAkx/032DfKi8wbhgUQOluTBYztNyImhE4Mgo+HqlbXaH6yR/zPUxrcW83
         g0tU7CA0WlT9ucMRlOdeaVBuYCEn159fmFCsTzRHowE5jvO5zNYhRg1JD45oY8+ASLlM
         TbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfE1YY3Nr5iuS/3uOOtuis437stjKpF6xJrW7QVGmuPbOAz7s/wZE0ZNf5N80BgfwPWOUZKhnHio4L31QZ52Y1X6jU6VsXiZzz
X-Gm-Message-State: AOJu0Ywo/XAQ8tEStga21hUM7AuURgLa99dSoj561U3Bbiu0BVsKicVF
	iksfPAuHAAt/bK7Utud6qgZ3DV2UysgOhvR0fhvJFR9QPyZDGUV8NkokTm7zcII=
X-Google-Smtp-Source: AGHT+IGd6zBFgLdZrc5fpXn4Fk0DlJIehtL2v1U5+1wFJBUpqiMspCMgOYDP5uaNavgy/IJn72zPoA==
X-Received: by 2002:a17:90b:2350:b0:2c9:7aa6:e15d with SMTP id 98e67ed59e1d1-2d1c33d4a01mr27917a91.20.1723069605605;
        Wed, 07 Aug 2024 15:26:45 -0700 (PDT)
Received: from localhost ([2804:14c:87d5:5261:6c30:472f:18a6:cae1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b59ff2sm2100472a91.49.2024.08.07.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 15:26:45 -0700 (PDT)
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
Subject: Re: [PATCH v10 29/40] selftests/clone3: Enable arm64 shadow stack
 testing
In-Reply-To: <20240801-arm64-gcs-v10-29-699e2bd2190b@kernel.org> (Mark Brown's
	message of "Thu, 01 Aug 2024 13:06:56 +0100")
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-29-699e2bd2190b@kernel.org>
Date: Wed, 07 Aug 2024 19:26:42 -0300
Message-ID: <87sevgdl5p.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> In order to test shadow stack support in clone3() the clone3() selftests
> need to have a fully inline clone3() call, provide one for arm64.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/clone3/clone3_selftests.h | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

The clone3 test passes on my FVP setup:

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago
