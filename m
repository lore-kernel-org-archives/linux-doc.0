Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637F11C3306
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 01:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753149209; cv=none; b=SCfFfP5oF17kYhlyIuDgi0FgZPFu3P46OjND54E4cdfO8WAO96NUcztrkq5v/akBiDOPt46P0dp1zJqhBv3lQKD3+wofAA6OKdKaYncnccTI6PLYYVS2u7ce7mLuuJVKaV9kieIi1e5v93Ta7aasXyIftD2lc1wXFWy8pqHSwB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753149209; c=relaxed/simple;
	bh=7Eifg3KSSA5Jt2qx/3hzXf0HaiUdAumge8P2aIN3a9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7JY1FrwzDGWQdTYAiJQa0TMp25Gx5OU9c+AOX70Eqkn3R6NHrvSj+At4fS2dUUtSJYoAi5VXBy/GP9/ul2Prz+unNnZnXuSyE946Qo5G3YWcjxlLCHsRnfBwsoGRzpaCZ6UGaL3Ye9yH2PhItw1gakRJ3Tyjq6EGeidl40TTpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=d/mxqrVu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="d/mxqrVu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74931666cbcso4044179b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 18:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753149208; x=1753754008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=d/mxqrVuV/nJGiDTPI4uKTSBnYtBuGqiWTEBw/GpcyLGTr9ymVkBt0rr+BZcmMvC5w
         MiwwRwJH150Mq2n7/tX0XePIdYryksrd/NJcspM1iuf/lSQRP2vqozqIhjRl1tyR3pEz
         gdJ9xefFjurGdpWo1lPzPDUIF4VJTOzjXNr2gUkg+Ok7ubHv9UzIzkqrzQ+B7wpx/h+R
         R8hsoh4dZg/HjfiBvX28JGz68nq161pz1jCHiFHorhNxEoBKQF9OG4J2LYPPmFsJ0RfW
         sJJ8WlH+kuXrNtjMbX0WBwCbltsIEa/o2Zt3zoFl1vf10XntK/qW5J9kKp5qzer3QwjN
         nZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753149208; x=1753754008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=PqtZfbkhCAe05YKGzZ5G7NbcU36B+CLasH6c0IZfxA5zKPoSzZmSVCwr3VOAvlRi2N
         XE7eFwCv8QCsjHmrPv2W5zmv6FnVaCJQak0o75DPZaEOYyZs2Z6xsuBUIfyMNIf3hNMN
         ILCdQvdoH0U7t0hZkoSAtcwiRHzljONp1aoc7NeenkERiPf0QZ2GbILjlZJko91GRr0V
         JCnWE64iekEbmItrW0x1YM/6jAjvH/SvzYyt2eSKa5AnWqdNOI+a4fXYqbmNPDcbFJnW
         wRGH1VtZ5mjoJZ34UaLhf5bbYq9E+N4cMu4q0OuiAE5Gcp5NTCr7j4xWTRxI2xzrcG0r
         czzg==
X-Forwarded-Encrypted: i=1; AJvYcCW55o98hoVZKJXPq6zpnYgva14WLLMlS52bornv7MXNrOcc+tkpsEAn4DMWXk7Q7/MYfU7KLi0+s6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAFSAWvu6zDSQv8oBTxLKwCCE8kOu/I5AbxbXmtI6B1qh7ofnM
	QSt2ztH2xX3FjslJQBfX4+hJvK67nPcGz5zsySt3MEUWpavyocvlol2VwAUArty21K8=
X-Gm-Gg: ASbGncuYi1geKR74z/ynKKg/TE15LBz5mqFSpo5EpShY2tO1GXplYybk0zJC/218+Bd
	97C1Vtjvz+c7DSdqz7ZKyidLf+dxgMq7AQA4zYlSBxXikS+zUg2VDt5bIuumyR5jdJknMMFUBuT
	45yR6WkzfyiULmhxrGBPfHgX7gdkcpNLr/lnlEbGfozsJCQZwWK6Z+7IOBJPdfBYfJ3XlDum8aK
	jtW2A8GVwUTdP8Ncbytl08qR6OIsl1tK8uSOHODZwG1n6m0GCJ+zNLHJi05CjtU/zQFnJD6yiu+
	ItgFcbyI1zf8p+/96F5Tebj3BHJ8SU1Ru1jpJ3H27m+Hlhlz0N6kTBAKh7MgrflLHNssmhzU3qz
	u4mEwtLG/KlBlSkHm+9oSrDcH14poNQVGC54C1crxzX+ItqlzrA==
X-Google-Smtp-Source: AGHT+IE6DV4AnVW0+4Gsag1rZoVLI3l8Jq88LM8p0J3ZdDdDROI+eXGNgt3ap9Wn8cOMjGOum41DxA==
X-Received: by 2002:a05:6a00:2e0d:b0:740:67aa:94ab with SMTP id d2e1a72fcca58-758462d74b4mr25646084b3a.0.1753149207483;
        Mon, 21 Jul 2025 18:53:27 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 18:53:27 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v6 4/4] drm: docs: Update task from drm TODO list
Date: Mon, 21 Jul 2025 19:53:11 -0600
Message-ID: <20250722015313.561966-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
References: <20250722015313.561966-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update TODO item from drm documentation to contain more applicable
information regarding the removal of deprecated MIPI DSI functions and
no longer reference functions which have already been removed from the
kernel.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/todo.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..92db80793bba 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,19 +497,19 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
+Transition away from using deprecated MIPI DSI functions
+--------------------------------------------------------
 
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
+There are many functions defined in ``drm_mipi_dsi.c`` which have been
+deprecated. Each deprecated function was deprecated in favor of its `multi`
+variant (e.g. `mipi_dsi_generic_write()` and `mipi_dsi_generic_write_multi()`).
+The `multi` variant of a function includes improved error handling and logic
+which makes it more convenient to make several calls in a row, as most MIPI
+drivers do.
 
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
+Drivers should be updated to use undeprecated functions. Once all usages of the
+deprecated MIPI DSI functions have been removed, their definitions may be
+removed from ``drm_mipi_dsi.c``.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
-- 
2.50.1

