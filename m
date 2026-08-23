Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4E529992A
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 07:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787469336; cv=none; b=uosfHuC6Rygu+BFkgKWHiQDDi3//89W7C0+ytAOJHklDFEJ49pGbCvnJRgj/Nu06ysUfhkaOu6GsNiDoRLUMVp+W9G3wUCQRxpd/N0SJnV3exFATpNK7UKZ9IdddwwmOH+y9NxDRJT9hFOJO5uL8jxfOgCXwHJ+eN2dHRgXH3ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787469336; c=relaxed/simple;
	bh=qexJyGJfCaiZjqvk9M9QZdvbtlJ5LbUJLqvPsvZZkRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0INCy+YVDXC/OnBd3m8w3rNea6DUv64Qf0V15HkBsH6SakcxrGnrgQqcAN0slemUk1i/SfFrZ+52c5szbgwhb8HgwRoxnAzvCU49smGY6dz0FuJRXR6Pj+40Zt+J/pcoJbk4ym2nsdaKt/u0sX/MMicCeYntpp9tgyKEYkKgzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=YG939+cG; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="YG939+cG"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qexJyGJfCaiZjqvk9M9QZdvbtlJ5LbUJLqvPsvZZkRw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787469332; v=1; x=1788074132;
 b=YG939+cGRo8CtaXapfGoNgjVlaOQwJVwLFT6+oVoCswLPW5bYjkVeArSMsTx/zVVLHlUPfry
 V7xhZ/4BDk8IrHnOUWnprNi0s/E8iAzxlGhvaWJkrMI6O9iFSdXOVh/e2QkcP9MIDZvYF9uwbV7
 DAhklV9Mjcs8oA1cZq2qXN8DFdS8N0hwb/bewtTkHyhXk+8ZoaRi9iYvO7kWmg0ExdB+1dsxxJi
 kQEGVXYpQDTO4uCAmy33Fs1Zbx4bQkLFa6hPg5S+eK2E/nCY1t4FNCS4dq8ggYoZfpooWU6iejV
 ogFmt6BTJu6RpP9jwag7oFZdvBZg6lBnaL/2fhdO7P+KA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id cdb8c1e5da88d3f1;
	Sun, 23 Aug 2026 07:15:32 +0000
X-Mizu-Trace-ID: cdb8c1e5da88d3f1
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Sun, 23 Aug 2026 15:14:59 +0800
Subject: [PATCH v2 3/5] docs/zh_CN: update maintainer-pgp-guide kernel.org
 link
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260823-maintainer-pgp-guide-v2-3-bea33b2ece54@wyuan.org>
References: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
In-Reply-To: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Update the kernel.org documentation link for adding a kernel.org UID.
The SPDX identifier added upstream already exists in the Chinese
translation.

Update the translation through commit 6c5c07bc8589
("docs: process: maintainer-pgp-guide: update kernel.org docs link")

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
The SPDX identifier of this translation was added at its birth, while
the SPDX identifier of its original English version was added this year
2026. Although it has been added, I'm quite curious about whether it is
"legal" to add the identifier on top of the Chinese translation while
the English original does not have one back in 2023.

I know Jon has been a little bit careful about it, so I'd better leave
my thoughts here for future reference.

Thanks.
---
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
index b329755cc960..6e29c9a74f4c 100644
--- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -753,7 +753,7 @@ Greg Kroah-Hartman 的密钥（如果你还没有它们）::
 如果你有 kernel.org 帐户，那么你应该 `添加 kernel.org UID 到你的密钥中`_
 添加到你的密钥中，以使 WKD 对其他内核开发人员更有用。
 
-.. _`添加 kernel.org UID 到你的密钥中`: https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_pgp_key
+.. _`添加 kernel.org UID 到你的密钥中`: https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
 
 信任网 (WOT) 与首次使用信任 (TOFU)
 -----------------------------------

-- 
2.55.0.822.g20453c30eb

