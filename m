Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936688;
	b=TQFL1TuqR6LWHk/2dcX984aD1HPqMIiZFm7TqCB/Pxx/yI//btxHBF5bFhNJwoarPkMS
	 36H2o9SriZ0mDvnsV/ejYoYet9Fq4grpXk4bposP8jebHQp+svfMhSbqnAjBRTVW03DlZ
	 bhS7IF3Q7RUby4mzBa5jHkgZmcCJYHsryuW8JtaScFxYf703QCbVqfOLEUqeWmGrmiJHy
	 eNSuV+3/0yeMnhbVUN/WKlydR+ytx9OYQ3cW04YDWfvbg6hUUgCNjOWoj80D8YpxXnoyZ
	 fk8BBl02XKFylYkJ/rHSZMqWbqnlmYqZXRZoFLF5zGNS6JD+fpvdOOgMsjYshzWoNag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
	b=1lW8VR1C3+jKcCgNLABexXkZAOnPoYymdCM8Dp3JRFzEaDBHwmBpDyEmY//EWaW1Cpl2
	 Wb79e6u4U+4gSlRaHBINaL1MjbaFrdpmVBCizPmZqiX39Z7VzfKF8wDauX9knCVZivnyx
	 Qw5nOCH3169IKeHDfwlG7AALIZ46sb2fBtotG1KfIKaHuh6IFaDucvxhSU8tUSYHECPtN
	 C2fPcg5+v0f4pvrAltGZ4wSY6yn/WTCJLslcq9B9cAZHOm15Fdfegk8maie0IZKwsa4cq
	 +SvB9s9jrMWRdXM04qGkVgzWQ6dUK0lFh5Xx3eq8v2MDAMIHG/WYCHo6lQ6U3NAt6og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e5Zp8ZAy;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A03606A331
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 17:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A03606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e5Zp8ZAy
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cddc597d062so69928a12.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794936687; x=1795541487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
        b=e5Zp8ZAytFfxgwA1egXYSHtX5reKgsfJ9Yi8rapzShoui1aILV3DByS1TjDMzLv4QD
         lT7xAdJd6OhO49AB3wpGJtkRzAPmLynrM3S4a8HP4r9BLCLH57FaKmub6533kkM2+vmC
         pip7BlKK6g+frBZnTZqQQa+C+9epFUILmgZNm/jyrumxPDWTO/qYUOa/u/AJX3haQPA9
         paLLOHVRuff7J5v5d34M8QcyelhR9WuHvUr4blvROXbt1pavYmgWo9VVxHVJ5qJGpDiC
         7I7qMLYH0yPJtZD80GBIJ18hbthI/+QCFL7Lf9cJWiVFnhWPUCb7Udaan5GrzXrInloi
         Y24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936687; x=1795541487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cYrB3RoftR9+ZJufZSneOA3rg0mkVzJBEfjOWndr34=;
        b=zoND6hhQouMiuXz+/gdGYYHARLgb7zNuRLqmFP/A4b/z4AydVafdiFeFBQ4fkPT4as
         Sgppty35uykXi6A/ZrYFAA8X4bj360ICUYWFRwtDjJ9ZAzZ8K3sittrVPWJjEJ1a0OkS
         3XkgciFAl/dooIKFqYF9py3yTdwZljtLxNS5rJ7UT/2SoBaKkSjgfjdvBrTVsqgXeXI7
         eipufwTyxBy09ieFUqdRvJVN/BdlL5El6XaHRUQuG36uunoPGtLo7H1SYmuWj9zmRe4k
         xLDo5W3w7kKD1WI+9mZLIBQSkVxlEMCl9hYJTQVouZYGqbtwNnKAGJuSgbQ7G0/WhvWT
         b3iw==
X-Forwarded-Encrypted: i=1; AL+hErFLSYXxsUppBFdfZkp3bOBmoRH97IaQjvJP2zUVw79cnTRKdoDSGbkm2USakOKwGXrrx4k2doeICks=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MXBNgOs+0AAiIKlL5D0/PVcxRxGdItfRB9UMD6lAGvKOcCXrj
	KrWIKk9z/IDgnAvENi0TG8RBVsIWLeGbZyVcSXpPDFPrcXbmPzDcWXhepWj0VaUUEQU=
