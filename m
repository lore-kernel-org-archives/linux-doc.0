Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2922E41E;
	Wed, 15 Jan 2025 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924642; cv=none; b=Agz188Ze5lcYhaW4Dk9N0+/p3gnP3axbBxBsHRLYGi5AXJSVpmKXJMbwEoMmxT30998D5rwlqh2GLW9XOJJHZStjsC1yC09MCgVm2LWVG2ezOD3olRc2K4fXtwcH7TIa6P7KzTyB0bye8Sbd03Slc+yi1VpkJGJ/HVCmlRoPkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924642; c=relaxed/simple;
	bh=623F9GW9xbu6c5TdtGBUr5laSOvAmJgRm1Pej1iRWh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDnw379s3z1qKfPsAIkKcAp8XBdTws+4AOFi95BYUAUfqCm9BsA0RnZKtptbZzMouiKoRoyTpgQTl9YlJk4Qns4Up+ACK6oWPEIkrQk9hwcfQ+9NtYiFxF/3EupmMN060qVmwJC44qizmv9EyEXCYCPT5JjbUZ97RA3KNbOddZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxWb6fK9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxWb6fK9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21619108a6bso111495015ad.3;
        Tue, 14 Jan 2025 23:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924640; x=1737529440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QrSLW0fm1bQfSEqLrBIGkrZXZv6WDcMQ4gB3rSZK43g=;
        b=kxWb6fK9xGSHCm5qA9m+qSdeUhu2KdzhO/QYBcuhLtrcyVsKNtgpGSDQ+749QRhUfC
         wD1Fngoi9SVdbs6J30CoiYhNsKmoCdedbfzlz6Nh7ormoues1qc4fhYlKD4dLuOlL3YL
         Wq7GG+fzgduT5UAdVKlU2/t7TD8Th+/dQFc8e5ST3IgAjuJebSIg/iqwsi9IGg0ApfuN
         10ie+o452iNBFAyuF8249zRShUEyF0mO6eyWXGTv2lQkSIRcNC5zaS5SD78mj+CkkP5M
         W/Qd4hYuI1YXG/UKM1VvsQAuuA6ksdZK9Kqi8S0uhY9uJZYkmFdwarQ0tc89BlsZDkbi
         jRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924640; x=1737529440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrSLW0fm1bQfSEqLrBIGkrZXZv6WDcMQ4gB3rSZK43g=;
        b=A9QX/35TVkNnQ4HlUDYcPOaJ4U/8KjngcT03Y/U2hy4+xt7bl73sdOFiLRUR4BZCrX
         XoJm1gaJeCkgBhCZXvOrakLZf+4cxtFPrNUZgCyE2bmCKCcQahyefGVVF2n2tH2uMz9q
         u8JIefOZezkyiY1Hqmo+TUp+xe6CLf3ildHORyma+52xk17bh/j/JpkerJBoH49r0dix
         FfNw8j9WEqXGYOm2OwAJeaJwki5aiq+GpUwke1d6qVg2HIU8WH/u3M+6vDjYWcC2aAfR
         FNmRTb2yLif/oKvT4OzpQ4NGNvXtmn15beWCHAsER29Qv+miqObHrfwGof8TTX9p9A89
         QU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLwgQ+A51wghHAMdsTJHQn/idzy0sE1m7pDaQ1CdMBfMDwptf2OaZxNLoeZJM7hGDEnQ+VJsbNzlDHdvXB@vger.kernel.org, AJvYcCWhPa+K+hy+Usvi1wM3KOC4oQcyjNJzQh3HEexfpVs0ij4Zt/aQuawnw2y2b9AlSF6XNZffImz1YG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVb1G7lTUEoPJraKBrjbo7Y20yQymGcxSAVVwYDdZhpJ+R7Cjp
	h5tXA0JRXTdK8Bqjmyt6o+gOw0+7+DMtGXGQhbYViKGTYkT/9kFy
X-Gm-Gg: ASbGnctxF3CQ+Id9x9ZQQ+h7vVWhVT/KcW47C1p8ZxcLfUm/ud0ewPQh/0dPbRzAila
	1U4WEylZAZ1Xq+EEj8PYDB2HYJyyBKW/C6DGvfVgmI1smG4KJGAM5XX+3a86Y99spEIrMlJ7Fq4
	P+zs8H1l+Ks4T4uU+uV/dq019wYiv4VIXMlBOVE8lfNsR1+8NiFfmfirvgZ72zi7CpNXlTjBp6j
	L92ZBEF06a8oU508wo3t8JmZKPzSlYx84U5fQ9pY71PeeCUh0RR6o81EIXQ9/LH0GUhkiTwpGkj
X-Google-Smtp-Source: AGHT+IHO1sL9Cz5jbkS89MQvnA8wbgttgkGBHfy7mt5kU/YP2y84YZvkm66jMojXLoUWk+f6Ykl0WQ==
X-Received: by 2002:a05:6a00:bd2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-72d3b2f00f1mr25758810b3a.20.1736924640297;
        Tue, 14 Jan 2025 23:04:00 -0800 (PST)
Received: from vaxr-BM6660-BM6360.. ([2001:288:7001:2703:28fd:3600:7f32:c355])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658b64sm8642892b3a.109.2025.01.14.23.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:03:59 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: corbet@lwn.net
Cc: akpm@linux-foundation.org,
	jserv@ccns.ncku.edu.tw,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] docs/mm: Physical memory: Remove zone_t
Date: Wed, 15 Jan 2025 15:03:55 +0800
Message-ID: <20250115070355.41769-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"zone_t" doesn't exist in current code base anymore, remove the
description of it.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 Documentation/mm/physical_memory.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
index 531e73b00..71fd4a6ac 100644
--- a/Documentation/mm/physical_memory.rst
+++ b/Documentation/mm/physical_memory.rst
@@ -33,7 +33,7 @@ The entire physical address space is partitioned into one or more blocks
 called zones which represent ranges within memory. These ranges are usually
 determined by architectural constraints for accessing the physical memory.
 The memory range within a node that corresponds to a particular zone is
-described by a ``struct zone``, typedeffed to ``zone_t``. Each zone has
+described by a ``struct zone``. Each zone has
 one of the types described below.
 
 * ``ZONE_DMA`` and ``ZONE_DMA32`` historically represented memory suitable for
-- 
2.43.0

