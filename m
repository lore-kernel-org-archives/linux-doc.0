Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B276F2D24AC
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542655; cv=none; b=H3chIGtkVp60e4X9Q40kL9RHEroWEXqaNe7jjaxuuY48utOjO7kyRvpIcvfxXUeMbcvxverVqM/KYNi/6GxgynazfHWf2M2Z6snQwgw8LCaP3cxdpJTuuEVUJ1toDobm6B9pA23ud1uXIgrKJnuxuEzrHf7kgMtlILkmB1vm2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542655; c=relaxed/simple;
	bh=aLlRdlh9FDUPd1JAE8xBaQc227ypKkHoxuDPxDr9ql4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dp6QOvxydMMutKcZz904CGMQOTJndsoVZWBq7rgeb/HcZ3/4cxdHYDCFpYU07/dOPysZSCHp6zDnHW8sCOvkD7OdJ4dlyYfnmAHEGTENgSxXNOSNOaE8YMxwcXqUlGeeWx32iE5HWOpNfOL+Jyw3cDbGJ133fr1z9VW49Tomc6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ih5k1QUB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ih5k1QUB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b551350adfaso5510852a12.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760542652; x=1761147452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hn9avPxUFptKtiboarOpoGxvc9w+QcujEJ396q5eQtA=;
        b=ih5k1QUBkcqYqtgLFsRSYm3xAcltkjkYyVMNP4riod5hCzyKwFgHs3ayC2N4KQL2I7
         f9z1tj1nZo9u4pX6oaLc4boLXSyhEmk41nXZoFwhV3kwKJql5mEcCjUEyFttpDsynXiE
         NaEi3XE4DEh1Bn7hDDIyU0CuT2dHG/OPtFLA37YaeLYYz9AdnsS63loP22lczp1zrEnr
         zuTZFQ4WV4xBrb+zVX1Wekl7M58ohkFRLdUmxfQ/JXOVUB7iMzlE/kSsR4F5Ua/pBeLt
         A8Nos01jXzbN1i0whfYYcuGk4ohs3lvQB/+QNhhhD+65On/SU6rrs3UXAWHI/xaDAhjw
         Tn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760542652; x=1761147452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hn9avPxUFptKtiboarOpoGxvc9w+QcujEJ396q5eQtA=;
        b=LE3CqG8zSeT8SpJ5oPS7RqTSP7KbKbg8Fhk/RFdyb14kxM9OlGkIB1Rc2dh5aRRAyB
         jd6xDXXQ1kOmVFMQoTxJ6zWtK/cdzDqJXpQfWgr+thkLadDC9mRSQe9ZDg5PzU1c1TPr
         7vVeisjruxZbKlbWSrshOmZHiTAa9NlD7yYoNzSS3CWEsOB1e3Xnp4C6baS3ZMLSyH8h
         jZ/WjwkTUOs8UyTCLgaYmf1kIoOzZSz/b07Gy04diaFXr5VklfY0lm9v/gHcNaxtdEf3
         7LUI01QsK0kprlViJrV5aJPAcjHAsaPl3Dgi1fbl+erkdhw5afN2xOZyhRuqxUfglFqJ
         MhGA==
X-Forwarded-Encrypted: i=1; AJvYcCXZZ+WJsYQ29FUtreB1+9KdF5/1B0ksfEtAwNgwAVYiNtN1ANOkzu5m0O8Q4y54thdmWUruV46JYL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1GPQCqUM0d1mF5xaZ+O+1cZGrZbm9RUcrIUfzLQ70zRaU5qzP
	vat3aTUicAeFrQ05jBPQIccGZ3kybBFF9kqmSq+xpcmRfChPhq0K6VmE
X-Gm-Gg: ASbGncugy2ukp8eiA80sXZG8W8+2xje/RKF1rAuJIcV17Us3kB2DzApc600BgC+TmpC
	rP85TlqBN2bPky8ojKknA5Gdufcay0gg2BlbWk3kGDm5WQzgdGpI0m2upWrb4FROlMf4qyT1c/5
	OKaIAJJ+aA8l7nxdikf2uvipLEYNOEtySk2ysMzicpPDJ0shIkoiWauUo358XAmgJlJS9kIUVr3
	jrWgfjbUhK1i9wno7f0ibgKvW90SVJ4XYz8PSiVe0Pd2NpwsOM+f7lilUCl7LpcwUZoGoHgsgzE
	ZBKyW+BkrP9Ln74ynesZccQxGByVJoXHb77fWdtZXmmCeyEJwP/VtPtys9mO3rgpRIKJBI1iRVt
	iXoD+oHrcgzrydJNm7wKKItFK/CEFVRQ9so6Qu0EQmh5rA3cg/5FoHg1HjGU=
X-Google-Smtp-Source: AGHT+IH+yHJj6xUqrD/D2julKj+3TgI0zyx5td0Q6jzoMKQ8APWTNss3bNdH/1RhbmHAbB5CH048bg==
X-Received: by 2002:a17:903:3c66:b0:282:eea8:764d with SMTP id d9443c01a7336-290273ecb72mr398634825ad.35.1760542651777;
        Wed, 15 Oct 2025 08:37:31 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f87b23sm201655935ad.113.2025.10.15.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:37:31 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: kimseer.paller@analog.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] htmldocs: Documentation/hwmon/max17616.rst:4: WARNING: Title underline too short.
Date: Wed, 15 Oct 2025 15:35:27 +0000
Message-Id: <20251015153527.1646111-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning encountered when running `make htmldocs`:

  Documentation/hwmon/max17616.rst:4: WARNING: Title underline too short.

The underline below "Kernel driver max17616" was shorter than the title
text, violating reStructuredText formatting rules. Extended the underline
to match the title length.

Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 Documentation/hwmon/max17616.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max17616.rst b/Documentation/hwmon/max17616.rst
index 936447159f87..a3dc429048ae 100644
--- a/Documentation/hwmon/max17616.rst
+++ b/Documentation/hwmon/max17616.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 Kernel driver max17616
-====================
+======================
 
 Supported chips:
 
-- 
2.34.1

