Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFFE4248D2
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601919; cv=none; b=BFTi47VjxrH3lR6wjlZHCeafH04eCfT2en3ExiOhd5QebUd0TbFu4d2CR4dD+Zw/nxFLNikPJIxHvDwttlWCekp9/CgWy2fzlPsKPbqkjIu3IMgfEGxTpNGDsT4lxOxkNsEYPcT5cuAr8QfJ6wmhu+RkJx/ItHRex90bqGss9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601919; c=relaxed/simple;
	bh=w2K8xt4zqhcE2EqGn4AK2C03mTpm3iio5Rl14IWc5/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jvYjMPA0VmBK2MlJoSJ57Zs1DfceK+CsiNpMNEJnGkZUSg7s7krZChbnc9Qan2HuwONhplr70q6iQ9b0D3ovRwzpx8SX/SX5fIamKhBD5L8UVCvF0ITYiibG/8dr/iPximAlh6apBxNdZNYpwggrNxFeCdT1kRQGyN+LBMs63PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2H+bDs8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2H+bDs8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4858595f997so1140676f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601913; x=1789206713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EIWO0mubRMzOhdGxKyeqO8ZgTz9Vq0CCl/AF3S1B9uY=;
        b=C2H+bDs8XvwqwSFgHX2ZDUgVJbGxEGo+8ggeet9BanCE2VcwrRs0/GX8bTbJiRC8U8
         O359ZRFzki/DiX0IM+WXFkoIs7+hQveQIa0NatsUMyfs/RnEMqvWzgqX9Tq3CyhBkSbt
         cQyC949yR4XTYvjkvdPFLJN82tjI7QPu7DkBeqgBYsUDsE7IlwiClTU2WaxXQTyDCalb
         0g0NJMdHFoeHp9fuCsZMo3AUUlIPChhPzgSiM7RSA1iWs6PeyEzSPpOZSSXS543FYXrP
         20c7XnQAOqO+9Y3223P1e5qN0nsUq0EkfXJQrUvFv5c5h1ZrAmVxZCM6BMhFZRmA2WWN
         7Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601913; x=1789206713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIWO0mubRMzOhdGxKyeqO8ZgTz9Vq0CCl/AF3S1B9uY=;
        b=PZQg9a0DoJ7QrW5PFejYdcyhtE//+DOMJHw4YdcG2mcxAs865XEUQGhH/Y61Jae2gr
         ZqyLriCp3CkO+YpSk5NKo2FlCr4E3xFN0wLJNsM+n5Ql0dF1vWbFKzn1a7oNsnoWNUi8
         0NukUm9ejndXp98jqeYhjRssGL3E4OEE4ypsK7NPZssvTFgJMMPpyD1j4JBvV1Hf+A6E
         OaHsU4wpFmfqL61KuTOPPs3exGIjdf2VvN7v0Dt7g56ICl3niQ2z2yA5NvJ0LrR8aSXZ
         qhw/e5fG5p8j9wcM8iqCRubvaoG+EVzILSV5mAiNeMlJ8YuVzgZllapRe5DYGWSip5Qz
         lLdw==
X-Forwarded-Encrypted: i=1; AKwUvBw/lN7EvazQkM4IOTI/QgmWyAG1eRgIBvSnNNR/M2fyVirVFPFy432tt5kqvvjXKjCZOJYLdjP3GXQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l5uhElvKlBPFli7jbLF/wlZN0CBK+5wDH3hsmUCQFAR2876Qj/
	NzDdGnWTz9P7gUU2OcvmhfzsYezlFF5W/6n4kJW+jahQVkgzZAbTOLuRfsxi+k11
X-Gm-Gg: AYBFou1pt4SUH9HYP0tpmjmqj7HzgfOej1/U+EczE32ndFNS9FTabK2vIhq0oKz/9JD
	EYRIYCvPbEkyj3gY6yc/zrfu376wrGACs3+WN+PWrK0x19KRWYoV6XJndvNjdrJt6deuu8AmO7a
	XD8vzC+IrjX21+myBCtIwqYCG3t1ZTyrLDT51E3RXe2IITsm/lmHq0HBQicGX11rOH1A3ky+SqF
	a4Vj/UsplpghWYvKTPYQbhCKepbWVsA00JOJHQ1XxCivyz0pOr3CPm78TUMHyxI2VxY9uS2IRvp
	BtEBZ5B7RApZ3nchfcwO4Z2r1Pm+1fqQqJIzbGmFUcjzp+b0QctYCKGu+4GtRnLcqyz4sj99POo
	LVWi8kiFrPJeXtBAtnB+0DWq+oqvGgR1kqSKSCng/U6LyM4/cv8296io8Vs6r20Li58YI1Zanq2
	IwH0D/saqdDx2/57YlSKAycwcpZAM+3s33sC+ewI/RC+kW1ADC2cB3iqjPCozdrZ2twPQ/MzExx
	LHsVtl6fqbdW8yzLP2QkbHuW5y3NteGdY95vH+AGfsslGdxtLAOzcpYNaRlbBPfoGMsDkCE8UAS
	rwXJr/l6/2OQom9RmJUR3AWCGWlBhwwgaa9IeftxRWY9Z6jy/5oEAqpYzZ5hhrmR8uc=
X-Received: by 2002:adf:e00f:0:10b0:484:47a4:ae60 with SMTP id ffacd0b85a97d-48587046862mr17461476f8f.3.1788601913431;
        Sat, 05 Sep 2026 02:51:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm12717226f8f.21.2026.09.05.02.51.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:51:53 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next] docs: mctp: Fix the struct mctp_sk_key name
Date: Sat,  5 Sep 2026 11:51:50 +0200
Message-Id: <20260905095150.42180-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct sk_key does not exist; the type is struct mctp_sk_key.

Use it.

Fixes: f4d41c59135d ("doc/mctp: Add a little detail about kernel internals")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/networking/mctp.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/mctp.rst b/Documentation/networking/mctp.rst
index 3bff00c11702..1b4bffa1ed74 100644
--- a/Documentation/networking/mctp.rst
+++ b/Documentation/networking/mctp.rst
@@ -296,7 +296,7 @@ There are a few possible packet flows in the MCTP stack:
 	: route lookup
 	-> rt->output() (== mctp_route_input)
 	   : sk_key lookup
-	   : stores skb in struct sk_key->reasm_head
+	   : stores skb in struct mctp_sk_key->reasm_head
 
 	mctp_pkttype_receive()
 	: route lookup
-- 
2.53.0

