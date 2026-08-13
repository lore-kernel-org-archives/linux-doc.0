Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC662C0296
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609374; cv=none; b=hKBWGzrLqfatx1VLHZ0GtQaTcF9xVTu25X/5ZXtqVWKj35cHax2Uh4t78MqQUm7V8HqVAmTRqiKrPtPY4Lmt/OapyFnG1pKhbnXEJ1ldr/QsH6C6LPNlzhnPFwAhDFwiBhqGmBLuOn51P9+UGGFQkPsV5Grror7Jm6XNiwCE6Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609374; c=relaxed/simple;
	bh=ufH+e66ZKDLiR/p5yTTn0dwbpGPytwbQwwdtwje203I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6SKZI4EwuO/BTSbTqKvhtKEiv3c0DA/Tv07Sd8PksrayXtJ9nb8xm416M6gkERzAFkxfbxL67+Uvao4N3lrEYhHz9rv+hXC8AndgKKw9jl4Pc0vSD4j/WFgAv+jSnUoQugeaouN6qCXlcKWDf2cq2MSG4z79cFzNx/l6ErQrPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K7UICPuk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K7UICPuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786609371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qzc7A0H+LuzoGrsoEHxP9TNCNQHz6zDj0wB6rZ/NxjM=;
	b=K7UICPukjfJ94R4Tb48F4+NFSBU1PX8Fcpv2AZFFNc+JYR+fJcO8LHLY3ecWndRM79PPX3
	NHoCzQM3lMMB/1CAkO4sRsXP0/HfY3WrLnodvmXm869EY/6mlmzsv4LFeqhz02UbOEt8VZ
	Xm9CDDODCjPu+JLZyIORCs9DnWNo0Dk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-346GiGtfOHmuxEFLaE-1Hw-1; Thu,
 13 Aug 2026 04:22:49 -0400
X-MC-Unique: 346GiGtfOHmuxEFLaE-1Hw-1
X-Mimecast-MFC-AGG-ID: 346GiGtfOHmuxEFLaE-1Hw_1786609367
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 14EB11800614;
	Thu, 13 Aug 2026 08:22:47 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.48.120])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6AF27423;
	Thu, 13 Aug 2026 08:22:42 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: daniel@makrotopia.org
Cc: jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v10 3/5] net: dsa: mxl862xx: add devlink flash_update and info_get
Date: Thu, 13 Aug 2026 10:22:33 +0200
Message-ID: <20260813082233.71011-1-pabeni@redhat.com>
In-Reply-To: <66aaa1b09b0f2e9e74a7274a878c6902e1aa2b9c.1786294649.git.daniel@makrotopia.org>
References: <66aaa1b09b0f2e9e74a7274a878c6902e1aa2b9c.1786294649.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/
---
Subject: net: dsa: mxl862xx: add devlink flash_update and info_get

This commit implements runtime firmware upgrading for the MxL862xx switch
using devlink dev flash. It transfers the firmware image over SB PDI,
reboots the switch, and defers a device reprobe to re-initialize the driver
using a workqueue.

> diff --git a/drivers/net/dsa/mxl862xx/mxl862xx-fw.c b/drivers/net/dsa/mxl862xx/mxl862xx-fw.c
> new file mode 100644
> index 0000000000000..9799cf19d31a9
> --- /dev/null
> +++ b/drivers/net/dsa/mxl862xx/mxl862xx-fw.c

[ ... ]

> +static void mxl862xx_reprobe_work_fn(struct work_struct *work)
> +{
> +	struct mxl862xx_reprobe *rp =
> +		container_of(work, struct mxl862xx_reprobe, work.work);
> +	struct device *dev = rp->dev;
> +	bool bound;
> +
> +	device_lock(dev);
> +	bound = !!dev_get_drvdata(dev);
> +	device_unlock(dev);
> +
> +	if (!bound)
> +		dev_dbg(dev, "reprobe skipped, device is gone\n");
> +	else if (device_reprobe(dev))

[Severity: High]
Is there a race window here that can lead to a use-after-free of priv?

If device_shutdown() runs after device_unlock() but before
device_reprobe(), it can clear drvdata. When device_reprobe() subsequently
runs, it triggers the driver remove() function, which returns early because
drvdata is NULL, bypassing dsa_unregister_switch().

However, because priv was allocated with devm_kzalloc() during probe:

drivers/net/dsa/mxl862xx/mxl862xx.c:mxl862xx_probe() {
    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    ...
}

the driver core will still run devres_release_all() and free priv. The DSA
switch remains registered, and any subsequent access to it via devlink or
netlink could dereference the freed priv pointer.

> +		dev_err(dev, "reprobe failed; device left unbound\n");
> +
> +	put_device(dev);
> +	kfree(rp);
> +	module_put(THIS_MODULE);
> +}

[Severity: High]
Can this cause a kernel panic if the module is unloaded concurrently?

Calling module_put(THIS_MODULE) at the very end of a work item means the
module reference count drops to zero before the function fully returns to
the workqueue core.

A concurrent rmmod can then proceed and unmap the module text section. If
the worker thread is preempted or delayed, it will resume execution from
unmapped memory during the function epilogue, leading to a fatal page fault.
-- 
This is an AI-generated review.

