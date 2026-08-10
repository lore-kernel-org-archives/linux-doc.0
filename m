Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94141385D96
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372402; cv=none; b=kTdWnBId+eyvH/QSwg4am0MfSBaSXDHM6IhZjr6aYXA7MDLIafBt8cGGQClhZAwBgosA2FOYYUPwqgyX7LnBaqRZqGhDg+tDU2Dh/ET/rNgXSLcR6qibuBeZFlB3kU0o9Ul2eGhFbu1sgbABu1E+2PlXyxHf3ZfiRfaRh0nklVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372402; c=relaxed/simple;
	bh=ddBOwFQP75Qb14CLIFWGyJEobXUeSf4VrfeJrbdXns0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OShM+ByhHAAEtQzw5zhEGujCLm4Vau5CD9D/qiJfm2gZdmcRp7uqKvoEdhzQ7uW0Ww46w1rgSWoL9FDn7eNim1LWzXFta7AOqGrpZLJcg5i2r58Q3JzKevKRMnBkJKR5S5Rz9uqLqCnXAOJ3iaiIxRXV2L5e11OAko+WZYerSHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzzhLsAk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzzhLsAk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1668282a91.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372401; x=1786977201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8o1H4sECBKvhf7M/CFqW2c6l+zb7GZ1cuCHqkYF0Whk=;
        b=RzzhLsAkBBGDc0DMXREiH9luYN4JUwmf7VY7yQf7caIWWMZiLcT/cLz7soqviN+unI
         QAEi/Dopk/sVAcRC29GFttz4y/oFEWbO5dsjCDJPBh1S34QJinuSQ5VBE/XZ3js9Ovn3
         IVrCRcrBnZo69c+UDY+GdprO7X1OhG+NIXsLI1N76g0UBk/yWSt0QqjlBPEwJpXNCSxq
         4sge1g3wjawZ/2DDHYMGOOgKAK0Wziz3x1xC1TEsNKm+Mw4zCCmWw2W+Hm4s43WNdCSR
         8Sg449K14irHZ+V42XWUadhpvxxwqvfnAQlizm5fXk2rHgJEY5iEbCrd8Lk2I+T4HhO2
         z3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372401; x=1786977201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8o1H4sECBKvhf7M/CFqW2c6l+zb7GZ1cuCHqkYF0Whk=;
        b=qOQYC67oXKOzquTrUi48ybZegEni2ohA9UmQSMOYK530WDQl/T+sbiB/4fxID+exdG
         oDtzMgkrMd3+Ob0y6ew8sabtNukCpauqaaFuv7vCm7Bm5xk5fQn++TwpfvwaIqAb8U6c
         mJClK+KUIiHOxH1exNnuzlcEHcIAE6UfSdF91BHiIVYe0NpV0gHj0pqWdglXVnmH+Fma
         I75CPPrLa7Fkw/dH+gkd5bbuSO281Smtz9XwpuhDNJULo5xcDCRL3DeXDhPQ4IoKtDNI
         30hF8SRrTfBh9gGr350gcQoX6hyyXHzGJEVaekHErT0XFYt0evrs/kqINnBoz5L5OrYZ
         WNiQ==
X-Gm-Message-State: AOJu0Yxk4As3HePrWTx58y+C2NwfHnupPoo0sRzeQPvOdHHMbPC5D2PA
	H8+Zjj7AFQQnFzr7vTsq18d93FCLbUnwUR5xNg4jQGZTV+jVQEvhzWux
X-Gm-Gg: AR+sD10hp5GWEpIt94lYrWfHLF31Bqk7Nzz9MPsw5DfpENQAZodT6VBUeSvSBSa5eBr
	Is52zFDU25rIk3idu4Z9I83751YiXk5XLV/opYyPwgMw4gRCoO7LbcHR+ShWT4vF/rFG/ZO35KG
	2r0YmtFowmrEGPVj6+tuYVvfdyX1SfONFjqzGcbBLxfAhPSd4dLteFVkgQoiP67i7hZakvMK94T
	y1feJXK3Uv+jiBx4pLLpgiqaXXJIp8txRLlMwGrMPwExS6sRfg8kTvpOmHVf6rxE9kb9XRTCutE
	uXjCZXuTRM/8L85cqNtgDwIGAnyx8M16a3kMztv+OlyoDQsfkdebgGNppxsw9/iqEBHgNLNqSDm
	HUVYe1g/J3f7E3K1MW6JvboZ05lemhlJdvvtOjYCIAGWnpjzbny1728wWE74Hqqy4vydVB8Hdct
	IHhDS1VgPwJlbEO9zuWgIWmWgjyHd5Y1JhPLRE4XDds7miJsvq8Gr/cHhCP3tdOLn76Trs9UjVD
	7kptGWfGbAk5Q==
X-Received: by 2002:a17:90b:2690:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-392822bf758mr22993895a91.1.1786372400722;
        Mon, 10 Aug 2026 07:33:20 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410cc132c1sm22197001c88.8.2026.08.10.07.33.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 07:33:20 -0700 (PDT)
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
Subject: [PATCH v2 0/5] docs: sphinx-pre-install: improve dependency checks
Date: Mon, 10 Aug 2026 22:33:04 +0800
Message-ID: <20260810143311.57775-1-chenmiao.ku@gmail.com>
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

Changes in v2:

- do not treat Homebrew itself as a mandatory build dependency;
- use the mactex-no-gui cask, install the required DejaVu and Noto CJK
  font casks, and document the post-install PATH refresh;
- honor MAKE consistently in the dependency checker and build wrapper;
- prefer a compatible gmake before falling back to make;
- resolve GNU Make only for targets that invoke it;
- add a separate patch for tools/docs/sphinx-build-wrapper;
- split the English changes and zh_CN translations into separate patches;
  and
- document diskutil apfs addVolume diskX APFSX Linux in the English guide,
  its zh_CN translation, and the zh_CN contributor how-to.

Link: https://lore.kernel.org/linux-doc/20260809101923.13176-1-chenmiao.ku@gmail.com/

Thanks,
Chen Miao

Chen Miao (5):
  docs: sphinx-pre-install: add macOS Homebrew support
  docs: sphinx-pre-install: check GNU Make version
  docs: sphinx-build-wrapper: prefer gmake
  docs/zh_CN: doc-guide: document macOS Sphinx setup
  docs/zh_CN: how-to: document case-sensitive APFS setup

 Documentation/doc-guide/sphinx.rst            |  20 +++
 .../translations/zh_CN/doc-guide/sphinx.rst   |  17 +-
 Documentation/translations/zh_CN/how-to.rst   |   8 +
 tools/docs/sphinx-build-wrapper               |  55 ++++++-
 tools/docs/sphinx-pre-install                 | 154 +++++++++++++++++-
 5 files changed, 244 insertions(+), 10 deletions(-)


base-commit: 8492d4e6bb7b9b1e78f2d17c4dda5272f25ec118
-- 
2.50.1 (Apple Git-155)