X-Gm-Gg: AZFdTZf17jGGA1bgj/fXO7HIB39W+4FLzsRzdHwWO4f5t/nY4LqnumFlcquziGsDj39
	JVnO2Wye6H2PYM5J0ehJv34ONPwEO0iN+9Qxb0j/1YLMxbejd/Fnj1pc32tN4vIJk4t3NJJ0DM7
	yTDQ8nEkkY9UfVyxs9i7GfiJ55Hbd8Vq3Yb141ZkVY2oQJACFRgrJNcQ5CtbCfuc+a8ansG2TCd
	mJ7D7vzKcVPvxfdd1H40qAPOWUbfupGKG/9dnxzl+9MvT95wPcA97vSSbkRhGzhb7tL0j4+lzSk
	Yq1pIzPAg+YuE8eu7XHWHDUEN+yqnXfrEYCFByZxngNXJX5THQmZQU3kaCTcr276dqN/12ftlAh
	8MPTCnW0V7vHaYxinCpUS38yXxu9JmKzMn1ROeHtOFU6SobvA4/rCjyfs/IUFlWfY5Dvcrwy+LG
	Tmn5xyZcapVTn5rieFdKGFPv/M17ePUxWqyvN+t4uth+cW0nCyNq8v6/XTTW0/2gRKYt6f3b4GZ
	lqloD0EYfH28658d7d9KbfJmW/Kgll2oD5p2xogLp2wlj9opJGXzoroszs8gWzxcom68WGJpLzH
	UnZeJQvKVq33QuKuu8neOk+fe0XsDx/Wu3Z1alhTlA2QgI8jwlQEeA==
X-Received: by 2002:a17:90b:3892:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b3d07becb8mr123850a91.29.1794936686801;
        Tue, 17 Nov 2026 09:31:26 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:61f7:13ac:b599:b52c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abeaf532sm4936578a91.14.2026.11.17.09.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:26 -0800 (PST)
Date: Tue, 17 Nov 2026 11:31:23 -0600
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
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
Message-ID: <avyPa5rSx9rhf9yO@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:45AM +0100, Francesco Valla wrote:
> Expand the section on virtio support over remoteproc with details on
> memory allocation setup and constraints.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  Documentation/staging/remoteproc.rst | 99 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index c117b060e76c..4b42ed582fb4 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -354,7 +354,104 @@ it supports. A firmware may support any number of virtio devices, and
>  of any type (a single remote processor can also easily support several
>  rpmsg virtio devices this way, if desired).
>  
> +Memory carveouts
> +----------------
> +
> +For a virtio device at position ``X`` among the RSC_VDEV resources declared by
> +the resource table, the remoteproc framework will search for memory carveouts
> +for:
> +
> +* all the vrings the specific virtio device requires (as ``vdevXvringY``);
> +* the memory area to allocate communication buffers from (as ``vdevXbuffer``).
> +
> +The carveouts can be provided by the remote processor itself as RSC_CARVEOUT
> +resources inside the resource table and/or supplied by the remoteproc driver
> +and will be indexed by their name.

The remoteproce driver doesn't supply carvouts, it gets them from the device
tree.

> +If a carveout with the same name is provided through both means, the one
> +supplied by the remote processor should be marked as dynamically allocable,
> +i.e., with the device address set to ``FW_RSC_ADDR_ANY`` (-1).
> +

Right, as per my comment in the previous patch, carveouts at the virtio level
should be distinct from those declared at the remote processor level.  Hopefully
this will keep the remoteproc core simple and make it easy to differentiate
between code paths that handle legacy and authentic rproc-virtio devices.

