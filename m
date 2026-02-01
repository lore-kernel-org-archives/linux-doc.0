Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB45287268
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769970828; cv=none; b=LV0LrWLVvdKUGmlobRSx/RYauuGOh5kQ5ZeGS3P0UxEkoycuaLx+KSp6x3GAy5shoVRjoeYv6Bs4sxG40PMVwiZ10jGql7W39dFjoeC0DQEMx1CunhleqJZSsLF1xYz1t1uzPm7Y/+1OIenC1x3+6vU891hz34FEsBNtLQWppKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769970828; c=relaxed/simple;
	bh=9aHRWQRIj+vjq7aojPwZL22fm2LfK7+rNgxELwFuuaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvZZtOtK0npS30ifx3GFPVqkmAmO/5F054mEUkrofU3D7eru0l8spUz5PZMvStRP1zbkPo+gLn8AifSPVTcYneRdray9tQjCpNPNqn70vs2tSxILFSahRhiHZA6Dg4eGUe0JHNN6VkUSJzJbvacOdOTqbC6FWmoQ+85Jn60P9Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BR0h5R6L; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BR0h5R6L"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so29163255e9.3
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 10:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769970825; x=1770575625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TcfKK1uOL+FesMU0XVhvzXmDqRlJZPCMwhVufj0BSo0=;
        b=BR0h5R6LVGfH0tfCQCAEQb/0vWuK/xFRFuyNVwleUEo8l9QpiyVy7NlSx82+Dk8TbZ
         0KeBwzLECaKNXmuHFSAhxK8NKmZQlIrdgtUfDE4m2LNDnKZZBFEHMOIIqK1g3sUcHuDd
         /b67jfVidRmC8Ozue5HTCdzHU9Sf1naIlan5bX3AQkopetJ3dR0cFojzc9LQrWfHSiNe
         aiV5/rEz2tjGnP/tAiBmRxuT1v+E9vkBZmB5P94BIsvaOBAnzzhq6CcHTUwiwEBQGwF7
         Gz0TvASRdo38a0rdeznpf6+7keGJ8PbOo8X/dcwBeP171ns5U43qam3M/tvi6IQ9VyZd
         ++WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769970825; x=1770575625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcfKK1uOL+FesMU0XVhvzXmDqRlJZPCMwhVufj0BSo0=;
        b=Gp+shogkK1sgZQCv/Ow6KNwP/z9I/9t9RDYcxcuO0tGaaEVIAmVJrQGkQDSZkkhQ5w
         ja/aOeTg+HRS6hkYGaCkgNCAt9WJtXDdk4efqTKywI/dpoNnJDs6yCDBq5TkVkO2zDPl
         7R4Dg1S3imsxkF09vQuDs5rTvHq6qpIQlwlZdNOucTvb4rFXd8myKC85WuL01OEEH8hY
         yFiFjH504l/5ClOK2oGYdXkWMwvE+Dmysqyd0ScFR1WmE5fAsATEd14o2NqLgTExVFnQ
         9Kru3FYK8HUgvQLTfvlKT6Kzn9vhbGfJhgE5drJRiY5GRlhYgDW1GcGscjcvICSyuf4i
         Us5A==
X-Forwarded-Encrypted: i=1; AJvYcCXPz42iwUiNwraZ9N/M3I/u/ihp7J5NWNozv9eqNyj5BzKUhNEQ6MJFgD2V9XRXWSZ7WKSHzGp+QWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+UIjvsSUo5fZn4P5uvsZ8Z2iG+vXo6pcb9sDDBoODbrcSyUr
	EYIlGLVChP6Dx5FkIBVI2nkXC6akydjOk7v1b9dXipgd879gS9pig5qk
X-Gm-Gg: AZuq6aJk/3A4Nw1ULmD21MxGD14SR3/kNrMgXmQoK2QKo5SruCO0OUErrDGNzCRuuCx
	CKE0Ml0MlLXa2NIK1mDLCoQvff0Vw3a7WX9K0tickIh2qsDTdeLOARYrNjFKJZ9MrHVVbriAfZu
	pYq5Y4VjPGpTafRMwwZYuBpZScLmjtU6R591T5i1mUBJlEhye/3xCtKVWmFlHuFWWkPDjKIozLP
	253PtBmcV87cxvOpDxoUeAiTfcko705DJQG9vtusyKDOQeyp93p47NQm1eAn/SSxxNlW3/0gMc+
	V1IdcMi+YWEeOF1A1wseXMi/3Aks9xYBn9PBp65JU+QEh5ekWWCXEjTxihRWU/goM4DdtgxZPgq
	24yys/PNz5cCC0PBfJpyzAZdH6qH+Q1/8UqtSYTbTakHAjEKAn4dxkaf25Pr4M1cgIvvVJrCU3f
	WKlE6AuSBLfArGlN2H1VOIiPKanMHz1QgYeX2uqmegpFHXrw==
X-Received: by 2002:a05:600c:3586:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-482db45237cmr145131415e9.4.1769970824962;
        Sun, 01 Feb 2026 10:33:44 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm41400084f8f.13.2026.02.01.10.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 10:33:44 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v2 0/4] iio: accel: adxl345: Add event scaling and doc fixes
Date: Sun,  1 Feb 2026 13:33:09 -0500
Message-ID: <20260201183320.27023-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses ADXL345 driver non-compliance with the IIO ABI
for event thresholds, following feedback from Jonathan Cameron on v1.

Core Changes: During development, I noticed IIO_EV_INFO_SCALE was missing
from the internal IIO core. I've added this constant to the iio_event_info
enum to allow proper ABI compliance. I would appreciate a sanity check on
this infrastructure change.

Testing: This series is compile-tested only, as I do not have access to
physical hardware. Implementation is based on the ADXL345 datasheet.

Changes since v1:
- Added core infrastructure for IIO_EV_INFO_SCALE.
- Implemented event scaling (0.612915 m/s2) for ADXL345.
- Fixed technical math/decimal errors in existing documentation.
- Cleaned up grammar and pluralization issues in .rst file.

Many thanks to Jonathan Cameron for the detailed guidance on v1.

Taha Ed-Dafili (4):
  docs: iio: adxl345: fix typos and grammar
  iio: core: Add IIO_EV_INFO_SCALE to event info
  iio: accel: adxl345: Implement event scaling for ABI compliance
  docs: iio: adxl345: update math and examples for scaling

 Documentation/iio/adxl345.rst    | 63 +++++++++++++++++++-------------
 drivers/iio/accel/adxl345_core.c | 28 +++++++++++---
 drivers/iio/industrialio-event.c |  1 +
 include/linux/iio/types.h        |  1 +
 4 files changed, 62 insertions(+), 31 deletions(-)

-- 
2.47.3

