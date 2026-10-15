Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB3525A76
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069023; cv=none; b=L+mmpVPbir0dUehhxU6+rDde2F1WGx49iQb5H63+47M+TGxI3Plz0Suykk2kS72h0E9nRCKqhnlHTDW87gq1Na9xFLBZkzCD+UMxWBL+U/JT/JjxhnM9wFC5IQ2wAbpwbfpdDuCcDrEceu29UFCKEcy+0f/WwzjcOtVWxa+o4Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069023; c=relaxed/simple;
	bh=wtOFZraGsBpQ4hUfkUfCU2qsltkn9pzHky/+wweZgS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7lJOCOYTvQrFS3g2Kz2hNxnqW2Qd51IKS+ded/dXLtpIMONauQruoOClcyun75zRSNaYrHuMe2+uJWLFGAqAoVmbSM2M1+pfzz0EdMErrWUIoOXk6BjpCXtheWL2MeCr1YZNys6QS2vWZGuGor40g/mduLMggEh67jbLhHOleM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIFsMW2U; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIFsMW2U"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6161948eec.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069020; x=1792673820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHTjKir7WhEF+7otyD21r203js5QZtUClqFMAlpQpKk=;
        b=WIFsMW2UZ7EGtMhZCjbzhukEp7tsaqltA7iijtjxW5ovVikZVmvlYmONTuf4qac6Fj
         NvrEkMIT5ufUrMwoGP+0hPkpysFmtiH/1LzYldxLNJS1xptoegRmZ7u46icwjLp2isHU
         lUOehJY26kb+76jEK33i5889pScfBJl7q2kKVQsjzEvM6AEfioyTkqQTH830aNohfhPg
         t478hdz4iMcWDj2OdwGe4REcsmPaS9rEAcfUV6LfofdVB3Ssup97hgojQj4+Mwz7OQ4f
         K6NLrev1suxx/VgZFXdHejF8Ep+iAwp/xj3oJu9BE4bjYjaxdwUZr9eujlwTe2jhwAiy
         hJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069020; x=1792673820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHTjKir7WhEF+7otyD21r203js5QZtUClqFMAlpQpKk=;
        b=vhh0DunGKaBMDhg/m8CCBn42gbL516oRFvdADNMq5l+wdko0eIYymXfwBOoAAEcDf0
         UGLWN8OE3BCfEFowfBIQNXSpBgiXckwoOlHngb3Pq7qCUXUCH2vxUEznQpYjqzFxWOOD
         Yikt9zqMzyVK1HrPmWm5Zlt8ZnRYisEKi3TrGeA8dFr5o0MoHdNTbu6bo+R76h8pjjV4
         rlOW6zZY//zZU3Sj8iFeeECETla12u+ExT45i1XnES/76DrvFQBNfjlQDffPnNsPTbsL
         1BBxIJeyR4fqgRjIXQvDXWIr9ZPggnisymzGhYFvfZC6bcwNJxOs8ip5ATLPdmN3a0ZM
         Kb6w==
X-Forwarded-Encrypted: i=1; AKwUvBziaa2ymsCh69n+7HypFA13fuPd1WhsmzQuSJtPDuJpDRkZlmUM7oLgu2OYJPCluH/PfYVujjqhRfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB6uiOC2ezJAyrJIh82UsURCzVAb6ROd769gx4cN9X5VgEoXyi
	QwU7DLOcgC/IVrsh8LdZwQ9llsMMPXhpsKRXuAh05Wf+vOnrXqhl5LF5
