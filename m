Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B68F27FB1E
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772936298; cv=none; b=Txo8G2KTcao/bwMXNbIV8kS9Hb/5eD9sfgUcjY03B5TCp9tFk1uCmACyX0Fr21x/x4rsLXdF0WkTtxO5Wzppa8yGp8q7YohwB8vfuZgtl7Akd5zzB3cmldvj9QQAukul3ctXsUbxT79S8s+0rD+yql9crbtXN9nUU2Py0ZLCN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772936298; c=relaxed/simple;
	bh=MeqH7u4eTIrpk5GIVCE5RxM5iQVrdNO1AjeWs50Td7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZaapTcjBT1KFWOsVVnUaNSBr7MUB9s3JW7Rv6hhn39MJr0AkJggZXfgUG3tR+S+a3Gi3PSwp6YPMbgvzDEI67acp5ciVB4bxPRc8+L0LVhdU0xVYS3b8hbrmO0Av7haCoyIadErbgFOEoRn3nsr5Lo1yHVQN/xunF1OpsNhZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF7mdHXJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF7mdHXJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3598cab697eso4274139a91.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 18:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772936297; x=1773541097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eLs6pe+2XdQCgxeAaSiAQagpBRk3m3MuIZTKss7ZE2Y=;
        b=gF7mdHXJqlcZYjDdtsFuhTr135bVmJoERJlPrQzdw0eb5oxi/+RowQY1QN0oF9Cy/T
         EyBIkikW7yh76tMCJJClTQNRQlNlE3wtdMuv4z9nqlaQVVPdTeHy4bnbFFto/eua44d/
         x+WdjQ2gLxr+Vln3ME3Tf5v1o/JRrxLppX8iv3ltEv1O5Cb0EcrzzJAnWlIAEGho7unI
         v70d6M7XJCIj2CU3Ccxkb2W1gmp0gGfgkpvdOdVXijtuavULpN2xBCxEZ80G9+v/7OWV
         qALzHa9C6b3u5OtXArM5JR8CCGjaMDyCezw5I6F/BpVZLT11kmgfh9dxGXpp0UkeSvCR
         4+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772936297; x=1773541097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLs6pe+2XdQCgxeAaSiAQagpBRk3m3MuIZTKss7ZE2Y=;
        b=ILOOv+1YKi+ULOGEHamPGOYL4o0fEoZ/rcCE84tBkFqUY0ZEajppi7lPtj91IpNNyD
         D/wc5sXpsEmDlVdXG2NInrauOEp2L0neVypMg/vmsXt4+CvKQSa/Ldg5AsQDLo2i9XQF
         7t21pdnmBwn4etZaSVQdwgDLI/BtpL4SoNN4Fjp0gqrUwxe81F9Ht/Zcf31KebYT2DjV
         2stQAWhmdnh36jGZHV84B6ELbkoDins4jGgi/gRPHffavwwygYBpgCutHDrrsBTzx4UT
         qSh/x1RkSwNBmWSgtfDdg7gmNQuW2P0qtRX40lgLOBwuGbku2hhMR5Uch/r7UszvXwkm
         Bheg==
X-Forwarded-Encrypted: i=1; AJvYcCXQUbtl8uMCGisTJOToClJWxCXdK36Me7qa98FdKI9yfj8S6K/PSl6XYVO7tTcpqG+6g/AQnzSePVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxhGOJPPWMiy9KGMtgfrpfHmB9KrTfUjEaAlYrSFI4952kBrCu
	el/EQgzCnb7WFyqsS6z3slF1V7SGNrFuvKuB8aNcUYiik+g6pr+ddCIR
X-Gm-Gg: ATEYQzxTpeXexUoZDIpVTZbP0qUuaWP3qruiOq6LFNoi1DqcTSy1PkDb4kfobz6ABVp
	SjkOaAnLev/pK3+i4HB0y/7yKgFtMb12feg432CoGDBj1SxTiWmVlwdRlwSwG34Ze14TfVuyBvm
	kczs6zFK0zXAykzwaeDn6tOZuEicuQ3WMrIe4RlyV9jdDKPhRzRy6LCK770sw2Uvzx/2QUTQE5k
	ZhthXrX151U1VY2xsGMxkjOX5Z+lvCIsazBV2rcOqeOJwFgHfN0VOoCghcH8bLKSMD6V3FGi5uO
	nETnI/G66aRzXHxLaZOocd+DnBr726NgVLNsXDN5IAq8TGUWlW47WXO04Goa++2SHXHDfYVATy7
	gi2CNoT3yYfrHhyG0Y+FoJvSq/R5yGCJ+8+QWQoC8UDVVLWuCXqqgl6txB9FxZmBPCc756DmtDb
	EQGqvk6KLGEdEN59Q0qBoJTYF/oONbZw==
X-Received: by 2002:a17:90b:2e0c:b0:359:8ca0:308d with SMTP id 98e67ed59e1d1-359be3939f7mr5791531a91.14.1772936296532;
        Sat, 07 Mar 2026 18:18:16 -0800 (PST)
Received: from localhost ([2402:1980:89f2:c7ce:61e7:b269:3230:dede])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c005e1b2sm8209446a91.5.2026.03.07.18.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 18:18:16 -0800 (PST)
From: aethernet <aethernet65535@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH] Documentation/mm/damon: fix typo in index.rst
Date: Sun,  8 Mar 2026 10:18:11 +0800
Message-ID: <20260308021811.41199-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liew Rui Yan <aethernet65535@gmail.com>

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 Documentation/mm/damon/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/index.rst b/Documentation/mm/damon/index.rst
index 82f6c5eea49a..318f6a7bfea4 100644
--- a/Documentation/mm/damon/index.rst
+++ b/Documentation/mm/damon/index.rst
@@ -12,7 +12,7 @@ DAMON is a Linux kernel subsystem for efficient :ref:`data access monitoring
  - *light-weight* (for production online usages),
  - *scalable* (in terms of memory size),
  - *tunable* (for flexible usages), and
- - *autoamted* (for production operation without manual tunings).
+ - *automated* (for production operation without manual tunings).
 
 .. toctree::
    :maxdepth: 2
-- 
2.53.0

