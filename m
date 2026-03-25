Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F17839E166
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482782; cv=none; b=VFlIJYSNMLB0O180uzPTDAmw1vwFPRkq3hlMEzaourHy2BYb4E6clEz2GQJPUJPN5HNyszSTGxaugmH47vW3uXkh10jCt3d+/EanyUjya/LRIgyXQxfa2BvDabdRGF3YuJ+EJwdWEXX2YWicTqwMhhXVSn/ObqBCIhCj2w0kwaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482782; c=relaxed/simple;
	bh=+jW3MS7DFLqoUmBWO2hApFPt6x7I6eU55roZMBHG3AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qyi2yQ/+PD1lrNCU20I8LVeb7OifnSIbdDrNS+CKsKXfmzo70dDc3nYMuilEBA1+d/pueG2ym4ReymlIT0LAVWW+rJb3V4tFZNuxzsowWp8usW7Slq4ZfCmGaQY7Iie4fYeFmOl8fYXkGS8VCunhidhoao0AtQNG/1kGy4OjB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fTy1p++B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r4N6jeit; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fTy1p++B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r4N6jeit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774482769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
	b=fTy1p++BEgqy9W1r/zqMbR5nBQuwISURv9pNNVY8ci26nR4uS8+j8DWJVwZA/vDiIRjY09
	hT/n3gkTKsNdzwHY8htCtdNDFqBuFyqLbRoMYFrK3YUqwzhBZSbYOsVjbKIxzIrDYiwP20
	A82Wgizfl1smyKQZHy68XZY7m5tr3Rw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-xodz3r7yMte6i5QwsnL4DQ-1; Wed, 25 Mar 2026 19:52:48 -0400
X-MC-Unique: xodz3r7yMte6i5QwsnL4DQ-1
X-Mimecast-MFC-AGG-ID: xodz3r7yMte6i5QwsnL4DQ_1774482768
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfc5294894so157661185a.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 16:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774482768; x=1775087568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
        b=r4N6jeitw/yPZH+h/CuxK32PZJ1esrFGazci8dWmNiqWpvPrtGuU0TRcHSnJWP0Ezt
         dDLJhR5195hBS1VJmJdAxtUHlYPgEYZ+y+xH8UzJsyIB3L3ScfmcJRYXhFHJmspVzBo2
         Bnj6J777R/rb681x+Brmhd0IPV53LKV+cjMyS3wvq14QhyrCh52AY2cKvLxqVJyGjVLE
         38LftgZCtJYMpgaoydzwyZDH5oiNtUNvUip99v/SUaAdZkvszzNpUXpSF6jb16qgw/Vw
         95dw4qYuKyOyt1A22+dQLhxjr9+iwMK3JG7KX4g/7cby1OJn8FbjdMP5tCJXrhcIUjfM
         Zhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482768; x=1775087568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ahje0afOzEE5AO8iZY1qk1UFWqM0XHyDZg7ReLCYYwI=;
        b=r1CV/HT/W181SDScnl+2sNU+sZTzqHwwYFv3Kvn2ivavgCX0gHl/9ANutvGRx0SAwc
         7o0pPwjkUSirAjoSH7EOM7Sa3tqE/68UnAwU38TapPv9GeGQaESrowrs7Zm3jrw3Mt1k
         JTrgM6wDJG82rGnBcwYDnayMTJKTgcpTZkZoTZfdAsDCHLQu2ag10CPUONNRpuKP4Xvt
         Ykx2W821F1FfiHa/DglBWOdt8esLDImMsPQuuqnhsd0yRlV+nIf4Gujdj1MPAzvetvju
         CSqbqpQDJP0QsYXsc6IcPSBOuF31KzZMwc/4tOh8qs2f4pv2Sew3lDMC+iRYttgmruPz
         0V5w==
X-Forwarded-Encrypted: i=1; AJvYcCWvlcZfba+qdNraVufHQLHJ10KytT+dFAfE7cTV21cBIC75qrbfepQ/2qHsI/0TjQQmswWv6E8m2jA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsoZ+z5Lr02Pvth48Cx/M2goSy3Jdxx/CPlNypVJBSlUiDXcHE
	CGqt2VVSIDIg1m+M+O3zjrnV8EASZggeQNH0iI+mOf/j6Xh0AQOnBppXo4eN3sZQSpIXH6g67WA
	sTku3VKGSVkTD8q5sfIazjfNGo3++zVXeav9DTw6lq5AYNRaxQ0bcprBvvu88SA==
X-Gm-Gg: ATEYQzz8po9aheQtIeSw3JUJPaFSA7igSh2DcymWasYgPVrHllhitfQUjavYfAuoNBO
	lBMj39wZAYGjriYrQk2j4a4p1ZB0CfDECi2wKavO07EFUClZnO0rBPP5s65G0YCGHTjZ7IwAzsm
	qKM4Mf7Qt1/4NOlbIW+sa/d82WVhWztJhV2/ObXX/t26rvnRC8aFJx0YoumIMhTX2Ko9NMzzgMG
	3usXfLj1p1g0scqErdnxAo3J3HAm/tpkdnyTVcb4sXDfBxrHWKtBZ5F6cCBFrBuNAGksoL+jTmc
	P4c5yqX0Pz6xSDMdLixCp61/KPXXTMS+tnYRgun33k69M7oT1KDmlR50Hlr2I8tVe+mfTkZv9vR
	/IPh5nfKWBV/kKnxm3qkhTu/OxjNDKojSgfAAwrOckcIMYmoaSCQTjmL8bxPP
X-Received: by 2002:a05:620a:44d0:b0:8ca:4545:aeee with SMTP id af79cd13be357-8d00101286cmr801586985a.37.1774482767951;
        Wed, 25 Mar 2026 16:52:47 -0700 (PDT)
X-Received: by 2002:a05:620a:44d0:b0:8ca:4545:aeee with SMTP id af79cd13be357-8d00101286cmr801584985a.37.1774482767454;
        Wed, 25 Mar 2026 16:52:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e501eedsm106346785a.40.2026.03.25.16.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:52:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 25 Mar 2026 19:52:13 -0400
Subject: [PATCH v2 4/4] clk: test: convert constants to use HZ_PER_MHZ
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-clk-docs-v2-4-bcf660e1ceb5@redhat.com>
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
In-Reply-To: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+jW3MS7DFLqoUmBWO2hApFPt6x7I6eU55roZMBHG3AY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKPlDq+9pR4pOQ7aYO4ngWf48nCF8xr9143nDtDiqv1W
 E7vpUfLOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZgInxzDH85ziXPqPLzmfN3p
 s7rusprX8dXTws5tqyztfcznrxbv9oXhf4LZ9UdfnWSP/a879PpEunW6QmDqmi0/jd6Id3PzSzU
 xMAAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Convert the DUMMY_CLOCK_* constants over to use HZ_PER_MHZ.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..372dd289a7ba148a0725ea0643342ccda7196216 100644
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
2.53.0

