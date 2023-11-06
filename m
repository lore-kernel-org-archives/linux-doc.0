Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680671A591
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncf.edu header.i=@ncf.edu header.b="YuXeChXa"
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B4BD76
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 12:18:01 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-579de633419so58971467b3.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Nov 2023 12:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncf.edu; s=google; t=1699301880; x=1699906680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U8ZaLnkOmfn6VUj4P2bkyzAv0ojbKADStfSaOPEyh7k=;
        b=YuXeChXaR12GuDusRAHx2xim51OmR8OslhG4H51IsNrwFr96NYyLiZLQIiB2c5pRdL
         +RdFx2pn6MsDs6QCwMFR7CoEQJ/hUu882EHtEiFnMutv/7yXJC4xYmehOFosr07YD9V2
         dssjr1XwMrB6BF24UNePkNYe9G7j8OXKWmQ8xjxa1Dfb/PxZ48cqI/e8Y6/ZPk9tk4tG
         YVWpllurG5nlnHVFjeL0nuDkrQLCNOMc8v7peKVoqwKEm4smeTWga3QqoNyhu7V8//qj
         nILxKyKaK/BlFDMECvkIn3sOxwwThPqLxVlAxWWvA4p+kR/1SHuzGme02Q/99NZtVgqj
         enXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699301880; x=1699906680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8ZaLnkOmfn6VUj4P2bkyzAv0ojbKADStfSaOPEyh7k=;
        b=h4U2NYr1ft5AaHZhxor/9KXjQ/YHkdNGXQK9iSs/xd+JxYsBz8+A3dFjGKB/40lnrN
         6R9IlC/NdU9C1U0XdKhmUW6mYujWJnfi0T/y8pw4uz5zqEIDAUIakL596AdER7XWOMOo
         Jej+hJ3NYfp8DmJJhbdJhty2JaRvwTJGmk5cuoL13G1SWLC7KS5IvvZLtP92aLwubybf
         Qx/KWpE4yvoIXNnEf1V9O9wgMt6xCPQBLVVVLTexWwmDsDNxQtfK3uZzb+TZ67Y9FiGg
         WfCZFx7HHTDNtHSVuWmbb5XjHiye3f37LAAaFlma0ap8+j9/bTvHHZ+ANHo2wVbcuo2U
         ceiQ==
X-Gm-Message-State: AOJu0Yz0J23sTRGVL59yu5EdhCSSCq10gevLRRx4bxfFvHtLBFvDjuYm
	F9AGKA5YFUjXoGsd0aF008J3mA==
X-Google-Smtp-Source: AGHT+IEQcelb7+yRoiYucbFC0plzPHM97ye3oRTkSaTHrhyd7sCMz0sZn3o3ovon0cvSA7iGE8n/Yw==
X-Received: by 2002:a81:658b:0:b0:583:a3ab:b950 with SMTP id z133-20020a81658b000000b00583a3abb950mr10575615ywb.50.1699301880325;
        Mon, 06 Nov 2023 12:18:00 -0800 (PST)
Received: from localhost.localdomain ([2601:580:8201:d0::d089])
        by smtp.gmail.com with ESMTPSA id q203-20020a815cd4000000b005a4da74b869sm4782343ywb.139.2023.11.06.12.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 12:18:00 -0800 (PST)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Hunter Chasens <hunter.chasens18@ncf.edu>
Subject: [PATCH v2] drm: amd: Resolve Sphinx unexpected indentation warning
Date: Mon,  6 Nov 2023 15:17:39 -0500
Message-Id: <20231106201739.29507-1-hunter.chasens18@ncf.edu>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolves Sphinx unexpected indentation warning when compiling
documentation (e.g. `make htmldocs`). Replaces tabs with spaces and adds
a literal block to keep vertical formatting of the
example power state list.

Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 517b9fb4624c..81b8ceb26890 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
  * Reading back the files will show you the available power levels within
  * the power state and the clock information for those levels. If deep sleep is
  * applied to a clock, the level will be denoted by a special level 'S:'
- * E.g.,
- *	S: 19Mhz *
- *	0: 615Mhz
- *	1: 800Mhz
- *	2: 888Mhz
- *	3: 1000Mhz
+ * E.g.::
+ *
+ *  S: 19Mhz *
+ *  0: 615Mhz
+ *  1: 800Mhz
+ *  2: 888Mhz
+ *  3: 1000Mhz
  *
  *
  * To manually adjust these states, first select manual using
-- 
2.39.3

