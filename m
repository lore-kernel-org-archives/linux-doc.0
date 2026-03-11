Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2544375AA6
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216405; cv=none; b=HFQ6cABaOwSnOUtqJnIDyryX/JPTK9ppyQl64zK5RSSNnoeJZE2YulWbhhtv2rPgiEYLklxM3hFwWiTiZlbvSeC0x8+Y2QenG495VUYklXLszUTXuzO38EED6VhZrMJfK1DMGgPhzFiyinWCo1C+xQJhIa+vK57LBsIlbMVONBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216405; c=relaxed/simple;
	bh=I5XePahDdZxkT2lcI/2aGwvT7jVpioZ3NcNMQHdU7Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEsxjG7ydjdDwJ21UBqPCl3Pkol1w5Z8QB9R5SgdmtKQ/+PjqAxVzNvyGpeDY3BodtTZvg7eEyy7/fAVOvNO3E4Pdaku1kuiZOQL/UumIglB+CU6l9UiW+xFqQi6RSVm6u+9LgEHfJywrUuxHdN6txhX1moCVSQjbvDTfNsZz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h5/Hjhhc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h5/Hjhhc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327790c4e9so10791953f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773216400; x=1773821200; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QqJVCEF9evLSw9CGf9v4iGyJ+/vqb8/nhU/YNtIqzkw=;
        b=h5/HjhhclbRrnH5/9ayteCfacKDvxrvJw4HAtGuduxqH7txBTyzUaQy8T5Svkngjnb
         N9eZtr5vmwuuV4Hl0eB4t6polvHUvwtti1ynhYBiGotkS7iQiLwoCl8C6W6drqqE5Xd3
         igdmjQcZO83solffJQsbzwH9XME6z+zWqxtLBz4vdr2AXuB+yQX521sJmAXdOrt8YTSR
         kPSKuLuSMkIZgRowxjT3eaOvkoTmknh68nZPqzt3UhBau9kyK6iLxUMcYSVyTNCSuqAv
         nq81IKZD2bsHvgcYwP+B0FUnbAgTyj5tfHE5xp3BBkBwEjWaiKIa0OYs4QRQqkW/gFvH
         8csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216400; x=1773821200;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqJVCEF9evLSw9CGf9v4iGyJ+/vqb8/nhU/YNtIqzkw=;
        b=YmSxu8EOqielKIFXUPcIovIFG14wTns5sT/tRJR07Q3abVzECYbOKQyQbP1isX+ivN
         53mYn/R8e2ZBpa/1tU/uUE8XcDTVktLYtUjiFtN0IDeV7CiNcqjaSBHeWktP68GiFU+V
         8ORQV7M0BbAVKzRuudIQ3X51+9N/60/nGXn5VmV+eWDRe1LBaqqvyRPTA7BIavnbyDz9
         Khwips98ktJFyVAkK8b/SvRXqrO3pddyrAkl0Yv5qs4o7RULr2IscyAKUulNxz6Jivm8
         Bt6YVi7mim87Yl4D3lb7LlkmLDKReZTf27clVkRiuKElVMXBZU1Y7CTtg22BiD5qO9rn
         +yBw==
X-Forwarded-Encrypted: i=1; AJvYcCVVujDx+rGp1jPeSfRB168tf5Vcxj/yEWqN+j4pJ/CxHT/UnFKnLv1+3phDZOgj5mBexngS3PJ6J5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPFPHjCpMb8+sv/SOoto1PSjIeHTrk890t1+liPxFEr2fiHeJ
	mWE8c631uW7d8QSrUtcluGfDswWKAh5t4wicY51J6UvkdtuQKiezzNbG7I/fUQYutCg=
X-Gm-Gg: ATEYQzxfeLBMAbltmwPQa29URMgA8QfBwrMoluq1twOPOnYqtPgqTXTV7x3NMPSnGyu
	/a6YTIs9P2yoSVOs0wzuggM11OEgCxkELHOdX/wM/qKgbwCwEkh+k/SbPRhR6ZOJUA3bHBeXvlA
	NnKXUb9ABrlRlJ7xhgJSI1vUjmz07v3tzYoyHOn/hLIDnHLcrx19YZmlcHbUowir/9eWd6dq8Es
	vCAkFlpeT5XX30bXqL6IKfzS7UE6ZTrWEQNfge5OH8nGLjju9FFSFTe9rtVHN6EGPXDZkSdsZeu
	UnZu5xRzw8TLlnxJWXz9DwlbNBwm0NDf8YX5Uqgm5d2neveQz3o/VU7uEVJBex9a8ks6UKgHeKy
	u46BMjMfElal/RUEmkJUQg71Bu/o8W8g6bePpA+g7U1tumcUUepr4r8Vlun+j9Y9V6Nt73myri1
	1hsw3RdmrrnZ8qvL2jcbgMm72NLuXKSFc0f+4aUhxXY2Bkfg==
X-Received: by 2002:a05:600c:1f10:b0:485:3f58:da6 with SMTP id 5b1f17b1804b1-4854b0a55efmr29718895e9.2.1773216399585;
        Wed, 11 Mar 2026 01:06:39 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66ffe2sm30730665e9.13.2026.03.11.01.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:06:39 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:06:34 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v12 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <abEiiqKrn62Y_s1t@linaro.org>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>

On Wed, Mar 11, 2026 at 09:03:37AM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 10, 2026 at 4:44 PM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > This iteration is built on top of the v11 RFC with remaining issues
> > fixed and the mechanism for communicating the scratchpad address from
> > clients to the BAM driver changed from slave config to descriptor
> > metadata.
> >
> > However: during stress-testing I noticed that sometimes a transaction
> > would end with an error. The engine was indicating that a write/read to
> > the config registers was performed while the engine was busy (bit 17 of
> > the STATUS register was set). It turns out that we must not just
> > unconditionally append the UNLOCK descriptor to the "issued" queue, we
> > must wait for the transaction to end before we queue it so this version
> > takes this into account and queues the UNLOCK descriptor from the
> > workqueue.
> >
> > With this all stress tests and benchmarks from cryptsetup work fine.
> >
> 
> Mani, Stephan: sorry, I forgot to update the cover letter to Cc you.
> Doing it now here.
> 
> Stephan: I tried to use READ command but it would crash on sm8650, so
> I went with WRITE. :(
> 

No worries, thanks for testing this!

Stephan
