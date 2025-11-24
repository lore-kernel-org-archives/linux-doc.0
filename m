Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5828852B
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 02:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763952137; cv=none; b=Z4mfD8rlBsWmCUVoMkweOaj6SxMlM6aQ+C17Ea9XIJk9dO3jRS0wJ5+jJZJOoecDwPguNUEKuT2Jd1qFdFKtanxJ3fnlToKkHlbmDYxPzKZtToBqTyY4tFK8EKMfWhGBVpknci0PtS5bXU+dszDX46HqO9Z9I07WjemAV4KZWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763952137; c=relaxed/simple;
	bh=2oubYlvBWNBRgKO7pXURZQwzgGqjYFhnanOmPBQoWHk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=A7Ir4RTuFOQJpofCLCP5+4BGLzksi2s/GLme+9javdWbwhXCve22mibgTqlscBgLKW2D1jdudNLV5go1Hs9/TUYWh1q4lWlrOr796ZGuhsCrpriTcFFHyLZmVOdRz2UWGBZmVxe86ffyS3HTS8dW5uluF0Tx/bhAXrNzqyD/DIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQWi2for; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQWi2for"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bd610f4425fso2273908a12.3
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 18:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763952134; x=1764556934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvmpkL2pKIFur0kWWa5PPAZWhiSzKqhwPQTIwYGauJ4=;
        b=YQWi2forbBqyO0pBJUMDQ5BiPQFH+WFMP6wB3ieyauAv1DkKmx3CART3dAT3mhSLhD
         mxHSkxtvtTeVv3iScROovCQztiuSVlZUTIWBoIwq+gty0n0HyvLFj82X/xXRLM8Xl+Le
         te6Oq6eEYj9UWGRk93gudUMr1Ols+RQahKAmfgG6jhFqyCajK1DGNcH5VlJIB4gl0kgC
         SGT2bMG9C7pQA+LdSR3nlQLTvzMf8fafOK9yX5YJgiGLafvgjOE9LQighOddP5spp702
         VOtNh4mHBebSMZ+kHaO05ASwT9ublC9E5/xEZBu1HCvi9rJNKyKepC3VC9lfXTPASVbJ
         3WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763952134; x=1764556934;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvmpkL2pKIFur0kWWa5PPAZWhiSzKqhwPQTIwYGauJ4=;
        b=dJk+pdS2IiBDqknTywYFoOExYVWudMOhYCABnZEiNpQaVu5iaSq0Q7mtYweN7csWus
         MLNcj5Eh69I3z25OTeGuTJdt815KN9WIS9nFiT2zkGTh0miuwMAmLnOwbiGlMO2fQFfy
         +xKxqiYi4jAwDyFM+iaSw0TVC9nnsxHch9VgKqQRaq9wE53qbU0HiPdIkc8Oto4QvMct
         dFpi3i+q6Hg2ezbNEo960uTjtvepSUCzZAcjSHMhPajOjW7k1SpA16XhZJf1swaOY2Xw
         srNmrUjYZ66ggfihqOzJxTobx6kAj+wVRS/HulG3bPADwg8P31nGrZcwsHFl5uFdM22E
         cBpg==
X-Forwarded-Encrypted: i=1; AJvYcCWsnl4cgK0iLIOzRIFX366kEfnMadl64eR2RJZ/Goe9TiEDS7WSAS3XqxK+ItUYyhZtEEz3apZj+z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUe9juKdvWf4YiOJ0+HNj/L1rryD2RQfV2X6ZRh3juqzztZjLq
	96G2V73Veiz2ncXAfHV458a1R0bU+0g3sNtwfiFDJ4EThDMRCblz2ZTX
X-Gm-Gg: ASbGncuFQo9gRMmQzVwoud2L0lut8ueOw/T3UryBwSZb9n3GK8WtWUKdsnen7z1liQF
	V5BbKw/9+hXtme9zn3TRixXLYPLfoTzbv45UoJjRkMoseBKH0nHtRbx4SyL0Mj479Jsnb0v9MEF
	y7vsss5VYPY+LHvC1pxS88lVfuO3Ony5nwgORyBoItJd8axjDIPu/vDD0mBPNd5YSnhEmAzJz8n
	mxkqADsyURn9eHA3UwD/KWL/gC311GrEfObcWXMPcuRbjlpjPyjnRKp96j0Vm7Fq6cYkzfOxyxz
	sOJqW6RGsdIlQ4YxisVft1zTv3KyoxLnSPUwNj814yaWyfBK0H9W6pdHtInFforJpetx4MiJBUc
	GKrnUGk6NpMtPtiRaT+lOIdVGTx9y+QAEPrgdGKuHjffY3c7o/UYDsJ+H5J39JZO7J7VrjHrIyv
	QBrOUoSijtqMssQsRzi0gUbw==
X-Google-Smtp-Source: AGHT+IG1OvJ94QxB/0B5dUPh/eDPLHHoAzRcr/MIUUe+KPUWPK22zAbeB/idFdwPhcR+hgsYZWBgug==
X-Received: by 2002:a05:7022:f50e:b0:11b:38c:5370 with SMTP id a92af1059eb24-11c9d712e3dmr5385199c88.20.1763952133924;
        Sun, 23 Nov 2025 18:42:13 -0800 (PST)
Received: from [192.168.1.209] ([65.87.8.213])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm67907613c88.7.2025.11.23.18.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:42:13 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
Date: Mon, 24 Nov 2025 10:42:04 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
 <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 9:48 AM, Miguel Ojeda wrote:
> More importantly, should we just have a separate function for backend
> flags? That would be easier and would avoid having to use the
> environment variable, if I understand the commit message here
> correctly. And, anyway, it is actually the only function we need so
> far.

You are right, separated might be better.

Another reason is, in `scripts/Makefile.compiler`, there is a set of 
functions with the same name provided for use by Makefile. Since we 
currently do not need to check for bindgen options in Makefile, I didn't 
add function for bindgen there. If we add it in the future, the 
`bindgen-option` function in `Kconfig.include` will correspond to the 
`bindgen-option-yn` function in `Makefile.compiler`, and 
`bindgen-option` function in `Makefile.compiler` will return the 
selected option instead of yn.

If we don't separate them now, for consistency, in `Makefile.compiler`, 
`$(call bindgen-option,-- --some-flag-a,-- --some-flag-b)` will return 
an option prefixed with --, which makes it difficult to use.

I will separate them into two functions in the next revision, 
`bindgen-option` and `bindgen-backend-option` (or `bindgen-cc-option`? 
Which one do you prefer?).
