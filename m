Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2603515FC
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735429; cv=none; b=nloH1ZhkrUa1MmBjLuvI17VV0uFwXfeTdyRFSf3g3o99hZB+7UBn03K37a8DmbbrsaZN0W6WwzxGEWnsVRnpA0CDiJ7U1s+71UgqqnSXrs/9OF1+90Ee0kDcYYEQohVKagSfet5/kDWoOdK/47jWqQBi9PL3v5Hu4yPB8VE6yY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735429; c=relaxed/simple;
	bh=vMNtmvgfCwzuV9Mp7ibnIelDK8SHl7G4m0EOAF12z+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fBRTQHGxh0bT2e0lI7GHdOHJmM8DDt4bdTnzUAj+o3fK12SDtgpm0+aQQYqtEb72IfCDu9PjjCmiYwj0jsrVaK0q3AiXOu0asNNsehmOObPdEirIVtCqfwtFMn7BCznIZcdbtAmd1ubpxL+WIu+4N58mEnv3M0LZmMa6YLZ1FUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=cXq1hmZO; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="cXq1hmZO"
Date: Wed, 22 Jul 2026 23:49:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784735422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oykDmaPwfRnt0iweJwUY7kmeMVExpI8InhZ46/xSz0s=;
	b=cXq1hmZOIK4V57zPgNBWe358Cl4jn488S0ScyIHi12bD8SS7Z3wnV9+1XXkg3qVusVhFWJ
	QggNeoK7F4S9iYzRQnNXI+RwNYRBhPRoyCpO4Mulq/oX/XWRPtm7+PKC1tcMqftr8IZDmI
	Sci9w9aoP4WHGiG2HX4/4QAbQr2zmPODdeoUqdWE6bJ7Xl7WcUy1uxoplKm/ap4bVnq3U9
	A/ANuMGMoKnoWUdCWn+ZHQrZzCl8lqGrXdz19tWzVQmnu0I0hFdlwZ1F6Kf/hEyFrl2494
	cJnhYCZ5uLoo+35FcojXwjmQAXUaZI60aDlk9bIHuYlDc0vAgUzWDH+yPkIECA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yan Zhu <zhuyan2015@qq.com>,
	Doehyun Baek <doehyunbaek@gmail.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>,
	Haoyang Liu <tttturtleruss@gmail.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, cuishuang <imcusg@gmail.com>
Subject: What's cooking in zh_CN & zh_TW (Jul 2026, #03)
Message-ID: <amDmpLJPtY0qe4Sy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Here are the topics waiting to get into Alex´s tree.

Copies of the source code to Chinese documentation development tree live
in here:

    git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
    https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
    https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git

Mirrors:

    https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
    https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)

Please report any mirror instability to linux-doc@vger.kernel.org

-----------------------------------------------------------------------

NOTICE 2026-07-22

Traditional Chinese or Taiwanese Mandarin (zh_TW) is currently going
through a transition, and any comments would be welcome to help the new
maintainer get familiar with the development process.

NOTICE 2026-07-14

The first time I cc'ed all relevant personnel. Is everyone happy to keep
it this way, or should I only send it to the list? I´m concerned that
unrelated discussions may create unnecessary noise in their inbox.


This report is experimental. Please feel free to offer your suggestions.

-----------------------------------------------------------------------

[New topic]

* Cui Shuang (2026-07-22) 1 commit
  [PATCH v3] docs/zh_CN: Add configurable error injection translation

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260722123240.22979-1-imcusg@gmail.com/


