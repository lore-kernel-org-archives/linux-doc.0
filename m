Received: from mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277320125F
	for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786902523; cv=none; b=pslXD00dlFNV/8ZiuSehITFjY6KofxVlVqd398t0aeCqy/iSZop0t5VzNLFFUKrLPbuZZMZCPfhBTuwbGLkIoQWejWCK7TJFqySg4tw9BRxnS+QZtTJ71pZMnd8j3kfPr+WlhtgCDMR+/VKISq5US5KGokLZXwk9QIp3TZ18iXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786902523; c=relaxed/simple;
	bh=xDmD/gYMQO5GC9GBMLF+99TnsKzpoP+GhjPYDySmHLw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bllZF7aVlAthn7WSbVYoQoZzX8wjf/kE83YDcf6TKoFTXKardgxXAJ3+KCnJ1Q0s+gNSsVux2jwoVaBHkbGHkFjf6kxH0eMnR61zJikMl+xu9xapCau0imPOBmffFB4IZzRgK4+f3BRjsyLdgHUwUb5a/tRtXo6lLrMLN6GtdPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=mlwixFXl; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="mlwixFXl"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xDmD/gYMQO5GC9GBMLF+99TnsKzpoP+GhjPYDySmHLw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786902517; v=1; x=1787507317;
 b=mlwixFXlf5qBy1mjRsOuxKvhAP2UjEy+xPo57Y/C7n7bH9FKIy3EY1qv6g82A6HvmztI4rik
 vbMRAUx3ivAitZwWRgMEu5YgJxkgRk57xi/fo0c+dpgQN9CrtZsYtOysMGpL04TmYWUoVSOejFx
 p9ULGqGwQ6JJrpYpfrIW46tozyL1k8HkaUpFaonHYoXqTZh15cAd5cB4Cbh6R+r7aOOfbaWjGW6
 uy69wir917bI2EnqNTz5pArJuot2bEh5viPtMq5IIS3D+UQklMJ3WXF3t3AJxbN3T78g1/NV9qw
 S24Hjc//lN5PHglGjqkxRS+r9ncHUcVEuEtp8z8gKjg7w==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.127.in-addr.arpa (117.176.242.163)
	by smtp.migadu.com with ESMTPS id e6576dbca854dd50;
	Sun, 16 Aug 2026 17:48:37 +0000
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Subject: [PATCH v3 0/2] docs/zh_CN: translate process/applying-patches.rst
 into Chinese
Date: Mon, 17 Aug 2026 01:47:44 +0800
Message-Id: <20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OTQ6DIBhEr2JYFyL431Xv0XSB8Kk0rRhArDHev
 UI33TTpcpJ5b2ZDFowCi87Jhgx4ZZUej5CdEiQGPvaAlTwyYikr05oWmE/TY8UTd2IAi8uUctm
 0OetYhQ5mMtCpV/Rdb59s5/YOwgVJaHRGP7EbDPDoFdqDIbSqc1Y3ZZGTXjmyrJdlnflItOkDM
 yjrtFnjSU+D+w8uzHsWyz/Oe4ZTnHVS1lUmMyrEN73v+xseq+gxHQEAAA==
X-Change-ID: 20260815-apply-patches-601ad9b42f27
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4904; i=wy@wyuan.org;
 h=from:subject:message-id; bh=xDmD/gYMQO5GC9GBMLF+99TnsKzpoP+GhjPYDySmHLw=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqzG79ejFGXEl0paX9tyKXqLi5dY6pFy6zP8j5c5/PVml
 fhbdSG1YyILgxgXg6WYIoti3vMLXO4Be6etiDgPM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFQfOMfwv3zdjmCFtl1Kj/6lTGPtj9opNMkkqc766ddpUQ2eVWoHkhj+6Vez6xn
 pxe+eVr87YrrM7XM/Zh2f0/Z0ohTDo1W7jpdcZAcA
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

This series adds a Simplified Chinese translation of
Documentation/process/applying-patches.rst.

The first patch adds the translation and includes it in the zh_CN process
toctree.  Its :Original: field uses the original document path directly;
no translation-specific reference label is introduced.

