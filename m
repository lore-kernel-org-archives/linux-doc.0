Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9493B841F
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440881; cv=none; b=RyzcfghUTscZqfa3mZlOWiyrCDD3+M2dJWWh8T3/6erspUmLfq8binihQ3bh1QuIHhVRbeaTa/3hZcAkV0BiwR7mBwYvZwTY2jAdcqPlpb1ohAPEwI4YIs1o6dNvzrXjUx1J2k0faPvSVxOw4+XfWOfE6h5zNCln/CRmQh00NAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440881; c=relaxed/simple;
	bh=K2X1CEY3hqLVsjasNeGeSp1UXS0hl5ED+Udw9ATF5Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSyQPhQanrik5pHH76iOBhss0FcIDR/qtxA1pS4KflsuHvjfq4rAv2sf0SKhD72ChBtH7LbxX83GXYgVqj+0FjsOWb6bkH5or0fmm0bErYucJBVzUhOKCHfLhQsl1wD9+qXWg6Lprt0PqGMr6KDFIQzxM3Ncz1m1XzMBIP4eIx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iG2+sOCe; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iG2+sOCe"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so3123403f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779440878; x=1780045678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2X1CEY3hqLVsjasNeGeSp1UXS0hl5ED+Udw9ATF5Z8=;
        b=iG2+sOCeNdYHUUY1YMq283A78DHZVpkj7GqI1uUGCpKMCpDy86bZ71jNyi87BTTXzL
         s5caC2eqTZWLBpphHWgM2sINq6BM1l4fStaCmIu2WD49BOQMuM/UTqnLkMqeafKN09eG
         8lZidnF71ZFc0z7bgNxjqYI26mIIca2jHTa60Qr6MT4vUPFpA8H+xStgD1xIs/Em0TE1
         m6CFTtRcxkZvNNxdaJ/MXJdtl7N2MqYPavVmkivKCQMDhW8pVDn2n8ipQgNzcXD3GeGR
         2yr8UjKZLCtQxSNdHeKof0ru8ZRqxwtnwNVXt4ZQr2CgeLW7t8Xk+tvW1czdwwjNqG7k
         Dldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779440878; x=1780045678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2X1CEY3hqLVsjasNeGeSp1UXS0hl5ED+Udw9ATF5Z8=;
        b=j/WTVYKBm4rYbzXnJy0gZ5eQBIFJfXsJ+kqETZ0/mFs8nVWLs27Z0Yzk7nUkn5Pwj9
         BJiQAKLchK7lhAp6HCJg9muQODFmK5fJmaPPhnaxQGbzURpyjDbX4Vp8CrD5Do6McgZe
         p/rQg+Y7MUKPlFhZIKki7Elv/TV7JaJqJmf7p9HMub7CmkrC2YLqyXROawchRTxZ4cUs
         ve3UYOomHspH8TOeapiGEWJKPQT91pfoxyq04ZGkN3zaJo/qiyGMS1Da2q2i/bM10D4B
         idCqpjJGRGKRte4zzR7xzRCNg4IxZcf3mPp2nORoyA/zf6aTbWqxefAk7KiaMdgw1cQp
         wQ/g==
X-Forwarded-Encrypted: i=1; AFNElJ+eS2JU4RnwkpqjfdivyJpxcLIrShC2Ptkv3CdmiwbYgjNr0EUtj9kkzt5iOe2SnBdD6HgqQt7eDg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvP7O8GTt+FmmSobiZGhGy5h919LMoZXqIBdkmxsBZ1/G0x0f
	Gpq1ibW60naP6xjVTtH5TKxbCNttmnMxlugcCXbqgUbAN/9zZ+5/2oaCxadzmEzMoghJC0uQ5KW
	UAhHk
X-Gm-Gg: Acq92OHcG3Lggwc7Q68QtQes0Ys5vYE1YEvfJscwc2HNhojDGYHFbv9Z6F/UUfG8puK
	OX4rfxZq4111haBmaZIWK4nzas+wR6cUvAYWZXHodnpX1geny/MjLnM0Eutenzo9V5VQBV15uhF
	51KdjbikqGlQj4Yyk6Q0fc/JI/Oe/KgrZZ9PVB/3o/nEOIQGXRMIZvKXHhEtR4om2Wky54/lXuH
	G7jaADRbfAtk7BR8C23znaBOt8iECEj6lwu9YgWJ7OFIA/gCyKE3hTAYG1BVhGUxZr+NRtbZXkZ
	Y58MNPWPLDSMuYzjPMp+jNXqzfEH08JYBhMqC/QomBPeoy3B84vV8e+BeXFqxMJhVK7O17tipaU
	aozXPlTJFsAwfA10Fj/gnnv/1oSa8j8xykgK6Jo66h2/IK6AUJBu9lBzVa4RUBKZUjtI7IKBHDP
	jiQCuenVA8QC+IruxjyFGCfR3IjhRbwwPNZc6ADFDGOA==
X-Received: by 2002:a05:600c:4fc9:b0:48a:93d2:60d2 with SMTP id 5b1f17b1804b1-4904225331amr33408155e9.0.1779440877028;
        Fri, 22 May 2026 02:07:57 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452765f5sm27791555e9.5.2026.05.22.02.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:07:56 -0700 (PDT)
Message-ID: <fd735de4-3758-4090-a073-53bf43c80af9@linaro.org>
Date: Fri, 22 May 2026 12:07:53 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/28] mtd: spi-nor: Enhance software protection
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Miquel,

Please consider sashiko's review feedback and let us know whether there's
going to be a v6 or this set is good as it is:
https://sashiko.dev/#/patchset/20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597%40bootlin.com

Cheers,
ta
