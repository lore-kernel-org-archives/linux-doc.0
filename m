Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50D298CA7
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 07:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960358; cv=none; b=BM7wF64czU2pf49A++L/vmIfzKktux2fv64cNqEM6dcy4tWhvU6B+25nvDnwXO3skLv4srQaXtvRVw8tD+HW+MXeT8zKtDXz82vxgnZHqPekmqOWWdtSP2vxJe1fjNdz5FHurNHEObphf9e2Kaxd/K+4bYlvyd58JGwEcb2922E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960358; c=relaxed/simple;
	bh=NXVzBmkzjs0qIwDBa1nvJlJYPXA8UdnEYWrKccWXZxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDwhOvJJo4Go+oLbcnzQ8t1HBFKgjt6MWFHby3TkJAYHci+UxZCd5EaQKOIOpjveaMpfqBws47uoxsycgIaEP3aGfD6+sqj7rBSdXwoFZ0dr1atGFJPApQM545cp5Z2UR1CHBIUGmAzntQ+sAz53xiGSV1AcFPlg8gEn8Y0PgDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=E/CYIO/J; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="E/CYIO/J"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so3537484b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 00:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751960355; x=1752565155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRg4Q6pPPZIs4EHGk7HynlZtava7RS7MLv1CsBp8mUo=;
        b=E/CYIO/JbPLEtM8mPArGAYLcVPQ9VbVOC8uHoSLrsmL/DC1vixzrcI0IfjKn9yPytZ
         GWdnkUIjULcVtJzhGG4ZrBjvwdNS7z0/IoZwSsGTi23YLZVAH+vXdBJDskPG35HvmHMD
         g8LioOWFDWLnLUSmRDZA76t94TXQQlhlqv4CNMri7B7pZ7bbp/Nt/XPgMlkMcpMQbQ63
         QjrNe63LieG1MkFkqOR7uH5CVjvTdFw42YPhRdQproxqy9yYfXcIqbfCIA14zFZn/jMd
         EbaK6Zi97apWYCKoWVVW9TDzeZIae5vL2WAxivwwUZMDEFR7Y1nkbRzZRWUlLZass9xw
         fUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960355; x=1752565155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRg4Q6pPPZIs4EHGk7HynlZtava7RS7MLv1CsBp8mUo=;
        b=ZpjQcJlppAuu5zi9DWclDK18OZWWdbsg9NdBxBQCbMmYFZQzHA5hU0UKhW6yXFMmSV
         Y9HrrgC6kEffOJKOubFk7EvlmrinXtKbaIPJPYCsd8SNCUhgdBTsaBh9zGhMLLBWL5AP
         YoIG6PWNTvs3OGYmblSwOdem9768AS4wpuUST3z1AXNG5MiM2A2pdHe1QFXM5UI/XptX
         DlNAgL2Bw/UV/bsXGzWQyXt3BLxh1NMl08haKy0WEa+O/tUqkfRCAYCwLBc8xP9Iy8xy
         pqONd1V97fCEco1o1S8IvaL8+Qtlrt4zoGW0mB6wrMtYdlfsvSAIREv+SF400YYrL+7E
         MX7g==
X-Forwarded-Encrypted: i=1; AJvYcCV2cAf0qEtHZGECC+24t6wSJZwr2JUK72pmrLDrk85o1mM3O24iZ7U2znF7KuyuymJMi43Fb1WXRlA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7AU0tSwlMjpz5iaoP7Um0R1nIN9ZmOKOBLpOhU26zcZpVxTRp
	6UckXdfyR+VND0IOgU272kQxCmFIlTNmitewNCZqlscaLbLa7yTSS1KRbzRzolYJltw=
X-Gm-Gg: ASbGncvoPY0kBAZP7MI4eA1Zl8/tQHIcjsYEJ5jDs7kKK7Qqkyguxg2BQkfh8u5APqb
	M5o09EgRcDpGyLftvEknDY9GOvzDjez3gIivLum/joL+8kniRA+Y+B29tO79qQBdh0EWSnBtsMZ
	uO/6VCmFG2vU5dlmrVXn2Z2WPE+zSJoqJUQjt8LW361bBm+pDDJLoSB8dSHgwTkKgxKldE12qTU
	t+Wlsv3UUVhxf/+9rAGt48+BvyxFWC6mXfKR3mThzrHMDn0Blw26e3mFexoAx5nntub52tzVUiZ
	yHPfPnQFb0ZJYC0RT3uFy9dhNIt4cFOu8374RzggAY3K90GhehIV2YK5bZAjoNZMiSGvM0/fW1e
	AQcO/zHbvgxiFoL2IRKa2bEV1rhBl
X-Google-Smtp-Source: AGHT+IEnB2D8Zt2lhCwV3+7VTxWI7MKuZHKxw4k42U2GFJK7fV9zJULR3jSg0DBPKK8gXEtouNDbPQ==
X-Received: by 2002:a05:6a21:204:b0:226:d189:bbd9 with SMTP id adf61e73a8af0-226d189bc3amr13874192637.18.1751960352969;
        Tue, 08 Jul 2025 00:39:12 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:39:12 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
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
Subject: [PATCH v2 3/3] drm: docs: Update task from drm TODO list
Date: Tue,  8 Jul 2025 01:39:00 -0600
Message-ID: <20250708073901.90027-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708073901.90027-1-me@brighamcampbell.com>
References: <20250708073901.90027-1-me@brighamcampbell.com>
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

