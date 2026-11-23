Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432035;
	b=USjHhZ/zEGEk4dzdYZ4cS+1bw5DkTmI6xZnPX0Zsi5pZgPVxas6A2NKH0HUEGsyRh6WK
	 CHR4lBKwVg4FuqNi7Zvk4mKHM17sUQgbFV5U3OHxTkiFNxw6Ywr7BT6XksgJtK8hELboM
	 eXG+UDp8hx77FqrnflMXY45QTQlPKHutU1hsHkPQBd3/dDxMlhJr2QMGB3A/bkE77eP5z
	 qWLvHrynZhiwEBifwdbe1X+1Z6CzWBKk598LadSLmndloYXPkkQv3Q042Hs17ltoA7SvJ
	 um8nIFQeCIO5j4cMaTAl+8WhgqwSE9dZO32w1YDvh2R/JFUuLBxLr791h79YcNf7Ghg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SeUaiyfKEAoES+ObZcS78Ct3jO+/x+qSRYLCaqY+cv8=;
	b=TxJ3A4wDSTlNwfG7lEO75LxPeo7kPoxSsE2UB0AwX0RWL6AYNDJDEnwxo34L/EaiqrGM
	 Sctmpgyo/kxbwoz/0RyOCpiKj1qj0xpI7odAygJaDZLbbN9ylHfkLAm/ucBPGjCYxEGde
	 Mhcnxsglw2dUfBiKrLfn65oE5ev4Pwi2mZYgJ3pept7LhR6p/g5/mKFT8gcmZz0EjM4xZ
	 jjtdIqOD0rgITZPu3zs2siTLs2bHXUybfdN6Uz5wFYdOCd4PwGRYK92dzOKn5lU0lHZt5
	 niskWWgq28k9bwhxt3PVtG0SIlf/uFKFAzIZu0dJwPQtqJQCMSJdjsWtSXQPLRGkk0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQCyuU9G;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D437606A690
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D437606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQCyuU9G
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a142c6cfso100052c88.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432034; x=1796036834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SeUaiyfKEAoES+ObZcS78Ct3jO+/x+qSRYLCaqY+cv8=;
        b=kQCyuU9GHqzQJH+49V9LZvLharPnNIo5YMq4CYAqDqS7lGnQ2OSaxNgB5Deh9RfEnx
         LA8oHTufZm98vtJXiYzW4JYwoLl6FrFNlaDhaLn9HwSxp9FPt6lAP3P/6LHv8zd8iOkw
         AxpZjZ3pcu3apemjvntmkyItq0DOyWeOwB0F1cilkHX6NA3ZCYNdeXfZTIyDL5etphSX
         I2yWm/NCQwR/5PjZEDzrxA/xXJtJJjAd22mkG+7SUmqJTbeuzmBBABEYmg44fweHpUm/
         blFH65dGDHFCYLFyEFmYnLZccK1mCIDdBRIGL/fcoFDiQIluXzaswu+9cQEfYizVV+sT
         zcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432034; x=1796036834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeUaiyfKEAoES+ObZcS78Ct3jO+/x+qSRYLCaqY+cv8=;
        b=MoN3g3+uZSkM3+O/HmwJysdQRjzR/dLBjs1U1Y92qK7Zfkc5s5xVPB9h22+UWEL4kl
         CP5yyoP9HCDbooZPn9rrRL34wd6EkGx5F96hkk/IseC+6Vb6SDt2SKxkMZF5SRntfMFe
         Kv+fcoaaA0fPlv+EUsSHuAIlTSvf3WDI75rBtqf7tDDCeYhdO0q2htuln94Wq/xH0wfJ
         GpUjBFGsQD/kRv+Xo+QeuKN4JiOD64EKFxg99e62naAiNYz9BbC+O5tXmYWLsDtKiMP+
         1uiplV0/xKdKKvSwmz0zEDZ8mxloHqbN3bRqMgvo6edbkvLf1/garzfF0nMQ4BHbJsU3
         ULYA==
X-Forwarded-Encrypted: i=1; AL+hErGIJ61Det9+PhW60HsRvlMg6QuLudWpQuglVIEyQqgfK1bFLOgKdGEt2bKRYDDtZSDqy6nQhijHx9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aTTvO2MfdQbO9P5OSb2I8k5ROfqDnN8M9pCrV+K8oso4Z4lwO
	zbcdEdabmSeOdtagOCb/QiKA22hm7JAy0N1R6iguHGKucGA2EQyQ5zb8
