Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99034DAF98
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645278; cv=pass; b=DCtWWiQrJcRxZzV/ewllzqfhBKGMSo9w3X7w7MhOpu9dM0rGRaZ247hRjlCEtRt5F+XEWyCCZGQ+j6jbDU55NwPqtCeIR7UWRYecS4gDC1gJG37lnvJ9K7Q5xJQhRox8oD0dvYBTUqDlqrpOGliE8ZJlfLcjKktJMkr75FaachI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645278; c=relaxed/simple;
	bh=gqsU4rnHrEt9APIDK67SRpz5jAPYBxPM63KhR6ySdMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9JBUJOsuiodb/ZF/sFdLV2o3PQNtxDgu7/ulgXliG88+HtmwsXySMHQq3GkXQtz6WS2M1YyUqVZ9YBFvRQQwsrb5RD1Do/yIxaeHePJWRjXithwGX/kYvtgqO26gJGu852pGji0g5tSkPehiOEBicTGGb7Dg/8UYSQVO9EEA3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prC5Grfk; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prC5Grfk"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d8a00bcdso4067721cf.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 04:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645275; cv=none;
        d=google.com; s=arc-20260327;
        b=Te6dX7KSPKaUKqdCi5yf13S80xecNmXxcprs4BoBSXzl9DAQusd7M8t+6ftrHL05lx
         +RNHo4vHYqOx3Eng5KcepIoixwV2DmN0GZLYN/t6LzfEYVCm10XXFY7ABfrwf/XOa89e
         thUUrk9oRrSIPzP5kYZM2ZTxD0zGyx4342bQ0uB4o0IaZXjoRxXjk0s77eoOf7x56HON
         po1D3xvOf07vZ+d3pjFhjFvP0cm2vx+0t+tNuJyZJkHd8B6WPOs9QBtd++136cDS8ixD
         wCjlUe3F88huVfx/qqsJ3LU36HmniPjaSrucUB2NDplVZB7Ig4zp49C1n83xOGGSnIe0
         hG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnAoZqy7F+FYR9ODrFB4noNjgufaDmhavzfM0dXOaVI=;
        fh=f9tHWxBZnQ19m/YlMcVPrtt1sAA1mkjd6WBFbtHaNb0=;
        b=Xe1K+hhEVm42ZsL+eUDooWxP7VC+ga1EpTHuoFbKJaVr3LcYZThLc1gTCzCWdp0J+o
         uO7oPzu+7hVxtOah8gQG/BoRv9PiNzWIEVgHfBDOa+XfQDWabevKy3AqEbkvJuz7A0t/
         SO5oUQr+12B9ed56xUdudmjcmA+jT+mSDXJ0lDEwfrTE/2dInm+OXMCpECp+9FXmNKGE
         jEDkiC58q8V0qp2z4cU8XPib3qd7vejW70SkgunYYV0ZDEmbd3pQFU8r50epDgwVpcP0
         YbkUiKg3PFqOTZT7BC9BVcYxPdrdgElRsAZqO/T2E6Yw59AItKr45/SjVZinhuoqTLTQ
         2VOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789645275; x=1790250075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnAoZqy7F+FYR9ODrFB4noNjgufaDmhavzfM0dXOaVI=;
        b=prC5GrfkOzBJlcTWtTa/gfENkB61bCSD/DawmLjq+M+o9rPhnZkVXDoBfdPxMmXr0D
         bg2AF84xGXwOhRADYYGUXLhpDdNPqQSpddfoGEWGkBVdMByYQc088MfcRe6YA18raz5L
         Lmya43pU5Snet79iB8XjBJ+e3Jrbr2AEF/h5Kw2Cv859Vm1aRYIryNVCCAn1tQfbss56
         d5Sb9UxDsGz41mkoLY0hFT1psp0JYXgZf7vmZyTGf/iut9u1c6keoRZwdQ4jaDLb3qsC
         RT+O06CacrLEbdE8gRVJU2lVveJslBEdgOl1Qysgob2LFVxkk7yhPvf+8ie2DH4LAJAp
         O9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645275; x=1790250075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnAoZqy7F+FYR9ODrFB4noNjgufaDmhavzfM0dXOaVI=;
        b=Dk3YCpln9Y3H7LQUQOBz/S7+bZ8qtkNYVsrV6BY7+i09zkFvLsj07f5JjpCtEOYu0G
         iAQZH9UBUjbEKNnQySjjh4RitHnorQx/374tU84e97cgupND26YJo/fvk/+ZSjahgpKh
         59wXwEc7mlPg+ai/mtVAViEHnaE0+4HJyssxlTSa6mDE1rUWFL5DhjOLgCFsV6TrPam2
         2J+SH8LOHc5ZjSw0kSMx3wyzkP9i+LSuNODB/cHKEosYXnwpLJP9wzcHffzf763/P2CY
         Jo4kpG20S5rCct5BNwtdw5TMPuQko0drytwhUtBq8w30Z2qIGZwHBFBv93qpazaHN4fF
         MiBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6m/9YG2xzWoG7qP+bLH8epcP+Ky3qHNNZfg2RfyBlzNBb+1HqeoSeQ8BdYiO7aX7T8QATk6xY3wM=@vger.kernel.org
