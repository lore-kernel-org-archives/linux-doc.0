Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712963;
	b=NCQVmpZSPNUu4KGosoWlDh0RFynA8ExhhhVF2XoSy7OLvlPdtX0i6Rn2k5WhiRrdfra5
	 rSOESwTwU6/qatGE/C8lUtr0bKIZjgasWqWqE+XTP4VI3LEwCwmmJINE+LFmY2yHXwZ4g
	 EfrPNJrrr3IYIiK5J8VQBTBTh+BZM8EVYBdFQgFagq7Cwh4bwY8d8PovseXVrS1k+pjLX
	 DN2hysHs9ACjydxmmcU5aBSRm55MM7zqw/Ny7MWyokSvQnMjWvYQ4dZQ4SCUj+S4KH1Q0
	 CqYr2NiqD40rFw3keCS0tk4SLuQijN6gZOM7DeA904+x8prWCMa4+zTwlpLVUS0KDHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712963;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0j3943NrJYq6S/iYS9qFkZ6JQ/im3sXbK5fY5UClmLY=;
	b=V3GZQJN0GEj1Sa+0IEV9+DTGIpefgtZkd6Dax21UYA6hJjdqLbcPUXhlaUghpUjgQHLI
	 hYsbKFTnqunCOfxC0I+/AzXRa9Pe5bJO4I29U8y8gJVOO8x2vvBnV3+pJP/z0lH0LC4ck
	 L1hPHzwxeTopuDunMY2i/2YPbkVK0wOtOP4aj/ogMrWVP8ARZJm72QjznBVMkNXX9Mln8
	 y59WxqsdTztX4xx1VbqAVmS1hRP4hAuCqI1/E1s4UbaVPwOcN0OKvRtu7juEks4i8TQDI
	 jwuorIutUnwpXDBJs5WT/SUEGv/Qj/0afW08OChH61UrK/s+sq81Czn8iuJdj//FDUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FnML46z1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E2HTHYOg;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A3606A31E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 17:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FnML46z1;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E2HTHYOg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795712962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0j3943NrJYq6S/iYS9qFkZ6JQ/im3sXbK5fY5UClmLY=;
	b=FnML46z1aKTU851FRljT9jbreBq/r0otgjSuzrG9UzeVKalrUvdilILaCp0+AXV/dsZsQn
	XHYOTYka6ePHqawDF0hSkcAVqJVpd6Xgfb0E3zA+89XESBGSnVqBPOJ9cSMCAIRtb4tQbk
	od9mUfpu+Im94SnSTukCXX+5vSR5pKg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-yQ_hELCUN-CMjMqfF5qCFA-1; Thu, 26 Nov 2026 17:09:20 +0000
X-MC-Unique: yQ_hELCUN-CMjMqfF5qCFA-1
X-Mimecast-MFC-AGG-ID: yQ_hELCUN-CMjMqfF5qCFA_1795712959
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so60122265e9.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 09:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795712959; x=1796317759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0j3943NrJYq6S/iYS9qFkZ6JQ/im3sXbK5fY5UClmLY=;
        b=E2HTHYOgas0DAMS+DYtcR0451sZQR4i3/+LyLr9K5i+THsZ6rTj6Y20+KA5kiZY6FR
         9XpxrIW/TbyTlPLthWkzmog07jpfx2KK0boMtdJGl+Ra2KRxupEQGTAJ0nQc1pg+FyMJ
         PJp3D8hc90XBeYfYM8vaZDulUADEDU98pcVKwfDdQGGemfL/gMLxzIOZFftR1347E/Yi
         wcfULIk5CImOH6nuldSqCYXBipUtW/ib9jMg/+cFNKkaqCRft9K2oh94XbseKQ/AtBb0
         0wS86dh/ruQTFUobywOv2Nu7ARqOyHT0Hpq8m11/SYQ8fFC4d0OhClGx2o6MagZHTjPY
         Ishw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712959; x=1796317759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0j3943NrJYq6S/iYS9qFkZ6JQ/im3sXbK5fY5UClmLY=;
        b=nT7SzIFJOd8tNJx+ZU2EJG2EC2tQ9MgWhBxSVqhxJBAOLFuATZypNulI1kvpTQdHtp
         PO3Wl72SrNe1/4RGT0KJN0JWwqyKAvfEqCbkx60y/GlrIk1vH4KjHrmjaOhmAFqFhIK9
         H/8Mov5aCNr7Ov4SOy6N6DelPCo5/+Zm6KL4zMw8KRuZ9E5cWH5AY5qI3QBzDXEFeZG5
         RyuzE5r0B9ObfKHS3Jr2PoMnOWsseWp4tsvUHwr/+oc253GB++6txdDmeYxeVSedVtKZ
         XQRkHgvbL7dqcc6/CfugRmYkGpnJu78x/5yGaSqrLki2SqDOcKR35V7RKA5+jJYaqvWN
         KB5A==