* Chen-Yu Yeh (2026-07-21) 16 commits (zh_TW)
  [PATCH 00/16] docs/zh_TW: localize terminology and sync process/ documents
  [PATCH 01/16] docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
  [PATCH 02/16] docs/zh_TW: process: localize terminology in 1.Intro.rst
  [PATCH 03/16] docs/zh_TW: process: localize terminology in code-of-conduct-interpretation.rst
  [PATCH 04/16] docs/zh_TW: process: localize terminology in license-rules.rst
  [PATCH 05/16] docs/zh_TW: process: localize terminology in email-clients.rst
  [PATCH 06/16] docs/zh_TW: process: localize terminology in programming-language.rst
  [PATCH 07/16] docs/zh_TW: process: localize terminology in coding-style.rst
  [PATCH 08/16] docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
  [PATCH 09/16] docs/zh_TW: process: localize terminology in 5.Posting.rst
  [PATCH 10/16] docs/zh_TW: process: localize terminology in 2.Process.rst
  [PATCH 11/16] docs/zh_TW: process: localize terminology in howto.rst
  [PATCH 12/16] docs/zh_TW: process: localize terminology in embargoed-hardware-issues.rst
  [PATCH 13/16] docs/zh_TW: process: localize terminology in submitting-patches.rst
  [PATCH 14/16] docs/zh_TW: process: localize terminology in 8.Conclusion.rst
  [PATCH 15/16] docs/zh_TW: process: localize terminology in index.rst
  [PATCH 16/16] docs/zh_TW: Add a glossary for Traditional Chinese translations

  Needs review.

  Source: https://lore.kernel.org/linux-doc/20260721215542.98435-1-chenyou910331@gmail.com/

-----------------------------------------------------------------------

[Cooking]

* Doehyun Baek (2026-07-08) 7 commits
  [PATCH v6 0/7] docs/zh_CN: update DAMON translations
  [PATCH v6 1/7] docs/zh_CN: update DAMON design translation
  [PATCH v6 2/7] docs/zh_CN: add DAMON_STAT usage translation
  [PATCH v6 3/7] docs/zh_CN: update DAMON index translation
  [PATCH v6 4/7] docs/zh_CN: update DAMON start translation
  [PATCH v6 5/7] docs/zh_CN: update DAMON usage translation
  [PATCH v6 6/7] docs/zh_CN: update DAMON reclaim translation
  [PATCH v6 7/7] docs/zh_CN: update DAMON LRU sort translation

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260708073246.1652828-1-doehyunbaek@gmail.com/


* Jiandong Qiu (2026-07-06) 2 commits
  [PATCH v3 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
  [PATCH v3 1/2] docs/zh_CN: add process/changes.rst translation
  [PATCH v3 2/2] docs/zh_CN: update sphinx.rst translation

  Needs review.

  cf. https://lore.kernel.org/linux-doc/ak1SG5mw7y2UZrvR@wyuan.org/
  source: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/


* Yan Zhu (2026-06-12) 10 commits
  [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
  [PATCH 01/10] docs/zh_CN: add LSM/index Chinese translation
  [PATCH 02/10] docs/zh_CN: add LSM/apparmor Chinese translation
  [PATCH 03/10] docs/zh_CN: add LSM/LoadPin Chinese translation
  [PATCH 04/10] docs/zh_CN: add LSM/SELinux Chinese translation
  [PATCH 05/10] docs/zh_CN: add LSM/Smack Chinese translation
  [PATCH 06/10] docs/zh_CN: add LSM/tomoyo Chinese translation
  [PATCH 07/10] docs/zh_CN: add LSM/Yama Chinese translation
  [PATCH 08/10] docs/zh_CN: add LSM/SafeSetID Chinese translation
  [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
  [PATCH 10/10] docs/zh_CN: add LSM/landlock Chinese translation

  Needs review.

  Cover letter: https://lore.kernel.org/linux-doc/tencent_001080DF135CEE2CD1B260EFA08E3CC71A09@qq.com/
  Patch 01/10: https://lore.kernel.org/linux-doc/tencent_7080BF6BB8F05936649DDC091FFD8C45210A@qq.com/
  Note: the cover letter and following patched are not threaded correctly

-----------------------------------------------------------------------

[Stalled]

* Haoyang Liu (2026-03-05) 1 commit
  [PATCH] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overview

  Expecting a reroll.

  cf. https://lore.kernel.org/linux-doc/29bd0dbc-c6f9-43ce-b95f-4e787e3fe9c3@gmail.com/
  source: https://lore.kernel.org/linux-doc/20260305192048.16405-1-tttturtleruss@gmail.com/
