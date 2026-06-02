Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCDA368D72
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418320; cv=none; b=BrTyrtCxzS9W1yuxLSWoqjTH+Ixa7sGRZ2A682eIQJYr/qKFtk1Y3Qe1qD3Vbfe7sQN2AZ0eLAzDYtUjyUznYnRZKr7HAvLp4KeeZW/9l5u1AqOjRe41FR1YVOKdxL/kQipkWnpNYOvU++C/SUo1UNWyabKLttiLV/30sfpquw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418320; c=relaxed/simple;
	bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deeaQWooMoyifU6zYFnBoaZgTuxuBbk9quFSXuyRJPJrbxCnzvYOkjUgOMhh9bAtU0GNERsC1iseBjqaxUqjVM8E5VqiHUi6Eh9dvgSaLRYzfau75oG05RZRL0SbtDG7+OYWjFjvXosjS76uLO3N8MyGZnX+C+OxR4P28ptWXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dhp1RuoM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dhp1RuoM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b12270b3so7674165e9.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780418318; x=1781023118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=;
        b=Dhp1RuoMIgkOz1tIgivCGlzcEfCM/F0TwNwrOlD30SOrPUP9X0pk1jKf45MVZXD2qB
         Y0U2Vh/tibUVKER8x1Wo8FLqPs+VhIPGR222R58rC2yCrEfGdyQvYBOE+pEfchOdbhkt
         pU0giNtPmGEguen+ViRMghJUGwIMgKi17GuJksCNJtyfUNChDz/NmidxQjstu3eUEQOs
         xrFrShXa3Na1mri/KdchGz82zqQrrsxTxWshTVVGcANc39kYo8SSegNQ/J3H84x6x7S4
         aphwriiQvgNf31lUKqNreRJvIPavKKUfsDPrxRkdD/3WnNff4c7FXxWQCPyX6HXerUQT
         PGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418318; x=1781023118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqqoX5qQzGE5eNHSgLyrNrWlqXnwPa/uOKYx/N6zAZQ=;
        b=mCgaxSsQKtgl9aelbzmOqoKe8xzk2YETZ36KOZLcBhQfgql0/dJoFQpCznS+MJ1aMs
         eCUtxbp5i7u0PKql7OyF5P/YhF3DJIbdsZf8RLAa7dVAIJstkcBNJD++fkg52gWfb6v5
         zX4qNr2yhPMf0xumL+9jRq+TlaUfZJ9gtzoflmla4/QyzeCelOY0JThbeXgmxmtCKj06
         gBQhS2iraN1b6zAfGO0LonuS7vXVqpup2f9AwL4vnWOUH9VJsoSyPEiYmNQKA9z40M1p
         QRqlOgoKrhT3d/FdTuFsMYl/KayvocAmBtIyWeON2FAw7SgDgTVsQHHLXl9r6CO/AHBR
         U3PA==
X-Forwarded-Encrypted: i=1; AFNElJ9uYud03bAf+JypCx79RCzN6suB28efXqOZIxjAhNxFcax6dTjT2zJrNZkkCltFkvrr6pNVpfSfdbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVPhpx409wEOFCakhY505KlnyAWVJHuJ9p/m44i9TS3HGeGGHT
	XIC2phRy5HtUTnB9EAC5op4WXjBNwHCjWG1Ji7cmf8aniN99TuJbGNiekJRDfbvpylA=
X-Gm-Gg: Acq92OEdoPMV1X24ycEmLKpgrXeCkK6so3AP6036gxBCYnKNWb34PzmH/hBlzf7aQjP
	xsVM8UXhhbuhPE6p5YYz821F7Efmebwd5z4mwuOB9j032niFL4tCr8nJtNPhK/JWuGAvvitjIs9
	tNn/4h29XNRDRxZIeE7KD4AxpMwtISDErAC83xdMlA99c5UpYSOm6/6+1n5MTfkMS0u14JwwGIQ
	V23qZzLS188ohyHg3UtM5xD6wJgJ89VH/wCG35XUUurr672v4d3CKZmVQeftPcvB7opN6HRRj3Q
	QiX1lGx6ZMygcwVJUhCXSHYrOEDNffLt2qfhNjHd51eIwvqIwcEvvmZyixfTIJQGgwRrR8SQyNd
	6PUfVh66UxmNU6ZMfdXvuSYy6TUYnjpxZSxX/iJnGHRUd6APC+9v/SWa4qzOFR3pjOcZ3jLdqeh
	YmCdra81oHOuo4b/xPkPY2H/mjFAyU3/vlpjiisbrKq3AQwg==
X-Received: by 2002:a05:600c:608e:b0:48f:d1c0:5cd3 with SMTP id 5b1f17b1804b1-490b5065ee5mr8757815e9.13.1780418317804;
        Tue, 02 Jun 2026 09:38:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:9db1:6daa:c0a7:d3cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm407269f8f.10.2026.06.02.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:38:37 -0700 (PDT)
Date: Tue, 2 Jun 2026 18:38:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v19 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <ah8G_ajPS1KhgPP_@linaro.org>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>

On Tue, May 26, 2026 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
> I feel like I fell into the trap of trying to address pre-existing
> issues reported by sashiko and in the process provoking more reports so
> let this be the last iteration where I do this. Vinod can we get this
> queued for v7.2 now and iron out any previously existing problems in
> tree?

Thanks a lot for working on fixing all these issues!

I agree there is no point addressing all the "pre-existing issues"
pointed out by Sashiko, but have you looked through the other comments
for new issues pointed out for your patches?

Out of curiosity, I was looking a bit at the comments for [PATCH v19
06/14] dmaengine: qcom: bam_dma: add support for BAM locking [1]. There
are 8 open comments there (Critical: 1, High: 6 and Medium: 1). From a
quick look I would say most of these could be valid. The critical one
about the usage of dma_cookie_assign() sounds a bit concerning to me, if
it is true we would be basically breaking parts of the dmaengine API for
consumers by inserting the lock descriptor in front of everything else.

[1]: https://sashiko.dev/#/patchset/20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a%40oss.qualcomm.com?part=6

Thanks,
Stephan
