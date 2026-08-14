Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B3424D73
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701486; cv=none; b=fYHWR9gjBnjKiA6CtMV9KUAlcZ0Z6iiaLN8MeovnTnuzJoRLnASEq0daTe9dt8x8a9/UsUet6hmtH98JGVenjJ8hH6L9jViTSkOwulgbuq5b2a40s7o1wJZk8XzH8eO173/KVoFkpPtIJyaKqDJfEfubsBhq13FiRWMeRpQGDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701486; c=relaxed/simple;
	bh=EWws4Sm9+B4D3Vwe3Lc2f+99NK9aInhso5r7IaIXQ5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2251VTq/fsBoArbcwnkwrNHC6DGIH89RU1ggkf7PV5jBVdyCeGiQtqd2qrXdf+n5K/LqyXgmi0LzHEU4nkes0aibmUfby4krBceiAWyoi3FcHa28jueIYX1trrUbrNSNcPXq7Y7YkCXv2g5j1/nZUtbfNZurxDqjGTwx8nl+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ft1hZyKM; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ft1hZyKM"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-836c91bd782so12633007b3.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786701468; x=1787306268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EWws4Sm9+B4D3Vwe3Lc2f+99NK9aInhso5r7IaIXQ5I=;
        b=ft1hZyKMIuTW6RGhsS77S8azknsZDlXuw9ewbM8zZH285PcrXgPwCMzSQroyUECl9f
         oxaPGXpKDFt1vEvar20rNZ7chOKnXLWi3FV3QQHkwq/4T/tPAwn+icGrVINVRp6GYuVC
         o4MDamanLLKodH9PB/kdOg6fjmLat6jT0uavWd86qHfdMaKrgSxGj8LeBVUcMXLaBxTo
         N8pCAonFx+K8ux1COu3f1oE+7W93dbv13hgBofZ9UZism0EbK9xLanKzvDoXXYP+2Lvw
         PDtp4Wn8GdlLh6HGYs6zg2FLzRR5riHluU1OakR+nOiyth+5hW5WbjKsnZWhzyG9f7FI
         4mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701468; x=1787306268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWws4Sm9+B4D3Vwe3Lc2f+99NK9aInhso5r7IaIXQ5I=;
        b=IpSHB0NBYx7h5iyNsyvhuokT1einzTB1woo/VJyiARXGIKTnXXlABgwV3AK1y+54be
         OnvhuLOB/QtX26bEz06A+GuL6hs4UfoD+OiWL0Z5PoisXpcBev00VpGSVdDOYuWXWtLN
         E3CbXWk+g6+fVOTaZrkx5otzA0Jox41PYseXsAcwHn70y7nmRFHbGK01M5SqE6UKbDRo
         kvJl/SAgi38M0HutcOGIrw1FvCgP1eqB3OouZXcKMX38R3Zx4yJKMGpseXC+zLezML/j
         34Qb+DnT/u3yekKelBKvjpkjB4hIR9rdnOLxCGKf7ztZLhMev8Bl1yCnBPwSynYzjKJD
         hmXA==
X-Forwarded-Encrypted: i=1; AHgh+RrXdtdJy8UED2prQRJ96yhKEP1K+MUjT680soUfMFDYinNweV84c2fPatIOKrLoWhUGX2l7LW85BZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSE2M6OvF9e7cTWP2IVeRpN8a8kdrg3H+/xUL3/EUyhhXJDV5B
	+TqemzWb0+MUupPxkkgabPzIevKqh/cROIEidF4V7TMb3vYnehKE4Zwr
X-Gm-Gg: AR+sD13qxqrM4Ohi+gglCCUif8BUF6zHN51Zy8VVBaRdvxNomss5VzaJiRK2U08gXJU
	mkWnxbwJTFiytAM3a6oNxlwvZTkSJ7w96nwPzFi8K8zpu1e20nhQSwpEE2+AEGfKGP6isKqlbkR
	oFq4h91DKCHW3RvdFSo8eiBrXpnKGa1NjR49HCgZmRTydeaRcr4W3eIOXa+81OYyiJINHcUILSi
	u1C633vaYj++SowUdL17usCw5aWCSe9/QFyZ3D8ROrBczF61SnsJMyfYj0oPwDjwpFY+cby87lL
	uPQQe2we+ga2qJIDxYwb+wixjB01eEk+Bj8AsMoPQ7La7OsxMxNF7h30kj5fL17gpI0MFjnPmnL
	Nn6JAfz8nyhzwY8SrGuwqZIqC55a5Kom320Xplfl5HSFbECBPg5PP7lbM+pz2XdxWvSL22Qvaoo
	QMH0HD1VrgUHJ6s3Uaj9YPhSy6MTNWq13GF+zW3EuVZBeifkw5LONvWpoTIF0DTWzs7A==
X-Received: by 2002:a05:690c:e292:b0:820:b24:27a4 with SMTP id 00721157ae682-83714dd07ffmr13828027b3.32.1786701468147;
        Fri, 14 Aug 2026 02:57:48 -0700 (PDT)
Received: from Gentoo ([191.96.150.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-836c1f43e82sm11099667b3.30.2026.08.14.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:57:46 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: ray.huang@amd.com,
	mario.limonciello@amd.com,
	perry.yuan@amd.com,
	kprateek.nayak@amd.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH V2] Doc: admin-guide: pm: Remove unnecessary backticks and fix a spell
Date: Fri, 14 Aug 2026 15:21:37 +0530
Message-ID: <20260814095716.2905589-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One,
Removed the superfluous backticks in the sentence.

And second,

s/peferred/preferred/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 V2 changes from V1:
 Randy caught a spelling mistake in the same sentence,so fixed
 Documentation/admin-guide/pm/amd-pstate.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index c7bf7cc2db87..6fd72ba52df2 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -471,7 +471,7 @@ update the core ranking and set the cpu's priority.
 Kernel Parameters
 -----------------

-``amd-pstate`` peferred core`` has two states: enable and disable.
+``amd-pstate`` preferred core has two states: enable and disable.
 Enable/disable states can be chosen by different kernel parameters.
 Default enable ``amd-pstate`` preferred core.

--
2.54.0

