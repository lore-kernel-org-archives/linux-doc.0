Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522906;
	b=akytl3t5Eci5u38hMViEhUunqXcBd977Ww1+H6kAiSdiMxgUteOSO1ZOGJP+YdhQDGaF
	 repeoxU6zrlLyTQHg50vupQNn6oizxobx8XyhJvLybT4wTZmhPfRdpDE6kO97mHCioEbx
	 CH7IJRJy3o6JdsethTo9lXIRVnHB5nzXBbrVfPU4VFWkaFO5bKFb7FGG8qAMGHuxs3BBI
	 0gxbqlmQGLQHIHLq3pU1+l64bPA3o2x2jPJ1GK5/V9qimr3cjFcN1Tcj+N7Y41mSU8BeM
	 vn6GEWtH+IWe9gtVsG4n1iz4JpuCd5Jg0PFktHl579IVvRo5SXRmQO7SVYsxHXsocew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522906;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TzwipR1LCMAEarIzxU+ebA22tLIFqbxvhpauSxtFZxw=;
	b=jgsK/KKBOSq1SOOiDQ7+WolWsH52ZSCixSq2wBCHhVrHV1qxrFwZbOXgdy8aSmCiJ9dW
	 yIvjn0yjFnVKbyULwB7sau+jJt0Kax/i0UnvNOtxJNy7DFDRsGbc74VZ4szoOuGmXJxQO
	 W4lFkVgYa0mw+R0zf43BByQLO7j+y/DsCWmEn2AfFVKfo4JVpip2B5+qEuX1iOs1uENLq
	 VTT8qYOD5mS7xuHFTeySEMU7JOAHHjRFADvS6BO6Zn1Y5rx/9m9sPs3DmaGIFT3Z2qpTD
	 W+n/2ylqtq3QW/9xCAk2HPHX1ByKMFZ2tAf+wH0QG6zwdYdDmanZTwjkVQZ27vNs8jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dscYn59j;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="H8V/jAko";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC6760A380B
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 12:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC6760A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dscYn59j;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H8V/jAko
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795522904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TzwipR1LCMAEarIzxU+ebA22tLIFqbxvhpauSxtFZxw=;
	b=dscYn59jFNNyuXGBiTttz6UwTqrk19BfpFOCo9+4vgLKzVR7D17k4IzxzlxqHPd0LtiLkh
	Gz7eSLwIHNSA0mdxdh0+C7AkS4ztGTU/gfRuNTAQE4IEV10YQSROV9fQKaytAoAZnAvvT3
	yA/2cqPKeXg50SM6GpLMVJpOu5IS0e4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-idT5fmc4NAmAAqNlwm5Tvg-1; Tue, 24 Nov 2026 12:21:39 +0000
X-MC-Unique: idT5fmc4NAmAAqNlwm5Tvg-1
X-Mimecast-MFC-AGG-ID: idT5fmc4NAmAAqNlwm5Tvg_1795522896
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48df02b91f9so2869721f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 04:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795522896; x=1796127696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzwipR1LCMAEarIzxU+ebA22tLIFqbxvhpauSxtFZxw=;
        b=H8V/jAkoh9Shjj6NPLmvFlrMxocRT1dn2vScjn6RxzmrcX0d+E248Xa6rQm3j5mFNW
         h36cMd1/cbladxc0dBlKRtiK57PGWgRpyfTFQds0KBEUJ101kAF5i2/36W9n9ba5nEu2
         xDsBPs3XYj5hQV5bNIEbgY5SPv3V1CVW5l6tO+nnDAJnAXNssvOfFBXJ36pgFt9HwEiY
         id5fCMaeGb4Fhr1mgVlK6PPGgCYa6u9DI9LTne5UsBUxyB+4us4slsdai5U49TpSyzv9
         7EH7/NNNBjfwGObxSJOttYeVR4CfAMFHo9TTWm0oPdbhWZWzQijNVbAPLMyUI82f2pcH
         3H+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522896; x=1796127696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzwipR1LCMAEarIzxU+ebA22tLIFqbxvhpauSxtFZxw=;
        b=ua3Uj5adPjoIyaJ0uqayzw7pY67taUCeO1UddOfxzR6IYFzmAVBUONGC/6eftCuHUZ
         +5lpljwF+IIq4l/PxsPq9J1s2LizkBULjBB3NbRVlOy07hvJqi9xZ9zOGPTTLnIUbvKl
         DlHmvKlf/JxYuPNgScIt281RbisoWAPH4CAWokJPhVTJaj+NAxyiweQeqSXwzSQvSLXD
         36643wrFyNwIpr4MuP/PL/sY53zTTVETyR/hDETYzWeHq8dZQd/cQswX+i5GE+U0O7Iv
         tHMehsyd8/Y+ZvYka2HMv14F5TpsqHPU6m0eOyOZB5GqaJ90F1298oapuqfkhf7iXewF
         KyqQ==
