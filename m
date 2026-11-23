Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446377;
	b=4CfiUMe8XZ2VuYckwn2iFgVx+g9hboi2W5hqWYz3EG01kYMkJIdeEeuNf2XkKtmNuAB0
	 63u35+NlI7d5dBcTwIb2Y5zuTRJ3QgU9936v6U9newF5U1AQVInVOg7x+kAz6i/wBlBAd
	 ouweDcMpnCdHN9OLLMF8Npej9Snbbq6J05wacfV6vlJqiLMKfyL8SOYXMta2mzEY+4EWW
	 PxGIU/ATPFzkFShOlYKm6XfrTmNpr/QUUX/X3hcwdzcHPeK5eCZ1bJ+/2ANai3zIp9nHq
	 Ei/+w+DR+T8ZveLLJ/LprZPslOJi/KA7gvvlcAD//KXhWQiQA3kNWuWPRZiOE5Y9MAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446377;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ixJwlAARdgh0Cxf0g5QPRlQxNvyxtZpna6OPeWioUbc=;
	b=Zd/QIDnl4jKsFyROAzDm8+mnIJMbUS6eKMp9jAzTMuTVPJx5YmqW18AUMuONNjgnWyrn
	 Osa//GiRGSky2Ua3D5W0f+fgT6Zx6RrnYC/0zJZEtlpyI+JSTJKh1U1FA0Qa98k/Ef5Bp
	 1N6z32wNsVVgmqIDOu8geCHkWmO2IzJ6U2yI/AGKlfgF/pHK8nhAEq/olSKXQlK+XOlKn
	 TbFAncwaGPVexRJAOx31qFuts1pAWiXBltGOf8U9EJv/VkykPfqx/NcfcIcasNlxjjobk
	 2tM/rxA88pCzMjkfC97ziayYRaPV5bw0cu9Cex8WPFaPttJyDyYLpbEFgGdWauql6Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=peruyAcA;
	arc=none smtp.remote-ip=91.218.175.37
