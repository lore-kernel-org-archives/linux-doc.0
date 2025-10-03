Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4725021ADB7
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 04:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465972; cv=none; b=jHzvs0WJG2zendWN/Hd9gCeCfpifDf95rMFm/9A51lBNxIxvGVdI188W3RkjdbOndFsGQRKhoDQkd95Jal5lAdk333vV44xmeE7LAF/xvKkUZR54EIZ0HQaXfVuLrhreKI61vgfLgcaCF+KcCy+LvyWvqnx9nTU+nIkF1JarQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465972; c=relaxed/simple;
	bh=tq8hWUi9WFbvZCSJuGUlfmGb2RK2ZeIth2EWUddFyYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+Ke8z1qqz3InK2MhXDGXry59C/eL5RXOVbF9oir3F8oON9xkvX+MAl3Ou0hm9lNF2+n/bmP+SRlFVw879mqUIcAdNj+fz2Z1t+r5+k8RPq5dLeN7e+rgIupmN5GHmCaMfCf4oE2RpLixHmYehxYJHfDDPMHjjAjqBJGeHuVmUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU6sEbzS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU6sEbzS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so23707425ad.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 21:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465969; x=1760070769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/RhfwOg9G04zj7blr/LVSDCaR4a6pcdo5HXaRarZaQ=;
        b=PU6sEbzSwxWd7ic9h+HnsfdLmQOPUayx7qnzML9Eyk1HOPdKYMWnbildjcbxrEGM/A
         u/KKNKehqokS+cbO9Xkw9H20ommbNDQr+MlDTEJQw27aGzQdJKWNtHCU9Dox5D+OnESh
         8IQe3C0x7/mEESHS1lI64c9V3eTUahQJ0HOrn/nVINvXWrUHe3M+4W4C0r6mO6eRTXUj
         AJPcMeS4B13yK7zXYydlfqDUb211wn5jK4xpcJ5r5QFm5Tw4qNJJpp8/g8Got3iHUZ/e
         tvXswUVwU6Qp6Q/E1r6wrYbpJ1+WxoUaqSUTDywJUrLhi7exfQSHdwrGYFp07d69Rvlx
         j09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465969; x=1760070769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/RhfwOg9G04zj7blr/LVSDCaR4a6pcdo5HXaRarZaQ=;
        b=MNM4sPxhgoQwokk1Z0H5g2lmCyBhVRMRIdo3vwRUfUisTCQvEb80aJbylKZICQ2nQ2
         Z4j39idQw0v3cslw7wsn4+FPx30+KmJ8lSS0zzN7QP/igwpR7kBuOIBUBIamBnnsqE8j
         PVwzOuzpPypG5YHncRpPZdBgJzHXrK0mfTZS5SvFlDsPdSzMVo87LcNO0bhiS3XPCq1y
         T0P2u3mqyi9ao9pzNIFm7/rO9lednir8hGvGuUSaBDX2aGzOsOTw9lO4XnxtxdVKB+WO
         9NVzfOomElPmLI8CZ46ayFLzja8Z/VBT2hMJ9fqjSWO1QawKA1U2xczYMQ3cj5TsbJQF
         qSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/5sGP+zJY1/65tJK66DQA0fjYQmrO340Hy2s5TdAG6/RkG3wtXJqsVX19O9KybfPPvFStfyfhqP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBslRwXKbEGvJPjQWiBqtbriqqQlSosqLjn6XR1VIVY07f5RA3
	tv9ICXjnxBDBsqt5N5SaxlW1eKpU9q0Fu7NRtV0nTQEXrkXYfFKIKONg
X-Gm-Gg: ASbGnctz6f2Wypw/m9yzZEm241p9yPKISYI+iqgBJ7dsqPDHixQDGCyYkKdtczVWZAc
	keLORtEzMA0TyMiFBE4cG0wcqWBEHXuHOAJl3e1F7TbqPpJrtW1t/P5N988I5y3afqQ4UnxagRa
	3vsUAoMDBaVJpCc+5fnQuhlZOJtHonDPZGgsNGF0olgICqgaZIdRUtYgBpi0jzcUoxTVt12L670
	WqbWwH/WGRxQMVk0TI11eQayUptXuvhXmYUzgyadiXv0ZGVL37Hud2U0j83F8WnFR2fJOAqrWPk
	cNPy4upctQqPb+lkwayV3swd4fguVttBtRlLYSo2RZoMZALSOf6fDRXSA6SsQ4SaQ+2wZ+9hjyU
	6pvQKSTQ5TCBEW31atbUKgcO+teNjZeVUsFu78KYyku0isXIfIQ2WisOuRwp/Yo+88oPRNChcl1
	2kVd81RdHTpFEHEbS6K6+MgdOc/UNpZPcMEB/yU9VFl+h7uDQBi5aa
