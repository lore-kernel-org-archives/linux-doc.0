Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590180;
	b=WmGCKwjdsnUQ2waGpuPXMtmKFUYZa8jmdSeDNux6JOM0QK5RludqTKIEWvyGKAYUKPZ3
	 Xboh+QfSX+jD6C3Rvf2B/xHxC2oIOAYywrJtp4ttlckwld0qBO8ZoyPmY6R0qoQX9H+RC
	 3f9cfhtLULKESnXcLtEg5Q0mB3P9Y5xkkMA1AZSOoYCg65WpCkTHMtYgXPHXBp/SKkMFG
	 1uhEi87ZQIs1liqVPwemW5udcTz+df3cOkJQil/DkQI6Ri+bcsU9AJA5cKNFEBELvmO61
	 I9RAM9JYjRia5xz9SsyFnU2MEMEps6ug9CPNL45rCllgYdbzBGiFMYb0y+24Pe9qLYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590180;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
	b=2eYgkooqYX1vjOmCiafpj4YjjZLmlwr2mbqR7Kfi/oJQVKyCYbw5Mxk4TbDNkyplJgRY
	 aeprBFKtEOVyTrEVmHh86/GCSFHkgd9eJMbcXTP3PmGkaBgxCSCtHXbhZTUQ3Fh3+6UWP
	 3ex5Iz9kEl2gjhROHJxPgvcWuvN9hdm6zhUFsb+V6dgr/mCIAwOrUVAl5Yi0xgjPg+wS3
	 S2KLCuoT7Kj2CkpZc5XTzEFBZnR6htErwb097yX38Ry7OmpG/ZSX8n0+d2Z9GOssXevg8
	 +Bjh1RdaQ3955QmnftU+ksGZtmHziJ59ddDwY73jmLywvtrtO+7ndb4qcDbdwiWzpIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LyTQZnPS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rcwDqaDt;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4734607143B
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4734607143B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LyTQZnPS;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rcwDqaDt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794590179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
	b=LyTQZnPSyvRwMSnzDCl+ItRyBHz6XOZPbK8rHh2O5F7zfVEI+zTt+jwYGR1D6pRkzNV4R5
	MaM4tT/VaMfMzBItEqKxogMRMC7sVXybV06f6qI92qmL1uWqn5Lhdk0G805XuwYhcyk1SR
	1X5xOIzkpfdhu6WPVmxLNQY5mALs51Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-Thu21xmlPxaurBTHZv7SdA-1; Fri, 13 Nov 2026 12:16:17 -0500
X-MC-Unique: Thu21xmlPxaurBTHZv7SdA-1
X-Mimecast-MFC-AGG-ID: Thu21xmlPxaurBTHZv7SdA_1794590176
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso1131052f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794590176; x=1795194976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
        b=rcwDqaDtJ0znulsRrjpmXsSbSF1NNzzsF627bEhOzqyYoSjXvPFREqLrinqe6RMYSr
         syehfFpXFLz5csuYw0BKtxJZ5obbVpSPhyru4RiHuKNVrc7b3Fa+pxfVUTlWFSOKN0kM
         ct87wmBNdqG/a6l+lCJL/C3gEmLPU//IGlBylNHO67QUP8BdPJQ/Il8/uWZE0rn0aonX
         XqyuXAFcStdx6hs9M0XsHOe73wa8dqCWlViP6PP6OWSzCmlOPJtVuV4HFMDxveB1bMHz
         Rs43/oLVFPCYxhM3OOE3OD9BuUFhGh/FlQeqY0GsyfwK7VSM7f8LywgZRrzmremZLX5S
         QmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590176; x=1795194976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42m2T+OgUE+WzNUCZPiDLGv4wYEY//5j6O7a88xsAPc=;
        b=kUswoYIW1OJH+8trMuc7sqxYXEXMAUXw1GZvqVCug9FoGr8Ii/15eftOIAH9+TfzBH
         ZplrrHrB6QzLiQsA1XkW0s996NMuGT3w4Sl26oRhYyFrdtwNhXnCkUzKhRpcT5QACa3t
         FuqtBNhoxa0zuemSFV3zYM2xjh8HwHpx/qUqFK3OrytAZ97sSgvhrPxkhkTEPKkbV23r
         IqpWIN9a8OAstcTtx4Gx1gIO+tqifAOuER0It6Zfl1GXepK2rrk3Prqik8ogks/p6lde
         IUs1+9kc/Aoqrtmh9w4CtcmB90Z+4bfzVA2tyHE/C3Hpglu+K/SwkUG2QGYwPblhBaUs
         mTCQ==
