Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5B4385D7B
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 20:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702441; cv=none; b=HBBmMT1yVocVajEk/59luMDD1PcUd+oe/AT2OJIQMbyPUW4T4kS+nF6MX/8Gunu/qzPQUAGUM3dBw2U1mmqVbusTcCED+jTlseohFcLngwnPlWNi/E46ufB9Xjbj0b3TUjKyh6xCoJBNSUkaKptseAYF0tNyQf8grZU6PRSu61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702441; c=relaxed/simple;
	bh=UY2ontYO/IC28dm1PFbUYT1WMGmyd7D84PrQ2sC6aXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nLF5t19V2I1mFCRynAsMHQHT9XjHKldaDwfiWjY7TSd8MVaXDMcyeC0vSqy5wUmWZQLXvqg/0gmJZES0dWOSHVz+STmJNsiDNdfNlphBK+rp6We2yCsc9gA1m5Hyf6dC07txHf9cG1l6Cec8Q+8M6gceSz71NuoUcdfQAni/qzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvLDW5wZ; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvLDW5wZ"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8d67a483d3eso800520985a.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 13:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778702439; x=1779307239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdhBUAHPlTqR62oxwFJC/59+GlIYgSxqaB2TTbX9AN4=;
        b=nvLDW5wZhBf09zgUYZg4FtJtWxRpgOQl4jzDr5PDGKEwTHa+M/tjdWc9Rd6+1vKMcE
         mR7zSNJuz6A2Px/z8JcKuobPiKmG9K583mrOrrkgucK0JBUVCqT8XOaHk6ocUhNQPMQ/
         lYUEg9TmYFnTRhABg77URM+aqMhXLoLHLgzC9tvKDvhVwpCL6ez5zIeLfjnUaSyXUBU8
         kdxM2QYNWI8w3FYplf5umHIMaUbWeDkE2bYUtU9X1rZkQv8Chdwd9G9eUOGIhH5Hhkft
         odMNbqy7B1DDeHGay9SUx/vouDkwu74j86/cMnG3S8ZX3SoyPvn7CWCQRxJvnaUP9kes
         uTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778702439; x=1779307239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdhBUAHPlTqR62oxwFJC/59+GlIYgSxqaB2TTbX9AN4=;
        b=oOhqvJw34b25x8CF5WzdL4FFbobibq/wN7IdPkRMjz62Il2f/TWMwAJ3K8pRY1IBdh
         tHRySouRYm7pE4SYxHTGRFtQd/ewBLJb/A70zZz5OSPLYgmfJJZAlF1pe0ZLcNB4Q9zR
         zegheDnUPQ4lxl6zkH8UiqC2l7bCa7E3wW1r7GdnmKPPtgR37WnM5plb/wbbJ1r6QFRR
         Afhd72s7To9BziTHbHkW9cVQlArIUNObIs4Y2Hb8hXKF32OwxrpBlq2PUxkJIjkPfKTy
         oOwuIF/ABcpOmP2PCzL+DQauFfxfBx2B6N1DLG3vEs/P15UwOe/VwnpbDW1DhRO8qSs3
         KI+Q==
X-Forwarded-Encrypted: i=1; AFNElJ97GfkWyWEBRHWw8ZWCziQ/fPBnUnB/UxJK8wmsrD7oJnT3jH//xyct1zOXS6VH5/2JhfdwI8fGPUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVh+lvw2eWLHk0bjKpVRqs7pq22p/K8mV9RpvaE6bh8h50K+r
	J3iwx8Y6M2q7WamfjcTSsqvOe85vh4ROfJ2QToerZDCT98Dfk0Dq/yuY
X-Gm-Gg: Acq92OGxsgUXk5eZqg9JfHH4msnKl8nk4GtWwfQCofTJPwtLxDV4Cnq6BVw/MPc1IkY
	YqxJ143nDPkXWJWh/srwnvbw6L6ZB3Jse/846AsnQgBndwh+uWwdlOaEHjKzP5pVuFHsAK7Y8z3
	Oi53Zd9SERAyR/Eysqw5lmPKXK/iEBUmMYBUz+7/3IdIvNRQ/XocElrqds2Fn+pN6e4SYCy7Q7v
	En0C89HImMDwmUWmurLedP51IzMQUlRsnrSjU+v99dEQvFUhibWbiglFipOSldUgoB4ZJcV5yYn
	eWzwTHtP50dkqw7OWNqa8zmf0/ZUr07vOyf3riLKQfLuG0XbMk15lVBLb83ZP8Vqw/VDVfK/H3i
	dzhfhjkPmdlUclUTN5MIXg6hWgJlhEPjYIJoWJLbgCD3y2KLj5ZUE/ircPZ5MoHjWicJxuTZHKQ
	fg3OijdSC2Vg4cgGwMQTEJY62Pq509OsxdnNyseUHe349nN+sm3OJUiGxueLZagqzp2Haoqf4=
X-Received: by 2002:a05:620a:319f:b0:8cf:c1c2:90f with SMTP id af79cd13be357-90f88d999e6mr753373785a.7.1778702436895;
        Wed, 13 May 2026 13:00:36 -0700 (PDT)
Received: from localhost.localdomain ([68.184.80.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bae24879sm57897685a.18.2026.05.13.13.00.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 May 2026 13:00:36 -0700 (PDT)
From: Clinton Phillips <clintdotphillips@gmail.com>
To: corbet@lwn.net
Cc: Clinton Phillips <clintdotphillips@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: sphinx-static: fix typo "wich" -> "which"
Date: Wed, 13 May 2026 15:59:04 -0400
Message-ID: <20260513195956.25307-1-clintdotphillips@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial typo fix in a CSS comment for the documentation theme.

Signed-off-by: Clinton Phillips <clintdotphillips@gmail.com>
---
 Documentation/sphinx-static/custom.css | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index f91393426..5aa0a1ed9 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -30,7 +30,7 @@ img.logo {
     margin-bottom: 20px;
 }
 
-/* The default is to use -1em, wich makes it override text */
+/* The default is to use -1em, which makes it override text */
 li { text-indent: 0em; }
 
 /*
-- 
2.49.0

