Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00CA37E31F
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 05:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602613; cv=none; b=EJQoWhFLzNfTQ/RyvAMqnIK7fU8PZiK0pRjvLBri6LihuKRfAnuGSt3c+6cdTaMPPoC2+poXe/2TKXaO2w8O20H3FQZ9TkZ9XhKmDGxYrqqWTxJfqwAJsXefFTiQj6yjBprUmtBq+Ww/lTIAL143dFDoweJUAT97HKxpqKRtx0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602613; c=relaxed/simple;
	bh=X6tX6MsfjpCCm5XWJnWLuYwr3D2OjljkcPDWiXIpOAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1piiqmOJaFIH9HI3N8iXvde98Wi+znyNN2htXzK0VaZwNxCd0PMwbX/n6NJAZAEli0WbXechCRiUw6QK08Sp6Mv7Xb0Rdv1rgS/VqITnjqo3gv3Z/VUURIZTKmcBY4dKYpcd+iuZsSAQrthicINGKVOXDo1eIp7jYpANT0PwS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3YaSQoL; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3YaSQoL"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso2245857a91.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 21:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772602611; x=1773207411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNcMxZGmsNob2hi70jSfSua0A2NVCjnuBqG6KRIu95c=;
        b=h3YaSQoLLhnhiYDWEJdepXjDHNhTxpaKciEnl6O54BufaVNAP+MfeBNGp9mJ2IK5SF
         AzPtDHD2R5F8hpjYseFHu/ilBGvktPrsOIp1MQub88eQN+vWnXMYpT5OAlLZGu49U3bW
         d008yrwHFqGvtwknzrJrbRtYdtMRNVqa5SkCNDZldxNmUp1dub8YCITTzfFOPcYjRE5V
         PEdxZ5cCW4D0dPfXmH3eP4pCwzA1l++3Ho7ofMTEeWNECvCY7qsifQvbrCZzDhTBqCX1
         8nTRTic/f91HvMr07VCOsOcPUea7SmgBsx4aa0D/Es1fllK5YX53ctY4Wfat8otBmvAw
         SGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602611; x=1773207411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNcMxZGmsNob2hi70jSfSua0A2NVCjnuBqG6KRIu95c=;
        b=lloxDVPT7aGXm3WS3ZyiZNFItVt7TSPNDqiRnoO0VFpK1akSrBnZBShpbf5oFl3KzV
         RvED0TldQ2rIVcIaSJtTjxV3GytX6pFY8krIXIdWhCKzlD8h5gPMw3kc0Cpi4Kozm6J7
         NaonAaKMhQFqazrSyylARcpApRXoVW3Vxcv6Itx82KU1tcmcFaIk9DEZyqqfPw5F2fQC
         QPdH2KCbgiZK8nA8ei6zeNmc1xNzOGS4k8NSPNWq+HbxM2SyDU9q9YeEb6fmFxQn6PmG
         C8QcyqsFMadE33sGMvqBJ9Q4wfYukVoTlrwslLFRVGrv/AoDijnhLHIKZ+2ZBlMyUnNq
         pwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDtO/OACA6G6w0PTCVsu3Sl6Ris0M1o/kOygN/5UUJrCXaMijkzebFBwbftVjKiZfXx3vI8TNEIyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9n/iQ1NIz9U3dvSko7s6s6x3lpKdC6kNexS/vZ0+2k1Yg1sXr
	+seZTw8LV4iYSlYaoBRSsXFSKKwTeKTvSglTI2BnPpGmVdKtJVmNY7iz
X-Gm-Gg: ATEYQzxp3pUZ+yNjMqRb8BXDNc56c2JlPUQiTV/PAUIVci/FepSkBvjL46ZmChrZKkt
	sz9XQrnnvNcmsF6eSgN5I/j+BmaMSrpacbyhPW3dsB3mUbOYrzniTN5ISeEmtLJpPS/qIiI1vve
	LgtQH4m1GsyEIdLoIfiaaXFGRacldkeWtLRYC6T8nnbj2W6SXG/jSYYsfRsm6WFtpBsZAXRffu8
	XP6SQRpk8Ybm3Y1kyMja2ujvFfrQ3B44IhcoKTUuXSM5/WiBcj84NREYlfsoR5322OyY2BAWuh6
	m0ER5mu6SqK4W8118/UYsvEZhpSEsMqm0ABDDksvHCH8jArYU4dPD13Hrhbd7e5rMiip9MikXQp
	QIfqSGqXDTLXij38MCKsLDbQ62GMTXmspBT4kWN6c4ajIqwBZggcgMfyXx1rmy2x0boPhTjYJCK
	I9YeBZ3LbhpPrvdfNVk+yh3plrpBQz5uLdC9aQ7UN6gxwvEHLipQe4
X-Received: by 2002:a17:90b:3d83:b0:354:c629:efb2 with SMTP id 98e67ed59e1d1-359a6a563ddmr1057766a91.24.1772602611058;
        Tue, 03 Mar 2026 21:36:51 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c090bfdsm4020057a91.8.2026.03.03.21.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:36:50 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: chuck.lever@oracle.com,
	hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 4/5] nvme-tcp: Support KeyUpdate