X-Gm-Gg: AYBFou3V1yuM8Vc8bS6iQ2sXPMNKwxC+stqcUYWIADseX/QcD4FdUHlCCXI/i860THJ
	ZHkGUFXlP3zQaY4bNKhL60fXxKCYDKTDaTlPw2flqrq8BpKClMBNnbS0MYatATNR1IwVoVcnZjI
	1dw4vXCw5j/CJJI0ZTWY0q3NIxmaiiVLWs7f19NnEccO41+Jsooy64fLPY3lSrdJHKcU5Td3TO0
	YTbA8/ytLIS1ds0w+O9mk9cFwE3ScjgPs4dR16TiC3+ZGM229T8nYaDS4mtyYQvt0+dnCSNsmY0
	WNd4MGCWJEA/pOEAoUn8jdNkh99xrUlfEEW6BHRwa9zTI7V9Z8hQ1wC/qYeHUI6Orn5BMSRb6Qy
	FpO2nLP0gHBONpq6QE6F8JGmHF+brMZvJ9rzLuiTrlR6LI3lLuA2m9TUMlHB4fOo5dssJVFvsCx
	hR5otwZPQyXckLJujsVR0KUtqD/qHevbJbc204Yeak5MFaTQ5SpeilqNpyjsECbNFKt3WezDNxB
	hd8ByrL4WterZK/EFv/a71G4FMkkG8f5aF9RSlz0h2emNHuFCHb0+k0O/rRs7nJ+Bi9q2RfT5co
	0lHgcYv+2WkecW3cpXTNmA4=
X-Received: by 2002:a05:7301:90a:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-3537df9780fmr19801431eec.15.1792069020235;
        Thu, 15 Oct 2026 05:57:00 -0700 (PDT)
Received: from penguin.bbrouter. ([200.218.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm68812345eec.17.2026.10.15.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:56:59 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Weijie Yuan <wy@wyuan.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] docs: add a guide for translators
Date: Thu, 15 Oct 2026 09:56:41 -0300
Message-ID: <20261015125644.12908-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation has seven translations, but the English documentation
has no guide on how to contribute to them; the only one that exists,
Documentation/translations/zh_CN/how-to.rst, is in Chinese and covers
zh_CN only. As a result, the same problems keep coming up in the review
of translation patches: labels copied from the original that collide
with the English ones, partial builds that hide those collisions,
documents left out of any toctree, missing commit descriptions and
missing recipients.

Patch 1 adds Documentation/doc-guide/translations.rst, a guide that
covers the whole workflow of a translation, from choosing what to
translate to sending the patch and keeping the translation up to date.

Patch 2 translates the guide into Brazilian Portuguese. Since it is
based on the original added by patch 1, whose commit hash is only known
once the series is applied, it does not carry the "Update the
translation through commit" line that the guide suggests.

Both patches were checked with a full "make htmldocs" build, with no new
warnings, and with scripts/checkpatch.pl --strict.

Changes in v2:
- Drop the references to the Assisted-by tag, which was removed from
  coding-assistants.rst and submitting-patches.rst by commit 1e035297ffda
  ("docs: remove Assisted-by references"). The guide now only says that
  Signed-off-by can only be added by the human who certifies the
  contribution (Weijie Yuan).
- Use a plain path in the ":Original:" example, which is what most
  translations do and which the documentation build already turns into
  a link, and drop the ":Translator:" line from it (Weijie Yuan).
- Rebase on current docs-next.
- Cc the translation maintainers, so that every team can comment.

v1: https://lore.kernel.org/linux-doc/20261013003702.5824-1-danielmaraboo@gmail.com/

Daniel Pereira (2):
  docs: doc-guide: add a guide for translators
  docs: pt_BR: translate doc-guide/translations.rst

 Documentation/doc-guide/index.rst             |   1 +
 Documentation/doc-guide/translations.rst      | 694 +++++++++++++++++
 Documentation/translations/index.rst          |   3 +
 .../translations/pt_BR/doc-guide/index.rst    |  19 +
 .../pt_BR/doc-guide/translations.rst          | 711 ++++++++++++++++++
 Documentation/translations/pt_BR/index.rst    |  11 +
 6 files changed, 1439 insertions(+)
 create mode 100644 Documentation/doc-guide/translations.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/index.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/translations.rst


base-commit: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26
-- 
2.47.3

