Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C174F2D7814
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 04:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108435; cv=none; b=PPYwDXy7r9aJoeyEotUTD9bUOQMBM/lKmq7ruQfmsYwa8QlMhtn3B/uLVWP3zQB10gQZ5cmrAgqWNQE51BwIH9o0PcZfW9tw3++iljuaXXGGU3bI7gB2cKpG6uKR1I4aSIUz3SjppchfyXD45OLiC205rk7wzVDMKtigkidSb3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108435; c=relaxed/simple;
	bh=CHAFGElaJJM6vqsKWvce129HGl6ku8z5jgSnDpe1PuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYM6usrnuDWDo48O7nFx54h5w2M7o3TMP82xUzoFGghj3dz9zJdmf3JWBydcqDy2fpXRqraP+FUpNqgejBjLnOVdlpoQT04Be81rY1dptxwFrjbQMRSldKgPhHVEsrjV0ywU2dVYYwsUifOB+b/oyGR/ZXtSmvbjhm4L3X3LoPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=rF7nshgX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="rF7nshgX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7a23208a0c2so2941335b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 21:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761108433; x=1761713233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARDIlFsexdBsHJ/mYs4iJ+oZYHRCoUuyGXAqhk97moc=;
        b=rF7nshgXo7uLWccNn8t3L3wsY52chgNtUSL9hqUWGGTd6XqbOaUCAewttCL4ri3VwA
         UGaATqZsZ9wBBpWsmMWU1vuFkndFhXHucZk43f2GrDRRnwhG1uCuE3FA4Qp+DXPx3LgR
         vjyyP79ojAdFZnC7nCNZuu2y69ee9g/uu2sn5lLZvVaEB77Ljs/4drlkfE/xQJf/pQC5
         BrOJsKUykA2ZWgigl3C6zfYfqX0eCS/X8UoBahklqNQryMA7OvOlJguwieo6vdQTByHm
         mXsqd90SKiS2xGb1ihNWdOm8MphCX8DbYNFVzib6Ftl04OZKs74YCdvSZnZ2nwq9VNgD
         PnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108433; x=1761713233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARDIlFsexdBsHJ/mYs4iJ+oZYHRCoUuyGXAqhk97moc=;
        b=aweTsn9jQyAGRvWhmNlH8mUMD+YE6YJ0jWcLpfqUuAkPcqYZKjJOCWapqDvJ9Z1jwh
         W1MGJ3VqrnfWoUGerja3KbYtfawUBfpZOc/d53Cd2cW+kjd0MysTMUGdX/syLyI5erBA
         /+QtVJ8qh7D3DijW/5j6odEeIN2c3pOv5JBEaJAlgK9VgSgc24Fj/53yGWeWGHRgKVkg
         b2yA6LCb9BwOuq6xPJGp+PeOjFvlD5RSon+p328RqnP9+1Tgilu0RkERLDjR2LwcksLK
         FSpisUWtaz6O+qQyc4+KFb2nM3yAC0x+/fnqkEopssuQGrClLVV+Luu0D+Y0XLmnAS97
         P0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlbD6mxcFJoXcivekTxuv5ZEkvO3A242bfVPmU4SCnuMKs5vppNas5ouO+vjtqOKhJ4oEQbbXF04c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOX71WQB1t9mGLHKSWhrR47EOgYoJiruLgoNKzrvI9oIzAs1Hg
	Wq1zyBWjGQiXuyxpXSJBPQl350CuAPOyoVD5IAku/vyxSnPFQPnpB1oYdmwm5gGSdG8=
X-Gm-Gg: ASbGncudEqQG/oCtOnAe3fCdRp72tcM4HlDQKMwr246PO8RkdYyHpBr7E7Tz9JhUGCx
	Wt1ktjgwlfyI7/VlCQQxTDGxoUviumlM3zbt8qCTnAL9HGeg4DsX/XDXrAskacj9lgS/SjGLPEp
	X4Io7aha0r/+iP+KDmcqA4xeNaPiXVV+MdqS3ZXSVVxxBWkIn36jBAoxq/BFlwqyP0nQQkgZhBR
	pmL+G7dznZr22bbSNkZBSRf9JbylV+BpvqtouSY3cDpyC2xfL02Phfy/xUW/uNzc9D35CjiTvG+
	PErEVWCyHU6aWBURVCpuHOQHwuWLamO4aOABPaYuuOMNO2cKJ0HnyDDFlJVUvJemLRWjgPU2jMS
	/Xx26zD3M1XfsSHK9e4/9PJHVijgvOOlviZKQU0lI8Wh84KGURiC1+5hgprrm03BfBW8utf7rKe
	7Lv2i+0JpzeItkfOBQCckRjJOjIg==
X-Google-Smtp-Source: AGHT+IG7v2tgI6or6tIkrpsvq7pRrpwD1oTrsV+QwYIgQi2vxNVriCFRUTuiKuUNQqyqsYpRcg54FA==
X-Received: by 2002:a05:6a21:998f:b0:2c1:17d4:4139 with SMTP id adf61e73a8af0-334a86108e5mr23495747637.29.1761108432842;
        Tue, 21 Oct 2025 21:47:12 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:8004:e310:f3d:dd0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dd9d6sm1257413a91.7.2025.10.21.21.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:47:12 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/5] drivers/hwmon: Add TSC1641 module to Makefile
Date: Tue, 21 Oct 2025 21:47:06 -0700
Message-ID: <20251022044708.314287-4-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022044708.314287-1-igor@reznichenko.net>
References: <20251022044708.314287-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the TSC1641 driver to drivers/hwmon/Makefile so it can be
built as a module.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 drivers/hwmon/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 73b2abdcc6dd..a8de5bc69f2a 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -233,6 +233,7 @@ obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
 obj-$(CONFIG_SENSORS_TMP464)	+= tmp464.o
 obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
+obj-$(CONFIG_SENSORS_TSC1641)	+= tsc1641.o
 obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
 obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
 obj-$(CONFIG_SENSORS_VIA686A)	+= via686a.o
-- 
2.43.0

