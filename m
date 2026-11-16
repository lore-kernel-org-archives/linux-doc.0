Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784926;
	b=Cc3GAARKzKs0KdZtyZ2R6HC1gELdCFOdJ7KcbH/77i99Ju61bPyzsSsAJefrD0VByzep
	 oVyEp/onQnTyNhL25KCzKXnS3WXHicNDBRu0RZoxmVwGEicYFx5aW98Sam83pB6VC3yoA
	 XLJzWPYtbiCjsrRwAjzjMCt0ANf1w2u4M+fKXr9gMipPcGs4Ij3zDpUJl2rDIIpK1xV35
	 Wfd0jQn4BKUn6g7y8SPX/adqKFJ3m1CHe5TJixn7NrXwoFGY0E5EIYF+AeBrBl6+Uw3ry
	 3gILcvJFN1crkr4lMWIWC93GaSsviBXdcp2ik+WEdasX96X6l3y9JYXLuQkvxkoQDdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
	b=Z6YIxSCCPt3cFpQ4RiBAT5e9sHWH8tqkka3ofOC40DBo76BqcemRHMP6XTLPbNNt8+CP
	 nS10nj14TMuuDOJSSnnPMgk/GaR5rV2ltyvZlw0Otn23DLUwbTQ1Cts3I4MpLIPsXrtbq
	 D6XUxzA9sdL1g/FuE44wZEoUTRS5lI5peJNQvYXEkwq5fL3cKChKRgW5ELUE0A4hHNBx9
	 a63XRAsMR+21+ZLh4LZpJOR4fKkDDC9CyWp3Wh9Qyi6mILAIylsa0/3UuhBf0t9JeBvmZ
	 E6v6Xu1M1cALVcEQ4+C/QhewJ/Xg7k8mA2OBCPMPteb/iaKYdxaR6CDDrgCcd1MSZkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbX8W3B;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40ED606A339
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E40ED606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbX8W3B
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so36361435e9.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 15:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784924; x=1795389724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
        b=ASbX8W3ByAyt5NTODXjPhDEF/llLXL3T+KSc4VFkXSFgOapFIsx89vR4EdHZKzpZ0d
         9OM0B6CkzCWrddXddFfz01PXzxCoLgXIaBSau/cqNSaG/CksiioPlexZ00OVV9do2ufn
         16+eH+ODzHnZBHfhjCxkG7ZJOv2pbKYZ1BXXuP2CqJh+nz+aI2HpkBudQNFKQX1ILj0g
         S78ThpG5NCzY5IsLhI7Mlr+GrpbtjobJHvFRpPTSwjND4M78iyD+2cqOZBLJGEhz23sr
         oZwZWmS23kYNaRtQX44IMSquUhVG6e15QCQOy4AfKBDm+rsn0onfwkmRoyd26KDKjpwt
         a2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784924; x=1795389724;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2M6HoHkTeVcJIWfMAzqJ94aeV/R3TSw3Z3JZl8kxSXI=;
        b=0oZ9IOgpEFllXDsNYdMNllCiEUADPc1g/EMqr3r6BjpZiAZt3EssktLA+2omu11eL2
         3fSXwJMt8WAmkJ98e4X3RZ1WtHZrU8xwhUJ7Ukj0uaqyUGkhgX3UiK11C+LduJItcUX/
         5w6WGJgmYB4PqQUxSgK9EXJZDJ3l3Euf5kGF/UT+Zmbunxdp7oQf3dEfsu3n2U/G2veY
         OTvP5OyTKWhyV6I6G3zfJ36liXSxSQKLWyYSXZYp8XaEEGViLqC2QMiDHbdcFwZXN2DC
         VpNx3F9D/X87FUDU/HiAwxEDdB13karNOHiQQhluxlERlesfjhkLKNlLYIBH/ghQhXcC
         SehA==
X-Forwarded-Encrypted: i=1; AL+hErG/6kSGebYsaT7ILT8aj3yeV92oG9D+Tfw+vDEyrMQeMT2AYBg11yAboul1XB27441/oj1+JzlHbIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sbDSF0P3ozqtzduhRgcwgIzd0lYNxyCWhQhJ5HUGOIPgrKhtw
	6EIV0UVK5a6LY5Sgcjos638Dy89Ykpc14b1xuQOxctfK6fq2sGuQL4r1
X-Gm-Gg: AYBFou0rXfboRfhwoC4TiQd77nA6/8psKqbTb1bc3LfhoLzokLYILMlN03HDh3gKG0L
	lIf8vLjdjxkBvWRO6/wZgHrX3Ye9wswnaxq56CQXfsy/eemvV2RdxXnw1ltTbgWAxh2NwxiGuQO
	rnjph/JfxQ0vWiHp9VXm+UFYI87DGTe78hUV5af8BPALL4LQHdtFRaYnRKuH1mbihvuI5+TWN9G
	N0OMgGV87Xsytluffin+frjPbeCwiAnKpm9SvLkmN0Olv9cUj5dbBIdFPR8CNLKNnGzAHWuO7Jg
	A20hjOTuE2RLqdNXEjspoGgKi8DureNf0EFoBsm+luJOM1ySWOSHsg3j8ridgWKccQLK1SGbCFA
	gTm5W2gyfArQM/zJdEa6kATc+Twho88elWx4RsMoTgcmsAM1BBRSyiuJHZ/jC8Vlyt306YRVSVV
	KCmZRt2yjz2F5+/oM8q/+aQ281oKwWfMAIxvA0FJ365OXs19jv8TaQG6quN3UgaVN8MTD+hmokh
	Z0motNyQ+0fkosJawZiAaTY29yI4Lis+paCeIRbGN2KKsnpCuDXsnDU7OxnToG1NTc4sbVhuWsz
	QHTH1A3comZ0psJpGnaxxNulOIM6RpgYNhLa7bofCZY5ZUYcPVNIrHc=
X-Received: by 2002:a05:600c:482:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb55a59c9dmr137490185e9.22.1794784924398;
        Sun, 15 Nov 2026 15:22:04 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:04 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Mon, 16 Nov 2026 01:21:51 +0100
Message-Id: <20261116002156.1027726-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116002156.1027726-1-maximpedraza@gmail.com>
References: <20261116002156.1027726-1-maximpedraza@gmail.com>
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

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

