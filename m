Received: from mta1.migadu.com (out-222.mta1.migadu.com [95.215.58.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDD534C140
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786773615; cv=none; b=ML/H1WjhYZbVZIPD7rd+2fgJwd+bNClNqd7/kFAn7S9aFxC8dXcINthSNqyxHVSt/8+u4Gs1hCP5cQ5/+sxGdWIYM0kgXKH2Nz2+H9rft9gQXLQJgD29DDGIn3qsJqEAZGA18y8h3UC8dfn1tlfSSb32ofdcPE7qdMz4YJbwC7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786773615; c=relaxed/simple;
	bh=d8li+ZXqiiA2XVEQNrg/tXxinteS0TGN41jJWXnLdrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/XFk/b6iyfatHduRoXMQu2FEeRHgpbv/QpIkMCL36j7Q1zxnAjp9STPJrw7KhI2AxAwMhEYW+C2qzUsM3cU/Wc4hMS+9+XokQPUykJ1Qh9t203wEREfizIE7dtROghNZEd42U3TlBzteq7mTedtS0F7CPc153ZsrYZYADNJS/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=D+v+ZAX3; arc=none smtp.client-ip=95.215.58.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="D+v+ZAX3"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=d8li+ZXqiiA2XVEQNrg/tXxinteS0TGN41jJWXnLdrE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786773610; v=1; x=1787378410;
 b=D+v+ZAX3NDFuYNHF/xsd09l59G8JSYNMYMgniLounpYQNg/07OEkEe6Fsf8u8YaXLFTAz2Hm
 DnWui/XyNu0Fq007Xl2NxnWulnOdRzUGGS9EoOc2RLsIkQ9O4RouEB5rH1c1PUw0XMS8GdVIRTI
 1NxCsTkeZ64kdcif2zY8Jehwr1CRVGk7FBf1w62Uy93DXaih5+IYCvm26cH6utltmdF6hLaQiQH
 Oha2gooap46wuOYm4lf+rF0qeTbvdPjBIFf84x4Qx2/d5ZsHtdJC39W1I3yNaI/2VOVY7c3uKrH
 09t+TquBOxg6AIwe3TWWk+jy8V6C827R+Zfldt2ka48AQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 509f560ce8fc34e4;
	Sat, 15 Aug 2026 06:00:10 +0000
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Sat, 15 Aug 2026 13:59:35 +0800
Subject: [PATCH v2 2/2] docs/zh_CN: link to Chinese applying-patches
 translation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260815-apply-patches-v2-2-3fdd873d31cc@wyuan.org>
References: <20260815-apply-patches-v2-0-3fdd873d31cc@wyuan.org>
In-Reply-To: <20260815-apply-patches-v2-0-3fdd873d31cc@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=wy@wyuan.org;
 h=from:subject:message-id; bh=d8li+ZXqiiA2XVEQNrg/tXxinteS0TGN41jJWXnLdrE=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqwGBp8n1zy3XCthYLguvemr4KW3VhtezHsZeuamksmbD
 9dXXT83uWMiC4MYF4OlmCKLYt7zC1zuAXunrYg4DzOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOgYM3BxCsBUm0xgZDi+J75AufFd6U6PqC8i6t/f1/zV57IXyP9Wk6/18BeLNwfDf5+yf1O
 WHJu3eQ7Ln83yO7IE7PXK/6Q9mLXS0s31Q5jMRgYA
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

Now that process/applying-patches.rst has been translated into
Chinese, update the references in zh_CN howto.rst and
admin-guide/README.rst to point to the Chinese translation instead
of the English original.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
 Documentation/translations/zh_CN/process/howto.rst      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index 7c2ffe7e87c7..0549c79ba1a4 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -83,7 +83,7 @@ Linux内核6.x版本 <http://kernel.org/>
    补丁，则不应先应用6.0.1和6.0.2的补丁。类似地，如果您运行的是6.0.2内核，
    并且希望跳转到6.0.3，那么在应用6.0.3补丁之前，必须首先撤销6.0.2补丁
    （即patch -R）。更多关于这方面的内容，请阅读
-   :ref:`Documentation/process/applying-patches.rst <applying_patches>` 。
+   :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <cn_applying_patches>` 。
 
    或者，脚本 patch-kernel 可以用来自动化这个过程。它能确定当前内核版本并
    应用找到的所有补丁::
diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
index cc47be356dd3..2e39ad557dd4 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -142,7 +142,7 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
     有助于内核开发的外部文档列表。如果你在内核自带的文档中没有找到你想找
     的内容，可以查看这些文档。
 
-  :ref:`Documentation/process/applying-patches.rst <applying_patches>`
+  :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <cn_applying_patches>`
     关于补丁是什么以及如何将它打在不同内核开发分支上的好介绍
 
 内核还拥有大量从代码自动生成或者从 ReStructuredText(ReST) 标记生成的文档，

-- 
2.55.0.717.g61afef3e37

