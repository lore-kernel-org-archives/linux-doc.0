Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0776121FF38
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764639320; cv=none; b=clbZyPsyS3iQ9BXeujrWyNwRs0+aL7Vv4+gbfgl7sn3xOJK3iDxYutY4uePK2NMFdyu1vxuNiV+c5JhIQiRMIkoZivK+HlFhrcc6p9JNpb+Zx3jSmY7TZG0JuOfgPTgpzg3xJvgsFa7dYLELJ6lG26nLof30xQvUdaMGBkqUCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764639320; c=relaxed/simple;
	bh=vxpkGccNVOzZnxnGt+XxGTh2tk/X17iKXQnOD/cPnrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IelINslWeC+loZPKQ2DzXSTSgdHxEzY2hMjza6ur3CdvpbhnFILI6rTJs4KTIK58AISwDADrLTAIO4BS3PKQEaxpa87TIikh8PFYkD3qn0+LyMUk99JeC6C2yZ/ITCqnU87y1Vanj5sjn2Lr+xHt68pMB8cKmb1t1Ov2PW9NKi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2rEX/vB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2rEX/vB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297d4ac44fbso32155025ad.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 17:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764639317; x=1765244117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czIyAwG2XcUYBMND32our9jihcE3M72DjVQfcH7wVb4=;
        b=c2rEX/vB0yOkHxxHbXx/PQluwv8O5A6DKW+Tzr4JM7ySrR5wuOWafV+VFh//D5AzEb
         SNm6r5Zy38jGGqXsqvxh/ByS+bFnZX3HXUl3RB/LER2Ybwc8ds7JI9x7brveA46+dDBv
         cOBmDCErqF9704Xx6PkYkk8U0qTmS3SClttUujfLmnSr4e+PlH8V/GfwKzDNwC3/JB4M
         rCxlVswlq0cSUblTQMxrlaelaXGH9aK/Z9oHy1PXKjK2IziPlG2kEsX/5ldkPMAwRUgX
         E72bV88i3bbYlOyVXDIED+hBggFm1zSLL7CxYpqU7FneUuYq1StucDqqXXiOcDJVINnm
         9wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764639317; x=1765244117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czIyAwG2XcUYBMND32our9jihcE3M72DjVQfcH7wVb4=;
        b=tAcEzWzRMOi68vvPggoS+4B2du0JcEkR1uyVDvAOH1c3xnOTvINH8V097KzhngMDqt
         HBMkXAwu3Y82mGJijWwvYEtBIWdH/1+mwQQ8lQXJ8hy23FX8Vxy92kGZslW/vrsExX3A
         qepok6R/1jTjGM2S0abMF5NG2nEFYMl1/q0pmVzNgBMNPWwoma00YiwNH0/2l8zmeEJq
         NBp6XD64Qkdu2Q7ngVgWSjFh/zC53DMVW13mOhQVs3ikh02Vex5tZ0sYlaDMPAFNx0i/
         RECOTPhDl3FTgtpypyCqDjBTswuMcZ2OvKDV7sK3oqqHhRb+XbP5lX4qf27U5uNOXDjR
         yuzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo5vjdWbnN79hLPYq1CvtzYAu4+vj3nfyjd4BCM8MeqTkjPHC/rSBihONuENj/U3BjCW6A7HKc9Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5nBPVvsSkDvOLLYAA5D+ubNJJAzIJ+U9VIieZ0lAj8ZvEqDKN
	TbZVrYmW/D8x6mhCEgUgAqdNLQreC707PTwP0n7borV/RKUMpwvuo8VI
X-Gm-Gg: ASbGncvdqjLHQJd4l2xlMNHUpTSoZwudlLinhEgrfgnTrr75BD8cJ2gwsLZ7ct7dy69
	xa3d8ze2pIZq3YNWZ06o1fMKeBfKeF4S5Yed+E8+mMvVY4/I1Z82GxesaYLxP6pfqS9mK69iDhp
	XryKVmNAzkr3hHopq3GSaxTHSzkGdi33G+owReUy3zUwP5fmrGXteHGRD2Y2yxC1CYbze4Sj/su
	paxm+PbqFjvf/dMaXyRmb7sKZQ8+HlRS505jV3NivZMLr0QrVClKo7KnFtnSN1RzqhCL7TycD6C
	vC/1pAZgH6wBcR49brCvjDqsM0rfYn8tqkZpNlo7TFa6dPrur5XIGgI0OVHLdrl/1QnTKuqBZ/P
	tV4rt9An/K9B6tGnnwa5dV2JYBBX0DFUI7YFtA02KOZHreMqSiGzBjDyYxh1GMkNogsSVYpy0Ml
	hjk+XzCvf2uVNOcA3s/72DVrZtBEymUVYW6tpal/Nulu3St9wOjUssasy2i+SMk9ZXAmQ34RdV0
	A0CXfzMmuW8FNdjobQ=
X-Google-Smtp-Source: AGHT+IEg+/N743oXcIq0ciRB44SxAmj3ck5rf7L8gATspDeLcAoYxScp44MI8ISyD4Zq0PaY2ptvmA==
X-Received: by 2002:a17:903:1b03:b0:295:5da6:5ff7 with SMTP id d9443c01a7336-29d5a5379f5mr8003195ad.15.1764639317177;
        Mon, 01 Dec 2025 17:35:17 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb54563sm132378575ad.89.2025.12.01.17.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 17:35:16 -0800 (PST)
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
Subject: [PATCH v6 2/5] net/handshake: Define handshake_req_keyupdate
Date: Tue,  2 Dec 2025 11:34:26 +1000
Message-ID: <20251202013429.1199659-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251202013429.1199659-1-alistair.francis@wdc.com>
References: <20251202013429.1199659-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Add a new handshake_req_keyupdate() function which is similar to the
existing handshake_req_submit().

