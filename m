Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBAA451071
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774996710; cv=pass; b=BSCPadBRLJE2c6MOjCKKTUC4365Kh2yVoNLgE4SA5L/1Asm4wOpK7rPZFiK5DzrsfAzlHXdKfkRM3XddiA7RfJ5FqSzFDJXeEYd1Bn+tAxOmI7tQSI8oie8memh9b3yjb6OzizP+UYLjtHR9ppLEkZmLkkxzy2G35VzCWfZKGaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774996710; c=relaxed/simple;
	bh=D8MLWbI+n9+ahounFvhbr94CpmuR+bkGdr/J39z22GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4XTC3uiW8lcF06V1YTaqW+ucAg1IGpJzkTf4Mx4j2qYy3wB3SyumVY4Q/hmdPfjQonKjoGf59o+qkazfyWOO+QPbfWM3I80NTwD23NlD/DR8BMZa8OykkLI4Osh0zhxmEvfbBGW4CcvZBQ5FtoeEWiQODRA3rFFoGXCDxeJvD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIrMqD2W; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIrMqD2W"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d743cd9e5bso4109873a34.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 15:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774996708; cv=none;
        d=google.com; s=arc-20240605;
        b=TUXGd0GiwJyKLxGtHk20TWmpm/pDPNhqYPBcgwtE706eciY3lBAU915PVasfZBwsVc
         5xAwZKyAfaWcWBjO7PjvGT4VAePF0FgNPnnNZ//VkfVTyU3Yi90UR22Z0W7d+Bk7K2DD
         EeUF3E4BZaD8Yf8qHi0WGlJOPmICGqVvcxHM8NFuINaqzhT8leevgIy5gvcYNb/etvLR
         EuKpGx/fwozctCmzu1h3ECNKQVokHBoQMqccxPJNvJz08f6gqR5dCsRsjLyQJv9iV54q
         XbrxN2UTN/Etef1+wGPK6hrb2txYRkEbFpm1YZ+fZP9GlFSzfbQt7jtVxZQWsbdanJYR
         oMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNGMLTPO1Mo0Tkuv47bDkjqBfjTZ2+DCHCYz21cww0k=;
        fh=lgjnXv0djsT/tBDYinPSbqBnjvVu/KP8ttvzApb5zK8=;
        b=k1frrQoJWObsZokWaUQwQIQfB8VApElH2YBQjeFcZLbaFTU5k7uXEOefQ7bILhC4oZ
         +nQ3tyMb4R2BZGxWHlS9nETM3+gL0C2bavASqUFnFXZnCtkqw/gcnBcKtvohJe3r+t9M
         L/zaECmtEJtW47iOlydeqnPz9dpqBewjTUh/OEFhmaxAxrzS4BGYR4BAGsr5gkWLkLKK
         ZtHJjFT/XCWhRqfKgmLCsQt8kxnrfjKhJmIV67HIcjgtkgkB0OHlU6P9DKBh5JVkem4k
         TRQRMBqiRa2ixq0FdjRiVLF0biB9kqY3hAEmGIOxeVb+Dx6sOV2gh6fu/sLLoS45YwG4
         EBMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774996708; x=1775601508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNGMLTPO1Mo0Tkuv47bDkjqBfjTZ2+DCHCYz21cww0k=;
        b=eIrMqD2Wc2t/nxhcdVhnC/Pn4XSK2iMYsR1aiyZGMGZHBW0DV3+SPW9wmxNC6NST9Y
         PxGNXwspo+yv7N6JtckRpMF1oYIGAFFDIrivByi3AjtCuKfgc7Hm01Ye7bJZSxBLJaAu
         eeaJ/N71tmB627N9Aij2yKrjBUTVvu0lhfpKLYmIN5UU0ZSbDDRvDhr7BPzEPRtvQ2yK
         eKUTYqkrS3X8vJRqYhwTey+wA1bvMEchoCgBe9PN/HVYIaLkY7F/362+PW5Utus/r+Vd
         8PKWE+RoGFLl8AI5GICA9gLXN1op5OfOQmd0YW0DSl/+OEsPe8XDNyAWw2WpqdPvjFNR
         vLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774996708; x=1775601508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BNGMLTPO1Mo0Tkuv47bDkjqBfjTZ2+DCHCYz21cww0k=;
        b=Ctgkm6tKammyg1ZLMy74QjdStIKkrlT8f5RfHr8hjrB1Q0Pp79DbO/lVSz9UA9WAft
         4QIpO34724pZViE3ILNqiGHAvrg3Cekut13fK5uQKj4NonIReKr7Wpm0yBayk57u5Wlj
         4C0dGBSXeyUBdcQgdG/rM/6BByGplRDHpfosgp4UqQrkctaRvfFA1QwKJE6SEpZwhh2f
         s7MvwYnrN0Y0EfeEroWOXcaKED7mpEki+D5lofhJX/1BOyL4dw9RnARVb5rzNY63vTLl
         OZB5tICCPzEk3yLtuCfD9JW2S3J/i2/wuawUSrVFRcB3c2KWkesEZLWPWyWw7L6Xqggu
         LRlg==