Received: from mta0.migadu.com (out-37.mta0.migadu.com [91.218.175.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F09E606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F09E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=peruyAcA
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y/9MBlxOxCyM4WCS+EfGefku2WmVqUYtCfJm9kzgXOo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795446371; v=1; x=1796051171;
 b=peruyAcA9tAbsMCAmIdRCMMPmLabEYPAJMLIP0wHQc0HQ1KE/IRyT/qjNpyXj3RJxbNk1iQR
 iu/i+VGqSuXGhtTYJMZVfxhsVGaYg0RZjFx8hA9C9mjmVH2WbFKX4vCWzBSx3pCnulUJln5GPNI
 6fkL7Jc9mydDCZqweU9QKR5eZS7/85YX9i1gzs+GRSLnv3tCpDgbwhbTfobpfDYIEgLeHIEFz/W
 VZc2ePAHjGC3O8HTsM1qJDwtifz28Cg455UwuA4CcncRKTL/4ZR6C9j9mlIBuUGzVeABJpBqtis
 hP+iMWbAdMmBkhdXNhDx8JhDaO8wUpRtPni+/xZJFbCdw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27632bf58a89b104;
	Mon, 23 Nov 2026 15:06:11 +0000
X-Mizu-Trace-ID: 27632bf58a89b104
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 23:06:07 +0800
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>
Subject: What's cooking in Chinese docs (Nov 2026, #05)
Message-ID: <awRWXw8KsV_TJs9A@wyuan.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Here are the topics for Chinese docs waiting to be merged.

Copies of the source code to Chinese documentation development tree live
in here:

    git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
    https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
    https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git

Mirrors:

    https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
    https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)

Please report any mirror instability to linux-doc@vger.kernel.org

-------------------------------------------------------------------
[Cooking]

* Chen-Yu Yeh 2026-11-23
  [PATCH v2 00/25] docs/zh_TW: process: resync translations with the English originals
  [PATCH v2 01/25] docs/zh_TW: process: sync 1.Intro.rst with the English original
  [PATCH v2 02/25] docs/zh_TW: process: sync 2.Process.rst with the English original
  [PATCH v2 03/25] docs/zh_TW: process: sync 4.Coding.rst with the English original
  [PATCH v2 04/25] docs/zh_TW: process: sync 5.Posting.rst with the English original
  [PATCH v2 05/25] docs/zh_TW: process: sync 6.Followthrough.rst with the English original
  [PATCH v2 06/25] docs/zh_TW: process: sync 7.AdvancedTopics.rst with the English original
  [PATCH v2 07/25] docs/zh_TW: process: sync 8.Conclusion.rst with the English original
  [PATCH v2 08/25] docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the English original
  [PATCH v2 09/25] docs/zh_TW: process: sync code-of-conduct.rst with the English original
  [PATCH v2 10/25] docs/zh_TW: process: sync gdb-kernel-debugging.rst with the English original
  [PATCH v2 11/25] docs/zh_TW: process: sync development-process.rst with the English original
  [PATCH v2 12/25] docs/zh_TW: process: sync email-clients.rst with the English original
  [PATCH v2 13/25] docs/zh_TW: process: sync kernel-driver-statement.rst with the English original
  [PATCH v2 14/25] docs/zh_TW: process: sync kernel-enforcement-statement.rst with the English original
  [PATCH v2 15/25] docs/zh_TW: process: sync management-style.rst with the English original
  [PATCH v2 16/25] docs/zh_TW: process: sync security-bugs.rst with the English original
  [PATCH v2 17/25] docs/zh_TW: process: sync volatile-considered-harmful.rst with the English original
  [PATCH v2 18/25] docs/zh_TW: process: sync 3.Early-stage.rst with the English original
  [PATCH v2 19/25] docs/zh_TW: process: sync coding-style.rst with the English original
  [PATCH v2 20/25] docs/zh_TW: process: sync embargoed-hardware-issues.rst with the English original
  [PATCH v2 21/25] docs/zh_TW: process: sync howto.rst with the English original
  [PATCH v2 22/25] docs/zh_TW: process: sync license-rules.rst with the English original
  [PATCH v2 23/25] docs/zh_TW: process: sync stable-api-nonsense.rst with the English original
  [PATCH v2 24/25] docs/zh_TW: process: sync submit-checklist.rst with the English original
  [PATCH v2 25/25] docs/zh_TW: process: sync submitting-patches.rst with the English original

  Needs review.
  source: <20261123110217.170025-1-chenyou910331@gmail.com>


* Chen-Yu Yeh 2026-11-23
  [PATCH v2 00/13] docs/zh_TW: process: add translations of 13 documents
  [PATCH v2 01/13] docs/zh_TW: process: add researcher-guidelines.rst translation
  [PATCH v2 02/13] docs/zh_TW: process: add cve.rst translation
  [PATCH v2 03/13] docs/zh_TW: process: add applying-patches.rst translation
  [PATCH v2 04/13] docs/zh_TW: process: add maintainer-pgp-guide.rst translation
  [PATCH v2 05/13] docs/zh_TW: process: add changes.rst translation
  [PATCH v2 06/13] docs/zh_TW: process: add handling-regressions.rst translation
  [PATCH v2 07/13] docs/zh_TW: process: add deprecated.rst translation
  [PATCH v2 08/13] docs/zh_TW: process: add kernel-docs.rst translation
  [PATCH v2 09/13] docs/zh_TW: process: add maintainer-handbooks.rst translation
  [PATCH v2 10/13] docs/zh_TW: process: add contribution-maturity-model.rst translation
  [PATCH v2 11/13] docs/zh_TW: process: add conclave.rst translation
  [PATCH v2 12/13] docs/zh_TW: process: add threat-model.rst translation
  [PATCH v2 13/13] docs/zh_TW: process: add maintainers.rst translation

  Needs review.
  source: <20261123110637.172045-1-chenyou910331@gmail.com>


* Zixin Wang 2026-11-21
  [PATCH v2] docs/zh_CN: Add core-api/irq managed_irq Chinese translation

  Needs review.
  source: <20261120160539.103773-1-w1355457260@gmail.com>


* Xiongwei Song 2026-11-18
  [PATCH v2 0/2] Add RCU docs Chinese translation
  [PATCH v2 1/2] docs/zh_CN: Add RCU/index.rst translation
  [PATCH v2 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation

  Waiting for response.
  cf. <09ef3d3d-0e68-49c6-a6a2-c754104ede9e@hust.edu.cn>
  source: <20261118131636.5131-1-xiongwei.song@linux.dev>


* Yikun Wei 2026-11-17
  [PATCH v2 0/4] docs/zh_CN: Add four process translations
  [PATCH v2 1/4] docs/zh_CN: Add contribution maturity model translation
  [PATCH v2 2/4] docs/zh_CN: Add deprecated translation
  [PATCH v2 3/4] docs/zh_CN: Add backporting translation
  [PATCH v2 4/4] docs/zh_CN: Add botching-up-ioctls translation

  Waiting for response.
  cf. <avxh6NCMrsJI3f_x@wyuan.org>
  cf. <avx-ZOPV3q1VmSvm@wyuan.org>
  source: <20261117115527.27937-1-YikunWei@126.com>


* Yaoze Wang 2026-11-15
  [PATCH] docs/zh_CN: Add i3c Chinese translation

  Needs review.
  source: <20261115034307.15-1-wangyaoze999@gmail.com>


* Weijie Yuan 2026-11-09
  [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
  [PATCH v3 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
  [PATCH v3 2/2] docs/zh_CN: improve maintainer/pull-requests translation

  Reviewed by Dongliang.
  source: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>


* Dongliang Mu 2026-11-09
  [PATCH v2 0/4] docs/zh_CN: translate AI-related process guides
  [PATCH v2 1/4] docs/zh_CN: translate coding-assistants.rst
  [PATCH v2 2/4] docs/zh_CN: translate generated-content.rst
  [PATCH v2 3/4] docs/zh_CN: translate threat-model.rst
  [PATCH v2 4/4] docs/zh_CN: link AI guide to translated documents

  Reviewed by Weijie.
  source: <cover.1794197977.git.dzm91@hust.edu.cn>


* Dongliang Mu 2026-11-08
  [PATCH] docs/zh_CN: add clang-format guide translation

  Needs review.
  source: <20261108070826.2000511-1-dzm91@hust.edu.cn>


* Dongliang Mu 2026-10-29
  [PATCH v3 0/9] docs/zh_CN: align translation paths and update guides
  [PATCH v3 1/9] docs/zh_CN: update admin-guide/index.rst translation
  [PATCH v3 2/9] docs/zh_CN: update admin-guide/README.rst translation
  [PATCH v3 3/9] docs/zh_CN: add media administrator guide translations
  [PATCH v3 4/9] docs/zh_CN: reorganize process debugging guides
  [PATCH v3 5/9] docs/zh_CN: update magic-number to match upstream
  [PATCH v3 6/9] docs/zh_CN: reorganize media driver API translations
  [PATCH v3 7/9] docs/zh_CN: move GFS2 translations into filesystems/gfs2
  [PATCH v3 8/9] docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
  [PATCH v3 9/9] docs/zh_CN: remove stale Original fields from SCSI and IPE translations

  Reviewed by Yanteng.
  source: <20261029124429.294868-1-dzm91@hust.edu.cn>


* Jiandong Qiu 2026-10-29
  [PATCH v4 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
  [PATCH v4 1/2] docs/zh_CN: add process/changes.rst translation
  [PATCH v4 2/2] docs/zh_CN: update sphinx.rst translation

  Reviewed by Dongliang.
  source: <cover.1793279600.git.qiujiandong1998@gmail.com>


* Jiaming Ouyang 2026-10-28
  [PATCH v4] docs/zh_CN: add Chinese translation for usb/ohci.rst

  Expecting a reroll.
  cf. <fcabf691-cca4-477d-b387-e50467a41408@hust.edu.cn>
  source: <20261028072643.32250-1-jiamingouyang13@gmail.com>


* Yao Yiqi 2026-10-22
  [PATCH] docs/zh_CN: fix typos in admin-guide/README

  Reviewed by Dongliang.
  source: <20261022135949.361566-1-yyaqia@gmail.com>


* Weijie Yuan 2026-10-21
  [PATCH v3 0/2] docs/zh_CN: cleanup headers
  [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
  [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template

  Partly reviewed by Dongliang with an extra question to Jon.
  source: <cover.1792569583.git.wy@wyuan.org>


* Yikun Wei 2026-10-20
  [PATCH v3 0/5] docs/zh_CN: add fault-injection Chinese translations
  [PATCH v3 1/5] docs/zh_CN: add fault-injection index Chinese translation
  [PATCH v3 2/5] docs/zh_CN: add fault-injection Chinese translation
  [PATCH v3 3/5] docs/zh_CN: add notifier-error-inject Chinese translation
  [PATCH v3 4/5] docs/zh_CN: add nvme-fault-injection Chinese translation
  [PATCH v3 5/5] docs/zh_CN: add provoke-crashes

  Expecting a reroll. (thread broken)
  cf. <6baba360-6ee2-4195-91e4-d22c97d3c146@hust.edu.cn>
  source: <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>


* Weijie Yuan 2026-08-23
  [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
  [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation
  [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements
  [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link
  [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference
  [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintainer PGP guide

  Reviewed by Dongliang.
  source: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>


* Yan Zhu 2026-06-12
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

  Waiting for response.
  cf. <895533d5-99d7-406e-acc2-1f8659075f91@hust.edu.cn>
  cf. <440378d6-d72c-4edd-9159-582df02b49e6@hust.edu.cn>
  cf. <e708b270-3adc-4c7e-a48d-9804faed6c44@hust.edu.cn>
  source: <tencent_7080BF6BB8F05936649DDC091FFD8C45210A@qq.com>

-------------------------------------------------------------------
[Queuing] #zh_TW

Queuing for 7.5 merge window.
Currently here: https://github.com/kernel-zh/linux-zh_TW.git docs-next
If anyone has any objections, please let us know.

* Weijie Yuan 2026-10-30
  [PATCH v2] docs/zh_TW: drop unused enforcement statement label

  Will be queued after Chen-Yu's two new series land.
  source: <auQwssHcQiM09SDd@wyuan.org>


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

-------------------------------------------------------------------
[Discarded]

* Yikun Wei 2026-11-15
  [PATCH] docs/zh_CN: Add botching-up-ioctls translation

  Replaced by a complete series.
  source: <20261115125052.59015-1-YikunWei@126.com>


* Yikun Wei 2026-11-14
  [PATCH] docs/zh_CN: Add backporting translation

  Replaced by a complete series.
  source: <20261114043633.7459-1-YikunWei@126.com>


* Yikun Wei 2026-11-13
  [PATCH] docs/zh_CN: Add deprecated translation

  Replaced by a complete series.
  cf. <6a11fb6c-53f8-4804-859c-dcdb28ddce4b@hust.edu.cn>
  source: <20261113122844.24838-1-YikunWei@126.com>


* Yikun Wei 2026-11-13
  [PATCH] docs/zh_CN: Add contribution maturity model translation

  Replaced by a complete series.
  cf. <0b283f1a-d516-4fb6-b5bc-e3171d9c291a@hust.edu.cn>
  source: <20261113112200.16790-1-YikunWei@126.com>

