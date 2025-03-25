Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806D255E47
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902537; cv=none; b=YuyAUzWVfUcZdA79Lgfe/sEWkksxyqxFOSnz3z2p5V8KRiax4mblvWYkb4itku2QLDiBBVx1MCQqxq0PFloU1a/ZlpMqQsLucIPcsTyNNf7wTe38GLNTO6ExNf/gpstFgxlkk+GQQlICVbJuEQrBI6o9lJKzNqjxdowYpVTU7/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902537; c=relaxed/simple;
	bh=axTyly0sCljhfwwpNOgHFHjTCGh51MkgyOh1E0/Iq9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj+AnlS5wKXUJ0EOU3ubLBnTg6Q43ARp14xS9E4rgoB0ZTTIo2MQ1JUudwQ+sZ8a7gVU7djH6gwa9JPyf65+f9NNCPU6PcRrPVTUIDRNDFCodE3r7DQbeqCZiu+5B3IF5UkelYDc2KRsC5Glu3kIjxx6llJ5+qYyROoRJmBXCvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+r+GtQX; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+r+GtQX"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so9846411a12.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902532; x=1743507332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ona5OctVpUFMXPABaOF+C6CD5ocYKvVWSnGYTcvi3Ao=;
        b=h+r+GtQXpnstt+dpx91SPRhxJK+ciZQbkP/kAR/PPsE8hEIhQ0ZpdykjVXTcItvQCI
         wUJmlUs0ePLMrv1a3IfCn0DNwBhrA7w77wVIMXxdv2oVYkBt02TL0QYkDUZh4tGG1Pb8
         71P2ZYp2wamyXKTNYf0MWC3pPYEIRHhi3WPcsXrS8eEr0pUT+iRfDHuQioLRFtB8vylJ
         4JA7Nfnj3zNfv9+Q/IW61CoPeZEi/JAJQjU8nQ/jIxsM5E5LDcyQj2t7iLKwDUSCV82U
         mXFWxL7YC7p9yapECODixfe2Jic1x72RpS0swBCpQylapWHWFWCU72fuBXkabYSw2R6y
         ngoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902532; x=1743507332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ona5OctVpUFMXPABaOF+C6CD5ocYKvVWSnGYTcvi3Ao=;
        b=d7GXwmNApuyKkDTdYwSZWMxe2pR07hJlFMEMZd1ln9LrdY/IpL10/AWZwuSkjbALGx
         +1+6uE+BTWFyJAMLCORcD2mODwsBrrljTBV0qwGKCmjFJVwez0N2uq3MtjIyXvZlHakk
         IV2SzvHxEUCosts+NVS7kF9rEAJtQa4nPfEOrtMNXy0cHUv+MsuGBHGu5JCMlZZXGnQr
         J7Tk2jOn+mYbUvStmJP/2rMxLbeXChx3Oh7keg7xWTUgczaQUZK+G+eGbLOMvZZrAQNk
         wkvIz28nFVT1CHi00nMbnQQXCqW3u8/IHW+SN068EGlRV/bA7itirKTxBEXjqhZ1l+wL
         035w==
X-Forwarded-Encrypted: i=1; AJvYcCUxM1zG6xtM+JxpfsdwYuLzrdXMt5Gr7m/NG5ttRP/+7AaTsZXjrD9LsghFa0JAXcTTXhI57GQ7wso=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJNsDrnV3in6weGStZBVpdDOcpPAvdh6a9kxTHC3J5uCsgvo82
	gU3wFeAPhLTtDPpNcKe4Y5R4HPhxch6lcDl6bqGkURbuf5jWe1z9AwR4+H10HbU=
X-Gm-Gg: ASbGnctDld/0r/6F6QMUmM4rjxkD7bqw9zcmIhrZLPsUECI3OZ9M7lcNZgjAL768IXX
	jIh6aKKPMfMa9itDglqgbMpUp3sVuYJksGRHnnW7dH1Zy2D4yCeW9S9c51nrB45ZnZpufRXVKuX
	hE9TasG2fTAGwKhjlaWWBM7hewJVtJjb0cgzDkxLjoiAAGtqjnE1G/rfnQ0xlTYNX3k51mWsnBk
	FShUEURnfTS9nxio8AE7i0omIvLDPhHg8/G+WFpgWYRo4qzYMIdZLALr7U8pwCp050CTOvLuG6u
	CMZFa5pMZzR8vP2KUxSXUVVy6oOhQHrkY2JYV8r9AVguXuwLytVWlI4=
