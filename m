Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B1F542809
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958155; cv=none; b=cD9zbbhRyjV5iEw7DypVNgbR6SzIH+hg6UMgMpdtuNqujNBe5CJ1zcha9x2SX+NZJxOwlXRksIpob2KjYACjOwDHu0Zkl8LD/TWB0rotmC+aV6g4dw8dmlXeJfj9nfNZx6wa1yARZFaT7ERHisDQiNtiEBQZ3pP1C3FefQFZpNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958155; c=relaxed/simple;
	bh=HVTMmLVYwLp6YCz0OKYtWxo3KkagQKAyequNgJ370xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OV0xF+5qRqzJzUdp7KZ1NxKfe5vlLghSgV+FQ9XxztiyEkqPxXqvPfkCRUfBRbq3eZXcwaOTjNMuqpwH/UwGNJKAHPLr/ChgSZFCAXUqtQZtqsEzut7Q6+ZahHIe3tiSk8a3ql+eRCw1C3cNYch4PzcqI+6KH6qsPIx6LUUsb4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oy8cvmwJ; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oy8cvmwJ"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso4600745e0c.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958152; x=1789562952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uRRWyVirumsIRvgXPacGwmndq1YXZRIZO1K1Ey7KH8=;
        b=oy8cvmwJ8ScAbnKroHKa8lRA49oc4tF0nkT31OwSvUZYYFBWvreJCuv+kEZXdMJhaM
         c+luxzrEURIllNMCgMbZ1JonuSZgUfrqz/ZPhLRT3/mZXA74lc4QHu+no6N2saIh09OB
         WKadUWEl0SQ3jLGIWELz/0IYbhD9dBtw/on7pSaWjW7raVbNYeeXHJFGmEQFTsE8TK6W
         mRrq/nUyVgHuFga+v9IwV+JkS/qoxk5hlDN1rUltmIbk6EtdueGhQ1sCezxiApS2twCo
         47cwpal8S+EsUBu98sdCUR0nlZJekWjNAryHERlWvgxuwzB+7bWb6s2lTeeCfGEcaUE4
         gXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958152; x=1789562952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uRRWyVirumsIRvgXPacGwmndq1YXZRIZO1K1Ey7KH8=;
        b=lfSf0q9qnFIDMHGVy09Z8mnT8ApDK/ZItiHw2bWxKZ0fVkdHjvduB+NplsRICHyB+t
         WHUpuTo2if9AVMrcaf2UW7TJTxcbr6mHYVrVSQu3dKzNbqBfTXrlNCr6Fh08qcd7dv/0
         e+E8StIq7FvS+AXWGD9tXeFzjOR4pUtKcMz0+Yo+qq+UcqGToX1Nfd7VKof7YvSwKXB/
         XTm84DmV96Glragvo+Ljn6s11cehcL/ALfLvorpvxhiQDMXCpjJ1grPG45R27CxF0x1D
         btT/NfBDqZ37lcYXL45IxDH/Irnuk6iwK472O2xY/DieEGXxQrVGArXrGyT01sd0JK8C
         g7bg==
X-Gm-Message-State: AFuF++kJX1iwm++/y1ieAYaQzsY4Qhqp0FJpRkDFY/VkQJUK7UtahNBq
	L2oRXI67Mv5w0dMxUq6oxXPVPJMvzHSdk8FosQ6NYSLAmf2PRH71Ayk/Q5/ydIN9
