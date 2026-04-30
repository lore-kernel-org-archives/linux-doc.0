Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCA83B9D95
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546314; cv=none; b=AnFzBrgOyzeKIG/YATSJqJC3RQcB8KG7bKbzqyaX+GULeYHb1ynLONIdQbpbgGgVuLfWwOapil1TGXQGMr2GDP9Q0Op2UM93MyNP4sFWmpxxqdQjbU8uEuxYWPesP6wBnMAnlYmc2n2Plq66GT3Fhf3YlF19v/0AiLbtip30qh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546314; c=relaxed/simple;
	bh=kbZLyGVuS2pU28E8eTafjkJVuKVn1qCU+8NsMXMpuBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNW1MUQ6U861JYHdbqzceiplVGZ1/znP6BMdOP1MdEjO0x+YqalsNpsUJnurAr37gfvH4VtNR6N2zENjspgSFkjj+FFn6bk6U8Bt3BiXIhE/sa18r7cgSbEkmLqT/Dk37drGJI1Ine7jj7iaEDNWPVI4LYWx5JQc+s+JdKBsLVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVsoRim+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WU2c+X2N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVsoRim+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WU2c+X2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777546309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1gqLnefR1tQ7TsQkbl4b2ZXC78xNY8qqi7bqcKieYM=;
	b=UVsoRim+isDbsIfr+IbCrkpptoIvC64MH6xXK56oQS3F9Km0X6t63yJhtTFYn8IRw3rHdh
	YKEqLajl/vj5TV2bDKTTyHZQ4lJnSuYPcsbWEHmKJoAXYjRpKBKsvaC3wfMS7ncr0LT0HN
	eee2SU96iljcVxjyrHFhegXLHAUE6us=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-sIeA8yAUMWuICxAvuaji2A-1; Thu, 30 Apr 2026 06:51:48 -0400
X-MC-Unique: sIeA8yAUMWuICxAvuaji2A-1
X-Mimecast-MFC-AGG-ID: sIeA8yAUMWuICxAvuaji2A_1777546307
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-44696b11265so904094f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777546307; x=1778151107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1gqLnefR1tQ7TsQkbl4b2ZXC78xNY8qqi7bqcKieYM=;
        b=WU2c+X2NIdgLK/IYazXdHexIP5ywo5duocVIxTdFq1490RKjOEu51YAuCk416Umn0+
         IxACLDUeztRZMKJkIJ/NIE25nezOwAXpJ2aZ5xVx3QcuZGvFbtfnXXNDIeHXjyCmU2Do
         EHmnJ/Hz2Ngzmx8z87djrGyiuJ6/JYw9Idqv99K1YAyMjQLKkLK0qoBkfgwxvFnI0AL6
         gtOM3GXuUPTkZxsbRXn7DGKe32/EI40CxAjfLRDS2MBwV30r8QCe3ejetln7ucoynK9A
         1ZV4OAnD3ZXSKXnelXjG6co5DdNy3znu9QRJxKNFdjMHoknGnolkuVIRmpLs1fuv3OxA
         Mzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777546307; x=1778151107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1gqLnefR1tQ7TsQkbl4b2ZXC78xNY8qqi7bqcKieYM=;
        b=hGx4AnaNOo8b2jaQHtZzmeNwUzqIpE/k3xUW7QgbicKUnqaZhgUt47IEAUSVOkl0MD
         h8gwkt3+TXaOuglDVaHOnT723I6FeoaC87p7WrCVV12n4+YZVcSz9U1AuVHI/5YINlgt
         PtrFEjska3a2e2h4PSv5dCEXF8nJcUuqPYbD9n2lVErTsFKyrcnk132QRbsU9sLZvtlt
         w3N9z+hnntvHjNB3k2z7KjX5u0tPhRQt1lDtYDgM6tbBxMJyQvvOeBGgFTNanPziijfj
         FDkPimCSQ4c3AeKwS0XkdUda1EBdP+LObKrdgqRRDQFZHhJyG/06PY5gs66urSOpWKvn
         NT5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+DvUJlnjG/CO1Py+l+2oaem3t/Kl+PFngoKjI8B4QoUKV+rJFA8uUd9z/dol9JlNWAYUyfcSgLKyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJOsDiMz8ssq3ESA+5fm/kHrxCHXQpXzs/0zNNDsG5JUcmlTn
	Bl4VKCR02RHfLwQmEVqeC23DwS0bpsdOOTkrJpgTNDh32FFEIUqf/CZPEssCGNIRZrdWjpDvZ4W
	B4k2p3bwo8P2LDKM8oQO5/6GPxP1BMDQKsI+ErBRBHQdfYuGTcXXz83LTkwxS9w==
