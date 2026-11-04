Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782888;
	b=nr9/Om9vjpRpvAc2nA13YDp5yLNylC5IcZD9EMKyAeDT5/1x0SIZg88u843BKOqvLuwb
	 HhuRuJOub2G0RLHTRb76dVnv2Yp8CaiHAcvSc/BN61KovseyjrSfuWiQbUr30gZ+mVcZ+
	 ZkUSynhzFDdBfypH1AlZz9kR4pRBKcCCIIC0Vq0IRYJRNrZMHKbcgFvERwxZECkxhCKQu
	 EtBGVZZgxnzrJwqYllqbp2zeV8UXppIFnbldy8isKjagnZQUxetVMcD/I4IMjCMjBzLN9
	 buf2L2BKIG74RNt+wILapWA0KyeQT3i+Nt8q9D1QTajkfj8LP5UXa1ZhUVFRC8R8eIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782888;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AaKiM9W+fdOJ7e3/KZVbbDmGDM/hjoRoSVQ8Q/hFZsc=;
	b=TvT9Fi7X7dsUO0zOlZICg7qDbvjiP/ciNzrGDWe/MP6LTpZuFzIJmkKE57zsIYYcfBtg
	 EuhNkhUdQm3wnqrPb0yFOxD0HAeCPv1k5y90le54poSLTd4drRnAkh2NxfYR8eoQKPfZ9
	 xRDUHgqtmfILvMsUO4NYZ2m3jGM7m7+8fcMr2KAV+LKhKXKH4MLbvNa2NbTbfywAa7V3V
	 Cie6xR8/BR2dSTGx4anB44dh3Y7fX+KQ0dqQrukniJsfNvC8bVafL1Tf3RIPRsZ91kaEK
	 5NvDqLEe49b4OG7N25leOFx0fRCRanrw5nMMbEztBfCdJBVC98eskUGxiJXUkZboKDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A2606A334
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 09:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28A2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a06c60065fso362726b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 01:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782887; x=1794387687;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaKiM9W+fdOJ7e3/KZVbbDmGDM/hjoRoSVQ8Q/hFZsc=;
        b=yO6eDVNPe+liIBtCArxS8xkBX+K2duZOXoyZRrpzuBn3DZK2oDqE4foNAtfHtIMH52
         rl1+C30D9CLOmVuV1PtMe7ywadcXrOEhrYE4TWJxojngx9TyzNxT8QPhs/hLBjR8UpNM
         uz6hAKwJRWwZcamaucYPL/lV+nBAz8zNC2RMJKa6ot/L7Yz6cVQLtkduY7tVQovpXCuG
         Gp4FHc2DsCHXTP0rL3bvbt16DxuY6HdJK9KgtjtNeuHWJHF/EEQwy3M6eCKUG30X1Sk8
         q3vs6tmLp+HcRUaDlDilRrq6MiSDqG/sgWy+8zkamlxvFYyxGCHCfChRvc2trZOlQR1P
         BxYg==
X-Forwarded-Encrypted: i=1; AKwUvBy4sZ/T/PkB8ozQgMr9O/UQPjV/hM6sIoZv6sIeLMiFIKYKir5qkkgTvFdIPO7z+oK37Nvvwy7eouk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aQrc56yQiWyfYSgj35ZkqPdTK0AYZ62SQ0SUIXPgd58kiu4fr
	NddOZp2pJV5nXNaHarc2UwAy78jIXoO1nKselXOzLujsBAKZDf6l+0IatQjWVbR1
X-Gm-Gg: AYBFou2jhaS44f/w/XWkyxtVeh7I49AZiIJ4A042Hww7WE+TKCETlWPLi0nQ9AtoXHj
	bWBk44R/FgoeHOVa0A23l7MUGg1zaTw/JvlDNJ0aniOPHduQQrFN8TeCdBLyL4ffRewvKmtN1o2
	S/YaDvhy8EJ9tsqxlHjDEVjBDwDgeSBZwilw3ih/FemuSmnCcieRjwwlffheTDoxTDtRAsOItDU
	y4Q98bXZKJVV52ACzPNr6EDAGAnfXRc1rc6T4dHDnp5eP+J3BjkTxpjKX3YtftT4k+7XvQAAT7/
	hKvL/F1qXdLQdXcbrV0fIEasfxYt+8ECppoEONmbIMNDYLilgY6jJRlibXS7XIbFtmAAKhKZYU3
	bzeP0XQ1KvxOEoB57+L6TI7olqbsif+X5JYkJyYgxemaVa2Mumoko1YtvcPEw3pJU4yznpzAP8s
	lhSK4XHCESehTSK72+MLyHDqZoCr6RyN8eNR5oaQ6cRSKn3txbuTH9F6g2Ma9i+R5CUHVNXB3Bu
	TasKSQgKpvfwrIAuqT6HADApcNHJvNZPqKfdMW6GVm/D5PyDxvVYbvIUgcupySYau7BgsGmQSWT
	Sotlbmu49mQNLXTSifgifS6sV9Z6xr9+fwAjQ4Ku0q3nVcfifTmFf/B5GxUoSeomOWC17xgKm33
	RjbT1yuUX0BO+tII8CdjD3sYbzkITL5L4959b1S96ekU=
X-Received: by 2002:a05:6300:6d85:20b0:3eb:4863:1f18 with SMTP id adf61e73a8af0-3eb48631f62mr5607445637.47.1793782887018;
        Wed, 04 Nov 2026 01:01:27 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b6634cesm628948b3a.39.2026.11.04.01.01.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:01:25 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so907471eec.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 01:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzkJXtZEfnW7QU5mm0BssTPj/n/8ajH42Pg1pufsMqcnOiWuUZbVRN1M2RPGvzcNgq7pgoTIuoIJPo=@vger.kernel.org
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id
 5a478bee46e88-36a423a205fmr27260638eec.16.1793782884949; Wed, 04 Nov 2026
 01:01:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev> <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
 <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com> <4fb6c428-85fd-4674-8480-919191db1277@kernel.org>
In-Reply-To: <4fb6c428-85fd-4674-8480-919191db1277@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 04:01:13 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7CY6hitrp7xk6=r65EEQNYc74RYg-BjVSJo=6UBLq36g@mail.gmail.com>
X-Gm-Features: AclHuK9uQeJIR1NfXJqyf9nbtbfdJiELHYiw7wy3ZTo2enB8PX2i4vU_7m4oveI
Message-ID: <CAPY4CJ7CY6hitrp7xk6=r65EEQNYc74RYg-BjVSJo=6UBLq36g@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> No, it is not. It has clear and obvious checkpatch warning.

Sorry, my wording was ambiguous. I meant that I've fixed it in v2,
which I haven't sent yet, and v2 passes checkpatch --strict; v1
doesn't.
