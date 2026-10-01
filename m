Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEEF490C11
	for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2026 19:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884740; cv=none; b=ZuGTeE1mI1mgIS6tzQ342V/09dz2kD8VzJObPCd/bao7T4tYuxrTBEm+B2/WgYsqnYzktOPbXOJa3olN/mHSFc6mM5rha1YpRSaBfPbdTThrEmw70aNuZkGwxsoNir5YdNCvVtaTLgA3APEiamyD7WrPEXpH0TO0PXj62KkWDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884740; c=relaxed/simple;
	bh=S6qMh34KvLbIjfGfRDQ/vaEK1EGhvlMVKSGZLXlQONs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSRIzP1LyTXCXw86jI4htpV4jL1kTaKPzix9DHH5+PlfgJspbnuAc3kyktWebvBNiph0kHRR46oAOK89WrLSx/Kl+0RSLkUTtLgA8AoSoHW6P3K/GhsQhduTc51b/0KgQVwgA8MSpVO5MMb2FZSboIkeL6tub6g9LpcGEQltwLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKvSOoxw; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKvSOoxw"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so52680075e9.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 12:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884735; x=1791489535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1937oKfIRQVCPoNo84DTw0NidOzq8BgSFZcKFKTUzSM=;
        b=iKvSOoxwhJzdPbnheneehnMScjWTgrS7azEtcoIqarfb5SgcDfs7e705ZdwYF4FD3Z
         aeTOo0zre6ySTnkuAV7thJqxJ6rCMU0t4AodS/1r12XkDiofxDWmLVpKDumCuFf5K7vG
         rbXI021QiUUCl8J+5twDgDBkDclH7AwWHHDf7Jb6axOuLfES2tSwDPzELAhYG/e1yCiB
         sEseKVz5pD1moH+r6C/ol7YMrzopgzcjEHy/I2Ec+ojTmY+mCKtOZiHisgnbZyy5393i
         SxsTm6J7Kc9XbEMAbcGzN8N1adSQIPflztOOXgTSTh3UtXEG5OrZOxRNI/drr+QqReCQ
         iPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884735; x=1791489535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1937oKfIRQVCPoNo84DTw0NidOzq8BgSFZcKFKTUzSM=;
        b=XKqfPGFhuRYOHQ5htKFZPsIFUPaJfhvQ7+UVG6Pcq4W72m3Z7zhyVK3lnkD8H+DFz4
         ash6t2OyNqJnioToWl2yoevo+pe/OBRMIntYJEqvYfrgPpMYHFhqo7CDocqXNevjz0kg
         aqBtsbg3Jkv2Kydjlmi+ZBwxAITBRKQuUEhgxGkEUKZTnmApnyc4M2yJR90Lw9tnbr4q
         VOpYfqIyhj6eeb+mnFh7XwsIMmgSLfj4x+YzxDoLMjdDHPRjKvsb/RYcIye+iGUOf023
         aXvhqv+ffGXtVdMrY1WugA0/fjyxoCy+11mb3bdDzFtslO0uF4UeKIfX2Ugkg5TINTOs
         6okQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGuRFe4aSE0GBRVO12zyVcIaWX5D6BoUtzEUI4cTQbiGVItqLWuGK6qLoeJ2kuQS9N9ux4QUS13rE=@vger.kernel.org
X-Gm-Message-State: AFuF++kPVc9PLuMJX2YzdQ7i22dfhFGvU22mK3A3X8ES/mYOVZ4ZumaJ
	sL7fdMG5EicTcTw8k1bVhUX5RdAE0ZJxbmg8B0mkzTYD4qldEACZPSqS
X-Gm-Gg: AYBFou1rxjo8N+JdCg5B48P3YkrVvELyWvP+jMt/tWoMVY5Aa5l/B3/ti6CmCvgz9F3
	9DqsKnqjO+wbIbGN75PtiP8GPgap+FeumxtxpnenRNX07tpPlfmJmqfkISroM/31h0ba07uM/d/
	j5GdARFp0FpTYB4hCobL+QzLReL9y39LgEQrr8zj8Wr1lzjKwDVITIljav7ILEUQx40Ye46S1/9
	GLFKbkclKv3qcKKb9R7tnWvak7U/CpMC7joH7RlDwXelOUlX4I0Fqa29NsCDzqBDYVlIHXa0kPs
	0bwVsYGUSW4VxAVYaIm+P/5CZdT7KPnzBln52J8AUU0ke0OEoE/40GlQ+2x33PS8mMba55oS/xA
	/PGBaYUTNVW3O6R+L9R2+4vh6kTCRm7AD7zymjPZcsovxseRs31D/VHSAUpBJuBVl61CLpK/eeH
	CrIrp4foch0d7PrSSf1FfiQHhbfCzg44FQOwIOD66x7Q9BPF+wCHYAFRaBu+7ifyiE+w9aSnZWR
	a7iwlb0AmMW6wMzn4K3z/Ggxw==
X-Received: by 2002:a05:600c:46ca:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-4a027590091mr11675715e9.6.1790884734605;
        Thu, 01 Oct 2026 12:58:54 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:54 -0700 (PDT)
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
Subject: [PATCH RFC v4 02/13] efi: bgrt: export the BGRT table and image size
Date: Thu,  1 Oct 2026 21:58:36 +0200
Message-Id: <20261001195847.141192-3-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001195847.141192-1-maximpedraza@gmail.com>
References: <20261001195847.141192-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DRM splash client reads the boot graphics the firmware left behind
through bgrt_tab and bgrt_image_size. Built as part of drm_client_lib,
which can be a module, it then fails to link:

  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_tab' undefined!
  ERROR: modpost: drivers/gpu/drm/clients/drm_client_lib.ko: symbol 'bgrt_image_size' undefined!

Export both. They are filled in once, early in boot, and only read
after that.

Reported-by: Mario Limonciello <mario.limonciello@amd.com>
Closes: https://lore.kernel.org/dri-devel/5d7067de-97b7-4232-9cf6-e4b978696482@amd.com/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/firmware/efi/efi-bgrt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/efi-bgrt.c b/drivers/firmware/efi/efi-bgrt.c
index 1da451582812..746a8fb3a337 100644
--- a/drivers/firmware/efi/efi-bgrt.c
+++ b/drivers/firmware/efi/efi-bgrt.c
@@ -17,7 +17,10 @@
 #include <linux/efi-bgrt.h>
 
 struct acpi_table_bgrt bgrt_tab;
+EXPORT_SYMBOL_GPL(bgrt_tab);
+
 size_t bgrt_image_size;
+EXPORT_SYMBOL_GPL(bgrt_image_size);
 
 struct bmp_header {
 	u16 id;
-- 
2.39.5

