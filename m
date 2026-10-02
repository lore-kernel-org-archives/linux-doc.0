Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF44E235D
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961114; cv=none; b=poUAweaNYUF/HmoTDXWmR8o3ZCM3VZOiCLMQULW33VOSQiUBxVk0GmvIjx7rwHFk9lqnup5DMrDRtEWP135V4k5ApQ97aKDqzGE/iKGT1UKGIcWLNgSHT3w4Be++qk6YopagH775yO+gvyiJhC9ST98gWrS49MtPerjly7H0XAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961114; c=relaxed/simple;
	bh=Ef5o4GnVLBlkippatKHOc1IZ1giISH+odHamfdzA+t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzIZrvyLapW67GwsFOKUNSyvHJ62TAi0qEVkgIJk5rAYJFwOFjiEV7kpfMbpjIOkYsbo5XmrnOt9NXQmkTgwS7SHkqMdui7240lSqIZ/1XjiVCXEvyR5bNt8J8VxNJeJpz/iWvveyEusUoTuJdfcEAzwFR8h69Jbo2pBgvE7KMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQdrJ43R; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQdrJ43R"
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7bf43e81472so1004157137.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961102; x=1791565902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Be1LqdyQnsq1krfCanY5EPx/8Od8qHDNhwKbxHFNN+Q=;
        b=IQdrJ43RnfvTxI/RZ/KD+7GHV/LvIHDzIF+6OUY7hZrPDB47aeRArdPC+WftQZ+xXv
         L3S9SSbHJZzk8CETqDthfOWtdHxJHQRX7PJTI84wBMu/r/rbibQ2lS8hlLBghxV8XE0R
         5v9QdSUoa4eXJfswHAwyESoavYjXAWALaoYg0Vi2WFbcUkQ9LPpT8sfABAMVb0ZWhVRY
         CUJ/sdxHk2AIF+FmzV3fritqbvPOxQOdi3MHg3825UIDspLHVVL/zYATmlDKO7U5iOFw
         xNlQykqmYVL/dQDreHTe+ZrWhNHb0iDHq0nWGB6W2sMdyMw1+f/iH6wR4XsdtWXKPaKX
         Mqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961102; x=1791565902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Be1LqdyQnsq1krfCanY5EPx/8Od8qHDNhwKbxHFNN+Q=;
        b=DjupZnXibMMiw04DbP4qfRRTZDECHt0+NiPRL5eNXS7xlQi0w8LG7OEqTEtUhr7Qhi
         TkxbYA+rn45yHKJ0KwQnVV59rNuYG2sYAYeIVtfC63QVE5q7KKGnnMv2QHi3HCEHCNjV
         tQrgI2WFrmYXdtf/9SCUMnKtuff6ZbPzkHHQmSbX6R1SSuzUwn/WL4HOYWBjM+b0HlgW
         FEbw2ijTJln25RMrLh2cX2DSCShhOtYrGnPNCSrY51PbF57sskgRfMZ+dTqCT6h8eoxn
         ViMYN1kaGdzbB7Y9BirFzzxvvqe61C2K4BHhLcA49f4nGd6OKKceNCzHFit9HVTVmqfB
         t2EA==
X-Gm-Message-State: AFq9FYJlgmPYf9vG9EZoiQI4Q1++2oWcc+Mu7wTyuexD/sxffzXV88qE
	cPuCeTYcGxzXrlx8JIGnDVN6pEFeW4XZCq8KnfAXAmc1bovxd2MmMveZJec4CXaj
X-Gm-Gg: AYBFou0ySo/E9aJy+fR2z7uodxWpGdN9Ns7yX/TEwPl4bv8e35uuOTXp/IDWNpipOxm
	6KYbWqTs5mm7u/ooW/5yVMB3Dt3T5VXcd9wqpnATTUs7oJLR3J9Si4KY9puvOYvj72PHECv0OSd
	UVjq0kI4K/+BU5ar51t96JlRBtV0ARAN91CX/aTIWSjPEi0Mkca0+lXFmAmMILExG3GOyfG1GV/
	tzdBWgOPVhiGNpt19yDtA+J71VDvIYuyM1M/wquRf36LX2NYf2Uvkyut+qOxtwSJJJQO0A2JfSb
	Yf3B4BcypK+P8bFpnhTjDJ99hyRwwfr0eBPprnvB+knkCXR/k2smQO7eTuHbIHQLq4Iy7HqKVUC
	sle+ZBTE6mKfeBeeDel4HxHZzcB3YGNjTNGtx2dXnF6DYnFStrGhM5pc/jIu4mTXNQHY3UvMSKe
	VhKMHlGZFxlA3ORvKU4XBsP6fIam44jMcziDIrQ3m8lJqvi1llKc5UKczGjFz2PKuthZuJ9cJqF
	/zCk/YC17xJtBLyW6gbnt3HQMnV95gXSl/kICWkGbqIXycgZKDi4gujc4mb4rRZ9uONNJ2NKvUu
	op5qHFY2Hw7J1gYqTKvXdoHS
X-Received: by 2002:a67:e708:0:b0:7af:7d6c:495b with SMTP id ada2fe7eead31-7c0f1de9f7fmr645637137.1.1790961101913;
        Fri, 02 Oct 2026 10:11:41 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da635c7209sm3947605e0c.15.2026.10.02.10.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:39 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: [PATCH 00/10] docs/translations/pt_BR: admin-guide: add multiple translations
Date: Fri,  2 Oct 2026 14:11:23 -0300
Message-ID: <20261002171133.50969-1-danielmaraboo@gmail.com>
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
'make htmldocs'.


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
 .../pt_BR/admin-guide/bootconfig.rst          | 423 ++++++++++++++++++
 .../pt_BR/admin-guide/cputopology.rst         | 105 +++++
 .../pt_BR/admin-guide/efi-stub.rst            | 102 +++++
 .../pt_BR/admin-guide/features.rst            |   3 +
 .../pt_BR/admin-guide/hw-vuln/index.rst       |  30 ++
 .../translations/pt_BR/admin-guide/index.rst  |  34 +-
 .../pt_BR/admin-guide/kernel-parameters.rst   | 134 ++++++
 .../pt_BR/admin-guide/perf-security.rst       | 328 ++++++++++++++
 .../pt_BR/admin-guide/sysctl/index.rst        | 108 +++++
 .../pt_BR/admin-guide/sysfs-rules.rst         | 195 ++++++++
 11 files changed, 1501 insertions(+), 14 deletions(-)
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

-- 
2.47.3

