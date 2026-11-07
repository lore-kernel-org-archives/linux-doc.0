Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794056582;
	b=EKVJwv8rCiMQCrJgDn9PxEfDhfLhy4CYWKt2m3z/ccWqwnmPGlx0FPVpCjMFEjYQoOdM
	 dnrkcxR0sdS1pNDGpeepN8kQuL2wc8DgGCKNhIw8dCliUporFnii1h1gphNZvH5d/gp4c
	 EdB6bC4F9/N6Uxbz4MmsdENnSekvvZkkpgqMdBB6Ar3h0vf7oFLqIM/6Nvd5EnVil5z0x
	 De0noEITlDRYyFN8XM5+pDtetqmm/Z/4XsG7AQyB/SYsJlM1GIyQ8I40ZWYXuK/srEKoH
	 fI1hzZlJkzGT1CHODnP+mdsn+9ScjF2NTjum2Dw3wzFlWsQl0ArWTAbWq4E5PPd5W8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794056582;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=K+7kfdJ/XMJjK9R4TR429flJ1bxsmlis7HvyqAJAN4E=;
	b=zrDRZDcMxXqVD+ktOwIRLuV3oOO7CCrZhk89QPU2G6nYry6fEfmrrbaObX/cYEh6YQvK
	 qjYwpL2UVze2GlxBu0IrrfdZdBT+I6tNv9Lk7oc4hMtj+GUv1oS0TLVmr6ywmLlMhYTIG
	 uSys0WVZdzY84M8OvJ3JOZxhpZrSs+bVBNPb4dhZ6JA5VGEALMRGS6u6QEKs9fRqponYJ
	 pr4C2vCsXZRaG8V5Ag5rUIQvQwPd8dZAu/DCC22yeTS8yNcjD0hBQWvMYBM5L9YCbWtre
	 MrKYwfCHCf3KF3cLggLLGgIQVx78oBNF1Ng0ZlG6HIQtLl7jqfIUgiWOFNJOI9HMesQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="kW/uswso";
	arc=none smtp.remote-ip=91.218.175.248
