Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D33D47A8
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338689; cv=none; b=HFdCtRxI+BHBfJZ0GWFHtW2usl9rICDE7t0tPVY7q6u7HjqlZZbjUEpQrDeXp5OrlhHi9mdsHP9dZVWBe9llvxrfQVgx1AVd1A4xaFyLBy3qO+JIkBjrHK084kwRl7e99gIUzv/nOYkLYtMC2w6kCGfD2zEZspOdEQfJm5fLBjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338689; c=relaxed/simple;
	bh=pmBICbqDZ5ndY8g5s8sjBS+yRkZNsDVHROMv+bbKOrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rCwTZoymgpLSw4tb5XGDYrDkcEQItIQdE2Z65I/ar10wbKRi1KBx+wjkFK0GLu/HMKadtQpYZEJ4RqKi0ZMI8ytGkEqVibBb9v9Ll3evGOJzUYyHNrCsXQqTizHT3NKQ68qgB8JeDAm+mbvfAZYjYhoPq/CnpJp4oX4U+ToiD2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbn+V5ix; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbn+V5ix"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39927410578so1487466a91.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338679; x=1788943479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+QMrkcuBf0aVbydtE8xfe+6EmPlSZfZnXnx55x6XxQ=;
        b=kbn+V5ix1Eha2PBHMSajY5xoNQDt6Nb/DrJn/cUZE6rdMxY8Z4VZOxU/LsEUzGMiP9
         Fsl/G8lLrDnDBoCg6sG9D178TUp/pAoDGlnkSE46eeFVS6lpH5ncPCfaEEVYSIo9FbPL
         jjh3OOVUj+sLz0hgZAOjS5eNvYJ+ODkbLSM9AmMewQDgFYkYSYhxHre7dMAtd1LFMjNu
         R8vdztIExMWBAnktOtVcRKBcB01yXC/XCeHFqDt0ZTvSIDTTmPz/JW8aXn1/xhA2E5i0
         oXgMx8h8GLJ1x5+Y3H5TICh9mikKf1kmYKPUKNUGIqMwXaSf7/hckLfv2N4cEMAdbXcH
         eGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338679; x=1788943479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+QMrkcuBf0aVbydtE8xfe+6EmPlSZfZnXnx55x6XxQ=;
        b=OUIyUOosPv9y6dw9qkYnWzbmHtf+xoNLGqEsl/7E6BVL0sVUS+R5vURr2i5+I+ZMpS
         CElyda1wR4WotsIJkbIylbiikNBzWNP+d4B2fqAv99X1SOtDYu6PYDWZH0jJbB0GHjcT
         5/rwv3s0GRqZvwvGtOQ/VKs+1iQpNKxzIvl7TboqhT/xCfygtepj+SCiM8mqXPONOHH6
         xSa+s1eprk9OpdMyNB6KA47oNggKm8kx10izuTWHfxKXISEpZKAcKQ6TJHihm/UQb+jp
         ceAm3IR0WCV4FFkUt9ESz7F0qQ/n7BHLUJ0ZhpHylbdbet3Q4pKEPdWNwqjSPB4zvIC0
         6few==
X-Forwarded-Encrypted: i=1; AKwUvByTF+fG5LBmKOfZlKo09Ywfzs8EGBIxTSgwT2tu1QOZuMMLkRcVIsDCzd65uGz57pM1huu5Od5gSjA=@vger.kernel.org
X-Gm-Message-State: AFuF++nPEqnULV9DpPlcwK/GXb4p98j/321BwI+olsYQv7stNCS3KpKk
	FKZTiYfwvTQNY7La8iPLBkGgHx07bC9ALhwrqHFe2EawkMtAOdM3uhfQ
