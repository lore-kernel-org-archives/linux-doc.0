Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483142FCC9
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710758; cv=none; b=TJ/hM9IxORMvxxIEygMsgbDMQi5m4y81BW8MiIZEbk73gft2HDqHYMdy9+FOi/pXgUAebfMpwIlOZ4uSF65FywNrIIQ6I5lbhpmIijFwhFBttk/GbAb4idvNI0Js37VdBzS4C+W0+IBwyVLnmQ0eXLgmrvBd84yPEmO940bUdzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710758; c=relaxed/simple;
	bh=kAhsFnpMMGSdnrXFMd+QnnJ8OmeMFzLuIG+aMiiQ0V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDHvrpse+2IZe9V9imc+/KW1J1XBlOhJ5UL4xW8RLNR4XbSof8Ydy/c2q0+sUbGMSjava4ElKgCaNigdMbao7hXynUMfhns0TIPQfTURbu+efzjObRJ8H3kr0o/128xgum+vG38821ocFHopfu3NL1t4NrWpvsi+gZX4aq5F25Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqNeW9sf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqNeW9sf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso6955776f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784710754; x=1785315554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wVkzG+wHl7b0hFwJEBuSwYI7fFrwiKABhZ91z4775sk=;
        b=fqNeW9sfa1toRnDMGjmVPGCP1baEA3JPIcfDTRDeeUNGO6hH1MoyRUgcJ3EanzPnmy
         WIbon2hzmVC0IcSDEZ3t+tHgWTfYtycfTGBQLg2ljzAzeKC2kaGwM/hSJ5trMUfC2jZn
         XW8iPr67bjh9dmgQ/qhBGzCx8xCwvfL9H80JaOQr2PJwxvmX+ZZymm7l8DB3mjf3nZ0+
         eohcgZcBtArLlpl97rdHUaAxVOqYuf4QYhQ6QQSWURs3J3R+4TS+ZO58Q92bZSjbbOM5
         9MwHwXrf/ihQ/uILZOBU8uKtLmNHU8BQczKRgabBhbUVitr+wjD5yZc6rGVBTB9J+5h0
         XLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710754; x=1785315554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVkzG+wHl7b0hFwJEBuSwYI7fFrwiKABhZ91z4775sk=;
        b=tYW5reGZGX2NSvz12cs3TQH7yGSzp1r+tn/jAILDN19XUgpG38C80XQnQyiJpk5gg7
         Imqfhmge6CcoGftSH2F9meSZarwFE6kd6zSkQyHKgJW25HA2PbG+O7s7qplCqR22iALk
         6Sv61/a4Xk6qTVUgIdKV7CDhz/8F3DWY6wzOj54SHkYCPrDSmBfBSxTkubr05UKg6CRA
         MyOcEjKVNUbx+c/fFFC6VKAK6XzM2RzuvrzZnla/Gzvv32QbAWBKE0KmP3bg0ickTjcN
         PITbX9UdiQhMs48SyF7HbDkrjMUnO3btNUn4OvYmJq4o9/7krZgf7KrKpIlQJC/Qe6Pe
         ezqw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm+dPy4+QrkSt+RQJ4iVwsu5qP8fBDb6z2nYO8nQwOBPF26FPye+v/bcexDmihpOSDGFsWRVm0R6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98SNRbCqfR98/6EnDLkIdB5sHtnHpPvGcRuIXvThFo9luYhv5
	3b8AthcNten3JUQs7HqAtXuoBSD7QEiMKUSgJmZN6E8OfMdWo1sf3nyZBNY1i22JqfA=
X-Gm-Gg: AR+sD13ozcJGxLes+nF0pcIzTnSXmINYZgvNNk6bu8ZhDINFRuDAVBlcuFaWC4pLNA/
	5PC5qcGM5odeBCvexo6942Ern1XvLyZxEgFjyUOyUiYGsYGepDzykVIezEGKo0caW/AbYzrhHwB
	esFPgfXJHF4Y2Ckbckp5JHx3kvqp7yuUZl2Qgkva/AdLPdAQQgjGQ+FfO0UUCxCiBDkC7m+mNVh
	RfTKD6cPGNhNlK5Sz0/RyXSdwcZulIB0O6W0cLdQvRjvUcv1A/37JgXDDQJJ+zyI6cN5/KL+dkG
	OEEInc9ub8yp54JBUIYjwA3FnyJHwZbH7hKI59iA4rxjZ2i6rSEioYQAGrcxNv7qIfFwufDtjOI
	w5AA/KezCFYyhiWkfH8PI77bjG1YXm/gbOjngz/q8zAr1YmZRapAsCcTRHrsjdw3P/5MpLJK3xn
	wJlYqDohrgcfys
X-Received: by 2002:a05:6000:310f:b0:47f:83f8:a956 with SMTP id ffacd0b85a97d-47f83f8ac9cmr3886714f8f.37.1784710754365;
        Wed, 22 Jul 2026 01:59:14 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7ae3:a857:e482:495])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm4587664f8f.10.2026.07.22.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:59:13 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:59:09 +0200
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
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amCGXUUd4VmuQRGD@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721134853.2B2401F000E9@smtp.kernel.org>

