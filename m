Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DF12D73A3
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 04:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762921707; cv=none; b=ddyrhAz7MCiFmOAOZ0D62LEz/J0hCUeqLoo4SWnxWa3aUbSmofJ0Cg/WYPIT1GS/KqDFnwGuEYJJxuuu0tpU4OedWOhdYEVkFoSAjL4MoJRUEgy1M7SLnfMeWSY49vGiZ5e6q/xOrPeaWqe4G73qrlCLQoc91QoriHOms2aFgGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762921707; c=relaxed/simple;
	bh=zP/NG7w1+KArs879n8cQJzWDunWwyIPS5O4paM2aWv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZAEsnnEU+W9ExLXEI8Ahtlc5dnNxl9x+OkXau8sDrUs2ubCfGRlFN06qpQ7ceQ5tRLI7Ir3L/WEAyrn+p5k7y9jK/YSCUMVPsD5nl8ewKzRMUSaRJ3b5ziLG+fZoikOIQKztTg20LfnMsvZzwbA4HCT5lhvFnFpEhXg06FJjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnioBE+9; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnioBE+9"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so319995a91.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 20:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762921704; x=1763526504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkGiIciWDidvQkbZlkaOibwVplEAw58SDT70kiDe31U=;
        b=MnioBE+9RluMS451pD6BCq/wgG9AjNRfLpn3OOC6f+TMcIvVk0/QKxcdwKXZ5j7RKz
         IXGk9ZbS6MQqb9+Q81yvkIDMcbyhlvmJ02GAISA3RgQEnsK2hwieOmHZ7PrHm69r2btP
         yXEfqYVr75TfX3tmLmgKCecYybtptcijEuAJSv6IqQht7VDsqfO3cRwzoepmlQOLABf+
         +ZhOBP9Vh5VakngdMhP1UU/Cl7dkDRWmY30DOJNsNoaUSBYebRGgVB7iLLQL+hvtsYW0
         sf+PRnXJpRZ5XKtr1Vcdchvbs4fQVAzOBCj13NbgEzR9m3buyp6iuyW2IJqEA2t/2e9Z
         Y5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762921704; x=1763526504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zkGiIciWDidvQkbZlkaOibwVplEAw58SDT70kiDe31U=;
        b=gHSRA1siDA0yFyzT94ioE1PcdE50gn+AwJYs0t+ffT5x4I7jX/YVHLlHiwQhkwnibQ
         SIVee53ufPfyfUMpGzK0tYJA9nWuh3J+YnrFeUDbuWL8+GKCOi6W2x//BvnME5Hfd8rG
         ikV273mPnou4a4hpNkn4kIvlOt+mMkMSHvtFYJ2zLbSjEOkmDWFcZ1ND7m3EZRUVlHGX
         r5ltdd4euOOCJNjeqBomTAkXL4saSIK9DgbXHRddfRBMZgorDMeeeRhj5fmiD1g4q0zi
         apmMrtCZZO5LmsW+i0vWrLfPXm1kbYz2AMzoaJ8uE+vjxitpy3+gefVN0/qda5rCXabG
         jLtg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ06Nvwc503ww/FjiFQccDewnt7vQfArpj5GB+n+KzzbtkjYgslifmvN0+J6IR9QVV4M3Ry8/a2eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTxjgkbLEFxOhAI+C/A3V/f0vEEELMWXlNLT68+49QtZVfsXL
	wjr0vBE5lwbTu9Q3R3exev8PITwbXa65MML4mcqS5hkolRzHHS9pQnh1
X-Gm-Gg: ASbGncvhbHLOb+pCSaM9IUyBdf5Lb7MHGTCEQab3rCxMu8/v284oZepY1tHyk96KGu6
	5CkAbfhnKlQUFof5UbfM0aV9tYwJfd3+NjmCp4sgqYqLJMWj++ccUHbVNGvUdGIRfzY+cFUte3y
	u89dUJJySao1zIlbCwPUw02RjkrD7sgFNDefAWfnHd8e4jPMxB0Wodop33ti8bBuYZzB+GCwvUy
	Tet9XhHqGzQFhgw3Q23PVgVqSEkZ9/c/hxqMxnv1YO4J5YpEcqfRAErFm7zzmzXaWFztCL9xjRO
	HJDQNQg1nSCOTe/AE4gj8idBNU8wk8pjZ7CgW7mPghk+QV5TwrFHRtnscVpeffJXNqmsQrv3hrL
	Kg3+Y03RJWKUMEzUY7tiCVX/O/gRN7MAfkVWisM2mVHywE2HZrQyfgq2J8NUIXHsfqBX/wVHDzs
	4arqnksrDcm8euC13wPqxVsYqUDPC5VhmbIH9LMoN6qcYnfMPqCm5agLq+XxkMtsx62AMX7IqUf
	T8yoRrRmw==
X-Google-Smtp-Source: AGHT+IFz599JMY+HbLZlN+Y4HCQji4lI/mnZmgyLfcZAZDfwLpsK/Yd65k0yw0c8AJv/WsCEFQFd3Q==
X-Received: by 2002:a17:90b:4b89:b0:341:8b2b:43c with SMTP id 98e67ed59e1d1-343dde81845mr1915818a91.18.1762921704526;
        Tue, 11 Nov 2025 20:28:24 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e06fbc0dsm854681a91.2.2025.11.11.20.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 20:28:24 -0800 (PST)
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
Subject: [PATCH v5 3/6] net/handshake: Ensure the request is destructed on completion
Date: Wed, 12 Nov 2025 14:27:17 +1000
Message-ID: <20251112042720.3695972-4-alistair.francis@wdc.com>
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
v5:
 - No change
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
2.51.1

