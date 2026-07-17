Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F333D3D11
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290273; cv=none; b=iCMNKu4d9sIZEPzsGP/Uj2xtSeL/2ZurxBCPEXg69iKukMXzS3wIaKQHn8z2fnbkGDSbFJR/jGGWYx3AMncSORCKZ1hel6UbJQtKrsAvCoTpxBRaonLS7NV6Tz4fgghKLF2PYqfhYVNldoL9pYMzv5tlylqcTguPdOkwl4BoloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290273; c=relaxed/simple;
	bh=/r5s7G3vuwyLidTrhc8irQTxnG0563iE5QfpAexpAm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W00qIQ+35wFJaUmNyUMggo0Kge4lHFxg51C6uraY2yHGYcRE5Ca3vm+MoV1tKXsBIC8up2nBX2tNDH7ojaVA2jqziPJrHNXnmLfIJkKI+n3QQyWj4BpmNWcBqCRUXIsVit8cDNB/e3yjuMLQx4rNEcnpin0OFO3Rfr1uDg4Kvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=gsGkCmGe; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="gsGkCmGe"
Date: Fri, 17 Jul 2026 20:10:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784290269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGp9gJsbG6pTWIy9c6NOKNXHCS5/u07uvcQAQAccsVw=;
	b=gsGkCmGe4+5pv80rzUsEGUqW2BqPBRMlymRIKGZtIbhP8e8YGJSTAj8Uye6tQlutiVAIT5
	w8BDhIozw622eRgKiNU4wSsDbEN/ektBUPun2tR8tkC0v0HJvS8roXu23E3NPqP67pHTyH
	HtKa2s+PS9n2ox24GKVWjFokkry03vH9/iOT9clfWGuRFl02HrLeIjYB43+1TX/D+h3aAc
	qMSO7KC/phmns66c+YevCvL6N47V+qJM+GWkNTTewbR9JsHO9gNWmS2TiFuiyleolqAI/s
	vFucOL7Y2g1F78DqiKa2UDr5TLb9TMpfvNbZ16NeEtzy3G5jmIyJbokzBTxKMQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] docs/zh_CN: link to Chinese applying-patches translation
Message-ID: <a6a2b03c95371293bc16eda7cfc99470e910e2ea.1784289654.git.wy@wyuan.org>
References: <cover.1784289654.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1784289654.git.wy@wyuan.org>
X-Migadu-Flow: FLOW_OUT

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
2.55.0.369.ge3c30fcd466f