Received: from mta0.migadu.com (out-248.mta0.migadu.com [91.218.175.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735BA606A326
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 13:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 735BA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=kW/uswso
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XWzWJH6DPrqtShN+wktCIdkzVPdXNYZaIc9Gm39JsWw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794056578; v=1; x=1794661378;
 b=kW/uswsoLoOYokFChWIKOiLYKhHHAV5vxFZX6RhbJsDSIUUa0uGTSz2Y77wdDK8MPQ5UmSuj
 muf+qUH6Ncy+CeL8WPXFQLldFiogfudamJAUe5SSl8KOyoMw6nvYNpFOseRtdOUP8TsJ25ooZd+
 mo9z7zSY1MILEJkpb1BeiQr2wRj5QOoS0Y3UN9yhsXQSSxV9X6F0OE6mpCfPusTBjjxOoqCs5tf
 ZPCEUvDV9hCBWvVorKanSOURRblWTZDWU9WdVXM+s1Lxa4Iyd5r4YBxBWBPiqFUFpj/i59e2xTP
 ReWKTpq+D5ur/CwNrTCzZ5HeD3nBsESOXf8Lk7Jk/bayg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3f571317f96cf2f8;
	Sat, 07 Nov 2026 13:02:58 +0000
X-Mizu-Trace-ID: 3f571317f96cf2f8
X-Migadu-Flow: FLOW_OUT
Date: Sat, 7 Nov 2026 21:02:48 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>
Subject: What's cooking in Chinese docs (Nov 2026, #02)
Message-ID: <au8heODCJCmmCWKA@wyuan.org>
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

* Chen-Yu Yeh 2026-11-06
  [PATCH 00/13] docs/zh_TW: process: add translations of 13 documents
  [PATCH 01/13] docs/zh_TW: process: add researcher-guidelines.rst translation
  [PATCH 02/13] docs/zh_TW: process: add cve.rst translation
  [PATCH 03/13] docs/zh_TW: process: add applying-patches.rst translation
  [PATCH 04/13] docs/zh_TW: process: add maintainer-pgp-guide.rst translation
  [PATCH 05/13] docs/zh_TW: process: add changes.rst translation
  [PATCH 06/13] docs/zh_TW: process: add handling-regressions.rst translation
  [PATCH 07/13] docs/zh_TW: process: add deprecated.rst translation
  [PATCH 08/13] docs/zh_TW: process: add kernel-docs.rst translation
  [PATCH 09/13] docs/zh_TW: process: add maintainer-handbooks.rst translation
  [PATCH 10/13] docs/zh_TW: process: add contribution-maturity-model.rst translation
  [PATCH 11/13] docs/zh_TW: process: add conclave.rst translation
  [PATCH 12/13] docs/zh_TW: process: add threat-model.rst translation
  [PATCH 13/13] docs/zh_TW: process: add maintainers.rst translation

  Needs review.
  cf. <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
  source: <20261106113545.708896-1-chenyou910331@gmail.com>


* Chen-Yu Yeh 2026-11-06
  [PATCH 00/25] docs/zh_TW: process: resync translations with the English originals
  [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the English original
  [PATCH 02/25] docs/zh_TW: process: sync 2.Process.rst with the English original
  [PATCH 03/25] docs/zh_TW: process: sync 4.Coding.rst with the English original
  [PATCH 04/25] docs/zh_TW: process: sync 5.Posting.rst with the English original
  [PATCH 05/25] docs/zh_TW: process: sync 6.Followthrough.rst with the English original
  [PATCH 06/25] docs/zh_TW: process: sync 7.AdvancedTopics.rst with the English original
  [PATCH 07/25] docs/zh_TW: process: sync 8.Conclusion.rst with the English original
  [PATCH 08/25] docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the English original
  [PATCH 09/25] docs/zh_TW: process: sync code-of-conduct.rst with the English original
  [PATCH 10/25] docs/zh_TW: process: sync gdb-kernel-debugging.rst with the English original
  [PATCH 11/25] docs/zh_TW: process: sync development-process.rst with the English original
  [PATCH 12/25] docs/zh_TW: process: sync email-clients.rst with the English original
  [PATCH 13/25] docs/zh_TW: process: sync kernel-driver-statement.rst with the English original
  [PATCH 14/25] docs/zh_TW: process: sync kernel-enforcement-statement.rst with the English original
  [PATCH 15/25] docs/zh_TW: process: sync management-style.rst with the English original
  [PATCH 16/25] docs/zh_TW: process: sync security-bugs.rst with the English original
  [PATCH 17/25] docs/zh_TW: process: sync volatile-considered-harmful.rst with the English original
  [PATCH 18/25] docs/zh_TW: process: sync 3.Early-stage.rst with the English original
  [PATCH 19/25] docs/zh_TW: process: sync coding-style.rst with the English original
  [PATCH 20/25] docs/zh_TW: process: sync embargoed-hardware-issues.rst with the English original
  [PATCH 21/25] docs/zh_TW: process: sync howto.rst with the English original
  [PATCH 22/25] docs/zh_TW: process: sync license-rules.rst with the English original
  [PATCH 23/25] docs/zh_TW: process: sync stable-api-nonsense.rst with the English original
  [PATCH 24/25] docs/zh_TW: process: sync submit-checklist.rst with the English original
  [PATCH 25/25] docs/zh_TW: process: sync submitting-patches.rst with the English original

  Needs review.
  source: <20261106113142.706783-1-chenyou910331@gmail.com>


* Weijie Yuan 2026-10-30
  [PATCH v2] docs/zh_TW: drop unused enforcement statement label

  Will queue?
  source: <auQwssHcQiM09SDd@wyuan.org>


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

  Expecting a reroll. (thread broken)
  cf. <6baba360-6ee2-4195-91e4-d22c97d3c146@hust.edu.cn>
  source: <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>


* Weijie Yuan 2026-10-21
  [PATCH v3 0/2] docs/zh_CN: cleanup headers
  [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
  [PATCH v3 2/2] docs/zh_CN: remove Translator field in header template

  Partly reviewed by Dongliang with an extra question to Jon.
  source: <cover.1792569583.git.wy@wyuan.org>


* Jiaming Ouyang 2026-10-28
  [PATCH v4] docs/zh_CN: add Chinese translation for usb/ohci.rst

  Expecting a reroll.
  cf. <fcabf691-cca4-477d-b387-e50467a41408@hust.edu.cn>
  source: <20261028072643.32250-1-jiamingouyang13@gmail.com>


* Weijie Yuan 2026-09-05
  [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
  [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
  [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests translation

  Needs review.
  source: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>


* Weijie Yuan 2026-08-23
  [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese translation
  [PATCH v2 1/5] docs/zh_CN: update maintainer-pgp-guide translation Weijie Yuan
  [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements Weijie Yuan
  [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org link Weijie Yuan
  [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository reference Weijie Yuan
  [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from maintainer PGP guide

  Needs review.
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

* Rénich Bon ´Ciri´c 2026-09-20
  [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst

  Replaced by Dongliang's <20261029124429.294868-1-dzm91@hust.edu.cn>
  cf. <20261029124429.294868-9-dzm91@hust.edu.cn>
  cf. <aus2LTFjmZaZPomM@wyuan.org>
  source: <20260920073144.546566-1-renich@evalinux.com>


* Yukai Wu 2026-08-29
  [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation

  Discarded for waiting for too long.
  source: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>


* Chen Miao 2026-08-14
  [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
  [PATCH v4 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup

  Discarded for waiting for too long.
  cf. https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/
  source: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/ (PATCH 5/6)
  source: https://lore.kernel.org/linux-doc/20260814214419.49925-6-chenmiao.ku@gmail.com/ (PATCH 6/6)


* Ye Liu 2026-08-19 1 commit
  [RESEND PATCH v2] docs/zh_CN: sync page_table_check.rst translation

  Discarded for waiting for too long.
  source: <20260819025535.2967566-1-ye.liu@linux.dev>


* Cui Shuang 2026-07-22 1 commit
  [PATCH v3] docs/zh_CN: Add configurable error injection translation

  Discarded for waiting for too long.
  source: <20260722123240.22979-1-imcusg@gmail.com>

PS. The copy of this report is here now:
    https://github.com/kernel-zh/linux-zh_TW.git meta
