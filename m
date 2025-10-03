Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FE81F4CB7
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 04:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465942; cv=none; b=IDIDcDoktxejG4mbT3rju/ow6WTui2NNgpz+JFJDVYqhquTHMpzW1LQ/t/NnpUkNVjaEC6Z+7RDuLg58yUkYkqNpSYZAK3aGgoMdib/3tX9255cgCtEvDRrkNJatSKhm1LoRNfzajbaHPjmLCDS79EiLJiXLQE74QGkouV1eUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465942; c=relaxed/simple;
	bh=Z6w0x3oPOM6C3EiKqL/1mOmpceuMWimWzPhFuNGO/7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1ePyyEmLtrmpGrpmIxgHfxkMtF/Cv+NAc90/pZeDRUj/CT4vTvHuDq6HNNDcmaQJt6d8L36ZBfkws8UBCZS1qSu9qYJdC12SRMT7Pwlc34EayUl7Cx5+VM9uXqOVoBMqdoSmbKQq8L84ojptAa96xcSPj4EOwaI3d6UgGcUZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkI1BWbA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkI1BWbA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-330469eb750so2197694a91.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 21:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465938; x=1760070738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9morpPQKu8lXMrpuy/uDVQLBubkYtfu9D8D3JxjNjjM=;
        b=ZkI1BWbAYYeCs965+UolecO0r7VtgGHULzfHhuUUNERxLeJJLX1pHS11sWPeUkfU24
         ozpWNjAOTltHmvJQTLHFw0FFUCek/aA8U+RqPdziox7PN6MC7LMcX8ZCuv61JfvQuSlj
         uXGHw5y2pSt+09zP1WguikSu83BQERTFgjCdk+v9h0UiQ+/ldx76eoDBrAdgu6E95VVo
         iydUyuRwzcs4pJ3rQ38/SJiJpFWYZsZ7V8tnfDZ/YpBlgMlYs73nbTcHliaorwXyRKBR
         2W3I0ZxfvuE+1jJtL0C9W4YhVucgCBmLn7LrDdMJW5c/Tbrv08sgOo8Wygg+EjDUIqSi
         xx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465938; x=1760070738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9morpPQKu8lXMrpuy/uDVQLBubkYtfu9D8D3JxjNjjM=;
        b=FG9N5AP/yiwxZgXBPxWRgbYFinZnv/jge22X3fAApq2pQAC+AgbEzRzQx90jcrCHba
         X2ESbqzpm9kpu2Z+hys6TRYjrUFhTNSkuvoZljSDjKicDhP12kn4+JjV8YxO++5TMgTy
         ZcKD4JiAzsRXwIg+c3EmLI+0ma/RaSS8IFtONqQ6jFAvBZSFgX1A5azWkfDDIkfmmLQP
         yKfinN5cwxcWvESvxGi482OSDMrL1pU8m9hEcCvLo+qeeCC3jLhjMoP/Ank3y5yUTDK8
         pePduFrf4H45m60cuukHxW205JlrzVoAA9q6nyn0vZFDbcZ/YO+skOA6XjI2ZJipfFxG
         zy2g==
X-Forwarded-Encrypted: i=1; AJvYcCXRCt6pEDTDt4et1zguVZqdjcsI4jb4WTMe1fKkOgCHRRTwrnkqnVHWR8cYjoNliTgUsmIFSADsV1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXsVsILKoPMUyES7ctVqgBx3EoAZyJJFtS58U+0dFzwtAwzTD
	SX1tMQ4UJIUdlTMgJTaRMKatt4LxyNYnJq0n4XmRUYtwucE+b8pv9ftM
X-Gm-Gg: ASbGncs0RF0iitmz963RsoKZh0zScTkJSLjY9Le0i00eWj1T6lq1hcwO/K0YT/b5r/6
	L62XPNpb5IkSuoJ6A3VeVJxJLV4iI2uMeL5cVfd0fvBjjug/SYG6kuUvpA0lsbelviWvUmlU6wq
	it98MzPxd9hoyTsEESsXqrQOXqBkBZtxkKxAl9tnMbCeRgZd/1i9K/kBLuDvdX2az85QygtNYwX
	72ZeIeJcXSLT/dE7Iyhq3oG0oS/bwUuIYEYL/ZsZrwv+c/N3ktPuWuAwALrv4VAcHADb+tu7z4C
	bZpTENLZEvPA82YL0kJMkugziNnEm1+VkI0FLEbmB9E0CEay1gzg014R5/0qywJnzUC3cjhAc0z
	mflRrTUQJUTZdF5fOspjmv47689eynM8g+hs3tSya3R9MmTRuUiOJncEsBeDT1afgEKf7E2sa9B
	mXEqpOa7ZI/sTJzIL+V3U4DVk79euKP1ALUghiSGTFY9h8iAR/R7NG
X-Google-Smtp-Source: AGHT+IHs89hKTsl9/f/m+plS3Ev8/2NixvjRvxCPx92Pgo3FWsBpoEKCKAbX01MgtOEvv1xzIjE2Cw==
X-Received: by 2002:a17:90b:4b8b:b0:335:28ee:eebe with SMTP id 98e67ed59e1d1-339c279e977mr2022144a91.30.1759465938258;
        Thu, 02 Oct 2025 21:32:18 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:17 -0700 (PDT)
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
Subject: [PATCH v3 2/8] net/handshake: Define handshake_sk_destruct_req
Date: Fri,  3 Oct 2025 14:31:33 +1000
Message-ID: <20251003043140.1341958-3-alistair.francis@wdc.com>
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

Define a `handshake_sk_destruct_req()` function to allow the destruction
of the handshake req.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
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
2.51.0

