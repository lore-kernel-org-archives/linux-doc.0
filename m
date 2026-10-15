Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C251B16E
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064071; cv=none; b=fy4mFtM9FosvxJyU0+olvFZRoAXnaBYcu0jqwGoRhqjbv1OCSiiZin9VPf1r9+IeLF3ONdqwtx/BwLGVkXv3/nPsZZ8vYqt7xFVnHi5ir8DgeqBzBJrbH7fPwJdoDW7PdFtD8AqwHEJVww506iirqbgPD5YTHqKLkvtHlJp6Cv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064071; c=relaxed/simple;
	bh=fMhh+As12S3nR/iURiRUct1XBwgb+4I9PkfgdBveLy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dr64ardr8SuDNaTINuuWde2NQA+CoUq3CYG+uouRnZthf86w5pcKGwaYUM/9+WvGO8M8oav0SDo2jOIRtkWHSeHeyvDQ85uKLdaH0oHVJ5vFJgESmUILMaUFO1laYrRypG1246gY4pAiRUawoKYukmchf1iL/1FKC2Qy6SVRIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sWvlMzhO; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sWvlMzhO"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3049836eec.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 04:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064057; x=1792668857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sqH6Etq1dF28Ug85NB55VFGwQmAV67ee0QqxAVFL824=;
        b=sWvlMzhOIb0yEApf1Gw6WBCIDs8WdWsMP/PCgkJrRSANnPpPvkc2UVWqRFnUl4Y9HI
         oo7D/qTvOzz2YqGYvOgVerwzo5oJN2XGxfhk9825yyI42PzMZQ/JOOD3BNKIZDbtxdHe
         5PnYSmi2WMgaBO5a9Vh3wHpKdXRBdOxHihc+hDLI8qxKdT7UNYCkEPTgUYtlFKqB9R50
         AVsLAX3vdimHn8kjg1Sz5Iclc6UY5GUUR2g4lDtCNwviyDtyeJE91goxM+sHEGIGdYAc
         wODfLSisdTBpzc9WCAF2LH70h+AF1Yx+qdDPkKk+9dYPzwhawaZJJAsPwd9YkZQI/dfv
         F3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064057; x=1792668857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqH6Etq1dF28Ug85NB55VFGwQmAV67ee0QqxAVFL824=;
        b=Xsygm6WRAEGALoUDNN+yNAdGDou3tUFyFHZhco+5Oc2xxJkmU7MDUmKYX9mw+wCfas
         ixnKg4ZNve86/0KZnsJw/CBGH9zJV1MerROjusiEulRu2n6QUobtjdyRNsMHEvbH2E4F
         upUoP5Xe/l3cUEldb5NF3DJKBnzWhg8Z1lsGCbB1ZQ+89b7zIs2jSEA3+fPlFaIVQru4
         IvRIgugh3JwxdlgNQdNgnjQeNj3+b0ZjICwGoG6ip3gyMfnIPBOAbgTHLqIqEJe/Eby7
         R/sHHNiAjJRp30xP5Gw3yRMNy0S4zGOwxFiPlk4KIIj6xIWbDhpRgDe3YYiT592sYEO8
         UtzA==
X-Gm-Message-State: AFq9FYIfD3h05zp0zb5O1QpZCYg474qipE8t8At5xAwsxUQYc8b023tx
	2i65qZWbe7H9XzqZjsw8/83uMQ9xsz8F+gkbmOO9b5u0LaEFYEEsb5Qcb1ec9nMV
X-Gm-Gg: AYBFou1U935jWussqkS6pgLnPQkTGqZL+e0V/0DI6v9iCyNUi6trOH2yhkqsACEYtMo
	DwCQSqZ1Po3JxEBgBwSFnWpCFioqtXtgOPsHkeRffKSCgoReGCowj1KCDPkSzGARTVYMcD1w54I
	OKm6pgGHPQOPLJaknomYvJI5A+ewwaYb0En9B88Nh/mdihz6ApkVujQkCoESU0rTtAty+Ps6mR8
	aGeWUtB96U+Hs8/ZecRJlAAzt04Kuc1/XzZEQycAhGImMK5iy/NqjYPgCr/fsUUZlzCYgTWUbdI
	9aUbT8M4beWFjhDYL8Aq+WtdkXa9vJqdtZKUgQx2SOMsr+eiQcauxhEWzEksviGbq/5y8u48lkK
	UW/+T5i4X+apF+qwyXWqzIT+sZkcFqjOscuWp6c/kPFXRhk7Fh+UCobvIQHBadad63AFz3mqLGX
	LSKebJUN7OBvP7kLbHNdrATOcfP49QsTUhCuqCDYvyDyH6ZIBL+Yw31xqvhGu+XluNax7WCIwdZ
	AaxEIadpp4ASOvGoldmo0nWyHf4e9h/63jmfIfy+zbldPh5y2CsjSdr3/hXrKlMUFJgPbGOfHSU
	As2eY1g8c4sicx6JkkZfA7un
