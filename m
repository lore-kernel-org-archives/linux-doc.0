Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13712367D4
	for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913632; cv=none; b=fi08zUs/w1lEV+MHWkf0vhfh1XKujgIOFK6M1FXZZaWhS0odOETEnrqaBdDHKrrZW3EqoLlqnnphHWUlUF3xXTYsNHboG8Z0gyBAikAcptBc61P9c/DZz6H+ZsAxNuAxOabVILMkD/ioqAyS6bne0u6IL1/2J/zpel/t8/LKIR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913632; c=relaxed/simple;
	bh=7Eifg3KSSA5Jt2qx/3hzXf0HaiUdAumge8P2aIN3a9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5P15bDlLCtEDWWUsk5iN1/+XKBMP1gr2HMtv/KYl5rUb8wTk0Y1jahAmBbW1M7nwzROo+rXwSijhGVrHhgV+LHLxyr+7DSDwfymkVdPJ0Xk7znsJzt+9BqOFHuWwqieq7Q1uzY/KBSPt/lQhooXp6qOwKze1vVdkPiRyUa957c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=QqYcssTO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="QqYcssTO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747fba9f962so2767623b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752913630; x=1753518430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=QqYcssTOGTktErvJ1iII+3Xa0ApEqjSKHnVa1BMh8jyGayEfWB17pwBjzz4+b9ktmi
         p2/+dkz3iqXtXgcLexSQabtSzvsYh2jGYFjrSF+8/IGIySbm8LSPECdLZL1FE8Gr3SXK
         ne3aiwRXEC3zlKBNTvJuHHkZkZM9WZmhrKK3IdPuFBsPDng48zRH9TMy7OdknXuZNugr
         Uf6CYXeMOq8kv2zJfy5N7mHVAAiscTb2Z3qErB9pxkujscI2eJV8muwFo9M78IYiWDcy
         usS2ehcveAypd4mcSLnv1Yymw9VeiVwgWkOPu4ld7Yixxt8cQ/mfKHpeQJryR7mgUAbi
         C9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913630; x=1753518430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=qVx6q7GJONfJmlTidTHQ8NwKXEZ0Mo0PS7CKrsj15d8gRUTsZv/BInTm//3xDzNPWZ
         eb9C4v4rvPMFx5U4iX3oXJQz3SIsfDqRFlWDNdnTIhYywx4ekAjbhMH2+GayVxOiSUMK
         twHyg38P73OQ7T91KnMW7b7bwPp+VMfRPD615b4DreGgwRwoQZJUmqH2J1DHMSSW390a
         1mBK4bHNmFkGGL8gigB54gqtfp/nJ8U/YNBQgvij1lMgcwAK+oraIA6q4DcjqwiUqBoo
         WTD+8PNVSMpJrNF2T48VnD6Dx4eVnPkUE6TLBt5DGVNJVqGkxPoB8s7bIwaakMQqio5q
         cQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTt3cz//Olji/5RkVXStzIELv/fBZRLQhwH0JKJkUndTuBakAqN0SfePkPOFj9pGvVFQ9fJrn6IS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyFRfV8WvLQEjslGxaJ2O1hqPjwFcMlLTnX1zsye6NBTrpZYkL
	S3HbRtMwRQwXbWr3zpZEXUfzu5O8WVZzTnKHCVYsd8X2EBzZRG3bPsX2cXJUtA657vI=
X-Gm-Gg: ASbGnctSNu9QNNVb88C272+e87GrJduxyXOUT+MjO9gECamsLPTpzyj1dmqTJXHmmAH
	lsmGQ6lqOwpn4ZbmWv55XOr/UdyqEUBE04T71onXwdTWIJmPzP/k/GfZAMR3FVOFX9QM4r8Aj2F
	ci+Q0tsQVQpDlHEorHJhDKKd3DknlJYioLTOFgzTs0o9+FXkDA71BTL1K3XGXmO5zYffcGtdLmN
	c0XfP59b17l9NhCVZv0osctG/EfA3L1Cs91zKensnb/o9l8OIsLMcA18rfUkW6uHp5O7JS33KD+
	PtEn5EPRQOwlNrioh0PeEsPgqont8hEmpyNWFHwYlWMg5Sdx+xlmKaLq5kj1sPm2MElYwC8sUX8
	oNILRqPFdJqhxrFvaV2PNIxZWgRz4kav3FQidz4vWxrV1cgOFsQ==
X-Google-Smtp-Source: AGHT+IGatphEHSAKw7z/xW0LGtlPVyO0W6ZIkOclORHs8NjYT1LzsjnDPk9buZ2iABOLqZ0brWLSNw==
X-Received: by 2002:a05:6a00:4c93:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-75837586b17mr13305132b3a.6.1752913630098;
        Sat, 19 Jul 2025 01:27:10 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:27:09 -0700 (PDT)
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
Subject: [PATCH v5 4/4] drm: docs: Update task from drm TODO list
Date: Sat, 19 Jul 2025 02:26:38 -0600
Message-ID: <20250719082639.307545-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719082639.307545-1-me@brighamcampbell.com>
References: <20250719082639.307545-1-me@brighamcampbell.com>
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

