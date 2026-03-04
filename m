Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1486033C52F
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654845; cv=none; b=Kv2gDRhMwOhlJ6MVjJpmmD3aNZ1VX8nZRNtgghPi5XSjsHl7CvZE86TsG01bB+Wv/2ko1a7mXheixvpZ+XvtmJbx/XDons05KmsXr6gMmNaeGw8ZNfygh7nUIYu1e2aAzeiuY5xG2TA7DMgm89NQFJSMPM0+bv8UokirS+djZV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654845; c=relaxed/simple;
	bh=EoYle/6JOsVNqnXQzbomRgDTXDfhqKNgorkD6gNFOcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KX57Vu52R0icQtQ+SVsDGGmKxdsO6xvrJZIJEIgMcjRS1iV8rpxFDnk0RzRsGZVY0Ct/VJPg1zo/Alkmzf/ZvaA8R2z7aGfKQgaghJTsntX402onRmkjk7swpbe4NbRMBOlh0F4HsAODJcpIhtf5UG1tF3hgvs6vMxYzwqDFq9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAANFyTl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAANFyTl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4837907f535so65360805e9.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 12:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654842; x=1773259642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiNPyYsvz+QyWtSc/HtTaNZa5g2oofeCtGK50tm8P1E=;
        b=UAANFyTlM6t14vrvIP709sxq71AF1N3tPyKlaj/UQQM/HCE2+zA2N+Gixc96yN1wa2
         16o3oDXFn0YYgp3LN+hFyvqjkL9oTbq9kOnX8r/CobD7M9PLAVmAz6PdrcgZ3fqvEeWA
         AGiNd5oc5EY2wNaNB6WdQkj4KIKtBc8bvS4Kdy8ER8/rciQ0Dhpmr0xmZ6HP+Xo9t2jK
         nBgNb1tvw8R5EGPC0LIZmNy5Mts+zizrTlAWqzwIGNxrAchaTVMmang9dWfx8YBHdnDC
         +dvwYjoQSuqWXg1vJoEMC3KNwBITsztxgXFAZOQSKhK0DpNSEjFyqojY5qZO7/9OafkK
         nFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654842; x=1773259642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZiNPyYsvz+QyWtSc/HtTaNZa5g2oofeCtGK50tm8P1E=;
        b=F5XfbQGpRIVTe6kuplvL4yOewr7rwfvZF8wxTZy7Zpl6whyGbO81j1X58DAnZ/jd2H
         PD3tAIGdWoawAT7ZCxDTqe5VTw/RqoyYr3V3npDau2srcwlvMkk+mUmbOCZk0/3n99mY
         K9qKnFzbIKqHZhpaTWeTcN8JD5H5NYNTiKRr/v7f5RC/1VNoF3LwHyoCeSWX5LYiKEBr
         lm8JnUEfII5jranCy9IvJU/vUq+Yu18y8lY+CEnAWpPY97wC0mKYyLRICg9Buwr/vFLv
         oZNHxDDEPlHnuHSpMet6ZauMU8cmvo/arROrLY4RVM6dEJdI1/DQGJSn2/WV5/rkZHoH
         WLEw==
X-Forwarded-Encrypted: i=1; AJvYcCW6LJLzZG7dt6cGZrIWnr6vP2IdwctqN6Ts1o+4YKRwTLcCIBfkNDcMqw6Lri/JunvdVS3ayStoP2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpVeJHDGSTXpYUTcEDipQoggT7MfpCcsvy8zheOQ9WOhU9qc9i
	PDQrNaT20SOk9krXIgkQh/dcfKlh3tP26FF7A6x7ebyvW+nMAaENQK3T
X-Gm-Gg: ATEYQzxNJGHKIg17sloYMTE8JYGbFHq9GVJ7UwoltE2JQ92qKRW+gn3gPUkm9Og5e0h
	7X6XnjMbD4puJcerEzDL8iywbB97qV+eBWllGIDTsacqzPHF1y38Bt8BcMrQIy/Y2mWYSn7mfJk
	oB+atZidWK8NU5B8XAdb/+t1rL7CvlaFIe/vrpjqZLokC9Z5H6O4uiVAyGckzeTryxs6wqEr1t5
	dGhZsoTnTkB7lBvLGvdSNlPTZEFsQT0Vb6XdcxNdQ6SJ5Fs8Ygh6t9G3e3psTS6B1K5CFTqTmul
	cxheCXWeXEkyomzG1I05TkP8UOM7YXSdYMce52xZTRx8HthhXWqP5YCmWOXdkqhq+V+NdeaiuUx
	g1FRGKUTc+j8poRsyOV6xSdsbNSQdZRq5+mHhRi+hkYjAALrnosZDxFN6Q7FjOfQ/VGhd1UPAZe
	WY0Qs85OxbeXfKNIgRScsoHpUjTgpLLV1FgOgWi43wEBOt7p8o76vwboLX5KsbYcNhwC+IHj3E+
	H84cUb+KoFjXrkOEF8RzLD6rnEOJluE5ReJAMifgYz9bEA=
X-Received: by 2002:a05:600c:1c26:b0:483:71f7:2796 with SMTP id 5b1f17b1804b1-4851982e8bcmr55862335e9.10.1772654842178;
        Wed, 04 Mar 2026 12:07:22 -0800 (PST)
Received: from localhost.localdomain ([80.233.57.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851881224csm68872885e9.13.2026.03.04.12.07.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Mar 2026 12:07:21 -0800 (PST)
From: Edwin Toribio <edwin.toribio.j@gmail.com>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: carlos.bilbao@kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Edwin Toribio <edwin.toribio.j@gmail.com>
Subject: [PATCH v2 0/3] docs: sp_SP: Add Rust documentation section
Date: Wed,  4 Mar 2026 20:07:10 +0000
Message-ID: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series provides the Spanish translation for the Rust documentation
section in the Linux kernel, including the quick-start guide, general 
information, and coding guidelines.

In this second version, all documents have been unified and updated to
comply with the feedback provided regarding style and technical accuracy.

Changes in v2:
- Added new translations: coding-guidelines.rst and index.rst.
- Standardized the use of "p. ej." abbreviation throughout all files.
- Fixed the Hacking section truncation in quick-start.rst.

Edwin Toribio (3):
  docs: sp_SP: Add Spanish translation for Rust quick-start
  docs: sp_SP: Add Spanish translation for Rust general information
  docs: sp_SP: Add Spanish translation for Rust coding guidelines

 .../sp_SP/rust/coding-guidelines.rst          | 543 ++++++++++++++++++
 .../sp_SP/rust/general-information.rst        | 178 ++++++
 .../translations/sp_SP/rust/index.rst         |  45 ++
 .../translations/sp_SP/rust/quick-start.rst   | 384 +++++++++++++
 4 files changed, 1150 insertions(+)
 create mode 100644 Documentation/translations/sp_SP/rust/coding-guidelines.rst
 create mode 100644 Documentation/translations/sp_SP/rust/general-information.rst
 create mode 100644 Documentation/translations/sp_SP/rust/index.rst
 create mode 100644 Documentation/translations/sp_SP/rust/quick-start.rst

-- 
2.53.0

