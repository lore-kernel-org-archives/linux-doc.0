Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109240;
	b=aztwEv92LFJQBqdhh3lpBwuypidD4VG8wgCOYXO/fDE4Hy06yBeVCydBZIuTPvBglVc8
	 wyp+Jp1XdvkVcJg5vfTrfHSWykH314nBTycbU1Gfuary57SRY97TOjMTDjOntyN3g1QLP
	 /zAr3z/wX0K5MCByOZMq46xeCWWVUizvEkI7/kWseQUv493uOArctliZo397/l7I/uShd
	 u0NnOrvtV1KiRAZ7J47eGmp+joM74dFhR1U3DaxihGgM9NMf+97UbpAU8/dArTbZWIKIf
	 sqB2cguv/Zlb/w8quRzlW4fvHX+q2asQ59gjHj7puBLGXq9Dx9Ii519ytmtHzezQT7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
	b=OqQbVAO/XlbrBHgGup2PFpIPRB6iAk2Mr82U5e/RN1oB19evLtcPpkN5sSZByAr5vEmL
	 U2VDkuMgWxdoDq2O2vJvExC2s1SD7ka5TyYoS+6I5nMJOxHDxozsun9tj191qm8mqoWH9
	 hUSyxvfELJB6zQbrNu1+2OeVPRAyMSQvU6gldqqNhvp+y+SiI5NrE0wGtFB04ys1wua94
	 q2aBode8mJhNpx88vQGSbXIbehylSY3sC3JrzE9ZYCzvikFvt3MIIRuKs+FbBhIrw8KUA
	 W3pELPo25A64QuVNiVMoufuRTPk4SQ7rLRoZpaEGWJs7ZH+HlVq64y2R9F91fXD5A7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBF0TdNK;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C82606A33C
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C82606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBF0TdNK
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso32746195e9.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109238; x=1793714038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=EBF0TdNKiZev92JTXZUKMNM+bikjTpnl6F+xtg1lO25YQMK6ahE6FtSlVFxjBHIfIJ
         2tDrWqG50yvBgr1XKRETOm6kWMHgVeuJM7lBibOyLXXDYgMKX1OPJwSjhZhLALr5KYEc
         Q1SCgLNw6BDYwmvXk5af0SJUgK8tAcDbAMVyUsW6eeK4lI9ZJ/zeaLnLSL3QXyaOHP9c
         3LAIk0jo9oQzD/MXMTG9cVzn0VCwjdkQ/RQrhNaRSRhrf7RTxJJ4NNApmMPopv82MM0Q
         ZP99MlLYSNoqXjI22Xh68F20Jf0avL8oolZjogdrqlkKurBxko1tjvuPerYh9ooefJAS
         w38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109238; x=1793714038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FMp4bmsFYk3mzSCH1/ElOs2cwgfyNFSJhXfclhOUCc=;
        b=Mz07/VR6ROxi2Fg0HdadXglA8Ujs7hgUcoi5Wo7AJTpGdy/W7JHhgv2y1WVokLqhLR
         tlXqI4PoSQMtOvsqO1/yyeX16G+5u45IJOkFRjlVV2zx2yzoVkR9KHzmF1FLavvngDMp
         nxVRZoH8sFh1AHZo/Hq0/rmU3pyj8MqFAkJEiMXQ/dVu92bthzr2ihEgIoDPNrqI8ZJF
         qvejLUSsajPglltM/FzW83GmNkfjeDkjvJdx0us7/d8f5S7hk/Zux+K1S+z63YlN2beZ
         bB0N2spVtbBop4CeQK09QWZUYIVEJdLNADciGhS/zoiMz1nmK8oz1pSPV1S4FExDnlHh
         ojDg==
X-Forwarded-Encrypted: i=1; AKwUvBzFVfyC2XbpuNdLZ3gAQ9JhlXnF/UvdTdF1UQQojvKjrADQhLxtyQFQD0iJLg7H87JpwiAnEJVxfdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA5UQCL13R6oIyUe1HwtDNj6aPol9ooa1trhVxLOpXWuMzENCW
	AUZJuxroR/NhtOZFHJEQC0lHP6F7nFAlqWMl3k9Awbi4Q52EoL6JKenx
X-Gm-Gg: AYBFou2hSsbpovfLUFfnndoxIdnrQO9u7WMrJizR1FUUPm1g34tJYhgrFQnh6K9398Q
	7YfhZoQPp+aEoNQAm2S34SUXuASXsgvzvKjRE2aZvDOil/9ob+JAheWB24MNmWq3WAI12r/hu2g
	4Ub5RElA5Xz9MDqEqvwOOLWVma/E416zew5wvr3cwE1bwyfbBD3yQxnqS6JRIxDaOC6fBoleeXW
	uBe6crALvI0AozVsP45XP3l2xmoO/+k9U1guNNNj0d3CmKszbpAD8vKiNtZ9KSdgS3dKKVAnN3H
	dO9cAApIh4flWiYT2V32QPhxpY05kByXpyjI/RY9BHkitNm3dTk2XFZrSwJx34LzhWh6rzCG3zV
	1Asy5Stu5u1pEo3vcl70KuixJAJTFR+6qaMLoalW/FwKBun9ezeE1jEreZ8xqKsNjr12pqhHZ0x
	mAlhkkkvNYike4pZI1kzp63CboVZojdvOuyHbp1VYcY4BRRLjihTNofTaWwkbtMGHNDxYyGivSn
	K5HIxDvsSjYOc/ssLZi9i7aRdxFlT8XjOjrqy1AO06qc7f8q/G1qsP04tdTHZhMcK52VpYmCCaM
	+JKhk10=
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr188823805e9.8.1793109237982;
        Tue, 27 Oct 2026 06:53:57 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:57 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
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
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/15] MAINTAINERS: add entry for DRM splash client
Date: Tue, 27 Oct 2026 14:53:32 +0100
Message-Id: <20261027135342.2003632-6-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francesco Valla <francesco@valla.it>

Add myself as maintainer for the DRM splash client.

Signed-off-by: Francesco Valla <francesco@valla.it>
[Màxim: add myself as co-maintainer]
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..321ecb9f5b5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9168,6 +9168,14 @@ F:	Documentation/gpu/drm-ras.rst
 F:	drivers/gpu/drm/drm_ras*
 F:	include/drm/drm_ras*
 
+DRM SPLASH
+M:	Francesco Valla <francesco@valla.it>
+M:	Màxim Pedraza Padilla <maximpedraza@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/clients/drm_splash.c
+
 DRM TTM SUBSYSTEM
 M:	Natalie Vock <nat@pixelcluster.dev>
 M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
-- 
2.39.5

