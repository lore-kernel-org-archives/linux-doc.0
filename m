Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D047F390999
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117057; cv=none; b=A7xmX7q6JXn4s189UXsci00mBO5hfHUAPfdMYwSg5eWGPxpGW9/HDUvUMWEmgLVHVJhwMjUTOclplYlxfmCMb5xVIaMz9mLns5z8P/VUQ/3NY358hpNBNufdSwdE3BB5g5mQSSJRZy3aF7CovQUpv1TVh9iuPTjiqXi68ZUcfeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117057; c=relaxed/simple;
	bh=LvJ0Q2kkj/DeAyfiDOPZ8HPXq2hWb/mg+ljAJ2hfyBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pPINb9437lA/zywu+NXWTiEq71rhJOjCu/cZEI8Fi93EvTfKM7r1JkP6BQIK0YZmu35qFCOKlHsRINE+QolWsif0pggc0aUHbE3RTBVRa18ZgFkEIA1c2rZeSo8v2hNa0cbEXnmrWccqZRc3GkwXQRn5K79FC2xoUcCnTqmP0jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLWMatNQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLWMatNQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49249072f03so8970985e9.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117052; x=1782721852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQOCUaRpEixwkQO/jMCRS1iA3oZk4GEUUJDXJCaOQNE=;
        b=LLWMatNQVGpNnfFndOivciD4YQoF+3tfhOHm+27AO0Q5xE2iTDC/JBPU12XqSj3dw8
         JcJrB6GmKoMPiIVm7Sz1Cd56g/h9T64v7+yFoyXDOOhG7h32WQhIDdbGAF6pHS44cUxH
         bK7QWXxYwkIqcVAR8UmptWWrczViDXoKYF0MCTu9VnK8TxvigqkWpiwchhw8US9FFrDJ
         OiFmVS/um7swr8npM5iXE8LjJ/MsBjGaQmjZGClbnXlyTfPUX191s//ss/wb38QWoRvr
         K3L0A0L7JsMcq+/pth4/vj+I1c9MmBY+dRQZU7bZUjPNTJJ9ArfIhvMYxwk3fB3DCvYq
         Ybkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117052; x=1782721852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQOCUaRpEixwkQO/jMCRS1iA3oZk4GEUUJDXJCaOQNE=;
        b=l/pbCcRZOrzv5wU4Pbne1t1gYsuaR0A89alPeGf4Ew1Afkhlkb8ihVp8AxZWE+J4sO
         euSQEcAjSIdk7tRzwtlEuggq8Qj3MZVH3qAbFBD3DGUyn1QlWLJjx9uIkpKEZvUjaa9z
         G/hSDXrVx8EKqNeola066VAJJKTNAa4JxuL/sxxjC5Dq3OYSZ1fZTgymAGPRwwQ9UFV+
         2/BfBj4nDFFC3ha1obcTat62axnNxMG23QQlsieDE4PKcUV/ibMY7cLOZGwaubRxD2D9
         vOVxQD5juQ3UJiSDWSCCQrUJvWefW/xSQiUwNej721uZ4RDpwfKbEB70XJe7n7aIs91g
         zQ1w==
X-Forwarded-Encrypted: i=1; AFNElJ/7jYjcwK6IAr5SR/aMS7gjAhtOEHjpN7WyCaCqqZmMf2cZjzVjsfG+ph/s2cQ6roIRW/JvCA06ZPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVmI4jcKvA5SXEG47kOF7aXpJcgrN8D9ZvzihNqarv+M/sUvqV
	0HtuUR/evasHsc2y1pQLFUjfiHs26MHx5l+2v03FZL3VYA/dt7596ZYi
X-Gm-Gg: AfdE7cm+YSI6lEMoGyD5uq0WICuWoZHdVTXT4T77XrguD6gDX+vYJYQRjmJWEgA7zVB
	NV1a7Ccw4VWBWkF/W7Zw2bAhQRp/Su+yfXXMbnd1Kf3rzjEZzdtMGXWLSVg7cJgzCsb5MVFSHnE
	KuMQK9F6f7jYBObCn8UL0S6uUkmnavwXhSmOx5cVjQHSOOile0khcI4tussr3Kt6hrodgfSiTsW
	mHKOQDZZJcRRJadqPIHuCDZ0j5Ao7qedzDsm+6licIgxWx/Y8wgENnu2En5iz4YWAHjNLsBh1pZ
	No2lBuLtqGHiVtdqe5lG9yDhAkQssBqXlmfR9CMxVkjT9scVKbHvN18lMznMIC1Xdo+Ksp/cg4I
	XcCtksB7LXcTnu8XXuQXUAayR6854NMMx/CnQuxy3jX3MwGs2fknS+PZ1NwLrUqQhsegxsevc9E
	Isx1qXf7fb/GWQcg5Zl+YEJe4=
X-Received: by 2002:a05:600c:468c:b0:492:3c7e:57aa with SMTP id 5b1f17b1804b1-4923eeb494emr220979255e9.0.1782117051481;
        Mon, 22 Jun 2026 01:30:51 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm200809105e9.11.2026.06.22.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:30:51 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v2 0/3] watchdog: npcm: Add reset status detection support
Date: Mon, 22 Jun 2026 11:30:43 +0300
Message-Id: <20260622083046.3189603-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series documents and implements reset indication reporting for the=0D
NPCM watchdog driver on NPCM7xx and NPCM8xx systems, and documents the=0D
optional GCR syscon property used by that support.=0D
=0D
Patch 1 updates the watchdog binding to allow the optional=0D
``nuvoton,sysgcr`` property used for reset-cause reporting.=0D
Patch 2 adds watchdog documentation that describes the bootstatus=0D
mapping.=0D
Patch 3 reads the SoC reset indication bits and maps them into the=0D
existing watchdog bootstatus flags for NPCM750 and NPCM845, while=0D
leaving WPCM450 unchanged.=0D
=0D
Addressed comments from:=0D
- Krzysztof Kozlowski: https://patchwork.ozlabs.org/project/openbmc/patch/2=
0260210133843.1078463-2-tmaimon77@gmail.com/=0D
- Guenter Roeck: https://patchwork.ozlabs.org/project/openbmc/patch/2026021=
0133843.1078463-3-tmaimon77@gmail.com/=0D
=0D
Changes since version 1:=0D
- Modify reset detection handle in the watchodg.=0D
- reword patch 1 to use the GCR syscon-property wording from the=0D
  applied NPCM reset binding update and drop the optional property from=0D
  the binding example.=0D
- reword the patch subjects and commit message bodies to match current=0D
  kernel dt-bindings, docs, and watchdog style.

Tomer Maimon (3):
  dt-bindings: watchdog: npcm: add GCR syscon property
  docs: watchdog: npcm: Add reset status description
  watchdog: npcm: add bootstatus support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |   6 +
 Documentation/watchdog/index.rst              |   1 +
 Documentation/watchdog/npcm_wdt.rst           |  70 +++++++
 drivers/watchdog/npcm_wdt.c                   | 197 +++++++++++++++++-
 4 files changed, 272 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

--=20
2.34.1

