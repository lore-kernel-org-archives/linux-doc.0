Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECDA273D6C
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753221466; cv=none; b=A9jF3BjktR1iQ7UCbbLWnIg8YHV/5Co2gPe/9QZkamfo/7GKL2PWXc1xVqZzsl/CNZXkW4jGhFLpAvjq7DPBPRWolaocb1ImGCgTz3dTRkuNIPG/g1Yv893QpKA1bOEjQm+HfcRs7xbjhYI+Da9exl6nakapy2OiG1MbMOVQedc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753221466; c=relaxed/simple;
	bh=hWtdbECSOx65U0/2471YPriOi+gPt8KDy8AE8lUQLhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mh1wy9u4k7eV0nkFQlwITVl656qXTcoyJI+zZxMpEcIzFbqxCzClMvNF0KT8OwQx0K1MvfQIhe6oovBaJ+EivBZCeq4lC0fByJ5x9oCy+yJfu1OytjmbieYFO8JKl4DKzxSMbT8skMunpOhKBNyHFiROry7IIapCLMTazKRuATw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U4G4LDxz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U4G4LDxz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so1997a12.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221463; x=1753826263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=;
        b=U4G4LDxzVrpUkJ8xMrld7i3geG0B9tnnVrNUp44IB9vWu9qcCzXYnI/1M4BH9AFpKC
         vDskffH4E+EIl/t5HPUfktmgVp/5bcHnZAqM5hWSg7tTzG44168wEaM/G9HFpZ+Zihb+
         o+iVT+i/z7pMgJ8062M6dE/DaLOhVVisab/88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221463; x=1753826263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=;
        b=QdXhJYZEARIBxK05Z5ZKgrvt/0Mx3lp0dos9zKrldFpMdmLUKfgwqzZGwHWREe1qoF
         V+f8nhHkXqful7LFsd10Ubmlboa7HUGtiNJfOKZzQAWZcdSYZ4vdcsQ2dWzNP9cCMK1W
         EEr6sAH57shI0EFzffGlilwQUtUM38kYkS67lEyBCnxW+ziHBJr7kxyW677w+LESHTDc
         pmDeMWCHU5SEtYiu/y3+E2sJ++lx+Ehr1nSFVFK1j9YCAaQ172S3vAXOXvCxVV2vIRa+
         BH9qZk+p0vS4IrtwXJmPA1DF8R8Y2qCE5rMynLS5YRaZ17aqCmkTBFvbhtikMneAnKiY
         TWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHc5KdYvJXPhTkaT8jCckLqzwsQMEkbfh3UUMikqQqGVQ19uc1yB9RcO2GMNzyOM6n1XtYZfsDHF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzymeklR8R6PJb0hL7UXGDh3TOuVR/xiBV95Nt3v0lMhuI0sVLM
	9ZRTXssdVrar6YZdcT/RyIY2vGe7rbwB3st4Y54noDPOLaeJ+NWtpJ/6MDa0LkHkG4YG6gGUBx1
	aIN/zzh4SK9RIsYQ99Jo2IrQli4vCYxabVgfuSLCw
X-Gm-Gg: ASbGnctpedFnQQz0wLGj3x0Q8DcW+mbMheIkRbvQXLKI8oUZDS1Q/om93gkzZ3DXaZc
	PXI8KOUJdNcgmNksb14aurx1CtS6DXptvnZxJm4Va0hAGmrvbyCNqLBkjPqG0ijJJNCMLjsB6QD
	IXbPLWgPmxH1977yIClvwY3UHqXZkkcpv7lP7lTVepL8oMxnOIwmYEjwKXtFb9kmD1P0r0Vh6fO
	nKVB+dWCp/PDvl2sWGhCifRtp88wIIaM9ASP3EDhGMZ
X-Google-Smtp-Source: AGHT+IHkklfoV2jGZf2D1jPpYNy6n0EzpENuUlCVLYxgOK9YU79IkYyUGg7ZPnpy5rOLdzOyNuNgg4SRmVW6s9CMDc0=
X-Received: by 2002:a50:aa87:0:b0:609:99a7:efdb with SMTP id
 4fb4d7f45d1cf-6149a3beea3mr33693a12.2.1753221462404; Tue, 22 Jul 2025
 14:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:57:28 -0700
X-Gm-Features: Ac12FXxqqdXiBOsL8hY8DFhm2tyZoxR-txMizljLW540w1cjvBjPCidmbvKnAZQ
Message-ID: <CAODwPW_fDPY78bmwvLmLkt1yWpVdG=VC8h2NSdWtoiEknajhNw@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] dt-bindings: memory: factorise LPDDR props into
 memory props
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>        Compatible strings can be either explicit vendor names and part numbers
>        (e.g. elpida,ECB240ABACN), or generated strings of the form
>        lpddrX-YY,ZZZZ where X is the LPDDR version, YY is the manufacturer ID

When you say "in case of LPDDR" below, you should also change this
line to take other cases into account. Maybe the best way to write
this would be something like:

...or generated strings of a memory type dependent form. For LPDDR
types, that form is lpddrX-YY,ZZZZ where X is [...same text...]. For
DDR types, that form is ddrX-YY,ZZZZZ... where X is [...new definition
for DDR types, based on what's available in SPD...].

>    revision-id:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description:
> -      Revision IDs read from Mode Register 6 and 7. One byte per uint32 cell (i.e. <MR6 MR7>).
> +      Revision IDs read from Mode Register 6 and 7 in case of LPDDR.
> +      One byte per uint32 cell (i.e. <MR6 MR7>).

If this doesn't exist for DDR, then rather than "in case of LPDDR"
this should probably say something like "LPDDR only"?

>    density:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Density in megabits of SDRAM chip. Decoded from Mode Register 8.
> +      Density in megabits of SDRAM chip. Decoded from Mode Register 8 in case of
> +      LPDDR.

Can you list here where in SPD density and I/O width are stored for
the various DDR types?