Date: Wed,  4 Mar 2026 15:34:59 +1000
Message-ID: <20260304053500.590630-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304053500.590630-1-alistair.francis@wdc.com>
References: <20260304053500.590630-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

If the nvme_tcp_try_send() or nvme_tcp_try_recv() functions return
EKEYEXPIRED then the underlying TLS keys need to be updated. This occurs
on an KeyUpdate event as described in RFC8446
https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3.

If the NVMe Target (TLS server) initiates a KeyUpdate this patch will
allow the NVMe layer to process the KeyUpdate request and forward the
request to userspace. Userspace must then update the key to keep the
connection alive.

This patch allows us to handle the NVMe target sending a KeyUpdate
request without aborting the connection. At this time we don't support
initiating a KeyUpdate.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v7:
 - Use read_sock_cmsg instead of recvmsg() to handle KeyUpdate
v6:
 - Don't use `struct nvme_tcp_hdr` to determine TLS_HANDSHAKE_KEYUPDATE,
   instead look at the cmsg fields.
 - Don't flush async_event_work
v5:
 - Cleanup code flow
 - Check for MSG_CTRUNC in the msg_flags return from recvmsg
   and use that to determine if it's a control message
v4:
 - Remove all support for initiating KeyUpdate
 - Don't call cancel_work() when updating keys
v3:
 - Don't cancel existing handshake requests
v2:
 - Don't change the state
 - Use a helper function for KeyUpdates
 - Continue sending in nvme_tcp_send_all() after a KeyUpdate
 - Remove command message using recvmsg

 drivers/nvme/host/tcp.c | 59 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 8b6172dd1c0f..ade11d2ac9ef 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -171,6 +171,7 @@ struct nvme_tcp_queue {
 	bool			tls_enabled;
 	u32			rcv_crc;
 	u32			snd_crc;
+	key_serial_t		handshake_session_id;
 	__le32			exp_ddgst;
 	__le32			recv_ddgst;
 	struct completion       tls_complete;
@@ -1361,6 +1362,59 @@ static int nvme_tcp_try_send(struct nvme_tcp_queue *queue)
 	return ret;
 }
 
+static void update_tls_keys(struct nvme_tcp_queue *queue)
+{
+	int qid = nvme_tcp_queue_id(queue);
+	int ret;
+
+	dev_dbg(queue->ctrl->ctrl.device,
+		"updating key for queue %d\n", qid);
+
+	ret = nvme_tcp_start_tls(&(queue->ctrl->ctrl),
+				 queue, queue->ctrl->ctrl.tls_pskid,
+				 HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
+
+	if (ret < 0) {
+		dev_err(queue->ctrl->ctrl.device,
+			"failed to update the keys %d\n", ret);
+		nvme_tcp_fail_request(queue->request);
+	}
+}
+
+static int nvme_tcp_recv_cmsg(read_descriptor_t *desc,
+			      struct sk_buff *skb,
+			      unsigned int offset, size_t len,
+			      u8 content_type)
+{
+	struct nvme_tcp_queue *queue = desc->arg.data;
+	struct socket *sock = queue->sock;
+	struct sock *sk = sock->sk;
+
+	switch (content_type) {
+	case TLS_RECORD_TYPE_HANDSHAKE:
+		if (len == 5) {
+			u8 header[5];
+
+			if (!skb_copy_bits(skb, offset, header,
+					   sizeof(header))) {
+				if (header[0] == TLS_HANDSHAKE_KEYUPDATE) {
+					dev_err(queue->ctrl->ctrl.device, "KeyUpdate message\n");
+					release_sock(sk);
+					update_tls_keys(queue);
+					lock_sock(sk);
+					return 0;
+				}
+			}
+		}
+
+		break;
+	default:
+		break;
+	}
+
+	return -EAGAIN;
+}
+
 static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
 {
 	struct socket *sock = queue->sock;
@@ -1372,7 +1426,8 @@ static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
 	rd_desc.count = 1;
 	lock_sock(sk);
 	queue->nr_cqe = 0;
-	consumed = sock->ops->read_sock(sk, &rd_desc, nvme_tcp_recv_skb);
+	consumed = sock->ops->read_sock_cmsg(sk, &rd_desc, nvme_tcp_recv_skb,
+					     nvme_tcp_recv_cmsg);
 	release_sock(sk);
 	return consumed == -EAGAIN ? 0 : consumed;
 }
@@ -1708,6 +1763,7 @@ static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
 			ctrl->ctrl.tls_pskid = key_serial(tls_key);
 		key_put(tls_key);
 		queue->tls_err = 0;
+		queue->handshake_session_id = handshake_session_id;
 	}
 
 out_complete:
@@ -1737,6 +1793,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 		keyring = key_serial(nctrl->opts->keyring);
 	args.ta_keyring = keyring;
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.ta_handshake_session_id = queue->handshake_session_id;
 	queue->tls_err = -EOPNOTSUPP;
 	init_completion(&queue->tls_complete);
 	if (keyupdate == HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
-- 
2.53.0
