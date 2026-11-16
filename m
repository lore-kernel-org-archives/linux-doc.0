Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849378;
	b=2ZZRm72doN9p83PuxQ021CHiipVbn3k8QS/8FdPnjtavoHzdr30TZNlPopHTEpXqAknl
	 461CfAd6xRE5OJLSXdEHgdyMOnUkVdiBYrFw9Bx++xpWcu0WlklsvWCcb8R5eYkpDXeG0
	 zVJf3DxJM1gTAqBoj0m8a8v3Y23zJOa9Rlm6931fBU5XLVAbXieYq23G5tjcgZpoCC5jo
	 MfvMbSbufRWox2hhAtCuuZo7Ag5yPPiFCwgFsrooZI4NYYURZcr6ckILHVDXp99RG2Acu
	 +6P6v6KslWeclkPgAPCwpIpFR5gh9IB5DARMDEF9bG39KeWNZ1soaU2T3Yy/W+ptnnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
	b=CEY40rk5LEbmaYu6k/I8dpr0LlbJrTr8w5iTvtkc61CEuuw/35dyrEG8kynAskx5Pv1C
	 iNN5vWjkyg2gMebsrrpnOS/uN0/GJ7hrKydmH3dtFI3P7FA7FNVL9LjpOz7eFKSHIlNHi
	 Q1+ZJ1wgWwkxcdivyWMdbeu3PvjmRaRk9qa/8Lk03pOeVOtfCXBaJZZEkmmVEhfu+coY5
	 U0Mo3JMbAJqrxWK5FzOmNQHnD2r/W7wsyZd3BgSVJlzls74x/BR4UwAYvrONB/P0qWhbE
	 xCxeSZk72wMPlCDCix0UKIDFv3Pl6bXhHW+kemRQgiF9T8LS8dLG6HsDAQJdPxVksBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HkMSiR+d;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58486606A322
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 17:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58486606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HkMSiR+d
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso39501b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794849376; x=1795454176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=HkMSiR+dksGlcwGZWXhn8RdtxqBYdJQtbxVMvbLI96Ikx2BxI3kJdM8SEHvcYMuweq
         Mg3EHEZsItCRb824lZUmdTkkxwc2OpLow4+0NsHeKkxKzP6xOXIY59In7u3SCoBtPfqY
         BJZM4/S1UARezX28Zhx/rN944CAeFFzwvXAXf0YdLsW6fmthJG+3kSv7zhsrNw6xnVr7
         IJsBWKe+bcNa1RisuddA3+9M9p14aEOUNjmYrYHbT3epecNIi+eb132pbV75ve6d780Q
         PSoRo+KCZDtD9ZU+3rUiMM71agE0dNDUtfWgY4kZCgotc3BWLs8iYy3Abq959FUkwprJ
         9vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849376; x=1795454176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bd5KkZtIi9hEU9aTOnohsJP4GtQbznYQgq/LOm2c1XM=;
        b=SypSHxD8jPEvrLs0tEiJnaFSBEgL8VrijY1B0Exo+IqnWzadij8gBM4TehOWWdapZy
         +9+m7PF468rWdayNKYNKnfqKHFxgiKp+1a9shtGQEvXXKzJeFudisfa+ei/St+u9Voj9
         Fe9kU1WEJ6Xz8AyN8li8kYKF3TyGvZyZte8bGXT/bRtIdn9J2q98/jW+pElzxZjD6CZU
         nW3ambPemhpGmnyEPQ1okFAurfo0mxUvijNEjAyNzivcFaNEPvGC25uVTxm4YKxcgUay
         UvokTGIvmwYjN++Z7R1JP2be+Ql8CdvOe3WUU72GhsTV0oXFpFYAvjaeMps01Cnq4NGc
         heXA==
X-Forwarded-Encrypted: i=1; AL+hErEIK/50iLgTIkm2BV5+I+ziNtnQYmkuJD1BFfd4ExosmzxB3zQr+3CfEjASn3HBFLswEBk2SQ8/fno=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5W0jqeMBa7UMhv+7hJajYs8efOXSr0nlwi9mfmxrubcyahLE6
	jgUc4zD8Ge6c1C+V4k6cp//cT4Ovej7XW4vE9KRaI0PJt9trUXcbc+Jy3uY6zByal00=