> +If a ``vdevXvringY`` carveout is not provided, the remoteproc framework will
> +try to allocate it using dma_alloc_coherent(), which will resort to allocate it
> +either from the first ``restricted-dma-pool`` region associated to the virtio
> +device's parent (i.e., the remote processor device), if present, or the global
> +DMA pool.
> +
> +.. WARNING::
> +
> +    This fallback mechanism can result in a vring being allocated using a
> +    ``vdevXbuffer`` area meant for another vdev, so a particular care shall be
> +    adopted when defining the carveouts. In particular, ``restricted-dma-pool``
> +    memory regions should be specified inside the virtio device's devicetree
> +    nodes and not attached to the parent remote processor.
> +
> +If a ``vdevXbuffer`` carveout is not provided, the remoteproc framework will
> +use the memory region declared by the virtio device's own devicetree node (see
> +Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml), if any.
> +Otherwise, it will try to replace it with the first memory region (of any type)
> +associated to the virtio device's parent (i.e., the remote processor device);
> +if no such memory region is present, it will be replaced with the global DMA
> +pool.
> +
> +If both a ``vdevXbuffer`` carveout and a memory region inside the virtio
> +device's devicetree node are present, the carveout takes precedence and the
> +memory region is ignored.
> +
> +Declaring the memory region inside the virtio device's devicetree node is the
> +preferred method for ``restricted-dma-pool`` regions, since listing them among
> +the memory regions of the remote processor device would make the first of them
> +the (forced) bounce buffer for the remote processor device itself as well.
> +
> +Buffer allocation
> +-----------------
> +
> +There are different kinds of buffer allocation scenarios:
> +
> +* if the remote processor can access the whole DMA memory area of the host, no
> +  special arrangement needs to be performed, since either the drivers (in case
> +  of rpmsg and rproc-serial devices) or the DMA APIs (in case of any other
> +  virtio device type) will take care of any necessary translation;
> +* if the remote processor has limited access to the host memory space, for
> +  example because of a different addressing scheme or for memory isolation
> +  constraints, the memory reserved for buffer allocation shall be selected
> +  depending on the virtio device type:
> +
> +  - for rpmsg and rproc-serial devices, a simple contiguous memory region
> +    (e.g.: one declared in devicetree as ``shared-dma-pool``) is sufficient and
> +    should be preferred, since it allows zero-copy message transmission between
> +    the host and the remote processor;
> +  - for any other virtio device type, a swiotlb-enabled memory region (e.g.:
> +    one declared in devicetree as ``restricted-dma-pool``) is required, because
> +    such devices need bounce buffering to work correctly.
> +
> +For virtio devices other than rpmsg and rproc-serial, the remoteproc framework
> +offers the ``VIRTIO_F_ACCESS_PLATFORM`` feature, so the buffer addresses written
> +in the vring descriptors are the DMA addresses returned by the DMA APIs for the
> +virtio device. The virtio device inherits the DMA mask and the DMA range map
> +(i.e., the translation described by the ``dma-ranges`` devicetree property) of
> +the remote processor device, and is never attached to an IOMMU: these DMA
> +addresses are therefore host physical addresses, translated only through the
> +DMA range map. The remote processor must be able to access the buffers at
> +these addresses.
> +
> +.. WARNING::
> +
> +    For remote processors that access memory through an IOMMU managed by the
> +    remoteproc framework (i.e., with ``has_iommu`` set), the IOMMU domain only
> +    contains the mappings created for the RSC_CARVEOUT and RSC_DEVMEM entries
> +    of the resource table, at the device addresses they specify; no mapping is
> +    created for the buffers of the virtio devices. Such remote processors are
> +    supported only if all the memory that can hold virtio buffers (e.g., the
> +    ``restricted-dma-pool`` region associated to the virtio device) is mapped
> +    with its device address equal to its physical address, for example through
> +    an RSC_DEVMEM entry. The same constraint applies to any fixed address
> +    translation applied by the remote processor that is not described by the
> +    DMA range map of the remote processor device.
> +
> +Allocation of virtio devices
> +----------------------------
> +
>  Of course, RSC_VDEV resource entries are only good enough for static
>  allocation of virtio devices. Dynamic allocations will also be made possible
>  using the rpmsg bus (similar to how we already do dynamic allocations of
> -rpmsg channels; read more about it in rpmsg.txt).
> +rpmsg channels; read more about it in Documentation/staging/rpmsg.rst).
> 
> -- 
> 2.56.0
> 
