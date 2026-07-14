Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799E242A796
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040171; cv=none; b=uS14NSLK9cUOrQV94gLWsbZLgB42j8VHbj5SVm9tTeHcZX4Z8oQo1RBFHZqKYobXnb9d/iAdYs+/c6pRbBYWDHA/xcTqAZu9ncR4ZYoHeAwfxbB8SNlR8bI/ewmfOJJ6PpENDsheVh5SluzoSjSMkAvZXebNFFrcBGT374JnmpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040171; c=relaxed/simple;
	bh=/bs3RVNnnpyCI+9tK/qqUW9KcBxU39DEkHUFReoDM80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRcTjDg7dmrvypTqUkMYLifTplaaPrNYhVD6s3E93aI0WdZHyTOICDOZxHLOkCPN4PfEWgybrDDQLZETEU32BuULyLb+TYVnR8oVFRRvDV+2MSnW+Ze5oIOoUl9B8re4C0gsgXOpVqllVFh53pmfCtX5gcX/gfqZUEDd9k42VyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=gW93QrKS; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="gW93QrKS"
Date: Tue, 14 Jul 2026 22:42:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784040153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4jGF5R02/DzwI2bsXT2onDxZGLydMw8/OcMBa4fxAvc=;
	b=gW93QrKSX1gAQbQlss3+qQp3W4ocZirJ+5JZhrKSAHuLduD3KQrsZh7/l4Z1EqZaDz+H5t
	iKtZTAEbRx4cw8dhJpnduHCDLuq3CjQs48GCuDjsHoLKjKVypgDr9hSrpzmkaqrmtISBan
	5zEzUX0k8kdwFqs6zSFMXwc1SfY2Y4nUSFXu3lDVv02uHbvr21Zuuk00gDqvEOdBBZk0cS
	Eu7LAZqRo4Ucre/efCNvXCRBVxJ9uOubw/inhl9v6iA0+zTtHYvklp7VE1CfBu/WcJspSs
	JbDPUnln0m3V3f3ORJx8X328geJIMdOvVYG07zF9Cjbn/hW45y4kq19bCzAKJw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Ben Guo <ben.guo@openatom.club>,
	Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
	Doehyun Baek <doehyunbaek@gmail.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>,
	chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
	Haoyang Liu <tttturtleruss@gmail.com>
Subject: What's cooking in zh_CN (Jul 2026, #02)
Message-ID: <alZK0i0HvxOvSKwj@wyuan.org>
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

Here are the topics that have been cooking in Alex's tree.

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

NOTICE

The first "What's cooking" missed Haoyang Liu, and it so happens that
there are several topics graduating today, so the frequency of status
updates this time is relatively high.

The first time I cc'ed all relevant personnel. Is everyone happy to keep
it this way, or should I only send it to the list? I´m concerned that
unrelated discussions may create unnecessary noise in their inbox.

This report is experimental. Please feel free to offer your suggestions.

-----------------------------------------------------------------------

[Graduated to 'docs-next']

* Ben Guo (2026-07-14) 4 commits
  [PATCH v3 0/4] docs/zh_CN: update rust documentation translations
  [PATCH v3 1/4] docs/zh_CN: Update rust/quick-start.rst translation
  [PATCH v3 2/4] docs/zh_CN: Update rust/general-information.rst translation
  [PATCH v3 3/4] docs/zh_CN: Update rust/arch-support.rst translation
  [PATCH v3 4/4] docs/zh_CN: Update rust/testing.rst translation

  Merged into docs-next.

  source: https://lore.kernel.org/linux-doc/cover.1784000217.git.ben.guo@openatom.club/


* chengyaqiang (2026-05-22) 1 commit
  [PATCH] docs/zh_CN: fix KASAN SW_TAGS mode description

  Merged into docs-next.

  source: https://lore.kernel.org/linux-doc/20260522075735.2022734-1-chengyaqiang@chengyaqiang.com/

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

-----------------------------------------------------------------------

[Stalled]

* Haoyang Liu (2026-03-05) 1 commit
  [PATCH] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overview

  Expecting a reroll.

  cf. https://lore.kernel.org/linux-doc/29bd0dbc-c6f9-43ce-b95f-4e787e3fe9c3@gmail.com/
  source: https://lore.kernel.org/linux-doc/20260305192048.16405-1-tttturtleruss@gmail.com/
