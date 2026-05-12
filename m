Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8862749DF
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 01:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549749; cv=none; b=UTXxP1AV+0izvw/Jady73aF4Kj8oi6sf9wdoatwznOAtFaNlp8XzbLZICRkJ2obHln1IRrY8wFcp2inPE0W+F/zyEF46I/EEouGDPE3Q6ZXRHFZjBrvD2eeEqIQ8qgNPE8Rgh5btbwe3phgGw5sH0UZyutdQf73AZyfXRfLmoeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549749; c=relaxed/simple;
	bh=g+j2MFkZRvRsBFDhiFAG6DyUYIOKWDt1Nt42ezFjD6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQ2nolM7fy0RyFQwFg+fqhXLKVP78nlFehHzIi5YK1ZgtfAUwf0wFvg55nXWFnA/ri9DBEzPZhPuh8njcX+wzP46s3jH2kwB0SSOl4orxHcDc2o5/Iy4n8PgaU6V6AHV5NudsUz97UvzLoPXqtF6V+85nTT0enyA36AbBlut/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHyBA6YG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=m/k57CBu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHyBA6YG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="m/k57CBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778549744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxuGTicMxGGHlkwI+vY7fNgMYqkX8pEUM+UIKSypDBg=;
	b=OHyBA6YGyc3/tpiTE3ZpV8ogKf8aFtU/a6u8h597amQ1BJVWuTCDJ9Guer6cVTX5mpFTiJ
	waeuRqH4rKoBfG9/OZJs2AvSrcoPk46K/r6UtdPekOiE/2lfdA8gix5Nlh2z5gw2lRQh6t
	lJq4qhIPiv9Hz0l4t1aIzNCoh4VZ8k8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-sXxUaJkqOr2bXniJWp-OEg-1; Mon, 11 May 2026 21:35:42 -0400
X-MC-Unique: sXxUaJkqOr2bXniJWp-OEg-1
X-Mimecast-MFC-AGG-ID: sXxUaJkqOr2bXniJWp-OEg_1778549742
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca29dcd69so123530496d6.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 18:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778549742; x=1779154542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxuGTicMxGGHlkwI+vY7fNgMYqkX8pEUM+UIKSypDBg=;
        b=m/k57CBuxSjiINzG1D0RhbPmuoFU91HCWPop4N8iIVZM+4u55N02hv9zxB8eJS00gp
         YEBriSZTeqSJR1Xg4eISVuQurZNm85UDypMlog17FFc5XMUsimrvK92ISV20RgFuMpoV
         I5zKg/jLKoaLJtyCuXNUa94zoomIss8N78pWuowCOoTBkpkPhd2lK44BgkfwL3bNW4XV
         gPv85evbx4aXMHTVFyoj3/N/mMLoXvloNkR6OqzMRd7g4VJyE4LP2qwHu4sb36mb390r
         VI9p3i0oSJ54Cwrw+829TUVovO4xQ/QDuKr3FJN/Cz05XN9aFnk8NTlN0sdkBAV7Ox7P
         YMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549742; x=1779154542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UxuGTicMxGGHlkwI+vY7fNgMYqkX8pEUM+UIKSypDBg=;
        b=bqAZnqPBcKFtj7Arooa9si3FzP1hMCbHDPqs5gcvH5uoR/Zc+jZDS9ij6c4hGH8MWg
         bZDg2uCRyNiW1SbPSNuPZynkrtO116OC73rUzsjxuSl3nkZ+C1bX0SL/QTm0JyUozsAy
         SJ+bvG4+NX6pOdNzl4xMt3AaZESj9hW8KLvcKsWv1cunz7KZMeMU6RN7PbXSQDIx6WFz
         S95kx3NFBP+s4KrEuHeIV12guuuxim4PETKAMRo1un+NMCurj4A77CiUPDbn+4Umqa0f
         y5BGycNLgv9+Ltz1CoKDcFy26Y02B9kys97b9KsdjYW1GySe4yxpekGrJ5NAtrBQSvJV
         FhTw==
