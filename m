Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169D047F3B6
	for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884745; cv=none; b=HCSchbubZ9e+uGgiDWXxjN59JPGsAPynRBS8pPrYEvUEpQ5f567w+k5nJyBDeghAjbTJqMAi3k1b3aHRr9Vur/VKKB97E+wpDZUAtzuxmbqAhMF95OEI6Cy4xMoMXz+HxXXO8LWbO3T+m9KxuoPp9o/KYESPdyr3HY/Q7Iszsiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884745; c=relaxed/simple;
	bh=IonqSnhEs4XXh10/twKbHK1qxirAdAbOjc2/pjgee5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HvSA09Q0k0djY1ohov4Hr4zzHU7lMd6bYg1ovcGyPTf3Z7NYJ3MZdWgfbGJHXONuBeUcVc0NPTYWqC7cYfPNvW906MpFcQW+UIxyXa1kKa949SMtguARRujrYpOqCIHhc+wl1DSker3F8e4GsvNonS2pnCVvsSV2wkA1bk7c/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMgzg3mc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMgzg3mc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so43540365e9.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 12:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790884738; x=1791489538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gkbMt1iWPzKqAl5Y1iQuN/ShWwz04PZhQ+M6tBc7F18=;
        b=gMgzg3mcsdtNNW5sylmu4bcqOqL2TA7DsDHXFfujWK3ZTr2lNlOMryQxcw7Rri09JM
         uIK/YU6TKTd0nJafvfXyK5m4r4vPX11RgpGi5CXGSH4gQ9d9+O88doZfubti1rr22x/t
         ZQNsZ0TJP8teaQ/jCN+s6a08pkuHw+rMxlJrjOgPmQRIAzJfE33izVQgDt6TouMaDidl
         JnDHNY5l0hngwLbEJeGolbQ6OO0hd87W5VG/zGv2aVwqJioE478Q85oz9RbLrO11Durc
         tu6N+WjsSLXaPD3xkmkUrG5+aWg3bWQmUxQgSFnKdVgCU//7aVvNUZZq7jIgVJFm2mPG
         LADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884738; x=1791489538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkbMt1iWPzKqAl5Y1iQuN/ShWwz04PZhQ+M6tBc7F18=;
        b=vyDj/usjtT3+n7ngX3QGdP+z+FxA1dIG9XZg+o7Qjj5ZkEzphzZ7QAhCnXz/ZpPLH9
         KZLnWNnFW9Hh0J5I/wfbCUJQ4VibdEL8WH3bMyq0VM5ipA6sFvpYiLPCWZNpHv2OpDXt
         VC4jnIEJ+vPx/GMN4rwXEP8b6gsw1xgZHwA/fOGcHSeBeYWmesFaw7OP5/uumSZoqoUt
         lSk65vIXJ9Un1Vc7WURqNcKvPmTp0yRFdXJpX6NyzTazHM/LgV6XrbhI0TZVsFZvTwdM
         OrZEexMcu+CM4Vyt7R8b4XQdfIgOaJkFqasHd+vuk91A+k3smYmUiJXyKJJe/yuUbZ0C
         PE5A==
X-Forwarded-Encrypted: i=1; AKwUvBxeslaoTXgBD3p7Jl0N9L4Xs3cSsUQ6zmHTOX10Sg94Ed/QL6GPbiOKPU9jtKFFCWwj8BnGIFdd8kQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgxnM4J7IWNZ1dK84JRQAutFlXsS+bhB+3k9EQBQa9L8BQ2EJQ
	haIrNAcTpevTR5vo4O/cIBhoTVy6NRu04A7XD9diILp/p26MAztBikEy
X-Gm-Gg: AYBFou1BXFvovPOvRcM3VQXubIYS+e3T7B6WjM6Kh8tbOUEJrfgI5hEIInvlkAwJbZx
	vif1GdOaQerpsY2aop1Fn20iirH0nB988YoCnUN4AsxUiE6FH/zB9JuqXuupHZPSPK8fMd8myGN
	azxhT4UuW+9v3V+GkADCLQ5dzOupkmp0ZHc0CTR8HTCJRCNahLhkiXBgvtpmuLKJr27uhk4n7WP
	Y4+vVivi9XY0i2kjrvmgChGcgTm9oVg7sBk/xNOIABcFexxWJCwTxVLXXhp22u+eVrt0rSUGL2G
	ROw+nkiaoAxfJ5RP23alAGb8k+A2KiT9h0HTkb+iaocQWAckCDNTZnfqGgPj3bDdIK1DHWN40EV
	1WPc2KVfD7YjzrkRJQYGkR7azFEoUEBlCIMFxmnEedXPvkRSCtZq0aXUCCa1N0M2HKwvqoE+oAW
	yQ86k/n9lzo1EFig2S9vDxhi4/qkDcdC4eko5rqr/qBfqN80/BCqyQrKKs+b5LkDTmzNtLu5tMI
	JJiufkcSSM+wtYiNHhhqkewtA==
X-Received: by 2002:a05:600c:6d1:b0:4a0:1d3d:502d with SMTP id 5b1f17b1804b1-4a02755f856mr8010975e9.10.1790884738342;
        Thu, 01 Oct 2026 12:58:58 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276f92d9sm15031045e9.4.2026.10.01.12.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:58:58 -0700 (PDT)
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
Subject: [PATCH RFC v4 04/13] MAINTAINERS: add entry for DRM splash client
Date: Thu,  1 Oct 2026 21:58:38 +0200
Message-Id: <20261001195847.141192-5-maximpedraza@gmail.com>
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

From: Francesco Valla <francesco@valla.it>

Add myself as maintainer for the DRM splash client.

Signed-off-by: Francesco Valla <francesco@valla.it>
[Màxim: add myself as co-maintainer]
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d108339f44e..44730414e5df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9155,6 +9155,14 @@ F:	Documentation/gpu/drm-ras.rst
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

