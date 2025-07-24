Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D722522A7
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 22:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753396452; cv=none; b=XsvTKIMeRNDQSjreOpoKOFPXuia1h06N8936YmCTzo0WFlzok7+liaGuddKhAuinXFIEy24ZIRvnHBWPr9HMXV4LkCDlGN3yTtUrqliGDEJf0ZF1ntyzUYGEkoSY96bjuOT9qzgHWb9E0rmWMbjVYvTNRmFXvcve8IRAz75X/fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753396452; c=relaxed/simple;
	bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFpYFmJwxNkfJ5C5EP/kgTBw9EbeP7hsciXbk4QZIyGelew6Mt7aORYwTtzbKcukQdMWynrheDuyqE0va7zKve9mnDFbIh8RJEVL+Jocd4oanQ35ZAU5O/LTjNRNDCsnA3kgEyw2dq1ZYqyIH0xzryCTHtnkSHHEA7MrLLyn684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=US2p18qN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="US2p18qN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso4244a12.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 15:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753396448; x=1754001248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=;
        b=US2p18qN5PcFHi1u1gmly3VWqlDIqcxxWAQ9o3M5wn90HoPNy4bcVO+WV7cMF7iJ9z
         pBCp8VFhoA5fW3ttUuUcHsh2SGYkOoxG+9blr4CYtQV/a2INNkc3+4a7UQpiUoURcQAD
         4FHF2UPqcmjyLJJwX+F1/1WQK0hiOv5Q8lp70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753396448; x=1754001248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=;
        b=lXJ9/Zydr4XDNSwlGClyBzbc4hux0JzRxKUg8alina5raGEtK0c5NuxHAm7t8jwTyz
         +GwBzUbnYXprqjxTBvCflh+ECPAZcsYnkoLC2TTNpUtksd+sWKu9mQsA56NtO2B3aTYJ
         hLtKhOjuYoHjYitsXS9sb/0iP/6GfnVVhsSb6amHkv4uywsfh6jPQZMOjuFwaE9FQRKt
         ZDD0XOQXypqVS4Xd6/4KuqYSCk0aIzrU4VzQ7q8ncWDNpGy+ZT7S+EptddW76lhs0x74
         a8/IhXYk4FzTWc08844C3kuwnwdXOz6NvcU5sYDe/wZMyGHHDDTkwwbMVcJV6ONgXEEH
         +NOw==
X-Forwarded-Encrypted: i=1; AJvYcCXyZ9JLZzcTBQKYDYgtaW+KsoF59UOBxkOgHMAhQw2x765HDhS2a4ScKuoGvA2Tuy9s851f/tpukWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHP6zjETQjaz9ILgMRtedwu76UIhpyI2Zh8C9drRiASPZwoMap
	ss2iqT+hu7Oaq8JpiAYuQFRUXBOdN7RLtExr3ugFD/gSfu/UsJ+5tcrt0XnZJQl4Rvb7g4kKZHd
	kMQej5J3xfZlGXcNdnIGSOOSH93CmYfyy+LIzh0MS
X-Gm-Gg: ASbGnctmQGxmvMJ6/s9rRTg4P1CcPe1byl3o+aAwjJ7QRX8l/YZ0i8IBzj5pgoSgyz3
	sXgZMDGvbbuoAs8XAwMODcpDzy6+eZu5hjBeP5zjZ3OTQytXkEuWG1RSzmDCj4qb4JvBBJVKrXn
	a0dKb6RZg5BSU4VPge7w48Jt7yQWGhZLHefFeYUuylkA5o2xmjggmMADB0l8UlEqjF7zvdw6Wch
	cYq/i0R7Poxlh+R6hKW/Vbgs42Zg3yB
X-Google-Smtp-Source: AGHT+IGw7888sY4RAxWgOIpBS2jsqbLS1GSQw9Ezb4XYcelgTGp5K5TJlI+fh66ZnLxrY/LAEeaPSDPFviU6dhf0M5o=
X-Received: by 2002:aa7:cd50:0:b0:612:e537:f075 with SMTP id
 4fb4d7f45d1cf-614ea7376b0mr11607a12.7.1753396447893; Thu, 24 Jul 2025
 15:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
 <CAODwPW_kex5Agqxg_i-XC308scEpUJU0me55G7iZ8nB9LC0acg@mail.gmail.com> <204401b4-b483-47e2-ae73-0994b39bd30c@foss.st.com>
In-Reply-To: <204401b4-b483-47e2-ae73-0994b39bd30c@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 24 Jul 2025 15:33:55 -0700
X-Gm-Features: Ac12FXyGMQKjEAnwbki0mRBqxHKS-33YCATLZ5m_kBV4BCbWy_vAFu3BOhmvtmo
Message-ID: <CAODwPW9drKEAMfQvQHV8eMTyf5KCHB4SN400JiUs0pgjoXy=sw@mail.gmail.com>
Subject: Re: [PATCH v4 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Julius Werner <jwerner@chromium.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > I don't think this will identify a part unambiguously, I would expect
> > the DDR revision ID to be specific to the part number. (In fact, we're
> > also not sure whether manufacturer+revision identifies LPDDR parts
> > unambiguously for every vendor, we just didn't have anything more to
> > work with there.) I would suggest to use either `ddrX-YYYY,AAA...,ZZ`
> > or `ddrX-YYYY,ZZ,AAA...` (where AAA... is the part number string from
> > SPD 329-348 without the trailing spaces). The first version looks a
> > bit more natural but it might get confusing on the off chance that
> > someone uses a comma in a part number string.
>
> The first one seems better indeed.
> If the manufacturer put a comma in the part number we should handle it
> at a software level to me and if it is a devicetree error it is up to
> the devicetree writer to fix it.
> What do you think ?

Not sure what you mean by "handle it at a software level"? Using comma
characters in the part number is not illegal according to the SPD
spec, as far as I can tell.

That said, it is still possible to disambiguate this as long as the
revision number is always there, you just have to look for the last
comma from the end (so e.g. the string `ddr4-1234,some,part,567,89`
could be unambiguously parsed as manufacturer ID 0x1234, part number
`some,part,567` and revision ID 0x89, the parsing code just needs to
be a bit careful). So maybe this is not actually a problem.
