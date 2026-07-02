Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB16A4A2E2F
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985391; cv=none; b=qOA+Cuxz2aGWF8u4LfktOlCOO89vVUnIzYuTMVuo3NYGjKJ4A8+Uchx5pUHCq7DxZO0EoRuA3OWLC09/KUAs9AzQcY2j0JwY8VQbbabM9PIvxj3FSzo3eIasx5ALmGJt2qJhmmmFgtB6RE1N9j6Jsl5YqU8JwBlKR5hj+/kthKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985391; c=relaxed/simple;
	bh=DBp0HpY/1P83m0+T7zAKgcs6HB4JhMfEjMqLia5VMtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcDK8JYNZ0AINgoWpnVf8UHb878iXJkWD2keiF1eNe52mxzeiW65LbjoDhEh0rOcrMqgBCNuCSOh/fDHIQah5Qzx3JMC6eN9XgrUjcEDpAD28ovJ54X7PdYVzJqLxxBbjrgfnJL8abWFgwQg//vhsE69oQegfuoJO5PLzq3bXWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ca9hAf9y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ca9hAf9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782985388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVzabU/aan9emoroPKw52jNiTEzUBhOm6LtJbWWM6Yg=;
	b=Ca9hAf9yY7kz1YjK1PPhE/tlHIpPPEmgirBoBDFK3LItLc7St3XKFB97xnWJtg7w7wJcrC
	PNpQDTDjBE5MlCY+r6kdi9dqGm7nHd6aQ6ioMUOyBs+56yYKMpen/YBEYE+tXbpHkQR75H
	uCK3ihOrHXNy6gqeJpY+W7YEXQmz5zQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-p0njNHpfO3C6nNclJpdQtw-1; Thu,
 02 Jul 2026 05:43:03 -0400
X-MC-Unique: p0njNHpfO3C6nNclJpdQtw-1
X-Mimecast-MFC-AGG-ID: p0njNHpfO3C6nNclJpdQtw_1782985381
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D34C1944EB7;
	Thu,  2 Jul 2026 09:43:01 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.48.252])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C15A71800592;
	Thu,  2 Jul 2026 09:42:55 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com,
	alvin.wang@nebula-matrix.com,
	sam.chen@nebula-matrix.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	kuba@kernel.org,
	horms@kernel.org,
	linux-doc@vger.kernel.org,
	pabeni@redhat.com,
	vadim.fedorenko@linux.dev,
	lukas.bulwahn@redhat.com,
	edumazet@google.com,
	enelsonmoore@gmail.com,
	skhan@linuxfoundation.org,
	hkallweit1@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 net-next 06/10] net/nebula-matrix: add intr resource implementation
Date: Thu,  2 Jul 2026 11:42:53 +0200
Message-ID: <20260702094253.111384-1-pabeni@redhat.com>
In-Reply-To: <20260630010718.4346-7-illusion.wang@nebula-matrix.com>
References: <20260630010718.4346-7-illusion.wang@nebula-matrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: AI Reviewer <ai@example.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/
---
net/nebula-matrix: add intr resource implementation

This patch adds the nbl_interrupt module for management of driver-private
MSI-X indices. It adds hw_ops callbacks to program the function MSI-X mapping
registers, configure MSI-X info, and enable mailbox interrupts.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c
> new file mode 100644
> index 0000000000000..53a657aef9ca0
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_interrupt.c
> @@ -0,0 +1,267 @@
[ ... ]
> +/*
> + * This function tears down the MSI-X mapping for a function by clearing the
> + * interrupt bitmaps, disabling MSI-X via HW callbacks, and resetting the
> + * bookkeeping state. The DMA buffer and interrupts[] array are intentionally
> + * left allocated for potential reuse on reset/hot-add paths. Caller must
> + * ensure this is only invoked when the HW cannot issue in-flight DMA to
> + * the region (IRQs already freed or not yet configured).
> + */
> +int nbl_res_intr_destroy_msix_map(struct nbl_resource_mgt *res_mgt,
> +				  u16 func_id)
> +{
[ ... ]
> +	/* use ctrl dev bdf */
> +	hw_ops->configure_msix_map(res_mgt->hw_ops_tbl->priv, func_id, false, 0,
> +				   0, 0, 0);
> +
> +	intr_mgt->func_intr_res[func_id].interrupts = NULL;
> +	intr_mgt->func_intr_res[func_id].num_interrupts = 0;
> +	intr_mgt->func_intr_res[func_id].msix_map_table.base_addr = NULL;
> +	intr_mgt->func_intr_res[func_id].msix_map_table.size = 0;
> +	hw_ops->flush_write(res_mgt->hw_ops_tbl->priv);
> +
> +	return 0;
> +}

