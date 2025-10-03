Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732411F0991
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 04:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465952; cv=none; b=G7QI2RlMDC1ifHC8xfmWO5uPNVDMheNKShIZ5q2YTrpQzL2M7LJuJSeiOrTX9mT8hD1jYBFOctf3ndOQAC0oR777wFkAqcPnEAzmR542qgwz41VhRl0odIrG+4vr0hZYiMT1gUKoenIOHkJU4IRgFEHKiNRdu/wfu6R3WLsnKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465952; c=relaxed/simple;
	bh=7VMPKWz5uYNRKWr5qHgYxgxuacRdmA+VUVAZxwMcJxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIjZlKcXregVV/zR3v74hrI4Dot7k62r1mFRlwuUIfBoBukRBcJYTghAms/X3ULtDYNhTg3NyuQXDFsjm/46hq68QZQ0C3nJNp6sKWXheTtVeYS+xMD9TH7c6HI341uOE1f9oC3l3Gh7yYaRVHw1veOLaO7HslZSQQUdGz5BCsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPLD3Ddt; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPLD3Ddt"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3381f041d7fso3174907a91.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 21:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465951; x=1760070751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z24lKsLPaefpARjOZTyt8urU57ilAGB24wkoWzevBy8=;
        b=BPLD3DdtB8ezPycD7XV3c2ksupBMXIpPLNXQFJ4fnB4qJJGkL9lu8iUiIqg43OJCSn
         fvX/Ymv4ymYTXYEejadMn/MKhLI3GhPNwY1jYT43Y53la8sjKYvqI+IAf9LxftAnbI2U
         xP+NwaMJb6bhCYTMwFCi6q5Tnu8JO753X+Lr4ddfCraPBWOz2fYFovDUb/LClNhWxu4U
         /y70RHJl5VDQGp7CsZhi2FjF15MNtCI+UeMEzjm8XYkrGCwTOjA4r9uOXncxmQtND3K7
         vT3jkq44UdKrRkSzY/pS5mSZh6WI6wFZRW4fMyfppsdHx9Naxxhl7kicLSXNY71LUBgV
         +6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465951; x=1760070751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z24lKsLPaefpARjOZTyt8urU57ilAGB24wkoWzevBy8=;
        b=RMX14YBjUk/APSBeqSeofqLDNUj5jC+g5d62Rj6uKRYCdFRQfBBj3vVbwamhTQaSjc
         6UYOyESCajPGE8VKNQhZOvY+PPiimqNXdtI08AeHw38AMx6iQnJe2C+oRLKdY3JFVQiZ
         xWspWrm/jzTtk/XtFw1oXT8wkj1HKN6jh/OBOqM29eT9zAhZy+TnD8TndBQBQnx8GRpf
         Ew0+FwSHSGOx+0l6Wg4pEVs+X2Rn/EgiA+EZ5zyIf8LzWjIng9+uzI5otP6fS+OIjHES
         3AnxWCiuaBLhzUpZE0hIIg1cfzPeuVXQGVBz9JGAyLhGd8boPIPK8vcc3yCKIpMlcyJp
         jjuA==
X-Forwarded-Encrypted: i=1; AJvYcCUMbo2D1nSnIUlzyJTjyQ3mQ4Cczq3iDRSSPsgVewuTlYsAH5/PnUB9Ust4dza7lByxUpmCXoktI9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sYzJOt5K8lWpJ8rbzFCTkKxt87JeAhZlObgpGD0sQubNswsa
	FpoxjkygowVU9AZq85BF1fpBNsTRurYCLBEPFKjT7kFn1cuanikaVO1j
X-Gm-Gg: ASbGncvNL5nY0uCCbJsRuJiwpNiEZhbojKS+WQPdLtXIKlwBez2qD4j70L+ykD2W0MG
	cfZsMmh60Mlk2dMy454YJpWhMUsrdmod5EY8Re/kZ3gLMRagHF4bW02FTwkwFFov25s4Xcxkyur
	JK4c1Dsra2vOUxGSfB6TxFpgNeIAFuFePx5LfEHrWV7JFw8twniR2RrLCTs4WdWmjPaD5sTNnPm
	JMBvo73uvlx3fjP27LQGVp8zQYIXt55r+1LRYW4lRyWKs4E88MlK2iDC88D6N8Di6ABWMOgpCsw
	C2Jykm8Zn3fqbL3ml0wWWO5mCPuRPvT8ShWpfQQHVqkl0RzjO65K4a+YMH8kFqBwGDZEklvJGjb
	14/sCU+jd5zRkgpEpnV83/EpkJ7ACcS4pUgE2aHRXtt1XpyEOowRNlo2+csATwU+dBnG7m4BZU6
	knrmYzcsvDfu0XQuBMpxl76XZq6rd6uQkmDnUTi5IH4dDwiQdPMINj
X-Google-Smtp-Source: AGHT+IGILMEf9Tw/o2u8qdi5b+EnvPskNraurbyacR0IziRkBvpz30elIe0oEPrEq1mEn5hgoKypZw==
X-Received: by 2002:a17:90b:1b12:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-339c20c099cmr2180806a91.8.1759465950687;
        Thu, 02 Oct 2025 21:32:30 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:30 -0700 (PDT)
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
Subject: [PATCH v3 4/8] nvmet: Expose nvmet_stop_keep_alive_timer publically
Date: Fri,  3 Oct 2025 14:31:35 +1000
Message-ID: <20251003043140.1341958-5-alistair.francis@wdc.com>
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/nvme/target/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 0dd7bd99afa3..bed1c6ebe83a 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -430,6 +430,7 @@ void nvmet_stop_keep_alive_timer(struct nvmet_ctrl *ctrl)
 
 	cancel_delayed_work_sync(&ctrl->ka_work);
 }
+EXPORT_SYMBOL_GPL(nvmet_stop_keep_alive_timer);
 
 u16 nvmet_req_find_ns(struct nvmet_req *req)
 {
-- 
2.51.0