X-Google-Smtp-Source: AGHT+IHqijcQ2mML6mQfax0bd7bg5pqc9YIkhbyYMavM8Tyb3Jp75ZIWGmYxOuPUT9g3dT0PGrahEA==
X-Received: by 2002:a17:903:fa6:b0:25f:45d9:6592 with SMTP id d9443c01a7336-28e9a65c0e9mr15641845ad.48.1759465969449;
        Thu, 02 Oct 2025 21:32:49 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:48 -0700 (PDT)
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
Subject: [PATCH v3 7/8] nvmet-tcp: Support KeyUpdate
Date: Fri,  3 Oct 2025 14:31:38 +1000
Message-ID: <20251003043140.1341958-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003043140.1341958-1-alistair.francis@wdc.com>
References: <20251003043140.1341958-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

If the nvmet_tcp_try_recv() function return EKEYEXPIRED or if we receive
a KeyUpdate handshake type then the underlying TLS keys need to be
updated.

If the NVMe Host (TLS client) initiates a KeyUpdate this patch will
allow the NVMe layer to process the KeyUpdate request and forward the
request to userspace. Userspace must then update the key to keep the
connection alive.

This patch allows us to handle the NVMe host sending a KeyUpdate
request without aborting the connection. At this time we don't support
initiating a KeyUpdate.

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - Use a write lock for sk_user_data
 - Fix build with CONFIG_NVME_TARGET_TCP_TLS disabled
 - Remove unused variable
