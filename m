Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE943371CFA
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773594335; cv=none; b=q2qvKPDyloLMkeK8nIsrBlQA1GA+K5DsEnZcvmdLMPxwHpLN+IkLH3Xuj4MyuEcqKowAn6HnDUZUSpaf5PnPKveyp7l71AbcfVgFpJfYXoIBXHkDvkC8PnXWvQAOWzTd8voAAoS1sdqRK/t3oKcbPEHAL8cBCCa2lP45CkEVOF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773594335; c=relaxed/simple;
	bh=TiarhjbeWTimZ/S+boFoNb+teEf8FeWSjw+H5yN0n24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nf9nb/jpLs83gu7dDugExcC85+OIkrSmoPdvMA/oEWLM4CwjcgK0lYQCMTOc6yyNIxhjRvp/LOotqtHcWdHKKhfSvEQC7L7I6IMfJJwqXlzrBsVYJCldxtqLDRfRIuHm1rM/kNzAVaU/BqKgCmbW+u5YkORV+VgebPX4zpejGZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EifYzGrM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EifYzGrM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so2855252f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 10:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773594332; x=1774199132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1zvd4USYfE/u9fpOeRAD9258jRcvcIGOYCsL+WB6t5U=;
        b=EifYzGrMVxBUzcDfzvbPbzxiVptdW/4Higuwn1WSwmXpBHkkX8SyXyxuhXcgop7q5l
         RQo6iWQ3D8MA3o0BpRZmzZc6svtLZGeSO5fsyGJPAuzk2yFljZMbsfa5gS3Y5Ky2LEK8
         /GdXEX/yM2lO66oMfcrfDMjZfIpzwmFX1PXqvC8Ili4jsjRTM4rhdoQKuWhWA+BxYeE3
         Ipl1VVpXm2KptNkchfzwbpdfC9Ky9gw/8aeSGKmAQIrXyYoMOox4vWVehTgLi2EIdQJM
         tha/ciC25yXdeKBbYebTFfrH96ronh9UVoSsGcOV3OvCDeAvibxYI30/+QrHIs1ek2WH
         FD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773594332; x=1774199132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zvd4USYfE/u9fpOeRAD9258jRcvcIGOYCsL+WB6t5U=;
        b=LHVudbmBOFT4zOxdhJIijfLW/65gHkWU5Aaic8gBKNJyU9SmLqG7zjaBPAx1KbOQx0
         n6wyQNQ6Ky2sBS6TvJbdHKjMF7hx81tCTv9PdKx8RV4O4K2pf1ymyuZ5ci+JwA5un4xN
         GLc7ySfbr/7Hxg6q0rN2i6f0tZbc94JQ7V7WpsAdedN7wNW/xRB1SiToeEX1gzSVm91O
         uqTDL13IwS1sM2MSKtVsLTlEP4x1jxUFgtfobGzmtAjlGeq7I1IxqE+ty1/LhVcFg2U5
         /8X/NdoZLLEWIcd9P5G/bWheH5NOYOPxKf7WsmHkfmH6rD3H0SbivrzFI9DM2isviU7o
         R8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXrRILvcW8S8P/4OGrkUfgAelgaw0wNb3VYYN5lD0ej0dkh7PY/XLbkQbP16U0GLmtEfnfx0db5v8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0NiT6cU4e61DRoU6pE18+y82D0EJAqXcfb9IOd4nGW/+2ubHQ
	juQZmDrNUd++GXrtCh5rDwlsCLa+nXCq/fZdy9/ddYhZ5auI1To4YFFW
X-Gm-Gg: ATEYQzwiD5CdPg2ZEvp+2OtEG5xAACKpZA3U7qjpT8nAfI3mtpIpVhL+nM1VqgHXdiN
	uVvW2UV+jbs+7YbY5htnQ0bQf/KZb8jkMB+RsR6hvbAzcQ+ffPSh0XID8D0EV/mIlkS+KSWO9nU
	0FV1Yt5QzXan/fABHhTVoa+Yhp3laFWVvumG/LOTvkCRpps2uMOcc23oWESV2WQbfzfYHI958kM
	8WGdQJRt5H4IC7fdTwjiX1qzFOR70ZaiyMPhRoa71D1Pldh0AYTgTUjcSuEVprGYoflktinDlm/
	C0Gu8M2LvPDGPKTRcvAV3bL6WA3RxyqHfa5QjKbJHqnAtRDoYncHtVDoj60jGaB15fYlAS4oCYA
	1uNfJas+3JrFKdtmMEJwyxMQaqvEmgt3W+agGX7Epe0UofUh9CDb3CwfITCAPlBS0tmCEDUDhiO
	PcwMP2v5lr6kd82uI4bI6E2gBOHaPQWbzGstaZ0OlgXESx3MbNVZVUG6npLtJNlv5AfnzMYMvt3
	kk7ouVMWwGsu2jHld1+oQ8K1wkN6w==
X-Received: by 2002:a5d:64c3:0:b0:439:ba75:7db0 with SMTP id ffacd0b85a97d-43a04d71539mr17190692f8f.1.1773594331837;
        Sun, 15 Mar 2026 10:05:31 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm34331721f8f.12.2026.03.15.10.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:05:31 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 0/3] docs: assorted documentation fixes
Date: Sun, 15 Mar 2026 18:05:18 +0100
Message-ID: <20260315170521.63794-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three independent doc fixes: a stale file path in the kernel-doc guide,
misleading wording in sched-stats, and minor grammar issues in the
development process guide.

Changes in v2:
- Fix Assisted-by tag format per Documentation/process/coding-assistants.rst
  (Randy Dunlap)

Kit Dallege (3):
  docs: kernel-doc: fix stale intel_audio.c path in examples
  docs: sched-stats: fix misleading 'per-process' wording
  docs: process: fix grammatical errors in 2.Process.rst

 Documentation/doc-guide/kernel-doc.rst                 |  4 ++--
 Documentation/process/2.Process.rst                    | 10 +++++-----
 Documentation/scheduler/sched-stats.rst                |  4 ++--
 .../translations/it_IT/doc-guide/kernel-doc.rst        |  4 ++--
 .../translations/zh_CN/doc-guide/kernel-doc.rst        |  4 ++--
 5 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.53.0

