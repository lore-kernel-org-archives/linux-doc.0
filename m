Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC873C3C07
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963006; cv=none; b=u7Y9FysicYIOzRQy6uNEtK+0gxRcuzm9OS+mKXfDzWd11+yoX9Gu1Cg3CodIXAkoURNkD+rq3QQz0RE7Md93ynsUmyYlBDD/zDZ7Hh8yAwB0ZbM5IfzOWPObFZ2zZJYgTwYpsDxZcW2I83sIMwpXc0stS675lzbRimMV707chvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963006; c=relaxed/simple;
	bh=TboSaKyP449rmtFzGUevULzWv0D95fXaDBJsgPFHDmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n1byGF32SzzpjLJZH++94ge5+Tmv1afpU433Of4OsrXsCJHxie3h8+Fe0VpRiPzzOxw9C1tv0uAmWAgSvxQesVA4z9wbywocMTUcht13csvW6ME3mcEpUMcGi3wMYyu9gHF89nYzARZqrdCN180jpcBm8ohp8oHbgk1V7rUuUKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=UQtMoW4H; arc=none smtp.client-ip=95.215.58.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="UQtMoW4H"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TboSaKyP449rmtFzGUevULzWv0D95fXaDBJsgPFHDmI=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786963001; v=1; x=1787567801;
 b=UQtMoW4HJicNP0djZcP6PkYvXQa/XBHadofT9OvdIJk9Tr35ZougJnP5Kn/8D5hg+Vp9kAtJ
 rkaAMeP8+4sgKJ6a+Bj5xAEJmeaBAXZW4ZLsdEWaUgcIgYDSr+eg5rQUZEUX3t2hMVXdTD7Nk6g
 1fF22U6D/mYXRdooR7j2f/oEFmF56M1uWRXU3Fc0vDJPkJwGvuEarOY3S5i7abhGk0D6aFDuB7d
 qpK/OMVBQ6P5BSGprgiVaag54GelYmDiEZzv0rMxxg9OJ7m7hhPgIyk0p935tAHClCc1tW78uom
 ogvK5kBwwttnSUdmS+GVtTZCct6FAxbYgXa6/ABLzaAzA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 0cb1bea5c4b934ff;
	Mon, 17 Aug 2026 10:36:41 +0000
X-Migadu-Flow: FLOW_OUT
Date: Mon, 17 Aug 2026 18:36:32 +0800
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: What's cooking in Chinese docs (Aug 2026, #01)
Message-ID: <aoLkMBQszbzqYowy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Here are the topics waiting to be merged.

Sorry for the late update.

Last time, a contributor mentioned that he did not want to be copied, so
this time I will only send it to the maintainer. Meanwhile, I am looking
forward to the emergence of an automated system for our work. ;-)


Copies of the source code to Chinese documentation development tree live
in here:

    git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
    https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
    https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs linux.git

Mirrors:

    https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
    https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)

Please report any mirror instability to linux-doc@vger.kernel.org

-----------------------------------------------------------------------

[Cooking]

