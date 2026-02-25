Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDEF3D34B7
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032204; cv=none; b=IX5ecnRamNhD+MYlUR7YGpND9GuV+FRXNLHhAbkFq+s1LAMy95DGy9JJkjRmsULrMAizhlWHIFFEPPRj5amV/2KzBq04uGLOsJd/MHDetVIpqMWPpaK9soaHPT6kqEr2m6f08LXbCv510sJGMdGqsSmKlh+UuV3dS8QQ9GZETjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032204; c=relaxed/simple;
	bh=fjcvYWRXHa6b955JUroJONpwr9Ltb1zbqSBjfgqGqUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qE6Mg/I4+kJAw01dS7BchvOkg735myYVoUqvmHc047XZr8weNEpdZA2MO/RgnuN7DP0mr4Nruu0G2muPEfPddhTG4T8jvygxScOe8lEo4+mG08X+hav8QaR1oIxnpdnyVKtHylXVixlzDYUUmKxVODAUH7pCQG9u+zqtM2j550s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lM8AT7Q6; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lM8AT7Q6"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2ab39b111b9so29324885ad.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 07:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772032202; x=1772637002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=APncnMz6ov6H21p2K2T3I+ylEiS2pkEh0cwFXYlvQM4=;
        b=lM8AT7Q6dDWC57Otq4g5jytb4bJ7cpAUkjo4+rUF/1c61fI4df5IctkVXMHB2RL02k
         X6VS1Sfi8zT2dIElEhB/+Smc6cJXaIamlM8M2Tr3LUNPZR7ZbSaD1qZAY3fLv9yc8Ymh
         //dFNfTHWZVz6HsSs66rkAFdgblhKp06D4ao4bSQY66SuWzIUIWXh1urEG3z2bgUaV1/
         wRVx7XutBYIKdUy1pMKvoelcrsJsLrJiRJdu9SvZp5L6hoKtho4RqW9c3bBTV+62B2I7
         GjxmFmbeSGBA8hO1MDOYquMnSr8wCfYhA+OWxM6Yd+tatL1IvR0jzIlUYpnOeTRTq0Sy
         7trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032202; x=1772637002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APncnMz6ov6H21p2K2T3I+ylEiS2pkEh0cwFXYlvQM4=;
        b=jT3hRgeQK73qP02VUdTZqyqGEQwchCXA3hbzHrZFFLj1rQZLDkQ3g4ed0fe9cousWy
         QUFqG7jJ1YpAG7SKFUMIaP5aF2dcxL5zeAaXeW/eRwfgO8yshcIqbtHKGuRwA0eZDvLi
         Wko+oLNNxr76GFaFm9OBG1Pfc3UpiixUGLK4q7RLh4Q24AOorNSZ0qcpYOWxYCZuqBcS
         j+rkJPIrtB+OyPMyMfUFE8p57477rAA4hzpqpvK04cjYPC3RBTyzYXi83mgpMGW1n8im
         UcsQ6ipboZRQR2PmHOPFB5vcyN2iaeTGc4Pw+KsJgqQltJ2R1evHop7qVy73n27V+sAz
         /m3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkdlyx2Bn8uppFvQxsqWYTUtcqfj88ldj5BebstT/Q9bd8mtec7wrYs7jSD+xKEBxubF2TaL5Xjm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO0i+y6RaK8mqLfNrBiHqyelBiL4zSPokSXX4YonwjOjYAgtjP
	Kk1Z/DjuaBMAVpFzNHZnGDV+Y+AARwuVlH7qVIsOc9BGl5cH5ay9g+Yz
