Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036517A30A
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 19:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771183281; cv=pass; b=YPrjurKpBwVqeJwFMoWhHZRpE3Oj8Uxdy7y7kAoNmsZhnPSCx6KIQ5XITBhC9n0VdB9fNQhSwpQ/AE11l2S4zN1GGtX0IbhAqz4cd8gcHdBEW74VWdBEPl5+W0gwihR15rB6EX7OPlKAe6Sac9C1OAdBvCaaio6cQ3AUZtVPeFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771183281; c=relaxed/simple;
	bh=NSOrKvmY/rr6cfABVZ+oQuS33aHDqokQESj3t9ejXFY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Mt45krhiAspGzfe//USARCwbcR0IqDppaNY9jgSyDOS9ahhukh2CGGlkZr6sWB/2J3kO/n7Dd2e4rrJE0Z20sOSaSioLNtzlX1Wem+BkO1xLSrS9y2l9+l0YycKmQ3HM5FoN2eIB1vPEAk5ahBVPS6PwqaXKQaPGu6BdY9ESH44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQx9+N9k; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQx9+N9k"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8850aa5b56so363785366b.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 11:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771183278; cv=none;
        d=google.com; s=arc-20240605;
        b=V9V0pqRpxfYBz24KgQdjsJjKe5idedsUaCVAbT05zogiUozSZSffDFWRHCMgEf8WSb
         hWlQvQOqFJk9k1IvlmBNrUjkFi90Qt6Ss1Ew/KqPWkWmLXO5q6HJ7Bm0S1qWrOgMQQcj
         1m4gSdQwHVDibrACK+DpFBmHnBAn7f3LYCC2ZRBQPgCmG2sd0jcXsTh/shC3L7HtmsFV
         WL488aO8VF3wxpfnnwTV7TXFqXTobkzSBs2pVLd2oNUUlhTeOaFcm3BqEVEeROk4gLSd
         09cvCSMRpABx5bWWqEZrKIT82mTHgGZ/9Gh21rQG1NTddOme1tux4w4MZNXRDZfbHS+S
         P6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=CYaPFQOWi3H502o7/++oXMT48MJbCgrizb61GZOID+0=;
        fh=ZbonjbzJJsFV/lWPP+WlMJ1nkxs7eEVT2jwfomzjfAY=;
        b=N2c0x0iGOpueYoCIjUZPca6TiC25gTBmc32EsqWuDWERZlXh4/r+4Ln5l0sABouaio
         9DtDPlVo7u4Ab6IRZOwivK5x/YE1SeBMgvFrFY4xfU8J/RB09q65sR2krOuqJbJlIicW
         G23AtPzKmz+15sJxdqxq4ra0w5I/enxw9ioUPJZIAE39oT7UpbhJs+tebjcus3nAQmSd
         wJN4CmGWeG3cAFihN3SRe0b/bGMZYE/3TwHJd63ft8/y+WXcN63CJ3Q+kuDTmHCH5JYj
         zUw70Q9D2ghI2KOvgmsdNJ4onDy+pIFzSLTBhJ64RbXDgFZ5ODqIMS/vNmUGF0OvNuwA
         eicQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771183278; x=1771788078; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYaPFQOWi3H502o7/++oXMT48MJbCgrizb61GZOID+0=;
        b=PQx9+N9kZMHi8XQooXDAWKPwW65HZHwlmTR2XfkkPOQZOvzIcRjlfAPnaE/gfXHKMw
         nG1x9836CUw8ccsrXw8rScoBYUa7yBqb69pcKiSS79EYo3pDTRi7oUjx0r8/L9JcQWzh
         OVEsjR0PO/WnjPvk9G6MrYkNXQWiwbjA/A2VvFK6HBlZ6gtYisVJX2z5HIor9Yb69YVv
         AHZmxYob1U4ydoc8yon0DN1hRs2SeH1XJW7dmsYM0LjCnaKvUUoDQvs1OBdtfNPcyand
         8lvzUJNbrxIf98qxo/Fb2h2jEYVkWWfxiiW2bo1+vJh1lQRHSjenv4r5uxUbL2iBvKjr
         VaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771183278; x=1771788078;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYaPFQOWi3H502o7/++oXMT48MJbCgrizb61GZOID+0=;
        b=dFUOFeFAw+rIwZaLhK9OCCLMjGm+LAW2/+m8cVC996qwFWySuBYNpi+pSX6wfgtPch
         sgXYUeS4ckqyRKQrsmOJwwsI5R0z97tIU8SijQKOsXi0RX1lcxTP3MOXnZNJAbQRjTqW
         dxO04h+xSJ7BMK2YIL4I/mJhTa9c/gM6DxR9etnWyiz/pcHyP09iQVDJifwBMPiAvfT/
         wiAazZ7K78ta7w0gxSxUIHEhB2nsS204OrbCwLy4YeR74i971fdlOZujkNpKEKlcoqh/
         jKb96GXRJteubtxFSoOv1XdGoXxvZSTXfm0WP1Av8IMSPLSefnhLiDD3i97UPqr0pC/q
         deUQ==