* Siwei Chen 2026-08-17 5 commits
  [PATCH v4 1/5] docs/zh_CN: Add networking team documentation Chinese translation
  [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
  [PATCH v4 3/5] docs/zh_CN: Add Softnet Driver Issues Chinese translation
  [PATCH v4 4/5] docs/zh_CN: Add ipv6 Chinese translation
  [PATCH v4 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese translation

  Needs review & final round?

  source: https://lore.kernel.org/linux-doc/20260817021340.17318-1-anka@stu.cdut.edu.cn/


* Weijie Yuan 2026-08-16 3 commits
  [PATCH v3 0/2] docs/zh_CN: translate process/applying-patches.rst into Chinese
  [PATCH v3 1/2] docs/zh_CN: add process/applying-patches Chinese translation
  [PATCH v3 2/2] docs/zh_CN: link to Chinese applying-patches translation

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org/


* Chen Miao 2026-08-14 2 commits
  [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
  [PATCH v4 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup

  Waiting for a separated translation series, as suggested by Dongliang.

  comment: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/
  source: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/ (PATCH 5/6)
  source: https://lore.kernel.org/linux-doc/20260814214419.49925-6-chenmiao.ku@gmail.com/ (PATCH 6/6)


* Doehyun Baek 2026-08-12 7 commits
  [PATCH v7 0/7] docs/zh_CN: update DAMON translations
  [PATCH v7 1/7] docs/zh_CN: update DAMON design translation
  [PATCH v7 2/7] docs/zh_CN: add DAMON_STAT usage translation
  [PATCH v7 3/7] docs/zh_CN: update DAMON index translation
  [PATCH v7 4/7] docs/zh_CN: update DAMON start translation
  [PATCH v7 5/7] docs/zh_CN: update DAMON usage translation
  [PATCH v7 6/7] docs/zh_CN: update DAMON reclaim translation
  [PATCH v7 7/7] docs/zh_CN: update DAMON LRU sort translation

  Waiting for response.

  comment: https://lore.kernel.org/linux-doc/b408e294-2768-4be8-a6d8-81acff90c556@hust.edu.cn/
  source: https://lore.kernel.org/linux-doc/20260812065914.3071433-1-doehyunbaek@gmail.com/


* Chen-Yu Yeh 2026-08-07 16 commits (zh_TW)
  [PATCH v3 00/16] docs/zh_TW: localize terminology and sync process/ documents
  [PATCH v3 01/16] docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
  [PATCH v3 02/16] docs/zh_TW: process: localize terminology in 1.Intro.rst
  [PATCH v3 03/16] docs/zh_TW: process: localize terminology in code-of-conduct-interpretation.rst
  [PATCH v3 04/16] docs/zh_TW: process: localize terminology in license-rules.rst
  [PATCH v3 05/16] docs/zh_TW: process: localize terminology in email-clients.rst
  [PATCH v3 06/16] docs/zh_TW: process: localize terminology in programming-language.rst
  [PATCH v3 07/16] docs/zh_TW: process: localize terminology in coding-style.rst
  [PATCH v3 08/16] docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
  [PATCH v3 09/16] docs/zh_TW: process: localize terminology in 5.Posting.rst
  [PATCH v3 10/16] docs/zh_TW: process: localize terminology in 2.Process.rst
  [PATCH v3 11/16] docs/zh_TW: process: localize terminology in howto.rst
  [PATCH v3 12/16] docs/zh_TW: process: localize terminology in embargoed-hardware-issues.rst
  [PATCH v3 13/16] docs/zh_TW: process: localize terminology in submitting-patches.rst
  [PATCH v3 14/16] docs/zh_TW: process: localize terminology in 8.Conclusion.rst
  [PATCH v3 15/16] docs/zh_TW: process: localize terminology in index.rst
  [PATCH v3 16/16] docs/zh_TW: Add a glossary for Traditional Chinese translations

  Ready to be merged?

  comment: https://lore.kernel.org/linux-doc/anx4SPAL0Yx13xk5@wyuan.org/
  comment: https://lore.kernel.org/linux-doc/CAKspUhKM6mBpy7hZD=8ZnwrAy81O1sYC_g7QdCA3qVDUcLV6dw@mail.gmail.com/
  source: https://lore.kernel.org/linux-doc/20260806181949.65648-1-chenyou910331@gmail.com/


* Ye Liu 2026-08-06 1 commit
  [PATCH v2] docs/zh_CN: sync page_table_check.rst translation

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260806013055.2690464-1-ye.liu@linux.dev/


* Cui Shuang 2026-07-22 1 commit
  [PATCH v3] docs/zh_CN: Add configurable error injection translation

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260722123240.22979-1-imcusg@gmail.com/


* Jiandong Qiu (2026-07-06) 2 commits
  [PATCH v3 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
  [PATCH v3 1/2] docs/zh_CN: add process/changes.rst translation
  [PATCH v3 2/2] docs/zh_CN: update sphinx.rst translation

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/


* Yan Zhu (2026-06-12) 10 commits
  [not found] <cover.1781105672.git.zhuyan2015@qq.com>
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

  source: https://lore.kernel.org/linux-doc/tencent_7080BF6BB8F05936649DDC091FFD8C45210A@qq.com/

  ps. I suspect the reason why cover letter was missing is that the user was
  using QQ mail or Tencent Enterprise Email, which would break the message-ID
  of cover letter. Hence the cover letter is somewhere else on the lore
  archive.


* Kefan Bai 2026-06-01 1 commit
  [PATCH v4] docs/zh_CN: usb: refine translated wording and formatting

  Needs review.

  (Looks like the other 8 commits in the same thread have been merged into
  mainline through Greg KH's tree)

  source: https://lore.kernel.org/linux-doc/20260601082652.650303-1-baikefan@leap-io-kernel.com/

-----------------------------------------------------------------------

[Stalled]

* Haoyang Liu (2026-03-05) 1 commit
  [PATCH] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overview

  No response for too long, will discard.

  comment: https://lore.kernel.org/linux-doc/29bd0dbc-c6f9-43ce-b95f-4e787e3fe9c3@gmail.com/
  source: https://lore.kernel.org/linux-doc/20260305192048.16405-1-tttturtleruss@gmail.com/


Thanks.
