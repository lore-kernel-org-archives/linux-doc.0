Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBD33955C9
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020687; cv=none; b=BgBlTuGGQJ84QFIiBhJ8FsPvHUYwwiqg/qES1xM2laaE5H0KDTbYPkAM8VRuVxqTXo59Tjt1JZnaFzEEeThZQS0zDvkuXbpofjaIJpN70BNWJwlxfaGECD1GbVgpRRlE6fqfJb9csv5CriF+8EFk7lheJZXWd+apWSSQvXHMY0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020687; c=relaxed/simple;
	bh=fb562ZptKuOfEEnr0YEBvgpvvX9nvRyuEgVTxdpKkSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlQf5nMsoUEvau9V8WqtVnhV8muyNTFxdG9h+XqfO2tSHsjBlqEWjJu+lEO7wGVbglKHVIQXiYqkLNvuHTLvx5HJyUOWv59sBbeXiEZCD81+3rfbDoL8eu2Ecj3clkmv2gnVvzZnqMqnFITxcidiRXacYujL5vGzvCexmlozk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUCm9vK0; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUCm9vK0"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2377027a91.3
        for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020685; x=1788625485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZk1d7bPoIBi4fTkBIuzDAERPlhbFwtYY9y0u+wADp0=;
        b=VUCm9vK0QOMSbH06xYS2jzylijqYz/NPn2y6fc4t9iKPytX00wDhfHlXCfbNSBbhFu
         ZL6vvUVWveAcgA+AnexqS5ZycUvsR52Iw0xmYWVgMpZR0qfoxWZfMpSK14GtD6tmv927
         79pI0OqcdAOCgRAQy77o5O8Casy2dvXT4fLkaoVyoAqlqNeZuSYCpuf76kwIQr4qlynO
         hFRUZqBPdfAd7nSj51i1ApJ5nK+zAROHPj883TBiCm8uaX0zxwQgR2rda0/2GCSavyPZ
         XhkFvJP4M+WMdvgLjTPjhUT5bbsi/w4OJMZEt/uGUzVzwsV7WfZuwaVUs001FytufVKr
         rVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020685; x=1788625485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZk1d7bPoIBi4fTkBIuzDAERPlhbFwtYY9y0u+wADp0=;
        b=TdpCJs/a4OVgG9hDdb2E++GtrD9ugfeFVYkIpY9lc/UENIxHTxCXbkWbvQBN6xtpC6
         g/xHz95oxfjJ26weDwacQ3dh4JHmquCs5pYAxrbEU30weU2uAA5H2YX9qntmBuMp4oqv
         ot+S9sQK2De3I+j4GwnYl7gQnXO8rvLUaErTOE8BixMwL8Ex974oVN/kdulaKyEHI+kD
         JTJjce3EFsRbxDkfVOVPomLbRSQl919NtI+IsQfml1fN8ifG9PXhxKt8AarHns8JcVtd
         ukvXrMqiDMdlp3PUNTsp6oZRctnkZutvdgWZXWcJs5xJDKM8NtWqskjw5Po4cOglmZkx
         SGhw==
X-Gm-Message-State: AFuF++nQBwLRdDrWZp0glzMO6tY6F+wKNUEQPbIJfs3vL7fhF/JSzB01
	7Dx+UOZQpOchstNbmrdZkuIz+95TfHdDn0PFf6MsPC4S2HnIiqFxr6+fgI/31UQ4
X-Gm-Gg: AYBFou3vAu+n14hiD7ac783GUtHc74C2ishlm0oXka+DWl6ilC4VW6e+bP13wISKQBc
	V6occPccCwS7rImZVyHyc7qUpxCKyHBMpkS+hcJJ2gBXFlz3VLzW2MicitBuflYOxqKu/eDzh55
	T7PZkWMDj4kMu2lQE2XQQ1KQ3x6XVmyMnjpPvpe1vmeL0jBQuj0iOEVVGQ4NFKpmzxLtP+6q+iI
	xnSI/fE75mT2v7y8+Xxvr/8eIdSdQPZBDBroiRgtSMeTrzXGn+6Irxb5/iIRU4adHbbcjhzpo+L
	apARtFZf586wwG9xFLJCrXBcysIJ640JoJEKZhlAlO3NZ+Svo5XPV/TKiCAxM3W9CU/km8O/Rbk
	r11H0dyKwBkaCGiSgMK9JOiIwnKS5MeqeaRQFG1Qg080q6JNCEzMJxbzO5/DS4FPAaGmVE+OAnj
	ogPNDCU1XIM35kz4DlwWxK1+Jo1yK0GFRuybKJ7jDPB+LHxbql9g1grXEHfe6qhfHaI2xy3jYEo
	NTKPxtw5o1t+1BcA6PfCkko0jbRVbo18z8fszctTKQrufi1CZ7ZMlq1S6V5d4QgmlnAKyZ38/pn
	459ZQyPpy4uUSyDvVdrqkQr9
X-Received: by 2002:a17:90b:1f86:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-396d0ff5bb9mr27648194a91.14.1788020684894;
        Sat, 29 Aug 2026 09:24:44 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm25183814c88.0.2026.08.29.09.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:24:44 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 0/3] docs: translations: pt_BR: process documentation updates and new translation
Date: Sat, 29 Aug 2026 13:24:32 -0300
Message-ID: <20260829162438.13039-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series improves the Brazilian Portuguese translation of the kernel process documentation by adding a missing translation and fixing several formatting, typographical, and structural errors across multiple existing files.

Patch 1 translates 'embargoed-hardware-issues.rst' into Brazilian Portuguese and adds it to the index.
Patch 2 fixes typos, punctuation, and untranslated text in 2.Process.rst, 3.Early-stage.rst, 4.Coding.rst, and 5.Posting.rst.
Patch 3 does a deep review of 6.Followthrough.rst, 8.Conclusion.rst, adding-syscalls.rst, applying-patches.rst, and backporting.rst, fixing broken markdown links, missing code placeholders ('xyzzy'), missing paragraphs, and grammatical errors.

By addressing these issues, the Brazilian Portuguese documentation becomes much more reliable, matching the exact technical instructions provided in the original English files.

Daniel Pereira (3):
  docs: translations: pt_BR: translate embargoed-hardware-issues.rst
  docs: translations: pt_BR: update process translation files
  docs: translations: pt_BR: fix missing text and formatting in process
    docs

 .../translations/pt_BR/process/2.Process.rst  |  12 +-
 .../pt_BR/process/3.Early-stage.rst           |  10 +-
 .../translations/pt_BR/process/4.Coding.rst   |   6 +-
 .../translations/pt_BR/process/5.Posting.rst  |  12 +-
 .../pt_BR/process/6.Followthrough.rst         |  14 +-
 .../pt_BR/process/8.Conclusion.rst            |   3 +-
 .../pt_BR/process/adding-syscalls.rst         |  54 +--
 .../pt_BR/process/applying-patches.rst        |   4 +-
 .../pt_BR/process/backporting.rst             |   4 +-
 .../process/embargoed-hardware-issues.rst     | 362 ++++++++++++++++++
 .../translations/pt_BR/process/index.rst      |   1 +
 11 files changed, 430 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/process/embargoed-hardware-issues.rst

-- 
2.47.3

