Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6FB1361;
	Thu, 23 Jan 2025 04:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737606880; cv=none; b=s8ByMsH6CAxvV0VCANqB/ftrHZNvH1FoTATNU/vQJ8zWyotzjo1Cuuip/Um+0GngjZmRnPstp1ACao0MAYieu4L6G/G5Snl5uIrwefAHRRJI+JKuruf/4Dz0fVJGvZPglLROqknEbtBqXZdU4Pv+svEjt0f3mbAG0qiK4Gah6FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737606880; c=relaxed/simple;
	bh=/w4KdFwMp15UFGzgReks8dM27MBlovu84y+Bbw9TN5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S6U7ZM0gxQCf1k4Gj3FVvmNemAESe2zvvGIZyvqdAKlUp46Utq221xnIMNHeiOKzW/kBUfXw0ekAvbpxszTXzdAfqqdhV0eqrS4DNITEOQUGReAbiD0w5DhMGhmDu6ocCFojmrp9WXkKgiEwuY+srR0zQTE5xuZ8pJYMQAiq3HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=H2AK8VDv; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="H2AK8VDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1737606832;
	bh=xx9FC76xwAIrjeye0xKHqp+VKi0WpBEAg2jHtZH/IFo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=H2AK8VDvjs++o8f4B4wpY82kEbFqGUTM98sXTmAJNDbWkRsE52PJwIHnwHgWiR2Qj
	 kC/duhG7Og8ILdt3RCxoBC/ClnMn9Q9qWQdWyFpHN75RfNPuMAQ9lpsBKPnohlNJ/l
	 mnnE3RjCvot//ZQWCESw7QAnjyqldXk+0RA5j7zg=
X-QQ-mid: bizesmtpip3t1737606792to45bk5
X-QQ-Originating-IP: anbZDQaRPK5Gyl5J4gw6tYtJ8eulS2Uwiq84w+t+gOo=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jan 2025 12:33:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6757157930268095525
From: WangYuli <wangyuli@uniontech.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	dzm91@hust.edu.cn,
	wangyuli@uniontech.com,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com
Subject: [PATCH] docs/zh_CN: Update the translation of dev-tools/ubsan to v6.13
Date: Thu, 23 Jan 2025 12:32:46 +0800
Message-ID: <6F05157E5E157493+20250123043258.149643-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NJvWNRsNVoV4maap6R32e2riSnMbpQ4t8Zj3HtbokjM2csxkkyGKr6NC
	NIEytA6YCj8q/FGYvNyfZIzpvK/72+ax2+04hzy3lpc3WmMpmO+k7bCRAaEPeAmSkwBrJCe
	PTDHN+25L0oUTi4ulK2R7QZJjWl263jKpwQMSECa0RVc6YLvgh3mcGeg2wbpizbNW1AvqmN
	McYfudlX3x3RtpQA+ry2WrpTxmwvJMBMxVULR7+YuW+irwQZ7pmDaypvqqDEdLjGtKcU9A7
	4tyq0QaozbULAf3W68BJTCUorw6quUw2RoGWBh1SWI5X/bPtGDyg3xidupJa53hV0rOaNKr
	vPfnRFEpW5mNxt1yoZDkPAuda8M8X5m/OPjpGmm5+5mazfK02GMm0bYhvChLnAEzlUXgyIF
	CFgRs/ymm9k47p3OQ2HgsXey09wHlMMcb1dw2UnmL9pQe5b/EFrNpgXrrYDMeRnL8+feJ3Z
	A6GlVZenzBRaySN1lgyl04W9laK/AbkB9upY1APnmGK8RIKW7I9a2IwMCfNchIJA32bhdCi
	+ReEo2yXvFW7rXNS8yZef+faUO840jUYFTDnZE1A71TH/cPI87kPTHLosvteTrCW5Jq7BfK
	VwGu3WPYqLS9x8sO4mSyMsG0rVd4fZRijIHLWabDWRMMBYZ73euFV+luMo34FgfBmpiKJkc
	bsFo0JlVXIPikN7mZn509G4Hq4/Yo0fxxv7B8wyv/KRA/60fswVxfneNwSOXYv5lUoQgI5S
	JONrLyjk0/lGoWEKEtSTCBOtTKJQBhozWDlRx5z/TAiwySqziSYno37/wiQCv+YYZ6lslyM
	nmgjN+3vEZM7WIneTmLlGJkMjAlqU0siuyATZy0YgAk8FYcaGbX8RA+clupb3FgWLjwTeI9
	zVeLO+MlN+/D9f4izOfBGQLR0/fV/4fkOhIx9346ZDrzQj3vj3/FXkkG4wWHHszHELyaTQh
	HLy4KHx/whJPcVQeUBUFu7P/FA6KMlAvQcoF7dKPL67t8NeSq3UMsxYTJzg8/7SpZzvL6RK
	488/LVzw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Commit 918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
removed the CONFIG_UBSAN_SANITIZE_ALL configuration option. Update
the Chinese documentation accordingly and revise the document format
by the way.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 .../translations/zh_CN/dev-tools/ubsan.rst    | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/ubsan.rst b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
index 2487696b3772..8925035c78e3 100644
--- a/Documentation/translations/zh_CN/dev-tools/ubsan.rst
+++ b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
@@ -3,7 +3,16 @@
 .. include:: ../disclaimer-zh_CN.rst
 
 :Original: Documentation/dev-tools/ubsan.rst
-:Translator: Dongliang Mu <dzm91@hust.edu.cn>
+
+:翻译:
+
+ Dongliang Mu <dzm91@hust.edu.cn>
+
+:校译:
+
+ 王昱力 WangYuli <wangyuli@uniontech.com>
+
+.. _cn_ubsan:
 
 未定义行为消毒剂 - UBSAN
 ====================================
@@ -55,30 +64,20 @@ GCC自4.9.x [1_] （详见 ``-fsanitize=undefined`` 选项及其子选项）版
 
 使用如下内核配置启用UBSAN::
 
-	CONFIG_UBSAN=y
-
-使用如下内核配置检查整个内核::
-
-        CONFIG_UBSAN_SANITIZE_ALL=y
+  CONFIG_UBSAN=y
 
-为了在特定文件或目录启动代码插桩，需要在相应的内核Makefile中添加一行类似内容:
-
-- 单文件（如main.o）::
-
-    UBSAN_SANITIZE_main.o := y
-
-- 一个目录中的所有文件::
-
-    UBSAN_SANITIZE := y
-
-即使设置了``CONFIG_UBSAN_SANITIZE_ALL=y``，为了避免文件被插桩，可使用::
+排除要被检测的文件::
 
   UBSAN_SANITIZE_main.o := n
 
-与::
+排除一个目录中的所有文件::
 
   UBSAN_SANITIZE := n
 
+当全部文件都被禁用，可通过如下方式为特定文件启用::
+
+  UBSAN_SANITIZE_main.o := y
+
 未对齐的内存访问检测可通过开启独立选项 - CONFIG_UBSAN_ALIGNMENT 检测。
 该选项在支持未对齐访问的架构上(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y)
 默认为关闭。该选项仍可通过内核配置启用，但它将产生大量的UBSAN报告。
-- 
2.45.2

