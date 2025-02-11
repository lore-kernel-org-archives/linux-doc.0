Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0B71D5CD9
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 06:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739253952; cv=none; b=rjY3fTMYPAEE/xfIh0aIRcilJ2l8UhWr88KBZw1+hayWmKUjFmA9WNvbmUtZberBsSzP3uU08vKH/ZOP+WkkZekxCVfX+N4ll/1XV/066giZAOXAz4ddICdVMC8mUgDDiDu24gJANHB/+h4E7+5QUtv9T6NHNABm1oL1ATpwAoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739253952; c=relaxed/simple;
	bh=etI1X9YYise9QDMvacxx/FUON9SjznTzXVvKpdWkWyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ju7dsGEeXSRlIr51B+Mj1mN8vzvPigEr3RccjIpycD1T98JpIg5gdl6SVn7kk4yaQ7NkR8UaiAbZEfpQ639nxzAyMguvJGhCcUyTNNHu3pqPQLCv/sdUWN0tYiyTh2OHOpwVt9lJtURQqK/zSnK1s+Y6TwHlSMk3zXRfqBPbLBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fqFSAtw1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fqFSAtw1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f61b01630so52357995ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 22:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739253949; x=1739858749; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MBqIRdwxcxCwshRcxNA0crppewQ5oTYfihHZZAluN0=;
        b=fqFSAtw1ais+++FtIWx5Ockf9NzVWgV41LWrtowuNjFu0OfZA6DQRtoYipKUvfK6x+
         m5ikmfseZwYpKJ5Y1GQ0C5HOiOKX5R8SED5ksq6lJVvBF4rDC68UTA9iyV2PqOPz0Xwt
         ayxfHmksQcR1srsrlKVW4GHsJYAeisrQOEf2AJeSdygvWXfrQQ35zcXZ/5UqJLrx/vqr
         6Xezfs1SMLP8jo2BhlbtzY75T3cDHBgI24C9sfkBHsoMNaoTZYEFgF3qzUYcPhE/4byo
         H8qodEZcnanpfz882r3xYPvX1nCHBlvacLxTUjox7QbPgXDI91ox2A6zaTb0xzWL5yNk
         HUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739253949; x=1739858749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MBqIRdwxcxCwshRcxNA0crppewQ5oTYfihHZZAluN0=;
        b=cFiyQy6hi7yRNrsGUwr/7z4GczfMJivBM9kwLdoRQkEly3/OaE36Qeashu6qqTxAj8
         5NX/+j1kE2+VuczqzyTPuklln1jQRLZvE3dikAwdaAgbhc3rrBhQaeG/OhXlcwdFbv9b
         fb2kCNQNtXTJ2YqcbzncHQMVMpX0ADBncLJKsE302SL+OAZJ/3S8QW4w9dNuxER21KWt
         DGfnHGGMXHbxhy5XevqUEqfuMiKb/f69XMbRJqSqyFUP8jNQ9S6VotwKL7hXDX9Ud2CZ
         lsAmvMv8FHBPYrOXxU+wqTDVSt1yxonT3S13nva2tGhAb2NtID+9Ki8EpFlkeyb/70n9
         UMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnyGO/ntyEWxjKUMcFcn9XqJrNBwIqy0/fK7tNPPX+c5mOgkb37VXyFaOAWXacY39xO9LRZLIBQMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOg6NDJrWpdHAz6qHflzjVBqQe0Gol50sL51pRrmESeNvgVg5i
	QsNEbEwpAYpxxD1xGRh1+m4z09vFrGAu0H50c8yax80JyWH8bMr4MllvVZbQCr8=
X-Gm-Gg: ASbGncsN/d4PNc9ITWkD2pb1HENpNV4rN3VPU+rUDdDeJUta3WNn441uW+bTXepf9j9
	u1E2AJ4Hclpi8KSiHe4AuYqoz81tN9VPvk9vhWN+AfMlHrg4iYdi5VJ4OT01IgoY1lZTN+PCTks
	JTLADsRWFnFvJNacE/z8osmqF8pImWr6iDVm2iJzGNPTaBeQBCrR3tg6e2Aep6eS3yIfTqhRJwU
	dAl4d7UT8lx6j+QygSNC9Ry5P9cHb/D3iCMy8FyoqL7iqgvgkHNSOEFT1261RK9bJTcklVB4167
	aDB7aaawwzLieVPUVicfJ5Ypgw==
X-Google-Smtp-Source: AGHT+IH/1R26NlLJZyOyqaoXeZYqCyF01+N1vBhKDh4u7o7gbIXbZU50VOk7nAyf7jdBnJTufNHygg==
X-Received: by 2002:a05:6a20:244f:b0:1e1:a920:225d with SMTP id adf61e73a8af0-1ee4b77355fmr3102269637.19.1739253948792;
        Mon, 10 Feb 2025 22:05:48 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308aa3a1cfsm3437000b3a.137.2025.02.10.22.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:05:48 -0800 (PST)
Date: Mon, 10 Feb 2025 22:05:46 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 15/15] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
Message-ID: <Z6roumtGyFOfoOiw@debug.ba.rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-16-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210213549.1867704-16-cleger@rivosinc.com>

On Mon, Feb 10, 2025 at 10:35:48PM +0100, Clément Léger wrote:
>SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
>misaligned load/store exceptions. Save and restore it during CPU
>load/put.
>
>Signed-off-by: Clément Léger <cleger@rivosinc.com>

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>---
> arch/riscv/kvm/vcpu.c          |  3 +++
> arch/riscv/kvm/vcpu_sbi_fwft.c | 39 ++++++++++++++++++++++++++++++++++
> 2 files changed, 42 insertions(+)
>
>diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
