Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D42D94B7
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 04:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762921700; cv=none; b=mJBDCoUrfS8TFFkitgZMWHONzkRAqNU4dUHyVveDi+UEvkagve2yobNEic/Rw3rFvQZMA9n0/WIKaLhJUevya5QNxfrAEzvvofahEHIsFno2V9rfOEQNwnnVZGgCMreCFBrTa+E/rO1gx0euzdJPSeOFLpjY1EMYG0c1RFHV/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762921700; c=relaxed/simple;
	bh=jaHChIsFwQccM67eVRPs/t3TxiMgA+k62NpjHrap2Rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BF7zl94VsOzAFM/q82LMxlYdpTYhiRHumBRiL6xzw7CFOdEo+qwpT1LybgstRiAGoHGENr7Ji6+/Oi5/44xGIqwNaGQgzAd5GwwhVmViZWVadG3WdvcqV47HpE2qM1aip63OFVl7cpgphzBLPrWlikx5meguksWpzsettmg0vhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoE6Xg4Y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoE6Xg4Y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so362333a91.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 20:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762921698; x=1763526498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfXE4RQsTo13oDtpS18/YqY50MP5ENyfIi78Z5opJm4=;
        b=HoE6Xg4YO3Umx5sJsEPhcNawAdjSYIbUpnrsed1+S0199rZk+FR1EoJ05G27zsSV1D
         UyShQv71scLUb6Vc9VZnQ4PA+aHxA8KOThr75eQAWCOfVsclvUyRnocbyLKQaION8e5i
         ugAw7DAisys+tRTUtRAZiFOWw2ebJSalNIYMUFgl81u9aMO6LnHJShoHh+a9MfKYhjNb
         /zq349rCkoAYeqx5jm4W1nZyNKhaMYEuIe7L9mjwiMWYNWT8VaTaLM5eeSDmk6ao3rHP
         5x8STq0+j7NmQOMOcRQsO/2zHwuq4CKefPlQ9zoasrzvYbna+nSTVgE6ExVuc7KNb7cX
         xgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762921698; x=1763526498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TfXE4RQsTo13oDtpS18/YqY50MP5ENyfIi78Z5opJm4=;
        b=BCc9g4Eg3BymRIpI3+qZHbRr39j2VCddNy0MjOumCHf77UnHTVhaBrbwHvIcWJkMoc
         qz+X2VRIwYcF/Mgm40XoMf+pt0vnSijSYvzMEdpNZLue1Bb4Ajo0a2OgxxgfllHoOnIw
         BMq+rvyS+kbgWSG13uGQmYOom/1qMWnPVu/PeDM5x0JbUbrTPfR0or4m0UNgsDqRd87F
         CGETHwSEJGMFmxePsM4vqD0ruBSDSIECG2e7Ohg/SldeYqLUNLNjA+6RzawIZUSfRSFR
         1elbI7Br4Vh5j7rt7rut4/4jmUzH2h1tYd8xHdlpiuhjCb84FyuUhm6zemjhrtAMV9vu
         KKqA==
X-Forwarded-Encrypted: i=1; AJvYcCXuWbfpAMVFEIqlutFqzUuDkDaTVOi19ijIlvyqYsa625rGFeeeIgVfAYQQZwWqMn+PVdlS3kB+ps0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOnMEmdy67F0gvW21xT5n0ZYiA6DrWf/5ShMqqk/DJkxcNoNHV
	DzOf/AfvgLUuIQIUsz3hNIwgMAbhScDAxkcJBz9IN1f6gmrM68Wzg5LT
X-Gm-Gg: ASbGncsorS35cxoFU3nF1RFVQPVi6XzzKcBiuEgnFvRpT8XUZBYjMLJt7/auV16ND8i
	7EcvjwKg65lpKU3tlQzQY+KeAHg2KRpaxHrgGOhSMc43/ygSinx07gAbkI80Oq+4dRPVNyTHHnv
	xpaffnIzimUXbuK3gPNfDlLYnmt346DHrG6oOwIX/rYJB6xFpz8RfYe7465KYObNfKsYP5UAwyL
	KW9sca7CJpWlPEGG0LCSdcf9ibk+6hf2tEuIiqgYadv9Kjlw2o9kFvDLIbyyLGmpr2ZMVaVDj8D
	Q4W7BY+v8pJ4aMn/MAUeJJ8YaZpAb1L5uLzVe8ZLP3+SzXcITT7OunkLIkKGm0/VQcQFSMN+zBr
	97tnDw0ueObnOHtU9KqtC1XuUPO9NU5AHoCOIb5Jx8Gq5s7rlziVimZIu5HwC1GwU67yRfmPKxl
	Iiu4hbBCPcN0YzH+xyyhbfIbwr3eLESGwMc6xPi4GkgGjWYnE/kH3FhY0uuzsUdWMMXsVZSFSWw
	hEzguZKAQ==
X-Google-Smtp-Source: AGHT+IGasMEo2f3YSuRreEs/8zog7GQY45X0or6PmRJCkVtaVHjxXqWGnHYHC3SejrjGvw9vVcyiWQ==
X-Received: by 2002:a17:90a:fc50:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-343dded5123mr2073086a91.37.1762921698484;
        Tue, 11 Nov 2025 20:28:18 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e06fbc0dsm854681a91.2.2025.11.11.20.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 20:28:18 -0800 (PST)
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
Subject: [PATCH v5 2/6] net/handshake: Define handshake_sk_destruct_req
Date: Wed, 12 Nov 2025 14:27:16 +1000
Message-ID: <20251112042720.3695972-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112042720.3695972-1-alistair.francis@wdc.com>
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Define a `handshake_sk_destruct_req()` function to allow the destruction
of the handshake req.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
v5:
 - No change
v4:
 - No change
v3:
 - New patch

 net/handshake/request.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/net/handshake/request.c b/net/handshake/request.c
index 274d2c89b6b2..0d1c91c80478 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -98,6 +98,22 @@ static void handshake_sk_destruct(struct sock *sk)
 		sk_destruct(sk);
 }
 
+/**
+ * handshake_sk_destruct_req - destroy an existing request
+ * @sk: socket on which there is an existing request
+ */
+static void handshake_sk_destruct_req(struct sock *sk)
+{
+	struct handshake_req *req;
+
+	req = handshake_req_hash_lookup(sk);
+	if (!req)
+		return;
+
+	trace_handshake_destruct(sock_net(sk), req, sk);
+	handshake_req_destroy(req);
+}
+
 /**
  * handshake_req_alloc - Allocate a handshake request
  * @proto: security protocol
-- 
2.51.1

