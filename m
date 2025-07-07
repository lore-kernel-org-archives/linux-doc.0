Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90528C5C9
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875058; cv=none; b=fZjMaM1qFk/ljGSxudM54g/HRMw2c4/ZeDxZG8gu7vOlX1eYHeAczeZ9air6JHJD3S6Uutw8LZguptj5HhFI2Y27Wae4INylfPXIbARxmY+2O/ErB4jWJJSwyIxuD19nAXODMPOP1Q5Q54O3f0HhBu4A/aKFwLnbvGXhjLX1oy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875058; c=relaxed/simple;
	bh=TIYvoKfMMCjlv2uIdTylizwMRIdwqTIRMTgS9s8saVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+GQ4WAy63wRzyGXjbMwmD28GMyQOWARSIOuW70IOiCwNQJ1wxTKRzHOxNMqS5TmyiHfwK79GQFVr03gQ7uord0OtZJPDKj5AqOPWxgvmMKgJkOISMtUVpFpMWS7tGC7wKFW7PdZlnDmQSKUlkgqNG35t6fkFLwv6J8FMovi+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=fAXCp2Ok; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="fAXCp2Ok"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2397302b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875055; x=1752479855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MC/xohKHOcg+vnOOSNCEDTYlZuTz6zJxo6U8fkD0yY=;
        b=fAXCp2OkG630hcC1x3SNl4GRMHD9RpPkRHnjMVtZ6FFYIFmA53Ndu6pC/DKss6AMO0
         miJtcA+RgIfT4ZcCMdSEHsINFBUDHyI0z9bz3OFdiVmnswRIdua/ZjZp3X9iF03RlRyR
         PlUD4+PZJqaqi9vMAIRxLOFBwL3Hi5gjOBPSrGPWxESuMLzJJOVV8as2NhmOjRDLPHtl
         HVcFX1ZR1kifAT7YyHm/ado3fX+5d0vOwbVHRgRNFvCfyoPlU5Qg1W6jn8MtBpl6pjkw
         Zn6Z1VO6TWQKNSdiSDneMvIRQkdurjS0pAs9Yw5opKmDyrHORLnwUS5tm6zN109SuUJL
         OU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875055; x=1752479855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MC/xohKHOcg+vnOOSNCEDTYlZuTz6zJxo6U8fkD0yY=;
        b=fr9apfoMQqC7slUBRkY04++KD+3CuXzoPfcCm9PHJpA+/to9B2838nLDkEL6r6zET/
         xULVdcuicb3iPHYzolUeaSZvySQ2ko12hP7UACdgtMHsxQd5OcZu/Yh0wSDxIf3h/2ss
         LD0XfQ1UEJd/GL0OkoRQmqw9jD9rNMS6hQhPPclUxR0Y9cla1XWQaijNLn9nyS8+aFPZ
         Ep+ukk+0AmN6TfTSKDoHfW5Z1Vr4zeaeqqni2Jebnu+3rn3YQ1BUakPKaIx7/Lplb330
         lpxDRhEr+VQEp6EfRMiCUU8FvRieo1VV/FknBo5bkvAEIkYX/aXAfb34jZNszp11Euc8
         Rnuw==
X-Forwarded-Encrypted: i=1; AJvYcCVh2NWMZJD4kUAYQSufDPaZ0AGb1ouR7SrHZK4/iDZM03OC5Y0Z5wuEwPB9AJ+ooeBzL/pZeifeLxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy21mwiQ7j20NpStMAcpSReUAheAn/c9auKd6Rv1+A3QKbG0qYn
	x9rifcSE8j65XS9rDQ+mXFW0P+/Rdr0aF9JC1zO9Zy0IVj7lRddLs/LqD94emp1kvIE=
X-Gm-Gg: ASbGnctkwp224NIc4o9udYdyq2O8K+XZnCFuRpHte7j9nBXQTgSGSFlvpxB4QKc6GoH
	SyqXYggqmyJlyuMkfM6XrIXCfAqMVfOdQBgtP24ArpvGr38k6G3gJCpLlmZ4ALKz6OZ63un8G7c
	pPTpI5q63ogHT2lHpGBAwmoBJaMEGNEjlWtc2quzjemMXQ5N/RsKBM/s+wXdTqk1os/jSmpMFJ4
	KUS2FjuwW1A7dDl65dI5vPL+6UL1o7/G4T503nqkFJerhayn6IF8Tgpc9qHuOeEAOI47ls0XHV+
	TQrcl4WTLruD2Y7ZwfpVu8GcpAtQv3CYc+ROKhWk17Krqj31fqR8pj3HaLIgbIEP7jE0J6VvI+A
	ZakDllogV7qDDIOD/WQ==
X-Google-Smtp-Source: AGHT+IEG3rUVLj/sU9Sc3cCmT/rktoO/r9+WAKUWx4b+U8GR+jBcTNhe69ooHHcJV8ngN58Oe5tUvA==
X-Received: by 2002:a05:6a20:2583:b0:21f:54f0:3b84 with SMTP id adf61e73a8af0-2260b96873fmr18892440637.35.1751875054860;
        Mon, 07 Jul 2025 00:57:34 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:34 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 3/3] drm: docs: Remove completed task from drm TODO list
Date: Mon,  7 Jul 2025 01:56:58 -0600
Message-ID: <20250707075659.75810-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove TODO item from drm documentation to transition away from using
mipi_dsi_*_write_seq() macros now that the work is complete.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
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
2.49.0

