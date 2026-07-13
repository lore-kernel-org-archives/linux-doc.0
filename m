Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6312FDC27
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961398; cv=none; b=rvCkVQmslK9ObQnka7zNifqsq98NSAvQV8d/dqWZlo/x6OOFIKCuEsDDKNAPZSALWzIEhRibt6jDcrAMVYaJDhUkjH077O028mR+FHcvqziOOKzU7RkbTrGSu0C89ZmzrdD6zJrbJtPKPB/AVh3NF7DK+s+nM8uUOwdTpY+jFSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961398; c=relaxed/simple;
	bh=U0E0Mz+YDqc1tClJroUtAYvx8Sm1pnvqLo7RZZ2+c0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PKXRHTXU8DxHhgV1FT6T93DI4M3KTOpG8IoW3RPgWboSVB76Wn5EqVY3VmvtMgzkjUCrMFzSu+TVJisU32EZt1QgXB8DxRO5vbBWtX94t4o106jK9oAK1ub8hGyHHEL4+hqb8N36Wx+pqXqUUpqP4k1FE9p/zt9cTadlaLiMURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Lb2JvxFG; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Lb2JvxFG"
Date: Tue, 14 Jul 2026 00:49:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783961392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=YCSRsOuSGTtLJH+KiKqPZIJMp7LCbxws1pcv0D1nY+w=;
	b=Lb2JvxFGjLNkveuCw4hrA8meUNKyeLcPsoo58VMfomlNHufpBBX6QZmqe65JGRK6CCVMMw
	f2oHLBnrY1q8t/Au1hUrldI4kx4pjKLrdfzFsYGdL9cnx8cVlK8345/u5jQz5+5d/6PL75
	akmShDym7D1KHL0OSptQgeRs3w1p2G98cS0KQZX4VYWWQ2Tp4rbFYbCDNfcCJGz4Yf1slm
	lAlWtBT39z9SVHZh2aNZdsoZUaCGnkCALRdtLVy6FAQrWtWU0+forASe/1gtDKU3sKUbOr
	dwqbabU5affXHvL03FAa/tlgJF50eXoMm59YFikVJwBFUgTcNt20Kx4vrl9/mA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Ben Guo <ben.guo@openatom.club>,
	Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
	Doehyun Baek <doehyunbaek@gmail.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>,
	chengyaqiang <chengyaqiang@chengyaqiang.com>
Subject: What's cooking in zh_CN (Jul 2026)
Message-ID: <alUXH8qRRjno2eZG@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

Hi all,

Since I made many noise these days on the list, which took up a lot of
maintainers' time. This email summarizes the patches for zh_CN that are
currently pending on the mailing list.

-----------------------------------------------------------------------

* Ben Guo (2026-07-13) 4 commits
  [PATCH v2 0/4] docs/zh_CN: update rust documentation translations
  [PATCH v2 1/4] docs/zh_CN: Update rust/quick-start.rst translation
  [PATCH v2 2/4] docs/zh_CN: Update rust/general-information.rst translation
  [PATCH v2 3/4] docs/zh_CN: Update rust/arch-support.rst translation
  [PATCH v2 4/4] docs/zh_CN: Update rust/testing.rst translation

  Reviewed by Dongliang, a part needs to be revised. Expecting a reroll.

  cf. https://lore.kernel.org/linux-doc/17094968-1385-4dba-aae8-5d93a2aaf59e@hust.edu.cn/
  source: https://lore.kernel.org/linux-doc/cover.1783905132.git.ben.guo@openatom.club/

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

* Jiandong Qiu 2026-07-06 2 commits
  [PATCH v3 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
  [PATCH v3 1/2] docs/zh_CN: add process/changes.rst translation
  [PATCH v3 2/2] docs/zh_CN: update sphinx.rst translation

  Waiting for response(s) to review comment(s). & Needs review.

  cf. https://lore.kernel.org/linux-doc/ak1SG5mw7y2UZrvR@wyuan.org/
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
  Note: cover letter missing on lore archive.

* chengyaqiang (2026-05-22) 1 commit
  [PATCH] docs/zh_CN: fix KASAN SW_TAGS mode description

  Reviewed by Dongliang and Zenghui, will merge to docs-next @alex ?

  source: https://lore.kernel.org/linux-doc/20260522075735.2022734-1-chengyaqiang@chengyaqiang.com/

* Haoyang Liu (2026-03-05) 1 commit
  [PATCH] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overview

  Expecting a reroll.

  cf. https://lore.kernel.org/linux-doc/29bd0dbc-c6f9-43ce-b95f-4e787e3fe9c3@gmail.com/
  source: https://lore.kernel.org/linux-doc/20260305192048.16405-1-tttturtleruss@gmail.com/

-----------------------------------------------------------------------

Okay, I have checked the 200 most recent messages on the mailing list,
going back to 15:09 UTC on February 25, 2026. If I have missed anything,
or I made a mistake somewhere, please let me know.

As you may have noticed, I borrowed (stole) this idea from Junio C
Hamano. Sending this kind of message, somewhat like a weekly status
report, not only helps maintainers keep track of outstanding work, but
also lets contributors know the current status of their patches.

More importantly, it gives newcomers an overview of the current state of
the project. New contributors can begin not only by submitting patches,
but also by reviewing patches already posted to the mailing list,
thereby learning how our workflow operates. This may also help reduce
the review burden on our friendly maintainers.

I would like to try this kind of periodic report as an experimental
effort, with its frequency adjusted according to the size of the patch
backlog and the level of activity on the mailing list. What do you
think? Please feel free to make comments.

By the way, I borrowed the subject line directly from Git's "What's
cooking in git.git". Does anyone have a better suggestion for the name? ;-)

Thanks,
Weijie
