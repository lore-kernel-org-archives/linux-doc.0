Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574201;
	b=HbP5b74zOlelx3Pjf5UTeU9CpODqXRc0bJHfttup6ppG257siPstw0CUHmqAbuFGdZp2
	 NQZiSYWCjlCAyE8lwe1od7sDqseSDA79SePLOgzN1Zj1yWih1noQ/pM9SbWAK1U3TR7Ow
	 hzd9Mo6NIOtsP2anqHwx8zPaHOcmoRHUxnvTSVdICG48F1BrLniya1XdbX3pP6a2JDSTY
	 CKabNXtj+PdsnRV7I1fYtQSoG1IBsGO3LlyrjcdiJonT2Qk3D5VPee1DFtmekP2bjkoR/
	 c97Rs/sE04gLEu42RWRVFxI7CFAJRtlVoArBT2fSg9dOlh1bVZQlxcET8iK3xuIzS8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574201;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
	b=NRLmsvxswJFqIjdFYKzLI7++Fs7PgJUulUzzPD1SArAYtcj7gr7+uJn7dFDDd747rNx5
	 7HNLvacLZcjt2DvLJxq3x2M9hg6CWzEsLm9NPQfSmg85eUvDd9KojYszbT7RLkpRaJKnC
	 Sszo2kybp0BnHlh45n60bE+c0WCSkFz/KM87bqSzikClcOQb9hJ2MuLNISKVwDS1W/v12
	 ZtRd7Hkv2VGe9NLOW/MVyZJSUVDVTfr+j1UVwV+xtYEF3r1+ic56UGrRNibLrIcBy5jRb
	 Ii5UzojUEzbOSBkJJJn18meYEY34nHqk8sb03wWaAAHi1wDT437NO79InN8FPH0pFSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzzhFIJd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W0tUxgtD;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DF460A5BC2
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 12:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27DF460A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzzhFIJd;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W0tUxgtD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794574199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
	b=dzzhFIJdDsrRL2aev9RIOKOSSSont4Z5oA4SY6lEs5vX7IKINGfXtK9b4EpnnVFH6InNwf
	J1v5n0gtJZPXO+ouJW/vhVa/Mt0LEIctcT2Bi35mhFygppBpMq5ro7shY2z4iAa7F/ys+X
	qlzQSmQtw8vBEiY+RifX+M1rzw2uunQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-CgsgidJUOJiL8Qs_iIAy7A-1; Fri, 13 Nov 2026 07:49:58 -0500
X-MC-Unique: CgsgidJUOJiL8Qs_iIAy7A-1
X-Mimecast-MFC-AGG-ID: CgsgidJUOJiL8Qs_iIAy7A_1794574197
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4afef353dd2so7698825e9.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 04:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794574197; x=1795178997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
        b=W0tUxgtDMAXKUrOwGjs45dSHgs6aI6JItiZjjXsPJLDRtVJpV7yk7o/avylTBHJTpS
         SyQP2vFcl9oOKdFOFcWUNPoYPp+clBQD01sEOVFWPf4l46XB2hJ4v6lF8SgP52y/4VCc
         jLpJ3lA7Sy9AqnvS/rmQzErCKksJw9vmS35gVIBmGwGb0yBDO7O/21ZMV2LmvaNWb0Uc
         DS4Aek/9ELWxcTR6hfWlhXqV3QXsm3Vgt/OS35b58Fes2yXrD33496ZlTMFeZGYBzV/8
         twXRkPicS+l7jRhkaUJgpiBnfUYBJ0e/YtwOIDMnP1xvrg3VlvFtJ5PMkhHKGAJwOFB+
         bYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574197; x=1795178997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
        b=xdr35uUJmrNIqnnJY/sX7ejAGwAvDjf10bAs3v/SFaLzk7SiWQLhPtNqx8pziEcLxM
         M1LAPv7JQfOChxvpM9xmszlKjdM3s5h2WTQg2yJlj8BCtPwW6CRTaXqiNM+mgb04zmmK
         Ddkb7dt4FwDNyQYT+A7vmvt3vWYDPRUHZbiM81uVDlDjpur+w0btpimsuTVVAKFdHNoZ
         thO1Q7gS24pNMMIp7bSWall0X9Pih1gFl53b+xmEfkmE0I0+/Z5PLDEMqVU6AH6WdWB9
         yyepHIYpz6uxq6qqufs1fulqCiNwO3xN1ykZHHZg1yC7m2At6uIXob99KulTIwgtZAa7
         hrzw==
