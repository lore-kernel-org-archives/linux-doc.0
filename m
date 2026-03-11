Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90B53DCD96
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228329; cv=none; b=owTunYATvQaApt/HPFHGzq9HnYlej46froR/teJnVvp6vN/gDl1M+6YBCh7jDgYf4ixdrdIyvQwVW8nCMIsPH05X2kokzNd5pEnjLNWoDsuKXoxDbUcxpbXlew6ikDveov+N6qUYtYzLRbUmpNPO02ibvcM/RgcSGTSRyGPKtaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228329; c=relaxed/simple;
	bh=Bz8L6lJ5ljmm0f1bzOA7lmmgPpBjGpva/qWmEvAb8MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fh7QfNBgflj3wqbEj02QCucNoTqG1w9+Oy40dSjxeabMyhwezYo30p96G9df0gG34wE5A954EuCMSNCCijX21g4ERAMLYCs1TD7c13bhOG3G6r9AYcT5zTP2bHK3eyYY7hRRof6BkaSGZZezZ00hVMHsheLIoeixudSP4C5RNJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjEi7UaP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjEi7UaP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439ac15f35fso10424891f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773228324; x=1773833124; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CJze5/pXmPew2sfHMpjfcTTl4xqaN7GKbsQ4t36q17Q=;
        b=gjEi7UaPHAFk6q2s51w18yNUF03XkuvFUOBRtX4PJxLEfSWhntd03DcwQd5ef/DK6w
         mgYzuEuj48AU/x0wUIEjswwwUyV+B7krb5hOMHQiJ8UwyyUPQHEDoTjt0SkHOW6R69L4
         6L9THeytyGz8TFUzCmze6v2IRLNvaQK6qmx72iVPWCOSNhFL2EKpf9clVU+q4M7omaiJ
         nZw52V/+sPJ1Xmws4PP4tBHosuOj65m8Be07hrsUkAKiw+WEOTcOnONlSuSzeTfRl9vJ
         k9/OvMzkMYZQxOt3qvOZFEd6Kac7PJaY77UDEFkGn40X4PZZBV+EaC1uX2DUq2LM5YUt
         4+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773228324; x=1773833124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJze5/pXmPew2sfHMpjfcTTl4xqaN7GKbsQ4t36q17Q=;
        b=NOXQYFvyV5TA6fLnxt8TraSrteLSpW0qC/rlsiXfO/z9YBBSes8qbcZPLIWSv2BV4F
         L1eNZ8z5cMtRaTjENUXEMBlEic0fY1ulew8e/8CNbnscCLbPIsMDUeDcoH2ifWywnYLr
         ydt2xz6rVup/jJ73Ko/3Gonxqn+DoZoCFFu2n0HwMIRg6Nfoops65ofwvbQKj740KL/0
         yXjbc53lJudL356zFra6xpRn5YJzOfj7AtGpxWaG05kz4essHjB1feulazxreuOYjvgg
         RyABsakbU16iH6PLieMM+UAz5kn6aIEQd80W8GlrZyt5eFc+BNQD0EL4XMPEg1Mepfsd
         GJIw==
X-Forwarded-Encrypted: i=1; AJvYcCV3P38tfV8VvUuJU4PifJbVnoHmLwpHtnjkuxaSrczdqErmQl+SETZRoddGzCSrKOZ9n/TfL1bC1Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFtBTVaB/1GDggg7i/EhzmVYAbOPpP3qGFUmKLNWkRe1IcxQRX
	+4Wl4biw0J0KmS4ULuLKbQKFxW+VjxllLWv3NpSP4rKU2CdSI6ZmX+IXiLGKI4AW7ew=
X-Gm-Gg: ATEYQzyWoZCue+sX1u5T9Cyj+z4dGlQU1acMqn3bSB9fEQJuYMUUI1KGlz6bCAAphPf
	MZgXC3i0I6Aqhsw3hkO9wIb0p1h/PpsM2R6SUqtMzTtcqm9st6+b1IDS9e6VgtL4MH4CuBGZRxj
	qJB/z8zYyt2THb1bSEtGDU5nWbqe7MvcVAH0xItWxcD2TXHuEjKU+vGPcoW5nNvfoIqTi7SUcGD
	AOCW1z4lhSGLOKK6sdZi2gUo7FncArMPt7XrYEpn1PgbZN5hRQIw+dq0uA7IwgdRvcK62oW+BpK
	gwE6GUVjHvjSjGkqXk8h/vs9hjL4J292fGWOWn4GIN0GdSZ5i9TkI9aM7o2oLt3WZhwRlI6IGrv
	NlEUycXVZSCXxXTaQd+pBR4/pdX6+vp2Jnaw/Txzn4x+JfhXu+76IweUdMGKPLn3odi0rx8dAC4
	S694Bbbz8iXhx0xGlSkR/PDD7RY8HUYiiL7YIareKiHMcH8w==
