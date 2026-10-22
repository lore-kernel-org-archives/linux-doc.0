Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686889;
	b=eoC076KMQ9EJJUEG76qPRTEFVEKE3+Qwr5ocJpXsPsKfWaETXkq66Q4mCoFthdKGP/ut
	 DKMXQrQXIQE2fL4EVYvhQzLs2pmWn2/aGIbCSkb20oFIfrzOiof8mwIIN7TR2MkwNZNt8
	 iuwGJi0mFXZhTn6oaaihwcvHswOkUTxNdHgNTPE8Ik2z2x7f3BsZyZgB+xKDo2ZtT5K+Q
	 2bIhRA4dOoP+TuYftqeCKLlRGT9rqaDlKnANXxdtb1d7yGDR3g+HiijACRHejD3U79Spu
	 77dokfafNtC+NohQh0c0lRg13WdRtNSn3/ZSbnbI21RZ+AiXmuyqTERFXokyLi+WipA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686889;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=hNGzzD7TiusRExrDn77909NZrHNjcSFiJdBjcbHaO34=;
	b=A/p2KGpBHrxrPCftMTEbyMWJEvIOjVjqOJqWtpFZ1zW80be7ScHzoyVELO9jcIUrYXnk
	 TNz5tD9CtPl9qojDa4GS4W7l1gDtlX5eb1xGqQkBf4fXURZiu7VQ2dsG6CiUjFMpb/B9y
	 urD0JXq2wmeebImLExyfgWQ9hQlq0AYB3Q7SEwcjsHCSDNEBj5lBKlERftL7rGwf2i8V5
	 PJ2Wu+ObQlqGZ8sTJ5uQLiHLoAPN6nlWcxW/iwwSqEcayRBzPio9cQOOljtV2RVEGOhFP
	 uSUwX1o//W0dzUs/XI6sNE87cbf0mCXOr7tqy7xF76Oh3M3exscRV+5egV1djzyJOvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=dhUcSdWJ;
	arc=none smtp.remote-ip=91.218.175.127
