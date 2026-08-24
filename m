Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DCA46C4AC
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 16:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589155; cv=none; b=m728zYuoCCCrEDUuS6usXAADERNtwl0jHAdGV8UvX55huHRwaRpdEDyvncnknoyDw/FkErodxS42i93t+XiSiP3K3ikZLqvYWKrcHlOlEMaGYAJWNj6jb34ANoQdHuL367U2NUsghPQLl5hb6jv8dsg6ICU920qgBknMbv4+148=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589155; c=relaxed/simple;
	bh=7ythZQ3YvY7GBoX0Pj6V+z/0bxp4EG7mwm+w2adSPLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWVXK0S+vcS82uygzrTD7iTTLwZQ699EJjrnpmsv0kRPB8B6StQz8dJLGZ7dHc0jtYvUnQ/llu+d4n50BFpbdIcogEOk7PgB123MNuvCyAz8gW+Fm7lTSNhYoX9f35FzGF3QWNk/nGZqHxVi/x0KNvjyCA+8Ob5ZgzGpTLsFeo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GA2/jdyD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GA2/jdyD"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso1144455ad.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787589153; x=1788193953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=obEKnqCk5k+mpnKRq/ybUf1jSm4j71h3dTtcMTYrTDE=;
        b=GA2/jdyDCvwOGJT1fDZ6Bxq6nNt3ZSKLPxRqybJuIol+EMvQ/Ta0ypTqTEnPew4jr6
         MtrhD00pWof2TkAyDjKvEh+FwzBU43SgcNIUzy3/74XBhSk8DYQuMPBPsXvAqUalLqh5
         15iKub251sz8dlT/pV4AsQvWiIR4VMU/yp0Eq/PUqgqBbUhed0XguWZywrt4/oSfcDqW
         cJYqaQzhizqljcK2fIuHCAbzazm9Puo18ntIC0Md3gHHDXo4X023moghdLCK7CwPdnox
         EPbcov2pBPIwbmUI9cfhBj/I0aYEegDQNEGmcO9z61+wnCvpQCitp20+ZV72E8854kM1
         fGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589153; x=1788193953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=obEKnqCk5k+mpnKRq/ybUf1jSm4j71h3dTtcMTYrTDE=;
        b=ZtATDGi1rCleB6yuRfj+K6YwtxQV4U4wyFjflnQiVPRQwIPCGHVRhgvK4nqecS52TW
         ifOPdNP4WDOetsQ5a3GMMp0jUkE1F2/hyBUPzVl+jyToi/9S0xWvclqoainb1PN0QGlc
         z6095lamFs2WK7LeWZPZ9GPJDZUSY/K38UQOx5z5Ct9EdwwDEpcUgYz2dTF8mVxXl1uF
         fGhvMQ0C5obdzstKVZR2Fdu54pJURp6GgtJxFxKN3PJYa4evIdzVYhliNLNQMb+uTYIl
         giOmI+Q6QVwY4ajFd5Fd+qGDHWy1vd3mk+zlKlL1aWYYQDP+KrV/9H4APbHv4E83FkAT
         bPPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp77HmMEv+bha07sOXDefIqsGpFTj69TJgiKaI7NO1mxXXdy168a8ZPE/usxjh2QtCjAB9nWlTZv88=@vger.kernel.org
X-Gm-Message-State: AFuF++kNsTlwprP+txJSFNmCEnxQ99GnuGu4Rq8NPniA2OG8rG9A7S1B
	A4PScs42SWaAgjePiDCKozlJW9Bb3w5eIsV7ofX678DGCvfUJYlvOOYqYPh7pZkJMLs=
X-Gm-Gg: AR+sD114tNrsgSK95vWRaQcavt3hVplEyMdl0PfsItp3aLHMPM6QevlOGesbUbEHi6F
	GAPgTDeavOoBRdkT8yqUYnblJMhbp34NnMPhF+T+oUSwkHqr+CtbWqDdxPsu8SdeJc7vhXhZ2oH
	cOl/f8V10va3gDc8YtO4KOOhQYnvc6Tq310WSWSYzIeG6AngDIQavqR+B09ob5UUIveHHUAPX/2
	tkbQCAoNTVHonFEAcJcEGUFsSlP1DAKLY/yFgWopMGWVfa228bqd45DHey9KruUBHSQj8akjK5A
	OZpM1pjoC+mxy9HN/ebPXCcOipfVgKiunRdv5Ces08k5tZNc/njpgjEjre/EteduEHBM2Q6csBe
	ZceMag8aiMaVcTxfwN1NAun6dP3XRZW/Z08zk1UDCVyUTIQ9FZ5qezMCxGMQ/HGnZnxJILq6DGY
	jnj33E6gUmOEtn1M2DyxB/Uuy+WA9o/oSqVdeqNhYgbrb7gwIheTb/IFFylFeEeH5h
