Received: from mta1.migadu.com (out-221.mta1.migadu.com [95.215.58.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B234A3AB
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 06:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786773611; cv=none; b=Q2ER/7oDDEBFPGhD1LVZUb4OlzHvWBmLl7h6kNxMsibq4IhvlWaltPwEIipkNwGTRzVCGEZIs+JrlcxviGqrpvBJsFApE8PyP6+HQala30eNDM9ZVsjkPDWkR+zzgF8GPGGsdl0GLEN2VpuikgoyoIIu7MayTsPt/U3aI1zxZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786773611; c=relaxed/simple;
	bh=j2HE8qZvX5EWkajD5towuT+AlNB0McTHG5aX+y6d0IA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mTzw/+ESdbFKtpR5h/TZeuRdFGBo+Aw52nW8V4Tq/ai1NARcaof4znmUVo4jkIt/u6IVi5fyj0kKHdACzjG1MkRb00nVNqYxQphEArKE2Gursy2QUx5CCKBsMcuR/DM2PhOBpcxIox4+KHeCqh2df9XpLhHgGDb0NarQGyxhU24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=OgLGTRVM; arc=none smtp.client-ip=95.215.58.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="OgLGTRVM"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j2HE8qZvX5EWkajD5towuT+AlNB0McTHG5aX+y6d0IA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786773607; v=1; x=1787378407;
 b=OgLGTRVMFQ2Sv4wFxegEtfLQheJGL91yaJ7kg/MlyxRd4e3rWG5FBtcw81ikxMmqAMCJOVpa
 479bUALKPKSJVg2df4bM9wZwH+CKUGgMjPBcTYWmnYIDL5dGE38ADIqrOMjUSuhmauA8D8uCwIS
 wrv/GyWuEk15ZWoYo1vZVELegmIfb09KpIt/pdxqyfZ2nhF1y9JwUdkLapqlG3fmxQrdtd4PByn
 o7F4B2e4evvZG+6eJVP9aNbK2C6zXbjFqqwQJXaER69B5GGL1mg/+wFlvoKPO9YT7d30SkS4EPp
 kQnXJYhEUB8PiyAjELzQRk9Cs4n81EwCGs+s+K5uAK4+Q==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 4d82ef720d5887d6;
	Sat, 15 Aug 2026 05:59:57 +0000
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Subject: [PATCH v2 0/2] docs/zh_CN: translate process/applying-patches.rst
 into Chinese
Date: Sat, 15 Aug 2026 13:59:33 +0800
Message-Id: <20260815-apply-patches-v2-0-3fdd873d31cc@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSw6DIBRFt9IwLkSI3466j8YB4lNoWiEP1BLj3
 it2Ax2e5J6TuxEPaMCT22UjCIvxxk4HiOuFKC2nEajpDyYiE2VW84JK516ROhmUBk/LjMu+6XI
 xiIocjkMYzOfsPdof+7l7ggopkhYD2jcNGkGeXWUXQMarOhd1UxY5G01ga7yvcZYTszgmRxsfL
 Mbz5MJT+w+v3ff9C63nUUvfAAAA
X-Change-ID: 20260815-apply-patches-601ad9b42f27
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2883; i=wy@wyuan.org;
 h=from:subject:message-id; bh=j2HE8qZvX5EWkajD5towuT+AlNB0McTHG5aX+y6d0IA=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqwGBp8Jih8UWqs41PKC9Bbej+B6vbIj3l3v77q9pfEn5
 P7YffrZMZGFQYyLwVJMkUUx7/kFLveAvdNWRJyHmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKp/ezL8FbV5dn2i14Uf9h90p1VP2cmz9bP0kQmzGRtu3qrR2KBjsZHhN8vZI/W
 LuKZm9hz9HfeMm11Cy7lVqzjfW/XlrNfurj+6OQA=
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

Translate Documentation/process/applying-patches.rst into Chinese.

This series adds the Chinese translation to the zh_CN process
toctree and updates existing zh_CN references to link to it.

---
Changes in v2:
- Merges first two patches into one.
- Removes self-ref (.. _cn.rst) and changes ref style from 'ref' to
  direct file name
- Link to v1: https://patch.msgid.link/cover.1784289654.git.wy@wyuan.org

---
Weijie Yuan (2):
      docs/zh_CN: add process/applying-patches Chinese translation
      docs/zh_CN: link to Chinese applying-patches translation

 .../translations/zh_CN/admin-guide/README.rst      |   2 +-
 .../zh_CN/process/applying-patches.rst             | 390 +++++++++++++++++++++
 Documentation/translations/zh_CN/process/howto.rst |   2 +-
 Documentation/translations/zh_CN/process/index.rst |   2 +-
 4 files changed, 393 insertions(+), 3 deletions(-)

Range-diff versus v1:

1:  d90aac81d39b ! 1:  68ed0ce67ffa docs/zh_CN: add process/applying-patches Chinese translation
    @@ Metadata
      ## Commit message ##
         docs/zh_CN: add process/applying-patches Chinese translation
     
    -    Translate .../process/applying-patches.rst into Chinese.
    +    Translate process/applying-patches.rst into Chinese, and update
    +    the toctree.
     
         Update the translation through commit fa04150b8ef7
         ("Documentation: describe how to apply incremental stable patches")
    @@ Documentation/translations/zh_CN/process/applying-patches.rst (new)
     +
     +.. include:: ../disclaimer-zh_CN.rst
     +
    -+.. _cn_applying_patches:
    -+
    -+:Original: :ref:`Applying Patches To The Linux Kernel <applying_patches>`
    ++:Original: Documentation/process/applying-patches.rst
     +
     +:翻译:
     +
    @@ Documentation/translations/zh_CN/process/applying-patches.rst (new)
     +感谢 Randy Dunlap、Rolf Eike Beer、Linus Torvalds、Bodo Eggert、
     +Johannes Stezenbach、Grant Coady、Pavel Machek，以及其他可能被我
     +遗漏的人，感谢他们对本文档的审阅和贡献。
    +
    + ## Documentation/translations/zh_CN/process/index.rst ##
    +@@ Documentation/translations/zh_CN/process/index.rst: TODOLIST:
    +    :maxdepth: 1
    + 
    +    magic-number
    ++   applying-patches
    +    volatile-considered-harmful
    +    ../arch/riscv/patch-acceptance
    +    ../core-api/unaligned-memory-access
    + 
    + TODOLIST:
    + 
    +-* applying-patches
    + * backporting
    + * adding-syscalls
    + * botching-up-ioctls
2:  5f0e700f6a49 < -:  ------------ docs/zh_CN: add applying-patches to process index
3:  a3d20af74d63 = 2:  0af282ad0e01 docs/zh_CN: link to Chinese applying-patches translation

---
base-commit: 1a0364f09c1311dad5ad1ccba7e169a412f6b547
change-id: 20260815-apply-patches-601ad9b42f27

