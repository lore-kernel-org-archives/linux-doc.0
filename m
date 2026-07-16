Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42E036D9FE
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187788; cv=none; b=iNn/e5jK3ldtP6DlrOhQP5XN557LKsMkXJH3qFvtgKCVn51AnngTrhCsbFzhhq0PEb7DpSPJY+ZF6/M19KItCdYHRJd0cWSnMEReR1EqR2gqiZw+1QIAzaecL2/Aqd6kD0aWfRpceDMNgKhSvkW/xmEvEDPdfzoG5CJMlzuZC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187788; c=relaxed/simple;
	bh=Z3WoiBwaBMuJQ2HDEWUbzUshEOFUjZRXGdz3c8S0ItE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ygob5GSmAXGlktTgYgCiLcYK3bfArp5ewN4RyNaBDCiinyjuklSAD/fJoVYsFv6UtLsEEIYzBF+pZRN5UwVuEzrgHRc+/uC38UG0VClnt8JmiZfu7AKHEvQR8YdJRTrNgiUZ0YoJKCITepNZHm9najqbc6MTCQhOK3cULcBUxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKvlLjti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKvlLjti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7D01F0155C
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784187787;
	bh=vClHeog58KNqWH8CCWBc/ZspAK1VXs4jFJuykhl903U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GKvlLjtigec06rS4zHMLnidYeHW74IQ4uSCnp0hcH1K/O2C3GQDf3Q7fg24nHNU2A
	 A1WEo5w5u/YwtkWERLdLHscDGFED0JTEYBup+wz4dWIzRuhfDLXi9jvMyEl6+dM2cI
	 +lU43pEiPZ2HZeY1xziYypsiej0SdJuAAoPU64gSltHwKwJJ9d3yEXLmBTW4Un/Zn0
	 87uHk9TQuQbHVn4Io0AnCuqOhZheuEC9iWnZbkFQBdO1gjYXTuwRb5ENItRaWTHjXz
	 NKlVugm5FhmvKa1Yc7FK14JbY3T1BCS2CemvjYVFqhpj5y4MPBd/aAozyKAEbu9e7D
	 4zgS2Gz5WKdhA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso34182191fa.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 00:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqyhIVyp9bp7ZDnlR5twJV0cgYMQnjN3YSRZzvsrv1vW7V2ITnTXbMA598qFM6O6h8q2jumsGgywRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFjO9ao5+Mdfc4KZJDhPbLCbx3cG8LMPJL3Q0/BddVopEuOut8
	uverZ1nyot/XcycH7RKo5PR34aTPcYdmdQEQHsseRGE2VedjHKQYhFU+YbtZj6WnB4AC3p+NqKZ
	TvqmafcJlRGmVo5p/bIbiyjE0wG3D/RVHpw36NVll1w==
X-Received: by 2002:a05:6512:131f:b0:5ae:b130:1e1 with SMTP id
 2adb3069b0e04-5b15d78ec38mr1636875e87.28.1784187786412; Thu, 16 Jul 2026
 00:43:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 00:43:04 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 00:43:04 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alewA9ubkYKHpnuj@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
 <alYGGu7_3G6mJAzQ@linaro.org> <CAMRc=MevqXga1u-XC8LYc3hnjjzmdESntsSGYP25XECeeySfJA@mail.gmail.com>
 <alepDnRJmRLbFGRQ@vaman> <alewA9ubkYKHpnuj@linaro.org>
Date: Thu, 16 Jul 2026 00:43:04 -0700
X-Gmail-Original-Message-ID: <CAMRc=McZK1=S2SFgpCjtHSRecY0SiQWbBqsUxGX1w4229s2yKg@mail.gmail.com>
X-Gm-Features: AUfX_mzRskw0QsuLe9nseN2xcUB6TP8BPyj9JPMV-mxeetGr6n2mWyZ5pOfIYHc
Message-ID: <CAMRc=McZK1=S2SFgpCjtHSRecY0SiQWbBqsUxGX1w4229s2yKg@mail.gmail.com>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, 
	Andy Gross <agross@codeaurora.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 18:06:27 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
> On Wed, Jul 15, 2026 at 09:06:46PM +0530, Vinod Koul wrote:
>> On 15-07-26, 14:43, Bartosz Golaszewski wrote:
>> > On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
>

...

> I would avoid using struct dma_slave_config->dst_addr (like in v11) [1]
> though, since it's more a "address to dummy register" now than the
> actual dst_addr of the peripheral. That's why I suggested
> struct dma_slave_config->peripheral_config.

As in:

struct bam_dma_peripheral_config {
	phys_addr_t scratchpad_addr;
};

struct dma_slave_config cfg = { .peripheral_config = &scratchpad_addr };

?

Bart
