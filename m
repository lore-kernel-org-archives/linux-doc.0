Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192C43BDB5
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801053; cv=none; b=PcBaEIPD9dBD3H7M8HCOrl2cuByjSoRM3YbXJigOHg7V7TGo2hms2pYuvyQINsSP36qs2MXsvFQTA9okQ/+eZaSi14rc877DDedjNAMvlY8v/1P6aWNClepaM1C5gubCn1xedH+STmOEKZlUXuXx9BxNsv+yXjG7JiuO6tWMqHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801053; c=relaxed/simple;
	bh=2dhM80U1cYegL8kQzdGZRETcOdITYFIBHOvcR3V3XQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ni9Oiqam5UoKRNIxSPBY8CAhMWLvUWQEYnmJS5u0SxCNburrZ+KJPaoVY6ieIFfMeEWaf6fLGaTH//YRHqXZzCDhK9oNEbTE51kLm1HhNTp8PEmfnYPYJNRzlBvlXr3MLTy06PpKqx6T0JjgfxJX8xbqoJcTzclzVBvSTtF2OEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2EjgwQv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2EjgwQv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so3511335e9.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784801049; x=1785405849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X576UWvhah+076nL20oR1HfA0CMQ64GrY/hawzbdJ8w=;
        b=u2EjgwQvGHQIe7uPkfUq2N0xVNacC/i2ehUkLi9EgSESkKIdWQMmVfGq6PYBCxMoUy
         ENex1awyqHziiW30zZR2+KQkEJr6HZZbZmB+dAzy/p5QXpuvjMFdeMYkw6SIdCuE05WL
         SkOYn4FzHz7yo1jF0MA1Dli0jz1AVvu+FTiWQpbeJemSHlfQmleFBbBLWnt8w3YzHIBP
         SMevFRLP2Xno5Na0nhxialHyvm5SOXoEWm414kqz2UG3nBIMqCM1gFzBJ3UdTHcKnpg7
         /k10kAKSvih7B/d8a79qKuz9Ayuxx50D/7heXl5bMW2GsecrCQhbM/rhWed5Z/BA0RDf
         JOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801049; x=1785405849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X576UWvhah+076nL20oR1HfA0CMQ64GrY/hawzbdJ8w=;
        b=bAj7TGQ3FsB2J+nzvX6RgtpkMVL7qepIt3QvkkfqL03EVXBBYH13MYBLMSVDaxglbg
         zjt2VoVkb4lq8La/s9zs6anBEARfUO2pRchdLPAHZIkn7U8XWMuyGaiUiWlZc9Mj76hZ
         oW6xd/y6MOZsHKmql39wTIRNR24Lvf5ZCYU88Nnf9G0tOSG4tOYHGEjklvLphnE2+bP4
         m10BQAYmhq0SaMZJ9V8FvB9pmj6Vw7e1wahy67tSvmLdHIFvcgkJ1VHyPQQrseCKEB8O
         v3yKZ6N+k1tt3tTRNdlmG0cqGGf56jy+EKqoCOfbvQkYjgTup6pOxKPtWIb8lVWzw2Hb
         TrJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9x67PHAQ9UO6lLdSbs4Iz4trlE7bkSlScmosl2fb8DUzwUyTRcuHfLW+kv71PDVaNTNwbYowsfjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkyebN0yiXO3seOpbn9B1kXcaprveKt38Kq8HRRNlUKky0G/cs
	lUJaV+hHkHo+nLpSPfbhdOorxdzOUu3EY8p7rDTJbCxB6f3cIDy8QS56Yyx7EFoDLpE=
