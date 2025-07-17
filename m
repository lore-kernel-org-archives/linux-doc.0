Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A72FD59C
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770507; cv=none; b=Q6c0aGPAp0P/wp9jES/BPN4MMgYZQfx55UIJp+/+ct0+h9Hb2bJ9HhkgW1LvYN7hTTP7RUogWli2IHwES/jSEJFIQrnmKi7usW1JoSfJ3jPyYy986X4ZAUDhXPRx4FPUBgyTVjL1iC6d9PgzzCe86n1AYVG2dviNADX620wtuNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770507; c=relaxed/simple;
	bh=7Eifg3KSSA5Jt2qx/3hzXf0HaiUdAumge8P2aIN3a9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8vDXJ4YSc/BJSrXJbbpAXRTiC7piVh+inA5CF+/9Fd/zWKDFTd6eKEYoyx3yIEnJqIdsUwBBNaFIMNbIl8yBSIiLGlT7/W89wJT1iBYpc1QBBKqQga9G/wfU9TcA1jjHwbgLWOO3ElSaix5pVs7B4vElwTGbiPC5BAu5pEoDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=if6D8a1g; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="if6D8a1g"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3137c20213cso1183258a91.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752770505; x=1753375305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=if6D8a1gGyEUOtJ8l2uYCWsiyyKsNSl+YqtpTUMMmzyycSnOVza6Z8eLkBqKBN6/b9
         zCOx09Ew/HXJXBAipKIicZwKlS/oT4gU4owPhrTGQ8wYppHhNEr6fWvyGkgc0wYwMQTj
         mrBdqA+iXNuhmidoybQfhTERr2xczFSZW1yjVpb3Vey0FZsQiq2aFZuMrhWyVj2hqWMU
         Ks9yzlHOU8omBDH7Pb8zXigM2KTeayMHcKoY1kF8JFageEfj/KkYSe8/VSZVx/8zZ2/U
         FD/mylIO1Pj+FKnOJOXsn7kkWRXo8qsisJtCayt+oYk7qP/X1Zsgzee7HfDZekO6WXzE
         6VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770505; x=1753375305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=XxtiwwBEdE9hUMp+nDjWQB4J9qx4QrhARk+YMfO8co4pIMumgSHtxJrSq1XIBb4JAU
         XtRs2Ctzj5w8fXPKQsoDlAaXqpB3x0PgT7SYvWETaeqYqnxAyTHxXxKiSl3q14PD8V1D
         /Tt6K6bzH3kQOlz+5btKm0J/M47GiwS0hGDQLOCTmT6lhpYYtCU2nfhzycvEzPv9aplD
         cDeIdMwdsyzitlgZH3KQy6ASdmqZYlZFRzoAu3eB+5GgyiG5jI7DDRDkR4UcOmUd5DQU
         MqmqMvxqsbIwg1fXcsmp1jvTe1vpOIpRkuOERn2X6QvDWC3HkR4nX4BUvc/vDBBcoXyi
         jmeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoKpMp3eXiF8NvHEI/111vdvMtIBDS9AkAEeELeZvN9HRnzYvOlAikf/QsSoqHe4QTFuqz0f84urg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hR/eawdSLn3zCB9Wp+vfaEPdGnJPgIoecJIi/OlXonpFzguW
	PWB/DodiFFp8qQfPBxUSCUGt4QpEhuRjND1q6wjJ7pkU1TuvDyG8PJ9Brs336Ac/cX0=
X-Gm-Gg: ASbGnct69DAac76efAvvHL+ts4CdxX13JVUBAAnshO0yaMqpj9uAc7SyaqTrPjCSq09
	/lXRzduvz2DdkaF19R5OdFUeBey+NtEpHoKMdweUHrcK458iA0PJKS7bVO2dtNEpiOJVGIfigyn
	QTlnKgetCX6vxn95xkc84i1RmI5g/GSU3q0ePXaSfzd/Ui5KXcwG66v20G8ZRnWEBrr+bznsed6
	YYF9uVvEtootJU0ovF5zw9yRkxkxjDgI4uhYS1lGy4Pn5L9l19c4SlAiKixQQu+W2QlQIlhVE0v
	L2y0w9BzVITAEvI2gR8fhJIndFqyCnQoNms2OEI9aXpcJWuAU42/pQiMekBSG2MLiRpWH55FhNp
	ZozgxQb9KbLRlGr6CiCfz4d6taCSwz+Dvm+HuG8xd72ubtAu5jw==
X-Google-Smtp-Source: AGHT+IHrQlGV1Z7kY2qfK70zL4oggkzABvGWlF/G0WdpxXkZbFgRb1/eSGO9ppbowS9YeBigJnqdWA==
X-Received: by 2002:a17:90b:4985:b0:312:25dd:1c99 with SMTP id 98e67ed59e1d1-31c9f45e1d0mr10064867a91.19.1752770505309;
        Thu, 17 Jul 2025 09:41:45 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:41:44 -0700 (PDT)
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
Subject: [PATCH v4 4/4] drm: docs: Update task from drm TODO list
Date: Thu, 17 Jul 2025 10:40:52 -0600
Message-ID: <20250717164053.284969-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>
References: <20250717164053.284969-1-me@brighamcampbell.com>
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

