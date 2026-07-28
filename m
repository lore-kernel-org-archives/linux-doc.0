Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1A3A783F
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 05:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785216317; cv=none; b=ODfb0IBmTMqQpGseOKs/26wgbH65hK+UC2T4DhrZQ+HfHH1uaHPe1O/xgN1jB9Mem01Y4Axwxj9pcw5h/0HR3gOykHlQ46+88+cfK0M/cMrEeld05aNHRdiNpuLa88bZFKt+n0EQY5b15wavXUjUu9tIRWbf7hWnVak24Sc2+BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785216317; c=relaxed/simple;
	bh=UFgwWFaUDHNfS7pe9YQMo1osWM7ZIU7JHCt0yYbjg5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0d667R1DHIKFooX8qWR1LGgF/uHeSJNqdZTD6UBSsFXzqS4wqdcbutHuUxZF/gAsa+wAcK6NJSJesGhtiGdC40Qqs/X/fuCDNadtZJ6d02qioT3uq2pNm0Q4UsIOKQmYAAkYjDjOIYw/zFDWrG4r8MYrFTLLc160tTX7xbc+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WapjTEQm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WapjTEQm"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dcbade417so3671709a91.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 22:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785216316; x=1785821116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ystWRSu0XGzWLVNCp/qZNWLqhKRo+gG6ngoi7HTHAw=;
        b=WapjTEQmaUuQRP0mz8HApPfyFRyXeWTnQuqPbvtAYT07mT2WZrxziGY8gd3m5ELnOB
         FjdsCRswGdQLmhX0bhBRrltlV6LCJ1Vwx8574OtxsLjWYpFiRPrn9WiyUg7XmeqznzMK
         iJFFwYwOXj8iZjgGp+lEx4yjuN+sd1LJ7xnuMiPOdau4TuaVMgmfhdrpORnmbrvnUc/y
         ZmENDttNVjJfgRzhQUKEvPKQxVUc7uvnIN2gUexUTFZeLgnGTZenx0CVqiwnxFmhkIR+
         8A3CwJAl4n8gl/LRFtXwD8hpKtDO+3NgEfVsWi0JArcyUKGsFs3lVhW4xp61J5e6l68e
         y8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785216316; x=1785821116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ystWRSu0XGzWLVNCp/qZNWLqhKRo+gG6ngoi7HTHAw=;
        b=bNpS3wW470Syg7qhd9cNVU81/OokPBGq7XPxOedbwCJD1KC1fdi59mf1eQdf1NwSO9
         Sd1jDDctqIXNjkBhpVVEyGgx5mi2nrhU9LPU1NwbNrr3FnmtcRr2hcjlAy0OuDb6EisW
         NdLaZb7NV/OhYcdURSNFKnbna3bV3DYJuyH1Ty9DU/xVkHVBlWF/sQ5ZQIJK2mlrPHrc
         MnJUvC7QJ6U7BXUgn7DiB664jzMuCooiXsdzrETdumAX6AQ9kNMdHalmzQOMqLsk0TUK
         aW3m1w9PvwgAMCfKPJlcKs3UFEkZhIkfFPfuMQLAloZivpgm9IzDNDSaDWtoV6LRX34S
         g1oA==
X-Forwarded-Encrypted: i=1; AHgh+RrDxy0f5jGptMjHGWqEo9IJD3g6jgDkUlheUfncvF/+z2mE+f3NZmaiwYd1TksPry0/ilyASsrzVVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkLXe88bX53bjVqhuR7Ban2UD9PJzKnIkX2+lhJlx/3h8sT7jN
	ro+lGcTg8yiaqC4ka3Nssbwd7Ty2HjhSKFBpCyNb8ZW/ndPMusK5/GY=
X-Gm-Gg: AR+sD135P7p6zgbenMQ2Zu5+s4QiipDfjfRbCIQmohLvMB9KNsoKtHuh8dop11wwu1r
	T+lYnJVkB/l1OyBE1GAWH3SjpNS+tccEjYs+p33s3SC56AGEstP04JN+Se/IPEf/rtC0+HUwRji
	UlB71xSpjdEsnsSJSmh9yHlPDXvoAHqgLd82yLUBQMfPj6fBzuQk+fTJQjpx0XGiUKJoYW3KnQq
	T82RxP7IyqZ/LwYh58oU2OMGONL/eHnlWxU14vH65WEM3xQ48jnCiGh73mrsTToFEb8ACDsdhXB
	+USN2l6o9K7a5XA8c3QqBCcJiJCCslvuZ/XTsNK5QTIf6ynSyehtgzdNerFKmJnjyz00zGnfuLi
	/tBIvWo53gG2PAabApUfBTtxZWnIS57FAI8xZao1Os07CHpqcpYfRxliap0AII9xT3IxO2g4TfV
	cxvYdP
X-Received: by 2002:a17:90b:4ccb:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-38f6a34e4bemr1207868a91.5.1785216315635;
        Mon, 27 Jul 2026 22:25:15 -0700 (PDT)
Received: from localhost ([2405:201:8018:1843:4ab6:2030:c63a:e807])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13015052sm56592223c88.5.2026.07.27.22.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 22:25:15 -0700 (PDT)
From: Ayananta Paul <ayanantapaul@gmail.com>
To: donald.hunter@gmail.com,
	kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ayananta Paul <ayanantapaul@gmail.com>
Subject: [PATCH 1/3] Documentation: netlink: fix spelling in tcp_metrics.yaml
Date: Tue, 28 Jul 2026 10:55:07 +0530
Message-ID: <20260728052507.9954-1-ayanantapaul@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "reordering" which was incorrectly
written as "reodering" on lines 113 and 115.

Issues identified using `codespell -D - -S "*.bin,*.o,*.a,*.so,*.ko,*.gz,*.png,*.jpg" Documentation/`

Signed-off-by: Ayananta Paul <ayanantapaul@gmail.com>
---
 Documentation/netlink/specs/tcp_metrics.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/tcp_metrics.yaml b/Documentation/netlink/specs/tcp_metrics.yaml
index 13144aeed31a..dddf92bedc4d 100644
--- a/Documentation/netlink/specs/tcp_metrics.yaml
+++ b/Documentation/netlink/specs/tcp_metrics.yaml
@@ -110,9 +110,9 @@ attribute-sets:
         type: u32
         doc: Congestion Window.
       -
-        name: reodering
+        name: reordering
         type: u32
-        doc: Reodering metric.
+        doc: Reordering metric.
       -
         name: rtt-us
         type: u32
-- 
2.53.0