X-Gm-Gg: AR+sD134Rx9BCDHOfPERxxQ+NQhvI9a3Cb/HHsxGISuZMhuoy4n2FFB3NKky/9xT4Cg
	1nw72D0x69DhyUkkBM9kc5ms5jDZr6zL4sbmO5rZe7Tn6RmX5arB5TNsmTRORgA1mDLSGeWitEf
	kQ7q/okV2jwkWD4hn16dg8Ns6FAbJ9DGX6MXGfUjEYXcOkyka6h7KbZH2g/VxMvCN0cxG5jQ1bG
	PjCzbYkHX2r+bQAH62IQDiI9wWE9ufU4GTm/VX/l3GE1l0YFXKohU/ybjGnK4zxaGdoOArPDhcI
	1reQbjV03PEWdhAWeBkCjeLWwFWl8jE9eP/yfSiAaq+wRQj1J3THJOWnZ8m0ZmYh3dFpcbbXDX1
	iQYvpFYFdaZufLa2u+8eQrZSjft9TsffhOsrQ+nBfR8wh2+58Ql8Atz0YNOiwf1ObNbO8no2Mp2
	dxptH5AqiJdM4GgBl5cfQkDO22
X-Received: by 2002:a05:600c:46ca:b0:493:e97c:216e with SMTP id 5b1f17b1804b1-49573d26d00mr23083765e9.39.1784801049098;
        Thu, 23 Jul 2026 03:04:09 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d666:8fbf:10dc:76d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm212564285e9.12.2026.07.23.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:04:08 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:04:04 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
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
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amHnFL7IC80Id2V7@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org>
 <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
 <amC7_M-HjVZ3sQuT@linaro.org>
 <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
 <amDRxPkdvbA-iVer@linaro.org>
 <CAMRc=Me523xQbfJvML9taJ-fR128SJurJS4eX9N9E9WtHF5W5Q@mail.gmail.com>
 <amDuqoRBg5qGafi2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amDuqoRBg5qGafi2@linaro.org>

