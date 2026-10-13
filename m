Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE0A3E024B
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883974; cv=none; b=ROTpqMCGnD+P1e7CvejVtDD6DutSr+CmWjJnSGeobEMHzi95pZD38UU54zGBbf+k3liA73JR43L8s55FGMZOvk7fqjsuRxsQs/564Jk4nSxZ2v6iXvni3mQdyr2zuEtj08Jc8u95rGS8WsDpzAD6oqqde6gGyijdZjmVDT1CKdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883974; c=relaxed/simple;
	bh=lsZA0e/b5sbxRypRHbpgPYpst0BDN0tACu0nxjitEDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SdJMxF8OLBNBWdTrWcdlLL+599vmGU6kjOdgDwzj1a2UWuxV2SoTWATte3rTPMyyZ2w3L7vJZ0H59mnDzdwjJq0wcLELZOEJh3hWqOcU5VQPA6qKhEiQ4Gg2GuNkUxnH2KsQoAl36KAz4h6bWuxHvjwv9TfLewULBL57wUYQi2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzbRdWR+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzbRdWR+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso2192695f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 02:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883970; x=1792488770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZQM6qPjUipP3twsEWuLikKTTxPNmXURRnws6p/YBzA=;
        b=lzbRdWR+kgCyq7H6lz+lEGB2xPc4crmyWvuTdiEr7wBvHFgb/AL+d/eN6k3318T9wo
         UK2wRCSfPICdpHrrKWtmtDJ7ABuFARP/fLQEzhNbc93yz/L3+kfG58DlK1rtadrmhMEJ
         ZSuAPTeAwoeEdNwLmrlsXjp1C8Ui3d/rID0lCOXFiCyMk7C7dUc1fSXf52TLp7hEZumW
         kr8HSxRyofZC7qW3MoKxvn1S68mKZSf0Uha6X5gLTKksKJwrhvBiY1ruKeCY6vhMcnsa
         3yK8VT5+mv8U+HTyCM8gTpf3j+GCLpW5LbzalyxgqZF0QcWN68yBdWA7eaRA/Dc+cK8D
         T2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883970; x=1792488770;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZQM6qPjUipP3twsEWuLikKTTxPNmXURRnws6p/YBzA=;
        b=qmy4aEY8ydBDqv37KLIvnAhcNrrAbF07IWPW6AdIkaZxx7C6YmSWAbqNJuOnDEIcZt
         VCYRokidhVh1OXiAC1jELVcspJUdlU8lO9fnJQ1srcLI4KiKO89DBsGNcWKfJ9YYXkYS
         67W7b51FWbKWjuDGClrQvvael3THXCVQhyJxWA2bwViRf15LDPV08hHEMplJEhiYJh1Y
         DhBr2F94hgBYaOtMELzGpsN5716Do1KWy9eCTvPxCV7fcpy98JSB/DMsQOJ3YRQN+MeW
         xlG2seZm5LTdMmGcQbSNjtBEMe7ZnL2RlflFBEnfFd1j/XmYcP2uWpQh9tGgMAdXwONQ
         zFCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5e3Zc3svogCClPDRGYwMS2lnj34KFOvh3yFtXq+hAlHxm+7OinV4wfOTctwZIBt+Ag7HwxrCQ088=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMtWxAenNa71H/wAMvpLzZk10bSSaAM11M5YTKjmr7DnuHb4s1
	fPWJOQMIlaNSRLUjVK6FHnt5ETGwPyad7Lpx2ZR1GcdAzmi5oKogN15D
X-Gm-Gg: AYBFou1xTN19mzD30zaHkezNYHjO3Vid3eNE4bANe4CAVtSszcwkrrOoEu2kC/4OcCL
	nL2HDUZnTFiwFwJXmg2M3ht4CDDAs1wF2J0j6hBrQcmTaAUjzuWqjLjT+XVhXXVvzP+PFmXyNRt
	65ve5o31jLbI8AjhkFZdzh8YeqQKeWtwThcGq+IStb1ppmAFWtJKNKJJcAy7kz5f87n9v9gBhXE
	aPeepF1cxSfOo71oiIBaPa7B8oUFwrrG58ZrjwoWuGGJffLVrt88BH21Jl97A98EiMldBhkUV+f
	h+mbnnmsdYSq7pGD6lK24R7S1+HZph6KvkOH0T2/7bEuOz7EM4JUwpxHQ0fs5uEFXxqG32eP2ge
	RTIwsZM3kMNuJL2A0MsVN2gUF68sx4kioA6US7V0bTtyHdCiu/YDaGVlZN2KNdUANjtzTYJdAlH
	2jbEghLHozbmUjLWDNs3S+CjRNC4NOQbEJJhCrUTJO0U5+Um05OXF1UPEgUac7hZjTltgxkesRq
	kVMEUg9zO8P86sPrYeMZMHp9PlsRIiss/Q=
X-Received: by 2002:adf:d002:0:b0:48a:f11a:c34a with SMTP id ffacd0b85a97d-48dbaaecf8fmr18349529f8f.52.1791883970450;
        Tue, 13 Oct 2026 02:32:50 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:32:50 -0700 (PDT)
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
Subject: [PATCH v5 01/13] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Tue, 13 Oct 2026 11:32:31 +0200
Message-Id: <20261013093243.505776-2-maximpedraza@gmail.com>
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

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 6096c623d9d5..8d8bc37ec9f2 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -114,10 +114,10 @@ config DRM_CLIENT_DEFAULT_LOG
 endchoice
 
 config DRM_CLIENT_DEFAULT
-       string
-       depends on DRM_CLIENT
-       default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
-       default "log" if DRM_CLIENT_DEFAULT_LOG
-       default ""
+	string
+	depends on DRM_CLIENT
+	default "fbdev" if DRM_CLIENT_DEFAULT_FBDEV
+	default "log" if DRM_CLIENT_DEFAULT_LOG
+	default ""
 
 endmenu
-- 
2.39.5

