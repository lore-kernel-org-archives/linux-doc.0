Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802080;
	b=ZLO6JzIUGoXaBBfCggVXEs5egFd/2trlQzTr38aiS8YpsShxFVGGFSr1WUJM1d0Xrz/g
	 FbWYaStcMFdgb0gl1B/j1I+sVJTTUgHnwyqCy56H3P3AcUzr/YBtYCdr2M0uznHy9Rm3s
	 yqcT1AtYdfcgSW526mZhw/a5b5Lq7bshF/1HJfVgr5Bz1atjldZAGbuvqqSf8mD0pVgz4
	 MLMCWsmQHrvv+paCMA+EnmzqCQ/Ws87ge81ZPPlbTun5BuBHocgnjLYZMuOQgaZuHomHw
	 gneGpzIjqh5CGHdNO9SvTD52NS347jStYfw4rc7yWvwYY2KcNF8HWnDWoohP9hFnMJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802080;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=W8SMcCt9ZUSUxbt5djHgyrkgqEuZej0Mp2WHf59g7rM=;
	b=HZUottwiESFiJ4H3yziJ59GyCi04Zwe5Nj3mx5egdS9jQ0466vTnuISrVrzt6LcSrnva
	 kN4TaFIYmabLWW3DMMTeuihUV5v2RPCsXIzg2xUFpkNEoUVFZcSxHSYJs/LhGvw8CzmSK
	 WXVJLbLCnh/I6LMN9DSNLMDXCWj6MpqD2iUwOvaEdpx2rY9bDkTzHKG/fwmvqM414DTRw
	 d0sHcB2e/gvTKr0ECpl8sbymxY0eChY5zOziLkjGMNjZou3wkrfLo3uHF5z+Gj/3r64Wm
	 XiZWiP2gRBOaTVPAT96fHuE03EjohPLRemZtk3ViRbGJWD7d1CvBCQ+jJTr5gva2veg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=f0Yux6ZP;
	arc=none smtp.remote-ip=91.218.175.199
Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF6F606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 14:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF6F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=f0Yux6ZP
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bzRX5dlV7Wh/lyh0UYkq3/dRHDRrbSsB+o+Wim9Zm4U=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793802077; v=1; x=1794406877;
 b=f0Yux6ZPtwTsWhjKb7OpSnjG+0Yxe8gr+Vcm0Inc481tnEmUz5YIJBhafeMoDA2nPq3OK3aY
 EhKqxIU45zaw9dvm7LfhrbpJX6XjrwJ/y0nahwx5NoBBeqTGyBwo4c5psbB/bFhkoaCN5us6QAO
 ByAmwPGzARk07i3UkH+wW636sMNVy3SG1Et/LM8AwZn85WkfD/KnchHl14KLIQAPaBaU5aPQ1/Y
 OV+joVF9nj/vKz2+WVc8X9qev5NM78wGoVhyfjH2JSX6Q9H3l3TgydbPQOTo8gAqG6KWLM/j5Ig
 AEOtYT1e5s/qNAjmnIGTJtXZR3PW0hziCNv2hhY1gDofQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a5f416413f0f93a2;
	Wed, 04 Nov 2026 14:21:16 +0000
X-Mizu-Trace-ID: a5f416413f0f93a2
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 22:21:09 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>
Subject: What's cooking in Chinese docs (Nov 2026, #01)
Message-ID: <aus_VX-lZZWRP6FE@wyuan.org>
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
[Stalled]

* Yukai Wu 2026-08-29
  [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation

  Waiting for response for too long, stalled.
  source: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>


* Chen Miao 2026-08-14
  [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
  [PATCH v4 6/6] docs/zh_CN: how-to: document case-sensitive APFS setup

  Waiting for response for too long, stalled.
  cf. https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/
  source: https://lore.kernel.org/linux-doc/b233295b-64c0-4d50-a0fd-516e4795eb96@hust.edu.cn/ (PATCH 5/6)
  source: https://lore.kernel.org/linux-doc/20260814214419.49925-6-chenmiao.ku@gmail.com/ (PATCH 6/6)


* Ye Liu 2026-08-19 1 commit
  [RESEND PATCH v2] docs/zh_CN: sync page_table_check.rst translation

  Waiting for response for too long, stalled.
  source: <20260819025535.2967566-1-ye.liu@linux.dev>


* Cui Shuang 2026-07-22 1 commit
  [PATCH v3] docs/zh_CN: Add configurable error injection translation

  Waiting for response for too long, stalled.
  source: <20260722123240.22979-1-imcusg@gmail.com>

-------------------------------------------------------------------
[Cooking]

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


* Rénich Bon ´Ciri´c 2026-09-20
  [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst

  Needs a different solution?
  cf. <aus2LTFjmZaZPomM@wyuan.org>
  source: <20260920073144.546566-1-renich@evalinux.com>


* Weijie Yuan 2026-09-05
  [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
  [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with upstream
  [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests translation

  Needs review.
  source: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>


* Yukai Wu 2026-08-29
  [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation

  Expecting a reroll?
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
