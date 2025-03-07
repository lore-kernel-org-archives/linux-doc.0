Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C131A4E9E
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332906; cv=none; b=lmarLB+twwexJmRh960TVMvYsCaZmPfXqb2XcdWwXamr43K2m75rkixCtCP3E1IvOkgyQIL3ok5UglpEyVIucmXKo54a3tYr2PVoCWPFcPKACv9PcWAZ6WxgNInOim7ha1JhTxVkokBjoPz/euG8cVmEon6a/QbUSE+gjmMtUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332906; c=relaxed/simple;
	bh=fTXXbYfB0BUH1DTF0YolYq7hexyvidsXazu4RK0mlKM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YGjCtsGai8ac8fA37FjV+TQdPmBmrZdk2v9mE/N1VMHknjZRDS6wuOWWVsAh0yzlmB3ZgqgyPZuIXQ5+6UvnQ9eUWXQpwB9f1S8x1ZuCP+31yMICDRhhgwEU0LHVkPXXSbQDz+OrCihRBk3b8qfub23eB08hFp5QoSUVZLByO3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TfQyf8Ye; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TfQyf8Ye"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2239aa5da08so24190625ad.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 23:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741332904; x=1741937704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNjPZDPj3mGb5UUG5cx3FWB8PP4SBA0xRr+ffK+aNvI=;
        b=TfQyf8YekiaepaYT0wPmnd82PmbfczzdjD5jKbW2Y3kvQg6D4I75jAts5gXuhbWZc/
         24CQf+C19jWEIZQxnW9do2wKws6dcxXvaZT91KS+woiaBvEhbNBrskWQatAIFIkC6fyh
         mvj7RvEkZlZkP+SKinj5t2VadDL4oZhcZHitFc9C8o3+WeKiveibZITSgS15d4nbO7b9
         DJVxE23maUEbCTUIlC6qQkb9EXOoX7tfVcyvPoHd0sSWqSQo/YJm59O4rD8AI8V+nVLi
         P0mhR3S210GGMGlCDwWHxYJnNQQ/Ijvi+ZuVWBWilNxja4Ka65oMeJILVrtUvv33qmqw
         NmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741332904; x=1741937704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNjPZDPj3mGb5UUG5cx3FWB8PP4SBA0xRr+ffK+aNvI=;
        b=hefuj0J3f2+D3U6Nmsg6KnGHR52WwIZcCY+Jw0AH15UKdAmfLccAIoGKBknkVUYbsH
         KjhNDlZohhbXhOINmiWDkfd/ST1n4S8Ve9iTKlA3iIvqiiJfZmlZAMe3KkBJRvijRSBM
         3H/vZ8LKDsEGH/m8oepXXKCFLroHYk/uXXdpKUeSRy3Bbk4Alm7n7Zl54zq3oMcARTAM
         ud/8TbZcOGW97DOZUrEKI2Uv76eov9knoK1ES/+EvjimN+5r6QwHI1CuJ9Sjv3C6Evsy
         PAJXNEuYEX/FLRm/hqI2MtfntEc+SDJCb4BjgWLtxffws5MuofjJL9WRBnb2UwmqZHWM
         8Ngw==
X-Forwarded-Encrypted: i=1; AJvYcCXtBn3NnVh/KbNb2U9DjpQrPsSWar4/r7KR9T3qw7oxFcprHYBVZ1tzMzyuKWaWD2Ues3tZd1g6A0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLsEv7fYf5c9Rn8dM3mgmB7iHbr23boP5YNUw7tq0ha1uDWom
	wTDaEPt7lH48vDt2qOIklKLIub3xH7rtU59N3URKRD3WQrLNurXdnq5qpJJNkzg=
X-Gm-Gg: ASbGncvKnT/+0JDAPpSMgfX9i1Q6YXM842Yg9gLWPfiaSuOiqX6xSVgjznPfirul1I2
	PYPfzxrx1zjZgUEfGnuf5DAKRZIz7P9xI7S8HPmfUSEj6y3Ugp1tTwYk52qryjbow5AYe+hEdrB
	2b3cCOfFhCobPY9E49RCwTEMiSM+s13snwYshhZr7CENVWnON4b8IkqDgLPUHyrPTa4kMU9b/EZ
	Mait7j4lXrndA8KQAXDI143U/Bldasx09otHnqJPC2NxEXNRUAy9wrb04CUT/dPpQXCbkRSh2wp
	5vmpS7WV01OdP+JfAafIdT8Vs4GTINZ1hql8QEBHzPsPWA==
X-Google-Smtp-Source: AGHT+IELLQymfxCOfXAQsArNa5EtDTkaOw7sWZqUBknBo6zO+r6U5BuBGVSheMI+bVvvCeDVppbhlA==
X-Received: by 2002:a05:6a21:78a8:b0:1ee:d87c:8051 with SMTP id adf61e73a8af0-1f544af83d7mr4983169637.13.1741332903923;
        Thu, 06 Mar 2025 23:35:03 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281093128sm2037888a12.22.2025.03.06.23.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:35:03 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] docs: core-api: Update kernel-api.rst to include cpumask.h
Date: Fri,  7 Mar 2025 13:04:52 +0530
Message-Id: <1612cd8c37245a9f1b25d470d9889a22ca9aec9a.1741332579.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1741332579.git.viresh.kumar@linaro.org>
References: <cover.1741332579.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated Documentation/core-api/kernel-api.rst to include `cpumask.h`,
providing better reference for CPU mask operations in the kernel API.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/core-api/kernel-api.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index ae92a2571388..5817632381f9 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -90,6 +90,12 @@ Bitmap Operations
 .. kernel-doc:: include/linux/bitmap.h
    :internal:
 
+Cpumask Operations
+------------------
+
+.. kernel-doc:: include/linux/cpumask.h
+   :internal:
+
 Command-line Parsing
 --------------------
 
-- 
2.31.1.272.g89b43f80a514

