Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FBF1CF28B
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874137; cv=none; b=rREZFSYS38nui4sQRJsbLVg2562+2T2xk0SZxVsizoLaiORjt9/Z+ShUUtrHaE/Z32Zy3QBWAeNMUzanMpxBISxRsDfrQgMRB1OtIk06XE16Q+GhZ41Fe583vP8PUZ51YRZp6VDGBzXlg7RngSGe9j9LK1NUsqDKh4uUNd14yJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874137; c=relaxed/simple;
	bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7mVxyxDqu8OO9t1D4VG1M2iCJqhEssiqJ/luj13RyqoGHovHgiMy9KQRvWh1oZ5kFOx/FM3Vj3H/FBq600rknxsvla3jojstXrFlIep7O0kTveAOlzbYbSpCh0YKAOGvMXo1RdCMYDhMa8HcLk2vAIUlU4zwGM/P0O4dydF0pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2A08OY2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2A08OY2"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fad75b46a3so27743671fa.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727874134; x=1728478934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
        b=P2A08OY2rgft/g10dgu+hU7F62V8IGNH7U0FdXMh5OZaXWElQHrrwa8x+rp6j92VQU
         ZT0c0S5bUiL2VihLsjVy/DOt/0unKfwwyLsx0L3uwZ39E5Ul8KjcI01llsiPoAZs6xb+
         ei9cv+o5Po6JtT7J2heGiK9kpG23onz0dy+9O1T4i3isrO/uDj1AWDxCMc+19kMTU5Mw
         rpKEYLpUUDr8rIgdkoSZ+2ExJ313tdxTBkXpDhfMmK87+1UfGTCPiFFZbiZVV5Z4bV5y
         Agk/Wfp+I34MiFXax84h60Nq3IAXW8+Pvp6aq5/RUXs6gNhokqYnpyC2qT/CB2Y/V3Ui
         35aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874134; x=1728478934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
        b=nEpERS56bEX/D9krkgBLGuHNjxGuXZCmudC2gljqOnm4SJ2aCOcAdtOKzy/grg3KY2
         nc2zRZ7P4v4N+l5cKgMNBNerDqpMRT2ML7Tm7X0pV4dkJTxdSz8z1fJOz62GVT/lIv/8
         LvYBOhqyD7NooetIV1g/t5PuldRrTcea/cRSC+BBhNtrTjKb8WDRkOb97rp6TZ3a/1+W
         idZnYtmqsO0TiFo+0n/UZwNl2ujvHxaacXTAnMBOTa+qsvTYIyEAgI3YtcEWmCQvC89n
         xQF29yNk9vgfcW/BOgeyKlYvttRYj/IDZRG97JS4BttYpvtZefWXtWOEck6TA7v99tnj
         CHSw==
X-Forwarded-Encrypted: i=1; AJvYcCXK4Tkfkwh8eAFUL0T7GTRU3159nWQrpk1q0S4pse0Tw4lPnsozZFgmEKljc1+qbZd5lY2MYIGp8Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN2j7a4zJhtSOeUBRL/glc6QThF57JHf3nO+SDScY01JQZf4vt
	Wc1voW/SCTmyvq+CpKeVvfFdPIL6D3RcvMo2byj/Nl5x0fp0C+nc2Hgnplvc4sFnyU6SHT+XQT0
	lAZIAtniE+MKUnuof6s1Cz9xBAEeIDOunSxjx5g==
X-Google-Smtp-Source: AGHT+IE17VRzgHlUxgYGy7U0/MRfvq2+ZgvbaqzRxZ67LxJlM2/ueQxV3YOwhvf1FBPYjEvmw9ciY4+lbofbyCL4t5Y=
X-Received: by 2002:a2e:d02:0:b0:2fa:e0c4:f08b with SMTP id
 38308e7fff4ca-2fae109c4b1mr15001981fa.36.1727874133833; Wed, 02 Oct 2024
 06:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:02:02 +0200
Message-ID: <CACRpkdYLvt-fz2zxEwTeahGkR_iLQzioQTGwUuMc52=E33HnQQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/process: maintainer-soc: clarify
 submitting patches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Will Deacon <will@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor@kernel.org>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 11:56=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Patches for SoCs are expected to be picked up by SoC submaintainers.
> The main SoC maintainers should be addressed only in few cases.
>
> Rewrite the section about maintainer handling to document above
> expectation.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Conor Dooley <conor@kernel.org>
> Cc: Heiko St=C3=BCbner <heiko@sntech.de>

Very nice and to the point document.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
