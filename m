Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F473F9D2;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=Vptj5izVXhE7R8Wt2lcjk7t0PemL6Kj5fns7sxvFCeeDKd6OegGBxkICaLhjgA/6erFNacnK1kOhrfJfDmak/16EGV1K79YRfUYhB/J4qcYTADZfqquwTkKCu3VvIUK3PiUC6bUCNR8OoyEE0JHnPcn7M930VRcz1lbLJZuMcrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=xJJNTHLm28pOieLtRLXBCsjINp9HkQQLtgWkMVSB5X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I5kNETZOx5EVGaAD5b7jRzOrQeoPwpYmN2277RTpie6q06fR3W7OYK6XrQDjJBew28Qo//o7YaqRlXWlnp/FXpbnuT76O4UD3s9xjJoT5W7ZpExhFkc8UTf6agsWpuj+hWBegE3sYhcskbdtpuutUY6txTKdKkkXa8+SSTDOjeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZQ9ElEe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZQ9ElEe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C351C2BCC9;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=xJJNTHLm28pOieLtRLXBCsjINp9HkQQLtgWkMVSB5X4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jZQ9ElEe+UoE3g3WSMWUU1bwfgG6y/RTF9cicxaYybx4nRoWeP4NVh+HgpYQ7tkw2
	 +2iMuquNOku20W1CadQA/Np5pNpqoOhFrMyJ9G6UlaQuLyltTs2PWNPKnmrvTgHhTa
	 sDl/PUJWhMjzh3OSbZy9VxKzqxaay8gdAQnDeUS1Ziaz+T1CAZdbR2/16yeIMJZiRm
	 3/o0L4T/bvvKm99q/YaOA8aCTLnBpGN4xFcBz2gNqXTrPtStbQ36pQtr2dwtrzq6AB
	 PuHlURRqO3U0yCSvs90vewtVSwgIBrmfQLWzXXXqa/vDBI3hyZEGbn/941S3p6qa3u
	 41uOZKM3Enskg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRMg-28Vv;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Alex Shi <mchehab+huawei@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Randy Dunlap <rdunlap@infradead.org>,
	Remington Brasga <rbrasga@uci.edu>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 35/38] docs: translations: Allow creating cross-references for ABI README
Date: Tue, 28 Jan 2025 01:06:24 +0100
Message-ID: <2699a7eeb90f0a3c419928fbf696339637b02463.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Update translations to also generate cross references for the ABI
readme file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
 Documentation/translations/sp_SP/process/submit-checklist.rst | 2 +-
 Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
 Documentation/translations/zh_TW/process/submit-checklist.rst | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst b/Documentation/translations/it_IT/process/submit-checklist.rst
index 692be4af9c9b..3308c3084c60 100644
--- a/Documentation/translations/it_IT/process/submit-checklist.rst
+++ b/Documentation/translations/it_IT/process/submit-checklist.rst
@@ -58,7 +58,7 @@ Fornite documentazione
 4) Tutti i nuovi parametri dei moduli sono documentati con ``MODULE_PARM_DESC()``.
 
 5) Tutte le nuove interfacce verso lo spazio utente sono documentate in
-    ``Documentation/ABI/``.  Leggete ``Documentation/ABI/README`` per maggiori
+    ``Documentation/ABI/``.  Leggete Documentation/ABI/README per maggiori
     informazioni.  Le patch che modificano le interfacce utente dovrebbero
     essere inviate in copia anche a linux-api@vger.kernel.org.
 
diff --git a/Documentation/translations/sp_SP/process/submit-checklist.rst b/Documentation/translations/sp_SP/process/submit-checklist.rst
index 0d6651f9d871..3087ba80e818 100644
--- a/Documentation/translations/sp_SP/process/submit-checklist.rst
+++ b/Documentation/translations/sp_SP/process/submit-checklist.rst
@@ -97,7 +97,7 @@ y en otros lugares con respecto al envío de parches del kernel de Linux.
     ``MODULE_PARM_DESC()``.
 
 18) Todas las nuevas interfaces de espacio de usuario están documentadas
-    en ``Documentation/ABI/``. Consulte ``Documentation/ABI/README`` para
+    en ``Documentation/ABI/``. Consulte Documentation/ABI/README para
     obtener más información. Los parches que cambian las interfaces del
     espacio de usuario deben ser CCed a linux-api@vger.kernel.org.
 
diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
index 10536b74aeec..5c20a7f0936b 100644
--- a/Documentation/translations/zh_CN/process/submit-checklist.rst
+++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
@@ -82,7 +82,7 @@ Linux内核补丁提交检查单
 17) 所有新的模块参数都记录在 ``MODULE_PARM_DESC()``
 
 18) 所有新的用户空间接口都记录在 ``Documentation/ABI/`` 中。有关详细信息，
-    请参阅 ``Documentation/ABI/README`` 。更改用户空间接口的补丁应该抄送
+    请参阅 Documentation/ABI/README 。更改用户空间接口的补丁应该抄送
     linux-api@vger.kernel.org。
 
 19) 已通过至少注入slab和page分配失败进行检查。请参阅 ``Documentation/fault-injection/`` 。
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index 0ecb187753e4..b09d29b0cc1b 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -85,7 +85,7 @@ Linux內核補丁提交檢查單
 17) 所有新的模塊參數都記錄在 ``MODULE_PARM_DESC()``
 
 18) 所有新的用戶空間接口都記錄在 ``Documentation/ABI/`` 中。有關詳細信息，
-    請參閱 ``Documentation/ABI/README`` 。更改用戶空間接口的補丁應該抄送
+    請參閱 Documentation/ABI/README 。更改用戶空間接口的補丁應該抄送
     linux-api@vger.kernel.org。
 
 19) 已通過至少注入slab和page分配失敗進行檢查。請參閱 ``Documentation/fault-injection/`` 。
-- 
2.48.1