X-Gm-Gg: AeBDievjmu7mqAs6bJ4GvXVU8WlWnXVdrDTL+bWnNh1QRsgze+QaVduLtjrdgaZJ7lX
	jBd9ck7JHLE3bHaQWUoF0bhDhmKTtAob5dAOfQC348lH0PX46qA2aZKHGt6fTnINijO9GyVdAAh
	u4UfDDkbASnTYqoA0Nut4XbiFj4qrfCIzEzowis7DwMd8XxHyKA9A3oLweOONCMZ2IIP2NCECDI
	BLYHTuIN5e4mdrqZnroSJAcY048oXW376fKOHRVFAi7tyKYw25TbM2MiowsYFhQRfo9QXNc0vBh
	buEMZUS8h1SEieFS5uDWDfHXJEqwsxZgKgvrFyGH3AZy1kFcdlyXN7gNttAhSOtx1Krw0/A8CA7
	qpWt2hqM1SdjlfH/iw+La90M4Drn4AKJF9gNZPIm/dpzhP2DWZji+uNgfRJjUOLh9sQ==
X-Received: by 2002:a05:6000:248a:b0:43d:7b7b:ab76 with SMTP id ffacd0b85a97d-4493dcd3c7fmr3460387f8f.10.1777546306537;
        Thu, 30 Apr 2026 03:51:46 -0700 (PDT)
X-Received: by 2002:a05:6000:248a:b0:43d:7b7b:ab76 with SMTP id ffacd0b85a97d-4493dcd3c7fmr3460320f8f.10.1777546305924;
        Thu, 30 Apr 2026 03:51:45 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c0csm12280957f8f.29.2026.04.30.03.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:51:45 -0700 (PDT)
Message-ID: <d8f24185-9987-487a-9e0c-5387bd72b629@redhat.com>
Date: Thu, 30 Apr 2026 12:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 net-next 05/11] net/nebula-matrix: add channel layer
To: "illusion.wang" <illusion.wang@nebula-matrix.com>,
 dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, corbet@lwn.net, kuba@kernel.org,
 linux-doc@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 vadim.fedorenko@linux.dev, lukas.bulwahn@redhat.com, edumazet@google.com,
 enelsonmoore@gmail.com, skhan@linuxfoundation.org, hkallweit1@gmail.com,
 open list <linux-kernel@vger.kernel.org>
References: <20260428114910.2616-1-illusion.wang@nebula-matrix.com>
 <20260428114910.2616-6-illusion.wang@nebula-matrix.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260428114910.2616-6-illusion.wang@nebula-matrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/26 1:48 PM, illusion.wang wrote:
