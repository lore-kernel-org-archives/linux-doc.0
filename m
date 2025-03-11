Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE3260A43
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 18:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741717458; cv=none; b=tOn2ldJsk/weorlDfka8YXwUdopHZoYzcgmgUIptLKX6RMli2zeksmwSuN5X4b5CXMi0GDEZYWzaUh1zfUj0L7lLyhOWestRhshqGfUO7O7Kbq1LvDqBRISQvD179JB9MgVuHdDSCYiOzDB6ykjiP8ekYSYMLs/P30d2fimbVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741717458; c=relaxed/simple;
	bh=tpf/mDNfeil7F8O6YAQ5U8g/fjc5ETa+OCrb7g/Uo6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jksc3JJOAafbrt4GL0Fd0ZSQE1DOQFG0a85XNdAwpq4lj4F2am6nx0nY3SlTe1vrLgnznP6IdkIJvG3afOJa+/vGMfIder95JLELMh5uMU9r9HppZPcBaVgKZ2KIDry0q+dp/VqJRjqoHqqVbj01C02SnBuQ5qeNV/VV7jIJGDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nHAbOzJY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nHAbOzJY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so2645522a91.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 11:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741717456; x=1742322256; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7KpDa/DEzb44vSpz/EoTHsPUYlYrzw48Wo3fhhLmVV8=;
        b=nHAbOzJYBLcXeFjiUB8Z9wsT1pd6dk5DZnuvRMwF/WHoNrtV0CmFrwwkCM9PusIiGz
         tADYmwLQV5JtAqEmoooDRUReM1IX5aMCNIQx1/e8mQZNGNNumgmVaQzNNaWUsBJBwB7c
         MqxOhknAYyUh7piolb1VdpH0ZofEXxLnEP5Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741717456; x=1742322256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KpDa/DEzb44vSpz/EoTHsPUYlYrzw48Wo3fhhLmVV8=;
        b=fgpJA3XPEvGVgX2xDtWcQwRy9ai0OvaKH46bGAVgfDxEXDgDiWV8K/V02EJLQ1SkfQ
         tK2S9NQJuhq3ZOAicTVPtMp7Hb15DsHpMjQynBXtwAc2c1G6hfbn1YnBdriudXkWI33L
         UdP5xdvfjbS9rnYJPb6Bp3zMia43CySh+RaZfndEffCYGH8kyvkvcKWMmDRFrA3yOWRL
         Ebl6Npo0j98+nobTN8QVltSdbbKdEq3fbP6cbWWwuDg5ketQjz6quMFvOZ7zJ14nq6z/
         mv9+xO8uIXA7F0TR+RIWQ9MAVIO17xK4WyUvusC7vQ+qEo8fw0Q/RCqUpaWNr5jJ3QCY
         DeOw==
X-Forwarded-Encrypted: i=1; AJvYcCVXHefq5gVWUV3sSxucPSBIvLNyQsdPK846whpn3Z9XDIhUTQ5IxXYpfDDoVDuUcWkuDzyHfj9/EbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe8T4Dj0utyLGLQwomWgEUR5JVGShu+PdWHQiTc01VIxs0wK4E
	uFZt0QBe6yTXdPvEh0H54B50rAfQais9YiStJzMudLaIw8aumdxP+ncsYSGjvg==
X-Gm-Gg: ASbGnctNoAfTOYlk3ZJ1S/1x7TgeStngmSxICC/CEecL82xOUpxMwctWKUguJ8IyI6e
	pVr+SZ5JmL95Qxbfh30fjXBQbyas28TUYUdUS0cCMUsBW3vYJwxWchdR0/yLx0f0AcMIREjVQgV
	PdLWDRgsrDcJEYgodRWQGAwjeLbG5kxmAjYf4YV10IfPQX3yG8wMPzmB8QdF6MPAVNBXxrBaPVW
	vu0kukoJ8Tu7B3k61CQYuZElllUn2VGV+BHtcU3YH7fA3UWG//8caicSGO2U7qgqcat/HddZAZQ
	BANf0wTxQJ4Bm6njIjT6gKBNyaK/zbXSSDondaPLzOcmtBH46F6SWP+bL9XFsYnp3361BuxhbrW
	mZJyUbEspzdBt7cuASlZTHFHk
X-Google-Smtp-Source: AGHT+IHJIFBe2sp5aefvMU/+B+c+/u+vycxKjjJCB5yGBHEUo079bEIqZxKID9+1kXvZn7DFB3FGYQ==
X-Received: by 2002:a17:90b:180a:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-300ff105730mr7049629a91.18.1741717456043;
        Tue, 11 Mar 2025 11:24:16 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:ea1:ba82:2605:7d4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e773dddsm12265383a91.12.2025.03.11.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 11:24:15 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Tue, 11 Mar 2025 11:24:02 -0700
Subject: [PATCH] Documentation: ocxl.rst: Update consortium site
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-dead_site-v1-1-7ab3cea374f2@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMF/0GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0ND3ZTUxJT44sySVN1USzMLYxNLQwMzM2MloPqCotS0zAqwWdGxtbU
 AKoOjYVsAAAA=
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811

Old site no longer associated with consortium.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
After mergers the OpenCAPI Consortium does not seem to exist.
The github page is the only seemingly relevant site, but it
has not been updated in 4 years.
---
 Documentation/userspace-api/accelerators/ocxl.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
index db7570d5e50d..5fc86ead39f4 100644
--- a/Documentation/userspace-api/accelerators/ocxl.rst
+++ b/Documentation/userspace-api/accelerators/ocxl.rst
@@ -3,8 +3,8 @@ OpenCAPI (Open Coherent Accelerator Processor Interface)
 ========================================================
 
 OpenCAPI is an interface between processors and accelerators. It aims
-at being low-latency and high-bandwidth. The specification is
-developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
+at being low-latency and high-bandwidth. The specification is developed
+by the `OpenCAPI Consortium <https://opencapi.github.io/oc-accel-doc/>`_.
 
 It allows an accelerator (which could be an FPGA, ASICs, ...) to access
 the host memory coherently, using virtual addresses. An OpenCAPI

---
base-commit: 0b46b049d6eccd947c361018439fcb596e741d7a
change-id: 20250311-dead_site-e96834910663

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>