[Severity: High]
Does this code leak the devm-managed resources? The comment mentions that
the DMA buffer and interrupts array are left allocated for potential reuse,
but the pointers are set to NULL here. This causes the pointers to be lost
so they cannot be reused or explicitly freed later.

Because nbl_res_intr_configure_msix_map() unconditionally allocates new devres
memory on every call, won't this cause the devres list to accumulate leaked
allocations (dmam_alloc_coherent and devm_kcalloc) each time the device is
reset or a VF is reconfigured?

[ ... ]
> +int nbl_res_intr_configure_msix_map(struct nbl_resource_mgt *res_mgt,
> +				    u16 func_id, u16 num_net_msix,
> +				    u16 num_others_msix,
> +				    bool net_msix_mask_en)
> +{
[ ... ]
> +	nbl_res_intr_destroy_msix_map(res_mgt, func_id);
> +
> +	msix_map_table = &intr_mgt->func_intr_res[func_id].msix_map_table;
> +	WARN_ON(msix_map_table->base_addr);
> +	msix_map_table->size =
> +		sizeof(struct nbl_msix_map) * NBL_MSIX_MAP_TABLE_MAX_ENTRIES;
> +	/* HW indexes the MSI-X map table with a fixed stride of 1024 entries,
> +	 * so we must allocate the full table even if fewer vectors are used.
> +	 */
> +	msix_map_table->base_addr = dmam_alloc_coherent(dev,
> +							msix_map_table->size,
> +							&msix_map_table->dma,
> +							GFP_KERNEL);
> +	if (!msix_map_table->base_addr) {
> +		dev_err(dev, "Allocate DMA memory for function msix map table failed\n");
> +		msix_map_table->size = 0;
> +		return -ENOMEM;
> +	}
> +
> +	interrupts = devm_kcalloc(dev, requested, sizeof(interrupts[0]),
> +				  GFP_KERNEL);
> +	if (!interrupts) {
> +		ret = -ENOMEM;
> +		goto alloc_interrupts_err;
> +	}

[Severity: High]
If devm_kcalloc() fails, the goto alloc_interrupts_err path bypasses
clearing msix_map_table->base_addr and size. 

While nbl_res_intr_destroy_msix_map() clears it unconditionally on the next
call, doesn't this leave the internal state inconsistent by keeping base_addr
populated when interrupts is NULL?

[ ... ]
> +get_interrupt_err:
> +	while (i--) {
> +		intr_index = interrupts[i];
> +		if (intr_index >= NBL_NET_INTR_BASE)
> +			clear_bit(intr_index - NBL_NET_INTR_BASE,
> +				  intr_mgt->interrupt_net_bitmap);
> +		else
> +			clear_bit(intr_index,
> +				  intr_mgt->interrupt_others_bitmap);
> +	}
> +
> +	intr_mgt->func_intr_res[func_id].num_interrupts = 0;
> +	intr_mgt->func_intr_res[func_id].interrupts = NULL;
> +	intr_mgt->func_intr_res[func_id].num_net_interrupts = 0;
> +	intr_mgt->func_intr_res[func_id].msix_map_table.base_addr = NULL;
> +	intr_mgt->func_intr_res[func_id].msix_map_table.size = 0;
> +alloc_interrupts_err:
> +	return ret;
> +}
-- 
This is an AI-generated review.

