Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2C230BDB
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 23:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765064505; cv=none; b=CbDyoUKUqWpsSFnMZm420RKK1RakD57AEPTH7BjU1GGOgKGyn3uEwKC1h2AbVli0YBEs37KlytlSryIWOzSU3OqQQcXM1sX3tGBFXbmN3QR2WNKbp+mWyeOZBgDLjdJ7YVoJkdfTuPbqrwLPfnyrVvEaAuL8Y9qHkkH/4HdZA88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765064505; c=relaxed/simple;
	bh=2Q/7XbQJvjrLnrR/4wKTgacaB87PLU8rSVQMMxnKDKE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J70RM07YFYRKDiuhADqgoWJePhbrQtbbtNLxntFCjP77aozwjxn7AzFKU/LegcskPVvtSN0ZolGp4JjHWS3DXhB/tP6zNAeKlctG+LNqUaN7yrXwzTdMjOJlR8JYIOJfKLA3cE7+s7IPaPwA4TWmSdKG0raFbqTH8UlJZQQ9PZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePbt8rTl; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePbt8rTl"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-642fcb9c16aso2879594d50.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 15:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765064499; x=1765669299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=ePbt8rTlE1/eJnR3sxlgLCX439LMvWsXdYqDxSA+rAA+wjcio2o5qdAW69NWoHSF/q
         uT0cDQ7XpImbiond7HESH8CUO09+l1Tf+VyzTxeMUFInb5tGKBFEXPvqtG1J6HQ2+g6+
         S2Bfv2iqXLc46Q7PxygPijpCgWZdQfec01YtKZx9LFgOFogj9G123xUhtSp3KdMTrrT3
         qyGY5FH+b+lmQqhb73ZXslptbAtXGH0bzSEqifHeJThhpyXi2JBdZO7JeOMUe7HQMdhr
         I29RZjK9nRLC6wZqwqLNn0U6DaIqKLoLA06pBWGrMXXy5XihSHqBBlOVKos41TZSC++W
         Q5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765064499; x=1765669299;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nQ97AQ96O1qql54d6/+KFTRMlBQlefCiU4x+CetKzs=;
        b=pJCA1qS2jyat3sqY7QicqkRoBK5pd7DSf3e6ILmHqAyAOdb6nDAG3Hzj74sPoWu0bk
         ULB/spBNoPB0/5jLStiad+q9drD4ijkjEYt5QMpp3TZERsYU0wKH9P2CH8PdNO2P18qY
         jWtBMKvqRrzqxE4tzDpW/BMNQLqh6ycCJ1LYy8pKuRC/ODF/F4cjBVmGQX8YyQNPX150
         9ze8Kh6Ja9rmYgkzHIsC1CXO9r86dcHdImEIBnn9N143ocRh3JYbyqg8xgQhlL44ONHB
         sVBEFdpswv4yzM20TAt1CJyFC5dxbiF3NgyKOxeRa1tL6OfxRtqqU5IhkPgKvw/ZLTGW
         u8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiahtkU+5y5/mZIisvzzclYCWnQv2y1JOIB5YIomm1BPs4DrXfhdow4W5FQO5Hl4vrRnUHHPoCGtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO+gV7AeCT3vWtkGMC41wSfyyHbUUg8SIQk5oWGzi6M+C+RNB4
	vsKWs3ZQ4QqV68VbvMsO9o59hrl/lLqY0UeatMT3LUC5n7yhWzbaJOno
X-Gm-Gg: ASbGncuN8+xWL8kyezYx5YO+IMx92UnBVKSIAcCWk7EsCg5GAAitNUa4Zvm87FKm8eM
	PASlMoW5rQOk1UfJ9IdtbOh2gOAYlhabM+lsvsxAXLyPKBqYmxna+eFWOiUvmpZ1m5rpizvvnuw
	WBUfWxLz8hj9GLyaGfYCasU2BQMvgfFmPAs9qekew/rPpPLdLy1+cGOlc02hCH+48U9ALtpKY3m
	p9KmCBKQqXnJTh/GkO1dC4qKc35F0iKugjyrGzuZ7AtLjJJQWCQA4/bHyepLB2ZENnSz4qZTjDi
	wHX5g5Vtyo5fY9PPnZBAb/1AP9QOoFzmDnQ+z8m06HZm4H2891FPygFKqOAwxW0dNucImgMFqLW
	2aeTFi0jjegwUTVKiVJz93wrrQ2X+d0k35JGEPuQ/1gbiO0n6zh7Ep29WTag1Xev32pQHRvUPQR
	nG6xQIAFeaM24x/4Xyeo4endNSDJZpJ09xn00n9rockKZG
X-Google-Smtp-Source: AGHT+IF0mKyXnKTQB1xhzD6LpgpTfgywW7IIal9fCo1GqYHTHD2NnE85yzsXQBQPCshexFlzlGdhdg==
X-Received: by 2002:a05:690c:7404:b0:788:e74:b267 with SMTP id 00721157ae682-78c33cb321bmr61970637b3.65.1765064498716;
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b7a72dcsm31972167b3.52.2025.12.06.15.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 15:41:38 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <9ef24254-2761-4a0f-9c4f-342293383800@gmail.com>
Date: Sun, 7 Dec 2025 07:41:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
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
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
 <1a6bb8cd-cc08-458f-a6f6-cdfefd327320@iscas.ac.cn>
 <9687109b-dc93-4535-848c-e5f22aeb8e9d@gmail.com>
 <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <35bacd20-c7e8-4a3f-be79-aa52701fc257@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The -x argument should explicitly tell (lib)clang what language the file
> is without needing an extension. I don't know why it's not working for
> you...

Didn't realize that I should pass a `-x` to the backend. It works now, 
I'll include it in the next revision. Thanks.
