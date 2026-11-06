Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964955;
	b=PK+WXWNKzpdALx8SQ9HNEw2UBX83nW7xnGOu04YuJpK9JyR3a1wi2RTo8iG/Rdfy31UT
	 RCdKDkd9AwGC+R2EVWnZBy75+qb1/rN+sLW7gORdsiPi99/arW2xrmw1zWl8ofRuZGjVp
	 nIfcDpW9ycTvQ/jXgNjJyGnTbPsmBBYlPJ9Wmv3QH/3PJq7AOjcWW+T+Hn4lMOACnZCc3
	 KzXzACUtS9LhcnK0DqpxcAXoEdl8+mFa6qS/U0ZMIWaECABAGGmQb3iD4jIzEDJkJyo5K
	 /vP5BOTtAsixcwUWpdw2SRGQmEFpKjTBYYG26qMRz/vrlIbRCwMpZr8t2eRPnJMevCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mu1cNBjSM0SBDkEiEiXS1muN+y/MI7dfI+8SiRwv+9o=;
	b=a7Z5AAneI9682tmWX3Z2JwPWpF4LQJAgWoBY3KKTxMIPL5OX8KV1BdIfATaaFKIJ1LKy
	 oWvU7bjBYQ91XD9AOObkX2VPOUWtyklxCCmPLNhiBcwUY7UqExvCX6iJmfYHHQ3nycQx2
	 HaH2me/AhSeS00E757kDMXpkQdL6QJEhOcYUj72OWB8vN6ALqq8eBNOVo5NIWYllULhsA
	 uPMR9tVj4xO1uTcMYpd1CmCmZb0hA/D4VAG4mI+zokVfNk0i3xILLgjCqzZqjj6GRw4I7
	 NRB5xhl1xeVRH9EX5G0lhMD2ndwSF+Y0wpbqMTMMF0oQ8MWRZ5hTzUVWxkaLdJzu5pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zlaxMcb/";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EE606A902
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB2EE606A902
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlaxMcb/
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0b8b5d28cso90974a91.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964953; x=1794569753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mu1cNBjSM0SBDkEiEiXS1muN+y/MI7dfI+8SiRwv+9o=;
        b=zlaxMcb/p7Agz4O5lT6ei5HFl3me03K0ckEkCnliA6QmSgPUci2ouYFI6KZBZH+Bn8
         MiTOsbTMQJpiDWYJA3TRRi6+91CBPf2lqQnS38Mo7OFOOqiXA7lgZvPbD8wBaQkX+q9s
         YSfmB2jLZqrnbpo1u9bgDtC1x4b/BYaEQa2lUGQ17y6ixfrIHnS9XGk6LlK436RlSq+g
         cny1huULrGj5JDvgkp2z0XomC/L9WknbIsCNAVd7+zjYn7CXYbxyOZc0ovc25W2JewSA
         8L0PG5pfHth701JslngbhOGzTHEOVUHb/ml+d0Dqs3MpyTMGV237FrEAxCURxoiUV+CS
         Wx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964953; x=1794569753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mu1cNBjSM0SBDkEiEiXS1muN+y/MI7dfI+8SiRwv+9o=;
        b=l6jUQ5rgkimuZBsZoOjW386bvXPzVwyPACYfoIvQgp8IHsytgt989Hbt9o88Lu8uel
         7OR2tqU32Gco7qPI+lFMaR5R0FH1gPVisTnmtRWgwaoDyTd8sN5Fb3RjiHdScm5R4WsD
         rdlqIysm+RC5m7KOGD33TSwes8WVs3sLMGSomTB7V7sxnfYXEkfweVFEkuxJ9JKWyqXr
         ysELgG8hzi3bmVFA/tmv0p4dbTIw1Hd/H/FiTzURnXamFxZXeD0woTFRVf59keP+9TbU
         p/rggFhFZLrgKCX0LHtzDJK/HIMjoV6/Db/53ImW05ULqNp7mV5xHwdbTPaCX+NOaEzq
         /m0Q==
X-Forwarded-Encrypted: i=1; AL+hErHCvmlADMmUuH3Z8paAdn6lzy670+8s199G0GifgfiDckiikITlCazE7BScZYMHpNGE9ZUA7n/QRKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a3fzYPfFdNO7Zfa0Havr9S0bqSWvMWVBqcEN3PSIcccsK5JPF
	/mGCK52+snSu1V5ukpBJCssWG1hYmnyPddJCbTQFG/YuYobvuU2q7FUk
