Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264950;
	b=QdWIXRQ7ps4oGHu3xF6RHPpLlGedTF1dozUxgUGsrZAmow7haF52TYn8JdXJzLM+TszW
	 3Y6S1xm35x0KsQvhHNAZURnT4FqzinlIRNEvBZGTYRpgE7Sb0vNOGsFylmupkAQC8kIL3
	 v8TUMGgH0pwVFrSir2mg1wwvG28kxONBsp/EPnEN6CI9MdvoCDpt5BGu2R/5PWfdUHJne
	 15YdRM3ltAGijpY4yARfVTXduOeqlnUJM5ZyVYFbqO2mN4nExiViql3JNSmr9TOIMw4y0
	 kSAVSdNvewdpMfuEDaShaa41Mv8PVOXEJqTmOsAOlZnN/G5UBF3MH/R8D6EkhiOP3Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264950;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mjG+VkWrf8qqhbRhT1SH5x21Ugamo0ZOZzv95akdBEw=;
	b=OUr79QJw/fTJBZI1L0d91w2CPr7P4lccokRNe5gbKqdnojpKyEy9VIxcGfptrMQQM7Gi
	 kix19taNel2SRsn5mTa7NYaQWg4gwnb/snNshrWIqF0+NBpk+gvY0s9OnenQs7EYqSdPB
	 51c3T4HUfwI5kp8RkQ8JAQuwrMjmL1JxyWHIH4pfkgQp2sY7dRxHPB6WIOZXkiJziWtp0
	 l2jpjvcPHa48lWYB7gzdjH122dxlafZ4sTnbH6yjXZiQmtdik45FAQHMhDSUEFNVihGGW
	 I7mVzrCPLGhXhJQuWpFqiF68jm/c7YQy3VnJiYBAEQTibUzeIGTeqwTruJs6WB/6uLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3XdX+k7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC32606A33F;
	Sat, 21 Nov 2026 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3XdX+k7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EBA1F000C0;
	Sat, 21 Nov 2026 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264950;
	bh=mjG+VkWrf8qqhbRhT1SH5x21Ugamo0ZOZzv95akdBEw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b3XdX+k7g1qeuHfzDQJ2iRYOka0gRH4z7tMVXXpWPkqQHaVgrj5LqgxEIQ1/97Okr
	 km+kFLy/0aLmfzY0ZWlOQLjrAY26XFqIYLEb8QKkJTEONOi42uEE3BQOfaaTNPHGWl
	 OOM35ISdapwx4EMXgrue9MxTdv55K8IkCCIDWId3kvxBW1Ts5acWFXEliUwyWvLUPc
	 6lr3bpT9r74G99o54jliKym8RApKu4hxYmUVTjkmCdqQBtinP+bCmjzERGusjpzNJF
	 F1H6Fn0e8Fs4Xxc1CiFdsAVEcDc7ATCALsFEB3QL3bT3PKJkrfZOx/FnIdM1MN7xDA
	 V18GYmjwwfdXQ==
Subject: Re: [PATCH net-next v12 4/6] net: wwan: t9xx: Add control port
From: netdev-bot+sashiko@kernel.org
To: jackbb_wu@compal.com
Cc: loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, wen-zhi.huang@mediatek.com,
 shi-wei.yeh@mediatek.com, Minano.tseng@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, robert_yu@compal.com, Jeff_Chang@compal.com,
 edumazet@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-doc@vger.kernel.org
Date: Sat, 21 Nov 2026 12:42:29 +0000
Message-ID: <179526494911.3135.1691599071652469894@kernel.org>
In-Reply-To: <20261117-t9xx_driver_v1-v12-4-e181b616b820@compal.com>
References: <20261117-t9xx_driver_v1-v12-4-e181b616b820@compal.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Two comments added in this patch give conflicting meanings for
  -EBUSY, and neither matches mtk_ch_status_check().
- [Low] The struct mtk_port comment (drivers/net/wwan/t9xx/mtk_port.h)
  says tx_seq and rx_seq "are reset while the channel is disabled, so…