X-Gm-Message-State: AFuF++ktiOk79roeCKYxGwlcVseRa5LSbBmBAFCViZ38+Iz3IDLoiIkb
	LSck1aMNcc8I1GFgd7KHxBGSyauGzVN8JsqHXJHFjEV0hsdfLnGPmkl3ZxoMRKqE5LLpaxXb7b9
	lT/G2Kr8+agj1bP88tKAmnjOxwsWr+zo=
X-Gm-Gg: AYBFou0PmsJht3w5Pc9Ihdnw80nbDsCYM6f+5rWrl2t/nuLcpegrTlMKQ/J0ojNa93r
	uez294D5WTiSK+s2hKCjHoipRM+GoaQHUJDg9oSSKzVLKE7V8u4N4LyerjrZi7A6J+x5vCTvNrF
	w31CQ6KueB4EYXusnMg8xJ2Qyvw+MwTyQqoP5fU/57ECDzoH/CeVuk64Uwy/xtTU/HTnX6AfDZ9
	u33+klDoXc3r8+/3LhHZhIdaV52g9cmyGfPvfVycpWqn2gXrJ1Kv4dbziLrrqIczT/iNs9MSJtb
	P1O44SBiGg6ksogowwRL3RjmTF/vVin3RJyTh6uSGzFxnhihbZpl5N8FdP5lQ2//dUUlzCtJ4P+
	/oituUXECoYBVankb5v3MBuu/7tKlt4qY+2RtitEstWl8PnXDMUXgwCtVWTehGD0fg2foMa9YlQ
	Kw1E8=
X-Received: by 2002:a05:622a:230c:b0:530:faa8:a51c with SMTP id
 d75a77b69052e-5327eeb8632mr114714131cf.34.1789645275229; Thu, 17 Sep 2026
 04:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917002341.5938-1-silvapfabio@gmail.com>
In-Reply-To: <20260917002341.5938-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 17 Sep 2026 08:41:03 -0300
X-Gm-Features: AcwNN1X4vXq6zu_2IzVT074X_iZFzewp5OcNV3K20MInyjIhH3qzCNX35C0xgAs
Message-ID: <CAMAsx6ftA4--w-_w694G4k8y2kBmSKj39DxTcoQBVwEFC-UiuA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: translate researcher-guidelines.rst
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 16 de set. de 2026 =C3=A0s 21:23, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>

>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/researcher-guidelines.rst   | 174 ++++++++++++++++++

Why did you keep the same version as the previous patch?

Also, why did you modify the central index.rst instead of
pt_BR/process/index.rst, which is the correct file?
