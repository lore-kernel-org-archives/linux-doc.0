Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1354D218ACC
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150594; cv=none; b=cpWoHI1UWq7R3VhNUoNm64ejO8mU6kHLwNhEpBZUBbEX6+9zFiFLYs7oIilZpJpl+Seld5E1bHtwizfaOmJqMaBycge8i7MthLDSEmaOiuPDYZlTFiNXgvLxaP5hoIyaX85dtQ5yXneo59UhBAf5ReteNtqz6yzHVKSAZ4yU27I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150594; c=relaxed/simple;
	bh=8+A/IoT3qzTEtkBSztG66SNwQCevAKiUbP8ZTa7uZMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=P+XHJnXjrZsaRfVu9SO7k/9GayLi9Ah/AGeAb8YVHvTMzC+RsQVFCu1r4CoN7OOQrtGK+Q2TXQLHSEuxPLYr6wIwAbhEyHI4kYhDbwDYhCNvWu9xzZhMHFL0fZlD2bms0SA9vbJ3D6NFYkEIaKTb/CFK/738x6NATn6QuAc/SZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFM1oS1N; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFM1oS1N"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7f651586be1so851581b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 05:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766150592; x=1766755392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMxI71AsP39xHxFMR+R7tbuu3wKkDNBuv07zEwTQuM4=;
        b=QFM1oS1NH5YZDmtj9yhQN/rUDGDknh/jnkvZIhxg0jeYS1N7sjfShSjJIHlWSFWlBJ
         IHplIY3/7egBk0kLG3GMMVpvqseU8ktjzS7/LIJrnUtEkrpKeyVqkEWaIp+yXJegu8H2
         kHzqctNMb/K2oPC7bBTpcwEnKbh0kOgRVKwRD73lWd1NQc4I5XyLrSdOFxeDIih9/Met
         meUYefoM64FJHHF64WZMZQjbgZ+C82oIOo8VRdwdEM+S6BlZ3C7DceV4uW+ChxyMEAuq
         vClBQ0mS0NELwP6H0YISZJQPgVBaek0Vvc23eDz0AcmCrnz+fUGbjTMvLcd2pBAloYzr
         zNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766150592; x=1766755392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMxI71AsP39xHxFMR+R7tbuu3wKkDNBuv07zEwTQuM4=;
        b=o55ywSkwYZsRznBtALOrvu2UqsKN3NJLD4wVCWMyZOpirYiVc6pgDLK5IE7XeN1EL6
         otowhSS7VnDUD1ixZUpUeQ4xVTU/fapU/SgvT8sNP4b6C0TLSBDEXkQse74Fo8bcRWpA
         BnU9QwDvQh+Nhjb6WA+j6KiAZ+Sd+0WlSkCGi6/ehGV66FX+0Xo+1HQ3r/pwXPktPOhk
         b16C1WjmWy+KYDAerJm4hocuGZq0JGzKv6QRn8tZkXvyIT1hWSg4UrkT8nIHe5xiRIeY
         WQnOEZwByGr4nbc2qxvv9Az3AZ9ierkypw3pwmvqLQQg9qyqylAF80EzhSsrjRJnfHM1
         kEEw==
X-Forwarded-Encrypted: i=1; AJvYcCUJIGmu/9ybntG+mZj0nwnPKPelLloqDfA2E1ewlzZo1d8cYOH7cvbvf1ULxPLQnUymAHZLeMBPNNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81pHD0G2g8roXFZC8WdK526qDn0ioQkg4orpIWOUlOHznUzvQ
	oSqKgUjTBTDU/dQcbDJkiTvel6uzm1HKbMCzMMEilRRkqOg9ubSHTv9S
X-Gm-Gg: AY/fxX65cWThO6+zfCQtaAIUbsSJZBswk3aCFCOeS09aeE07G+wGxdUS19Q5krIizwh
	EvscrX0kf3nmj5C7tgXkm8ifTMJuQajX+k/oP+SuT/aPZ9CIwiz/PfCyuDThRYAR2l1deWhNzxS
	MM4SKDEWgfkbuswx1e0uWHC8McNtX/iG40tMAA57lQ5yUK7qa4A5WOVPukMkbHr0yVHaq6KdMrB
	6xt7B4ThnbRI9SrOoj5kDgSL4N4Awm9erhSKSD1ikHoINBiDNgkXX4xDqkSVY9l6nCN9+PRkYOD
	Kh2ObOS5XJ3h/woOHcw5e+g45qVtkyHrzJ6MJws/l+MBV7uZhFkdyZYIImL5V8qKh3GrG4BiWVv
	+9IBQ4+Z6stEK40OJUakgl45FRsEvPvikldOb0MvOny5kw8ta2HUglEFR1YK0cPxwfrQi/oE30o
	yhSdLK489/HN5HqxXcbMs9
X-Google-Smtp-Source: AGHT+IFY8TgFi1qi6y1UY6A5VLscdghOVbd0kb71FhUq5slHD6d4HdwC8vt4Eb1w1srPeRtvYZonNw==
X-Received: by 2002:aa7:9312:0:b0:7ae:b13f:37c2 with SMTP id d2e1a72fcca58-7fe0be08739mr5464561b3a.10.1766150592116;
        Fri, 19 Dec 2025 05:23:12 -0800 (PST)
Received: from xiao.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843ee4sm2496518b3a.10.2025.12.19.05.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 05:23:11 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	2023002089@link.tyut.edu.cn
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH v1] kasan: docs: modify the translation of CONFIG_KASAN_SW_TAGS
Date: Fri, 19 Dec 2025 21:23:05 +0800
Message-Id: <20251219132305.959779-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Xiang Gao <gaoxiang17@xiaomi.com>

CONFIG_KASAN_SW_TAGS means software tags.

Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
---
 Documentation/translations/zh_CN/dev-tools/kasan.rst | 2 +-
 Documentation/translations/zh_TW/dev-tools/kasan.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
index fd2e3afbdfad..767b280d8af0 100644
--- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
@@ -79,7 +79,7 @@ KASAN只支持SLUB。
 	  CONFIG_KASAN=y
 
 同时在 ``CONFIG_KASAN_GENERIC`` (启用通用KASAN模式)， ``CONFIG_KASAN_SW_TAGS``
-(启用基于硬件标签的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签
+(启用基于软件标签的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (启用基于硬件标签
 的KASAN模式)之间进行选择。
 
 对于软件模式，还可以在 ``CONFIG_KASAN_OUTLINE`` 和 ``CONFIG_KASAN_INLINE``
diff --git a/Documentation/translations/zh_TW/dev-tools/kasan.rst b/Documentation/translations/zh_TW/dev-tools/kasan.rst
index 27fb7645174d..50316f98e773 100644
--- a/Documentation/translations/zh_TW/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_TW/dev-tools/kasan.rst
@@ -79,7 +79,7 @@ KASAN只支持SLUB。
 	  CONFIG_KASAN=y
 
 同時在 ``CONFIG_KASAN_GENERIC`` (啓用通用KASAN模式)， ``CONFIG_KASAN_SW_TAGS``
-(啓用基於硬件標籤的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (啓用基於硬件標籤
+(啓用基於軟件標籤的KASAN模式)，和 ``CONFIG_KASAN_HW_TAGS`` (啓用基於硬件標籤
 的KASAN模式)之間進行選擇。
 
 對於軟件模式，還可以在 ``CONFIG_KASAN_OUTLINE`` 和 ``CONFIG_KASAN_INLINE``
-- 
2.34.1