On Wed, Jul 22, 2026 at 06:24:10PM +0200, Stephan Gerhold wrote:
> On Wed, Jul 22, 2026 at 08:37:19AM -0700, Bartosz Golaszewski wrote:
> > On Wed, 22 Jul 2026 16:20:52 +0200, Stephan Gerhold
> > <stephan.gerhold@linaro.org> said:
> > > On Wed, Jul 22, 2026 at 07:11:10AM -0700, Bartosz Golaszewski wrote:
> > >> On Wed, 22 Jul 2026 14:47:56 +0200, Stephan Gerhold
> > >> <stephan.gerhold@linaro.org> said:
> > >> > On Wed, Jul 22, 2026 at 02:34:52AM -0700, Bartosz Golaszewski wrote:
> > >> >> On Wed, 22 Jul 2026 10:59:09 +0200, Stephan Gerhold
> > >> >> <stephan.gerhold@linaro.org> said:
> > >> >> > On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
> > >> >> >> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> > >> >> >> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
> > >> >> >> - [High] Channel state corruption when `bam_slave_config` fails validation.
> > >> >> >> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
> > >> >> >> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
> > >> >> >> - [Low] Unused assignment of `hdesc` in IRQ handler.
> > >> >> >> --
> > >> >> >>
> > >> >> >> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> > >> >> >> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
> > >> >> >> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > >> >> >>
> > >> >> >> dmaengine: qcom: bam_dma: add support for BAM locking
> > >> >> >>
> > >> >> >> This commit adds support for BAM pipe locking by prepending and appending
> > >> >> >> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
> > >> >> >> channel. It uses a peripheral-local scratchpad address communicated via slave
> > >> >> >> config for the dummy writes.
> > >> >> >>
> > >> >> >> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > >> >> >> > index f3e713a5259c2..411c60c4433e2 100644
> > >> >> >> > --- a/drivers/dma/qcom/bam_dma.c
> > >> >> >> > +++ b/drivers/dma/qcom/bam_dma.c
> > >> >> [...]
> > >> >> >> [ ... ]
> > >> >> >> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> > >> >> >> >
> > >> >> >> >  	lockdep_assert_held(&bchan->vc.lock);
> > >> >> >> >
> > >> >> >> > +	vd = vchan_next_desc(&bchan->vc);
> > >> >> >> >  	if (!vd)
> > >> >> >> >  		return;
> > >> >> >> >
> > >> >> >> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
> > >> >> >> >  		return;
> > >> >> >> >
> > >> >> >> >  	while (vd && !IS_BUSY(bchan)) {
> > >> >> >> > +		/*
> > >> >> >> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> > >> >> >> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> > >> >> >> > +		 * already have bam_locked set and must not trigger a second pair.
> > >> >> >> > +		 */
> > >> >> >> > +		if (!bchan->bam_locked) {
> > >> >> >> > +			ret = bam_setup_pipe_lock(bchan);
> > >> >> >> > +			if (ret) {
> > >> >> >> > +				dev_err_ratelimited(bdev->dev,
> > >> >> >> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
> > >> >> >> > +					ret);
> > >> >> >> > +				queue_work(system_bh_highpri_wq, &bdev->work);
> > >> >> >> > +				break;
> > >> >> >> > +			}
> > >> >> >>
> > >> >> >> [Severity: High]
> > >> >> >> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
> > >> >> >> starvation? Because system_bh_highpri_wq executes in softirq context,
> > >> >> >> requeuing immediately without sleeping prevents the memory reclaim needed
> > >> >> >> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
> > >> >> >>
> > >> >> >
> > >> >> > It looks like my suggestion to queue_work() again in the error path of
> > >> >> > bam_start_dma() wasn't great if we end up causing an infinite spin loop.
> > >> >> > We do need to retry somehow or report an error though, I don't think
> > >> >> > aborting and leaving the desccriptors completely unhandled is an option
> > >> >> > either... :(
> > >> >> >
> > >> >> > One option would be to try to avoid the allocation and write the lock
> > >> >> > descriptors directly into the FIFO, but this will probably get really
> > >> >> > messy as well, since you would need to carefully modify the FIFO
> > >> >> > management in several functions ...
> > >> >> >
> [...]
> 
> FWIW, I couldn't stop myself trying to finish my "write lock descriptors
> directly into FIFO" idea, once I started I was curious how it would turn
> out. I think it's actually quite elegant, the loop in bam_start_dma() is
> wrapped with LOCK and UNLOCK, later process_channel_irqs() looks at the
> FIFO again and just skips over these descriptors. lock_ce is allocated
> once at channel creation time, no other allocations are needed. (Could
> probably move lock_ce allocation to slave_config() so it's allocated
> only when locking is configured for a channel).
> 
> See diff below. It doesn't crash badly in a quick test, but didn't check
> in detail if the locking is actually working correctly. :')
> 
> I'm okay with whatever is "free of known races" and works with the use
> cases we have, so use/adapt whatever you like best.
> 
> If you want to use this, feel free to add
> Co-developed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> Good luck! :D
> 
> Thanks,
> Stephan
> 
> ---
>  drivers/dma/qcom/bam_dma.c       | 94 ++++++++++++++++++++++++++++++--
>  include/linux/dma/qcom_bam_dma.h | 15 +++++
>  2 files changed, 104 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f3e713a5259c..864531dca2a6 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> @@ -607,6 +620,17 @@ static int bam_alloc_chan(struct dma_chan *chan)
>  		return -ENOMEM;
>  	}
>  
> +	if (bdev->dev_data->pipe_lock_supported) {
> +		bchan->lock_ce = dma_alloc_wc(bdev->dev, sizeof(*bchan->lock_ce),
> +					      &bchan->lock_ce_phys, GFP_KERNEL);
> +		if (!bchan->lock_ce) {
> +			dev_err(bdev->dev, "Failed to allocate lock CE\n");
> +			dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt, bchan->fifo_phys);
> +			bchan->fifo_virt = NULL;
> +			return -ENOMEM;
> +		}
> +	}

Nitpicking on my own diff: This is kind of meh, since this will
typically allocate a full page just for the 16 bytes lock command
element for all channels on BAMs that support locking (which is most BAM
instances nowadays). Barely anything will use locking though (likely
just QCE and NAND, if available). With 32+ channels in the BAM on some
SoCs with 16K page size or more that's a lot of wasted space.

Probably best to go back to what you had in your patch and use
dma_map_single() / dma_sync_single_for_device(), see below (on top of
what I sent already).

Thanks,
Stephan

---
 drivers/dma/qcom/bam_dma.c | 53 +++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 864531dca2a6..93ce99125879 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -433,7 +433,7 @@ struct bam_chan {
 	struct list_head node;
 
 	/* BAM locking infrastructure */
-	struct bam_cmd_element *lock_ce;
+	struct bam_cmd_element lock_ce;
 	dma_addr_t lock_ce_phys;
 	bool locking_enabled;
 	bool bam_locked;
@@ -620,17 +620,6 @@ static int bam_alloc_chan(struct dma_chan *chan)
 		return -ENOMEM;
 	}
 
-	if (bdev->dev_data->pipe_lock_supported) {
-		bchan->lock_ce = dma_alloc_wc(bdev->dev, sizeof(*bchan->lock_ce),
-					      &bchan->lock_ce_phys, GFP_KERNEL);
-		if (!bchan->lock_ce) {
-			dev_err(bdev->dev, "Failed to allocate lock CE\n");
-			dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt, bchan->fifo_phys);
-			bchan->fifo_virt = NULL;
-			return -ENOMEM;
-		}
-	}
-
 	if (bdev->active_channels++ == 0 && bdev->powered_remotely)
 		bam_reset(bdev);
 
