Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E12773DE
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728852; cv=pass; b=uKa79AlNBItiV4XZB4KREzfOGMm2nn91tkgrrK1M/HgamhjwKTl3yvL2Kx+W0fCs7RNSoCrMX9UhlLQS9DDy9UcverkUw4HTAGean5yvBuhfwrhEU3fFgD+aT/YGetufBpFY4Iti4WR8BrlfUhNZ15sJKu2kABUz1ipNpzCBBV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728852; c=relaxed/simple;
	bh=Tw6/Lg1Pcxy0M3+6F2XbADf8slbGTAkbrXkfIPCNMWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dA6m3tE3QkAvm8wpdhQ+aMBOivvUhzBqaNoWQVA0ItjIZrvDasUayugzPoVc0AzsxwfGH/BuxqjsvpxzmyzjteXrrA00m8hRj+FuQlf0ZyFIeJ/9+M6D1l5v3qQ48koskpMXpp7MkDQ9PShGjLh51RI3HMJUsV1CLgxFUZvH5Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi/MxqrC; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi/MxqrC"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffde6ae2e3so22486137.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772728851; cv=none;
        d=google.com; s=arc-20240605;
        b=eBEw1Es7HVq17I2nnePOz4dJrvWEQ3IKiqzlOPOPB9gq3ccdWfLc+2XhWg2OboFuMy
         RmPoWNR+pnA88Hxq7FoQb+7K4ET3Tm7ra3cxsGqHL6HBzxWZrSJ50m7OAgU7aSf5R4x1
         ZevLtarDBSJGSZIxLwUyaEUMW21O27GLDZtjZjWwcsGFUw8l7pR2wETWu3Kl4IbkqdAw
         emSW1XSG2EbHMd1SC5MzJ/nQLYPLcR5/8hfvyrMAm1cdaEOLCGkwJrDqRiv1ERxEeIkb
         zqRYh6qMfvsbWzIZoIzil3YIQ+lqfkUMa52HYIvrKDuLNVFWy2cR47uKVC6goPf9eJOS
         1QiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xxN+7bGcR7TVtZCDh7DHmoMO7X0+dXFHhThsJH/WJv4=;
        fh=ClcBiacZ5mafVv+yP5C3TixHaaVHqKPLYlpwx85s/J4=;
        b=Q/g4beArGxhYA4N9EuaMlldpjUFvly3lJDEyTbquOLy20elAx6tkjzfa2uPN5WAU5R
         ct0wV6vEX8JdfT0WJXEWy+R1hO91sAgwlmLFbNNGaHNcTQgC7uvFQCKW8V6uAE/Fs6fV
         ZL9jmKARli5Nq0/kELIhDNS9QzLQG5OCyvB87yrJsXaSjgYEPZLKdhksPJFDFyS1goKm
         xvlwpF82DmUJwdovqrq9uNc455zm4bLpNctHoc/GoCjXqsDYNC3TyBSK4lAT49ZRxSds
         B89fIIFMlXJ2EOvy3iTXFaxtgzz+2WYinaKxoEVcTjBNB0qoAuK9dQQ/ERMZAUQOnx3v
         xg2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772728851; x=1773333651; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxN+7bGcR7TVtZCDh7DHmoMO7X0+dXFHhThsJH/WJv4=;
        b=Mi/MxqrC4c8SQYKqKiiBBzyBSqFgGDmNUIPHL6B3wNrJlTIl4xcPKmooy5jNxbAj95
         PRi0yhRZObFI5c8AUsOLaMDRH0s2hWMGd/eH1cr5QRbej4goS7cPvbhKEsS+HpRLYtBg
         ZGQ+JkxlTSUWi0yBulZwSJr+l+37Zqu8w5P6ohrXJfiY/dV6VMEg7OqzN2hZSAguLc95
         3ifgvKSk4mUQm6iAO71QJsooylW5YvcBE2OUWd/1Hod1UYgLozUaG/TXJZ1HGsqoHh5B
         BjZCztNEV9OY9XWAk4W7JRF7yiCuK/fbX4paGp9tQ0drt2KZYkT4TV5muLAjImgO0iul
         kKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728851; x=1773333651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxN+7bGcR7TVtZCDh7DHmoMO7X0+dXFHhThsJH/WJv4=;
        b=OqIJLBo05842WDfual5bNhLy7f6XfxfzlnXT9NXiK9Sx5QYXlGmOHOHHXlicvfyGVR
         Jo1z4vV7/fk2pRsw1Xd0tF0YRefmboW3RZ3R5puPeui/ZON5JfQPm6tceezfAPSs8kb4
         Jdjp4woyHhDThYIc6KmDnjfgDHITMgapsw37pKlp7sFZm7UsY7k2/STGX+bxa3tBaTK7
         3fF/pj9HeeVmqTg9cDBda6f5lF6mJ+JLKCtdKIZoxAGHO1Izbed7sBiIM2WykZAV5eW7
         vvK8/Y1gx6x7m3P+gu/nMTjzDACM7cHTtQqybx4bnCFzHJpvFRQVFAxQ4TwWKiTZc9kc
         wUfw==
