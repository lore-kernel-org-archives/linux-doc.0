Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDEC4C33D6
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578410; cv=none; b=pQQaNrKcNCXVmfnTIIueOSojRmiyb1tGGJycrfTb4xP6ScnI8LS4cY1TYErE+84PY+YOI1U9ym0tIhyu2ZTN7XodlbPfo+A7L5VZv0WtsCVW3DVnOt/Q7XZmqZ2BL0mdax5lpLT8LOcB7lMIIwJ0lH41xb/MZK8qVdjmbvuyLsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578410; c=relaxed/simple;
	bh=qfLN5WLAFy26QaPMK2Ae9ZgOW29L0epdNq5+HfGEGw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngqHHyOBup/5n4R+DYe3r5WazzSQktaBCPQcMnoy9EO93hPxiU6ibSioUIDF5Gd+kruIwdlHt9WAGM8E88/qWAXhHbEHC30eMKDsWSrXUwBAlPr5xMXejJoLa3nXwQIjixAj9T/OQRtb0sT7gKBRemT3nHG8mXZuciv8kMqmRyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF3Bp44b; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF3Bp44b"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-80a4e050a12so883109a34.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789578389; x=1790183189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0v/Glg/t1TxvoAL2KbqVzGsnLvj1ftPu+eZkPIP73o=;
        b=OF3Bp44bpUHGzhDGJCQyV5nTYALEW303eyPqI3c6y/9UORrFy3uH3WBx93s3iPRh4f
         /VNDTg4gBjm/ANrj0Sdt8DlgE2TRS1KVL/UV3tpzaf040HlsGm2KouRmnLXLLIeGG+GQ
         8FmtDK6WvW0sMMjfF52BJqspAkG3dmVX0JO8McYLdEOFOCnax0XgB0dyLVbGOCP6LL6Y
         wT1NZYvuE3deFY3Q57lx1syhNauHUYbGmuhVVUJYjmZ0Oq1t7kLkIYbJ/4+pXdB8TaL4
         PnX5HzxGxlcxnFMjl11Q+zWLNTnJu1iZRrOuhKek2zjB2/wkrbvpuVzBKq2uP7gZ923Q
         8x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578389; x=1790183189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0v/Glg/t1TxvoAL2KbqVzGsnLvj1ftPu+eZkPIP73o=;
        b=g5KpVvPlX2vKhOddzCNvaKobGRDxve4OVsKkEFCDCDKO4h8Hs3RrruXrE07ayvSZLC
         QoDybzP/8ByKv3Ue+iudwFPfpqcYpgTv1m5v+Hb5f1918olSZtpSIvKj2Al4B8irRZXM
         kLXIFL9b2bPFfAttIHqs9TTtpcj6Xlg/ufENxbs+DzXlSEXkHohwaiH7lMRS1UKyVniM
         3c+bYHNTMCMcyvO6Bw97NY4oocvRTyODCmWYJozryVaGfbC9w/H95AQydRtzm85GT+9V
         HkSYMDgoofogIjfoh4ntPrepIKIBotaaj4qtShABC8dr+e6C3hmaIEizu6czNEg4PUQS
         CCvw==
X-Forwarded-Encrypted: i=1; AKwUvByzFc7dPB+u8+/z7xpLd18yPJS4MGUFi9Fx4nLZwTwU9odlLHXmBSd6248yZ+5X8a3vW8HaGTx7xRg=@vger.kernel.org
X-Gm-Message-State: AFuF++mhT98GHpbroLupFl0Oc5vCpTsKdbk/uFVlpYrZkPc/BvlZRJK1
	xlktrsioAfaI97CuhsFfns0H+Gk2XLR2LuAdUfjnoF7COqxo/tE+VKfU