X-Received: by 2002:a17:902:f548:b0:2ce:b3cd:7539 with SMTP id d9443c01a7336-2d6dca35173mr4640435ad.6.1787589152623;
        Mon, 24 Aug 2026 09:32:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:82f2:24c5:571b:87b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676791d44sm20277145ad.24.2026.08.24.09.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:32:31 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:32:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <aoxyHVkMxR1BUwDD@p14s>
References: <20260814044238.518296-1-tanmay.shah@amd.com>
 <20260814044238.518296-4-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814044238.518296-4-tanmay.shah@amd.com>

On Thu, Aug 13, 2026 at 09:42:36PM -0700, Tanmay Shah wrote:
> 512 bytes isn't always suitable for all case, let firmware
> maker decide the best value from resource table.
> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.

s/enable/Enabled

> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> changes in v6:
>   - remove buffer alignment from config space
> 
> Changes in v5:
> 
>   - fix documentation about alignment of the buffer size
>   - change version field from u16 to u8
>   - remove buffer alignment check
>   - Separate buffer alignment vs MTU of a single buffer
>   - Use buffer alignment only to get next buffer address at alignment
>     boundary
> 
> Changes in v4:
> 
>   - Introduce new patch to modify rpmsg.rst documentation
>   - check version is always 1.
>   - check size field is same as size of struct virtio_rpmsg_config
>   - introduce alignment field
>   - check alignment field is power of 2
>   - check tx and rx buf size is aligned with alignment passed in the
>     structure
> 
> Changes in v3:
> 
>   - change version field from u16 to u8
>   - introduce size field in the rpmsg_virtio_config structure
>   - check version field is set to any non-zero value.
>   - check size field is not 0.
>   - Remove field for private config, as not needed for now.
>   - add documentation of rpmsg_virtio_config structure
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 90 +++++++++++++++++++++++-------
>  include/linux/rpmsg/virtio_rpmsg.h | 41 ++++++++++++++
>  2 files changed, 112 insertions(+), 19 deletions(-)
>  create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index c84b6cec9caf..4235e09dc3b7 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -20,6 +20,7 @@
>  #include <linux/rpmsg.h>
>  #include <linux/rpmsg/byteorder.h>
>  #include <linux/rpmsg/ns.h>
> +#include <linux/rpmsg/virtio_rpmsg.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/sched.h>
> @@ -39,7 +40,8 @@
>   * @tx_bufs:	kernel address of tx buffers
>   * @num_rx_buf: total number of rx buffers
>   * @num_tx_buf: total number of tx buffers
> - * @buf_size:   size of one rx or tx buffer
> + * @rx_buf_size: size of one rx buffer
> + * @tx_buf_size: size of one tx buffer
>   * @last_tx_buf: index of last tx buffer used
>   * @bufs_dma:	dma base addr of the buffers
>   * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
> @@ -59,7 +61,8 @@ struct virtproc_info {
>  	void *rx_bufs, *tx_bufs;
>  	unsigned int num_rx_buf;
>  	unsigned int num_tx_buf;
> -	unsigned int buf_size;
> +	unsigned int rx_buf_size;
> +	unsigned int tx_buf_size;
>  	int last_tx_buf;
>  	dma_addr_t bufs_dma;
>  	struct mutex tx_lock;
> @@ -68,9 +71,6 @@ struct virtproc_info {
>  	wait_queue_head_t sendq;
>  };
>  
> -/* The feature bitmap for virtio rpmsg */
> -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> -
>  /**
>   * struct rpmsg_hdr - common header for all rpmsg messages
>   * @src: source address
> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
>   * processor.
>   */
>  #define MAX_RPMSG_NUM_BUFS	(256)
> -#define MAX_RPMSG_BUF_SIZE	(512)
> +#define DEFAULT_RPMSG_BUF_SIZE	(512)
>  
>  /*
>   * Local addresses are dynamically allocated on-demand.
> @@ -443,7 +443,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>  
>  	/* either pick the next unused tx buffer */
>  	if (vrp->last_tx_buf < vrp->num_tx_buf)
> -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
> +		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>  	/* or recycle a used one */
>  	else
>  		ret = virtqueue_get_buf(vrp->svq, &len);
> @@ -513,7 +513,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  	 * messaging), or to improve the buffer allocator, to support
>  	 * variable-length buffer sizes.
>  	 */
> -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>  		dev_err(dev, "message is too big (%d)\n", len);
>  		return -EMSGSIZE;
>  	}
> @@ -646,7 +646,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>  	struct rpmsg_device *rpdev = ept->rpdev;
>  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>  
> -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>  }
>  
>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> @@ -672,7 +672,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	 * We currently use fixed-sized buffers, so trivially sanitize
>  	 * the reported payload length.
>  	 */
> -	if (len > vrp->buf_size ||
> +	if (len > vrp->rx_buf_size ||
>  	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
>  		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>  		return -EINVAL;
> @@ -705,7 +705,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>  
>  	/* publish the real size of the buffer */
> -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
> +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>  
>  	/* add the buffer back to the remote processor's virtqueue */
>  	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> @@ -823,6 +823,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	int err = 0, i;
>  	size_t total_buf_space;
>  	bool notify;
> +	u8 version;
> +	u16 size;
>  
>  	vrp = kzalloc_obj(*vrp);
>  	if (!vrp)
> @@ -854,9 +856,59 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	else
>  		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>  
> -	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> +	/*
> +	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
> +	 * size from virtio device config space from the resource table.
> +	 * If the feature is not supported, then assign default buf size.
> +	 */
> +	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     version, &version);
> +
> +		/* for now we support only v1 */
> +		if (version != RPMSG_VDEV_CONFIG_V1) {
> +			dev_err(&vdev->dev,
> +				"unsupported vdev config version %u\n", version);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/* size of the config space must match */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     size, &size);
> +		if (size != sizeof(struct virtio_rpmsg_config)) {
> +			dev_err(&vdev->dev, "invalid size of vdev config %u\n",
> +				size);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/* note: tx and rx are defined from remote view */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     txbuf_size, &vrp->rx_buf_size);
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     rxbuf_size, &vrp->tx_buf_size);
> +
> +		/* The buffers must hold at least the rpmsg header */
> +		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> +			dev_err(&vdev->dev,
> +				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
> +				vrp->rx_buf_size, vrp->tx_buf_size);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		dev_dbg(&vdev->dev,
> +			"vdev config: ver=%u, rx sz = 0x%x, tx sz = 0x%x\n",
> +			version, vrp->rx_buf_size, vrp->tx_buf_size);
> +	} else {
> +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +	}
>  
> -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
> +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> +			  (vrp->num_tx_buf * vrp->tx_buf_size);
>  
>  	/* allocate coherent memory for the buffers */
>  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> @@ -873,15 +925,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  	/* first part of the buffers is dedicated for RX */
>  	vrp->rx_bufs = bufs_va;
>  
> -	/* and second part is dedicated for TX */
> -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>  
>  	/* set up the receive buffers */
>  	for (i = 0; i < vrp->num_rx_buf; i++) {
>  		struct scatterlist sg;
> -		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> +		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>  
> -		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> +		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>  
>  		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>  					  GFP_KERNEL);
> @@ -964,8 +1015,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>  static void rpmsg_remove(struct virtio_device *vdev)
>  {
>  	struct virtproc_info *vrp = vdev->priv;
> -	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> -	size_t total_buf_space = num_bufs * vrp->buf_size;
> +	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> +				 (vrp->num_tx_buf * vrp->tx_buf_size);
>  	int ret;
>  
>  	virtio_reset_device(vdev);
> @@ -991,6 +1042,7 @@ static struct virtio_device_id id_table[] = {
>  
>  static unsigned int features[] = {
>  	VIRTIO_RPMSG_F_NS,
> +	VIRTIO_RPMSG_F_BUFSZ,
>  };
>  
>  static struct virtio_driver virtio_ipc_driver = {
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> new file mode 100644
> index 000000000000..e28144253a12
> --- /dev/null
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Pinecone Inc. 2019
> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> + * Copyright (C) Advanced Micro Devices, Inc. 2026
> + */
> +
> +#ifndef _LINUX_VIRTIO_RPMSG_H
> +#define _LINUX_VIRTIO_RPMSG_H
> +
> +#include <linux/types.h>
> +#include <linux/virtio_types.h>
> +
> +/* The feature bitmap for virtio rpmsg */
> +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> +#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
> +
> +/* Version of struct virtio_rpmsg_config understood by this driver */
> +#define RPMSG_VDEV_CONFIG_V1	1
> +
> +/**
> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> + *
> + * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> + * @size:	size of this structure in bytes.
> + * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
> + * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
> + *
> + * This is the configuration structure shared by the device and the driver,
> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
> + * the structure is naturally 32-bit aligned.
> + */
> +struct virtio_rpmsg_config {
> +	u8 version;
> +	__virtio16 size;
> +	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> +	__virtio32 txbuf_size;
> +	__virtio32 rxbuf_size;
> +} __packed;
> +
> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> -- 
> 2.43.0
> 
