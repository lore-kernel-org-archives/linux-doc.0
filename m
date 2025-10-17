Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454DA30DD02
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 04:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675046; cv=none; b=JUh9awKfbt9bJ2yW3F9X8UlENPXsJcnVtSZtLI9oe3Qki7Uzj1IkydFybXW5KYcv2TDxIkvGVjcGwst2u51UM0s3YEkcyzLqqJfkal4cLIQXqxjws6i7gnHbMze6avH85IwBUb7h/MYP1T6kTppsfaopWgmkHuZDAlalTzPDJKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675046; c=relaxed/simple;
	bh=egKMjdwqXFVhXo0/qrA1CwLDO+yiuNAjeyMBOfRZGcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSEmZt3i2fw4fcKmbCJUWCJV1PHtZdUIgj+R9U11c59U0rs9rf4qRHkFDbSTvt1pgdAPWVHrXKMLVd8L+SVfTQ2+fQkHKz3SikpwuyBXz4UY8/VoqdxPwyp8Lec/tKMJQcOGd9UJSSZd3Rixkf5stFxhv4sDHD7JpidONUcXEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9kLgCPF; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9kLgCPF"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b5f2c1a7e48so959775a12.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 21:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675042; x=1761279842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynJnGU8No3Ej9J48gvJNh3pD5kzmZrz6FyAMKm2dKu0=;
        b=Q9kLgCPFd8C8xEHHLimehO7V7DjRAykcGUUK2NVEMMpfzhYLaPh8NMwhUVM8iKuSfe
         2OX6YM6dgtPi3VbF7GZrZjm93FCDZSDjDOb28gP9Lj9O6vJaylEmcAIdiziQCwPT3Ait
         sbVe08KrzOfVSKsUkQFXatBTyshY+GOYmON3iKALYcWoTl/uqa/AGoznUNI3LiE2QZDB
         dniBY5Quj24LVGeIae5FtAO/d4ozQ0A/RkM/Wy8+uM7nW68KILthV3CsfZCjckdCmRFd
         KoL88Yi7q7ToRP/F6BK8dbQDBsfMz417Di+iHMcoM15ZPZeAyTfl1MZB4P+zoL0q9lMK
         Vpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675043; x=1761279843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynJnGU8No3Ej9J48gvJNh3pD5kzmZrz6FyAMKm2dKu0=;
        b=qX1bN7+iOpBfZJXJQ5L35qrKwx+pHizfbjpTw3fa/TKnzQPrhKtVZqi6jqNFxkHyyg
         erGFfztDLyXcyIK4EqdU99lpS3JQ+Y0DN+osTqsFZo93g+CCnzzwR9d2YgtJ05/lm32e
         uRvoQ+nKgzINRfN1G8wup9w0FsaXlTGwEz18NI6rqY5iJ/HTg8qcVQ/MnWcMEOKYOFZS
         ttQ3ONrUb9QNBjzV1FpWxUn/6VnS+AHY1p6lLxZ4shL1jSkG9XvJc5GD52dYOg1TPH7J
         yhrRDb1qCJWKRA91Ie+w/aPMHvguYa6HMaPgFQMYnl+yVh5cFREgNkLxQSzCDn1qYOvl
         9v4w==
X-Forwarded-Encrypted: i=1; AJvYcCWoZCHgVmufcq78PnewKvgECxw4nT+riQboq3dQAC1Bgc97hXN8vnrpSl3gMF+lslE/yaArHVr24EA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ODVA2q6wUyk+EZVsaC5AioSb/Fr+jC0pCU5u+hVoanUGp3k7
	BboKFRuXPohUK608KKWRkftlelruKyu6Fmj8CZM6jiQx5hYx/18Ir11h
