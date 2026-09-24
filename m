Received: from mail-oi2-f30.google.com (mail-oi2-f30.google.com [74.125.231.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE0F3254B8
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 01:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212570; cv=none; b=VW/WbqLk7PfL6ITCTtlYJTQlobSivz7D8xx9ljnTlAOu9GOYJu2L/gpZbrCWzYN6QPUZWI7DWlv9faEWPgAtpFc/kMrvDLSCqjm3IfJR739BnW574zpxFrPPoK/heX7YWPWSZsXzKy3ZgTzxNH7ISy9iGYWwEMD3u+Mr9pwAe98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212570; c=relaxed/simple;
	bh=4SIYkgQCQOpITa0bcUW19IECLGTFeX8wLf4f59bJIhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJdV+GD5fKlHUiw5+JFfGoPl/iM0Zk0tBHtlKS5SuMlFY+ujfMW2mbIfDUSvG7aB5OfcOFdIcfap1VH0EBrhitLc4PteKAuBZAyKYSWOON/AoGc0TfMDtc07hf2kn61Hf4rHFBn8e8bU2y4d7Z3b31y453OsjvwjLUgqoGE0SXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfZ4JxR4; arc=none smtp.client-ip=74.125.231.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfZ4JxR4"
Received: by mail-oi2-f30.google.com with SMTP id 46e09a7af769-8144632e066so942537a34.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 18:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790212566; x=1790817366; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWkVj5/LjUynqv+OuWYmBwqXbaEfDFo8bWRWU2EXBmk=;
        b=TfZ4JxR4XDRrLzGgrfVzZ2bmEFRqRT2e8h++LIbNG7uoJNWMsLcUFuvtCnJ3fN+zct
         /ZTosZm8R2kkjTbEDeFXN9Zq/Fi7ejrv1qMTpxRT8f24P+sVq64AjFYoLJ4FAdWCGkvz
         2eijh529VlCq/wa9RZ0icwTsALbk9JCzEFWaJ6tOu1cCq8Al/PVL8cyuYbdVXkS6mMG0
         8ocT7E0DM12x+wSL9WiXS7fXCwQN4blxPK+nZwmxaUdwhWYrX3QWBtn0oHeieOvGHvkr
         ASn+/yHP2WYNthe05RANgIesHK7whTBbQYcQm93/uDMpt96QU/B6LCuGYyTlrS57teby
         iNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790212566; x=1790817366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LWkVj5/LjUynqv+OuWYmBwqXbaEfDFo8bWRWU2EXBmk=;
        b=grNmu0vDbsKYvszk8m4jKeLUVfvj+Qt78pwwRy+WC2et8aIV6Iji0pF8s6EXNMJrsW
         ckt4QEuXVFTT/cPdrsdQQqQYhgYfuLkydZBcBverhg8MUtatJW2CLV0D0NSUkmv/4Udv
         Yf57sogrpULffl5ncMsbu2EGMl1PSlC7/dpifR95RlsPEDlfPaS9TzwYNXjb9lxgyxYM
         yBXxPee46hFjBMlPvgChuia3YTDc165Idr8ktrXKPP7oF9x1a45WHBRwoHUGLG0zeNAw
         BrGRZa/fXHiwFWybemHlLJaetX7xufWdeBELaE4r/w8TI1KkChQLKlDaKCzE3goACyZX
         ieiw==
X-Forwarded-Encrypted: i=1; AKwUvByZj0Ayw2nr0OW6RC3OmYVwTVoRokcSmdzoLLTAE9h3D7NGRUPI5UwijXz0ZTCA62nMo3p+KugUcQk=@vger.kernel.org
X-Gm-Message-State: AFuF++nOR+gbz117Uj6i6pMoPVrUNHyPYQKV769i36j1L1ro2VmpacR4
	SFezALaHY5OTdx2f4J+WJHQaYuOx9X8QWgHPqxyeODZglXn2b3GVQDYD
X-Gm-Gg: AYBFou12OkDYYz/vfy8JQbU4d4K7QkTg4dI5URafwxVhdbqorqyoxvYzG6/RqAaxBqB
	inpVIyj8C78/yJr8godSOL8Uxo6siXv6amHkJNx5v4fqD+ohQhw2vk+SsZfDSnzEATibvTL94ky
	07K5NiOZn/+Wj48ehRx8aAruhuZbxu3EerwzKlSiuTG0tU6m+A3H1DD9Bo0JqRqAgnB3ms0EzpY
	0PFlnd27Hs1JmtC0Quq6qJ+PkeTMvQY/4mG327l88mxRE2rLayOFYAoSAJLrdfLtOVXSJWbh+HL
	021nfgO66Vk+ClPZOXYy4PgWldpdVmkoj0+lszzhd47mhFeQLkHKpW3G96B3yFEyvfYZ7BSKM9e
	tR2jeuyPdbgpjcT07a8M1pnV+f2iAU8TGAdzNex3K+5+C438WBQ1HAKT2/fJW0L28r1MjJKVAW+
	krIGMI9aOpOkvkBnCYQOQPky/Pw5ae16Ut6dDGY6V52KagM2il5hV0c2KADTlW0Nm2ZnYCT7LbE
	SIKgWVJuhY3EfSdWwXIy3EHYAc7zD4=
X-Received: by 2002:a05:6830:258a:b0:80a:45e1:7677 with SMTP id 46e09a7af769-81782886e1fmr1135100a34.23.1790212566390;
        Wed, 23 Sep 2026 18:16:06 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:5f::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc79cesm4791338a34.10.2026.09.23.18.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:16:04 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:16:01 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: sgarzare@redhat.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, stefanha@redhat.com,
	mst@redhat.com, jasowangio@gmail.com, xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com, shuah@kernel.org, rdunlap@infradead.org,
	donald.hunter@gmail.com, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com,
	sdf.kernel@gmail.com, bobbyeshleman@meta.com
Subject: Re: [PATCH net-next v2 4/6] vsock/virtio: support guest device
 network namespace
Message-ID: <arR50ZYHZGsj9yy2@devvm29614.prn0.facebook.com>
References: <20260921-vsock-guest-ns-v2-4-693bd78fde9e@meta.com>
 <179019126374.2160803.9294641399796135651@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179019126374.2160803.9294641399796135651@kernel.org>

On Wed, Sep 23, 2026 at 07:21:03PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] virtio_transport_rx_work() samples the g2h namespace once per
>   work invocation (`net = vsock_g2h_net_get()` at…
> - [Medium] By setting `.netns_assign_allow = true` and `.reset =
>   virtio_transport_reset` (net/vmw_vsock/virtio_transport.c:590-591)…
> - [Low] virtio_transport_reset_no_sock() is promoted to an exported
>   cross-module API (declared in include/linux/virtio_vsock.h,…
> 
> --
> 
> vsock/virtio: support guest device network namespace
> 
> This makes the virtio-vsock guest device assignable to a network namespace
> and initializes it to init_net.  The RX work now looks up the currently
> assigned namespace and resets received packets while no valid namespace is
> available, and new connected sockets are inserted via the new
> vsock_maybe_set_connected() helper so insertion is atomic with respect to
> namespace assignment.
> 
> A few questions below.
> 
> > diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> > index f91704731057e..5d15b6d6bdf7f 100644
> > --- a/include/linux/virtio_vsock.h
> > +++ b/include/linux/virtio_vsock.h
> > @@ -286,6 +286,9 @@ void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct sk_buff *
> >  u32 virtio_transport_get_credit(struct virtio_vsock_sock *vvs, u32 wanted);
> >  void virtio_transport_put_credit(struct virtio_vsock_sock *vvs, u32 credit);
> >  void virtio_transport_deliver_tap_pkt(struct sk_buff *skb);
> > +int virtio_transport_reset(struct vsock_sock *vsk, struct sk_buff *skb);
> > +int virtio_transport_reset_no_sock(const struct virtio_transport *t,
> > +				   struct sk_buff *skb, struct net *net);
> >  int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *list);
> >  int virtio_transport_read_skb(struct vsock_sock *vsk, skb_read_actor_t read_actor);
> >  int virtio_transport_notify_set_rcvlowat(struct vsock_sock *vsk, int val);
> > diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> > index 4f9aa9c4c3aa5..5ad93af4bd2b1 100644
> > --- a/net/vmw_vsock/virtio_transport.c
> > +++ b/net/vmw_vsock/virtio_transport.c
> 
> [ ... ]
> 
> > @@ -587,6 +587,8 @@ static struct virtio_transport virtio_transport = {
> >  		.seqpacket_has_data       = virtio_transport_seqpacket_has_data,
> >  
> >  		.msgzerocopy_allow        = virtio_transport_msgzerocopy_allow,
> > +		.netns_assign_allow       = true,
> > +		.reset                    = virtio_transport_reset,
> 
> [Severity: Medium]
> 
> Setting .netns_assign_allow = true makes vsock_netns_assignable() true for
> the g2h transport, which activates the reset sweep in
> vsock_g2h_reset_unreachable().  That sweep calls t->reset() while holding
> only vsock_register_mutex and a socket reference, never lock_sock(sk):
> 
> net/vmw_vsock/af_vsock.c:vsock_g2h_reset_unreachable() {
> 	...
> 		sk->sk_state = TCP_CLOSE;
> 		sk->sk_err = ECONNRESET;
> 		sk_error_report(sk);
> 	...
> 	list_for_each_entry_safe(vsk, tmp, &reset_list, pending_reset) {
> 		list_del_init(&vsk->pending_reset);
> 		t->reset(vsk, NULL);
> 	...
> }

Actually, lock_sock() after register mutex can deadlock on the
virtio_transport_recv_listen() path where the lock order is the exact
opposite, why I did not do this.

We might be able to lift the reset_list into vsock_g2h_net_assign, and
then lock_sock() after releasing the register mutex. Will have to
further evaluate...

> 
> virtio_transport_reset() -> virtio_transport_send_pkt_info() addresses the
> RST straight out of the socket:
> 
> 	if (!info->remote_cid) {
> 		dst_cid	= vsk->remote_addr.svm_cid;
> 		dst_port = vsk->remote_addr.svm_port;
> 
> Those fields are normally only stable under lock_sock(sk).
> 
> The sk_error_report() above wakes a blocking connect(), which then runs:
> 
> net/vmw_vsock/af_vsock.c:vsock_connect() {
> 	err = sock_error(sk);
> 	if (err) {
> 		sk->sk_state = TCP_CLOSE;
> 		sock->state = SS_UNCONNECTED;
> 	}
> }
> 
> and returns -ECONNRESET.  If userspace retries connect() immediately, the
> 
> 	memcpy(&vsk->remote_addr, remote_addr,
> 	       sizeof(vsk->remote_addr));
> 
> in vsock_connect() runs before vsock_assign_transport() blocks on
> vsock_register_mutex, so it is not serialized against the sweep that is
> still walking reset_list.
> 
> Can the sweep then read the freshly overwritten remote_addr and send the
> RST to the new destination, so the actual peer of the connection that was
> just torn down never gets a reset and waits for a timeout instead?
> 
> >  
> >  		.notify_poll_in           = virtio_transport_notify_poll_in,
> >  		.notify_poll_out          = virtio_transport_notify_poll_out,
> 
> [ ... ]
> 
> > @@ -633,7 +635,11 @@ static void virtio_transport_rx_work(struct work_struct *work)
> >  {
> >  	struct virtio_vsock *vsock =
> >  		container_of(work, struct virtio_vsock, rx_work);
> > +	struct virtio_transport *t = &virtio_transport;
> >  	struct virtqueue *vq;
> > +	struct net *net;
> > +
> > +	net = vsock_g2h_net_get();
> >  
> >  	mutex_lock(&vsock->rx_lock);
> >  
> > @@ -682,10 +688,14 @@ static void virtio_transport_rx_work(struct work_struct *work)
> >  
> >  			virtio_transport_deliver_tap_pkt(skb);
> >  
> > -			/* Force virtio-transport into global mode since it
> > -			 * does not yet support local-mode namespacing.
> > -			 */
> > -			virtio_transport_recv_pkt(&virtio_transport, skb, NULL);
> > +			/* The virtio send path does not use @net. */
> > +			if (unlikely(!net)) {
> > +				virtio_transport_reset_no_sock(t, skb, NULL);
> > +				kfree_skb(skb);
> > +				continue;
> > +			}
> > +
> > +			virtio_transport_recv_pkt(t, skb, net);
> 
> [Severity: Medium]
> 
> The namespace is sampled once per work invocation and then pinned with a
> hard reference for the whole drain loop:
> 
> 	net = vsock_g2h_net_get();
> 	...
> 	do {
> 		...
> 			virtio_transport_recv_pkt(t, skb, net);
> 	} while (!virtqueue_enable_cb(vq));
> 
> Meanwhile the assign path publishes the new namespace and then sweeps the
> connected table:
> 
> net/vmw_vsock/af_vsock.c:vsock_g2h_net_assign() {
> 	...
> 	rcu_assign_pointer(vsock_g2h_net, net);
> 	vsock_g2h_reset_unreachable(transport_g2h);
> 	...
> }
> 
> As soon as the new pointer is published, a connect() from the newly
> assigned namespace is permitted, because vsock_assign_transport() consults
> vsock_g2h_net_reachable() which already reads it.  If the host RESPONSE for
> that connection is drained by the batch still holding the previous
> namespace, vsock_find_connected_socket_net(&src, &dst, net) does not find
> the socket (vsock_net_check_mode() of the local-mode new net against the
> old net is false), so virtio_transport_recv_pkt() falls into
> 
> 	(void)virtio_transport_reset_no_sock(t, skb, net);
> 
> and the just-established connection is reset.  Is that acceptable for the
> remainder of an in-flight batch, or should the namespace be re-read per
> packet?
> 
> In the other direction, between the rcu_assign_pointer() above and the
> per-socket store in vsock_g2h_reset_unreachable():
> 
> 		sk->sk_state = TCP_CLOSE;
> 		sk->sk_err = ECONNRESET;
> 
> can the in-flight batch still resolve packets against the old namespace and
> deliver payload plus credit updates into sockets that the device no longer
> belongs to?
> 
> The commit message describes the batch granularity only for the dying
> namespace case:
> 
>   "received packets are reset until a new valid namespace has been assigned
>    and/or automatically returned to, and the next RX batch begins"
> 
> Should it also describe what happens to packets of the newly assigned
> namespace while an older batch is still draining?
> 
> >  		}
> >  	} while (!virtqueue_enable_cb(vq));
> >  
> 
> [ ... ]
> 
> > diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> > index f225f53ed4bab..c24049b2a3866 100644
> > --- a/net/vmw_vsock/virtio_transport_common.c
> > +++ b/net/vmw_vsock/virtio_transport_common.c
> 
> [ ... ]
> 
> > @@ -1315,8 +1315,8 @@ static int virtio_transport_reset(struct vsock_sock *vsk,
> >   * loopback, this is the namespace of the socket. For vhost, this is the
> >   * namespace of the VM (i.e., vhost_vsock).
> >   */
> > -static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
> > -					  struct sk_buff *skb, struct net *net)
> > +int virtio_transport_reset_no_sock(const struct virtio_transport *t,
> > +				   struct sk_buff *skb, struct net *net)

will fix. might have to grab a reference for every pkt, which I was
trying to avoid.

> 
> [Severity: Low]
> 
> This isn't a bug, but the comment above still enumerates only the loopback
> and vhost meanings of @net, while the helper is now exported via
> include/linux/virtio_vsock.h and the new caller in
> virtio_transport_rx_work() passes NULL.  Whether NULL is fine depends on
> the ->send_pkt behind @t: virtio_transport_send_pkt() ignores @net, and
> vhost_transport_send_pkt() passes it to vhost_vsock_get() ->
> vsock_net_check_mode(), which treats NULL as VSOCK_NET_MODE_GLOBAL.  Could
> the comment be extended to say that NULL is permitted and what it means?
> 
> >  {
> >  	struct virtio_vsock_hdr *hdr = virtio_vsock_hdr(skb);
> >  	struct virtio_vsock_pkt_info info = {
> > @@ -1355,6 +1355,7 @@ static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
> >  
> >  	return t->send_pkt(reply, net);
> >  }
> > +EXPORT_SYMBOL_GPL(virtio_transport_reset_no_sock);
> 
> [ ... ]


will correct.
