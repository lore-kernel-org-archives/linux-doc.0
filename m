Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96727388E60
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 18:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559018; cv=none; b=c2uzglgzJQlY6eQOi7uD4uXuSOL8mFNZqmsjMIG5JOlfF9LdoFKyj3J9rNkDsK1aER2PXNtxmIWrdY4As2QiaaXysXP5Eb1lgqZseifpRe7CHaXZp87fnFXjx4l4nObYh7BsNUJhZlu3Uc0v6nKVAXYaIFEzCWj8ijfI1NeS04k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559018; c=relaxed/simple;
	bh=GZqyKZ81RuKlphNG14pN6LD/PXJnvH9pE37nDqR4aaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXMnNRm34zIsklSJ07mvOIvafab3dPgrdCdgN85XQKar4/NQTWcQe1LbYOA0sqnsjghZFzwXyskAMh2i/1Pw41u86WgYxo6tSfbSgSs5aqSFNXl4GLnoXThb5Nfvjaiz0lmfOmI47OKs+pG0fG4rVZemYz/j3ZXPCn4U9ssAczo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeIwdNZo; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeIwdNZo"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8486ac3f347so149874b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559017; x=1787163817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXgIBNxtiKkYxqb/2qLnejJ8TShPcF8oI0mXFfK7z2Y=;
        b=SeIwdNZoiL7RXVx5hphwIM5LNop5ANbcP6fAbr40PVSzWoLLS1cTVZiPJ20UaNj2r6
         0t+9coIDGsvnqiDZ1bhM7bwHae48u1AmXyklqj0/jg9UgE4AwCpv5cwnAaTYTy0cKi64
         gLr37FFzBm7dE75PpUAgnmNTjDLvHeHpe5enqGcHufvQQazWEfKG90L2wkO4u3Oqk4v8
         NSPQyjKbNZcp4mdss3cg8LvUf/C6uAldEpt9IB7lfRGcNhJtkWjYygY5cqB64cvfSsWI
         ydPhlzqvWP/iZAk4ZOXvAIePA2O5L1sZDIoWfPPKi6AG0OXZSIDozyMCu2CiD3LnQH/6
         EuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559017; x=1787163817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXgIBNxtiKkYxqb/2qLnejJ8TShPcF8oI0mXFfK7z2Y=;
        b=GjGEDz7wDK3jbTtMtaJgIuPBRGk39uJiuMCYtPPHeg9KD5U9GzQOogWUo+EW9sKMyI
         YzWc3N1YwsKVnVLYPpcdCEA5+156bOrlK32m7jiVwnxquyOBAm+iJ9lA9cMiDQ6OC+2U
         IIGIxszNUyP0nEwHaXsIne3FNfxZQSVfO4MyJ5zQbqvkEDIt968ui2otEWcDippFnXtP
         V8Fjtsiyf0UgjFBBeDqhv0tQX8QRtL9vkChb6+A9nYJgk7YI22c/DoZBk/xHAlABtexj
         dAmwQLAxU9qvjq6/H2PQoWPtTu30AS4EBoAAbU/a0GghbSgctcKukDa/iuDHX52nV4HU
         gkoQ==
X-Gm-Message-State: AOJu0YwFOblfrlfI6T7N0xkXghbfHDXMWVSYQJ1lbiliJYpZQYIveDes
	3VPtJVNfLtkUUgc7NNl6KkpAH2gY85qZk8Mjs9MFftO9rfRGgYVpeHa/
X-Gm-Gg: AR+sD12uE292UWAdTWmKlJVQHbViSoj51rbOxncQ/gAm1gf87M6nY0Rr6okL+VRnm48
	5uvxu0LC2vdL37Q/wJ5EUSc0kaebw4zKQDUf0o8KgCi/yqAPV/dKRpVMcfSxa1gjeUnjkwDJhec
	tSvguD/wcxWugUS1tU4PB/PggwV4mmaGk3DLnVpKwITRb166wRW2PHzTWOx5fsSpAegsDzsxYNh
	LfH1zruWBIBEONqXsp8X9KTK3HnFLWDkSViS+H0dFZZgaXSfDRi/4mTmAbQVZJFuCl+2Q6vOfJ5
	B+GHouJDo8d89KAXm/7cHuhcRNMELdUzIpBhwk7tRqgVHjSVzek9JGL3T6y38UXMrZv/V0GZCq7
	vXnQqxK7e7Tz2IBG1CEih3oLNMlxZpBkEvbcajVqVI6A1AWEH+INFyPG1j/7Ch08ov1gkcP9B8A
	6Htelds4r7dadowgBzIg9iVmsbvhk2lz2kF12Ecyt31hAKOPBuhNI1ReY/hFp8sOlJqGRLmJLGc
	zE=
X-Received: by 2002:a05:6a20:939f:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cc52fab6eamr1484144637.5.1786559016660;
        Wed, 12 Aug 2026 11:23:36 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm12127695eec.7.2026.08.12.11.23.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 11:23:36 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org,
	wy@wyuan.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v3 0/6] docs: sphinx-pre-install: improve dependency checks
Date: Thu, 13 Aug 2026 02:23:17 +0800
Message-ID: <20260812182327.53694-1-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

The Sphinx dependency checker currently does not provide useful
installation guidance on macOS and only checks whether a make executable
exists. This can leave macOS users without a clear setup path and allow an
incompatible make implementation to pass the dependency check before the
documentation build fails.

This series:

- documents the case-sensitive APFS volume needed for a kernel tree on
  macOS;
- adds macOS/Homebrew dependency handling, including command-line-only
  MacTeX support, required PDF font casks, and a PATH refresh hint;
- checks for GNU Make 4.0 or newer and honors an exported MAKE before
  preferring Homebrew gmake;
- teaches sphinx-build-wrapper to select a compatible GNU Make lazily for
  Info and Rust docs; and
- updates the zh_CN documentation in separate patches, including the APFS
  guidance in the contributor how-to.

Changes in v3:

- restore the PyYAML availability check on macOS, as the parser_yaml
  extension requires it regardless of how Sphinx is installed; and
- move GNU Make version parsing and command selection to the shared
  tools/lib/python/kdoc/gmake_detect.py module, used by both the dependency
  checker and Sphinx build wrapper.

Link: https://lore.kernel.org/linux-doc/20260810143311.57775-1-chenmiao.ku@gmail.com/

Thanks,
Chen Miao

Chen Miao (6):
  docs: kdoc: add GNU Make detection
  docs: sphinx-pre-install: add macOS Homebrew support
  docs: sphinx-pre-install: check GNU Make version
  docs: sphinx-build-wrapper: prefer gmake
  docs/zh_CN: doc-guide: document macOS Sphinx setup
  docs/zh_CN: how-to: document case-sensitive APFS setup

 Documentation/doc-guide/sphinx.rst            |  20 +++
 .../translations/zh_CN/doc-guide/sphinx.rst   |  17 ++-
 Documentation/translations/zh_CN/how-to.rst   |   8 ++
 tools/docs/sphinx-build-wrapper               |  23 +++-
 tools/docs/sphinx-pre-install                 | 120 +++++++++++++++++-
 tools/lib/python/kdoc/gmake_detect.py         |  62 +++++++++
 6 files changed, 241 insertions(+), 9 deletions(-)
 create mode 100644 tools/lib/python/kdoc/gmake_detect.py


base-commit: 8492d4e6bb7b9b1e78f2d17c4dda5272f25ec118
-- 
2.50.1 (Apple Git-155)
