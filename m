Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEBC21FF53
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 06:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735501; cv=none; b=IkL6EfZMc/7ro0d5tjCC/ots0pf8m925q/3d9lyifN+HXdqeqP4lkamgvQKTf2/JgKtbsjc+kUe8mLQwGqztjOJSwjRko1RIuq5gzcxvluO7P+BZViPKvKzEGbyaBq6AZIg0EDM+ae0BFRphLyRh3RhiYsCVdIxGxdsr6FzIgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735501; c=relaxed/simple;
	bh=8gILEV2wshZruF7SjKc8/Her8leo7VCCobv+IxEo+ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNE+ouQjXgC2w1+yuJUwBPXeweom+hK6zKFrPgz4GZWxZKw85likQff/JaYLRVW4MSJYORPbdiu+OC+tq65RM4xrpQjsvCbC7PbdEYrULaCMAHefmPR487hG8pubaqc8Y4xRsEmsQz63hiVwQUSMwwURZVdLXZOb7WLjpHL9inY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=SMaSJhxe; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="SMaSJhxe"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748e378ba4fso845148b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752735497; x=1753340297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D4Zj64qlLFOiqXv/wSX0OcGR87OOiTqr+HfIllhQOk=;
        b=SMaSJhxeldjocrMH6qUWGKj7vkdzFL7QvkT1+MtH7ZKBaTiztugLY3iCbUUjaNz3kl
         Vat4WVyZ9ZRihEmTQm99YzB3BO9ocr7SLOstUlOACt3HoOUOeVkfXjtYGE7Mik+rXAnq
         0T1ppMpmX7pRLxaUv4peOiGsW9gIrQYSfqKYj0w9IVBr93/0+P9RqzEUTRK+LnXg78QT
         rysfBc3nQ0xF460Jqq2DTid1jdrz276SHYBfZJGnyC69IuzE69Wcos7q68IwZVLaaxja
         MlJIqvLlzu1uVUrCF0Ji26OEcUdXpaG0ARQXsoLAZCPnxGtxdfbSk+R46CsnTab/Xtn4
         yx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735497; x=1753340297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D4Zj64qlLFOiqXv/wSX0OcGR87OOiTqr+HfIllhQOk=;
        b=sia7yNv/HjpQSpb9ouOY/DxlgNeTuzDnOTYcDAgQQ+wMC4lxa0BOrV6CZiWJHULaqj
         XKFDvbjuilnCiO2CG5ZATmLBo5k9/4MCMXXQXN020F4mxbKMuECmg1Oay/oxJAVtYy2Y
         Ob40lys+LtXknMaT+qrNWb/EFKhpB1sZ+Oc3L63WylFiYu+FI48jqaB2siPniVydP3sC
         KqUc364EtDI3nm0eWM0G557gTB72/JOW+F0VduMpX8pdpnMKFsCCfvWuV5Du2M6VBLPj
         koVfnizZzYP6gQsCe+8GBGwEayvRz1KduB+PA7kdRlh2zW35wV0M0mpLbOrYeodGwD+I
         ReYw==
X-Forwarded-Encrypted: i=1; AJvYcCUKY//Uz4eCxSSR+hAZUscB/lI21TH3YSAyiJYda6FroZPkewHe/Yr2ZZ4z9taisp0ZvGomD6wmFqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXRApXIQe0GxwGw9jSCPPd7x/7Q61p6oEJ0HJEYrqhwB013oLd
	vt20Ow2c9xLbMkXZe3U1eOlFD7X8x3Ikw695SeRZLfZC/rzGQWSFfkLd33Ur+WliYA8=
X-Gm-Gg: ASbGnct76+e9lyvWZQLfRVp8CddS9MdntKRAYX1YzcwiSNHCdrhMnIheN3ELuAdx2x2
	F8D9HutCRbHWM2Lk5McWk9mbO+vsldguo+IlPMOcq7q0Kb5ITpK+EIKkyNlfYPWUUNGO5SAbi9f
	/nW2FeclCyKdKNtlcUX2CODpbCAo8abK1N1Y4aZebvJik6jybMyujyGZ3s1lJ6fvP58dvsh5Yxh
	RdO6rqsAGiq+lu5UJtzxsxUpuFWB9nHoq/LXKEblQKpnCdwU4hBdpUvuiR7RFlnf52AAVLYE2kE
	+H3A6yGwqfsyCOH3iCTtuafHQ0+ZgHkSLYWCJcxLtTQgTMbo0fJGOX1zyGN/PgSRlutz8l00PsJ
	pWZGjWOfD8XaDuzXRXhM0e9LXQiqDn9ms/ug3qGVIwDAg4Ddnh8kJMw==
X-Google-Smtp-Source: AGHT+IF4uL0UE6/IVMLL8a5IBc0w9BS0oX81DCNFSPt471frTtvJ5jahdDuVoKlFV7+0mFnbfKekmA==
X-Received: by 2002:a05:6a20:6a10:b0:203:bb65:995a with SMTP id adf61e73a8af0-2390dc51b64mr2966437637.30.1752735496874;
        Wed, 16 Jul 2025 23:58:16 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:58:16 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
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
Subject: [PATCH v3 4/4] drm: docs: Update task from drm TODO list
Date: Thu, 17 Jul 2025 00:57:56 -0600
Message-ID: <20250717065757.246122-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717065757.246122-1-me@brighamcampbell.com>
References: <20250717065757.246122-1-me@brighamcampbell.com>
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
2.49.0

