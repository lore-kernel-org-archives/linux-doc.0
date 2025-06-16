Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27433EAF1
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072708; cv=none; b=nYNhLubgRGp4Dp4BVyLPcW0U10alcpOJuAWwlta7OIaPxw4ABnTUkOx0/vT+rgKW4toGdkoxtZ5H4Qehtij97cnOuJhhtH15d0hb+A61aBV2X0sNW4ZnN8dhfHLXAvBIhE1hwvxg8wbhMYBzdL+7tjehRGn1uY2WbareaBJjcF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072708; c=relaxed/simple;
	bh=2LNO/lnuxjEcKTLH3BApVa0rPa+TnpVWqrkDwLxK03o=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kh/KZNk0NzyloHJhwG7KmZeuqaSJxEg6J2zAIimVeRiRvMtIdjmzotf3zXwPJh966SRNexCMZa0no2R4le2VHcurnM4zCdG54r+bKvpgkrV3AI4YFVPzIc5HtOQwiai9JV0HoBAlTPXSSzeiNP2r+VyKQ6YRJN3cUuOtqGtAj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdGliM9P; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdGliM9P"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-236377f00easo57387665ad.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750072706; x=1750677506; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BKwRLV6fJKttmzoUWRtMsfnz1Ge3xsnFK6RNiLnWE8=;
        b=gdGliM9PL8SpZdXTDT93M31D3hAnIVi0WTJk9bLHfe16yCav/qhErg3GLLKCOCzqnR
         56nq/loNZmRhtHP/T9fyTBkGaQDVkCOSFINaJGJd7PPlUIV+w9fv02VSzStdiJHeqbYH
         Er2CAp6vbMB6PoJuHIhvYgQgXxddWamaZcp5qG6s+i/CK1IjL7bphjlLBtFTX58Ej5Bt
         8VYV3RTLeYJSyGgUn7YoraVDdLL+RZ3gSyM8epx9qOGRdyJ1qSo4l0DBagUlbYCIVT2a
         jawfnh5kOafs2iGsYG5FnXdFU4jcf0QtQkF/r4718El8yigiJwoKK+Z5WJ8pwBg2TOw4
         mz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072706; x=1750677506;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9BKwRLV6fJKttmzoUWRtMsfnz1Ge3xsnFK6RNiLnWE8=;
        b=ehzX/OhnceAuJ5S+gcngSOiS7AwUiuEyQ1Xz9Jwqi/sZGo08cWg1naAOyBBxcHJNE9
         kGH7Ya5SwepO1bSLJmtVewLIlF7VdPTbKPC8HLar3Q30sQ+XgcuBWzOouz2vD+VmZilQ
         E55cG12ptA/XO6NGcc2ZLVaiI7MHYSiItCFjbMHis2wpUJ2XcZHSBaQgtLLZz+t8K/sW
         3t9yek6TuxennBRG4J8whrI0oRIFCjLNc9WZKM70dIYO3gfJOn9aAL3iqgn9Bf5xIUhx
         qTtmaA4o0THhHOptFhZYcj+gZxbwI1eAOL5kE2KXyQkagxySvpUJOSVGwmxP/17yiLB2
         4YPw==
X-Gm-Message-State: AOJu0YyOPbQtmaBWH8sw0/a/YiNRpawAbj+mil//omuscMUHwOJqb5Tk
	JWUlNEx8X6SdvFjELmAEuStAKA23zUMyetnQ4JOvE+KyS1cOhN9M/VqZ
X-Gm-Gg: ASbGnctfKAhxk5yAAIyAEfCQAMGm0/b0YTAKxs/4GX6q+KwFxXIrGGcnd/DsyRC8HEm
	DdhdY82pENuO0DNml2rhgvk9jzld6xRVnSEwzuor7wclJijC6+IDGuUOb094SDyZwmYt6FnSWSo
	HKqE3meRRAJ8JDI74if7EnE16ljR35ni0olTKLPAdw3I+lKBckMq3tfOVFpeIyhaRv1QgRIxms/
	Ed6gmiFVLzyoJvmwoi9ryKSKceo6YCC76bcCYV2uWSN5IAA0VZHUP72hDxZ9vkhWLfta+DuSr4O
	7VvX4DjXAWEW4prX71vV5xvXCiv87cmX/UJ87VNKG1AuQyQmKwwh+2znaX4XwJb9Xt8bhsfM69+
	kBKfhlHIbr3B0zjNoD8ACoKlRnELwH4YyaislinvPciE=
X-Google-Smtp-Source: AGHT+IFY2lHlc51uu/pm31apT3LoNcPXbLge3MK6Z9XaASRIOpMwTD+nIIL3Wl65slC/fmGIkFZ0bQ==
X-Received: by 2002:a17:902:ebc1:b0:235:e942:cb9c with SMTP id d9443c01a7336-2366afd39d9mr134448345ad.5.1750072706364;
        Mon, 16 Jun 2025 04:18:26 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de783a8sm58388185ad.99.2025.06.16.04.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:18:26 -0700 (PDT)
Message-ID: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>
Date: Mon, 16 Jun 2025 20:18:22 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Error at www.kernel.org/doc/html/next/ since next-20250610
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

As you might well be aware of, latest successful documentation build against
linux-next at https://www.kernel.org/doc/html/next/ was that of next-20250606.

I managed to reproduce the build error using debian bookworm's distro packages
which can be close enough to Sphinx 5.3.0 used there.

This is the error I got from "make htmldocs":

----------------------------------------------------------------
Extension error (automarkup):
Handler <function auto_markup at 0x796307745bc0> for event 'doctree-resolved' threw an exception (exception: argument for warn() given by name ('stacklevel') and position (3))
----------------------------------------------------------------

Bisection points to commit d6d1df92c25f ("docs: automarkup: Mark up
undocumented entities too") queued in Jon's docs-next branch.

Reverting it resolves the error, but honestly speaking, I don't have
any plausible theory on how that change could cause such an issue.

Actually, when I install Sphinx 5.3.0 by using venv and saying

    pip install "Sphinx<6.0" pyyaml

on Ubuntu 24.04 today, said error doesn't reproduce.

I'm not sure but there might have been some minor incompatibility
between past versions of dependencies.

I'd rather upgrade Sphinx to 8.2.3 (latest).

Konstantin, could you try it?

        Thanks, Akira