X-Gm-Gg: AZFdTZfp9Y5Jc+7Js9VRg+iRo2S/zDcohN+MULyDrrtbL9XwippoG5k/q4ElORyCkk6
	gROopb8lzTV0Tc6fYHNw5PxJwrn/IVtccNbsZyRls9NqecyQn93BxlDhpqzPzr8igjgUp+E8FOn
	bU6EiRrmcSzjvfiLYUqnAsyBkx4guT2FFNzq7aYcjdK2Pdy4s9kzymSlSCGIE4qjLo1MNAXIMPo
	MaImdgQJNbl1EJk8C54VSfVncu2Tq63yWnXumCZLZSvc3qSA3ubQOIK6+j3U9/ed1BDpg6TDoSa
	6KA/0yiTpz55Uw2MHzxUTH8mKBZOzg/YjkLFt4Oc7+AFE7NaSgUiax/vX/KcxLJqwuFUwLzeCo4
	XBpLi8KkSRuXAcuI9XWItaTVzn1ob5PPRFHXXo33FhXep+JRS4ASRVUj8FKqmWBCu0Uy8URL4+8
	SzNbwj8R8zQ6lW8BxEymrRcWeUmxL1alAXWbumlSdur2kQBe1ioCjDfEsRQ9Fd5erEKKW96Fofe
	Ik0cvzpDApK3R+OH+0hzpn3gBcZuGS6kAuqCFEuNH27hgYtCVoFbLSJeWe/MVPM+8yh9N0mt80G
	zRFSCguunLEcsg2ppHjqhZe2VAoXBmQLdiN7sDwEuCsuDRoPA8gOAl2f9U5zVeeqrnqpJTx9I+J
	9hC/vH6CzwE3pXn+iUXGR6rlnNtz6jMgWbgO+8tTPlVqINQ==
X-Received: by 2002:a05:7022:7f12:b0:1b4:fc41:3b2f with SMTP id a92af1059eb24-1b5568a1b89mr15678115c88.2.1795432034218;
        Mon, 23 Nov 2026 03:07:14 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:07:13 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 09/13] docs/zh_TW: process: add maintainer-handbooks.rst translation
Date: Mon, 23 Nov 2026 19:06:32 +0800
Message-ID: <20261123110637.172045-10-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110637.172045-1-chenyou910331@gmail.com>
References: <20261123110637.172045-1-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/maintainer-handbooks.rst into
Traditional Chinese from the current English text.  The
maintainers-profile-toc directive is kept as is, as in the it_IT and
pt_BR translations, so the list of subsystem profiles is generated
from MAINTAINERS.  There is no zh_CN translation of this file to
consult.

List the new file in the toctree of process/index.rst, under
"Maintainer information" as in the English index, and drop it from the
TODOList.

update to commit bda185c30593 ("docs: maintainers_include: Only show
main entry for profiles")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/index.rst      |  6 +++++-
 .../zh_TW/process/maintainer-handbooks.rst    | 20 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-handbooks.rst

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 8c558bbf30e4..a4ae46350636 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -103,9 +103,13 @@ TODOList:
 
 如何找到會接受你補丁的人。
 
+.. toctree::
+   :maxdepth: 1
+
+   maintainer-handbooks
+
 TODOList:
 
-* maintainer-handbooks
 * maintainers
 
 其他材料
diff --git a/Documentation/translations/zh_TW/process/maintainer-handbooks.rst b/Documentation/translations/zh_TW/process/maintainer-handbooks.rst
new file mode 100644
index 000000000000..1a159fccdbd1
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/maintainer-handbooks.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/maintainer-handbooks.rst
+
+子系統與維護者樹特定的開發流程說明
+==================================
+
+本文件的目的是提供子系統特定的資訊，作為一般開發流程手冊
+:ref:`Documentation/translations/zh_TW/process <tw_development_process_main>` 的補充。
+
+對開發者而言，下面列出了所有已知的子系統特定指南。如果你要貢獻的子系統
+沒有在這裡列出指南，可以就
+Documentation/maintainer/maintainer-entry-profile.rst 中提出的問題尋求釐清。
+
+對維護者而言，如果投稿經常忽略某些特定的提交標準，可以考慮把額外的要求與
+期望寫成文件。請參閱 Documentation/maintainer/maintainer-entry-profile.rst。
+
+.. maintainers-profile-toc::
-- 
2.43.0

