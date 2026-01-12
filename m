Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5414A60F
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235954; cv=none; b=HJerJWM74/75Yjp/NKeAWVbMYOCY+DFARJS66nH3FFGkUm8bRVfX3TcJ6HzHZXMJ45vG60FaxjlAoH/GIvTfEJATX3MsFrCcsu4z4YTUEatogV3yKtXS80f0QG548lMfsHq0EpBY1pMoldDJUrGXODBDBj71LZWbod9XBBrmuDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235954; c=relaxed/simple;
	bh=erja+tGEOoieSn3gQddPlTcrGJpm++f+5LenW+r01q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkD1DcEcOhVXDwnLSsOoPmAUIQ/bGjzD+PUhZSm4sFv2oAAYEGSAsKXsr/XkNFtMR5+5NC91XuHeIhv56zxKj1Our9+hrkF+IPxXNMVOVb2XtkEjs1zseITPq1G3PQRAEPr/frt9ssAQxz4T1ezQmNmpaHkn5aBkAzOlIFttov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AvnBTXWb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AvnBTXWb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so24790555e9.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 08:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768235952; x=1768840752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FaWdf88CSHRz/WgwAyqrABJFJ2+0VdsXLY6ZcZUEv8=;
        b=AvnBTXWboPPVLSTW1qr1Sh7yHSSfe9JsYuXyk363cwHQ09Eam7JnmeSaqElUMddDFx
         6TMycex40TCHzaKBcrAWCKgsHgHvA1PCxqYtmhPwvVCE/ELvZskpSV9K91mewhGdHx4C
         IQt/9oATJyUAFAnCWVXODDjxtyyUslE2kz/Rr6YM2Qe+CqnEGkP8HO1/1mToxPoLqTRl
         dTSGa3zopWtobeu62gc9VGXw0AH3EaLKLj5Dx4G3nxPY9oSytFo4rfrADOLY4sVQlaMW
         ZohbEWrTTPmRnbam27fwjjhqxfJMl2kgIv3ouL0TxXGu58DlQAKQxfBP6HVvdoR/KfdX
         //fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235952; x=1768840752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FaWdf88CSHRz/WgwAyqrABJFJ2+0VdsXLY6ZcZUEv8=;
        b=EfmLf/OoTI0f0ofq/CszH5KAatgRJzLDXTOM7aR9+KnCvVzHtH+NlWHeG7dc1e6HCq
         Am7KFMyuZebWfRz0d+ROeAYWappbphX4DDHa3jIwUHdaFaaCKfyFp5J3TdxVV76Du2KY
         Hs4rw9vWoL3cjPSzTaz0aT/tQL9EyCe7HUBDb+P6RWo2T2SWdQzF+APzGLSQg5bwDJwB
         9ToG6G5S8D0fFChnhQsyDGEKUao+R0f6YWmA0eKhGFxEWr12qq6twpvevreVNJVeQhD5
         1xiRCnXwtPIfBpGScbamF3Lpo/XrfI3kOdVDI1soZFm60yv7zlQoG9HR4chEsGNVzKyO
         TBPg==
X-Forwarded-Encrypted: i=1; AJvYcCUK+/4myJI/Qy4cB3N5RjQkb7GNRU0PYSpxLoVG3KVsDKLF6DNbevIwAFhgUWAnVubZ0UpJby2ZbCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/RhTNI+krGgPyIwmVUzqFNllVuOJzShZ1JKvTH0w9K/pO0XDD
	Ct4cZxFYAixXUeznssW5iqX7l6hMsewQwTvoqq8vzmOou0KXAQLYzwCAE2iPvwUJrCk=
X-Gm-Gg: AY/fxX5pyPeQoARc94svGI7LGmQpWMz1uAyCSny/N3XzuLV13MHlhpudb913AvPhdDO
	BaUXmuu6Zlsta/NBbFxl1/Yej5HVSjtezjpymTbSgPGATIKJYLZ+P+ZhaanxkfSl7cuyXwiDQg+
	4lK9LulSUEsu9r5iVtITGDlW0gh94DbwKYCA271tcSiLWaIVgb5BPjeBZevAm4/sEDo1R13lmAr
	XWO0p4UJED25P6eZvTSA/KPV+xOMlP8W9v05/Qc1ElXmG/BHnEwEEjYLhml2gdvZUSp5Iq1296y
	qrjMNjBRnCX/wCCnc1dQzDiaLqcmmRe43DNlUN7tEUKweiMKKIM9OUVGPb59NHE1GV57/3vHk9e
	UGzyicbZdoG3AMs1JJT8vI7G6WHqdDy03TIxjJwZuVj8mr4YwQ3ROJystY1RyXSnJjRnd06KLJn
	GelDigH/f4nvAC0ENqazwLj4yuEa7CikaQ5A==
X-Google-Smtp-Source: AGHT+IEMvv7Vt71tk1jmghUnGOF6+DNjtrPqNmfzUQbCrl2hekYujJ8kAz+RUDRTWNE/l7YWLIvMBg==
X-Received: by 2002:a05:600c:c48f:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-47ed7bfd511mr510915e9.4.1768235951707;
        Mon, 12 Jan 2026 08:39:11 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184e1sm352101385e9.4.2026.01.12.08.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:39:11 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Frederic Weisbecker <frederic@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH] doc: Update residual 1Hz handling description
Date: Mon, 12 Jan 2026 17:39:01 +0100
Message-ID: <20260112163901.338596-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a CPU is nohz there is a residual 1Hz that must be handled.
Accordingly to the documentation, this should be manually affined to
housekeeping.

This is no longer the case: the residual 1Hz is automatically offloaded
to workqueues already affined to housekeeping CPUs.

So change the documentation accordingly.

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 902ecd92a29f..414fb42786c7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2368,15 +2368,8 @@
 			nohz
 			  Disable the tick when a single task runs.
 
-			  A residual 1Hz tick is offloaded to workqueues, which you
-			  need to affine to housekeeping through the global
-			  workqueue's affinity configured via the
-			  /sys/devices/virtual/workqueue/cpumask sysfs file, or
-			  by using the 'domain' flag described below.
-
-			  NOTE: by default the global workqueue runs on all CPUs,
-			  so to protect individual CPUs the 'cpumask' file has to
-			  be configured manually after bootup.
+			  A residual 1Hz tick is offloaded to workqueues, already
+			  affined to housekeeping CPUs.
 
 			domain
 			  Isolate from the general SMP balancing and scheduling
-- 
2.52.0

