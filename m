Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749FE28C2A8
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753221502; cv=none; b=cePpDJDPhuIbSdFQUAKDw9U9pFS6mA73uv+QiVC+tGuonrRVV7CssSq8vssN8P6QRzzhLj9h5OQCW0PKLY3IoNNVZkviMDSxl/NsbU9gJ0H+KAmVEResAUqr+WB9gzlTNRUC9judspFA8iGNqPeaW+Zuo8To8Fmr2R7Z0qegcSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753221502; c=relaxed/simple;
	bh=EngUjsKE6ntaSga2u9NxwJiCa0I8KWoIYhdBjksfnBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuR5RXt6m1eTT/J8mhvHxtaGsE0/MBIXHQLlhj/e8QIcx3L5yiwO/FtT26ayM+6tsW11VZRmC3T+somZZmvbcKXiLFODCRKmrHqUGU/WhSVVBR7iW2z3XoXSgTXsIs7WgW9WTObUFd80y4opf/L9X34ORibgrOTy80NVU82bpQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UVCLt9hr; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UVCLt9hr"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso2197a12.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221497; x=1753826297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XphRFYGKTpOm5xqnRvI7xsnYVXmfTKHiTieuuJNNgkI=;
        b=UVCLt9hrIkRO21cndqVwG+FcQW3FCo2GmRfwuZDHOlTrI7SNrja+Mpmf7h185ZpHBH
         HJny8RyTGLnAEK7fUBtNYdmPGFyHl8jSDINWskWNGEE2vM2twjUD0oAZ0W0Dt8nCS3MB
         BHBj+GuCntnl741iXcVqJ3fnk3DhBbTd2LN0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221497; x=1753826297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XphRFYGKTpOm5xqnRvI7xsnYVXmfTKHiTieuuJNNgkI=;
        b=P4VAyv6a+DgEsbEo33MU0t46Y/RN7SY0dehZ2uKi9MHDyH1x138ySt3q9rpy4sq4aB
         4Jp386q+GwxAtcnlfbgD9FQ48iMmdZsCfFgdu2b19we7mOtmPHX3lky7CTxxZEpVFkQ5
         JlqaRXvwHuio2fh7pLqhtOLVda3Y2E9gV7SJNsspdO7gRi5YtV0Us0Be5GmmaJkMG/LA
         uTIAYjXCMoHQfckCFAra1SUJDvOQuEFj9rBM4b1cjmjuPaLlIN5AoempBRPFDa04P2Ys
         qA+AYGvHpbQnz2+JUMxFICJYcfLCr4MyZjQMH1DAjNOJTHhj0m/WVP9QAgkX6P/3KC+6
         hd0g==
X-Forwarded-Encrypted: i=1; AJvYcCWkfNE5ZM3qiwYcU5AP4gVoFXQ/6RNYKjFEhRJqCL6XEQhPhoDsEn9o1GIyjRwih8qDYMTFlOkCXe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+6CW9pPXxmwwo+Kv4qRaMyQLBxPhKuoFV5L6v4FVP/Vl2u94
	JQmZqdCS12OUBjuEnqKj7my80wlkJo2bAAmrmpbygcBJBAbYKVX6/AZkWLPmIlV/MsPnMXopz6n
	MxzqHE3/rLo0QsMRKDxzFOcV/iQY5aeC1pFK80cE1
X-Gm-Gg: ASbGncvdTMbL47LIFP3SNYVUF0DZsKqLNlU9ni89YDVn3wqZitovn8T1N9lKiWIa0/A
	pjq7fgabmgzph9mlVDyncvNpofn7RtvQm1zBhDGlpfVb0ZHEqFGeO2lBiqRIlTR/PN9TYn165kd
	2F/0IcIIX9CFR0oaMY9L4rogpUHFoyYk26PzV33Pz7RaR43kIubTt+4R/mBVucwDi90ykEtyzPQ
	hZnki3cA1uiDiR2qeNG4/guDyUz9QdRWWt7+3ik6DEg
X-Google-Smtp-Source: AGHT+IFp5y+l1fTW8GtjpxnnyEe4EWyuH/zYE3JF5LoJQi9huRUvCNpCO/HKD9InP/jd87P+NKE1aVh/xMR3qwPcil0=
X-Received: by 2002:a50:cd11:0:b0:612:7599:65c7 with SMTP id
 4fb4d7f45d1cf-6149ac2e0b6mr29581a12.6.1753221496595; Tue, 22 Jul 2025
 14:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:58:03 -0700
X-Gm-Features: Ac12FXx4M-_tpsnv6SoYOcaCR3mVKSUiARmyCSX04o5wxXNHMo0oAxmxSQQ0MIM
Message-ID: <CAODwPW-kVcnVtVakXs7aBcwb_nv0bLTaK5PKNo4zmJaJ=VC8Wg@mail.gmail.com>
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
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

> +  purpose of this node is to overall memory topology of the system, including the

nit: Might take the opportunity to fix the typo here (missing words:
"is to describe the overall memory topology").

>    - Julius Werner <jwerner@chromium.org>

Why remove me? (Although I'm also not really sure why I'm maintainer
for this file and Krzysztof for all the others, tbh.)

>  examples:
>    - |

I think that's a load-bearing pipe character you're removing here?

> -    lpddr-channel0 {
> +    memory-channel0 {

Just to double-check, the name of this node doesn't really mean
anything and isn't directly interpreted by the kernel, right? I'm fine
with changing the example here to fit better with the new expanded
scope of the schema, but we have existing firmware that generates
nodes with the `lpddr-channel0` name, I want to make sure that it
won't break from making changes here.