X-Forwarded-Encrypted: i=1; AL+hErGKOrp6Sfl/UvxSRahbpXKXZ2A9NH1ACjL84XoJI0+7cqwYkEWnPmuasfmYVwsKAukezhBw8oEmOT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VwDuuvzJMnFmLfFPDkWo9Qtz/GQX1yAFfT+BbrxlgNy9vTK+X
	Uuw2Fe035cgCF5TWBK6LbR8UCweXy2ryYB6OBQPb5kS37yaGxP20d2jbd3MCj+Gqmi1ZeEN+G5J
	QeYOZHjBMkdbzEOFB+Mhjh8TB626tbyUwD+60qpppTBdgxieTDrnJ5rROnHF6FA==
X-Gm-Gg: AZFdTZe/VrKOG61eIoRpzaOm91tGnkvwZBB5ohJZvpstAwMFGgb+CeQh15yUv4ACwc7
	v4pvkePe8dos4mFGiEzlXnCXZzerLgV9EPWdhsJGtjHw6l2AYRov4S7FAYk3pAn7SDndXJGIDI4
	HxVKqJLnjWEG0gVBGFuXpuSLxfB1u9LkfHGrRr/1tu4rMWqiVl83AE3wnoxQ8VHiK0KadrdBAU5
	5/lYICaIdJpiRKzJcn4JqFiaiRcQyf4xEEEyw4lj9HLcnYIfMk2b7ttat21OCXXoTp8/WThZngn
	QpVZ+ziUvbuhLEutryhzSLSf32gvHO9Uak9qoBDKMbbydS5NxFvpjsN63Qn6ZCygb9x4YzMKkBi
	TACDCYJoG69nqKJA9KC4P2IpgB+AZ7jKpGfIhFMl7stVITEvs+Jnnh3wdAPOCBixDiwVFWBjcMR
	A5WZ6VQixsEEU=
X-Received: by 2002:adf:e00c:0:10b0:4a9:6c58:1794 with SMTP id ffacd0b85a97d-4abb0b66bfbmr20062055f8f.10.1795522895773;
        Tue, 24 Nov 2026 04:21:35 -0800 (PST)
X-Received: by 2002:adf:e00c:0:10b0:4a9:6c58:1794 with SMTP id ffacd0b85a97d-4abb0b66bfbmr20061998f8f.10.1795522895343;
        Tue, 24 Nov 2026 04:21:35 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm22753198f8f.35.2026.11.24.04.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:21:34 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Tue, 24 Nov 2026 13:20:20 +0100
Subject: [PATCH RFC v4 2/8] vsock: report datagram receive and send queue
 state
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
Message-Id: <20261124-vsock-dgram-support-v4-2-3607484e85e8@redhat.com>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
In-Reply-To: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
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
 linux-doc@vger.kernel.org, Sashiko AI bot <sashiko-bot@kernel.org>, 
 Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4270; i=slp@redhat.com;
 h=from:subject:message-id; bh=DAGnzS4beIxvhBc5LWV62Y4RCwEPeEYebUU+gVLqZ9Q=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBrBYFDM0alN2qcB2uN4zvRdHQFPo6uBvEPQ9IoP
 7IXAHpQ1uGJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCawWBQwAKCRD0aSeNLwwC
 NWJyD/44s7CCvnIfT0+tJ3gDVvgHW2kGx/HIvC6vIhUFdUwaB4b7MkZLyBshjtahlGFOlshLTuY
 ow/X1/NpwQcGM4B8xChp9k6ohdYWRBFVtq7B338KPsfiiTo+6PELxlOXjGUmpQr+AmMQACmCiFa
 xXBT0v2dGfywk/SU42+Uy+ErfSkNh0z2BKMwQyfcNbD+bOV2UY97+Hk1EGbmKZj1/2TfU8a5xBX
 iamcB1oTr3FJtt9LIYrgJeuszuq3ZFy3zlFk3VSatzgaSEEpV1d/ULS5jjLgPDDCXagO9F3Y7hS
 G1vXj7H7QZ7mSs4b37bgPMcrsv5jkMCp5adznc+DLkOTrN0oGL3FuyPPJeB5To1I9C907U8YZAO
 j/8+TRIEITbFARS31o5OLIShXeSS0I9Ckzgagv/ykEYWOdR53sy+upqVpP2svj0zP4UXJTmMbzP
 ec/lvuViSv0xOnR/kgyVDT5ngLpYw+eTYFR9M2nfpveZD7NY67T8IteY11MhinqubZzQKYLw+I8
 1H8SiRk2kvi6D6tjEFEplZcdR4041IDA7C5kIWrwB20+8wMTnJwBnkICA6nxrZC8+/sqbsV7fZj
 BxN6w8I1EYQxYkQ7TTBNoJE65G8BPvDgVKNx7cE7MB2HLMieKCo+h+sD4u8CHDVBjbSAzaLgTdI
 f7oadBmJ3O/SWsQ==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

