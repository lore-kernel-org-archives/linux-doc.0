Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B3D30C378
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 04:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675032; cv=none; b=IzfkW3WmVhBl88d4lkR292N3cWXW84Jwc3C4gb0hHUOB3QSr8hb6p+l58LW4VvqSzhRnCyY8zbV+kiXxua4nck80lQlgauW5geS/bUE2tqf8A3MPUwrkmf4cdvqfKI2Kc6n5e2EKnTm2KT2PTsLsUPoRxV0tLq5vT5j68ozGV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675032; c=relaxed/simple;
	bh=qJIYSnU+HoRbvlx3ywhGBF4rw4sM63dPw5pKUX1ZIk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXx1yqbXzB7J9Y41VW9gfckLOqsN9xgcXcwaZKoylrNsWvmD9PAcJeugShpkg/Q+t6SNsgbi9GGyK/4zfjt2ND7NZRhoTYQnLsoCAWx42fLugiY1YKDBPpvmf9tE/prs5Ssgmhol8P5QWqg0JgQkRPWS8E50/+lZL5vVUYAUYWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TA3KMUJZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TA3KMUJZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33bbc4e81dfso1387137a91.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 21:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675030; x=1761279830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAkZgFdLzvs8Exsdja0IC6onWedwrzXxt2HCf6MfZEs=;
        b=TA3KMUJZ3wdXrdHBGXOHDBRRCFsBGRv825EEWg5FMuQd7150NIItSQ0LksJfiXg9Jo
         z6eIrJH5vbhC3GhhETfjYPPVLb4kEfQS8GgDmWRGg534bRmpCsnZqN4g/Ux/PMul3vx0
         FGYHP1nfR6iMgK+IclnXv36uI6ruWqpaFHHXD2ndkI2ehG5l00snqaKwNrkRHnPhsYpl
         xgJdS8h+F/M5B/CXFLDZwAc+bfVHan1bWWltCsaSlC5KCgXY9XAoQ3qh7FIgRvwfiEc7
         rY/8z8JRA2oPBVOv57dPYHztfpn8MNnkfBU/KL4ZLnu1u9NQ9siG/q59po+ThuoSmTEC
         sG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675030; x=1761279830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAkZgFdLzvs8Exsdja0IC6onWedwrzXxt2HCf6MfZEs=;
        b=WpfjNgUDE3g3bOa9sRoAnJZJs3KcmaLjb1m/L1Wd3gFG5s1Upscg6yu+pz5jE5zuup
         YCE1nJFIRFrh1MpypOyd4Zja36txJl+R05NkvwIMEW2ct/5w/zvUvgm/1J607cM3Qs6T
         b9yt9175XGG1a1931ZZBdb/HoDvqkE1pIlpgATkkxD4piZse/RPekfgXGsi8+lAPB5kp
         yqD1aMJnEKyHprW9GLGgGNP0lnH+i5aSkIjBmNMJRAjm95OT0lppCyV5UgAJvUFbqDO4
         0Bs4uquOD8HFuSYGZmcbIRhmvlWUKCsoQ8s2ybMu9b7g3N5fxRaUzcIH8eKsUDkHWGrj
         J2aA==
X-Forwarded-Encrypted: i=1; AJvYcCW/lDxJBhi1ebAmKMCXaznuEpx0z9QoQ2aWl3G7FtRY9Ys1CKu81o6xhQOccH0toBINWDbEXAQvQZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZE/VbmV/DQNTvoaF9rfAIY1gDOMHs0zw5vrv98TFNEDjNatB
	xp+QiOSNna3GRYgyK9gCCzbWAPuHxdEeLRN5r48eaWai4BJz620dcu+k
X-Gm-Gg: ASbGncugd6MS4Xts7eLlCBAU3idz6sTLDLS+n3j67LBhMKx+sVwceXcEqQ95F5hdzP2
	1YC38v136uWbKP0C86D4qPvLIoQ/Q9gCpfLH/DAsd9xsQFcEclkegvMOnGeErP1wgZ3EJxScpav
	cDNJBcXuyOzz1ruJi0HJvZC+5m5DtJH4KLKmyZ8w59m2XAzwFncCEgrs1JMcBvVjDdz+tkKcyop
	0MXR4UtM6nicxGlqsmk9dczRROVSTGyNcytMhh9IiFu0jg0sO4cqmKh8kW1TQapCJRq5YTXJrjb
	4bPeTcJGEiZafEW7GMLKKxiVZOTT80cy6LJ+8d7xTs3zZu6jpxm031O0m45MVH63+XkgjLxS+k/
	fbM6CcSTP5UDnH7d5UKwMD3nZ6acO0Qho0cM9+fbrIJ5ADsbRnYJyjENmKiDMJk+CgOdaaLMECk
	Q2f2eXEocDrMFNizhFuZDU6PpjqgzwnSfoV9sl6qtluF5w/XEmL4wLT+JO3sn4OCwlvUNk9HscJ
	PTZheqDLcTQTfMYEGxv
X-Google-Smtp-Source: AGHT+IFfbNX2mTod+6zKsy5GzuQyZpJ35ah75bJLjAVf3giPURvKPzSrUXNdaNKl89D52wOXFUj7ww==
X-Received: by 2002:a17:90b:2ccc:b0:33b:c9b6:1cd with SMTP id 98e67ed59e1d1-33bcf8fa1fcmr2615932a91.19.1760675030324;
        Thu, 16 Oct 2025 21:23:50 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:23:49 -0700 (PDT)
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
Subject: [PATCH v4 3/7] net/handshake: Ensure the request is destructed on completion
Date: Fri, 17 Oct 2025 14:23:08 +1000
Message-ID: <20251017042312.1271322-4-alistair.francis@wdc.com>
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

To avoid future handshake_req_hash_add() calls failing with EEXIST when
performing a KeyUpdate let's make sure the old request is destructed
as part of the completion.

Until now a handshake would only be destroyed on a failure or when a
sock is freed (via the sk_destruct function pointer).
handshake_complete() is only called on errors, not a successful
handshake so it doesn't remove the request.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
v4:
 - Improve description in commit message
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