Received: from mta0.migadu.com (out-127.mta0.migadu.com [91.218.175.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053DE606A319
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 16:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 053DE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=dhUcSdWJ
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bQ8QEgZYNrILq3e0ZZlgFwkoKqzJuQA3YkmyPUiqHwE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792686886; v=1; x=1793291686;
 b=dhUcSdWJiDc39cetoHivOQwKsMwBAdpCcNG639E3voB2+DVeCyqIkrgp7ppuJRLbMO4umbTj
 /n0dCc4MJA/bcMENKUJEDdEakHluScpXGCVxI6POjmCP+eWyvlm8gbqk33vxPllgh/E1bUE4rNf
 Okc1SdOTjEJCTZbq7zX7AP0utKb3Vjm+dhsMkqm9teBjScqMHJQMDczuoQA6za9mo08ClOL/3Yn
 s+PPUdJgk+eR/TzQ7+3l0cprSFIR6plb5095fxYmWLwDQ5H4zgulDptvu36qb45NxynJXS2/sVj
 FHJs7EwvbPCvveRBync7m3lgMJnK0iy5ib9XIYltdHUiQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6817c44a38c32fda;
	Thu, 22 Oct 2026 16:34:46 +0000
X-Mizu-Trace-ID: 6817c44a38c32fda
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 00:34:36 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>
Subject: What's cooking in Chinese docs (Oct 2026, #01)
Message-ID: <ato7HFcueSGrDzf4@wyuan.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
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

-----------------------------------------------------------------------

[Cooking]

* Yao Yiqi 2026-10-22
  [PATCH] docs/zh_CN: fix typos in admin-guide/README

  Reviewed by Dongliang.
  source: <20261022135949.361566-1-yyaqia@gmail.com>


* Yikun Wei 2026-10-20
  [PATCH v3 0/5] docs/zh_CN: add fault-injection Chinese translations
  [PATCH v3 1/5] docs/zh_CN: add fault-injection index Chinese translation
  [PATCH v3 2/5] docs/zh_CN: add fault-injection Chinese translation
  [PATCH v3 3/5] docs/zh_CN: add notifier-error-inject Chinese translation
  [PATCH v3 4/5] docs/zh_CN: add nvme-fault-injection Chinese translation
  [PATCH v3 5/5] docs/zh_CN: add provoke-crashes

  Needs review.
  source: <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>


* Weijie Yuan 2026-10-21
  [PATCH v2 0/2] docs/zh_CN: cleanup headers
  [PATCH v2 1/2] docs/zh_CN: remove translator-related headers
  [PATCH v2 2/2] docs/zh_CN: remove Translator field in header template

  Needs review.
  source: <cover.1792569583.git.wy@wyuan.org>


* Jiaming Ouyang 2026-10-11
  [PATCH RESEND v3] docs/zh_CN: add Chinese translation for usb/ohci.rst

  Needs review.
  source: <20261011150310.51673-1-jiamingouyang13@gmail.com>
  warning: multiple duplicate versions on the list.


* Chen-Yu Yeh 2026-09-29
  [PATCH 0/3] docs/zh_TW: mark translations that are not kept in sync
  [PATCH 1/3] docs/zh_TW: add a notice for translations not kept in sync
  [PATCH 2/3] docs/zh_TW: mark translations outside the maintained set
  [PATCH 3/3] docs/zh_TW: link filesystems/ and cpu-freq/ from the index

  Acked by Weijie.
  source: <20260929131142.266819-1-chenyou910331@gmail.com>


* Chen-Yu Yeh 2026-09-29
  [PATCH] docs/zh_TW: remove the unreachable plain-text translations Chen-Yu Yeh

  Acked by Weijie.
  source: <20260929131109.266535-1-chenyou910331@gmail.com>


* Chen-Yu Yeh 2026-09-29
  [PATCH 0/4] docs/zh_TW: relocate translations to follow the English layout
  [PATCH 1/4] docs/zh_TW: move security-bugs to process/
  [PATCH 2/4] docs/zh_TW: move magic-number to staging/
  [PATCH 3/4] docs/zh_TW: move gdb-kernel-debugging to process/debugging/
  [PATCH 4/4] docs/zh_TW: add missing :Original: fields

  Reviewed by Weijie.
  source: <20260929131020.266120-1-chenyou910331@gmail.com>


* Chen-Yu Yeh 2026-09-29
  [PATCH v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
  [PATCH v2 1/7] docs/zh_TW: process: remove maintainer contact information
  [PATCH v2 2/7] docs/zh_TW: admin-guide: remove maintainer contact information
  [PATCH v2 3/7] docs/zh_TW: arch: remove maintainer contact information
  [PATCH v2 4/7] docs/zh_TW: dev-tools: remove maintainer contact information
  [PATCH v2 5/7] docs/zh_TW: filesystems: remove maintainer contact information
  [PATCH v2 6/7] docs/zh_TW: cpu-freq: remove maintainer contact information
  [PATCH v2 7/7] docs/zh_TW: remove the last maintainer contact references

  Acked by Weijie.
  source: <20260929115956.229610-1-chenyou910331@gmail.com>


* Rénich Bon ´Ciri´c 2026-09-20
  [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst

  Needs review.
  source: https://lore.kernel.org/linux-doc/20260920073144.546566-1-renich@evalinux.com/


* Weijie Yuan 2026-09-05
  [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
  [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
  [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests translation

  Needs review.
  source: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>


* Yukai Wu 2026-08-29
  [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation

  Expecting a re-roll?
  source: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>


* Weijie Yuan 2026-08-23
  [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
  [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation Weijie Yuan
  [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements Weijie Yuan
  [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link Weijie Yuan
  [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference Weijie Yuan
  [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintainer PGP guide

  Needs review.
  source: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>


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
  source: <20260819025535.2967566-1-ye.liu@linux.dev>


* Cui Shuang 2026-07-22 1 commit
  [PATCH v3] docs/zh_CN: Add configurable error injection translation

  Waiting for response & Expecting a re-roll.
  source: <20260722123240.22979-1-imcusg@gmail.com>


* Jiandong Qiu (2026-07-06) 2 commits
  [PATCH v3 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
  [PATCH v3 1/2] docs/zh_CN: add process/changes.rst translation
  [PATCH v3 2/2] docs/zh_CN: update sphinx.rst translation

  Needs review.
  source: <20260706151358.2103703-1-qiujiandong1998@gmail.com>


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
  source: <tencent_7080BF6BB8F05936649DDC091FFD8C45210A@qq.com>
