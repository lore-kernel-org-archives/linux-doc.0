Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13629E0F6
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 22:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768687907; cv=none; b=tL43pGQMxaAduX08YoY4COfr+JYiUoEd/5lyQRNVMv0k3nR5G2F0oywyAtn0a18hY+6cWWvUWjcg8/RR8iiZG+wFZpmCC2QRhes2xpBfJ00Hf44Qqo6/OJgLFXtDc5u9fZqSqANnLzS0XYkXAQR5hn/RJSVmSA2rlwt+EQBc1kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768687907; c=relaxed/simple;
	bh=0QsN4/s8foqpiEU2z8LgKHsRmHRPQeEOz4+b7HvRAaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7V79MsqEboDkz4lhM7Kp789UaiTupAGGU5IjaY+43ZXnxOFF9IhTKAO9RlUQpBfKBTb2TBM7R+NwJFLocf1RC2Ooqgs7HQTsXKq6CYeHX07t9Lz8qjJblMkBTuXdU2KygjocOZCZJqdtmWbgGn4X5/6EiHrvhh2tFcPYXoeFaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=NTL7pgPa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="NTL7pgPa"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b6a987346so2873389e87.3
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 14:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768687904; x=1769292704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QsN4/s8foqpiEU2z8LgKHsRmHRPQeEOz4+b7HvRAaY=;
        b=NTL7pgPaCCeN29UEZ6r1c6GhXVoIuYYQHe3dWRWm7tFDWZG6IglFc4lUtvxFn2GEeh
         tquXv307qJQi5yzn31gMMAVrcfFZfrUhxy9jt25+VhBY9TRZsW7aH2EuBrCnjl4PDO6K
         TR3ES0InBdgmJCUpK5Hj0HEO8CMrPuO6dxNdq2/ykzsMZ/37YJ4mQnNXSnatgGE8spIy
         4R9QDxOqA9fyYrXF8hAIItcpcmxfmnl6YGIOtKrZaUzyus2BumddRCyJFM2MlSGlUTbO
         PS62KPMf6DwoGoxF7CpnZoEmWvOaY3dtwkIMSIIXJV8VJVMlmjFDQ2BdLFD7iNTiaF6w
         LQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768687904; x=1769292704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QsN4/s8foqpiEU2z8LgKHsRmHRPQeEOz4+b7HvRAaY=;
        b=pJOqXK3tWSz3WJ4XhD41uP3tQy209Byu9GwHasxE+mQgAwo1ZI2qM+NYJPMLki+xk3
         59X0UVpQ5WDWyP4AehJ6ReF/mnx2wmOXbdlDrxnh0KMrEtoNUQNf2E2UTTA2fVJqoCvt
         v2kLIvbF6+heYDQMfRbPqnA/R0Sy/TB3VCM5u1bsWu+zjAUUw18HaNiiaeSIORV05Via
         ktScJRR4Yk4KDl47nv3QO55hgbYNE4e2uJT92/hI64H1rKGKU09aCzCckTHCL8BM0IRT
         B1n6eqsZ2o/yPig4sznp9GUau2qXesnND46/qzirciloQFyvGfOKTXn2m1qWKxsEPJ6O
         D/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVix15k6SuixyHx5wzzregiSv9wsdpspWRqB5nzCPW+2BGImZCSWMsGABsck4cEgDkvhfGZ+tKQur8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0yIRBEGvtUBMmnTepIT54UkNi4fXqoMqSFelzaleaJAUpugRr
	MXtsapuuAzztz31OWD63lRX2eouyt53SsrYvdj+goNNmSjdCAOWq1Z5wHRh3dyKB8FyHWT82dFX
	bO2O0NeW42Waxri7aEpgKR5usQ0oeZaWuVqCwAhFl
X-Gm-Gg: AY/fxX41wAwXoNk6UUQdt7zjtVCmW+S8UQ/3MSosPhFTg0yQnwYWZ6VOScDX1qxoFOV
	rd2gGdeNILxAea/71gz/ahWMi/dmFLQC4fyCdekefvOEEzMPYobqIvEeX27DaJy2ewEmBqL96Rb
	gXlCwqpjBR4Mb2uORZk6qoEqTNeSdzGBJZ/bJepOOb0WUeqh5ON8IRCyLzLJg72+dxuffjZcwqM
	luAMrUIABAEb5pOeKUtL/UVj0kjFvSS00JbF2uRlJHCZFAUiovsRtazOJ6PtsIW0CFJaXl6RHby
	dM/nmp7SkLt3Wr7lgM7b1VDD2kg=
X-Received: by 2002:a05:6512:128a:b0:595:7854:af77 with SMTP id
 2adb3069b0e04-59bafebe300mr1967672e87.22.1768687903932; Sat, 17 Jan 2026
 14:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114221210.98071-1-yahoo@perenite.com> <20260114221210.98071-2-yahoo@perenite.com>
 <0a4bfdac-3f3f-4dd7-87ca-a4edb58d2bdb@roeck-us.net>
In-Reply-To: <0a4bfdac-3f3f-4dd7-87ca-a4edb58d2bdb@roeck-us.net>
From: Benoit Masson <yahoo@perenite.com>
Date: Sat, 17 Jan 2026 23:11:32 +0100
X-Gm-Features: AZwV_Qjx8bKNnZwzQX3_lU5KGOFlQslHdigKheBNDxdgxIwKAmWPkmTQh2fb6AE
Message-ID: <CAGHj7OJ75Sxn9AVguC8uFJwd8rdAvSREKFreWW3_-E+4MaHycQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] hwmon: it87: describe per-chip temperature resources
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 3:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Series applied.
Guenter, my appologies but after changing some BIOS parameters of the
IT8613E it seems the patch has something wrong and creates a null
pointer exception. Can you please remove patch for now until I test
all BIOS/changes before re-submiting. I'm sorry for the miss here and
your work pushing for this but prefer to prevent the patch for getting
deeping in the submission chain.

> Thanks,
> Guenter
Tahnks and sorry again for missing this.