X-Gm-Gg: AYBFou2dpSD0ZxsJrtrQW9+wFprZH7p323mE5N0zLHZIXJWW+3KQFH2F9eTWW2WFJ6E
	QS6q8y7crZ0rHR9pcIJGOxdivj1A2ks17tRgEU8YLEjeqgtkFbgSUl3+EYC4B20r/x2RTQMzOI8
	4LT3h+15v/rBUcny0m0XFWsqaJkd5B4YiFY9EKz/EBz/+lPjoW4gfkbFeEOWOAtdiBoEbAS+AdF
	OZTL5mUHajGaA62W121loL6eGmeMAmigZEobwhMSt0pu1RKImnaG0ukmKQKXODW2RE1EPTTDP5k
	dh03lppLgIPGPC+PYATGwEiZx2+qMTpJLHy7ImKCCaN8/RM261WhkhuWeIBptV7MyYS+laQo7SI
	tU2+/j1P4LKMvHo8ZjDbcpbC3jChxZWYXfRD4O1Qrucu1/s0n8ECG7sqhU8Rd+KUQg3SWMpO12Z
	4rAiiRyVWwozN5UAuRnFPYp8PRk+OUixJD0H7nhxYKmaX/9z3bXC2WDnqxD1bhIR6esz1M5R3Qk
	UNzA/hWM7Tyaxp0phC1lRCB7rTxVgvJEhWuFkevHJnE1rTrfx3xyNwHrJpWjYNx4kbSDeeZTNcA
	r60WHLShV94b0bwmEyKGlx2YsHnRsVPAa8um312kEbqhduU=
X-Received: by 2002:a05:6122:6213:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c7ed7671b2mr18362514e0c.5.1788958151723;
        Wed, 09 Sep 2026 05:49:11 -0700 (PDT)
Received: from localhost.localdomain (smtp.hostdime.com.br. [187.45.177.18])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm11993742e0c.10.2026.09.09.05.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:49:10 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 0/4] docs: pt_BR: process: Add remaining core process translations
Date: Wed,  9 Sep 2026 09:48:43 -0300
Message-ID: <20260909124905.6156-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series introduces new Portuguese (pt_BR) translations for core kernel process documentation files.

Changes included in this series:
- New translations for coding-style.rst, kernel-enforcement-statement.rst, maintainer-tip.rst, and submitting-patches.rst.
- Meticulous alignment of all section underlines in coding-style.rst to match the title lengths precisely, preventing Sphinx compilation warnings.
- Thorough localization of internal cross-references across these documents. We applied the `pt_BR_` prefix to anchors such as `pt_BR_describe_changes`, `pt_BR_backtraces`, `pt_BR_resend_reminders`, `pt_BR_split_changes`, `pt_BR_the_canonical_patch_format`, `pt_BR_interleaved_replies`, and `pt_BR_maintainer-tip-coding-style`. This prevents "duplicate label" warnings during global Sphinx builds.
- Cleaned up orphan labels (`tagging_people` and `explicit_in_reply_to`) that were completely unused internally to streamline the documentation.
- Improved readability of translated technical terms (e.g., using "comentários no fim da linha" instead of literal "comentários de cauda").

The entire series has been validated with checkpatch.pl and successfully passes `make htmldocs` without syntax errors or broken internal cross-references.


Daniel Pereira (4):
  docs: pt_BR: translate coding-style.rst
  docs: pt_BR: translate kernel-enforcement-statement.rst
  docs: pt_BR: translate maintainer-tip.rst
  docs: pt_BR: translate submitting-patches.rst

 .../translations/pt_BR/process/2.Process.rst  |    2 +-
 .../pt_BR/process/coding-style.rst            | 1318 +++++++++++++++++
 .../translations/pt_BR/process/index.rst      |    4 +
 .../process/kernel-enforcement-statement.rst  |  163 ++
 .../pt_BR/process/maintainer-kvm-x86.rst      |    6 +-
 .../pt_BR/process/maintainer-tip.rst          |  847 +++++++++++
 .../pt_BR/process/submitting-patches.rst      |  961 ++++++++++++
 7 files changed, 3297 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/process/coding-style.rst
 create mode 100644 Documentation/translations/pt_BR/process/kernel-enforcement-statement.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-tip.rst
 create mode 100644 Documentation/translations/pt_BR/process/submitting-patches.rst

-- 
2.47.3

