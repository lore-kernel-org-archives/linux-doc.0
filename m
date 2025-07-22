Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC92868BD
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753221484; cv=none; b=CGhcIuOKuQiAgNT5CyPOd7EGAisq3hd/Fadl4EMhhDZ20VugsC1cFktwlXsCH079QB8tk/wQJQ1mMr9bm8PJcEPxAfQdissGVScQ4/B69rq8C7gUkNsFAKYqzutWAtJOHhxb5LCa1SjNV/jWcAFK8a3vBvel4RpwW0yooMb3FIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753221484; c=relaxed/simple;
	bh=lYiKyYXdjjhyUxtYTcfFpjzBCFZEpw5hRFn/BBVvuuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L22vkyrWYP9n5Zp3DDEOLwhwEIkujT2qgJSwuhxmuHEd4kvWNHN8Hzy48TXCb1pGP++hb9OMTeq/to/9NdjRyiCj4rYX0BE5jc1GYbtJjZ9qxLdJ8gn+9IiTkl7kYdSlI4ulOpYbe75NI7xbq7G4xE7WVP1MnnfR6GLXzkDoSdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PgQxFV3x; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PgQxFV3x"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso4723a12.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221481; x=1753826281; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=;
        b=PgQxFV3xVIYVzvqWxGeXB8OHIHNRoHKHmCv76q4RO7nQqdxZQcLB1ty5/mVtzmWnwG
         CYrnztOoFpxdfzJbLKQ+RtauRKd5aUt8LmxexpNafhIWydzVe1oLnNWOnH7bcJc5Plae
         Phwml768EXjZoAvaIxiXDoeC4RIPomr8tMQlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221481; x=1753826281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=;
        b=fGPc9yMbgySY+kOoCt0o3klsQ7leAxVkiEoIMQGaNQgu39DosZ+D1CIu77AupIlj/q
         lUXnmJgwpJoscpwxdQJgNlW5W6huiiEUIMNRsH99JY7CpdHmggC/nYejoUM1RsZYnTLh
         BjqArMu6RJbTSAqsSORLadcx2dbSdTeSOQNQis6GRMROTRL1cZVWpOLJQIJEGugUoqBW
         WhpZPZkQcTqqnAB6J3X5JtCAc4ZhIqOszMN7FbciJHmGnEwOpj5oQa4kQpeog2UWPo4c
         o5mlMC9F0TAd5AQf4LfqRwFzOwgV6e+0CURv+YSkjTFVzDtx54CDxZOXQAqmFRpZz409
         hhfA==
X-Forwarded-Encrypted: i=1; AJvYcCX/1p+BfcF1vGbp3oLPG/YRJIhqkNE0ezS1uW+lTQBvjnalaPIviNhUS1YNBvOw7TraGWzKK6KXBJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtBJNHb8NULBYDKIvWgIeNNJfXyQe9Mai013WSW0n08EvqsXVb
	csQfB6diwGzIJHC17EINMQHHu3MvmqD7DPV+GmBWnEiQ92cjUox1Tnm6F61bZgtEIo0huBEtfrs
	r4xAIElWMIWZuxb9XXWQ67NColT+907zA5Z5QIe1y
X-Gm-Gg: ASbGnctVZ5WRajYnZYxTX60ScmbHiVpL38fHes8t8HUBTxoIvOarJLPa0QPQeFhLn1o
	Gssf40sF2XihOo+KqvEsX+ZRCPU4vlGSO5GB2yJ06mSsfs3NQGgC2U6HyxPDT9ju0v26KT8/9ga
	Fr6FdBvivjSfIGhgV2oF8xSrGcTDSu4Ja+C2aMbSAPHKxQfrOzK/IT3a6l2T2x67pzV8ujjy8aL
	KFXBWuxPCt2g4S9AMRq7V0J3sFdH7gjPQ==
X-Google-Smtp-Source: AGHT+IFuRyHVLlTc9+mvjyXn9nDzKUxgSkHkWINR1NMMOVHEBiRhg+HBPAtm00VgI63bbY4a+rdh39BgoHymQ+H8ciM=
X-Received: by 2002:a50:cd42:0:b0:612:ce4f:39c with SMTP id
 4fb4d7f45d1cf-6149a332acamr34752a12.0.1753221481275; Tue, 22 Jul 2025
 14:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:57:48 -0700
X-Gm-Features: Ac12FXzhD62MTJBHmWXOCNn35YJ884MYdMc4gPYhqJDJjbLE29Cjc-kRxryta0g
Message-ID: <CAODwPW_7aYdEzdUJ7b2nT4-zS9bu_hbNqjc7+_wSHbedXZXJ=Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] dt-bindings: memory: introduce DDR4
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

> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{4}$"

This pattern doesn't really make sense when DDR4 doesn't have the same
manufacturer ID / revision ID format as LPDDR. You could either only
leave the fallback constant for now, or define a new auto-generated
format that matches what DDR4 SPD provides (which I believe, if I read
Wikipedia right, is a two byte manufacturer ID and then an up to 20
character ASCII part number string -- so it could be
`^ddr4-[0-9a-f{2},[0-9A-Za-z]{1,20}$`).
