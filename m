Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109229;
	b=Ompqw0pxZLqBrUWa3dEx+Ubv0CWWhC/sP6i7PA025BaWNOjz0ohqATSfHHWKz+O/UnaO
	 jC7e+rCtSA64ZLCpKmxjjX2nGsGumCkHkX9PrdVlw4zg+qu8GTcDptfb4aU7+CKOhUKc5
	 pMo06YwBCgabzlQuXkPYWMs2/VUc+AbQ13KD01D6C7b7Xl3sTkeHNe3u0+IUG8ubI4iZU
	 iIO3Gthm6IlRqXW/VKMpWtZSoUnpSlRMBUnXJUgXoavkaaINeMVCnft7k48N1gsp9UbMl
	 QVHJ+8iSWGPC9Xx3OKKSiRc7KvrjPDLVUczlrYuPYKEf576nBZ5FryZPSXvxUsfY9+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
	b=Cw7Qwwdh8WhMW1N/nlAixuMewgBnsj0xW2MeSt/DblTpdHV1x2nE36sdd5q3r0UxvAlb
	 p5I3s90A8otKQ92qRWKtcoIdmjwICat7TMbn/FZ29gD2mLjvciwQ26aNM6Ku5ayGBaxCh
	 Yp5YAQzGhJE7iom51zs2TzaPK1Kbtpr7sYFPwGmyk3oL/XQPBw624COqtOcA1ihu9S4i0
	 yT1EBnreJuKCOfoeFItyUAeAwm77grIGDzOwdoOjrK/1lTbU44qlHxsLX6XgIWkBQk5aw
	 kwgYvV+9eIxrqU35eFQEA5SLwclOG7xqmO1S5VxNd5baRGwCq8uCnHAF2+TFg3ln7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9EdSbtg;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC1A606A332
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC1A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9EdSbtg
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2546156f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109227; x=1793714027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
        b=J9EdSbtgiLFlXq27G6BCfiLyCUmgTmamz/0X4sPuWGR7PI4baQHTwUqiGYuOjNv+Zw
         1+lFWIFT+YbazTtQ73hJYOUYzJ3Z4g1NZE2eOsEyEZytb/i4LPOqbzR0IbSPSNEytzDz
         1hHhw/E32QerKbf6y9ivfV/PqizTxvtDena7LjediVrmbjhB5EjOWBkPv/tNqmWrG319
         Ql3I/u4j6qJosxpMmd/ho6YxJ26kxYdNzdxIqPRZcfKDqva/aEjEcEyumDsrF2yfWlTf
         74MjiDyd35Jl7TGIWolX3bWIaH1dYsBJ625xdzWOV1luCLOkhS12QU6RQOgcVXRjuHtC
         2PGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109227; x=1793714027;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ggIeAF8ymqQPticOc6wmD/qoAjkwXyVLKkCNBrapmc=;
        b=Zv2/tNVyUzfdy0TuQ5aDG6jLcF/0MUdnhK9LX65J6DphQ2gRr0Rw5H/CIQi0Pmqn9E
         YIRcdDKY2dKAxMfVKGjVBew0tu2SIVNXBfMkXrmYYIubQYTLLOH8EUAqfVnRoxBvWqmd
         oWisi3GiMmgV65NdO42qrdEYdmqYDOEKnRM1HIAqnbNwoLH6vefV6T1AUgQrVh6BQFXq
         T5F9Rax2/f46r0iWb8oCbERF/2crBteQXDjLIXbUk/C1yZaE63hQC/+3uo8saPq4NBnF
         frh60j4v1F/bPaWh8AWewT8Knx1GaNxi6/+EoE2HS4KP1lktBw87Dxl8vhxQ3VdEYW0u
         ORtg==
X-Forwarded-Encrypted: i=1; AKwUvBy7CwUivWix1lqJ31MGb92uPd/5oHtPgisSceq/oSsMgo/F3eMjUnjKMktY1RFq0yqMcMd7QRS8VXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWGydxs5oRlxe3X2sGDfDjDBA03I0498dYN0+v+LembOZjWyY8
	B92+/XBo83oI7fqwXEBgiRW4wknI0URXEiWoazN77gEqny7sfBJhPSYN
X-Gm-Gg: AYBFou28tV30+o6zQpcabJ4AamIisNjs2yYjxECWKLREOO/uhpD9bJf2SMSea2nRtpA
	YfxKOJz6wZV4J7fEVSfmoJjq2y9JlyoCy0AzaCBB0hyOocRlO9rIzuodaEXJq6DU/0uXlIhTseJ
	AILQ+kxDaUU0MKLOUfTGNJHkLdvY7eGyyDODeiVl0XSmNjLuoIkGmgYF/tfE9DShFRU4xkVckcO
	HbVkLvlDcr6+xP/2UMT566q+Udnpsl4DWgNu+PFEhVUDGtNeuJHtHgiYhZ2vKdRH7CObVUDqRcV
	WOjgy+WQatvyyRSGYtyG2FItTkeMfgeTSWK/THqLlDfXU693jrKtkFKnKIBmeUUI4afWKOTF8gm
	qYyv1lIAy0C4E+0Hp7VFC97N4rioBQz0u2AMy9IuU7s5lAJECCcD8lz5cFjZZ5fFMWEiR9DUAiM
	aCj9w6cZXlpi4OHCAA6bdr+dHiS8SCiw/LQv8hE9xxzYC3puEmogNtaSljtND01WCwsjj1R84Cv
	Y0Ed2I6igH+6/SGxx8hTabIJzebn5kbOh8XibUPinMXmAV0XtlmpuzFo3WWKWMZ3yKfoYW+S0cs
	hBHX24UPGa0ZX0ajNASa3yQmdfzG
X-Received: by 2002:a05:6000:43d4:10b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48e3eba1660mr15009254f8f.49.1793109227175;
        Tue, 27 Oct 2026 06:53:47 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:46 -0700 (PDT)
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
Subject: [PATCH v6 01/15] drm/clients: Kconfig: indent DRM_CLIENT_DEFAULT with tabs
Date: Tue, 27 Oct 2026 14:53:28 +0100
Message-Id: <20261027135342.2003632-2-maximpedraza@gmail.com>
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

The body of DRM_CLIENT_DEFAULT is indented with spaces, unlike every
other entry in the file. Use tabs, so that the next client added to the
list does not have to pick one or the other.

No functional change.

Assisted-by: Claude:claude-opus-5-5
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

