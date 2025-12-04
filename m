Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E433FE27
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852083; cv=none; b=Qv38CuG1pxoSSnktNv2xUHvg/SeY/lFL+TAwReSLQIcMBCOsPJMzlb/3CCv79Rt3BpFM5a7dmHIf521obURL9KdC6Czkb7NLzw0VZZcnaJiASNbpc+oOgtzR5qWRg3hpdpGq5QSKmZMAWS5Sj5piHdnsoongXPeXHvfuOxZhpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852083; c=relaxed/simple;
	bh=hG1vkzaTsWHXNInLHudm3ZoCCm4Kfa85G6m2/cYZB8s=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ex+wrf1LYZy0H997NaFVF29LVw62VKIf3M7hTLTVqQccO59xOoWF1ays3ezYAYjHo46C5GVE/4I2vl9cd5mDyUCiAWuTvk2239St+6+Oqn+vbLnZFSQE87AD6+JBJ8HaOa07y3WsxRBtAx2VmZEqUHqnBr3hWRjkzGHWpvtWx+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF8j4nW5; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF8j4nW5"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6433f99eb15so690025d50.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764852080; x=1765456880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CtmcVddWlIU7BT9xK5tcRrtmkn1+1JWSNY5cSjjYfUQ=;
        b=ZF8j4nW5FeoZMH2C2T3zN1Hqtemo6ZkiipW+rZFVG/Q1TExManR3uL+xpjWyxucqIV
         pqndw7fFWgyAyyJ3NZCh0H0Kv00vwZaL/NUJDU2VfoxDJjkKYAMex9nH7Bi1Gta8EFh9
         9cVHgjMzluYhiolo0/upiKcmlI35I9gsxhpYBd/UDLnFPwPCToYR68SiAiW9b8BVZucv
         TJ1/fjMedBr52yjSxeO5O2K/ZT/s0PuQ//08I2RZMXzHrwynE4j5ZCt773P+Baf5pKg5
         XMCxMd5RNUvonkqVpPHIFwuJDvoikj4Ouqvbutq7l3rMK6FHr5QVw4mEexOWvm9WCbZi
         4CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764852080; x=1765456880;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtmcVddWlIU7BT9xK5tcRrtmkn1+1JWSNY5cSjjYfUQ=;
        b=to6ic+aR6Bg9C0c1hWGq6g3OfI/pL1iY5awGEExq6ago7gNC1JyVZnQNbeZQ2j1KSC
         npu5mMampJhc+/O8nPMoBgrWXj+1HLNMXig5Uhaq0EeJMRCGf3sNWuXG3i51IDi3nz0r
         RknXB2TQuqzuUveyELqxO4l23IxHiRxTriIHUeXA+3nJ/6JY11F+8Y7+i42HAcZhdfZ6
         2Djvd2yl/ry7dUSuJ6OXD8nBBBkIhRpl+6T98ZV8JcX0g7H0EoOCxK0R03BxxMh+NRYP
         3osBVIvfctEMmtPaZ1nEvVw38tPsQYhMNAT+QKlwkifIGFtzpgkRjsX2qnTbCOqPPxYY
         8byw==
X-Forwarded-Encrypted: i=1; AJvYcCXp8KqrVPylyODGyKC1+TWa95V9XUKnRolh3A8iD94w6TgmAbeVbcEjLef+cKKo2XYm17qBGZA4KdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83mmltTzjrFCwGEA2o7CBvjHzuw6DmnA+uwVY0vaKF2H1q3Q/
	v1LLRJXKe60wi5HGvpUpnWVE3YGf7GlzLy6hGBuMjNfc2hNoZcKf8QET
X-Gm-Gg: ASbGncvWid8OprwVNaPUnEOPxDOZj34LRI5lguqhZDfcQ+NCZbd1RkTjfy8qYWEuXPB
	xrswKNpE5nA5i9NQ9UAeaGRqViyc8/Rh/TFJ9pvLSzQ0qZRLHHat31hOtlBlmIQOomQmgcNHezh
	TZrMGB2vHZExjl0TisQOBKiH53Tuly+r/sN6JtL/O/XL/sdXnQVc/GE1mG30sjFW72k1zhm9CqX
	CcXrEKsCuv/JFoEulQgYmERMeSxsct3lXZlv2bObgjMpbVZRCNdoj54muYmjifLQ5SoNLbRIUcf
	r4k/qIkOGvZi2pPe7ITA8OrKoRWEpNXIYv4ivc+3ZDGUtJMfLFbzUiewWFQJhqGcFVVUzKf9Unp
	vvmTXgotgWPX0aVEme5/0ZzNGlE+CrCsZ243GXfA94ru7xrd/DlzIkS61BaqDonyuWnQN8kRQn+
	OPtUlZ0AyBUhf800MoX2pBiDPHItNN20yT4CYDNxm2
X-Google-Smtp-Source: AGHT+IHJA60ZYQi9bh/oeg3T2d4XWf4TlPAq2CBo9e/gVJnloBN9DiCKQRpeQyWtcS1RPasu2wKg9g==
X-Received: by 2002:a05:690e:11c4:b0:640:caa5:57bd with SMTP id 956f58d0204a3-64436fe7dc6mr4661174d50.37.1764852080011;
        Thu, 04 Dec 2025 04:41:20 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b78e892sm4782487b3.44.2025.12.04.04.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:41:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <0c63bb4a-6aa0-412e-aad3-7ca3ecb1361f@gmail.com>
Date: Thu, 4 Dec 2025 20:41:10 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Language: en-US
In-Reply-To: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I noticed that RISC-V CI bjorn/dtb-warn-rv64 [^1] is failing somehow due 
to the error here. I'll look into it tomorrow.

[^1]: 
https://patchwork.kernel.org/project/linux-riscv/patch/20251204-gcc-rust-v5-v5-4-2d4f20d86c24@gmail.com/