Datagram receive queues hold whole messages, and transports may charge
queued datagrams to the socket send buffer. Report the size of the
next datagram payload for SIOCINQ under the receive-queue lock, so
concurrent recvmsg() cannot free the skb during the query. Let
transports override the length calculation to exclude headers such as
VMCI's.

Report datagram write readiness only while the send buffer has space.
Set the asynchronous no-space flag when it is full so freeing pending
send buffers can wake poll waiters.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 include/net/af_vsock.h         |  2 ++
 net/vmw_vsock/af_vsock.c       | 32 ++++++++++++++++++++++++--------
 net/vmw_vsock/vmci_transport.c |  9 +++++++++
 3 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index ac061115ed30..e4fbea3b0e46 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -124,6 +124,8 @@ struct vsock_transport {
 	int (*dgram_enqueue)(struct vsock_sock *, struct sockaddr_vm *,
 			     struct msghdr *, size_t len);
 	bool (*dgram_allow)(struct vsock_sock *vsk, u32 cid, u32 port);
+	/* Optional payload length override, called with the receive queue locked. */
+	size_t (*dgram_payload_len)(const struct sk_buff *skb);
 
 	/* STREAM. */
 	/* TODO: stream_bind() */
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index d5cf240d4ece..8a271eb66860 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -1359,16 +1359,20 @@ static __poll_t vsock_poll(struct file *file, struct socket *sock,
 		mask |= vsock_poll_shutdown(sk, peer_shutdown);
 
 		/* For datagram sockets we can read if there is something in
-		 * the queue and write as long as the socket isn't shutdown for
-		 * sending.
+		 * the queue and write if the send buffer has space and the
+		 * socket isn't shutdown for sending.
 		 */
 		if (!skb_queue_empty_lockless(&sk->sk_receive_queue) ||
 		    (sk->sk_shutdown & RCV_SHUTDOWN)) {
 			mask |= EPOLLIN | EPOLLRDNORM;
 		}
 
-		if (!(sk->sk_shutdown & SEND_SHUTDOWN))
-			mask |= EPOLLOUT | EPOLLWRNORM | EPOLLWRBAND;
+		if (!(sk->sk_shutdown & SEND_SHUTDOWN)) {
+			if (sock_writeable(sk))
+				mask |= EPOLLOUT | EPOLLWRNORM | EPOLLWRBAND;
+			else
+				sk_set_bit(SOCKWQ_ASYNC_NOSPACE, sk);
+		}
 
 	} else if (sock_type_connectible(sk->sk_type)) {
 		const struct vsock_transport *transport;
@@ -1632,10 +1636,22 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
 			break;
 		}
 
-		n_bytes = vsock_stream_has_data(vsk);
-		if (n_bytes < 0) {
-			ret = n_bytes;
-			break;
+		if (sk->sk_type == SOCK_DGRAM) {
+			struct sk_buff *skb;
+
+			spin_lock_bh(&sk->sk_receive_queue.lock);
+			skb = skb_peek(&sk->sk_receive_queue);
+			if (skb && vsk->transport->dgram_payload_len)
+				n_bytes = vsk->transport->dgram_payload_len(skb);
+			else
+				n_bytes = skb ? skb->len : 0;
+			spin_unlock_bh(&sk->sk_receive_queue.lock);
+		} else {
+			n_bytes = vsock_stream_has_data(vsk);
+			if (n_bytes < 0) {
+				ret = n_bytes;
+				break;
+			}
 		}
 		ret = put_user(n_bytes, arg);
 		break;
diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 1f186e8f8364..2b9493e987d1 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -1761,6 +1761,14 @@ static int vmci_transport_dgram_enqueue(
 	return err - sizeof(*dg);
 }
 
+static size_t vmci_transport_dgram_payload_len(const struct sk_buff *skb)
+{
+	if (skb->len < sizeof(struct vmci_datagram))
+		return 0;
+
+	return skb->len - sizeof(struct vmci_datagram);
+}
+
 static int vmci_transport_dgram_dequeue(struct vsock_sock *vsk,
 					struct msghdr *msg, size_t len,
 					int flags)
@@ -2075,6 +2083,7 @@ static struct vsock_transport vmci_transport = {
 	.connect = vmci_transport_connect,
 	.dgram_bind = vmci_transport_dgram_bind,
 	.dgram_dequeue = vmci_transport_dgram_dequeue,
+	.dgram_payload_len = vmci_transport_dgram_payload_len,
 	.dgram_enqueue = vmci_transport_dgram_enqueue,
 	.dgram_allow = vmci_transport_dgram_allow,
 	.stream_dequeue = vmci_transport_stream_dequeue,

-- 
2.56.0

