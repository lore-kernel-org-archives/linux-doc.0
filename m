Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5339D47F2D5
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246050; cv=none; b=tM1juJV+CpulItTLgVWQK0mev1oNd7hL+E1cjis0y0HI5iqYx2SkHEsu84MrFd8IlBtvr83w3ZNynEUagbHtCUMGgUOBvi3l1AIFMOHLxe48xgWiuSRGRfHmi6yLIMu6HsQQ4quRXi/VYi2unQHtYycEEQRlI91u6DSABJQ3jPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246050; c=relaxed/simple;
	bh=JfzCGhjpLDnnTTydcewOa/5suLQFJkvo/dUZls1Tg9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4VtEgG/S16PFRgsQZ3eRoP83lTXh0lP2OKz5BosDuhvxbxpI5dDgXY1p/5RyfslKM7F4Qi3lQh0Su8J0/yH/O/EkDGRShQAmckAlffk1xP7JBp6pUZTKmxpAI477TyLxrCRMPn/8Omvs9GJz8/vkrCyBNXKTPcy6HcpN41D6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Pr/EkKd2; arc=none smtp.client-ip=91.218.175.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Pr/EkKd2"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JfzCGhjpLDnnTTydcewOa/5suLQFJkvo/dUZls1Tg9o=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787246047; v=1; x=1787850847;
 b=Pr/EkKd2tWy8brae7QunFfjiKOSy4kn/oL5Q5AJRZ4+aIl4mtS8a4bMUgOsD5SG+/fqotds2
 o/JjaLc76B1AYMPEANT3JV1F4ZFYRxEwyL9/nItnMlt+FH6OlH6K5ODxJbSYGg6t4Ag7yjTkBDi
 v9vCtoFtp7R8Xoyr97NuG5+OO5snrE3ebhqqK8/k7/XZjQp0riaJLUd5dwgVKonEP2iiMNDKYDd
 Urw/NLXweQI29eTmr3nSz8rLSLvmQKEIIFeCfIQHx2U/VioC9gieG1Y3Zkw1loNkdxTnSlVBhhn
 pXOf9ZKAZtderYQss84SKDNDjbqCi5ka/0FprJlzt/dJA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 3de5d122c3a0c440;
	Thu, 20 Aug 2026 17:14:07 +0000
X-Mizu-Trace-ID: 3de5d122c3a0c440
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Fri, 21 Aug 2026 01:13:22 +0800
Subject: [PATCH 3/4] docs/zh_CN: update maintainer-pgp-guide kernel.org
 link
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-maintainer-pgp-guide-v1-3-08e5e3602c04@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
In-Reply-To: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=wy@wyuan.org;
 h=from:subject:message-id; bh=JfzCGhjpLDnnTTydcewOa/5suLQFJkvo/dUZls1Tg9o=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqx20z137he+2aqmGj5J/ZBZc2jz+jM5iS6CW959SXBcL
 2q2YLdzx0QWBjEuBksxRRbFvOcXuNwD9k5bEXEeZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKlmmMDIMP1e86eKWYc/VUxVnqj17eq9vrjfArlKa5cpch02OvnvbCHD/1K3NXt
 +//Nul8t9YcO99SOfRmD1vzye1MtLlx3tm39PnR8A
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

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
my thoughts here for furture reference.

Thanks.
---
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
index 7a3fab8596a6..12b3e8030364 100644
--- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -742,7 +742,7 @@ Greg Kroah-Hartman 的密钥（如果你还没有它们）::
 如果你有 kernel.org 帐户，那么你应该 `添加 kernel.org UID 到你的密钥中`_
 添加到你的密钥中，以使 WKD 对其他内核开发人员更有用。
 
-.. _`添加 kernel.org UID 到你的密钥中`: https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_pgp_key
+.. _`添加 kernel.org UID 到你的密钥中`: https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
 
 信任网 (WOT) 与首次使用信任 (TOFU)
 -----------------------------------

-- 
2.55.0.822.g20453c30eb

