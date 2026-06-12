Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0568A35DA4C
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282656; cv=none; b=QI8rVRHeTp5UO2+95p0ZRPx4xFtUJS/yKIrKPVKk7ORM1xUTzacnGt5522CeyRkmXseLhUE80cYrnNRShESdiIoyJGjNfP21/cD8MQF+O+L/rX8bGFM+d9dbGTvd7f+Kd/s3x3tKVYwZi9p0QkmNSiIkai19GcN5zcs24tGu0nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282656; c=relaxed/simple;
	bh=ZJHMLe4ngJzg2PRK1QqIRr8+43r78NJCf1N8Kj34+A4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=St4FI8GrWffj4aGL/XKKvNY2V7L3YIhqrofxTzqZUE0+av/PO1fZaz6Cs6R+xoN9izMc9RxVGpAO2cef5zkuL5jgCMvVNGOncJUgJOyGC5fJuqBCUpedIEu87STGxR8W9KcudXBTc3cmIdrnJiLbn5VSTXOgc2Pr27t+FEQ9x94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=RASmTaLU; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="RASmTaLU"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69e489edbf8so808859eaf.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781282654; x=1781887454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARs7fVy0Lz4B2rFphXAnXjYPYcr1SgRO7NwP4+aeYig=;
        b=RASmTaLUMGTt6uSQJNGP+ffxRcXSH0fKge4cO2R2CJXSG6ZLNHE32ywNIydLPr+zsr
         0nJpPtfvd/L0c1bImgMOZhe9gATFUR6iIRtSbbutMGPXuG65aYWxru5dbs6l9jBlHf/C
         fV7FqyVF8WEudq6p5P0CM0ZQIIYg+V0l48thdm3EjJgZZ73WgRhoo3NMAHaFeg4hMw4j
         1+DJRQpUPqsjDxCPx2a0v3Zb2SM4xg55voVTtPLrY0O/KOTBNRNPl3GcSEMsg7nZEFdr
         tzwbuiu9Tkg9CoYycpIHCj8BA7Tq22bgLoQ+ipWpdSJ06rlEjYrI/hrbu7kXZhC/kMja
         tAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781282654; x=1781887454;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ARs7fVy0Lz4B2rFphXAnXjYPYcr1SgRO7NwP4+aeYig=;
        b=s9RQxdU0GbEXK8rcAjB/TiTxM7SYTXMFI5RZ0bTRzZlmY63jlltJZd3vlVHluHPDLq
         Kb7Qhr2uCYcSqqhurdikV1WNTMHg3Aedga8wsLYilny8zW1TWJpIrBa4hMntMAp0Y3os
         +gftRRJuaybGLy1SYJX0ZysbZRdBfkTLDqtytyaK0eCwCl3nOFnbbiFbZN+JEhgrUai/
         BwAew4xjBTYuP7y0oaQnr1toeah/fhLvt2pVyIgX93RjPvn8zhBx1wGy3LEqMsZWVvLq
         ZQ0WDpD6ssUC3dfPygJULyCkL+Z2MzflHVqWXZT/Z70NtiCARmR6D9QgmHHJUCm+hDUd
         eKwg==
X-Forwarded-Encrypted: i=1; AFNElJ9IMu9boGxlpf24mV1MPFllkmOZkXkcv2eCzC/GuGbickUA1iiOZ7P7BX4sAl+jSWBzYNMTczqrOio=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQ2A8wWieWttuzChyf+qEBffvR47QlochQm9YEcdim1zCLI1L
	ICmRAxqx6I4rfuEgoLxIaNY/CbGhwzgTb3STn50My63AGG0Q4VZODL8vpMtRFutDLZI=
X-Gm-Gg: Acq92OH9Ly2dNogcnBu40XeodQVsIba5JpTEJYiaiSph5DF9CffhIodxQ/HrJjFhlF/
	SH3VT7JXxLpU+6ogv+izHrawX4P6kHDYmA1Zvz8HfC+3coz5R6ZC5ECpeT9cqQUlfQyna9VryaU
	epjXxWMJwNTksa5LNh+mtJo76CQ3aHk55/ie3K/6kHrJ1yQHYotprv/p8Djb9QwI2tPM0vMJTUa
	eXLyJ/PuW+lQ9oluT4Qx7q1osp3/aUxrF0j4rqdZGZIn5Q4KSMMOmh2LRCZrOGIvwXorQNH5JaT
	7O82wgFrxP3VfAzsbvKqkII/dW3Njbr/DJd9BoLD7WNTK9fnP+Kp3/EDQBNHhRtpl05f0jmm/Da
	MptQaKgGvWWMRdnjxE//NbdWuqR2rNB8aSX52EdzISk3J/i2zSwXqh0DDvk4ZxlbIzTCPOmzhS2
	K8pHiIejC7utwDqHPfXAQ1pduWwoPmn13tnGdYmuEeJBxUUeHn5WLxBQ9x7tlrRErnjKnDmbzv1
	8pF
X-Received: by 2002:a05:6820:806:b0:69e:3327:1d52 with SMTP id 006d021491bc7-69edc5e7d6cmr2256639eaf.5.1781282654069;
        Fri, 12 Jun 2026 09:44:14 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4426b30ee99sm2128348fac.15.2026.06.12.09.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 09:44:13 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <dlemoal@kernel.org>, 
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260611140703.2401204-1-hch@lst.de>
References: <20260611140703.2401204-1-hch@lst.de>
Subject: Re: configurable block error injection v5
Message-Id: <178128265322.1800972.11563818485648340074.b4-ty@b4>
Date: Fri, 12 Jun 2026 10:44:13 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 11 Jun 2026 16:06:43 +0200, Christoph Hellwig wrote:
> this series adds a new configurable block error injection facility.
> We already have a few to inject block errors, but unfortunately most
> of them are either not very useful or hard to use, or both:
> 
>  - The fail_make_request failure injection point can't distinguish
>    different commands, different ranges in the file and can only injection
>    plain I/O errors.
>  - the should_fail_bio 'dynamic' failure injection has all the same issues
>    as fail_make_request
>  - dm-error can only fail all command in the table using BLK_STS_IOERR
>    and requires setting up a new block device
>  - dm-flakey and dm-dust allow all kinds of configurability, but still
>    don't have good error selection, no good support for non-read/write
>    commands and are limited to the dm table alignment requirements,
>    which for zoned devices enforces setting them up for an entire zone.
>    They also once again require setting up a stacked block device,
>    which is really annoying in harnesses like xfstests
> 
> [...]

Applied, thanks!

[1/4] block: add a macro to initialize the status table
      commit: 8c8ebed16581faf3b3e97336aeca3d8226c4435f
[2/4] block: add a "tag" for block status codes
      commit: ce351560b714403acfdeed86ef96675d229da837
[3/4] block: add a str_to_blk_op helper
      commit: d39a63ead381c7ee93cd938ea2d759c17343b522
[4/4] block: add configurable error injection
      commit: e8dcf2d142bd720c8334233ad6cfdf00f0e76b7f

Best regards,
-- 
Jens Axboe