- [Low] mtk_port_rx_dispatch() (drivers/net/wwan/t9xx/mtk_port.c) picks
  the target port from the channel field of the received CCCI header,…

--

net: wwan: t9xx: Add control port

This patch adds the port I/O layer and the port manager to the t9xx WWAN
driver. The port table is built from a static config, TRBs are sent to
CLDMA, and received data is dispatched to ports. struct trb gets a kref,
and TX sequence numbers are stamped when a TRB is handed to CLDMA.

> diff --git a/drivers/net/wwan/t9xx/mtk_port.c b/drivers/net/wwan/t9xx/mtk_port.c
> new file mode 100644
> index 0000000000000..eb5ea6741ed7f
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_port.c
> @@ -0,0 +1,641 @@

[ ... ]

> +static int mtk_port_rx_dispatch(struct sk_buff *skb, void *priv)
> +{

[ ... ]

> +	channel = FIELD_GET(MTK_HDR_FLD_CHN, le32_to_cpu(ccci_h->status));
> +	/* A CLDMA instance carries the channels of one peer only (sAP or MD),
> +	 * the peer of the port that armed this queue.
> +	 */
> +	if (MTK_PEER_ID(channel) == MTK_PEER_ID(port->info.rx_ch))
> +		port = mtk_port_search_by_id(port_mngr, channel);
> +	else
> +		port = NULL;
> +	if (unlikely(!port)) {
> +		dev_warn_ratelimited(port_mngr->ctrl_blk->mdev->dev,
> +				     "Failed to find port by channel:%d\n", channel);
> +		goto drop_data;
> +	}
> +
> +	mtk_port_check_rx_seq(port, ccci_h);
> +	port->rx_seq = FIELD_GET(MTK_HDR_FLD_SEQ, le32_to_cpu(ccci_h->status));
> +
> +	ret = mtk_port_get_ops(port->info.type)->recv(port, skb);

[Severity: Low]
Can two RX workers update the same port->rx_seq at the same time here?

The target port comes from the channel in the CCCI header. The only
filter is the peer ID. The queue that delivered the packet (the port
passed in as priv, i.e. rxq->arg) is not used for the lookup.

Each RX queue has its own rx_done_work. mtk_cldma_dev_init() creates
drv_info->wq like this:

    flag = WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_HIGHPRI;
    drv_info->wq = alloc_workqueue("cldma%d_workq_%s", flag, 0, hw_id, mdev->dev_str);

So work items for different RX queues of the same CLDMA are not ordered.
Later in the series CLDMA1 serves RXQ(0) for MDCTRL, RXQ(2) for MBIM and
RXQ(5) for AT.

Suppose the device puts a packet whose header names channel B on queue A's
ring. Queue A's worker then runs mtk_port_check_rx_seq(), does the plain
store to port B's rx_seq, and calls port B's ->recv(). Queue B's worker
may be doing the same thing at that moment.

That seems to conflict with the comment in struct mtk_port:

    rx_seq only from the rx_done
    callback of the one queue serving this channel.

Should dispatch reject packets whose channel does not belong to the
delivering queue? Or should rx_seq be protected some other way?

[ ... ]

> +int mtk_port_ch_enable(struct mtk_port *port)
> +{
> +	struct mtk_port_mngr *port_mngr = port->port_mngr;
> +	struct trb_open_priv *trb_open_priv;
> +	struct sk_buff *skb;
> +	struct trb *trb;
> +	int ret;
> +
> +	/* The modem restarts its sequence numbering with the channel, and
> +	 * the first packet after it is not checked.
> +	 */
> +	port->tx_seq = 0;
> +	port->rx_seq = MTK_INVALID_RX_SEQ;

[Severity: Low]
Is the struct mtk_port comment right about when these counters are reset?

    Both are reset
    while the channel is disabled, so neither needs a lock.

The reset happens at the start of mtk_port_ch_enable(), before the ENABLE
trb is submitted. The channel is not always disabled at that point.

The ENABLE can complete with -EBUSY in two places:

- mtk_ch_status_check(), when usr_cnt is already >= 1
- mtk_cldma_open(), when the queues already exist

In either case the RX queue is already armed with rxq->arg == port.
mtk_port_rx_dispatch() may be running this store at the same time:

    port->rx_seq = FIELD_GET(MTK_HDR_FLD_SEQ, le32_to_cpu(ccci_h->status));

There is also a second case. An earlier ENABLE that timed out may still be
queued, along with its compensating DISABLE. That pair can arm the queue
for a short time while a new ->enable() resets the counters.

These are plain unsigned short accesses with no READ_ONCE() or
WRITE_ONCE(). A late store from RX dispatch could undo the reset. The
first packet of the new session would then be checked against a stale
rx_seq and log a spurious "seq num out-of-order" warning.

Likewise, a TX left in flight from an earlier session could be stamped
with a tx_seq while the reset is happening.

[ ... ]

> diff --git a/drivers/net/wwan/t9xx/mtk_port_io.c b/drivers/net/wwan/t9xx/mtk_port_io.c
> new file mode 100644
> index 0000000000000..48fdadf96f00f
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_port_io.c
> @@ -0,0 +1,236 @@

[ ... ]

> +static void mtk_port_internal_enable(struct mtk_port *port)
> +{
> +	int ret;
> +
> +	if (test_bit(PORT_S_ENABLE, &port->status))
> +		return;
> +
> +	ret = mtk_port_ch_enable(port);
> +	if (ret && ret != -EBUSY) {

[ ... ]

> +	set_bit(PORT_S_WR, &port->status);
> +	set_bit(PORT_S_ENABLE, &port->status);
> +}
> +
> +static void mtk_port_internal_disable(struct mtk_port *port)
> +{

[ ... ]

> +	ret = mtk_port_ch_disable(port);
> +	/* -EBUSY is reported too: every queue has a single port, so a refused
> +	 * DISABLE means its user count was already zero.
> +	 */

[Severity: Low]
Does this comment match what mtk_ch_status_check() does? The DISABLE path
there is:

	case TRB_CMD_DISABLE:
		if (trans->usr_cnt[que->hif_id][que->txqno] > 0) {
			trans->usr_cnt[que->hif_id][que->txqno]--;
			if (!trans->usr_cnt[que->hif_id][que->txqno])
				break;
		}
		trb->status = -EBUSY;

So -EBUSY comes back in two cases: when the count was zero, and when the
count was decremented but is still above zero.

mtk_port_ch_enable() has its own comment about -EBUSY:

    /* -EBUSY means another user already owns the queue, and the
     * geometry it reports is that queue's - also valid here.
     */

This assumes a queue can have more than one owner, which conflicts with
the "single port" claim above. Following that comment,
mtk_port_internal_enable() treats an ENABLE that returns -EBUSY (usr_cnt
1->2) as success and sets PORT_S_WR and PORT_S_ENABLE.

The later DISABLE then takes usr_cnt from 2 to 1 and gets -EBUSY.
mtk_cldma_close() never runs, and the RX queue stays armed with rxq->arg
pointing at the port.

Even with one port per queue, a leftover count can come from either of
two failures:

- An ENABLE times out and the compensating mtk_port_ch_disable() fails in
  __dev_alloc_skb(). The ENABLE is still queued and later raises usr_cnt
  to 1.
- mtk_port_internal_disable() clears PORT_S_ENABLE, but the DISABLE skb
  cannot be allocated, so usr_cnt stays at 1.

If one owner per queue is meant to be an invariant, should an ENABLE that
returns -EBUSY be treated as success? If not, should this comment and the
one in mtk_port_ch_enable() be reconciled?

> +	if (ret)
> +		dev_warn(port->port_mngr->ctrl_blk->mdev->dev,
> +			 "Failed to disable channel for port(%s): %d\n",
> +			 port->info.name, ret);
> +}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-t9xx_driver_v1-v12-0-e181b616b820%40compal.com