X-Received: by 2002:a05:7301:6e98:b0:353:599e:4f8f with SMTP id 5a478bee46e88-3537e013215mr26898481eec.29.1792064056537;
        Thu, 15 Oct 2026 04:34:16 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm69156913eec.3.2026.10.15.04.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:34:16 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 00/10] docs/translations/pt_BR: admin-guide: add multiple translations
Date: Thu, 15 Oct 2026 08:31:08 -0300
Message-ID: <20261015113121.4550-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Portuguese (pt_BR) translations for several documents
in Documentation/admin-guide/, continuing the effort to expand the
Brazilian Portuguese documentation in the Linux kernel:

- features.rst
- sysfs-rules.rst
- sysctl/index.rst
- cputopology.rst
- hw-vuln/index.rst
- LSM/index.rst
- perf-security.rst
- bootconfig.rst
- kernel-parameters.rst
- efi-stub.rst

All documents were translated following the original documentation
closely and keeping formatting, Sphinx directives and code blocks
intact. The admin-guide/index.rst was updated alongside each translation,
moving translated documents from Todolist into appropriate toctrees.
All patches have been validated with checkpatch.pl and verified with
'make htmldocs' (no new warnings).

Changes in v2:
- bootconfig.rst: replace the kernel-doc directives for
  include/linux/bootconfig.h and lib/bootconfig.c with plain references
  to the source files, as done in the zh_CN and zh_TW translations.
  Pulling the kernel-doc comments into the translation registered the C
  declarations a second time and caused a large number of "Duplicate C
  declaration" warnings in 'make htmldocs' (reported by Jonathan Corbet).
- No changes to the other patches.

v1: https://lore.kernel.org/linux-doc/20261002171133.50969-1-danielmaraboo@gmail.com/

Daniel Pereira (10):
  docs/translations/pt_BR: admin-guide: add features.rst
  docs/translations/pt_BR: admin-guide: add sysfs-rules.rst
  docs/translations/pt_BR: admin-guide: add sysctl/index.rst
  docs/translations/pt_BR: admin-guide: add cputopology.rst
  docs/translations/pt_BR: admin-guide: add hw-vuln/index.rst
  docs/translations/pt_BR: admin-guide: add LSM/index.rst
  docs/translations/pt_BR: admin-guide: add perf-security.rst
  docs/translations/pt_BR: admin-guide: add bootconfig.rst
  docs/translations/pt_BR: admin-guide: add kernel-parameters.rst
  docs/translations/pt_BR: admin-guide: add efi-stub.rst

 .../pt_BR/admin-guide/LSM/index.rst           |  53 +++
 .../pt_BR/admin-guide/bootconfig.rst          | 425 ++++++++++++++++++
 .../pt_BR/admin-guide/cputopology.rst         | 105 +++++
 .../pt_BR/admin-guide/efi-stub.rst            | 102 +++++
 .../pt_BR/admin-guide/features.rst            |   3 +
 .../pt_BR/admin-guide/hw-vuln/index.rst       |  30 ++
 .../translations/pt_BR/admin-guide/index.rst  |  34 +-
 .../pt_BR/admin-guide/kernel-parameters.rst   | 134 ++++++
 .../pt_BR/admin-guide/perf-security.rst       | 328 ++++++++++++++
 .../pt_BR/admin-guide/sysctl/index.rst        | 108 +++++
 .../pt_BR/admin-guide/sysfs-rules.rst         | 195 ++++++++
 11 files changed, 1503 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/admin-guide/LSM/index.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/bootconfig.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/cputopology.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/efi-stub.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/features.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/hw-vuln/index.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/kernel-parameters.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/perf-security.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/sysctl/index.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/sysfs-rules.rst


base-commit: 8fdbd353e6928492fdc46c359aabd2bfb7630fba
-- 
2.47.3