The new handshake_req_keyupdate() does not add the request to the hash
table (unlike handshake_req_submit()) but instead uses the existing
request from the initial handshake.

During the initial handshake handshake_req_submit() will add the request
to the hash table. The request will not be removed from the hash table
unless the socket is closed (reference count hits zero).

After the initial handshake handshake_req_keyupdate() can be used to re-use
the existing request in the hash table to trigger a KeyUpdate with
userspace.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v6:
 - New patch

 net/handshake/handshake.h |  2 +
 net/handshake/request.c   | 95 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/net/handshake/handshake.h b/net/handshake/handshake.h
index a48163765a7a..04feacd1e21d 100644
--- a/net/handshake/handshake.h
+++ b/net/handshake/handshake.h
@@ -84,6 +84,8 @@ void handshake_req_hash_destroy(void);
 void *handshake_req_private(struct handshake_req *req);
 struct handshake_req *handshake_req_hash_lookup(struct sock *sk);
 struct handshake_req *handshake_req_next(struct handshake_net *hn, int class);
+int handshake_req_keyupdate(struct socket *sock, struct handshake_req *req,
+			 gfp_t flags);
 int handshake_req_submit(struct socket *sock, struct handshake_req *req,
 			 gfp_t flags);
 void handshake_complete(struct handshake_req *req, unsigned int status,
diff --git a/net/handshake/request.c b/net/handshake/request.c
index 274d2c89b6b2..916caab88fe0 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -196,6 +196,101 @@ struct handshake_req *handshake_req_next(struct handshake_net *hn, int class)
 }
 EXPORT_SYMBOL_IF_KUNIT(handshake_req_next);
 
+/**
+ * handshake_req_keyupdate - Submit a KeyUpdate request
+ * @sock: open socket on which to perform the handshake
+ * @req: handshake arguments, this must already be allocated and exist
+ * in the hash table, which happens as part of handshake_req_submit()
+ * @flags: memory allocation flags
+ *
+ * Return values:
+ *   %0: Request queued
+ *   %-EINVAL: Invalid argument
+ *   %-EBUSY: A handshake is already under way for this socket
+ *   %-ESRCH: No handshake agent is available
+ *   %-EAGAIN: Too many pending handshake requests
+ *   %-ENOMEM: Failed to allocate memory
+ *   %-EMSGSIZE: Failed to construct notification message
+ *   %-EOPNOTSUPP: Handshake module not initialized
+ *
+ * A zero return value from handshake_req_submit() means that
+ * exactly one subsequent completion callback is guaranteed.
+ *
+ * A negative return value from handshake_req_submit() means that
+ * no completion callback will be done and that @req has been
+ * destroyed.
+ */
+int handshake_req_keyupdate(struct socket *sock, struct handshake_req *req,
+			    gfp_t flags)
+{
+	struct handshake_net *hn;
+	struct net *net;
+	struct handshake_req *req_lookup;
+	int ret;
+
+	if (!sock || !req || !sock->file) {
+		kfree(req);
+		return -EINVAL;
+	}
+
+	req->hr_sk = sock->sk;
+	if (!req->hr_sk) {
+		kfree(req);
+		return -EINVAL;
+	}
+	req->hr_odestruct = req->hr_sk->sk_destruct;
+	req->hr_sk->sk_destruct = handshake_sk_destruct;
+
+	ret = -EOPNOTSUPP;
+	net = sock_net(req->hr_sk);
+	hn = handshake_pernet(net);
+	if (!hn)
+		goto out_err;
+
+	ret = -EAGAIN;
+	if (READ_ONCE(hn->hn_pending) >= hn->hn_pending_max)
+		goto out_err;
+
+	spin_lock(&hn->hn_lock);
+	ret = -EOPNOTSUPP;
+	if (test_bit(HANDSHAKE_F_NET_DRAINING, &hn->hn_flags))
+		goto out_unlock;
+	ret = -EBUSY;
+
+	req_lookup = handshake_req_hash_lookup(sock->sk);
+	if (!req_lookup)
+		goto out_unlock;
+
+	if (req_lookup != req)
+		goto out_unlock;
+	if (!__add_pending_locked(hn, req))
+		goto out_unlock;
+	spin_unlock(&hn->hn_lock);
+
+	test_and_clear_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags);
+
+	ret = handshake_genl_notify(net, req->hr_proto, flags);
+	if (ret) {
+		trace_handshake_notify_err(net, req, req->hr_sk, ret);
+		if (remove_pending(hn, req))
+			goto out_err;
+	}
+
+	/* Prevent socket release while a handshake request is pending */
+	sock_hold(req->hr_sk);
+
+	trace_handshake_submit(net, req, req->hr_sk);
+	return 0;
+
+out_unlock:
+	spin_unlock(&hn->hn_lock);
+out_err:
+	trace_handshake_submit_err(net, req, req->hr_sk, ret);
+	handshake_req_destroy(req);
+	return ret;
+}
+EXPORT_SYMBOL(handshake_req_keyupdate);
+
 /**
  * handshake_req_submit - Submit a handshake request
  * @sock: open socket on which to perform the handshake
-- 
2.51.1

