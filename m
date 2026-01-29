Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA0533A715
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 17:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707788; cv=none; b=piqvJDS1MycohNcbWREt6Xs0Zvv6S6PpFtNO9GwB5H2F8ONXlQJG/BN8RfkoK1JvEuobr5wyHM1JK02zyuWaEV9eavLyiSp5A4jrIoieaCx0HqBxuwOSzhEAd8vpEWoeFiePK11MlQrOC7blW19EI5PBKqBbczTKbe3eEmd92/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707788; c=relaxed/simple;
	bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EDDVQ062v2VILgQDux2vqgwkFL8lJWv5nAizMa0CqHlO/hENeVvl+eCPJLHNP34oNcoJrkfFFYooOu6l6emkbGZT+7E+ipE6xY7rJOfrSlA5InpMb26knU4oI2n1zagMaTyA40PFIOIZ35m7IHf4ZOpcFSaoFpG8V1ChFH+QNg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHwIu2Vl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHwIu2Vl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so11294575e9.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 09:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769707785; x=1770312585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=;
        b=wHwIu2VlC51zeYSWrFup//yLPuyf8rJC3TBNiTTLUi0VzqQrupIgBaCJ/AzM2VxAmw
         Zg1Xi0BlHaY/jdGN8iIeD2Rydh/xwPBTyM/STgtUm8+90oPOJJNXvvG72yJfnKVUB5nE
         p8ZOBFbd34St+Ip0pfYaPSUEpFxBTY9pdfhF3+XBsB1amjfdtVK/8UjhRPue+rnh51ur
         FflmD70zt4F2+5ZZBcN163zATMyhb8zTFn47J1Zok6xknh1nHlH/WjTZ2S4b2leHxWLM
         bM4dLlD92K6ZDAdLyNddhrbwye141vcvymhr7mqc3BrBJPy3km2AfQNFEBJaZBTY9ypa
         bKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769707785; x=1770312585;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=be866/Yp5BAQJMoBK98y8dBJLQ2gHvccZfOQ5Qw+jAY=;
        b=llKG0WItxnq9nze5uwcf51TxAzNCuFvqknwKNzVK87VeYTBMlT35aWfiuBxcxuZcel
         ToMnDhpbhk+mlYdOLsT6tk3eMs6b6JY2KSrvmzJJz33Ig1T5J0a4DhQbrP0HO79gHlrF
         Ig1Y1o/6//zMvfFUowhFcUh3lLDbzmgR8tQFOP/srqneIrBhW0c9gAnAgUS1O6axWMlK
         rjNxJbXzaPzbA45C/d4XFrQ4XzA04MOrc0V3PbRYa4rnOpFh6oQ9IvZ/6gNBEcZ1QAA/
         s+hYuQ3IDXkMRYU0hQ+rED4dVhmWsbmMGXrJlaHqYB4eXP33etyNRzTurN/MVb4Q2MDa
         /jFg==
X-Forwarded-Encrypted: i=1; AJvYcCXYqTo6sbpLU6eWknmnp5HSzLz7XThYoWzOom+7k+4ip4yunKY8XJdDIIhRkmLlot5AXKtIfNray0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrItkmY357sAU88M7WFQEFgmPrEb2EWwktaPHPWGiP8LHEVBv5
	JocFw4y8XTCbZYJT8DRPA5W7S5/uepWUQmiG7Ptfybe412RnuSFUiU0pCfAGYsOxACM=
X-Gm-Gg: AZuq6aKBrEZLKWpCsDuyEdNLiAsa4b8o7UJq5mibfDbTbFjTCAr3xJJRyyLaLqTwVEd
	9xefHeGlv2Zdh6T41IVGwing2f0e56CR9TBV0m+K2biFWFf7S2yrltDkbKLc9Fupa7pjYo7ZtuV
	6a4ItlBtbFYcse0hBgkUPWINwJDj8fT3a3TZXDU06E7JExnDxQ8CPXBHzI4YFRzU6Dfh9UvBLjd
	9RFden7lEcsFdqpoYZIZj0Aj/NiqGCSeZJvltCcweKhF9IO37fx65CgheY4/HuWB9IaTpLdTzMm
	Wh+Xgn/Jm+nXY0dBTiqSB4uhbD9YoTNV+u46QS+tVw5awgjNPAYZsqWzcWVP1iEOQX5kh/03bGB
	rszDfYo7JspXqfTPQVFZA4+Bo+a/YH0Gi1gWLu5AxHTdobrd7Epf+N3IO6rZTDf6uXrJz+n7KXZ
	pC53PLd0Q0sCc=
X-Received: by 2002:a05:600c:350b:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-48069b9a017mr121874905e9.0.1769707784613;
        Thu, 29 Jan 2026 09:29:44 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da8eba27sm66755e9.6.2026.01.29.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:29:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 067175F878;
	Thu, 29 Jan 2026 17:29:43 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
In-Reply-To: <76bf33a0-968d-4b99-a157-3eef076af69d@sirena.org.uk> (Mark
	Brown's message of "Thu, 29 Jan 2026 16:41:05 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
	<20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
	<87343o8jay.fsf@draig.linaro.org>
	<76bf33a0-968d-4b99-a157-3eef076af69d@sirena.org.uk>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 29 Jan 2026 17:29:42 +0000
Message-ID: <87wm1072ex.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> writes:

> On Thu, Jan 29, 2026 at 04:39:33PM +0000, Alex Benn=C3=A9e wrote:
>> Mark Brown <broonie@kernel.org> writes:
>
>> > Currently when deciding if we need to save FFR when in streaming mode =
prior
>> > to EFI calls we check if FA64 is supported by the system. Since KVM gu=
est
>> > support will mean that FA64 might be enabled and disabled at runtime s=
witch
>> > to checking if traps for FA64 are enabled in SMCR_EL1 instead.
>
>> This is conflicting with the now merged 63de2b3859ba1 (arm64/efi: Remove
>> unneeded SVE/SME fallback preserve/store handling) so I think this patch
>> can now be dropped?
>
> Yes, this should go away in the next rebase.

Everything else applies cleanly though so thats good ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