X-Gm-Gg: AYBFou0F0u8N1Pj91u6W6jw9VSjImnkDw1OQssCz7yAV+3bQuXBsyGSakTlrOT/cysq
	BHD0hMI8Fhhad/S/dOdgrR1EONtM8MOaQOTcFl/5Pd/YVUwWWv4/D69jG4l8K5q4r3M5iYQaduG
	x2dZRw4wZC/yyYldej5RHAjIVGZMcIew2oZz/D6BVretl+9bEDNOP6qSWQxJwD3UkC1mxnAYRVG
	SlLBT7cTQJiuLG5O+4vExTARCyjTkfGDx138Cs+VMciC+fzWjUA0n6zCw7YcQBXY2NLNc2rNrgB
	K1w2LjXFq8Li8CqhKyG3Yh1R0WKXEhevYqxqd6Ywdwvx5igl4iBo1/aMhZbTIYCO02rMNtZvPb+
	/ocq6GodVnwVIWUwdl9gNTJIFKu7kud5uJsyOmWPojYUo2XOoKM9D8Cnz57+Way1+Lyd8OAzsXB
	cmDywU+li9q9uI2HDRLwBwnYKc1XG9My0M7s8T65Ag077hCLh6QsqigHdI04JElSSrTqtfkriQa
	tfjyeCIV892cG2FN+BGRWR/KrT/j4P/wyik/HQ4q/f0+6aNfO3RINflO4arimzQdpf/bB1yZYmn
	l3Ideg//IYmHYkbmbzQfkUgaAJNBmKEr
X-Received: by 2002:a05:6a21:7a46:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3fd29c153b2mr84093637.1.1794849376336;
        Mon, 16 Nov 2026 09:16:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ea6f:45e1:c614:f10f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a97f9sm3778408b3a.14.2026.11.16.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:16:15 -0800 (PST)
Date: Mon, 16 Nov 2026 11:16:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <avs6XQpoQmY_MNYx@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> Depending on the driver originating them, data buffers used for virtio
> communication can either:
> 
>   - already be allocated from the coherent memory area that is
>     accessible by the remote processor; this is the case of
>     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
>   - be allocated from generic kmem, and thus not necessarily accessible
>     directly by the remote processor.
> 
> In the second case, the DMA APIs can be exploited to obtain a
> functional communication, since they will take care of cache maintenance
> and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> feature flag can be used for this purpose: with it set, the virtio
> framework will use the aforementioned DMA APIs to map and unmap buffers.
> 
> Bounce buffering will be transparently used in two cases:
> 
>   - if the buffer address supplied by the virtio driver is not suitable
>     for DMA transfers, or
>   - if the reserved memory associated to the vdev is a
>     restricted-dma-pool; in this case, *all* buffers will be bounced to
>     and from this pool.
> 
> With this support in place, any kind of virtio device can be supported
> through the remoteproc-virtio transport, at least from a data exchange
> standpoint.
> 
> Note that remote processors behind an IOMMU need da == pa for the memory
> region(s) the buffers are allocated from.

I'm not sure to understand the da == pa requirement - can you expand more on
that?

> 
> Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> they are explicitly excluded.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index f1b362158a9c..1496659ddff9 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  	 * All non-remoteproc-specific virtio devices are assumed to be
>  	 * compliant with virtio specifications 1.x; there is no other method
>  	 * to transmit this capability from the remote processor to the host.
> +	 *
> +	 * Virtio devices that are specific for remoteproc usage take care on
> +	 * their own to allocate memory from the device's coherent pool; use
> +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
>  	 */
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features |= (1ULL << VIRTIO_F_VERSION_1);
> +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	return features;
>  }
> @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	features = vdev->features;
>  
>  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
>  
>  	if (WARN_ON((u32)vdev->features != features))
>  		return -EINVAL;
> 
> -- 
> 2.56.0
> 
