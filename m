Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CB6387340
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772367; cv=none; b=N7lb2Cq8WR8h0PgwEBByqI8lTb6a8bYMgRiTX8goJnObgiyRtdCBoBq+xoXMrXn5vJunDkyQI6xP5oH4EDv7R3m54QA7oAeazdqmbhcIOseWwv+aUeb+/7oDLtd+yYP8fssTjB921L3CN3hb/AI66PtQurYDzUgaQalK1+tR7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772367; c=relaxed/simple;
	bh=B/BbsfI80WsaMAk0Nl6urIp3XmccQ/UGQ7gdTSosKOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYujE8/oVdXvsU8XT70wVM6piPJmKlK0c0sfXYc5hEwe87HVVnT4DCKkYHIEGUa++ETNKTxrPZfQSOrcly+RATTzmw6YpxkrMMr9B6q0hxn3DXNn3tZM1r0P0lK00vXCqOGSimaK/TfLm6HbLln7Up8PepzBzU986pnDwj/SXIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com; spf=pass smtp.mailfrom=maestretorreblanca.com; dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b=twLwFN0p; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maestretorreblanca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maestretorreblanca.com header.i=@maestretorreblanca.com header.b="twLwFN0p"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56d36e7d8e6so894574e0c.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 15:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maestretorreblanca.com; s=google; t=1775772365; x=1776377165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJeH6RtMb1r7hYjiCIqngsDZysBaqS4Men6MeG6eUjQ=;
        b=twLwFN0pDcrNJkdI8x9fTtXBF7m7WiXTlpW1YtW9ntnz6ZwHnW830kojFtoeUZje3C
         xsz//nnvyrp5I01hlUn6tAWGtZPUzMZ6fp4fSv4FO6QG86GVRZD/xKvV7OBLW+BWWPqB
         BiIB8/8u9C06VSAS6KB2KMdXMqdc8AIBtVmjZgqTOv1xZzOYTMlaoWY0J3pUkc3V2t9I
         kWlIYbafrzHOIsYOHAwo6zJdVyfTeL4A9uXA+C9mVJklMSQxa+tUDnPlYB8VURHNIuNc
         W6zNp6pxQwu07Kx4AcFPODYvgmdm93pd/TXE7gO9fNNcjmFiDVUZp5sjOWJmXeI/Ccgv
         UCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772365; x=1776377165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJeH6RtMb1r7hYjiCIqngsDZysBaqS4Men6MeG6eUjQ=;
        b=DEJ2Xwt8IYJKgEyaVtj+/Cu3q61HqTPdClHtIOkHXIKPa7YesBy0SexGPSYlC71xAk
         zgH8JGdqSo3rdXWl0VLR5AjXvuLA0HOpSv+ge/puJPezZBACwQKrHMJWqOR9nlj47xO4
         PnTUeQoCxxbw9hmtO/Voqxf0Q1OJfwnf8I8anDEQwrwB3yxYAO1K4ewWpL4QTfVMYk1N
         +u+0FpIvUpiXvv4VZQKqjOiT1PkTS97eqFi1fTe/a/Yfd5vDoWBUEv0t1inMCSwJEWMy
         JR7egFLypxRlpyEyGaKQbpVR4Pk8kuB0cVDrR+RRud0gLHN/RMBFncL5Uunh1NeBT46Z
         ZJpw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8/VDC7Y58eEZwbadQW27rb7pRXSQRxHVXGqDPSw1tbejhF0Wi1T66U3evwWVCXHzEd4M19EPwF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTyUK9heY52D2qzRnq8NMCLljwrYYOIAP91GhceExL2tKjbha5
	mR2HuxrunMTddtowKNXQ9012dFbAiee67VD4UHHbQvBMF4dl/RZtCdiJmwg3sdgp+5U=
X-Gm-Gg: AeBDietJxdNRYzYx350+KbV2n7IzosDpyZd/7+y5Oe0INzZDB8U5sMdb0MCPpzns7NL
	5jEv4rhPP30Iq3bhmeACCxOYTKuOngi1zs5Ja9S3IHNKkPLlb+3twvSkEBdwtES9jwvJD28bYeW
	+3V4FSaYhUpQ6Cx+lqI+dRIwIycf65pMruuwqpvgLCNIexBcnL19TWRKlxztA+kFx5epZzM01rk
	64ASsv6J9KvHFIT4FHd1p/YcvHAzTHGhdqpT09+qOZMhadKTcYHFEJrBhqzUrqh8N/wf3z2pbma
	Kbt29BMSp2usGXMCkqcQtJdGH8glOJUNbgiL4uT0ENGhdLkRbIYsQBhDR6r6rJcOiLFq7Jmtad8
	pIqMpDwz/NLYO9yJuFmPVmIiFVT9MTgHEYsJXp9znoDax+0q48k8bGQAi4nNrpykKd4uNcn4bmC
	SnHyyJ+A3sq7rda/uIHSDDnwTHhowa6qKNemgK0Y/aXMZisTUt2L+uJjbzvJhi5Tsa08vqB6YU2
	7s+3fM/kdJc
X-Received: by 2002:a05:6102:441b:b0:609:4d86:77b with SMTP id ada2fe7eead31-60a00f39005mr322622137.24.1775772365160;
        Thu, 09 Apr 2026 15:06:05 -0700 (PDT)
Received: from localhost.localdomain ([181.199.46.166])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-954e0c7acb1sm550786241.10.2026.04.09.15.06.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Apr 2026 15:06:04 -0700 (PDT)
From: Francisco Maestre <francisco@maestretorreblanca.com>
To: airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francisco Maestre <francisco@maestretorreblanca.com>
Subject: [PATCH 3/4] Documentation: gpu: todo: fix typo 'themsevles' -> 'themselves'
Date: Thu,  9 Apr 2026 17:05:58 -0500
Message-ID: <20260409220558.98547-1-francisco@maestretorreblanca.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in the panel-simple/panel-edp TODO section.

Assisted-by: Claude:claude-opus-4-5
Signed-off-by: Francisco Maestre <francisco@maestretorreblanca.com>
---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a0..e37113478 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -456,7 +456,7 @@ be turned into a WARN_ON() or somehow made louder.
 At the moment, we expect that we may still encounter the warnings in the
 drm_panel core when using panel-simple and panel-edp. Since those panel
 drivers are used with a lot of different DRM modeset drivers they still
-make an extra effort to disable/unprepare the panel themsevles at shutdown
+make an extra effort to disable/unprepare the panel themselves at shutdown
 time. Specifically we could still encounter those warnings if the panel
 driver gets shutdown() _before_ the DRM modeset driver and the DRM modeset
 driver properly calls drm_atomic_helper_shutdown() in its own shutdown()
-- 
2.50.1 (Apple Git-155)