X-Gm-Gg: AYBFou0Bhcq13vHkj15IxSSKV/I8iLRMBDj0mTIj65Lr7p7ZozKKVQtZm5Hh/UyM2vX
	xgUNYPekQ+hT6RCHXJyXYB6OYQYoQYcwMHRr9Sr8PWnzL4b6MsZ2BzwRp0wUJpUEfKkk7aRah2S
	ZhfltIlV5e8BZS+TQIE22NqwOR5xnSlP4SlflltjQ92LPva8VdULR/IwFUMXnYn4uzBfXINExAn
	ZvBZ19JdRKYp3yJ6y4maad7sroqpSViTHNOBlt+711iGq2e7zhzJ6PBe7jFw873Q/RBEeUmZqW/
	q/+LCB90nARrZ/tGvqn6UGFO6MLOOr2P/S37j9ZA4dFWsKKp9WfkWdKkzHEbHDb/P9UR2uYnwls
	WX2w8hO7XyFKCJNw4BkCNonb6h5JA6PVt7LgQ4N+0o63VezLsOVjj4KlRmQ6/IT+W5OBFZ7SxvP
	13jAPTiT5I0EEQEN8ks8XQCwuqf8/RvsnHvZrfwm48P81jbUrnf5Xr3xwqcAho3J1dtyitJeHmb
	fVnrzFlEK/pLDMVYzfgt9WmIFqnQW0=
X-Received: by 2002:a05:6830:2705:b0:806:1e7:4167 with SMTP id 46e09a7af769-80b2da2b31fmr3730712a34.13.1789578388877;
        Wed, 16 Sep 2026 10:06:28 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:46::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80c46199e89sm362502a34.9.2026.09.16.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:06:28 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:06:24 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	sargun@sargun.me, jlinbox@meta.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 3/6] vsock/virtio: support guest device network
 namespace
Message-ID: <aqrMkHgwZdEz1dq+@devvm29614.prn0.facebook.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-3-9995383e9a8b@meta.com>
 <aqlkWGyoUYrgQUzz@sgarzare-redhat>
 <aqmLFzcF3MmwRITz@devvm29614.prn0.facebook.com>
 <aqqNZX0gk0I6AbVG@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqNZX0gk0I6AbVG@sgarzare-redhat>