v2:
 - Use a helper function for KeyUpdates
 - Ensure keep alive timer is stopped
 - Wait for TLS KeyUpdate to complete

 drivers/nvme/target/tcp.c | 90 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index bee0355195f5..fd59dd3ca632 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -175,6 +175,7 @@ struct nvmet_tcp_queue {
 
 	/* TLS state */
 	key_serial_t		tls_pskid;
+	key_serial_t		user_session_id;
 	struct delayed_work	tls_handshake_tmo_work;
 
 	unsigned long           poll_end;
@@ -186,6 +187,8 @@ struct nvmet_tcp_queue {
 	struct sockaddr_storage	sockaddr_peer;
 	struct work_struct	release_work;
 
+	struct completion       tls_complete;
+
 	int			idx;
 	struct list_head	queue_list;
 
@@ -836,6 +839,11 @@ static int nvmet_tcp_try_send_one(struct nvmet_tcp_queue *queue,
 	return 1;
 }
 
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+static int nvmet_tcp_try_peek_pdu(struct nvmet_tcp_queue *queue);
+static void nvmet_tcp_tls_handshake_timeout(struct work_struct *w);
+#endif
+
 static int nvmet_tcp_try_send(struct nvmet_tcp_queue *queue,
 		int budget, int *sends)
 {
@@ -844,6 +852,13 @@ static int nvmet_tcp_try_send(struct nvmet_tcp_queue *queue,
 	for (i = 0; i < budget; i++) {
 		ret = nvmet_tcp_try_send_one(queue, i == budget - 1);
 		if (unlikely(ret < 0)) {
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+			if (ret == -EKEYEXPIRED &&
+				queue->state != NVMET_TCP_Q_DISCONNECTING &&
+				queue->state != NVMET_TCP_Q_TLS_HANDSHAKE) {
+					goto done;
+			}
+#endif
 			nvmet_tcp_socket_error(queue, ret);
 			goto done;
 		} else if (ret == 0) {
@@ -1110,6 +1125,45 @@ static inline bool nvmet_tcp_pdu_valid(u8 type)
 	return false;
 }
 
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+static int update_tls_keys(struct nvmet_tcp_queue *queue)
+{
+	int ret;
+
+	cancel_work(&queue->io_work);
+	queue->state = NVMET_TCP_Q_TLS_HANDSHAKE;
+
+	/* Restore the default callbacks before starting upcall */
+	write_lock_bh(&queue->sock->sk->sk_callback_lock);
+	queue->sock->sk->sk_data_ready =  queue->data_ready;
+	queue->sock->sk->sk_state_change = queue->state_change;
+	queue->sock->sk->sk_write_space = queue->write_space;
+	queue->sock->sk->sk_user_data = NULL;
+	write_unlock_bh(&queue->sock->sk->sk_callback_lock);
+
+	nvmet_stop_keep_alive_timer(queue->nvme_sq.ctrl);
+
+	INIT_DELAYED_WORK(&queue->tls_handshake_tmo_work,
+			  nvmet_tcp_tls_handshake_timeout);
+
+	ret = nvmet_tcp_tls_handshake(queue, HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
+
+	if (ret < 0)
+		return ret;
+
+	ret = wait_for_completion_interruptible_timeout(&queue->tls_complete, 10 * HZ);
+
+	if (ret <= 0) {
+		tls_handshake_cancel(queue->sock->sk);
+		return ret;
+	}
+
+	queue->state = NVMET_TCP_Q_LIVE;
+
+	return ret;
+}
+#endif
+
 static int nvmet_tcp_tls_record_ok(struct nvmet_tcp_queue *queue,
 		struct msghdr *msg, char *cbuf)
 {
@@ -1135,6 +1189,9 @@ static int nvmet_tcp_tls_record_ok(struct nvmet_tcp_queue *queue,
 			ret = -EAGAIN;
 		}
 		break;
+	case TLS_RECORD_TYPE_HANDSHAKE:
+		ret = -EAGAIN;
+		break;
 	default:
 		/* discard this record type */
 		pr_err("queue %d: TLS record %d unhandled\n",
@@ -1344,6 +1401,13 @@ static int nvmet_tcp_try_recv(struct nvmet_tcp_queue *queue,
 	for (i = 0; i < budget; i++) {
 		ret = nvmet_tcp_try_recv_one(queue);
 		if (unlikely(ret < 0)) {
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+			if (ret == -EKEYEXPIRED &&
+				queue->state != NVMET_TCP_Q_DISCONNECTING &&
+				queue->state != NVMET_TCP_Q_TLS_HANDSHAKE) {
+					goto done;
+			}
+#endif
 			nvmet_tcp_socket_error(queue, ret);
 			goto done;
 		} else if (ret == 0) {
@@ -1408,14 +1472,26 @@ static void nvmet_tcp_io_work(struct work_struct *w)
 		ret = nvmet_tcp_try_recv(queue, NVMET_TCP_RECV_BUDGET, &ops);
 		if (ret > 0)
 			pending = true;
-		else if (ret < 0)
-			return;
+		else if (ret < 0) {
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+			if (ret == -EKEYEXPIRED)
+				update_tls_keys(queue);
+			else
+#endif
+				return;
+		}
 
 		ret = nvmet_tcp_try_send(queue, NVMET_TCP_SEND_BUDGET, &ops);
 		if (ret > 0)
 			pending = true;
-		else if (ret < 0)
-			return;
+		else if (ret < 0) {
+#ifdef CONFIG_NVME_TARGET_TCP_TLS
+			if (ret == -EKEYEXPIRED)
+				update_tls_keys(queue);
+			else
+#endif
+				return;
+		}
 
 	} while (pending && ops < NVMET_TCP_IO_WORK_BUDGET);
 
@@ -1798,6 +1874,7 @@ static void nvmet_tcp_tls_handshake_done(void *data, int status,
 	}
 	if (!status) {
 		queue->tls_pskid = peerid;
+		queue->user_session_id = user_session_id;
 		queue->state = NVMET_TCP_Q_CONNECTING;
 	} else
 		queue->state = NVMET_TCP_Q_FAILED;
@@ -1813,6 +1890,7 @@ static void nvmet_tcp_tls_handshake_done(void *data, int status,
 	else
 		nvmet_tcp_set_queue_sock(queue);
 	kref_put(&queue->kref, nvmet_tcp_release_queue);
+	complete(&queue->tls_complete);
 }
 
 static void nvmet_tcp_tls_handshake_timeout(struct work_struct *w)
@@ -1843,7 +1921,7 @@ static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
 	int ret = -EOPNOTSUPP;
 	struct tls_handshake_args args;
 
-	if (queue->state != NVMET_TCP_Q_TLS_HANDSHAKE) {
+	if (queue->state != NVMET_TCP_Q_TLS_HANDSHAKE && !keyupdate) {
 		pr_warn("cannot start TLS in state %d\n", queue->state);
 		return -EINVAL;
 	}
@@ -1856,7 +1934,9 @@ static int nvmet_tcp_tls_handshake(struct nvmet_tcp_queue *queue,
 	args.ta_data = queue;
 	args.ta_keyring = key_serial(queue->port->nport->keyring);
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.user_session_id = queue->user_session_id;
 
+	init_completion(&queue->tls_complete);
 	ret = tls_server_hello_psk(&args, GFP_KERNEL, keyupdate);
 	if (ret) {
 		kref_put(&queue->kref, nvmet_tcp_release_queue);
-- 
2.51.0