X-Forwarded-Encrypted: i=1; AL+hErGBWX8WZVRGEPUZOgFJ8eq/bmqlCmohxz1exmVCfiuE9JeISo61xcZ7mMxgE74RQi1nUGD9IRoqimA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uJJz1K8iCBkJUip6CcZgK5av7m1w4NI4tW/VnxGUD/+TQ00le
	v+CBzJce4QsE4gqEA14XDOjCFAw1DsfM/7aenw0rMAAfLnU5SfGEz0JYRJ3UT+xVMYa+70p/PLx
	eoNYVUXtfJXc5K2pyWa0KRjUnXdF/JIxfgM5ZtukWNzCoKHLD9JUeyQ8HgInH2Q==
X-Gm-Gg: AZFdTZdHszM2jU/bVNmzlb6yjg1ilYA/rmq8cFSBqmqHPQxHAQdgP2ILUtElnIu1rzB
	Pa7YyUSoTKpmSc7JFNsTN4m0iDvoSTAH2cPSdAg+KdBgqyBMR+d0WCb3MiDSD0PFJturTJbicne
	e/sEdQDBFrwug54sF1fqL+5UGqlMaf5xLHNLoA17/TK02A6bCJmszJw5Gjf7qyj6p4ZNf6rNvdc
	sCZpbnoIVjzhYpt8vHuKjyfd4hfLBwR10yyxn8f2o8HC2DEwA5dGjsbm5grk+kEsY9E7DrotGIt
	SIbMoA8N16bFXWq1Dmu0pxrIvOXgAgMrj+LoV+Fck8NnGzPbp1SeRq3sP38wIFazhH0+k/RGwWa
	ssyitTMj7i8jdnMJ71/iiKd3hrmg2Q+O/eGG/La4LhvLyVo9xlANA/Q==
X-Received: by 2002:a05:600c:64c8:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb88819be1mr412484555e9.16.1795712959010;
        Thu, 26 Nov 2026 09:09:19 -0800 (PST)
X-Received: by 2002:a05:600c:64c8:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb88819be1mr412483085e9.16.1795712957967;
        Thu, 26 Nov 2026 09:09:17 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39471009f8f.34.2026.11.26.09.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:09:17 -0800 (PST)
Date: Thu, 26 Nov 2026 18:09:14 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, bpf@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Sashiko AI bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v4 4/8] vsock/virtio: negotiate datagram support on
 the guest
Message-ID: <awg9rYcvF-Vw4_f5@sgarzare-redhat>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
 <20261124-vsock-dgram-support-v4-4-3607484e85e8@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261124-vsock-dgram-support-v4-4-3607484e85e8@redhat.com>

