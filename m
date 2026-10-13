Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825B43F58E7
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883984; cv=none; b=jzr81Mnvi/VhDNEwNZFUhnlg87nBMo3j5r1a/6clPiy3KCx+TUS9RoSgp69yVSelBJD74UU2DL+2zE8nTivBg5jRuNMpMDFWxgjcOJ9icjCFaZy6Jjfo4a0V6gGBwe9Xtnmu42ufcYTzqySeNbQ499MAvxCyvVmQ0cpFhieRr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883984; c=relaxed/simple;
	bh=ZcbqbnyKp/n0WpB7iv3NE32Z90PzMJn0VzjmrHwzo7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSqyWc37VNChsdTOesxKJoPTi8bGvJQBk9PQuVZ4Mvirj5QHdTpLpfInb0ozMBORQe4Yu/aGvcof3X2/2I9oWmH6Tg+SBsGk9GpOpoBa5jy8Q8Tt3o+Pqj6Dkrp7jVTT5plQ7NTRXg+zggof1A4fglipM7gQG43Dmx/BYeEzyl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO4IuQrp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO4IuQrp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2613453f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883981; x=1792488781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=YO4IuQrpAgMQ1QTHYH+FbmHY5hdO3sxVdQQVqHeFHVFwm9xWq9m8WyfZ4PqVGPUXfG
         vmrcKP2z5UV+OR1qnnld2DWRRX1/UEoG4aR0xoP7+3MIAvbWrqCxMR6WhGj6Nr2t5fry
         Z62b6rLKlgAG1muWc5OLvQcimskiQaOo0KFxQdDbFkx96r9q12IWDyL5DGO//A7aF4+g
         uREQ2SEwB8Sm45g7xOvsF+3nGva3w+Pgdw4sxJMD1NL67NhKAG0o41XCJO4wXWIRDoYp
         CbLDC9d7a0DStT5PbujUfMtIl6kbkuUn43/efTThkbV8MJ4+tbm4+jxE6NlRKLuY8r8H
         VwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883981; x=1792488781;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j79G9x93qm3T0R3P1TfLErsNrxHPzMPCo5TuV1Ni39U=;
        b=eIJ/wOwR8XXnrn5TS8PztXOLDyGnu5zJEp75BaIEirx/M1j9FoqqXxEOwJrJsIT94B
         9x5lzacFpHMR/pwnzmnnLs6l1qsNe0/bZSlqtfOo/gBSpDz7dSyp6IhwJ31HjVWGwhrJ
         C8t/k3kmhu2GEqhUT7bbMR2WYrXUgKUQxMp5l50E/sBb1nS5QgeXQ7PXj8S6YQCCTxMI
         gD61iGTdSvLW7CdhRCd1q9HHRS0k10WxD6Chj2fcRpewoS12CEPpcjUmKp3+BJUkD6mr
         SmuV5JSp7ExajHPE3zY5YSCeITRWlmrdnFG6YcIwPz4IZKLy4cHiqUZKCuh7FdsUO9kN
         n9Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwTkPaqFoLU5Fgpr1XaKKZFwxBBB5f1/1vgpFyRcpvVLwQ3ka6EKD6V7xjf7yv+jDXubqeYYTuNYmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKezBMcZKAl/eoNG+YL0Og8CDX+lQtexJz5GfqM7rPhjfM/KR4R
	viBcRyUAqerRE3yp6tVVIHj1ZPVWYkJR04tldumja7DDMJX6jvF0A26f
X-Gm-Gg: AYBFou3VOtKejN2rfnuuOAJdsbixw7OJYQMkg1ycYVeNkVCDZ3Lvm04Gi+ZEO70tFDO
	lXyH2aNuZKp2E8qmYXZq07xTm9XB1R3AiJr7nQIgDMTr06727qARffU2B6gbICjcK2Rz7ZcO1eU
	qar9hS6KacVkNXAQdhtM9UQdCzNaaciqLk8ibJ1csepzB8niMfkTpnZ0YGv41fuRSm170pM9x5D
	7B1br0pFOC7jj6hlO7XcnXrfZdjmwEI3Q97vNLczb4+6HiKTGx2Dy9fYELRXedBHO/Ad/5LmPkw
	5N72f/W/k8WSjc12I4qMDiLMRnRHj7Oj317+309QSOTyjTKzIjiXdwtL4T8ohjMqBYdwW/d0K1+
	ZnCAJArwDjGfFkZ2FbhKyJLc+M7khApsqbWLBoKamfaCHgzRAYmMy8nuzcLhDEmm9dSqifz19Se
	Ret67uelL/May+LC78URnO+AflpnNMr6+fNT6aTEYmeRBWfuqldt6Aas4l6rP+tmO6pwyI3ypgK
	p3mDhWFCgluxnZ20W5Ls9S5
X-Received: by 2002:adf:e712:0:b0:488:7927:9ca2 with SMTP id ffacd0b85a97d-48dbace0e05mr17961496f8f.49.1791883980607;
        Tue, 13 Oct 2026 02:33:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:33:00 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/13] drm: docs: remove bootsplash from TODO
Date: Tue, 13 Oct 2026 11:32:35 +0200
Message-Id: <20261013093243.505776-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013093243.505776-1-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francesco Valla <francesco@valla.it>

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index a437ae5c71f4..e77de5e2a24f 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -773,23 +773,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
-Bootsplash
-==========
-
-There is support in place now for writing internal DRM clients making it
-possible to pick up the bootsplash work that was rejected because it was written
-for fbdev.
-
-- [v6,8/8] drm/client: Hack: Add bootsplash example
-  https://patchwork.freedesktop.org/patch/306579/
-
-- [RFC PATCH v2 00/13] Kernel based bootsplash
-  https://lore.kernel.org/r/20171213194755.3409-1-mstaudt@suse.de
-
-Contact: Sam Ravnborg
-
-Level: Advanced
-
 Brightness handling on devices with multiple internal panels
 ============================================================
 
-- 
2.39.5

