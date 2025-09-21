Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D31F4289
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758480028; cv=none; b=szG7AfIxhoXCM3Ym1OQgUCMPxHM+WOaWxuXLWMCBAEp2iKM8BmVmWYMXL751bcU2byj7RsA27jcgTyV15Hc2+SzgBzopt9ZtK+yr91JYa32gW2s24s4U8ksQ9H7+0GWgKXBJ0kkpmsv3G3MGpOmJTBdYzifvzA3AbHeVcUiz2/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758480028; c=relaxed/simple;
	bh=5z6F54TPmn+MomJgT0ZdZhQGhmjNqbgLAOKBnU38yRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYRfcJsTJeCkylnl6gO9YE4qN/2mWuHzGot22xDLE38Tei8dnX4TE7/FMShxFeclitRgK6aMeaH0z0jHZoIR3WoFboSe5G8yoYTL0PSsLFB9cPyI9wciT/rrwzhGftf4Ut0gaxeuKDBSQE9bmCGPnzq4gIHLpS3Qz5lUFCvfoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfIY586U; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfIY586U"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b55115148b4so2258000a12.3
        for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758480026; x=1759084826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wLzqxcgnYwT4Poz7HHxN7qrlVYSiEgUKNZgrhHxkio=;
        b=PfIY586UzySlnmw54lqcuURSDSQ2yAOwJsCrmG8Xs02LeT/grzztG3xlW/MstsLwvM
         /BJYlbOwHFt9EXAuGGay+s8/gqFmr6FqNiMcpDWuZSMSihN0xoVckjbh2zVbSSHytL+o
         toeWSKD2AwBEv9R9wLnZqjZco9/ggJfUaYG3+otUlOvR9NrkVVn6Iid/LPoIp/wboGmT
         GqrAZwKHy8OTq3VqyiE6AURHZQPA09QbZPb+LKS2CxGLtclsZDnQC/EURiYM/iQOmnN+
         xa2kZOMS5AX9v0Jb8J92o/yPp5cUuCIWcrif0rJWcG6OuNHI1kYh7VNEOVH3DdSL7SHz
         HO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758480026; x=1759084826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wLzqxcgnYwT4Poz7HHxN7qrlVYSiEgUKNZgrhHxkio=;
        b=sJQSvj9Yh/LWfhAYnUY6C1ArZC1awNtKV4pxy2c8LUNfjUcl3tNUgpt5HfGDrDWmfA
         BVHGPgISFakZSpyzzVfAi9rtUI0lXynC5jUSs2E2f134XatbhbUyQAPpv9TzTvw0ZP8P
         GDQVJ4KZcQyToTzjwCdMEJUvb31zW82YzWCwbEoV68pZivdeJ1uOSzODxthbkNAzTQ7O
         FAfTu7iNO0jHhFqn57jcKVICuibvQ3AnpFlHUmM+qHfpJsrOl1zyRD/H71VTcrOtm9Dg
         Uk2W2OUQbcabsMDFMEA1LGxk9vLdx3kRuRx/Td6CboHYdKBEkH7nBEW1hFlIfu1ucFAN
         VHUA==
X-Forwarded-Encrypted: i=1; AJvYcCUga7lNvdb3hVNZT+u0MewTOyU9fG29Eg143S8hNDJxNZjsWeP0g1bM/OydBlUvEU92beQPX4O+VfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YydJ4IH65WLFgwW7fljDZZ3jlvC57Axw7JAO6qx7zJzZDSDUi38
	j2LLkuXzxwZMS9YuwwPVmo1eKuP2A6PTt5j5AmgSdIgae03LhC38yuSz
X-Gm-Gg: ASbGncuUpJwLa5sOw0CbsvJhGora5VvpPsj07dDrSyzE1Ga/TjRwGvn5Hv9mbVh8HUK
	fY0dKQy7GjrMWerR5/oODAlzvB7H1N2HcRcvmy7HVVLdh1hKUoZi4KZXNNS0k8atLBdeG03W25q
	FpsE5X1qc9oWMhaJwEP0nZO2KyYZ1ZO4Ed3kuWfFwXiddk6ickjGtdB2gVAT5lhQzQ8+LyV0frE
	XGFwcvAbWSiqoYq57zLhJE6J7//D4pFcme07jvD0CuhU4Bd+Jmy17IyYG/deiYaxqYo/h/osA7I
	+X/09KZ8P0koe7qLCe1DRplVikJXhd889ByXQzppHsEfxSq4s4hFOu5/ET0aHwBVxCr4/rbOiJJ
	Or6kQJ1YNvFIsV4ejrOQmUhn3OeK+
X-Google-Smtp-Source: AGHT+IEtWuYCyhgsDqIGrs0SVKnauGGAW7P33Isy0rJGQr/jYIj+u9i1Vy91MNpDnJyerCFmD/lfjA==
X-Received: by 2002:a17:902:f612:b0:276:305b:14a7 with SMTP id d9443c01a7336-276305b1691mr23964445ad.33.1758480026625;
        Sun, 21 Sep 2025 11:40:26 -0700 (PDT)
Received: from fedora ([45.116.149.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802dfcbesm111053795ad.88.2025.09.21.11.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 11:40:26 -0700 (PDT)
From: rtapadia730@gmail.com
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jessica.zhang@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	Rajeev Tapadia <rtapadia730@gmail.com>
Subject: [PATCH 4/4] drm/todo: remove todo entry for deprecated mipi_dsi_*_write_seq()
Date: Mon, 22 Sep 2025 00:07:24 +0530
Message-ID: <20250921183720.237761-8-rtapadia730@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921183720.237761-2-rtapadia730@gmail.com>
References: <20250921183720.237761-2-rtapadia730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajeev Tapadia <rtapadia730@gmail.com>

The todo entry about transitioning from mipi_dsi_*_write_seq() is
completed.

Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
---
 Documentation/gpu/todo.rst | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..76afb8a784e3 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,24 +497,6 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
-
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
-
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
-
-Contact: Douglas Anderson <dianders@chromium.org>
-
-Level: Starter
-
 Remove devm_drm_put_bridge()
 ----------------------------
 
-- 
2.51.0

