Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BDB3B95EC
	for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786902534; cv=none; b=dEb/LjaPNWnWHAJrvjATGskUR11OydGtWaYQWhvZ/n44IflU/2K/7tvajJr0EUtI5sa68PqaxQP9RnuRIsoEy5/h6VXX9880fTPjdDaMZQIiJWmjVPQRswNTkT/Iw5+3PhIGASPDluBFzhduuVVLRF95BTp5o4iORnXu5CNF4YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786902534; c=relaxed/simple;
	bh=jdukkX3akOKhghpNUn/cBU4MiKYoBD95i9bNhwRAINg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rltRNnMsYCYhvS5bErgul7okfJ19wu0NiAE/WNL/SP0Y9tZqPTFUAWJCFArdwRlsrdF97HMr4IyexEDUc66HLvd2W/uHqKGVpHIpn8Il44xbKghqPbErYd9/WhNxBNXzfTyoZsLCv80jWhvIhztIrRI+1Zil/DRNAi/aZmSWFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=XomH1Mtw; arc=none smtp.client-ip=91.218.175.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="XomH1Mtw"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jdukkX3akOKhghpNUn/cBU4MiKYoBD95i9bNhwRAINg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786902530; v=1; x=1787507330;
 b=XomH1MtwJbwk0ieRWNbHj0bxQN/uSPu5OTXpOgiWSawq58paV1hAN3sdkDgORHiP+Pj577Se
 NCQQaZsHd1cWXAKtQMqmLBrY4qlTYAEeb/C9Gb0bDuXPyJkSTn3+g6BgsMTavXX6j6vTcj59v65
 lF24frBEcY3aGGQj0XNsOrUpkGdh9lVgg/yPPK83uYQjxndmpPwLLkgSfKlZo+A0KKx7OUlubkL
 OI3l5b1tkjFHEl/B1OD9o7uSyu9YuS/dTVrirtbLyi4nfw5uTI2yiVo9sASKvC/mJHKKX1WhoqS
 6sAb0A0SXvPNx0cj50W7jGEy6P5tiFO5CEj39d9/DSadw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.127.in-addr.arpa (117.176.242.163)
	by smtp.migadu.com with ESMTPS id fef7d730cca1825e;
	Sun, 16 Aug 2026 17:48:50 +0000
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Mon, 17 Aug 2026 01:47:46 +0800
Subject: [PATCH v3 2/2] docs/zh_CN: link to Chinese applying-patches
 translation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-apply-patches-v3-2-45e3bd2b1ccc@wyuan.org>
References: <20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org>
In-Reply-To: <20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2292; i=wy@wyuan.org;
 h=from:subject:message-id; bh=jdukkX3akOKhghpNUn/cBU4MiKYoBD95i9bNhwRAINg=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqzG708sOLdJZ9acs9FvMuhwji978trt4PI8ucYtcl/aw
 z/UqU7smMjCIMbFYCmmyKKY9/wCl3vA3mkrIs7DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNWa1Qz/k5mairRenzmQce7jPKmll6zYxaRaFpn9M7iaK+/+5WTBT4Z/Rlwfrlt
 sO77jQqHLhZ0iL7N4Slrj9znyh90V/dboqfWNBwA=
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
index 7c2ffe7e87c7..ee6dd3782f4a 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -83,7 +83,7 @@ Linux内核6.x版本 <http://kernel.org/>
    补丁，则不应先应用6.0.1和6.0.2的补丁。类似地，如果您运行的是6.0.2内核，
    并且希望跳转到6.0.3，那么在应用6.0.3补丁之前，必须首先撤销6.0.2补丁
    （即patch -R）。更多关于这方面的内容，请阅读
-   :ref:`Documentation/process/applying-patches.rst <applying_patches>` 。
+   Documentation/translations/zh_CN/process/applying-patches.rst 。
 
    或者，脚本 patch-kernel 可以用来自动化这个过程。它能确定当前内核版本并
    应用找到的所有补丁::
diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
index cc47be356dd3..89af3f8f6e2b 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -142,7 +142,7 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
     有助于内核开发的外部文档列表。如果你在内核自带的文档中没有找到你想找
     的内容，可以查看这些文档。
 
-  :ref:`Documentation/process/applying-patches.rst <applying_patches>`
+  :doc:`Documentation/translations/zh_CN/process/applying-patches.rst <applying-patches>`
     关于补丁是什么以及如何将它打在不同内核开发分支上的好介绍
 
 内核还拥有大量从代码自动生成或者从 ReStructuredText(ReST) 标记生成的文档，

-- 
2.55.0.717.g61afef3e37

