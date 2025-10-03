Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AC41F4CA9
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 04:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465946; cv=none; b=HTX7ShMcOvAcH8JeWRQhkFyTaRKLZiIJ6AmltyIy4dIML6EyFG6r2xTJbZ51pOVRz543E/4zY5nUQdedUOaVUhNYMTAD37NDjPedaTnhRweD3qNd4uIm9I2KHj6ZOLxUo7Ht79h1SW66uiCvr5H0fPWOXA+OZea6ov0UdgnSGlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465946; c=relaxed/simple;
	bh=Bl1TRunIta5QQDe3lRPwonbH+J8i9iNM2VxNxK/XmSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qf7KfD1yGc8ND4Cy+4MVHcftxZlHVuNC0jovSfDUqVdui62QtM4PYS/9JKyL8ymrs6ao2WC5VrW4C3AdkNePhPHmxKqh7vR0q8ibRO1hENjlmurWPU7HMtXtuTh8OswS0rONimlhL2CxjZkuCl7nEWFIIL0bc4dKSd4mWQrBCdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzEl4koh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzEl4koh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33082aed31dso2074936a91.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 21:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465944; x=1760070744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOV0qGYLCq+9ZQ//0z9A3z+3aG29/4P327MFfqw2xrc=;
        b=CzEl4kohMhiLGU72A5sArwP+L85QrX67hhJCG3zfczH5RdLXwJ0vzTKv8GqcLt/vu+
         1M3Aw781chc/cYYd/twjVhnvfx377c0fQo7ym4pFuL55xWQ+GxPGILVY1p1Q7YhqcI2n
         N53FYvgdCFEN2LLyxsaJJ7W7WQ55rWANY/ziMWRPFB7o7DiMbMaWx+kFVIWppCSpgMn9
         i11gloJmrGfnF656rGXnu19dPcCrSA8QFG9cc8iouylfpZZFrZlTSLx+ULenE+4rIrXR
         60LTItEVahVkLSp49+MPKEI7p995x4xnc4CGPdkhRULDj7et7w6cJc0yE1eqOa1FnIQM
         dqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465944; x=1760070744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOV0qGYLCq+9ZQ//0z9A3z+3aG29/4P327MFfqw2xrc=;
        b=u6N2OR3CZ9JwnxK1f+g3td8yAPqaRr+xgurO7Auzvwry68qR53z2EyP9LBmh79GSaz
         GQnHQdFGMhX/m1ZKXA4wUe8ATP7NLjIFzdYLDqV+tueQ85tiEHAf8FqRC8BcU2SHwiFM
         SQHXnb6HWqt44o9xGZ6P0hCdgo0Tl4k2ykTsL03cMIAwXge/GGQAgEgHJKo+FOI8rN6v
         5ayMN+3UPQBPD45PIZbdOEZCDZ8J4+oILw8fS9LCCFJeoDsUddxOLvIWGNyiVefW0In3
         64GogBThXajARhyjhv0wpciAo0c/jUiKWWCouuLsril+VBZQjtFSnfxHMf+/JsQKCApE
         SOPw==
X-Forwarded-Encrypted: i=1; AJvYcCVf0ckmbW8lM9Zgg4GpDmCjRi76pu62mdsCOzqqABHWUg1DWgIEs0DHPicmVrbLA/UT0+6Q5Nz8m2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+2/iPPp5DhP+/AdzOPE1fWbn/wzeLkGvnYtkmbX/91o+PX6n
	OHm+hQV+6YKCQ0FOdAnxWuUD2IYta1C1Q3PPQTJPj+sZxN1e+Tx60ca1
X-Gm-Gg: ASbGnctVekFxMlhGnTdtTh7SJMpFL6/MsKn4GvTvoEsa8g6hLXX1Jxwjg9pDHULZG/D
	ceZ6zI9PRxByfRsDGBked5JanvVp8BBcNYAbu+dep2g59KhotdS7irsCRWhoXfyaOf/UAeq8fR9
	xJvZfEhTn9xQ89y/Q2jdvMckh5UftWS0KP2bKbtYppyok7osrTfWXWREkcwRxE575WriileqyOV
	2jLYI/Q8ZWWzK1wx58yMKOxInPNYYJYeOxP/savgkU9EnF6T4vX5wIHuL7tCWc31RgLAjP19hn5
	uk11hWZDBCCTQSB21Bw2gOFj2K1xOZnmVQp7xYbHbSxPebWNhhi6+rpfXzqOV7hZxN1/LOQsJWX
	TrMYUC6yQEmVsCXuJVlnMQvTMuwfQUyUe7FOuV+yBkq7Gw5/y+H6xTXl68Pp3IiYs48xS08QpJ+
	jQ2Moh/RS0neagsw6vfiCl3W1YSLdUS6QDaj35EJ1d+Eifq971Nf5E/qfpiRs/Lgc=
X-Google-Smtp-Source: AGHT+IGCDoUIKtDX/52HGaffkclK+hmjaIJ+Bue+zX3dUNN6Q+cAazG3rbJtO5YII+rQ/2wJMc8/6A==
X-Received: by 2002:a17:90b:1d92:b0:32e:389b:8762 with SMTP id 98e67ed59e1d1-339c264f452mr2016481a91.0.1759465944489;
        Thu, 02 Oct 2025 21:32:24 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:23 -0700 (PDT)
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
Subject: [PATCH v3 3/8] net/handshake: Ensure the request is destructed on completion
Date: Fri,  3 Oct 2025 14:31:34 +1000
Message-ID: <20251003043140.1341958-4-alistair.francis@wdc.com>
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

To avoid future handshake_req_hash_add() calls failing with EEXIST when
performing a KeyUpdate let's make sure the old request is destructed
as part of the completion.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - New patch

 net/handshake/request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/handshake/request.c b/net/handshake/request.c
index 0d1c91c80478..194725a8aaca 100644
--- a/net/handshake/request.c
+++ b/net/handshake/request.c
@@ -311,6 +311,8 @@ void handshake_complete(struct handshake_req *req, unsigned int status,
 		/* Handshake request is no longer pending */
 		sock_put(sk);
 	}
+
+	handshake_sk_destruct_req(sk);
 }
 EXPORT_SYMBOL_IF_KUNIT(handshake_complete);
 
-- 
2.51.0