X-Gm-Gg: AYBFou3/1v76JrKeGStqh9s9rHB1Yk1tl6WwoWN+OCVAlvF52fz+MR/iZNrQO5r2bEz
	qFaR7s7p56bvk+NwnhXMN2RfZZRSLK7XAPw5puMeFkYVZ5Bp4/xfQkhpcWcZ3ATFU/FRaxfNyTv
	ZvhPShvYWfsGA5n+l1ahiQL3bTCsPRi35WQyCWNVb/wBWn8D1wNY7eaVH6PpRm3V1dI8ls/ihM5
	1GfDTO247v/4DiDQ0u3sfVotexg03ryP/D+wWE/zKdrlvkk/rnRmR+92AeXpWmhXkadfJH7CutR
	ygrIENsBwUfs1nLYScGi/94jmOVboI/Law5OC/Qnk0qHtqo7RfACeDxYbhfGeYEEbbAeXcK9BAX
	sX9tJc3eU7A4JhRf9ZLzmzp5JjUlBWPbMS+bEnrSV6NDuVZHV0bhGUqJDPflQaGobiKHclc3gn3
	L+lH9QQrYLdDCLECC91+n48hLUUwuBN0gH4P9bJQDuLQd4DjxJ0lj9gVOxQrwhKLEY2TD7gTli4
	G+LWoBS4o6835BfpYKNlVZCqgbH5iTWk9M7I8328sdcJgQ+tnE47N8brDRHgjcfOGyhEUe7LyOM
	htGRR+mzD0yRdwkgezam2SX1Jw3CKIE7YnNZtVEOn1PVu2RtCO1yGg/C78uwr4RtFsYEvAyniad
	drjC8VYGlmBYJUb5CiQ8BwRj/
X-Received: by 2002:a17:90a:d883:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3b0db70872bmr4052038a91.6.1793964953356;
        Fri, 06 Nov 2026 03:35:53 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:35:52 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
Date: Fri,  6 Nov 2026 19:35:31 +0800
Message-ID: <20261106113545.708896-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I previously promised Jon that if no contributors stepped forward
within two months, the maintainers would have to produce some results
ourselves.

This series adds zh_TW translations for 13 process/ documents that had
no Traditional Chinese version, and moves each one from the TODOList
into the toctree of process/index.rst.

It is independent of the "resync translations with the English
originals" series sent alongside it, and applies on its own.

Terminology follows the decisions in that series; whole-file
terminology unification and the glossary.rst update will follow
separately.

The series is based on the docs-next branch of
https://github.com/kernel-zh/linux-zh_TW.

Chen-Yu Yeh (13):
  docs/zh_TW: process: add researcher-guidelines.rst translation
  docs/zh_TW: process: add cve.rst translation
  docs/zh_TW: process: add applying-patches.rst translation
  docs/zh_TW: process: add maintainer-pgp-guide.rst translation
  docs/zh_TW: process: add changes.rst translation
  docs/zh_TW: process: add handling-regressions.rst translation
  docs/zh_TW: process: add deprecated.rst translation
  docs/zh_TW: process: add kernel-docs.rst translation
  docs/zh_TW: process: add maintainer-handbooks.rst translation
  docs/zh_TW: process: add contribution-maturity-model.rst translation
  docs/zh_TW: process: add conclave.rst translation
  docs/zh_TW: process: add threat-model.rst translation
  docs/zh_TW: process: add maintainers.rst translation

 .../zh_TW/process/applying-patches.rst        | 392 +++++++
 .../translations/zh_TW/process/changes.rst    | 532 ++++++++++
 .../translations/zh_TW/process/conclave.rst   |  35 +
 .../process/contribution-maturity-model.rst   |  83 ++
 .../translations/zh_TW/process/cve.rst        |  90 ++
 .../translations/zh_TW/process/deprecated.rst | 363 +++++++
 .../zh_TW/process/handling-regressions.rst    | 969 ++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  35 +-
 .../zh_TW/process/kernel-docs.rst             | 355 +++++++
 .../zh_TW/process/maintainer-handbooks.rst    |  20 +
 .../zh_TW/process/maintainer-pgp-guide.rst    | 795 ++++++++++++++
 .../zh_TW/process/maintainers.rst             | 127 +++
 .../zh_TW/process/researcher-guidelines.rst   | 136 +++
 .../zh_TW/process/threat-model.rst            | 187 ++++
 14 files changed, 4101 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/process/applying-patches.rst
 create mode 100644 Documentation/translations/zh_TW/process/changes.rst
 create mode 100644 Documentation/translations/zh_TW/process/conclave.rst
 create mode 100644 Documentation/translations/zh_TW/process/contribution-maturity-model.rst
 create mode 100644 Documentation/translations/zh_TW/process/cve.rst
 create mode 100644 Documentation/translations/zh_TW/process/deprecated.rst
 create mode 100644 Documentation/translations/zh_TW/process/handling-regressions.rst
 create mode 100644 Documentation/translations/zh_TW/process/kernel-docs.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-handbooks.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-pgp-guide.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainers.rst
 create mode 100644 Documentation/translations/zh_TW/process/researcher-guidelines.rst
 create mode 100644 Documentation/translations/zh_TW/process/threat-model.rst

-- 
2.43.0

