Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1C3B52E2
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 20:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667441; cv=none; b=Haz35NEGOsyAKNG/CdOEbIFTZHU4YX3O9+E/dx+z1u3nVtem8NHtN5T1eut9HaNYEhm6FBPIJCYI/EVz6wOaQEGcoNbxKbbGhZJx+9LLCynGEZ3EaVJ+mhr3I7pK6HDNYoufZmMarznkyiQF7ctTeGhOjCdsoEHexaovydbMGo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667441; c=relaxed/simple;
	bh=hS/jtkq/JrVHcN/uc/pVKASKGCENsolPn7B4mWKffAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FUEMy8Qa56jwA58KznOUSUlNJcAkw8h721EHLVaq9L2yUSH4DfYXbowXPLGWoqG/qtmMhZO3NeChdTeZjj9UZ4/StvN2fekwQOr3/773GHbl8tLmsO9pY8oxvJUxvF+ejo/gO6OaaXOSPBtvIxPUOPCKGOLUwnW/xQRnNkMxBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsvaRuaE; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsvaRuaE"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso3681563a34.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667437; x=1785272237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tICvvWUDLTcQaplMAJMGSX4sdCGxuxLlP7txV6x7Ef0=;
        b=BsvaRuaEa8t0WOpGhFUuzxV8ljunu9o+XdRcgrWLZ0DRZzmr7eUXRaHjWVheSrHxO+
         lRQ2n5USOyJU5CwSu+SycnU+yVf9DR7BPKGCfKGM1l8axIkN9bmwBElRC+8WpcGBZKsl
         cIC222LNGfeTtqNrpo29w+q+2L0yCTl/1JhVFM14zonVvsQ75oIKLQ9sjIpOdekI0uWq
         XKQTFTwBswVGi7kuAB60AjV0g/lRS32t159Z1utvx0jGnTrvkl3UrlvZb+PvvksqGavf
         +O/ywyOf0mGJM6/PcXIJ9wZnilhD/7vxqzjpytTn3UOQtlwf7Fw+vaqfNtLBMMJy7sRy
         bYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667437; x=1785272237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tICvvWUDLTcQaplMAJMGSX4sdCGxuxLlP7txV6x7Ef0=;
        b=hHot7rY4wt7QpKsuRpvLQOgD+HlMPJJIaDDQlp9dexkfMQITQPQLUu4jTS8m9TNk2y
         3gm0Eqd4uzWWz4+AceYcYfofobAqYafJQstsvtDleswJBWVLbZXCwJ2ja533PT55ctuV
         lg901OEcsJbvugKdP4C6LiUStk8iIkoFzv1TofwB5PtD81a3EDdFMGt6V3qnMHZGeKmq
         5EVCqIDC7ydS2eJmRY+bYoeP1L2xXwKrStHYz11xT9sm3SXSNp5aAeZ4NaQ9qe/djlte
         oxUEklLznyKc/x6AWdDl0TJsm86lblLkcNgVWFjtqXaq5TlKcaljvhTmsAun/Kow3Jqh
         IPng==
X-Forwarded-Encrypted: i=1; AHgh+Ro+ovslpNDU4Vq4olcu5ec1jRA0somGL/9LGDCT3qUpjC2E3q05FU0a0Hibp3CGTrT6/aQuJ6tG1zo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9f+vakKzgA2bOFSMpIUIuJlcqQFGr3ifbW3qCIaZx1Y5LnfOg
	KkzzQAS4K2vv/J1VfF6saYSKzrOsJOQMwGjvhHQ+R4oeEqeG+2B8htT3
X-Gm-Gg: AfdE7ckf+jGm7jb7vI7QVf2tF87GEf3ldn0eRo/gR7U8ZKaIkJJ1utRn61eOliC3E80
	GgT30uJt27zCtsiY8mS4XD9ghellrKtWzmxqY4tAAylUJaBsUwyscy0WMRU3dACy70Pfjn8vvu+
	hTQbCIREBh1MiZupLN6UAagaPB3n7EyWpmiS5dJPNa3ABJeNKZulIcBh1xyY4T6fz0t8MJwM2Gz
	GNaKPSgDDCd2051y4bExdn5NSoT1kdnU0LqfB3nQdMe8faXpZnFsWpeMV8/uDwd9gBQccFNpPs4
	NxBt3ChoFvXLYHJ2Xc+LY+j1eauTggmc6GLPDlJufrxGQ7+ZT0uBYw2P6gWZDUrMerib0CB6Lir
	8oRPMhkQv4+b3dCwegCd5/PPUoH9mqrwdRjmTYmUaUVcef4eX7K+Y455YhPyN5TvbAU57rvJ3xb
	qyEQga/MmLE9lgpmTP/sdX4bqq/M833fZPSsg12SCSJwLJTVm1bbtRXOqBiCr0Gs4G2ctLDn0sf
	uBpXb7OzewoISN17LJNtk7XNw==
X-Received: by 2002:a05:6830:3746:b0:7e6:c9eb:535a with SMTP id 46e09a7af769-7ed9aa4576emr10492097a34.6.1784667437350;
        Tue, 21 Jul 2026 13:57:17 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:56:54 -0600
Subject: [PATCH v7 05/29] drm: Mark CONFIG_DRM_USE_DYNAMIC_DEBUG as
 unBROKEN
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-5-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=924;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=hS/jtkq/JrVHcN/uc/pVKASKGCENsolPn7B4mWKffAg=;
 b=Lsf35FcMlCjbByxil/qjct2DAL4mr3Oc2q7x03tL/lqrAAMPWfcuP6gbFsC+oTgUeWP2YAwmG
 rTpFDD680+JBUtHGotBL8c4zwJWAzCGG1m6f1joIJBe2KBkLkyy1u+R
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Remove BROKEN mark on CONFIG_DRM_USE_DYNAMIC_DEBUG, inside
drivers/gpu/drm/Kconfig.debug.

Un-breaking the var allows to enable the config, and build and test
dynamic-debug-enabled DRM drivers with full classmap query support.

Doing this early in the commit-set exposes the series to more
in-series enabled testing, which has more chance to expose bugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig.debug | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 1f4c98cbf090..2ae59a616e75 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -1,7 +1,6 @@
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
 	default n
-	depends on BROKEN
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL

-- 
2.55.0

