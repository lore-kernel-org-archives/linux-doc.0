Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079FB40DFD5
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 12:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232248; cv=none; b=mY0FQxUrVswuh7tPz3KuwKyc2RdiCjPf+MUT6RahbG0LQXtBEQ+rnHFb+HrCk2UcoUfZ8w+IZPItvoOko8BGoDHxYHLIwxr+88HsihP8P4Y+AfZze1aNCIHVMbW/TRrg0ps9zAIN8J7C8IFZz1bAdD5UnayljL2k1bhsxrqU4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232248; c=relaxed/simple;
	bh=o5tJ5wblB8GzFTEw15EQokGtFJG2nSUPShyaByRw8wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4Fm1597Xh10FoRIOb08W+OWOYkt+t2Wmaw5GCw+RIRdoptCOqT4y+fIhRDXxhwkSZe5bf690HNVw2wnAe4OmXRv+4P86VFBokxm3wBqmc0kVM7Ee8CeH/+QxZiaSyhrsB6yHOPcDKGUQvm0mSboChya0ynsW9vYCiEf07AoaqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRXkn5nc; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRXkn5nc"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c2af7d09533so9086270a12.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773232246; x=1773837046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiqgeYSYZM+IukzBHaoeiiQVQPbxSPd8mL0ZsnGyz7g=;
        b=LRXkn5nczut9KYjPgY4prpVY3bSLXmCMmeze5bvNH6MFSUo4cihHWuR5jni5ZUrGkx
         meSygC2MdqkWfZ6EyASlKlZb5ZxUHuF8J44arl6EDe6sXNaIN4J9J/CaWGK1X23pZOIM
         BaBzuc1ci++hoMAi2PHmK44Id2eayFAgcQy4Z6XhM/2uX0aeDa9kFvHS0rmHGYb4eTvW
         E4B6PQOmiw8paWCmRkK7izt6akbDMK9U4rUSstB1rVjWB87s9aT+CJjkpEW3R/ydZ+37
         pCntwvNcTaq5k49c0l3RjIEluGLAUwOq8bYUOzpWwjBzfeySDejD0JlNdFgB7GWUBL+9
         6YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232246; x=1773837046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uiqgeYSYZM+IukzBHaoeiiQVQPbxSPd8mL0ZsnGyz7g=;
        b=Lz+BJnsDTp6wnRJB55zEDsFoTHOnn3gVCnFIl37j6sUV2mVsT0L/kiSLRnt12O/lo6
         9VAQCixixsPRTmlGiIh/4xTZuEKPRJFRO1FAx+cVYnCbpk+fyYpsYOwrw0vijKEV1W7o
         rYK74cdihZK6fHTxSwA81LxS3lQ9rf6+2TnNfBpIHpUzgdzA9zJ5qPBJR2Oj+jW2BKTe
         bS/XbpXb7JckksbU6uRGdP248j85c2hSVuIk4BTowBdJ52ZvVkgJh3G+/nphF3iyUiUp
         2IaeB/+ALKypG3OP+xxOmEvj+xsgoZGT3G5Fm6HUvMQNR7jkaJbho+qcJjrqIFXtQFR4
         /btA==
X-Forwarded-Encrypted: i=1; AJvYcCXbS1qGfHFFoVPVRrMl4ZIVg2VmN1p/WDv7jwFXsCxdz+nx3D86CcqLAaE+C8gbK7Cc2ZeOXfgCwKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmO3kKoAwXPd66LEL0WpqzDsvVs8xWlcejfuujbZK3oamDMCWW
	iSSyHLBrI4g9Q9ZQxEET1QVSfJQ4AX4DTA6MaBtAD8Vm9nv9O70vSDOpcCyJVN+XNAvQ+Yre
X-Gm-Gg: ATEYQzx5l1VERPliwI7nJIN7ZXsnS92SmSDoNYd9aMr3xcMJg5HEQpHxmdZWimojkCD
	CJf4WnjyrpLg46NcKuXMFoMjbDqHAf+2cGe9HHvfnvUJMbIdVsTGsM9IiUhMOuplyyeTUODQza0
	i7vCfqoOEXF3UZx0xGUwxVwaMWb1vbhuBigfgBPREiaUih5PTydDn7HpEENV4WZVPKhQJr1001z
	XDcKvv3OnpnQtcwnK7DRzFI/Z7RaY15jZsbj982uO/jXGcoq2WRgGWfXDhqfHqaATPWrDV3zaAp
	q9XvVKFL3wxFrLPO8NjddmQkNmVCINCh2kGm7fkijpG4yicu2fbjSo2+qS2W96g9h1pHuxo1Xm7
	TmsC9moyj4KYV44LGZVhOb1iN5VdBDik5NcvGAoo65QKkNg8u48nJu0Bc3rhNM3xHJ37Fs5+QK7
	oF0hDJinaXcBY4kE4VxYIDDY3RNRQJhb4S564VpEOGbOFp0Do5vQ==
X-Received: by 2002:a17:903:388e:b0:2ae:7f24:2378 with SMTP id d9443c01a7336-2aeae8903a3mr27508055ad.38.1773232246131;
        Wed, 11 Mar 2026 05:30:46 -0700 (PDT)
Received: from aruoarch ([2406:da14:b1:2a01:2bb8:19c2:be2c:4043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae22217dsm23074095ad.4.2026.03.11.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:30:45 -0700 (PDT)
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
Subject: [PATCH v2] docs/zh_CN: sync process/2.Process.rst with English version
Date: Wed, 11 Mar 2026 20:31:03 +0800
Message-ID: <20260311123107.329769-1-szpcq123@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9cc4a719-d6ca-4f15-b862-60fb862ba7b2@hust.edu.cn>
References: <9cc4a719-d6ca-4f15-b862-60fb862ba7b2@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Chinese translation of the development process documentation was
outdated. Sync it with the current English version to ensure consistency.

Key changes include:
- Update versioning examples from 5.x to the 9.x placeholder.
- Add footnote [1] to explain the non-semantic versioning scheme.
- Replace the obsolete LTS kernel table with a link to kernel.org.
- Add a cross-reference for the "interleaved replies" section.

Update the translation through commit 5ce70894f6ca
("Doc: correct spelling and wording mistakes")

Signed-off-by: Song Hongyi <szpcq123@gmail.com>
---


Hi Dongliang,

Thanks for the review! I have updated the commit message with the English
commit hash.

Song Hongyi

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