On Wed, Sep 16, 2026 at 02:44:28PM +0200, Stefano Garzarella wrote:
> On Tue, Sep 15, 2026 at 11:14:47AM -0700, Bobby Eshleman wrote:
> > On Tue, Sep 15, 2026 at 05:47:02PM +0200, Stefano Garzarella wrote:
> > > On Wed, Sep 02, 2026 at 04:00:49PM -0700, Bobby Eshleman wrote:
> > > > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > > >
> > > > virtio-vsock did not have namespace support (the device was always
> > > > accessible to any global namespace).
> > > >
> > > > Make the virtio-vsock device assignable to a namespace and initialize it
> > > > to init_net. Because virtio-vsock and init_net are both hardcoded to
> > > > global mode, nothing changes until the assign ioctl is issued.
> > > >
> > > > When the device's local-mode namespace is being destroyed, received
> > > > packets are reset until new valid a namespace has been assigned and/or
> > > > automatically returned to, and the next RX batch begins (in
> > > > virtio_transport_rx_work). They are reset rather than dropped because
> > > > vsock does not retransmit, so a silent drop would leave the host waiting
> > > > for a timeout, and a connection request arriving in that window has no
> > > > socket whose teardown would tell it otherwise. This requires making
> > > > virtio_transport_reset_no_sock() available outside of the common code.
> > > >
> > > > When a device is assigned to a namespace, every already established
> > > > vsock socket that is no longer able to reach the device is forcibly
> > > > reset. For that reason, adding new sockets to the connected table must
> > > > be performed atomically with regards to namespace assignment. This
> > > > ensures that when the socket is added to the connected table that it
> > > > actually passes the new reachability conditions set by ns assignment. If
> > > > it wins the race to the table and does NOT pass the reachability tests,
> > > > then the reset sweep will correctly catch it. This is the purpose
> > > > of the new helper 'vsock_maybe_set_connected()'.
> > > >
> > > > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > > > ---
> > > > include/linux/virtio_vsock.h            |  2 ++
> > > > net/vmw_vsock/virtio_transport.c        | 28 ++++++++++++++++++++++------
> > > > net/vmw_vsock/virtio_transport_common.c | 28 +++++++++++++++++++++-------
> > > > 3 files changed, 45 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> > > > index f91704731057..9c68ce1d7fb4 100644
> > > > --- a/include/linux/virtio_vsock.h
> > > > +++ b/include/linux/virtio_vsock.h
> > > > @@ -286,6 +286,8 @@ void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct sk_buff *
> > > > u32 virtio_transport_get_credit(struct virtio_vsock_sock *vvs, u32 wanted);
> > > > void virtio_transport_put_credit(struct virtio_vsock_sock *vvs, u32 credit);
> > > > void virtio_transport_deliver_tap_pkt(struct sk_buff *skb);
> > > > +int virtio_transport_reset_no_sock(const struct virtio_transport *t,
> > > > +				   struct sk_buff *skb, struct net *net);
> > > > int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *list);
> > > > int virtio_transport_read_skb(struct vsock_sock *vsk, skb_read_actor_t read_actor);
> > > > int virtio_transport_notify_set_rcvlowat(struct vsock_sock *vsk, int val);
> > > > diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> > > > index 4f9aa9c4c3aa..a453a4f828dc 100644
> > > > --- a/net/vmw_vsock/virtio_transport.c
> > > > +++ b/net/vmw_vsock/virtio_transport.c
> > > > @@ -540,9 +540,14 @@ static bool virtio_transport_msgzerocopy_allow(void)
> > > > 	return true;
> > > > }
> > > >
> > > > +static bool virtio_transport_netns_assign_allow(void)
> > > > +{
> > > > +	return true;
> > > > +}
> > > > +
> > > > bool virtio_transport_stream_allow(struct vsock_sock *vsk, u32 cid, u32 port)
> > > > {
> > > > -	return vsock_net_mode_global(vsk);
> > > > +	return vsock_g2h_net_reachable(sock_net(sk_vsock(vsk)));
> > > > }
> > > >
> > > > static bool virtio_transport_seqpacket_allow(struct vsock_sock *vsk,
> > > > @@ -587,6 +592,7 @@ static struct virtio_transport virtio_transport = {
> > > > 		.seqpacket_has_data       = virtio_transport_seqpacket_has_data,
> > > >
> > > > 		.msgzerocopy_allow        = virtio_transport_msgzerocopy_allow,
> > > > +		.netns_assign_allow       = virtio_transport_netns_assign_allow,
> > > >
> > > > 		.notify_poll_in           = virtio_transport_notify_poll_in,
> > > > 		.notify_poll_out          = virtio_transport_notify_poll_out,
> > > > @@ -616,7 +622,7 @@ virtio_transport_seqpacket_allow(struct vsock_sock *vsk, u32 remote_cid)
> > > > 	struct virtio_vsock *vsock;
> > > > 	bool seqpacket_allow;
> > > >
> > > > -	if (!vsock_net_mode_global(vsk))
> > > > +	if (!vsock_g2h_net_reachable(sock_net(sk_vsock(vsk))))
> > > > 		return false;
> > > >
> > > > 	seqpacket_allow = false;
> > > > @@ -634,6 +640,9 @@ static void virtio_transport_rx_work(struct work_struct *work)
> > > > 	struct virtio_vsock *vsock =
> > > > 		container_of(work, struct virtio_vsock, rx_work);
> > > > 	struct virtqueue *vq;
> > > > +	struct net *net;
> > > > +
> > > > +	net = vsock_g2h_net_get();
> > > >
> > > > 	mutex_lock(&vsock->rx_lock);
> > > >
> > > > @@ -682,10 +691,14 @@ static void virtio_transport_rx_work(struct work_struct *work)
> > > >
> > > > 			virtio_transport_deliver_tap_pkt(skb);
> > > >
> > > > -			/* Force virtio-transport into global mode since it
> > > > -			 * does not yet support local-mode namespacing.
> > > > -			 */
> > > > -			virtio_transport_recv_pkt(&virtio_transport, skb, NULL);
> > > > +			if (unlikely(!net)) {
> > > > +				virtio_transport_reset_no_sock(
> > > > +					&virtio_transport, skb, &init_net);
> > > 
> > > Why init_net?
> > 
> > This parameter is actually unused by virtio_transport_reset_no_sock(),
> > its call to virtio_transport_send_pkt(), and even the eventual call to
> > virtio_transport_deliver_tap_pkt()... so maybe NULL w/ a comment would
> > be better?
> 
> mmm, should we remove that parameter if unused?

Sadly the vhost path uses it for its vhost_vsock lookup by CID. I guess
it would be needed by g2h too if it had multiple devices and had to
lookup by net+CID.

> 
> Anyway, not in this series/patch.
> 
> Here, anything is fine, just put a comment with the reason.


Sounds good!

Thanks,
Bobby
