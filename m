Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325566;
	b=MOcvigBZ6rEd8BQMDcjpYkLZRoyKeFlHruzMnaV1Lel33vF0B057eruSFoF1Jf9ods7j
	 GAvqE7QXwDr+dvGSkkxFYzEUbko04no6szbKLe6AAm1SEVvmqJkbGFQtZnQc91uG6ZKyM
	 3ZdTZBfGj1vzcJZYJfYpxepnXxSEQZSaEFkV0Q4uoIn4blSoZVnZRPshIBaKF5tm8hZqI
	 bUb+d3yu5VKFNK3cnV7Ors9ahgS9sIgW6kUJNNOYoeaeLpo04ahck57+b7WQ3nTL0rHvD
	 lEybcOxNtSumMIcu8w8FH2k7jsP56iHT2A+34MuRIljtoZb0nDYxT+WIAMcXoZTkErQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
	b=vMBhyEeQybmq++vL8QCPyxoQIANRSBEfVWta+pPJHouHJWlyUsjShYD1BbBHjcvBFXuF
	 mWhL4sRsja6esJkJfg0VVEI1YzFKNbeKPl/4kVBJAoVaiIV5rfn/cDg9dBJTh6Ncw8pzf
	 1dIaming+0LfoZflxu4/907HsqkNjCOxAhlngDGh2eUg7DN0r1K8mmo0XRZBFiDuKUNv+
	 2goZUH4eriaV7cvxyivrx/B7jzm/KuOYmLJUznA2Pk9wb+Ip99z/Dekg8VrGoFM3VDAYb
	 b9FEwaSds6Zy8hVwLaT3EvuSew1ALY/kXYZYKhHBPVnMLuff0fOUaEEmstm50lA1bGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="TxW0Z/LW";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AB606AB75
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B17AB606AB75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TxW0Z/LW
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1013177a12.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 07:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794325565; x=1794930365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=TxW0Z/LWuMJ4ao/uG9mGPMndIv5WC3u70B6uIi8rUgqnmcROMdn9Sl0bVRAXmI59M4
         /AycfUqZ0pFWfuRkTZyWmAmLqaPNQXOX5W9WGgBiOlmkKsTPL6Sx1k0opbLsIDTni2XS
         CRCzdKwHbXTTEcJCNQ5liJoYpkajPt4r8MVPmNjLlZYQOPAEQggPHOCuZQDTNChULRor
         ahABAHl81KNf9V3L/ToxTodxcpB8GsRxYtHCwuYwsc7ex1IYkms0uwl7+Lwe9BoYdtc9
         NtM3Jj9BI3qZC1OcYx1l9fBWEsd7CSF0dm4d6iGz7gQehCPciPKJyH5cn18rcMALAOQT
         k2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325565; x=1794930365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6jvLVTJ6/L/P1TOo+cN1ccJTZcH95Jo/fx+GgYHa7w=;
        b=PlMZbhiDZ+lfvFfKSVlM/y1euofe2yChF+Qog2S1gYGf8lbhSHHAcrsE53shaBXDCW
         TZJpE0HgfNTMJkZhOO1ua23nVRvZPmxpg3CXg42ruRkvKA0WwKl7FXtgqXV3BGcU9MeT
         KdYkXC7jjTc1pp5r/PEKpHt7F+4NEMDqxHzHpSquiOM81++7LSkvQdT3QXSIuwN4B8AD
         yu6bxJQ9RfmJGWX2+zZwNWRsmWOkbAhMKYi6tTehzblOtl2ppxReoZusZPTYve3PTeOx
         WJyz2V1ZQwtloHrsPg3niGwCZROhfPXfcPIPXxNxgW8JOG2mM6Kp13xsda1/uMmR/quV
         hNmA==
X-Forwarded-Encrypted: i=1; AL+hErG8LU/B4dUQHHKpAU6TSVSWygB/h3VxA2dIfLjlt5KEnjEZ/Lr2VK01RdeK/Jqly7kFHwKunZuRBME=@vger.kernel.org
X-Gm-Message-State: APuU4Z+349Bzuu5QRvBZlclNSw1qwhVkSMTfRIf/yW97bMjXpqkRlD25
	FH3zjViOZREq5aXla162aEMaQl5t4UTv43np/k/u2Ke3jSpsrY+unc7JP3GXKJywMAQ=
