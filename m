Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964989;
	b=skQEghzXNC3DIMBXjVcZzZQMXht7p5LAbYPScr4S+XNaxXBHpPR5N2Mkq6WcFA/m8BPl
	 vZmWGsaF2m2h1d6VaNY2dn//wprK422mNuqVk5jisJJoxhAAMT4LENjx8FR7/6MMD7FQx
	 203+b+vB6ZS3QRT6VyHNWCPuPSeoAQXgUD6rDfpt7SGGBpgCDa5ZOeyJ5pjPxrbNQ2R0A
	 ng80zcoE/GPBCKfa4Jlcwv/OW/CicmQ5iQysVoTv1PIWKJJx8JYK1brgcGXYbkjOORECw
	 C9vVckaadSIgCW5dss0pCBluLEptraEgxJHgn78ZJOyd005V2ERdguXHFd++k/LoP3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ONbYayK2MPTgQEPAKtmB/OnwdZJFKK2un5QHf4Zu1aA=;
	b=OBFUuYF+Ry/7Zl2XcdTMiWaRjQIG2ECyy8nq+YfSlWYPbN2T3nBamvXnD1CYJYpZ7E9a
	 +22fFfH97us0RoA0jFrASMHK+m/cq2SxX3Ib9CLmTWEz15TTuo2kzf4Qdm/DJBe/N23JJ
	 01oozKby2IPW3FYLTlK9tEft7OZbhy1Eoht5Ey6WGIeyIpXj8N3fST1VF22U6l12Mf4hR
	 A2g2nbUbgEhLVQm37WtA3A3t5VEO/mnMtHO1CL+aAAqJM6uLZCKhBSBb8CgPT3pWdKSbQ
	 2xVUFmuN6fTjKOKxkNFTi+dUJN2WpyXf9Hly/PWd5boDEBs79n6J+Ej9LTowO+HqCJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3ZYdqOJ;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C3B60A5BE0
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C3B60A5BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3ZYdqOJ
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb1224533so45445a91.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964987; x=1794569787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONbYayK2MPTgQEPAKtmB/OnwdZJFKK2un5QHf4Zu1aA=;
        b=I3ZYdqOJVnbF1Q48yau0p7KtYEgkaDMAFHMbyikgP4Et5//dK/sZEMOJzKXqKDxsww
         xJ+clnYTMDUc6tPR7OtaemK4VZ3BzZzBFWotA4QbsUY5idFQnNFR1xZzhmHiyjH+w4BS
         82qz7c4wt4H82deGCcXPnGZRwFBngQUB6CRGIy/PhTtn6dqgOuzaIH3KSgXJl2tM1PiX
         Xi12NHyTwp2JTAYNKrf+xYaGN7Y/u0F63dyiYB+68XGsOGm2a4mafuHpB5OTGnPQXeFy
         UoxEWgn1wi7nQ7cSDdf5GkipuDDUYe7eaS4aVJF2Pn1DMF8jWjuSDmW07JKxcC7ED1VP
         T55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964987; x=1794569787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONbYayK2MPTgQEPAKtmB/OnwdZJFKK2un5QHf4Zu1aA=;
        b=im3fD2AsoEbt/Ma7lwU0fcm84TwVQJUhKAVsq6A1YrkMbeXSX2SBNYZ+ym13xzklXi
         DMMb0UREmsgHC7ea33QH4KX8AK1DFpC6b4TcgHjmWs+8rlt/vefMBbdvUu7W7L4Ichf7
         /vOK899EEWewHGdRh8u6LiOij4MpW8r3d52WVP9/OOpLW3G/3vyHF3RAbKE0KafQ3XVh
         PheqfclYl2/zk8QhAxWqkuuVywHg8nmXH97Srp7F8SSOg70MwXlhYmpqUrrpy0lcPkjx
         jyHTJX4l1/3J22/vVAZ3aWc6d1cMq+wq+MOeMWlnqS9hgaPuhyVafWsaNnJxOGr+vNOl
         nPww==
X-Forwarded-Encrypted: i=1; AL+hErHKUuNxvYA/A8pvxK64kxk4COKiTSGW/XdIjDxoG4A3StA0jyNPF5LloCvGxp9m9EgkNhegbWJ5i04=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bwlQrEp4/FeKVFBim87rBxf4GXbvcI22awcO9STClNejbOh55
	O6M4fhgQ0B/NJ/Wxnme5WIQYr3TigJQNa5kCivKBznjrm6UyeCmxRDYF
X-Gm-Gg: AYBFou3oxhHbGucI2IMF0DvrFESltRRI4MpuztIjdzzk2tWznhsSU4rG5DeAZB/aAW/
	gyhfGCxnc6IBekqO+1jGIXZbUpoE3PhxIQwpBVxdyorVavRJncuXyb6du/UW9Sqvpk/0VJ+wg8t
	+rsXKH8GW7NiFdQo6NCOlBOwpZRvuNFx+gjpPBjRq5rCHHj7C+RRwa9mgf+F6KhxX4dUvee0NXh
	wrSJUQwtZupzk0igaEvK9zYENz+SUOsy+J8S3lfg+jmR6WAqi5bX0QRe79R6uU7vCzIKS6fA6EX
	y2D0JF96liV0nN0qW5eLQHwIBOPd8Xm6QPq0Ln8UVNHoc0Bt0Mq6F8eerQeJJo4sNeChWcjjCSC
	mfRUlsQFXmZYPtSB7PR4N+WMsMAiVVxHDuo6ogE1m5V8QFQDDeryuIspWWckg4aHXFINYE2rVSH
	78IJ3qheJ8Efop7FwF+3bqDBBXRv3Kd5hlSCVmzTgis+kV7afFcZtFTJLW0SScTDH9UPQIpAAVG
	Dnl2/37XYy+C+RnwuTlPHQMFqK4zmq1fqNVLobXl5gQiaCLOTzOUbiKTddAq86mFw8El+C79u99
	kNkHCCVcKVbwfokGf3WvqnD8k4s2ExEtco8bO1MHU0XNlgpeey0rQBhhwzBBSi2SRJOqCz/ura4
	ebsPkwKrg6/19yByHzb8LS/X3SvQnqSBUqoIhhzR0r9yvqg==
X-Received: by 2002:a17:90b:264d:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b0db61aefcmr3399320a91.1.1793964987543;
        Fri, 06 Nov 2026 03:36:27 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:27 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 09/13] docs/zh_TW: process: add maintainer-handbooks.rst translation
Date: Fri,  6 Nov 2026 19:35:40 +0800
Message-ID: <20261106113545.708896-10-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
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
index 000000000000..502cbd69251c
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
+:ref:`Documentation/process <development_process_main>` 的補充。
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