X-Forwarded-Encrypted: i=1; AJvYcCVI3VgzclRLSTqcCcoMeVP9cJIPrNYAmjA3F5wjxosZvsw7zCoFjl/Br/VzYLZjVec8jeutPP3B20U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyau1gEDS0CujzoOnyFme3cLu1gwaP+oOer75pvYz/YzfUEplSN
	9PTgAQm+wUG6+0vIj0evDGSgX/uOi1MtZTN63hU8BNJg2hzxOY/mldw/Am0dUxt9t9czqhQRPhQ
	mMbdQYD3OmCSDhKamp3BkFCGjynv9Yho=
X-Gm-Gg: ATEYQzwc3r0j4YyJxkQ1tLLhFJG+AIJKi2l9Dxg1TbnvgqTukcp0WBSt4BEHLCv/V1F
	9ME6eSha/m5YzSPePNu4hLHVAiQnKW9mJ5xZKmQLeW34nHRTszTxl/FPaudf6cIg/41p+xw2gMh
	p8yWCIICRpKLq2uX+S9XNrMcvZ4VhXwnD7Ui/AuUbHZPPjmW7+iiIZOLzGk2Xr0Ft+T3evyjzGv
	HHFWsv/iBZgPecFBRY9wVQGp0yBAjrvXp4Nw0548Ux99RNt968+9RCV3b6cDpQkmKdIleBmDt/M
	kBoH9GujgiL3mCu3PDOe05DNWXeX430UrG78joHJJXxJNmmbbAudjaLUzrnuBpxAoOe45Ny8cQ=
	=
X-Received: by 2002:a05:6820:f003:b0:67f:aadf:e007 with SMTP id
 006d021491bc7-67fabbf0fc8mr628003eaf.10.1774996707786; Tue, 31 Mar 2026
 15:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330180207.30224-1-arantescastro@gmail.com>
In-Reply-To: <20260330180207.30224-1-arantescastro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 31 Mar 2026 19:38:16 -0300
X-Gm-Features: AQROBzAtkA4FYbBROB_IXIjVqB0K0DzcQheHtouy5cgTfo6dDaY6tIKDEcIerAE
Message-ID: <CAMAsx6fs+DJPbvs1aFeo4YKxDn=tHn-4BNziXriLP8NhqRdTjQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: translate process/2.Process.rst
To: Daniel Castro <arantescastro@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 3:02=E2=80=AFPM Daniel Castro <arantescastro@gmail.=
com> wrote:
>
> Add Brazilian Portuguese translation of the development process
> document (Documentation/process/2.Process.rst), covering the
> development cycle overview, patch lifecycle, subsystem trees,
> staging trees, tools, mailing lists, and getting started with
> kernel development.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Daniel Castro <arantescastro@gmail.com>
> ---
> v2: Fix stray line breaks throughout the file.
>
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../translations/pt_BR/process/2.Process.rst  | 502 ++++++++++++++++++
>  2 files changed, 503 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/2.Process.rs=
t
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 4f7fcc3c66fb..edf19ddf8916 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -69,4 +69,5 @@ kernel e sobre como ver seu trabalho integrado.
>     Introdu=C3=A7=C3=A3o <process/1.Intro>

The translation looks good and accurate. Thank you for your contribution!

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