X-Google-Smtp-Source: AGHT+IFKpEsb4p3LWlHWOKvoJwQ3AF5kC9F/GUq8MdsIh3ud5GODZ+3OVezWTIFKtb7E9DO2qBLkNg==
X-Received: by 2002:a17:906:c144:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-ac3f2117cb7mr1775900066b.15.1742902531711;
        Tue, 25 Mar 2025 04:35:31 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:f88a:e8d5:82b:cbb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64b06sm848323766b.94.2025.03.25.04.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:35:31 -0700 (PDT)
Date: Tue, 25 Mar 2025 12:35:26 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v36 30/31] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
Message-ID: <Z-KU_o_LE3PO6J2y@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-31-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319005141.312805-31-quic_wcheng@quicinc.com>

On Tue, Mar 18, 2025 at 05:51:40PM -0700, Wesley Cheng wrote:
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> and PCM index the USB device is mapped to for supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.
> 
> It is expected for the USB SND offloading driver to add the kcontrol to the
> sound card associated with the USB audio device.  An example output would
> look like:
> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> -1, -1 (range -1->255)
> 
> This example signifies that there is no mapped ASoC path available for the
> USB SND device.
> 
> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
> 0, 0 (range -1->255)
> 
> This example signifies that the offload path is available over ASoC sound
> card index#0 and PCM device#0.
> 
> The USB offload kcontrol will be added in addition to the existing
> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
> the USB audio device specific parameters are still valid and expected to be
> used.  These parameters are not mirrored to the ASoC subsystem.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/Kconfig                  |  10 ++
>  sound/usb/qcom/Makefile            |   4 +
>  sound/usb/qcom/mixer_usb_offload.c | 158 +++++++++++++++++++++++++++++
>  sound/usb/qcom/mixer_usb_offload.h |  17 ++++
>  sound/usb/qcom/qc_audio_offload.c  |   2 +
>  5 files changed, 191 insertions(+)
>  create mode 100644 sound/usb/qcom/mixer_usb_offload.c
>  create mode 100644 sound/usb/qcom/mixer_usb_offload.h
> 
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 6daa551738da..7d8833945711 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -176,9 +176,19 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config SND_USB_QC_OFFLOAD_MIXER
> +	tristate "Qualcomm USB Audio Offload mixer control"

This looks like a "bool" and not a "tristate", since the ifneq in the
Makefile below ignores whether this is a "y" or "m".

> +	help
> +	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
> +	 This exposes an USB offload capable kcontrol to signal to
> +	 applications about which platform sound card can support USB
> +	 audio offload.  The returning values specify the mapped ASoC card
> +	 and PCM device the USB audio device is associated to.
> +
>  config SND_USB_AUDIO_QMI
>  	tristate "Qualcomm Audio Offload driver"
>  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
> +	select SND_USB_OFFLOAD_MIXER

And I think "SND_USB_OFFLOAD_MIXER" (without _QC suffix) doesn't exist
anymore after v30? I see there was some discussion around that there.
Is this supposed to be "select SND_USB_QC_OFFLOAD_MIXER"?

If yes, isn't this option always selected if SND_USB_AUDIO_QMI is
enabled? In that case you could just drop the config option...

>  	help
>  	  Say Y here to enable the Qualcomm USB audio offloading feature.
>  
> diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
> index 1eb51160e2e5..1efe1b90be7a 100644
> --- a/sound/usb/qcom/Makefile
> +++ b/sound/usb/qcom/Makefile
> @@ -1,2 +1,6 @@
>  snd-usb-audio-qmi-y := usb_audio_qmi_v01.o qc_audio_offload.o
>  obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
> +
> +ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
> +snd-usb-audio-qmi-y += mixer_usb_offload.o
> +endif

Thanks,
Stephan
