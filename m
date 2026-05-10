Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855030AACB
	for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778454395; cv=none; b=baq31pIhJnhxljOUJ7hbFt2VUr4Cj4a3/f3vOuY6cXUIVt0Rrz6ZtulxYe9YBAPwZN8DzW4w+pTi2U/Bte9DVQSliLmFgJ+4IQQSlkyTKqXAf+ij6W2080ko7o9Wkz0ZXWjfMSXLZ/Ab+Ya/a0U7xnb2htI8JTgw2XQSqP7WbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778454395; c=relaxed/simple;
	bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+rl+MhFhCFwD5ASCB+4MG5X058UZ8DJdBBWaWySOkQnSuS3jE+vpTc8j60Lrf7oTOni5M+YMXlDRchs/jHFTa4bnoW222WtC+cbD1RJ+cSDw2TvKtNw40DRfOz/5LybsIyADdzFsE0RyaiSYlXIJssSgWLa5VDRN7WKrD3QYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmsmNZsx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmsmNZsx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43fe62837baso1811431f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 16:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778454391; x=1779059191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
        b=LmsmNZsxlnX0RFrXBAUgz3AdYYmRjtiQ0pY5/vyXLRxHlmF00je4/4S9LQ+1vKMebq
         IUiyDVTrncoW0BUICF7cLnE9sCUfVrd8iugJew5xynHN7rzpGGqrPmnw/YRqWLSzrLmd
         lSNITbfs33K4P28tc9FG+pdWaZosD/h61pZUzpuC8tyTp/OmCGifI48EBRLOcXxi6+q/
         fJnSobTyIBDZwSdkcG+gNKtqBvA0xQrhg9SRMFAveCc+/GpkJjYEqA1WXwhEU/5LyquN
         bUN62Qclos/LBxRGvc280xxAbj6RMZKBGeuSestfgND534w3M1185tma5fvIXbs55fLO
         cS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778454391; x=1779059191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
        b=A5FeHhmFEYoOf01gIusr8WhxWbeJCjYdoc19n7+m4287kmgBw9d8Fqgfxag48KSUv8
         vd08wjiWLQiybTzftnVb/0TrXaeypKG0/loaXfiGqE7KIvtOAZVtwf73HVOcwLQO+Uqk
         07p55oh7HCOYtDDIm6SVUZZ0OBefFF6NlhHn6SXTG/n+4AJ59dsXv5+acbD0Rxy/z77F
         ap90a7db9FZceNbMMS0+bXchAeBFyYfxww7xn8Ex2UgVahiWQNO3TM9km1PblNUUZ2wk
         YNq73baVojWE0Rtdw7RYbABvRN+mznm6mSWS2CLZ6AxWClJkXuQdK7+CKQopHjfSYr+M
         LCwg==
X-Forwarded-Encrypted: i=1; AFNElJ8a//+fx/QpHoa8j51cSGD2x5Yd1SQu+hMVlPVJU/nXnzDBqFt/fw5ihjHY8QO1AjGvTbQ5KR8wxPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+q8r6eVhqYAhQzqBb4DfQzG7wQ7BBPJAwMBzEEpgOArnqvEe
	hnvShtr3dKSbzehg8m/XBtfiEcHyk411guHSEFr8sCMykNE8IUqIYDRJ
X-Gm-Gg: Acq92OHAaQOLVusWUzCL/YoMYQZxTwpZVBGaGf/mNnhOvyuDNKGdv+rrTMSWhTQHo/q
	yBTaU7V0R1+C1FS5HSop1l/yx+XHU/UXtG8hQ5cTCE2xVCSBdnnXQmS/EGLrVSD8QFXWDniM2iy
	usSsH6VsMW6NpCIqeQrBMjX6swIzomTbDDHBLo5Q8esFEjc14i4tBgF2b00ZQ20QiUR+CSlSVVT
	xPf0xfYXa7E8YURqO5ro+sBXlrXgmGMor+nZfFViZlrcCdzLFs5Yf+vFnSXOdwFmYYYBU3zpqr7
	XKy7lWxHr3rfghKiTWImgrViXg8THgAm0XVYtGNvif1XAh2r8foyFIZtfuWm/iHWs9Q7ZI/HIVX
	WEDaKqNBasjX36rYJzZduC5sEULMtHFdqS+jPhS2bi+xf+m3Pc1iigwU26Ok6rIHnixHx/Qqh/H
	Xh7lrh7x795OlJQlpyULAs99wrYXRqdNgEdV7DHwjDlWbvcnlS74ojXaY=
X-Received: by 2002:a5d:64c7:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-4515d5c6c70mr34288383f8f.35.1778454391049;
        Sun, 10 May 2026 16:06:31 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm20984879f8f.9.2026.05.10.16.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 16:06:30 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <851ccd3c-d86a-409e-bd73-f0ef10b85879@gmail.com>
Date: Mon, 11 May 2026 00:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/2] add kconfirm
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jan Engelhardt <ej@inai.de>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com,
 akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org,
 corbet@lwn.net, qingfang.deng@linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
 <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/10/26 10:49, Miguel Ojeda wrote:
> In any case, when we discussed offline building in v1, that did not
> necessarily mean vendoring every dependency manually into the tree,
> but rather let the user set up the dependencies before (i.e.
> connecting is fine) so that then the actual `make` steps can proceed
> offline. For instance, using `cargo vendor`
Hi Miguel, thanks for clarifying. I think I like this path (user
downloads dependencies themselves, outside of `make`) the most. But I'll
wait to see other opinions.

In this second submission, I had attempted to filter out non-linux
platform code and tests, docs, etc. from the dependencies by using
cargo-vendor-filterer, but yeah, it seems to have missed some things.

So in RFC v3, I'll likely use this design of having users run `cargo
vendor` first.

> By the way, another option for that may be using the distribution's
> registry (e.g. Debian and Fedora provide one through the package
> manager).

Unfortunately, it seems that there's no built-in way to fall back for
other distros:
https://github.com/rust-lang/cargo/issues/3066

The workaround could be to create various Cargo config.toml files, and
instruct users that, for example, if they want to use the debian
packages, they can download their dependencies using:
`cargo vendor --config debian.toml`
But I need to test this and confirm first since I don't use any of these
distros.

I appreciate your thorough feedback!

- Julian Braha