X-Gm-Gg: ASbGncskBWK7RcAMsA7+Q4yVzqkbXw1OyBIZ1jhuL0A1OYkbMfU1I/Oz/yGHw4VoAfR
	unFd7z8bAenRTV9h3MtjJcigaWsIGwxIW2lj+Gjz/46DaumsSzaq2YtL3sw655PAaoGdekmOV8u
	5k0wztdGrBorJq5fvxobCzgqhtv1RP8MYXA53fP5EELbf1h+1W1q3R7zCFh4os2KkK6yU4s/L1K
	UWx9jderhUd3nqUfFCFVJcw3J4bOysOXIV/Mcnp0QlI6Cy1b0//1tlkIH7zU2nGVHANhLq5CCRn
	iHsRHE2oP0q7XdAy7LM1xqiZ2rAM36jibEsCr9av6wqjN3ZzTwpjnEMGHxJIsTM5BOfRjb69yvs
	KuOh89yekFmOg5Pbh3GLrZhv/XQ+EwT0YcvOHS4AEGaipVpaUtKCVb7tzIyP7pZ4VDloRpO3gLB
	aC4fye8y7pfm34iKHBxeVuWNR12OFmn8IO3IQpBtCH/NzHUq6g2piCMFkC5o2zk2cwiznQEM6a7
	2Oai6ovMM8JM9DjD/69DHcM/lVWi38=
X-Google-Smtp-Source: AGHT+IFcY3veIMHOTTRwopAq4s0Ev1n9UH4zUIWfhrPPA4Ws9V39ePWtGb2V3y+JvQ2CTsDbOiB+pg==
X-Received: by 2002:a17:902:e88e:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-290c9ca6712mr28314355ad.18.1760675042582;
        Thu, 16 Oct 2025 21:24:02 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:24:02 -0700 (PDT)
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
Subject: [PATCH v4 5/7] nvme-tcp: Support KeyUpdate
Date: Fri, 17 Oct 2025 14:23:10 +1000
Message-ID: <20251017042312.1271322-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017042312.1271322-1-alistair.francis@wdc.com>
References: <20251017042312.1271322-1-alistair.francis@wdc.com>
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
on an KeyUpdate event.

If the NVMe Target (TLS server) initiates a KeyUpdate this patch will
allow the NVMe layer to process the KeyUpdate request and forward the
request to userspace. Userspace must then update the key to keep the
connection alive.

This patch allows us to handle the NVMe target sending a KeyUpdate
request without aborting the connection. At this time we don't support
initiating a KeyUpdate.

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
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

 drivers/nvme/host/tcp.c | 60 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 2696bf97dfac..791e0cc91ad8 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -172,6 +172,7 @@ struct nvme_tcp_queue {
 	bool			tls_enabled;
 	u32			rcv_crc;
 	u32			snd_crc;
+	key_serial_t		user_session_id;
 	__le32			exp_ddgst;
 	__le32			recv_ddgst;
 	struct completion       tls_complete;
@@ -858,7 +859,10 @@ static void nvme_tcp_handle_c2h_term(struct nvme_tcp_queue *queue,
 static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_queue *queue)
 {
 	char *pdu = queue->pdu;
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
 	struct msghdr msg = {
+		.msg_control = cbuf,
+		.msg_controllen = sizeof(cbuf),
 		.msg_flags = MSG_DONTWAIT,
 	};
 	struct kvec iov = {
@@ -873,12 +877,17 @@ static int nvme_tcp_recvmsg_pdu(struct nvme_tcp_queue *queue)
 	if (ret <= 0)
 		return ret;
 
+	hdr = queue->pdu;
+	if (hdr->type == TLS_HANDSHAKE_KEYUPDATE) {
+		dev_err(queue->ctrl->ctrl.device, "KeyUpdate message\n");
+		return 1;
+	}
+
 	queue->pdu_remaining -= ret;
 	queue->pdu_offset += ret;
 	if (queue->pdu_remaining)
 		return 0;
 
-	hdr = queue->pdu;
 	if (unlikely(hdr->hlen != sizeof(struct nvme_tcp_rsp_pdu))) {
 		if (!nvme_tcp_recv_pdu_supported(hdr->type))
 			goto unsupported_pdu;
@@ -944,6 +953,7 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_queue *queue)
 	struct request *rq =
 		nvme_cid_to_rq(nvme_tcp_tagset(queue), pdu->command_id);
 	struct nvme_tcp_request *req = blk_mq_rq_to_pdu(rq);
+	char cbuf[CMSG_LEN(sizeof(char))] = {};
 
 	if (nvme_tcp_recv_state(queue) != NVME_TCP_RECV_DATA)
 		return 0;
@@ -973,12 +983,14 @@ static int nvme_tcp_recvmsg_data(struct nvme_tcp_queue *queue)
 		memset(&msg, 0, sizeof(msg));
 		msg.msg_iter = req->iter;
 		msg.msg_flags = MSG_DONTWAIT;
+		msg.msg_control = cbuf,
+		msg.msg_controllen = sizeof(cbuf),
 
 		ret = sock_recvmsg(queue->sock, &msg, msg.msg_flags);
 		if (ret < 0) {
-			dev_err(queue->ctrl->ctrl.device,
-				"queue %d failed to receive request %#x data",
-				nvme_tcp_queue_id(queue), rq->tag);
+			dev_dbg(queue->ctrl->ctrl.device,
+				"queue %d failed to receive request %#x data, %d",
+				nvme_tcp_queue_id(queue), rq->tag, ret);
 			return ret;
 		}
 		if (queue->data_digest)
@@ -1381,17 +1393,42 @@ static int nvme_tcp_try_recvmsg(struct nvme_tcp_queue *queue)
 		}
 	} while (result >= 0);
 
-	if (result < 0 && result != -EAGAIN) {
+	if (result == -EKEYEXPIRED) {
+		return -EKEYEXPIRED;
+	} else if (result == -EAGAIN) {
+		return -EAGAIN;
+	} else if (result < 0) {
 		dev_err(queue->ctrl->ctrl.device,
 			"receive failed:  %d\n", result);
 		queue->rd_enabled = false;
 		nvme_tcp_error_recovery(&queue->ctrl->ctrl);
-	} else if (result == -EAGAIN)
-		result = 0;
+	}
 
 	return result < 0 ? result : (queue->nr_cqe = nr_cqe);
 }
 
