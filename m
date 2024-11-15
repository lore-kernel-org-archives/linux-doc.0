Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1432318FC85
	for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2024 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731714278; cv=none; b=kieNWxu5MZqeAJ7otG0AI76v8uevOqvaDiCzU0pnph8WcyVbTCi4K7HXPdg4aoov9Qss20cTbBRiQCIoxXnOELMvQWxYmB1ZIMtPkG1xr3/cTfyNZGlAtzvkMGnzcVDDOE1hshtZ9c04Ba+dbJZaN7PBtLjYa5J3K7qZ8kdt0f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731714278; c=relaxed/simple;
	bh=Q98GpAXIXXTFGxjP940kfMq6NpRgN5dbn45WX5a0n58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DS1QdhlCrmk0swbzhGZErcxCq2j8hhu1eJj/aoqfdq5P+ayL7tdOwSIsAxMTvArj5J7R6cJ365LWnl/oRufW2aRDApj4Hgs1wTaSlZ9rftkDkFb52iuounyzcSXQ0s2pQyoYpoU2ixq8d3lohnbJHNZ6rRA4an5dlA5D4XREhN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SUQk/x/o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DrSce24v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SUQk/x/o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DrSce24v"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731714274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpMpS0IQiY6an8UWGWwLEBmqhEy7NKFAs+d1uCx9dMw=;
	b=SUQk/x/oxA5RLzp8LNVdflhV2m+4PPFeFeB7dPQeiO3/Khn74U3psiTrwnpFeiAxK3Npqv
	h9wOYHTb1WSv7UXBzuEeQsnyCsFYw2bpP2oc427+nglG4SpThR6sYq4AjtGrWwsaqlKjEN
	Or/MSVFQX8eHnr/HGkAWLBEGLNZGFmSUdrVjgLF4sPiXlfyzNgLomrok72UnaE6Us51tOQ
	ok16F/sKI8V1Sn8UvjdXtbASc/8fXejrfuUbQhByWYcVqLaVT711BqkD5g4p+UmybO0I2O
	X/FQUQbaqW5ZavpoDdVHx2j7T8+sookeegb/Pm67nqJTO2MhLK9tGf2/yAyNiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731714274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpMpS0IQiY6an8UWGWwLEBmqhEy7NKFAs+d1uCx9dMw=;
	b=DrSce24vQjscMxxPy2UFdXvMryeRhk1w/w0cc2+Ik0WSECzrRbRDWR+/p2xIwN0TtwQuqz
	YRYMxNBBgGLifEDw==
To: Zhou Wang <wangzhou1@hisilicon.com>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 wangwudi@hisilicon.com, prime.zeng@hisilicon.com, Zhou Wang
 <wangzhou1@hisilicon.com>, Nianyao Tang <tangnianyao@huawei.com>
Subject: Re: [PATCH v4] irqchip/gicv3-its: Add workaround for hip09 ITS
 erratum 162100801
In-Reply-To: <20241114082813.3865466-1-wangzhou1@hisilicon.com>
References: <20241114082813.3865466-1-wangzhou1@hisilicon.com>
Date: Sat, 16 Nov 2024 00:44:54 +0100
Message-ID: <87msi0yscp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 14 2024 at 16:28, Zhou Wang wrote:

> When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
> during unmapping operation, which will cause some vSGIs lost.
>
> To fix the issue, invalidate related vPE cache through GICR_INVALLR
> after VMOVP.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>

This Signed-off-by chain is incorrect. Who authored the patch?

If Nianyao is the author then the changelog lacks a

   From: Nianyao ....

line right at the top.

If you both authored it, then this lacks a Co-developed-by tag.

See Documentation/process/... for further explanation.

Thanks,

        tglx
