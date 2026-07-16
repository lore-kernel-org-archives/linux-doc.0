Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41724071D1
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198688; cv=none; b=uDQDitmaDtbUXkPKtuZfkrLd0uB3b73tCkeYlDlAkSD1ARb3EItO/vcfH2O1ws62dXc2RsTYqvAghSFX9MtpEMYHUQQhfKYAk5xb7aK/OpdJkIUa72wSH/oxT5IFLe/t47WKSLi4cmoKiWE6I1UUsnlW7gLSjgkYGrSI9IAu53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198688; c=relaxed/simple;
	bh=QfvC1FGivIYwMNcU81A7ydKOruNfuDO836KrBsFCpag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EL4GIWWRWCmoVoh5nlZTVzlJ5/uqeeiOXLjQH2KE1C6PF1F6TdmuQ8d9Qaknanc+HdfwaH692ix38KAmhNLnYJENIZt/+ITOhdjbn+OkAldMMOzqNG1Xmu8Mi6tdsZfkIlr8tzkeSqtQmmr6QOBm+02fqYDdzfl64X+uk/GMv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SqXxYypC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SqXxYypC"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so2421190f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 03:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784198685; x=1784803485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bG7DiFK2AkiQJxlm6ywiTGbJgNucHDn6Zq82S4v139g=;
        b=SqXxYypCpqoUaKnL+1ZBREuJm+K0EsRLoUl/CwRpnYe/yXcrJOnNa+nDUTo/NFoOWp
         lncl0kx7gvH0G6f4I3aRSayMztXMUMoY9/i64H4YAarlczoILYjEZ2JYs8ZjYXzBzmqW
         H5R/EI05tkHFOWiqbWsaJP8/4N7vvZl0KIAhtLaE+STBCqJQK1g45GsRS4kjcbH2Ed1b
         b4H1mkgX+FsKk09gnEfNTsh/VrPfQP1dTp13Y+unoOOrUovq90z4h11PLdgjunYbgQlo
         zsBtGRZ0HW4cmVI7ZV8GmyxxJVnCEbqcLBQJ4tkPlLcIqn3p6dZT1KlInfwoIiLQyM3G
         f5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198685; x=1784803485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bG7DiFK2AkiQJxlm6ywiTGbJgNucHDn6Zq82S4v139g=;
        b=dIICMHILmpjKQdqAHJxViOkYgLZsCEuNuk3UcZi89awXEs08BxICsWKcjEgxzMzSnu
         DPpsCAtFEMMvYSWlN0q5s9t2Bcm/JuuMKncHZODDdxey2+YAh4GHctgsLsw6VijtRO5+
         KkekJqWKy/BkCN1yMaSEzfYepJajbTweQIrDZDtd7pOmm26AiK5vYXzFoxfMWCgfOO7y
         81OVjBU5f7F0eAHzRym8CxDOdHSWNTR5iMCEon+xzsHKqP5rDm76hOHMNZ5w27/oQKX9
         GY91jszAlKWVkYvKLh5baxG8Q8+3h8wGeLEHWIz/R8v6MLJmdorWkX/KD92SO6ls647k
         6bGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGLhfTqmeojaeEJyjmKjaEVJDHRTA6Zzh9ZRqJudPmnjupkBwW1naHwpLnlK4oj3foYqz02eUx478=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4I0ZwOCvspc0lOiYYLYsl4OKKN7gAL/JGZx1eELRaqlFG4vt
	xHdvjITEdM9owNESSA5ai3xswSK4anHKABIqQ+TJexffqC2LdTyfaxnYMA41bd0xNgE=
X-Gm-Gg: AfdE7ckV9su7l8esNtT04DqOc67Euj/oJ5rg0EaDnlG0RpQT98P9Wn/z84dLa/OQXqb
	4BDj+AmAQPhDl19sSzMzNYUS4NWQq2nBdEjnw05MiUO3/z47bgwrJ+1aJJ+fcIdfeU6QN+y9Z2w
	19V/ZEsBQ3KDXDuV/5oNMo6Pep6BQi/ciwVTfVzdLoqnCETCKmMy51bynqVp/ERdahUlDSa9T/b
	ZY6NlokoNKoQCf6YReVEIXB/kPDttdqkIJ28wdcDYFeaxidxW2PPwXuTn0hIkeXMpFLMJNxqaOJ
	X0wxYnLySV8Gs7KhyH2y1uq9bijoD6ygMbDhrIgiWTa0YxsTg5sPtHz8J57l/GclBtRccLmHDy3
	+4G4VbqAgqJLCH0qSKgwpLyL6QZuxubJuG34VzIzLNirr5LPkKCr4J0bznXprg2nLSk0WT/+FEX
	bSziLjHjLfX5OVjw==
X-Received: by 2002:a05:6000:310d:b0:477:6da:1b6f with SMTP id ffacd0b85a97d-47f2dc9c5b1mr23909548f8f.23.1784198684979;
        Thu, 16 Jul 2026 03:44:44 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:a01c:aecf:c14b:e17e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm23851143f8f.29.2026.07.16.03.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:44:44 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:44:39 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <ali2F4dDuLRWJsfi@linaro.org>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
 <alYGGu7_3G6mJAzQ@linaro.org>
 <CAMRc=MevqXga1u-XC8LYc3hnjjzmdESntsSGYP25XECeeySfJA@mail.gmail.com>
 <alepDnRJmRLbFGRQ@vaman>
 <alewA9ubkYKHpnuj@linaro.org>
 <CAMRc=McZK1=S2SFgpCjtHSRecY0SiQWbBqsUxGX1w4229s2yKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McZK1=S2SFgpCjtHSRecY0SiQWbBqsUxGX1w4229s2yKg@mail.gmail.com>

On Thu, Jul 16, 2026 at 12:43:04AM -0700, Bartosz Golaszewski wrote:
> On Wed, 15 Jul 2026 18:06:27 +0200, Stephan Gerhold
> <stephan.gerhold@linaro.org> said:
> > On Wed, Jul 15, 2026 at 09:06:46PM +0530, Vinod Koul wrote:
> >> On 15-07-26, 14:43, Bartosz Golaszewski wrote:
> >> > On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
> >
> 
> ...
> 
> > I would avoid using struct dma_slave_config->dst_addr (like in v11) [1]
> > though, since it's more a "address to dummy register" now than the
> > actual dst_addr of the peripheral. That's why I suggested
> > struct dma_slave_config->peripheral_config.
> 
> As in:
> 
> struct bam_dma_peripheral_config {
> 	phys_addr_t scratchpad_addr;
> };
> 
> struct dma_slave_config cfg = { .peripheral_config = &scratchpad_addr };
> 
> ?
> 

I think you have the same thought in mind, but there are a little bit
too many odd typos in your example to give you a simple "yes". :-)
(Why assign &scratchpad_addr to .peripheral_config and not the struct?)

While at it, perhaps we could rename scratchpad_addr to have something
with "lock" in the name, to make it clearer what it is used for?
(lock_scratchpad_addr? lock_dummy_register? lock_scratch_register?)

Thanks,
Stephan