On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
> - [High] Channel state corruption when `bam_slave_config` fails validation.
> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
> - [Low] Unused assignment of `hdesc` in IRQ handler.
> --
> 
> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> dmaengine: qcom: bam_dma: add support for BAM locking
> 
> This commit adds support for BAM pipe locking by prepending and appending
> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
> channel. It uses a peripheral-local scratchpad address communicated via slave
> config for the dummy writes.
> 
> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > index f3e713a5259c2..411c60c4433e2 100644
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> [ ... ]
> > @@ -72,6 +76,11 @@ struct bam_async_desc {
> >  
> >  	struct bam_desc_hw *curr_desc;
> >  
> > +	/* BAM locking infrastructure */
> > +	bool is_lock_desc;
> > +	struct scatterlist lock_sg;
> > +	struct bam_cmd_element lock_ce;
> > +
> >  	/* list node for the desc in the bam_chan list of descriptors */
> >  	struct list_head desc_node;
> 
> [Severity: High]
> Does placing lock_ce immediately adjacent to desc_node risk a DMA API
> violation? lock_ce is mapped for DMA via dma_map_sg(), but desc_node is
> actively modified by the CPU via list_add_tail() during bam_start_dma()
> while the mapping is active. On non-coherent architectures, could this
> cause cacheline tearing or stale data writebacks if they share the same
> cacheline?
> 

I think this complaint was there in some revisions before. Could be
mostly a false positive given that the lock_ce is just DMA_MEM_TO_DEV
(i.e. read-only for the BAM)...

> [ ... ]
> > @@ -676,13 +691,26 @@ static void bam_free_chan(struct dma_chan *chan)
> >  static int bam_slave_config(struct dma_chan *chan,
> >  			    struct dma_slave_config *cfg)
> >  {
> > +	struct bam_config *peripheral_cfg = cfg->peripheral_config;
> >  	struct bam_chan *bchan = to_bam_chan(chan);
> > +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> >  
> >  	guard(spinlock_irqsave)(&bchan->vc.lock);
> >  
> >  	memcpy(&bchan->slave, cfg, sizeof(*cfg));
> >  	bchan->reconfigure = 1;
> >  
> 
> [Severity: High]
> Is it safe to overwrite bchan->slave and set bchan->reconfigure = 1 before
> validating the configuration direction below? If cfg->direction !=
> DMA_MEM_TO_DEV, this returns -EINVAL to the caller, but the channel
> retains the rejected parameters and will apply them on the next transfer
> because bchan->reconfigure remains set.
> 

Yeah, better to swap the order.

> > +	/*
> > +	 * This is required to setup the pipe locking and must be done even
> > +	 * before the first call to bam_start_dma().
> > +	 */
> > +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> > +		if (cfg->direction != DMA_MEM_TO_DEV)
> > +			return -EINVAL;
> > +
> > +		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
> > +	}
> 
> [Severity: High]
> If bam_slave_config() is called without peripheral_cfg, should
> bchan->lock_scratchpad_addr be reset to 0 to avoid leaking state from a
> prior configuration? If the previous lock_scratchpad_addr is retained,
> bam_start_dma() might erroneously inject dummy lock descriptors on new
> transfers.
> 

Probably unlikely to happen, but yeah.

I would also check if (cfg->peripheral_size == sizeof(peripheral_cfg)),
just to be safe.

> [ ... ]
> > @@ -919,13 +959,19 @@ static u32 process_channel_irqs(struct bam_device *bdev)
> >  			 * push back to front of desc_issued so that
> >  			 * it gets restarted by the work queue.
> >  			 */
> > +
> > +			list_del(&async_desc->desc_node);
> >  			if (!async_desc->num_desc) {
> > -				vchan_cookie_complete(&async_desc->vd);
> > +				hdesc = async_desc->desc;
> > +
> 
> [Severity: Low]
> Is the assignment to hdesc used anywhere? It appears to be assigned here but
> is never read.
> 

Yeah, I think I pointed this out before.

> [ ... ]
> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> >  
> >  	lockdep_assert_held(&bchan->vc.lock);
> >  
> > +	vd = vchan_next_desc(&bchan->vc);
> >  	if (!vd)
> >  		return;
> >  
> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
> >  		return;
> >  
> >  	while (vd && !IS_BUSY(bchan)) {
> > +		/*
> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> > +		 * already have bam_locked set and must not trigger a second pair.
> > +		 */
> > +		if (!bchan->bam_locked) {
> > +			ret = bam_setup_pipe_lock(bchan);
> > +			if (ret) {
> > +				dev_err_ratelimited(bdev->dev,
> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
> > +					ret);
> > +				queue_work(system_bh_highpri_wq, &bdev->work);
> > +				break;
> > +			}
> 
> [Severity: High]
> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
> starvation? Because system_bh_highpri_wq executes in softirq context,
> requeuing immediately without sleeping prevents the memory reclaim needed
> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
> 

It looks like my suggestion to queue_work() again in the error path of
bam_start_dma() wasn't great if we end up causing an infinite spin loop.
We do need to retry somehow or report an error though, I don't think
aborting and leaving the desccriptors completely unhandled is an option
either... :(

One option would be to try to avoid the allocation and write the lock
descriptors directly into the FIFO, but this will probably get really
messy as well, since you would need to carefully modify the FIFO
management in several functions ...

I don't have a good spontaenous idea how to solve this right now. :/

Thanks,
Stephan
