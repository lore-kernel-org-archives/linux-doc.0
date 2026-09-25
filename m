Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836B30274D
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 04:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790308921; cv=none; b=Va8djhFv/UQNqPWfNR4Tat0+bN1HQf4K1tHs9g34T8KelkvntKO0KZi+byOrsErjuBOHNvc1UsI/78uESfmRYicmf/b+RLN6erLVP4FXoNsQIBNXRQ9OPzetD6Nbgwz8VBIKyJbP/4evCsd7iWvyKqi/YorPUJL4bqaycDPOxBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790308921; c=relaxed/simple;
	bh=GrVFIyoIV5rjdCEVrJaQXqcpqXxthkYdx247tguJsOg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=smD+ocKNxfkznUwRfgpVPawGpihHpiv699/6K4bPvlVn7rBvqKtelV1LmpmVusYloYJkCWIRNasdRxkde4zIbSErMmCtk38TdJouwji7E3GGBNxSwg0SEA+6xZtzInqVfJlA9D+El0NHIntWviAofhpmtjK3TYlzvioLMS/UhIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=YiwvUK/s; arc=none smtp.client-ip=91.218.175.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="YiwvUK/s"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GrVFIyoIV5rjdCEVrJaQXqcpqXxthkYdx247tguJsOg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790308915; v=1; x=1790913715;
 b=YiwvUK/stFfOeeoAY+tASThZri+lHON467YEicjJ97yJfR5Nxkdxw/mwIyok2tWAEgHTclrA
 CKSEod9y5gnRG/HKQ6i9TNMRDfvQT1kFyTtTKGNtB6/9bi2qxk9sySgd8oJ6TL/fhxSjADpn9YL
 UbhWUxhjq5a3HHbMFCIs7VLGX3nm5FDCBix5YU1nde/Ylr/1VxHa/RstMYEtFZi3kKm3PgrKgRx
 akS2J9xdr3EtR9ZFF9SNMZfijxmnBLZ0klA+vKqqD0wHhF1UgRj6qwE0w3lIQ0MYi0rCn1x3Ip+
 9yaCG9UP9CUiVnj7FHE2FPcCGuSUgp4OrvLRd3tS9khiw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 977fcf42e10c7c5b;
	Fri, 25 Sep 2026 04:01:55 +0000
X-Mizu-Trace-ID: 977fcf42e10c7c5b
X-Migadu-Flow: FLOW_OUT
Date: Fri, 25 Sep 2026 12:01:48 +0800
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Subject: What's cooking in Chinese docs (Sep 2026, #01)
Message-ID: <arXyLM6kiUozClfs@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Here are the topics waiting to be merged.

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

[Note]

Continuing with the work by Doehyun Baek, I made a dashboard for Chinese
documentation patches, which is available at:

  https://buding.wyuan.org/ (cloudflare)
  https://buding.anka2.top/ (domestically faster)

In general, it brings a feature that enables maintainers to specify a
patch series status without having to log in (using a key instead).
But this still needs to be further tested.

Special thanks to Siwei for voluntarily completing a part of the work!

Low-quality code was unintentional but inevitable, please direct point
it out.


Happy Mid-Autumn Festival!

-----------------------------------------------------------------------

[Cooking]

* Rénich Bon ´Ciri´c 2026-09-20
  [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260920073144.546566-1-renich@evalinux.com/


* Jiaming Ouyang 2026-09-09
  [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst

  Needs review.

  source: https://lore.kernel.org/linux-doc/CAMnqnYwK6HDwV3jRLNWYTfB_w2NmQYn=LRQ41VoWYU53CWd6FA@mail.gmail.com/


* Weijie Yuan 2026-09-05
  [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
  [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
  [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests translation

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org/


* Yukai Wu 2026-08-29
  [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation

  Expecting a re-roll?

  source: https://lore.kernel.org/linux-doc/20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com/


* Weijie Yuan 2026-08-23
  [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
  [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation Weijie Yuan
  [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements Weijie Yuan
  [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link Weijie Yuan
  [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference Weijie Yuan
  [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintainer PGP guide

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org/


* Chen Miao 2026-08-14
  [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
  [PATCH v4 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup

  Waiting for a separated translation series, as suggested by Dongliang.

  comment: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/
  source: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/ (PATCH 5/6)
  source: https://lore.kernel.org/linux-doc/20260814214419.49925-6-chenmiao.ku@gmail.com/ (PATCH 6/6)


* Ye Liu 2026-08-19 1 commit
  [RESEND PATCH v2] docs/zh_CN: sync page_table_check.rst translation

  Waiting for response & Expecting a re-roll.

  source: https://lore.kernel.org/linux-doc/20260819025535.2967566-1-ye.liu@linux.dev/


* Cui Shuang 2026-07-22 1 commit
  [PATCH v3] docs/zh_CN: Add configurable error injection translation

  Waiting for response & Expecting a re-roll.

  source: https://lore.kernel.org/linux-doc/20260722123240.22979-1-imcusg@gmail.com/


* Jiandong Qiu (2026-07-06) 2 commits
  [PATCH v3 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
  [PATCH v3 1/2] docs/zh_CN: add process/changes.rst translation
  [PATCH v3 2/2] docs/zh_CN: update sphinx.rst translation

  Needs review.

  source: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/


* Yan Zhu (2026-06-12) 10 commits
  [PATCH 00/10] <cover.1781105672.git.zhuyan2015@qq.com>
   # Msgid changed
  [PATCH 00/10] docs/zh_CN: add LSM admin-guide Chinese translation
                https://lore.kernel.org/linux-doc/tencent_001080DF135CEE2CD1B260EFA08E3CC71A09@qq.com/
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


Any series missing?
