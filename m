Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268430E0F4
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 04:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675026; cv=none; b=Nnfnh3bIBSH5LpB4dwApBgiTYTEir6K0RG6SaJoaTZPtJyLzoDpZQZmouKvLsDbCZj01+TQu3tXgHYhZ9SwRxF9uIVqOYbamcmiljiqD+Zd1StJEwh3uqbc+09/dLgKg54bfANPlD+z/Kv2VYib/hK1N8EWVuhPojznhEuvVHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675026; c=relaxed/simple;
	bh=37YeEv3sX+mmDjcIQ5fmoI0jB8MoKSf0MBI8d/gZIrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsWuZ/LJ7JJQrpncDWer6oQbS97AF5hC13Vt403QXXlUE/oEgy0+UYPxdniQpVIxmJ3mcdaZ4qKldNEOE34JdvEwV0P0JEUaQ+59LHFc/n53o6LKXdaJNgyBL4QS8bTo9hQVyCz/S+Oy5DfHzlizm02nVdpjDnNwMeMptRoeeAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VllHUtkz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VllHUtkz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-290b48e09a7so15133515ad.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 21:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675024; x=1761279824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhR6OqlULE14euOr7SOeJPbIcbHzF9rdhJ80nFJJwb0=;
        b=VllHUtkzMpkUXDvPypYbSO7h4bOUgAdTvvSKA0faHZYqPsXz3wQX/CK2IaTCL9+7jc
         3y7IrDez1pdZREPnV45jiEcl0FXjMh3E8OdTG7Gw5Iu9bAryYuxNucYUQWFpNDOATIo/
         5KVTpWnIioxUCqHO2oPvEaBixWNCGtfGrhyoa9mjqZQaOxjQybUYkzRAqeBUNkqYzcRK
         XiRAHrUxXPKXFE7J/OSXNDyXNn7SobMth4W5M3eGKfKTlmk8nXIsTShtpgS/wX26O5yu
         V/mVww6ON1msCEYb/3cODPaOOPlFJSc/QiLTiVOzeSuJxboqBXAWYIpVWgVGGJxbFmJK
         AV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675024; x=1761279824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhR6OqlULE14euOr7SOeJPbIcbHzF9rdhJ80nFJJwb0=;
        b=ZKXsk73Frt2tF+88H7k2mR3pgiYeTSImKuYPbBplkGSXRuzNhcHGpiG75nRuPucvhg
         dC/dzgCAOIvyrQ2lgZyXEzTJh7tPjASUPIPUf2SJ3Y33axRrD+aBSmxm6ilAkT6rJMR4
         MbZWJzST0JWRuiuJT+tiGK7LVVLvZvqErkTBaRLlkhAaVP3uPirmD5MF6M51WLS5g67n
         haxU+EfTgIvlBLEPx9uld9nPiFz0HziQDyJ1/Uc9x+why8fkRifVBt88wKD1EaJShmTl
         tDeyc2+0JBMnCG8cCGyR5/Ez/Grv3iExX8D5svamWMm/tkfd/H4/FXR2f5NVNIWw5bVs
         QxLw==
X-Forwarded-Encrypted: i=1; AJvYcCVNexmQ9FC91lmMZfuNN00ScKwTFNt5TJ2QJvb0N1zjWfQGXf/mQkhROeSPstm/AwfF2NAOOPytTck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRSUOYvA0gJSOsTl+OngOCF36mpHw1Dd9jTb3a+XCtus3Az0nG
	RznwoGcfbH+q4vyhD6fwi4cosAJLCzMOPQNeQLF3xMy/nKFCzMzMaKGa
X-Gm-Gg: ASbGncsFmcwu4C3f+sxeUGtJeEk+4ZQKHbBmZqNKbNmJjvvqYdEXN9ecqTn1FQjXw72
	mO4fUF5z/PdBr+ESq46dk1WmXv+9xUbOauh+wlHksVG0+/rzcfvSWEcEuJAjA3MXptfPDLXl0a/
	qdYrTrS71ZRDdYC1pqu+miSDhF2hd7pfFWjNdr8ET7SWpaahuqzEUD5L0XPmCyIsiDOGZKlXWBx
	5429vqaYciT/wFX5Fdl8FlcNpZGhvn/cWyk5TU3ROFpoMEua+qL9bt7uPeSv9MCAIM57PEYTXpD
	BtLBvonLvIxM6kBkQQyBiZhyH00V0GtuMUGwQ0MVhbJCPpOscVBYGihpt5YSxHfGCLf1ceKci9X
	MY2msEQXKDWcSB3/oOv2T/YI0VWfYFVm/5ICCtIvNlAJv9tW7pVe1XrP6/UC1LomhIff1udj5Z4
	n7X2xaK66xsXBpQj8t+MfGaLBwmahWcyEdbJcNB+q0dDADJuG9zI9akgLZG2es221MTQQF2zxeE
	mGpLSxCUDvot2O0zqMg
X-Google-Smtp-Source: AGHT+IFs1j5KeQPUYHknhxmr73Cz8lIn7tiQ+fRQndA5W23hoDMgcJ9Yk8+rVDxwb74P5c6XfgnCZQ==
X-Received: by 2002:a17:903:b90:b0:269:9a7a:9a43 with SMTP id d9443c01a7336-290c9c89fdfmr20658745ad.10.1760675024212;
        Thu, 16 Oct 2025 21:23:44 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:23:43 -0700 (PDT)
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
Subject: [PATCH v4 2/7] net/handshake: Define handshake_sk_destruct_req
Date: Fri, 17 Oct 2025 14:23:07 +1000
Message-ID: <20251017042312.1271322-3-alistair.francis@wdc.com>
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

Define a `handshake_sk_destruct_req()` function to allow the destruction
of the handshake req.

This is required to avoid hash conflicts when handshake_req_hash_add()
is called as part of submitting the KeyUpdate request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
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
2.51.0