X-Gm-Message-State: AOJu0YytdXuzCJ/2gEJXFitC1ICo/rx4M7Q/xqnFHRWDR8IYG2jGnRdw
	geKC5RP+jR3NaYyzmBKPOpQXAVeF+Nsud4EGaaG1uzFWqrgvWw6jGScW1u5GwFZOIJXqoX5BAxz
	5fjXTja8zJTPImfMkYmoeO0gFpDuopMXOdj97CUaOGw==
X-Gm-Gg: AZuq6aJIwiGnTrJ1p6vqbEc/IYhGpelG4P6/E4D/hrXc1Ez0vPIuDBfrnwXrojObbjq
	VqAGVqooquJC/MO9nC1Qgb7i8iIc9FwikeHojjip3pTaz5SF+C2up+OyDXyvTvqI2uC+jOf+4W1
	oLbZyvOdQvzWOnsZb1EcDj5OFkrKyzSi4vC/TC/dOF3U0UcKShaRYjQ6/Vjv3ADtOxCLKJif6gu
	foIGVT3OhkafjVc1WmAHA5p/q1ANXkKt5Xdf9mO0xLlIvONjORjZ2VEZWdYF8De7VNkXOd9qsMb
	oW8OgQ7o
X-Received: by 2002:a17:907:6e8d:b0:b87:365d:26b8 with SMTP id
 a640c23a62f3a-b8face249a3mr465105766b.35.1771183277651; Sun, 15 Feb 2026
 11:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sharqawy Wael <sharqawycs@gmail.com>
Date: Sun, 15 Feb 2026 21:21:06 +0200
X-Gm-Features: AaiRm50GFAMbIk32M0WTarZLEd3sSf9DmE-APzJFjroSpmcBsv9TVCHW9P6IFbs
Message-ID: <CAP25jw1Nx-vNWK3tzCXt8Rua=DcxVOFLJVQibQtFp=mPtxMv1A@mail.gmail.com>
Subject: [PATCH] docs: fix typo in networking doc ('not possible' -> 'not be possible')
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 7552253e49a4091baf1228667448908715bcb6e3 Mon Sep 17 00:00:00 2001
From: Sharqawy Wael <sharqawycs@gmail.com>
Date: Sun, 15 Feb 2026 19:40:14 +0200
Subject: [PATCH] docs: fix typo in networking doc ('not possible' -> 'not be
 possible')

in `Documentation/networking/ip-sysctl.rst` in line 3014

The line previously read:
    From now on it will not possible to add addresses/routes
    to the selected interface.

This is grammatically incorrect. Corrected it to:
    From now on it will not be possible **to** add addresses/routes
    to the selected interface.

This is my first contriubtion into Linux and my first patch
---
 Documentation/networking/ip-sysctl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/ip-sysctl.rst
b/Documentation/networking/ip-sysctl.rst
index 28c7e4f5ecf9..594f3d9b8612 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -3011,7 +3011,7 @@ disable_ipv6 - BOOLEAN

        When this value is changed from 0 to 1 (IPv6 is being disabled),
        it will dynamically delete all addresses and routes on the given
-       interface. From now on it will not possible to add addresses/routes
+       interface. From now on it will not be possible to add addresses/routes
        to the selected interface.

 accept_dad - INTEGER
-- 
2.53.0