_Changes in v3_

The second patch updates existing zh_CN references to point to the new
translation.  In ordinary paragraphs, the absolute Documentation/...rst
path is used and is handled by automarkup.  The entry in process/howto.rst
is a definition-list term, which automarkup does not process.  It therefore
uses the named :doc: form as the minimal explicit-link exception, without
reintroducing a cn_applying_patches label and using :ref:.

RFC:

I considered the two competing preferences for cross-references. Jon
recommends using a plain absolute Documentation/...rst path, while
another view (I found the discussion in 2021, so I added your email
addresses, thanks.) is to avoid :doc: markup where automarkup can create
the link automatically.  I follow both rules where they apply: the plain
path is used in normal paragraphs.  However, this particular entry is a
definition-list term, which automarkup does not process, so the plain
path is rendered as text rather than a link.  The named :doc: form is
therefore used only for this narrow exception, without adding a
translation-specific label. (Seems to be a workaround)

I would welcome guidance on one stylistic point.  (Since I missed
previous discussions)  The surrounding entries in this definition list
use :ref:, while this new entry uses the named :doc: form because it
links to a whole document without a translation-specific label. Does
this look out of place here?  If so, I am happy to follow the preferred
cross-reference style.

[Words are polished by LLM, but I think it's what I want to say]

Thanks!

Sorry Mauro, I don't know which address you'll prefer, so I add both.

---
Changes in v3:
- Deal with the ref style, see above
- Link to v2: https://patch.msgid.link/20260815-apply-patches-v2-0-3fdd873d31cc@wyuan.org

Changes in v2:
- Merge first two patches into one.
- Remove self-ref (.. _cn.rst) and changes ref style from 'ref' to
  direct file name
- Link to v1: https://patch.msgid.link/cover.1784289654.git.wy@wyuan.org

To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
To: Alex Shi <alexs@kernel.org>
To: Yanteng Si <si.yanteng@linux.dev>
To: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Weijie Yuan (2):
      docs/zh_CN: add process/applying-patches Chinese translation
      docs/zh_CN: link to Chinese applying-patches translation

 .../translations/zh_CN/admin-guide/README.rst      |   2 +-
 .../zh_CN/process/applying-patches.rst             | 390 +++++++++++++++++++++
 Documentation/translations/zh_CN/process/howto.rst |   2 +-
 Documentation/translations/zh_CN/process/index.rst |   2 +-
 4 files changed, 393 insertions(+), 3 deletions(-)

Range-diff versus v2:

1:  596ec00ba7c5 = 1:  13da5addcb90 docs/zh_CN: add process/applying-patches Chinese translation
2:  b3a9c4893250 ! 2:  7c156c1d41b7 docs/zh_CN: link to Chinese applying-patches translation
    @@ Documentation/translations/zh_CN/admin-guide/README.rst: Linux内核6.x版本 <h
         并且希望跳转到6.0.3，那么在应用6.0.3补丁之前，必须首先撤销6.0.2补丁
         （即patch -R）。更多关于这方面的内容，请阅读
     -   :ref:`Documentation/process/applying-patches.rst <applying_patches>` 。
    -+   :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <cn_applying_patches>` 。
    ++   Documentation/translations/zh_CN/process/applying-patches.rst 。
      
         或者，脚本 patch-kernel 可以用来自动化这个过程。它能确定当前内核版本并
         应用找到的所有补丁::
    @@ Documentation/translations/zh_CN/process/howto.rst: Linux内核代码中包含
          的内容，可以查看这些文档。
      
     -  :ref:`Documentation/process/applying-patches.rst <applying_patches>`
    -+  :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <cn_applying_patches>`
    ++  :doc:`Documentation/translations/zh_CN/process/applying-patches.rst <applying-patches>`
          关于补丁是什么以及如何将它打在不同内核开发分支上的好介绍
      
      内核还拥有大量从代码自动生成或者从 ReStructuredText(ReST) 标记生成的文档，

---
base-commit: 1a0364f09c1311dad5ad1ccba7e169a412f6b547
change-id: 20260815-apply-patches-601ad9b42f27