On Tue, Nov 24, 2026 at 01:20:22PM +0100, Sergio Lopez wrote:
>Advertise VIRTIO_VSOCK_F_DGRAM and record whether the device
>negotiated it. Gate datagram socket initialization and destination
>checks on the negotiated feature and the transport's supported network
>namespace mode.
>
>Perform device capability checks at socket creation without requiring
>a remote address, which is not yet known for an unconnected datagram
>socket. The common virtio implementation provides the datagram data
>path.
>
>Discard received datagrams when the device has not negotiated support,
>including when a socket was initialized through another transport.
>Reject packets addressed to a different CID using the full 64-bit wire
>value before bound-socket lookup narrows it or matches a wildcard.
>
>Signed-off-by: Sergio Lopez <slp@redhat.com>
>---
> net/vmw_vsock/virtio_transport.c | 50 +++++++++++++++++++++++++++++++++++++---
> 1 file changed, 47 insertions(+), 3 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>index 4f9aa9c4c3aa..fd10f20d7611 100644
>--- a/net/vmw_vsock/virtio_transport.c
>+++ b/net/vmw_vsock/virtio_transport.c
>@@ -57,6 +57,7 @@ struct virtio_vsock {
>
> 	u32 guest_cid;
> 	bool seqpacket_allow;
>+	bool dgram_allow;
>
> 	/* These fields are used only in tx path in function
> 	 * 'virtio_transport_send_pkt_work()', so to save
>@@ -547,6 +548,18 @@ bool virtio_transport_stream_allow(struct vsock_sock *vsk, u32 cid, u32 port)
>
> static bool virtio_transport_seqpacket_allow(struct vsock_sock *vsk,
> 					     u32 remote_cid);
>+static bool virtio_transport_dgram_allow_check(struct vsock_sock *vsk,
>+					       u32 cid, u32 port);
>+
>+static int virtio_transport_socket_init(struct vsock_sock *vsk,
>+					struct vsock_sock *psk)
>+{
>+	if (sk_vsock(vsk)->sk_type == SOCK_DGRAM &&
>+	    !virtio_transport_dgram_allow_check(vsk, 0, 0))
>+		return -ESOCKTNOSUPPORT;
>+
>+	return virtio_transport_do_socket_init(vsk, psk);
>+}
>
> static bool virtio_transport_has_remote_cid(struct vsock_sock *vsk, u32 cid)
> {
>@@ -561,7 +574,7 @@ static struct virtio_transport virtio_transport = {
> 		.get_local_cid            = virtio_transport_get_local_cid,
> 		.has_remote_cid           = virtio_transport_has_remote_cid,
>
>-		.init                     = virtio_transport_do_socket_init,
>+		.init                     = virtio_transport_socket_init,
> 		.destruct                 = virtio_transport_destruct,
> 		.release                  = virtio_transport_release,
> 		.connect                  = virtio_transport_connect,
>@@ -571,7 +584,7 @@ static struct virtio_transport virtio_transport = {
> 		.dgram_bind               = virtio_transport_dgram_bind,
> 		.dgram_dequeue            = virtio_transport_dgram_dequeue,
> 		.dgram_enqueue            = virtio_transport_dgram_enqueue,
>-		.dgram_allow              = virtio_transport_dgram_allow,
>+		.dgram_allow              = virtio_transport_dgram_allow_check,

IMO we should remove virtio_transport_dgram_allow() and implement it in 
every virtio transport.

>
> 		.stream_dequeue           = virtio_transport_stream_dequeue,
> 		.stream_enqueue           = virtio_transport_stream_enqueue,
>@@ -629,6 +642,25 @@ virtio_transport_seqpacket_allow(struct vsock_sock *vsk, u32 remote_cid)
> 	return seqpacket_allow;
> }
>
>+static bool
>+virtio_transport_dgram_allow_check(struct vsock_sock *vsk, u32 cid, u32 port)
>+{
>+	struct virtio_vsock *vsock;
>+	bool dgram_allow;
>+
>+	if (!vsock_net_mode_global(vsk))
>+		return false;
>+
>+	dgram_allow = false;
>+	rcu_read_lock();
>+	vsock = rcu_dereference(the_virtio_vsock);
>+	if (vsock)
>+		dgram_allow = vsock->dgram_allow;
>+	rcu_read_unlock();
>+
>+	return dgram_allow;
>+}
>+
> static void virtio_transport_rx_work(struct work_struct *work)
> {
> 	struct virtio_vsock *vsock =
>@@ -677,6 +709,14 @@ static void virtio_transport_rx_work(struct work_struct *work)
> 				continue;
> 			}
>
>+			/* Check the full wire CID before socket lookup truncates it. */
>+			if (le16_to_cpu(hdr->type) == VIRTIO_VSOCK_TYPE_DGRAM &&

Why only for DGRAM? What issues are we fixing?

>+			    (!vsock->dgram_allow ||
>+			     le64_to_cpu(hdr->dst_cid) != vsock->guest_cid)) {
>+				kfree_skb(skb);
>+				continue;
>+			}
>+
> 			if (payload_len)
> 				virtio_vsock_skb_put(skb, payload_len);
>
>@@ -835,6 +875,9 @@ static int virtio_vsock_probe(struct virtio_device *vdev)
> 	if (virtio_has_feature(vdev, VIRTIO_VSOCK_F_SEQPACKET))
> 		vsock->seqpacket_allow = true;
>
>+	if (virtio_has_feature(vdev, VIRTIO_VSOCK_F_DGRAM))
>+		vsock->dgram_allow = true;
>+
> 	vdev->priv = vsock;
>
> 	ret = virtio_vsock_vqs_init(vsock);
>@@ -932,7 +975,8 @@ static struct virtio_device_id id_table[] = {
> };
>
> static unsigned int features[] = {
>-	VIRTIO_VSOCK_F_SEQPACKET
>+	VIRTIO_VSOCK_F_SEQPACKET,
>+	VIRTIO_VSOCK_F_DGRAM,

BTW I'm confused about the order of patches. The previous patch enables 
dgram unconditionally, here we are checking the feature. IMO we should 
first have patches to implement everything, just at end enables it.

Thanks,
Stefano