X-Gm-Gg: AYBFou3VqxVLdzUxMibI4aLXBUGidOrmZN97b75Jgb0lB0jqryjaDtv9YvVLi6JEsfo
	uUoK1ITJMDU7iJraiVKz3SlJxMgOEnCDmzq2nIInLtZOAC9BEDceILJc4X1whln7pS/hbnc2upT
	y4Zv5LABRl4SF8JBdVHaSmqg4dk/JiwaMvi2BHxApyoEatgUYaLm7RD+YrQFxidzl4oKXqecei/
	hxy2zFnN6XhjQpwdiTZn81sYggcBQnVx+dzpKjh7E9Fc3WEMBYSEXTn54Jt2Ry+KSsAcdCQubhZ
	cWpQ+m3vsMj4yhhJyrdMJHvtMRPOAZpyiQT9DiaSpI248L8w6CUzFqJvkXUhf5nHrzXmz09Uc3C
	KGcvybcXd3ZeWE2fxIqjxJ0G2vdWd1lv+vPYrPl5cJRPZ4JGUdD5x2w3NkyXkJWRiM7EB7x5xj0
	A6gOkwUxO/VesXzTMPB1BcPEW2AfX41rMOt8DcDQOJs0T9sOJrOv68Xpbjf1OjE+GIozeCbLlD0
	5L/giVhlRRHhKqOpX9Zvy6hrknjjv1b+8x8UMcAO63ygygFRJPJl8RpYupikP1iB1i4QdgUwPHO
	SC0JeCz3iGDjOu8xXh5EQ50KUfpOOYa4tUPxyapdbo5ZkFQxxbaj5Q==
X-Received: by 2002:a17:90b:57cf:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b166ce8e72mr3333472a91.51.1794325564896;
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a917:5683:7f92:9eda])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db2fcfesm325724a91.4.2026.11.10.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:46:04 -0800 (PST)
Date: Tue, 10 Nov 2026 09:46:01 -0600
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
Subject: Re: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
Message-ID: <avM8OYHxB4nAKCnb@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>

Hi,

I started reviewing this set, making it to this patch.  I will continue tomorrow
but due to the KVM forum later this week, I may not finish before next week.
That said, I applied the first 2 patches so no need to include them in the next
revision.

Thanks,
Mathieu

On Mon, Nov 02, 2026 at 12:26:41AM +0100, Francesco Valla wrote:
> There is currently no way to report the VIRTIO_F_VERSION_1 using the
> resource table alone, as the per-vdev feature array is limited to 32
> bits.
> 
> Considering that the VIRTIO 1.0 specification is now ~10 years old,
> always report the VIRTIO_F_VERSION_1 feature for virtio devices that
> are not specific for remoteproc usage. These latter, which as of today
> are rpmsg and rproc-serial, are excluded to avoid impacting the existing
> usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
> communication (e.g., the configuration space is assumed to be
> little-endian rather than follow the device's endianness).
> 
> While at it, replace BUG_ON() with WARN_ON() and return an appropriate
> error in case of features that would overflow the 32 bits limit.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index c56d3330adfe..f1b362158a9c 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rsc_table.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -27,6 +28,11 @@
>  
>  #include "remoteproc_internal.h"
>  
> +static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rsc)
> +{
> +	return (rsc->id == VIRTIO_ID_RPMSG || rsc->id == VIRTIO_ID_RPROC_SERIAL);
> +}
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> @@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
>  static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features = (u64)rsc->dfeatures;
>  
> -	return rsc->dfeatures;
> +	/*
> +	 * All non-remoteproc-specific virtio devices are assumed to be
> +	 * compliant with virtio specifications 1.x; there is no other method
> +	 * to transmit this capability from the remote processor to the host.
> +	 */
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features |= (1ULL << VIRTIO_F_VERSION_1);
> +
> +	return features;
>  }
>  
>  static void rproc_transport_features(struct virtio_device *vdev)
> @@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_device *vdev)
>  static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  {
>  	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
> +	u64 features;
>  
>  	/* Give virtio_ring a chance to accept features */
>  	vring_transport_features(vdev);
> @@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	/* Give virtio_rproc a chance to accept features. */
>  	rproc_transport_features(vdev);
>  
> -	/* Make sure we don't have any features > 32 bits! */
> -	BUG_ON((u32)vdev->features != vdev->features);
> +	/* Make sure we don't have any features > 32 bits except the expected ones. */
> +	features = vdev->features;
> +
> +	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> +		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> +
> +	if (WARN_ON((u32)vdev->features != features))
> +		return -EINVAL;
>  
>  	/*
>  	 * Remember the finalized features of our vdev, and provide it
> 
> -- 
> 2.56.0
> 