X-Gm-Gg: AYBFou1ajYVlQMgOkMu2tJc2KDZimNPwXvTKj/Uwj4rLGjcM9xw1z/1M5gaTVBpwtTn
	1r2/z7SJGpViCV/Q3zIAU6vRyhQO+CGz+k0of7Zgilw2QcHOCZxwC0ZibXxzETn9PAwJ1WhHzHL
	ol16WWDjxNm+X5Ibn79iND7x10ZaVJxH2etKmYb5z+jttJd3tqwvOxDKsDHoI3mCzWz0YFSDg2t
	7D8APSkW+EGgFJNQusnFoucqS7hr4VqpiDWKSe1tIzTtd0sIlAYIUbAXNlDTDEreJ+GpblcxEk7
	oVLQyouKn3ePEyRE25Hp5q7ASd1S1Oo3IYEgkbzcAK7UTSD45nIuo+fNXID5rekrBAUcDL2aRw2
	r3FXca8Xseq7ZXtnL56SlLQU1YWAOTfY/gGpBGPceYGe1jUJAEvIITPFBq4mVIhSlLERR5Tozve
	TuiQDzXlpP2xxQSBMFvoSXcpfpYG9PYD5r1sKZ3kJUbpWco+skSIzVWijNJ7/bo/AAFWAEjjTeY
	2VWgFJadASn21tp3i2BQL+DJxKIOA==
X-Received: by 2002:a17:90b:57eb:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39aedfcc06amr5130789a91.6.1788338678716;
        Wed, 02 Sep 2026 01:44:38 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6f337sm4845289a91.16.2026.09.02.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:44:38 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone, 
Date: Wed,  2 Sep 2026 15:43:58 +0700
Message-ID: <20260902084430.17248-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs a thorough pass across several files 
in the Linux kernel process documentation directory. The primary focus
is to improve readability and maintain a professional tone throughout 
the guides for a global developer audience.

Core changes include:
- Expanding conversational contractions (e.g., "don't" to "do not").
- Rectifying minor punctuation oversights and grammatical typos.
- Standardizing terminology formatting to elevate professional voice.

Extra notes:
- I originally intended to send a 12-patch series to cover the whole
  directory, but decided to scale it back to these 5 high-quality
  patches to ensure thorough accuracy and a manageable review cycle.
  
  Also I want to know the current progress of the patch titled 
  "Capitalize Git, Quilt, and Mercurial consistently".

  And I would like to thank everyone for welcoming me to the community
  and I hope everyone can forgive me for my mistakes in the past, 
  present, and in the future.

v2:
  - Resending the complete 5-patch series together as a single cohesive 
    thread. (Apologies, the v1 submission suffered a terminal wildcard 
    argument error that accidentally truncated the transmission 
    after 1/5).

Nguyen Duc Thinh (5):
  Documentation: process: Clean up grammar, tone, and contractions in
    core files
  Documentation: process: Clean up grammar and tone in next guide files
  Documentation: process: Refine language, tone, and grammar in
    subsequent files
  Documentation: process: Refine language, tone, and grammar in
    subsequent files
  Documentation: process: Clean up grammar and tone across multiple
    files

 Documentation/process/1.Intro.rst             | 18 ++---
 Documentation/process/2.Process.rst           | 22 +++---
 Documentation/process/3.Early-stage.rst       | 14 ++--
 Documentation/process/4.Coding.rst            | 48 ++++++-------
 Documentation/process/5.Posting.rst           | 34 +++++-----
 Documentation/process/6.Followthrough.rst     | 16 ++---
 Documentation/process/7.AdvancedTopics.rst    | 32 ++++-----
 Documentation/process/8.Conclusion.rst        |  4 +-
 Documentation/process/applying-patches.rst    | 20 +++---
 Documentation/process/backporting.rst         | 68 +++++++++----------
 Documentation/process/botching-up-ioctls.rst  | 54 +++++++--------
 Documentation/process/changes.rst             | 20 +++---
 .../code-of-conduct-interpretation.rst        | 14 ++--
 Documentation/process/code-of-conduct.rst     |  2 +-
 Documentation/process/coding-assistants.rst   | 12 ++--
 Documentation/process/conclave.rst            |  6 +-
 .../process/contribution-maturity-model.rst   |  4 +-
 Documentation/process/cve.rst                 |  8 +--
 Documentation/process/deprecated.rst          | 14 ++--
 Documentation/process/development-process.rst |  6 +-
 Documentation/process/email-clients.rst       | 32 ++++-----
 21 files changed, 224 insertions(+), 224 deletions(-)

-- 
2.50.1 (Apple Git-155)