X-Forwarded-Encrypted: i=1; AL+hErHTK6QGBnOi23iR4iyGn2y+CWRnbpoBlZFyvWQ6dwF98eNBoY561wX8kjuuiIgAewdk7WqVdOWNVSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pBTL6swVF9EBI439YkV4Tto30Nont5+HS1dgL9+RdQPU/YaSf
	aD0Nz+8AO3wKYUXacnou+ezMTt1Rzofw6koAIPCXFKylvXqpx6A/Dz6T6zow33GuE7LqDVsotDf
	ItFZ8RRaeXgHVansAHOYRgbOKcr29D/PMmAg61+HSGjabCA22NzHNiANHC9rNxw==
X-Gm-Gg: AYBFou1Od64OESuLtNe5w4M/Rz7zcZCojlQd0+5iXOgs6+CEyey/7pTCZrcZSiDWnlX
	3KUBvDizl65lR6UtXqRJ+brW7282hs0ucLKqddVayRGSIEEv+iBKGJYn+jyPpE0mBPhNo3pxKtW
	t7pp/XNLvVtRIN8W/xSlGmp0YMwHzqRuB1iTfA9Q9I84zulaarScWWyhhljuL3OjJqiYByYMdJw
	ZuKC5BRmTR6vg2En2uUKomUVD3ObFrlfg33/phLwLIkmrn239Df+4LAR61+J3rI7XoGVRXTb2Z7
	SdgyeA6Cbvmy/cmB8YQ39feF1uCKObkOD/DZgU1FNL3y9cZZZRCSBwE6NeX/6hYemIgbYJnGxVT
	9fbDS06MOGhIn60tlZawZ74YpyZzCkXDqKP9D2BBKv17rU80+UilKQHNIcdSyF2HcymqXG8haO+
	uaA/HYMJqtO1Y=
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-49c6d453058mr7554615f8f.5.1794590176297;
        Fri, 13 Nov 2026 09:16:16 -0800 (PST)
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-49c6d453058mr7554512f8f.5.1794590175789;
        Fri, 13 Nov 2026 09:16:15 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm5811907f8f.5.2026.11.13.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:16:13 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Fri, 13 Nov 2026 18:15:45 +0100
Subject: [PATCH RFC v3 5/8] vhost/vsock: negotiate datagram support with
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
Message-Id: <20261113-vsock-dgram-support-v3-5-1523c8e9b27e@redhat.com>
References: <20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com>
In-Reply-To: <20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com>
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
 b=kA0DAAoB9GknjS8MAjUByyZiAGr3RcvI3QnmKr/LRFn2Ary4TwcFPckWS7tYNcHGXnxHY4IMx
 YkCMwQAAQoAHRYhBL7V/PdRLYaAkULoovRpJ40vDAI1BQJq90XLAAoJEPRpJ40vDAI1JUsP/RuK
 zWQiElr7d4dJNVClBKs1rzZ0Yj3GcaeAHappnpy6wUu+gmAJFnxM2QFmqVIFxSElR8wNfcYX04t
 V8H+SJ/t0vVBYstyu9Mg7KIrxAWMvfhhIY5LnPwx2ZMfhqsTz+7ACuiDr6pZ2zxB8+CtoC3qu48
 nPzB2yFClOtl59Tbo6kse/qyppGiuKwfwAN8JWzOSeKIpLz7OGpocKl3vzkZ9C+ORgjYAAgvHNq
 teMbYTgAaShLedtIJoHNbCXsC/ZqnKsTuLZAzRnbqpUMdduT7UYOD9I6lvsTzU6b+ahXvZA5eKl
 nnkpvCIm0h1d1BSerC5RQq2JxnsOnW+6RAX/5HK0Pvgw0lXozPmSSKYO7W43WuzPTA+9By5WbSk
 PVaU6jX+oDMLJvH8v+z7hKrdgE6BEP244sZO2UtjODmqipK75ewCBRjhFggUwgPDP29cMMmvd6y
 z4FvZTWeMSYYeuhi6n+zEu3khNX84RSd/MlyCg5toZqRH7WhCC2zvn77ORD4nqPOGQFhFfA+XzX
 4vkl2qZPzHp/B/bz0w/h09prkD8x6/cY0skNUq8DRlnEMu/eXr6jC17IuBrGNW0tg+8u5DsOSiO
 cyAMGfzGZGgiBsCN6erpjNNToul8X5KBhzJ2LaYIVVetDnHyfAJ/4uuhpeA9rGKcWuHyE3YvReY
 rYmJl
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