X-Forwarded-Encrypted: i=1; AL+hErGj1JTXhSLP/xj14O9aoSLqcDd+M4HiG9q3CVSnQSsYXiR8K0Ce1OODHP3hxRbjxTUk+o5fJnltE9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rtRT977oodHb5jY0zC0VAUnN1HrmXx1qqyh/nx55SkQPbevvB
	Bngr3tziAlKVVq1IkOoGkGD5dvLYQlf2C/O97qWfRcYs8K75oXlpNTZUi9c3ZwowLW8tXFeJ4/L
	UUzHs5sUduauqZhUHxRFEgkgKsBUnJeVkdFb3YqyG8n0lZHWEgJvJSrD4DxAnRQ==
X-Gm-Gg: AYBFou07auV0xp0jyI4q8BXfjgJjuaNpc5BWulNKaffr8sKdAYTKpyCCc1TlrD2tmHs
	Hp7i8YBwKwRGjfz+jMSQEz9cy3vYleAhUK+cidaEtxPPmfh3UIc0XS9zk8QfxjLsLv9WUbPNOJj
	YS8xHr9OuPifE+CJdQ0CbM3SiPOsUuxwZGMOqhBfxoOMJ7LeCK+4cTPcBuuwKV9PeZOAC/JqchP
	dQBVaYD1JokXB547kAMKfMkI/kZclb8vSFqassVBN4FIUfsWIMJUonQOEPq63552e9WhzwQ9KD/
	Jefzo2DGPMP5pQyT5UU3Y8uSFO6sPV/TYYgAlr87qwmkijBS/H8pgNfmIqS3JmQNz6MSnctfc+y
	GWjaftkChbCuOFrJMYzejcK54XtHnntL+XfGm4vI66FgJFvvfzukXsZtKm7FWUkU5AjqnzNsX/b
	sdkxnByC9bqwU=
X-Received: by 2002:a05:600c:8b66:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4bb55c5f567mr49391935e9.11.1794574196564;
        Fri, 13 Nov 2026 04:49:56 -0800 (PST)
X-Received: by 2002:a05:600c:8b66:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4bb55c5f567mr49391085e9.11.1794574196086;
        Fri, 13 Nov 2026 04:49:56 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm151135805e9.15.2026.11.13.04.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:49:55 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Fri, 13 Nov 2026 13:47:38 +0100
Subject: [PATCH RFC v2 5/8] vhost/vsock: negotiate datagram support with
 guests
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-vsock-dgram-support-v2-5-bacfc85b71ce@redhat.com>
References: <20261113-vsock-dgram-support-v2-0-bacfc85b71ce@redhat.com>
In-Reply-To: <20261113-vsock-dgram-support-v2-0-bacfc85b71ce@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org, Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4280; i=slp@redhat.com;
 h=from:subject:message-id; bh=YKxLSTvJb7wfOxlVHWx31lkfYp2fx1FL4beUkGwefCU=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBq9wdekDq1LWUUZmlpHsi/2uTpspdGC00wTmHdR
 C74XVInssqJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCavcHXgAKCRD0aSeNLwwC
 NcQRD/oCkwJdczjWxOlegLrWMfsgXLy+V0/1R7NmFksI//jyPSk9YMpRyELAWexBgUFH6e/6cwq
 wCpDig808i1oIfrWd+VcA9VzYzHMBMyBGe2nMcVH78vvr/+vrx5aJ0a/UJZYU2NKMFhZU7LiTGH
 todeOUCByOFykeDwMmlJICI6Sh9YB+0SORMvycciFaKarQ2GIOM/ZzxaHKTOc+PFARga2CRndQY
 GQEA5RI3gvA5aGYlUL46dBqhxkNHZ69ptOgMKTzMqyn85I+D9bcPFl7VI5jPmJ2s884j2sN8qaq
 eTjBbLEBWe0ceznjHqMcz2RGlJiJqqfZfihL7lBCgw502W45iPpRrE/ltW5ViWCHyM/DXtqmrZq
 IhIHiN/Z/yAC2Bcf+4k663O0K3vWiQmv8Q+A5IZPvFTcHGxGCa4CsJ9yf5PPYvNq5436WEzOBp9
 +mg9VP68oy0bPzSJDxY8DWzx/wqMwHOd/ohSkXzY7u0iaTnb9XLmVyyMI/21QSTwgXqaLc5mwHY
 A/BmH9a/IkTHwCZhRsW540/LF1LOxW3kmf84PvmTv52ANmVCsTG1XNwhk4lxmkWu6Uk1pJB4i7Q
 jgnXk791oLvMg3wTFjr8sOu/rr03w3dAMFWeqzbO8M/qSbx3iZGDph63hPbEHYg+ct58Z+GeRNj
 9glEhJOQxCGeJOw==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

Expose VIRTIO_VSOCK_F_DGRAM in the vhost feature bitmap and retain the
negotiated value for each guest.  Keep datagrams disabled until the
feature is negotiated.