@@ -665,13 +654,15 @@ static void bam_free_chan(struct dma_chan *chan)
 	scoped_guard(spinlock_irqsave, &bchan->vc.lock)
 		bam_reset_channel(bchan);
 
+	if (bchan->lock_ce_phys) {
+		dma_unmap_single(bdev->dev, bchan->lock_ce_phys,
+				 sizeof(bchan->lock_ce), DMA_TO_DEVICE);
+		bchan->lock_ce_phys = 0;
+	}
+
 	dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt,
 		    bchan->fifo_phys);
 	bchan->fifo_virt = NULL;
-	if (bchan->lock_ce) {
-		dma_free_wc(bdev->dev, sizeof(*bchan->lock_ce), bchan->lock_ce, bchan->lock_ce_phys);
-		bchan->lock_ce = NULL;
-	}
 
 	/* mask irq for pipe/channel */
 	val = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_MSK_EE));
@@ -693,6 +684,24 @@ static void bam_free_chan(struct dma_chan *chan)
 	pm_runtime_put_autosuspend(bdev->dev);
 }
 
+static bool bam_map_lock_ce(struct bam_chan *bchan)
+{
+	if (bchan->lock_ce_phys) {
+		dma_sync_single_for_device(bchan->bdev->dev, bchan->lock_ce_phys,
+					   sizeof(bchan->lock_ce), DMA_TO_DEVICE);
+		return true;
+	}
+
+	bchan->lock_ce_phys = dma_map_single(bchan->bdev->dev, &bchan->lock_ce,
+					     sizeof(bchan->lock_ce), DMA_TO_DEVICE);
+	if (dma_mapping_error(bchan->bdev->dev, bchan->lock_ce_phys)) {
+		bchan->lock_ce_phys = 0;
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * bam_slave_config - set slave configuration for channel
  * @chan: dma channel
@@ -717,11 +726,13 @@ static int bam_slave_config(struct dma_chan *chan,
 		if (cfg->direction != DMA_MEM_TO_DEV)
 			return -EINVAL;
 
-		if (bchan->lock_ce) {
-			bam_prep_ce_le32(bchan->lock_ce, peripheral_cfg->lock_scratchpad_addr,
-					 BAM_WRITE_COMMAND, 0);
-			bchan->locking_enabled = true;
-		}
+		bam_prep_ce_le32(&bchan->lock_ce, peripheral_cfg->lock_scratchpad_addr,
+				 BAM_WRITE_COMMAND, 0);
+
+		if (!bam_map_lock_ce(bchan))
+			return -ENOMEM;
+
+		bchan->locking_enabled = true;
 	} else {
 		/* Don't touch lock_ce here, it might still be used by issued descriptors */
 		bchan->locking_enabled = false;
-- 
2.54.0


