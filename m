Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D639335096
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836802; cv=none; b=NnEe4sQ8WUXAHoRxG6vW9Z9Q0ioDC3G2FQUHa4aa1tbbh2wc2tWOoyzcBFPbyiZEqW5Os/8f4lSXkb+R/gK0IvL1Kc1Bq/HSEfmtLK9XjnYzlYKVA+1XMV+eO0sVZxinkhZlikgKSUwX204Nquy7hVkY/HPNGSq9xiQr+3fRDTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836802; c=relaxed/simple;
	bh=5nYFVp69QLdOo49fMh37kOqCk58/nQX82HtuIDyE89o=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kyANJxYN7JbTh+lErUfkfEU6y8eSCHrNJ8BdI457sMJ4mt1isBaqMCTRJlujxgHrGL0PgVsI/lGtpG7wsvAp8/yXN/IgbGUQI8wNAxAaX98ubKm4SjqPE+Y1jwH84mtOsejqSjlSvV5r/rEVXAqd/R/EA8BoXnFurK22LPjI6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh2KrTYv; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh2KrTYv"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-640d4f2f13dso652200d50.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 00:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764836798; x=1765441598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VEV9l3fSrsq44TPrk2Pd9zy/qdoP+RNvY5XPGpJtMhE=;
        b=Gh2KrTYvR0JiMIIeqArR6hFkPU01zMN2LB74RC78+JNq+4sOnx8GheMp1lc8LGUVMA
         +8wMOhc+bmj0xBVzcwmW+S4jN0/pP6OadzU57UUUmNOyTm8U2Eueq3LelkI7jPfX3RIL
         4ba115YI1RlcmBYevOWkRGNPbpxeYQEHnw02ILrbUuLuYLEjvVxoOLbn1dAMTEpKrfgu
         u8DEifYZHIrWaImg1WbTTovZ0HX5BMEIPtLcMomGOs9laG3SxbUIzOUuv71Z/+ymmjYD
         DF6VEMxKYP57zrrc9p2vD3DbqYMGWizmNq2C45xyg/bYOqFwVPaA0sVXBD/GkVSX+oGM
         YC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764836798; x=1765441598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEV9l3fSrsq44TPrk2Pd9zy/qdoP+RNvY5XPGpJtMhE=;
        b=N3dgnXe2h1/6g+vyUNPgCM8oh/BaO6Fri6syJL9KuAbrRvLD7vhdElgSIdOhrzKVim
         kUbLeJb0wDZUFdr2a2VMnzbD5IjsHgxHCPRiNLjzxNFrPcw+F3oiuo4oeK+VvTwOTQi1
         rmsP9du3H0Yq7IKsgXOX+RnuIGOQO6Xs1dA+wtbW+CQH/rTO900KSlB3DW4IWPP4v46G
         k5OAf73VBPLMJMDw9mebF3KkNMBeLfSLb53Wcjv1AUL/1bZA61XdAAl2BLLQnFYNWujS
         IdI7Y25R+jqy62b+PkBEPGFQvRjr6X1EDR5G515eVp1XxmTZAli4tLOXVAY5abzQ1PSO
         kbWw==
X-Forwarded-Encrypted: i=1; AJvYcCXtlcRU+qM85RHeEE/XnFG/GG55p2nYUgkwuHGUAnFgPpCwAbTHY3tXn4Au6MziYfNTaYxlpz+RF4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyABqm1MmzCBTMOC6PnZtX43XZnS1ooQ+qR5+DpQd2uerPKmF4
	c98VTfUC3p8s4YDzv5mlDAZmCJtcAZvMJcdCrrM4E2CsWlrcY8PMeAYT
X-Gm-Gg: ASbGncvM9HhhREMxak4MBMpJw1le5Yst/htXG7TIqw/+hhdebxCvYn9D0Uw6VwbDtpU
	R0xJGFMqNKwe0Izdfj0v1pBIwyiT/+LsV98pd4ifILntf7Y89F2L8WVe21/v4gXYN2dldqu1rXk
	0L6/M/nZQZXhtSpZkjYLfG+cAjx/94JdNS2mrbw2Lzmmy/zoS5wDkRUmB50Yv0D+p90AwXx15Jk
	Rww/MsBRHTLZThiOwxu3c2cEBn6uYtqG6KcIfLoNIGLwpISfi+gdSwSxje99Zk/YliJ92C0x7JP
	dmwG9mP9wlPmk+0O7S8EX8cY/Dpd0PbRqob136+8ltnwO26CzpDRgknn+GviMD5spVqrYBl6z+5
	SqxU3nha/dfS8w//04qdm3utbePf3R6QYe6MzyzkKLvynY7pjo8jipsdGPzH2HZ6LqZiuTrx1a4
	u7AvNhjeTfS8LBkhs3f0lkW22f83dkqWBNH2/Ga5mg
X-Google-Smtp-Source: AGHT+IEToPXaJNU3FPitOhzv7XRD5fMJv3RarJ69HwAUtDs8DEKyQvLYwMwVPCfHblHOk8hTaaSfgg==
X-Received: by 2002:a05:690c:6f06:b0:788:e1b:5ec5 with SMTP id 00721157ae682-78c18956f0emr15033157b3.70.1764836798216;
        Thu, 04 Dec 2025 00:26:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ae534sm3349687b3.3.2025.12.04.00.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 00:26:37 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <74cf3591-fe3d-4005-a5af-269e4c806d9f@gmail.com>
Date: Thu, 4 Dec 2025 16:26:28 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] EDITME: RISC-V: re-enable gcc + rust builds
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
Content-Language: en-US
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore the "EDITME" in the title, I forgot to remove it from `b4 
--edit-cover`.