Use a vhost-specific datagram destination check to look up the guest
in the socket's network namespace and require its negotiated datagram
feature. The common virtio implementation supplies the bind and
message operations; destination validation remains in connect() and
sendmsg(), where the remote CID is available.

Reject guest datagrams on ingress unless the receiving virtqueue
acknowledged the feature. Complete rejected descriptors normally so the
queue can continue processing subsequent traffic.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/vhost/vsock.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 0cb87971d749..7971f6f0b6a2 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -32,7 +32,8 @@
 static const int vhost_vsock_bits[] = {
 	VHOST_FEATURES,
 	VIRTIO_F_ACCESS_PLATFORM,
-	VIRTIO_VSOCK_F_SEQPACKET
+	VIRTIO_VSOCK_F_SEQPACKET,
+	VIRTIO_VSOCK_F_DGRAM,
 };
 
 #define VHOST_VSOCK_FEATURES VHOST_FEATURES_U64(vhost_vsock_bits, 0)
@@ -62,6 +63,7 @@ struct vhost_vsock {
 	u32 guest_cid;
 	bool seqpacket_allow;
 	bool ever_started; /* set on first SET_RUNNING(1); never cleared */
+	bool dgram_allow;
 };
 
 static u32 vhost_transport_get_local_cid(void)
@@ -436,6 +438,8 @@ static bool vhost_transport_msgzerocopy_allow(void)
 
 static bool vhost_transport_seqpacket_allow(struct vsock_sock *vsk,
 					    u32 remote_cid);
+static bool vhost_transport_dgram_allow(struct vsock_sock *vsk,
+					u32 cid, u32 port);
 
 static bool
 vhost_transport_stream_allow(struct vsock_sock *vsk, u32 cid, u32 port)
@@ -460,7 +464,7 @@ static struct virtio_transport vhost_transport = {
 		.dgram_enqueue            = virtio_transport_dgram_enqueue,
 		.dgram_dequeue            = virtio_transport_dgram_dequeue,
 		.dgram_bind               = virtio_transport_dgram_bind,
-		.dgram_allow              = virtio_transport_dgram_allow,
+		.dgram_allow              = vhost_transport_dgram_allow,
 
 		.stream_enqueue           = virtio_transport_stream_enqueue,
 		.stream_dequeue           = virtio_transport_stream_dequeue,
@@ -516,6 +520,24 @@ static bool vhost_transport_seqpacket_allow(struct vsock_sock *vsk,
 	return seqpacket_allow;
 }
 
+static bool vhost_transport_dgram_allow(struct vsock_sock *vsk,
+					u32 cid, u32 port)
+{
+	struct net *net = sock_net(sk_vsock(vsk));
+	struct vhost_vsock *vsock;
+	bool dgram_allow = false;
+
+	rcu_read_lock();
+	vsock = vhost_vsock_get(cid, net);
+
+	if (vsock)
+		dgram_allow = vsock->dgram_allow;
+
+	rcu_read_unlock();
+
+	return dgram_allow;
+}
+
 static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
 {
 	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
@@ -573,10 +595,12 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
 
 		hdr = virtio_vsock_hdr(skb);
 
-		/* Only accept correctly addressed packets */
+		/* Check addressing and datagram feature negotiation. */
 		if (le64_to_cpu(hdr->src_cid) == vsock->guest_cid &&
 		    le64_to_cpu(hdr->dst_cid) ==
-		    vhost_transport_get_local_cid())
+		    vhost_transport_get_local_cid() &&
+		    (le16_to_cpu(hdr->type) != VIRTIO_VSOCK_TYPE_DGRAM ||
+		     vhost_has_feature(vq, VIRTIO_VSOCK_F_DGRAM)))
 			virtio_transport_recv_pkt(&vhost_transport, skb,
 						  vsock->net);
 		else
@@ -737,6 +761,7 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
 	vsock->guest_cid = 0; /* no CID assigned yet */
 	vsock->seqpacket_allow = false;
 	vsock->ever_started = false;
+	vsock->dgram_allow = false;
 
 	atomic_set(&vsock->queued_replies, 0);
 
@@ -890,6 +915,7 @@ static int vhost_vsock_set_features(struct vhost_vsock *vsock, u64 features)
 	}
 
 	vsock->seqpacket_allow = features & (1ULL << VIRTIO_VSOCK_F_SEQPACKET);
+	vsock->dgram_allow = features & (1ULL << VIRTIO_VSOCK_F_DGRAM);
 
 	for (i = 0; i < ARRAY_SIZE(vsock->vqs); i++) {
 		vq = &vsock->vqs[i];

-- 
2.56.0