X-Forwarded-Encrypted: i=1; AJvYcCUd2v2tNd7vVUa+vyENUd8S1t4Rn6E4LhuIKDd5C8kV3Fg8Yj4HqkatViY1PlctUnJGA7AwkqX6yYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0VYunQZ1NmKnGGwcz4mLQlsDAQN/hvxct1AVswd47nGMmNce
	RROilI0eCCDLombQeid1AlwP8F5JNTbw0wxC3s3pU6ndtJrB9zLgTp4kpIMk2q5TP1rYeV44egQ
	THnnOKjJdCcoJw/4T1VXN9TmweGehN7A=
X-Gm-Gg: ATEYQzyNyJ0Zm6Tri0R3+fw8DzAApkqYJP/4IDqBR6VmysAl89wg9XWVWdSl+Ih4l5P
	/zSIIrFlHUuskGGHmBFssmEga9gxT2lZD3nSYBKXsxN908BJFKWD6q05N7HTo9z0HgKKkT1R5Jo
	QLdyFzDpiEI+NsxHBGsypeREIJf9GcbuNP3ANw+28PZjaGDKxz1zTYlujYPB/V6S2QRtxnYP02N
	1YuVLjWuSAKVfZ/brInzB03oq0CwYBLqy/wL7F5YVNmDQxrXHvGnmpNSRMYnYXv/G/v08T09GyE
	JsBV3xE=
X-Received: by 2002:a05:6102:5125:b0:5fd:ee19:8b30 with SMTP id
 ada2fe7eead31-5ffab038d41mr2901480137.35.1772728850730; Thu, 05 Mar 2026
 08:40:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305092226.27379-1-sawara04.o@gmail.com> <20260305092226.27379-3-sawara04.o@gmail.com>
 <20260305112428.GA57792@j66a10360.sqa.eu95>
In-Reply-To: <20260305112428.GA57792@j66a10360.sqa.eu95>
From: Kyoji Ogasawara <sawara04.o@gmail.com>
Date: Fri, 6 Mar 2026 01:40:39 +0900
X-Gm-Features: AaiRm50POQVPuNAx2n7WNbpqRNDkt6y1WKj2gjYD0yzvSLj9JZYb9vob_AkNBLY
Message-ID: <CAKNDObDc55sL1fuQGfEiw13GwzG4WuNm5_ZfAf+_gZNVXuGJQw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net/smc: Add documentation for limit_smc_hs
 and hs_ctrl
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +hs_ctrl - STRING
> > +     Select the SMC handshake control profile by name.
> > +
> > +     The selected profile controls whether SMC options are advertised
> > +     during TCP SYN/SYN-ACK handshake.
> > +
> > +     Only available when CONFIG_SMC_HS_CTRL_BPF is enabled.
> > +     Write an empty string to clear the current profile.
>
> It would be better to clarify that this string refers to the name of a
> BPF struct_ops (type smc_hs_ctrl) implemented by the user.
>

Thanks for the suggestion.
I updated the hs_ctrl description to clarify that the string is the
name of a user-implemented BPF struct_ops instance of type
smc_hs_ctrl.
Does this address your comment?

```
 hs_ctrl - STRING
        Select the SMC handshake control profile by name.

+       This string refers to the name of a user-implemented
+       BPF struct_ops instance of type smc_hs_ctrl.
+
        The selected profile controls whether SMC options are advertised
        during TCP SYN/SYN-ACK handshake.

        Only available when CONFIG_SMC_HS_CTRL_BPF is enabled.
        Write an empty string to clear the current profile.

        Default: empty string
```