X-Gm-Gg: ATEYQzwq07lqM9T9lfgi/EyWXBZVSmOUBnXtm7IpT5MuUTru0zyECIBcUMNFlkcChED
	DQeQKg2xUA/JlGfZJ2IopL0+NOnyAriRlVAC0XkHPVWLkxrQ2Q+zJhPZhPEu4lFPgBB4Qd7KjsK
	S/Vyy0RufPEXFS0ueZts+a2kBcOUBG3hyU4f4sRbj0kacIyJBcscPdI1gQ9EcH0k468cn2kpBSV
	WEKSg4RCddoOThFptgKndJIES5+Mjj0sduTHMx2LQlLT6VVsqLqoge64G4r84nyCd3EkmKIv9fD
	E21AqFbhyBBOhDeb4JI1mJxikmegRo2X4+8Crl6udjV39KUmMPNmwwjV98ZROcnGTlYD+DiTx0X
	qomsPnYnEYm4+Lh72FZeOZ1z4a2AZ4p8dJaskuXrN7n0HarTLHt5uI9SLcnpfuKkGs/UQvHMbPe
	+ZEFlyAGm6uDow6rcFTIS9n3pjqQqQORhhC1DToVzqRGKolZUvkw==
X-Received: by 2002:a17:902:d58f:b0:295:ceaf:8d76 with SMTP id d9443c01a7336-2ade9a643c6mr6674975ad.47.1772032202144;
        Wed, 25 Feb 2026 07:10:02 -0800 (PST)