X-Forwarded-Encrypted: i=1; AFNElJ+KuD3CvLaOyx5MfY0IFMYHT+NJWtiI6c5A5C9n2Cm67KFOEVBii/blrL+FpI5robeL0wzzPeY29/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5xiHN4lSIK4OxrXukyKj8Hgm19xpkont5nmZZEaJb9Pwj65R
	lUZoYMWFqv6FbG00KrrsceYI8Sj8N1t7p+NgA0gJCfWTtf3fYHjaWIxl3mgGnDSOVbPYeuyzjpQ
	s6H0HAhH9zLaZSvoe5N5DFI38pGrJAvausbldq98Z6XYKd2lgaeCp7khZvwZxjA==
X-Gm-Gg: Acq92OFD5aa2/ykL9fSrUgcYS2gqhrsMB4iZCN1zsnybzVlPva84QagYmHT6ASyI1vk
	LyFFUKYnEpLJQxRNg5yIkohdZy8Pkw1m27W9YwTeubvggN/Mrn7EovDMOFt3DHRci+fKbqDN5i5
	s0MQO9/F+toAaP82TLr4B/H//TNvw1HDrcAaEV1UezPPKrxL055hydwHKoIgBUlW1uNKkEXTQxX
	V5nI2+uv67gHmCtigzOAhwavFqveZvU7W7VEj2D7SzPLZK7PahZ9ISZoG3xE1RAJogcZHnOTmCN
	3ge3+stVrBZfH1VkYQ3pM9bDznPpY+KcUZXqYUTjKHu82CK+CkEhln8psx3QAX9BOSyzWYb+dGB
	IeCtpMuSG00FtJ6w5x8r6qAXU3R73eiUDTcJvA5hJNLT69K2UgYmuRJngpw18Xw==
X-Received: by 2002:a05:6214:478f:b0:8ae:6282:df2e with SMTP id 6a1803df08f44-8c1b0192344mr173898156d6.44.1778549742328;
        Mon, 11 May 2026 18:35:42 -0700 (PDT)
X-Received: by 2002:a05:6214:478f:b0:8ae:6282:df2e with SMTP id 6a1803df08f44-8c1b0192344mr173897886d6.44.1778549741856;
        Mon, 11 May 2026 18:35:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm109704006d6.34.2026.05.11.18.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:35:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 May 2026 21:35:07 -0400
Subject: [PATCH v3 4/4] clk: test: convert constants to use HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-clk-docs-v3-4-ed67e1065809@redhat.com>
References: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
In-Reply-To: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=g+j2MFkZRvRsBFDhiFAG6DyUYIOKWDt1Nt42ezFjD6s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKYmp+99HIpuHBYUXEXd+pW23U7/SaFLio0uFp27k+Hv
 +k7toyvHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExkmwPDX7mJ26axOMeurTNj
 2Xz6+m77C399buwNFGKYw1a0JKZZrJeR4VnV6nMn/b3MTIL1trk+/Tz5+vrO/b15fX+2Wz2K/Py
 ZjxMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Convert the DUMMY_CLOCK_* constants over to use HZ_PER_MHZ.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b1961daac5e2..497db4e54d03 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -7,6 +7,7 @@
 #include <linux/clk/clk-conf.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 /* Needed for clk_hw_get_clk() */
 #include "clk.h"
@@ -21,9 +22,9 @@
 
 static const struct clk_ops empty_clk_ops = { };
 
-#define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
-#define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
-#define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+#define DUMMY_CLOCK_INIT_RATE		(42 * HZ_PER_MHZ)
+#define DUMMY_CLOCK_RATE_1		(142 * HZ_PER_MHZ)
+#define DUMMY_CLOCK_RATE_2		(242 * HZ_PER_MHZ)
 
 struct clk_dummy_context {
 	struct clk_hw hw;

-- 
2.54.0