X-Received: by 2002:a5d:5d0b:0:b0:439:b79d:b9a5 with SMTP id ffacd0b85a97d-439f8431382mr4099695f8f.37.1773228323834;
        Wed, 11 Mar 2026 04:25:23 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81f1318sm6682078f8f.21.2026.03.11.04.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:25:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:25:07 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v12 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <abFRE1qHgP-SYWZL@linaro.org>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <20260310-qcom-qce-cmd-descr-v12-5-398f37f26ef0@oss.qualcomm.com>
 <abE9RQfGN6Ycns1B@linaro.org>
 <CAMRc=MeSfFyVYSJHzHvuynRR3TWRz04tyiOy1JvqyHP0aQKPOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeSfFyVYSJHzHvuynRR3TWRz04tyiOy1JvqyHP0aQKPOA@mail.gmail.com>

On Wed, Mar 11, 2026 at 03:32:38AM -0700, Bartosz Golaszewski wrote:
> On Wed, Mar 11, 2026 at 11:00 AM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > I'm not entirely sure if this actually guarantees waiting with the
> > unlock until the transaction is "done", for two reasons:
> >
> >  1. &bchan->vc.desc_issued looks like a "TODO" list for descriptors we
> >     haven't fully managed to squeeze into the BAM FIFO yet. It doesn't
> >     tell you which descriptors have been consumed and finished
> >     processing inside the FIFO.
> >
> >     Consider e.g. the following case: The client has issued a number of
> >     descriptors, they all fit into the FIFO. The first descriptor has a
> >     callback assigned, so we ask the BAM to send us an interrupt when it
> >     has been consumed. We get the interrupt for the first descriptor and
> >     process_channel_irqs() marks it as completed, the rest of the
> >     descriptors are still pending. &bchan->vc.desc_issued is empty, so
> >     you queue the unlock command before the rest of the descriptors have
> >     finished.
> >
> 
> Thanks for looking into it. Good catch, I think you're right.
> 
> >  2. From reading the BAM chapter in the APQ8016E TRM I get the
> >     impression that by default an interrupt for a descriptor just tells
> >     you that the descriptor was consumed by the BAM (and forwarded to
> >     the peripheral). If you want to guarantee that the transaction is
> >     actually done on the peripheral side before allowing writes into
> >     config registers, you would need to set the NWD (Notify When Done)
> >     bit (aka DMA_PREP_FENCE) on the last descriptor before the unlock
> >     command.
> >
> >     NWD seems to stall descriptor processing until the peripheral
> >     signals completion, so this might allow you to immediately queue the
> >     unlock command like in v11. The downside is that you would need to
> >     make assumptions about the set of commands submitted by the client
> >     again... The downstream driver seems to set NWD on the data
> >     descriptor immediately before the UNLOCK command [1].
> >
> 
> If what we have in the queue is:
> 
>   [DATA] [DATA] [DATA] [CMD]
> 
> And we want to extend it with LOCK/UNLOCK like so:
> 
>   [LOCK] [DATA] [DATA] [DATA] [CMD] [UNLOCK]
> 
> Should the NWD go with the last DATA descriptor or the last descriptor period
> whether data or command?
> 
> It's, again, not very clear from reading tha part.
> 

I'm not sure, my impression is that the exact behavior of NWD is quite
specific to the actual peripheral (i.e. QCE, QPIC NAND, etc). In the
downstream drivers:

 - QCE seems to add NWD to the last data descriptor before the UNLOCK
   (as I wrote, it seems to queue command descriptors before data).

 - QPIC NAND has a dedicated "cmd" pipe that doesn't get any data
   descriptors, it specifies NWD always for the EXEC_CMD register write,
   which isn't even the last descriptor. This is also done in mainline
   already (see NAND_BAM_NWD in qcom_write_reg_dma() [1]).

It is possible that NWD works only when attached to certain descriptors
(when there is an actual operation running that gets completed by a
certain descriptor), so we might not be able to simply add NWD to the
last descriptor. :/

I suppose you could argue that "make sure engine does not get
re-configured while busy" is a requirement of QCE and not BAM, so
perhaps it would be easiest and safest if you just add DMA_PREP_FENCE to
the right descriptor inside the QCE driver. qcom_nandc has that already.

Thanks,
Stephan

[1]: https://elixir.bootlin.com/linux/v7.0-rc3/source/drivers/mtd/nand/qpic_common.c#L484