+static void update_tls_keys(struct nvme_tcp_queue *queue)
+{
+	int qid = nvme_tcp_queue_id(queue);
+	int ret;
+
+	dev_dbg(queue->ctrl->ctrl.device,
+		"updating key for queue %d\n", qid);
+
+	flush_work(&(queue->ctrl->ctrl).async_event_work);
+
+	ret = nvme_tcp_start_tls(&(queue->ctrl->ctrl),
+				 queue, queue->ctrl->ctrl.tls_pskid,
+				 HANDSHAKE_KEY_UPDATE_TYPE_RECEIVED);
+
+	if (ret < 0) {
+		dev_err(queue->ctrl->ctrl.device,
+			"failed to update the keys %d\n", ret);
+		nvme_tcp_fail_request(queue->request);
+		nvme_tcp_done_send_req(queue);
+	}
+}
+
 static void nvme_tcp_io_work(struct work_struct *w)
 {
 	struct nvme_tcp_queue *queue =
@@ -1414,8 +1451,11 @@ static void nvme_tcp_io_work(struct work_struct *w)
 		result = nvme_tcp_try_recvmsg(queue);
 		if (result > 0)
 			pending = true;
-		else if (unlikely(result < 0))
-			return;
+		else if (unlikely(result < 0)) {
+			if (result == -EKEYEXPIRED)
+				update_tls_keys(queue);
+			break;
+		}
 
 		/* did we get some space after spending time in recv? */
 		if (nvme_tcp_queue_has_pending(queue) &&
@@ -1723,6 +1763,7 @@ static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid,
 			ctrl->ctrl.tls_pskid = key_serial(tls_key);
 		key_put(tls_key);
 		queue->tls_err = 0;
+		queue->user_session_id = user_session_id;
 	}
 
 out_complete:
@@ -1752,6 +1793,7 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 		keyring = key_serial(nctrl->opts->keyring);
 	args.ta_keyring = keyring;
 	args.ta_timeout_ms = tls_handshake_timeout * 1000;
+	args.user_session_id = queue->user_session_id;
 	queue->tls_err = -EOPNOTSUPP;
 	init_completion(&queue->tls_complete);
 	if (keyupdate == HANDSHAKE_KEY_UPDATE_TYPE_UNSPEC)
-- 
2.51.0