Received: from aruoarch ([2406:da16:1c5:d100:9a33:3971:d96c:a13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5dd7asm186673535ad.28.2026.02.25.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:10:01 -0800 (PST)
From: Song Hongyi <szpcq123@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	skhan@linuxfoundation.org,
	w1ndys@qq.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Hongyi <szpcq123@gmail.com>
Subject: [PATCH] docs/zh_CN: sync process/2.Process.rst with English version
Date: Wed, 25 Feb 2026 23:09:57 +0800
Message-ID: <20260225151013.200635-1-szpcq123@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

The Chinese translation of the development process documentation was
outdated. Sync it with the current English version to ensure consistency.

Key changes include:
- Update versioning examples from 5.x to the 9.x placeholder.
- Add footnote [1] to explain the non-semantic versioning scheme.
- Replace the obsolete LTS kernel table with a link to kernel.org.
- Add a cross-reference for the "interleaved replies" section.

Signed-off-by: Song Hongyi <szpcq123@gmail.com>
---
 .../translations/zh_CN/process/2.Process.rst  | 56 +++++++++----------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/2.Process.rst b/Documentation/translations/zh_CN/process/2.Process.rst
index 31b0e2c994f6..ca00672c313e 100644
--- a/Documentation/translations/zh_CN/process/2.Process.rst
+++ b/Documentation/translations/zh_CN/process/2.Process.rst
@@ -23,21 +23,18 @@
 总览
 ----
 
-内核开发人员使用一个松散的基于时间的发布过程，每两到三个月发布一次新的主要
-内核版本。最近的发布历史记录如下：
-
-	======  =================
-	5.0	2019年3月3日
-	5.1	2019年5月5日
-	5.2	2019年7月7日
-	5.3	2019年9月15日
-	5.4	2019年11月24日
-	5.5	2020年1月6日
-	======  =================
-
-每个5.x版本都是一个主要的内核版本，具有新特性、内部API更改等等。一个典型的5.x
-版本包含大约13000个变更集，变更了几十万行代码。因此，5.x是Linux内核开发的前
-沿；内核使用滚动开发模型，不断集成重大变化。
+内核开发使用一个松散的、基于时间的滚动发布（rolling release）开发模型。
+一个新的主内核发行版本（作为示例，我们将其称为 9.x） [1]_ 大约每两到三个月
+发布一次，它带来了新特性、内部 API 的更改等。一个典型的版本包含大约 13,000
+个变更集（changesets），涉及几十万行代码的修改。最近的发行版本及其日期可以
+在这里找到
+`维基百科 <https://en.wikipedia.org/wiki/Linux_kernel_version_history>`_
+
+
+.. [1] 严格来说，Linux 内核并不采用语义化版本号方案，而是将 9.x 这一组数字
+       作为一个整体来标识主发行版本号。对于每一个版本，x 都会递增，但只有
+       当 x 被认为足够大时，9 才会递增（例如：Linux 5.0 是紧随 Linux 4.20
+       之后发布的）。
 
 对于每个版本的补丁合并，遵循一个相对简单的规则。在每个开发周期的开头，“合并
 窗口”被打开。这时，被认为足够稳定（并且被开发社区接受）的代码被合并到主线内
@@ -48,8 +45,8 @@
 提前收集、测试和分级的。稍后将详细描述该过程的工作方式。）
 
 合并窗口持续大约两周。在这段时间结束时，Linus Torvalds将声明窗口已关闭，并
-释放第一个“rc”内核。例如，对于目标为5.6的内核，在合并窗口结束时发生的释放
-将被称为5.6-rc1。-rc1 版本是一个信号，表示合并新特性的时间已经过去，稳定下一
+释放第一个“rc”内核。例如，对于目标为9.x的内核，在合并窗口结束时发生的释放
+将被称为9.x-rc1。-rc1 版本是一个信号，表示合并新特性的时间已经过去，稳定下一
 个内核的时间已经到来。
 
 在接下来的6到10周内，只有修复问题的补丁才应该提交给主线。有时会允许更大的
@@ -84,11 +81,14 @@
 开发人员的目标是在稳定发布之前修复所有已知的回归。在现实世界中，这种完美是
 很难实现的；在这种规模的项目中，变数太多了。需要说明的是，延迟最终版本只会
 使问题变得更糟；等待下一个合并窗口的更改将变多，导致下次出现更多的回归错误。
-因此，大多数5.x内核都有一些已知的回归错误，不过，希望没有一个是严重的。
+因此，大多数内核发布时都会带有一部分已知的回归问题，不过希望它们都不是严重
+的问题。
 
 一旦一个稳定的版本发布，它的持续维护工作就被移交给“稳定团队”，目前由
-Greg Kroah-Hartman领导。稳定团队将使用5.x.y编号方案不定期地发布稳定版本的
-更新。要合入更新版本，补丁必须（1）修复一个重要的缺陷，且（2）已经合并到
+Greg Kroah-Hartman领导。稳定团队将使用9.x.y编号方案不定期地发布稳定版本的
+更新。
+
+要合入更新版本，补丁必须（1）修复一个重要的缺陷，且（2）已经合并到
 下一个开发版本主线中。内核通常会在其初始版本后的一个以上的开发周期内收到
 稳定版更新。例如，5.2内核的历史如下（2019年）：
 
@@ -105,17 +105,10 @@ Greg Kroah-Hartman领导。稳定团队将使用5.x.y编号方案不定期地发
 
 5.2.21是5.2版本的最终稳定更新。
 
-有些内核被指定为“长期”内核；它们将得到更长时间的支持。在本文中，当前的长期
-内核及其维护者是：
+有些内核被指定为“长期”内核；它们将得到更长时间的支持。请参考以下链接
+获取当前长期支持内核版本及其维护者的列表：
 
-	======  ================================	================
-	3.16	Ben Hutchings				（长期稳定内核）
-	4.4	Greg Kroah-Hartman & Sasha Levin	（长期稳定内核）
-	4.9	Greg Kroah-Hartman & Sasha Levin
-	4.14	Greg Kroah-Hartman & Sasha Levin
-	4.19	Greg Kroah-Hartman & Sasha Levin
-	5.4	Greg Kroah-Hartman & Sasha Levin
-	======  ================================	================
+  https://www.kernel.org/category/releases.html
 
 长期支持内核的选择纯粹是维护人员是否有需求和时间来维护该版本的问题。
 目前还没有为即将发布的任何特定版本提供长期支持的已知计划。
@@ -320,7 +313,8 @@ Quilt 是一个补丁管理系统，而不是源代码管理系统。它不会
   没有完成家庭作业的人感到不耐烦。
 
 - 避免顶部回复（把你的答案放在你要回复的引文上面的做法）。这会让你的回答更难
-  理解，印象也很差。
+  理解，印象也很差，详细请查看
+  :ref:`Documentation/process/submitting-patches.rst <interleaved_replies>`
 
 - 在正确的邮件列表发问。linux-kernel 可能是通用的讨论场所，但它不是寻找所有
   子系统开发人员的最佳场所。
-- 
2.53.0

