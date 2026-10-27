Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109242;
	b=Q+4tOfmZ22mXtvM3WEsb6kKLbmTqRV71k4AMR1o6YM2k+AVCGP9fkw77RXr/yO2OTQEU
	 u1+UmqG0cMPCDP0RfvTH3AMpe9dNjUTBy1Ejivs1HBjnui2vje4PB46qjmV8npz+2jdYO
	 oObLSZPurpNtkCshkAg0u2E0F8dPpRk3Ta/RPmU1nvs7oKVaWkuEJ0ErV2POCVyShiC2r
	 Xy9355ldLabX9WAZv9ei3WagVbvLBWf5bSNCCnw1c+j1zjPTzWXHyyYgjdBebmf7rRwEv
	 HVzHQJPgiDYCYYFc27jlL9rjCS9oSOw07+0jL5lU8snLaC9TvEmwXWpEWBFV18jSkaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
	b=HWjliQ1k9yg8pwNS8oPH5r3AyO5Yd7w1pHL5AEWqopi5YQbh7Oxqmm2U6DOPipgAfl+A
	 j9dhLmLUE7+Jav+Ra53tycSYbkbeB10YQsSAa7sprtkXhnXjaJegsvaZgeFgy2hgesn6S
	 S9rj+69R5e4jqiGDclx9J7U/ryJe4Ya+iT7thS54u0maD6nfGf4HuNyNBHUn6+azDilB5
	 kLcEPc0j6PeHYEjZ7mNQOa+trzUlGJBfjkfbGvYLTb7NHJbkQX1RXcdcXKHliaTQQj0Y0
	 mKKSUJM6SoGr3+n6vQENBNtv/QMNe0f7Hyh+pG9GOMgpJhatmIB2+1ud7dZG7Q0AKng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oimiZnio;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EFF606A329
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3EFF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oimiZnio
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2666249f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109240; x=1793714040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
        b=oimiZnioitMUEnEBSrenFhRbAKwenXYmVyqgKmWsRYCXK/JKGbsa6e1hchO+K8E4AP
         aKqtDi+/aJJxJ/ZpulCQo0A0FFLFB/P4ruAZvVuMg/2UK5Qi5nmFDuEhOUZtyGtwcLe2
         Cy+j4nHDSbUeCVSFCVw+TcY43hi62SLj4fCqzF/nem7rtyWJ28BtO6lO/RiZua4Xss0f
         IIxPsaHdtd5IKWoq+iFATJQSwz14z2HjyaC167tn5z93TbWRuy2QukEXN6vuiDh6h7kH
         IjmyOEcbEQ6slNZxbs92lcTHtMkLRShklgeyiQ3bXndapKr3p3emUgxr1TirGAYeVUY0
         6x/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109240; x=1793714040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udMEtEpdximcj4tmN6XEoXZYcbf6JGtTIKRmg964qrM=;
        b=crmMg4XNCor2IaqV2FyS8dhipKXm4KwLcKK6QwJPW2pYLPjQSNpTwOPi/amx8itkFm
         ARnJJeBMpraFftWw15rQM2bqpSB7J1bmGl9enUZi5IV1/XlVmjN0Kuf1LACCYuyN5KDs
         u2nzjB0QNSDdFRYZJsfw0MauxNnJdeQBCXiKRxtYYDJUW5m6PXwuDQqHyMOu4O4MPkCI
         DpRq26R821xH/0eFPWLFYk3DfdHk39QkAOAmn8EZhrmfd+2ok19AOWv4d6Dh/Kwuu06O
         lswaF4blVYx9dBiNbaaw8mwfwvhLhJ++Z6Jb7gKpDAMyh15nsu7jgJV6p9DpSTzbMZ1n
         YSlw==
X-Forwarded-Encrypted: i=1; AKwUvBzyvvVxYZxPQVUgsTDsLHlfYZ0dQZLNrPC5Zh7As7JJxLku/vkdxSejB7T2UU5wHod5qBcw6A9tcRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4wwToh8bGY1g5BXGfAoGCHcRyOwSYuOH706Nl0+GBruNWodIN
	a12yQY/rzs+D10nZ7/ostd+vctN2awlFT2xnNi/UyjSUvz3fbSGmjbyl
X-Gm-Gg: AYBFou0QAtoqdqfTbErmGcrT8X5SLdivaUqFia+8Xbj2ST/KdfmIWsymJHXe4ZlunG8
	3ao8LVkW3kggZIKqB3hfsmRl9vYXgVLbq95xsSkZadIFwgI/BYjTsuRjSQhvtZYVnp04vF8fLDg
	dv0iMKBNRxjSaTc8aIO921l/BavRHI31nyfJ2C3h9k0iYW57+9EnFZtUQ5d00zeGfIq+xc6+wHy
	aEWBHQkCWFyqQyod4e8f+MhUYq/ABvBeuhRL5x15IOTsxFw6qMTf6Uysoxx6ajJXVwklOwpliy/
	7j0M2D0HsbiQdZCOHGWY1X/+bpI58GFSt35XgxsEVyh53P2ErIXZMbwlKpIaZapRNm1Dvdeg14Y
	Z8UoPF8IsHxB2hjcV3lffqzM/aJFFUPtVeQdVv/Kk22p719vuabAza75kQRycl2JXPNSah+nRWr
	guZtPDcS9MoMi3SacyLNR246c0RjooyExvkDkXyzLU5SVAsSxhEgVPKbTN9FKrq5/hlB0eNAuZV
	+WVnWFvMZwVHXeVK4v5FJ9Z9qfvmq6dNlgjhBlU/RlG5RAQTABwU3tdbxNFCwcfnl7vhBAyLES2
	ZLisuwNfkMlqoTooPOofll0T0GQq
X-Received: by 2002:a5d:5e8a:0:b0:48d:f56d:be56 with SMTP id ffacd0b85a97d-48e3eb7642cmr19483905f8f.13.1793109240024;
        Tue, 27 Oct 2026 06:54:00 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:59 -0700 (PDT)
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
Subject: [PATCH v6 06/15] drm: docs: remove bootsplash from TODO
Date: Tue, 27 Oct 2026 14:53:33 +0100
Message-Id: <20261027135342.2003632-7-maximpedraza@gmail.com>
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

Now that a splash client exists, remove the bootsplash task from the
TODO list for the DRM subsystem.

Signed-off-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e6d36f8da086..5e987e18bfcd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -756,23 +756,6 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
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