> a channel management layer provides structured approach to handle
> communication between different components and drivers. Here's a summary
> of its key functionalities:
> 
> 1. Message Handling Framework
> Message Registration/Unregistration: Functions (nbl_chan_register_msg,
> nbl_chan_unregister_msg) allow dynamic registration of message handlers
> for specific message types, enabling extensible communication protocols.
> Message Sending/Acknowledgment: Core functions (nbl_chan_send_msg,
> nbl_chan_send_ack) handle  message transmission, including asynchronous
> operations with acknowledgment (ACK) support.
> Received ACKs are processed via nbl_chan_recv_ack_msg.
> Hash-Based Handler Lookup: A hash table (handle_hash_tbl) stores message
> handlers for efficient O(1) lookup by message type.
> 
> 2. Channel Types and Queue Management
> Mailbox Channel: For direct communication between PF0 and Other PF.
> Queue Initialization/Teardown: Functions (nbl_chan_init_queue,
> nbl_chan_teardown_queue) manage transmit (TX) and receive (RX) queues.
> 
> Queue Configuration: Hardware-specific queue parameters (e.g., buffer
> sizes, entry counts) are set via nbl_chan_config_queue, with hardware
> interactions delegated to hw_ops.
> 
> 3. Hardware Abstraction Layer (HW Ops)
> Hardware-Specific Operations: The nbl_hw_ops structure abstracts
> hardware interactions: queue configuration (config_mailbox_txq/rxq),
>  tail pointer updates(update_mailbox_queue_tail_ptr).
> 
> Signed-off-by: illusion.wang <illusion.wang@nebula-matrix.com>
> ---
>  .../net/ethernet/nebula-matrix/nbl/Makefile   |   3 +-
>  .../nbl/nbl_channel/nbl_channel.c             | 771 +++++++++++++++++-
>  .../nbl/nbl_channel/nbl_channel.h             | 133 +++
>  .../nebula-matrix/nbl/nbl_common/nbl_common.c | 212 +++++
>  .../nebula-matrix/nbl/nbl_common/nbl_common.h |  33 +
>  .../nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c  | 143 ++++
>  .../nbl/nbl_include/nbl_def_channel.h         |  87 ++
>  .../nbl/nbl_include/nbl_def_common.h          |  30 +
>  .../nbl/nbl_include/nbl_def_hw.h              |  28 +
>  .../nbl/nbl_include/nbl_include.h             |   6 +
>  10 files changed, 1442 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c
>  create mode 100644 drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h
> 
> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/Makefile b/drivers/net/ethernet/nebula-matrix/nbl/Makefile
> index 63116d1d7043..c9bc060732e7 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/Makefile
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/Makefile
> @@ -3,7 +3,8 @@
>  
>  obj-$(CONFIG_NBL) := nbl.o
>  
> -nbl-objs +=       nbl_channel/nbl_channel.o \
> +nbl-objs +=       nbl_common/nbl_common.o \
> +				nbl_channel/nbl_channel.o \
>  				nbl_hw/nbl_hw_leonis/nbl_hw_leonis.o \
>  				nbl_hw/nbl_hw_leonis/nbl_resource_leonis.o \
>  				nbl_hw/nbl_hw_leonis/nbl_hw_leonis_regs.o \
> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c
> index c1b724a8b92d..810f5f03adc0 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c
> @@ -2,12 +2,757 @@
>  /*
>   * Copyright (c) 2025 Nebula Matrix Limited.
>   */
> -
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/pci.h>
> +#include <linux/bits.h>
> +#include <linux/dma-mapping.h>
>  #include "nbl_channel.h"
>  
> +static int nbl_chan_add_msg_handler(struct nbl_channel_mgt *chan_mgt,
> +				    u16 msg_type, nbl_chan_resp func,
> +				    void *priv)
> +{
> +	struct nbl_chan_msg_node_data handler = { 0 };
> +	int ret;
> +
> +	handler.func = func;
> +	handler.priv = priv;
> +	ret = nbl_common_alloc_hash_node(chan_mgt->handle_hash_tbl, &msg_type,
> +					 &handler, NULL);
> +
> +	return ret;
> +}
> +
> +static int nbl_chan_init_msg_handler(struct nbl_channel_mgt *chan_mgt)
> +{
> +	struct nbl_common_info *common = chan_mgt->common;
> +	struct nbl_hash_tbl_key tbl_key;
> +
> +	tbl_key.dev = common->dev;
> +	tbl_key.key_size = sizeof(u16);
> +	tbl_key.data_size = sizeof(struct nbl_chan_msg_node_data);
> +	tbl_key.bucket_size = NBL_CHAN_HANDLER_TBL_BUCKET_SIZE;
> +
> +	chan_mgt->handle_hash_tbl = nbl_common_init_hash_table(&tbl_key);
> +	if (!chan_mgt->handle_hash_tbl)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void nbl_chan_remove_msg_handler(struct nbl_channel_mgt *chan_mgt)
> +{
> +	nbl_common_remove_hash_table(chan_mgt->handle_hash_tbl, NULL);
> +
> +	chan_mgt->handle_hash_tbl = NULL;
> +}
> +
> +static void nbl_chan_init_queue_param(struct nbl_chan_info *chan_info,
> +				      u16 num_txq_entries, u16 num_rxq_entries,
> +				      u16 txq_buf_size, u16 rxq_buf_size)
> +{
> +	mutex_init(&chan_info->txq_lock);
> +	chan_info->num_txq_entries = num_txq_entries;
> +	chan_info->num_rxq_entries = num_rxq_entries;
> +	chan_info->txq_buf_size = txq_buf_size;
> +	chan_info->rxq_buf_size = rxq_buf_size;
> +}
> +
> +static int nbl_chan_init_tx_queue(struct nbl_common_info *common,
> +				  struct nbl_chan_info *chan_info)
> +{
> +	struct nbl_chan_ring *txq = &chan_info->txq;
> +	struct device *dev = common->dev;
> +	size_t size =
> +		chan_info->num_txq_entries * sizeof(struct nbl_chan_tx_desc);
> +
> +	txq->desc.tx_desc = dmam_alloc_coherent(dev, size, &txq->dma,
> +						GFP_KERNEL);
> +	if (!txq->desc.tx_desc)
> +		return -ENOMEM;

Sashiko says:

These setup functions use dmam_alloc_coherent() and devm_kcalloc(), but
nbl_chan_teardown_queue() does not free them. If the queues are torn down
and set up multiple times during the device's lifetime, does this leak
memory since devm_ resources are only freed when the device is unbound?

> +static int nbl_chan_teardown_queue(struct nbl_channel_mgt *chan_mgt,
> +				   u8 chan_type)
> +{
> +	struct nbl_chan_info *chan_info = chan_mgt->chan_info[chan_type];
> +
> +	nbl_chan_stop_queue(chan_mgt, chan_info);

sashiko says:

The driver registers a background work item for clean_task, but neither
nbl_chan_teardown_queue() nor nbl_chan_remove_common() calls
cancel_work_sync(). If the queues are destroyed while this work is pending,
will it eventually execute and access unmapped DMA regions or freed memory?

> +static int nbl_chan_kick_tx_ring(struct nbl_channel_mgt *chan_mgt,
> +				 struct nbl_chan_info *chan_info)
> +{
> +	struct nbl_hw_ops *hw_ops = chan_mgt->hw_ops_tbl->ops;
> +	struct nbl_chan_ring *txq = &chan_info->txq;
> +	struct device *dev = chan_mgt->common->dev;
> +	struct nbl_chan_tx_desc *tx_desc;
> +	int i = 0;
> +
> +	NBL_UPDATE_QUEUE_TAIL_PTR(chan_info, hw_ops, chan_mgt, txq->tail_ptr,
> +				  NBL_MB_TX_QID);
> +
> +	tx_desc = NBL_CHAN_TX_RING_TO_DESC(txq, txq->next_to_clean);
> +
> +	while (!(tx_desc->flags & BIT(NBL_CHAN_TX_DESC_USED))) {
> +		udelay(NBL_CHAN_TX_WAIT_US);
> +		i++;

Sashiko says:

This loop executes udelay(100) for up to 30,000 iterations while holding the
txq_lock mutex. Will this busy-wait for up to 3 seconds with a mutex held
and preemption disabled, potentially triggering soft lockups? Could a
sleepable function like usleep_range() be used instead, or the overall
timeout reduced?

> +
> +		if (!(i % NBL_CHAN_TX_REKICK_WAIT_TIMES))
> +			NBL_UPDATE_QUEUE_TAIL_PTR(chan_info, hw_ops, chan_mgt,
> +						  txq->tail_ptr, NBL_MB_TX_QID);
> +
> +		if (i == NBL_CHAN_TX_WAIT_TIMES) {
> +			dev_err(dev, "chan send message type: %d timeout\n",
> +				tx_desc->msg_type);
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	txq->next_to_clean = txq->next_to_use;
> +
> +	return 0;
> +}
> +
> +static void nbl_chan_recv_ack_msg(void *priv, u16 srcid, u16 msgid, void *data,
> +				  u32 data_len)
> +{
> +	struct nbl_channel_mgt *chan_mgt = (struct nbl_channel_mgt *)priv;
> +	struct nbl_chan_waitqueue_head *wait_head = NULL;
> +	union nbl_chan_msg_id ack_msgid = { { 0 } };
> +	struct device *dev = chan_mgt->common->dev;
> +	struct nbl_chan_info *chan_info =
> +		chan_mgt->chan_info[NBL_CHAN_TYPE_MAILBOX];
> +	u32 *payload = (u32 *)data;
> +	u32 ack_datalen;
> +	u32 copy_len;
> +
> +	if (data_len < NBL_CHAN_ACK_HEAD_LEN * sizeof(u32)) {
> +		dev_err(dev, "Invalid ACK data_len: %u\n", data_len);
> +		return;
> +	}
> +	ack_datalen = data_len - NBL_CHAN_ACK_HEAD_LEN * sizeof(u32);
> +	ack_msgid.id = *(u16 *)(payload + NBL_CHAN_MSG_ID_POS);

This code extracts the message ID by casting a u32 pointer to u16. On
big-endian architectures, will this read the upper 16 bytes of the
32-bit word, which are zero?

> +	if (ack_msgid.info.loc >= NBL_CHAN_QUEUE_LEN) {
> +		dev_err(dev, "chan recv msg loc: %d err\n", ack_msgid.info.loc);
> +		return;
> +	}
> +	wait_head = &chan_info->wait[ack_msgid.info.loc];
> +	wait_head->ack_err = *(payload + NBL_CHAN_ACK_RET_POS);
> +
> +	copy_len = min_t(u32, wait_head->ack_data_len, ack_datalen);
> +	if (wait_head->ack_err >= 0 && copy_len > 0)
> +		memcpy((char *)wait_head->ack_data,
> +		       payload + NBL_CHAN_ACK_HEAD_LEN, copy_len);

Sashiko says:

If wait_event_timeout() times out in nbl_chan_send_msg(), the function
returns and the caller's stack frame is destroyed. Since the wait slot is
never cleared, if a delayed ACK arrives later, will nbl_chan_recv_ack_msg()
execute memcpy() and overwrite the now-freed stack memory?
Should this function verify if ack_msgid.info.index matches
wait_head->msg_index and the state is NBL_MBX_STATUS_WAITING before copying?

Sashiko has more comments, I reported only those that looked more
impactful to me, please have a careful read of them:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260428114910.2616-1-illusion.wang%40nebula-matrix.com
https://sashiko.dev/#/patchset/20260428114910.2616-1-illusion.wang%40nebula-matrix.com

Also note that submitters should thread AI-generated reviews as any
other kind of feedback. Specifically you should procatively reply on the
ML discussing invalid comments.

Thanks,

Paolo

