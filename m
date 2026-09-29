Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E3514774
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683266; cv=none; b=oCQ1hXSIE/i7TGuaN/KDuI0c0OPC2D/9lU/mMVdgb6FmOJCL3LCJRYHWEN156vaFTRhlyCXuEIZ2y8qZWSzQVX9akV2uXGGqHEtV9l4r2ezNRzVu4JO8IqDhbZJJng/pdc0HN6j+EJJwVj3DYIE4Ri0HKgciPGj3P89UVBosvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683266; c=relaxed/simple;
	bh=EefEiGHTBEWe6vlhp7yvBUWxVgC2lwSRq+1qS1qRe/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6albUUrLSFyp0ttW5Xu+jNBqYEWWddJ8giBwLNK5/qJ+vIJEdgQu7hsFl51ovAQ/pdswMM5aGzRXWqhfntSq7Q+f0pb17cjYWbM9iLmrkEsaG5rQjR9+9UOHHwOscn9XSd37qqIdUS1RntIHX6/kAyvSTz0Wwk3iy9gAONCZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gO6HMcUn; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gO6HMcUn"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff23d81eso3360215ad.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683263; x=1791288063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJDD9IoswwAgGNzNN6AqXg47pprIDsuobgglsU08RAA=;
        b=gO6HMcUnwBTZ3AYXPKo31xMTDTDK5xEXPG/4iixSfxCh6mimodcvYWFdMuxujvGySR
         bSyg8Kqik0LS6SBdO1MfEW1ra9GE01gsWUZePqpZM9kltxsYKTjH4sBg1alGZqmfBPjn
         nVk9SpkEzYWsoQjSMQFZE5jdtpXZmQaS5Ps4/eVLRwyBDkusDIxYxJwD/OB37SONAKyj
         K/2pTzgVYUNu6RwQe/W0SIGHj69JseC1JH3C67UAzC42467OqAu0/YAlSQqBWuiuZL6+
         TfO1AjLJNBf9VP1vF0OJk0bLXVED+4VxycMwYdpa2Zis4C4eJ7HH2uaX3kUKvcJP3sLb
         HqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683263; x=1791288063;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJDD9IoswwAgGNzNN6AqXg47pprIDsuobgglsU08RAA=;
        b=hE+N+PDoVALpCoxYbyAj8KQvAEBSh+GgHTsXBbAXAEF6hUm38+B5DekUsAg0Kv2grj
         eZouaIzqtW+YPChFEKgHalfaJmMKmPRIiMp4az/8nflYJbQsNgYaYyiFkw8RtLkzxzqM
         dK4Z1LCwKYRhHXtVeUKZpUhIPlgRe5ebMUYZXs4mqMbXgiWVG991MAGJXbF2cfbwLHFa
         u6qG0OnX9qVuDtJUbO0blc2dPnTj+ecNcmNXLfS8tCeNTiZuQJmrX7EtNB6j+0qvC93o
         IseTDKjxzgwoRG5ErbuofvPv1VVQ4zuV3lQButLwSbUczrlS8qG1IY+p3xyqjQ1SqDrs
         t28Q==
X-Forwarded-Encrypted: i=1; AKwUvByF9JoyrkWbf3jNRmrpWErXzjTc0mABjFpW40oJvpksp7noex3i2lEBW1e0EGdUXdjeBCwq9cqDHeM=@vger.kernel.org
X-Gm-Message-State: AFuF++klPrBxbMd85fV5k0gtqy+lG2YFrv2aeqMpl1tFSZHokmMw6U6U
	CSUAfK8nYRu+i6cH0y2o7l+Y6JNgRwXxzXVAVTQGw+iaMOAzcX698+jF
X-Gm-Gg: AYBFou0STZ6uAKqhFdeoYx+OO+D9dbpSdGwGSb4m30UL6BmNwJOQ3gcm5A6wumOHOyb
	5uU/W4H3IdLkomk158HoxNNbs8vQD18zGRaO1bgTOhCtVUisODgmppajkKsPFgND0vFHL1hEpym
	xhKwCQXXIwBpgNkNyB3p+rGlOfB9D8hOsN8XFd6t3T2ffo5xnkMtkca57EfqyihJYq3/cognUd3
	o+c4caKwiw6/XUPs3csxTOuhIF47BVHoFkOvLSNp7oqsb1aXWDzb/MK72t2MpWjzFlQmexLB7zQ
	da2trtH5cGlny//TamC3fcux+KdgmmncVsIT5YjdxADhSVW/kg4o2CKHJkfIE/KhvjG0wgrCTUE
	YdYtkAcdKuOnZgBezzF4kutEWAs4yC6dEHktIojpeJ/R6Mqk4U1g4xcbiofvhQEfrAaMhvgPnW4
	OkcxH7nqxFpLR/QVeAq9IbznJLnKcZK3TVVwdgMO/A7HNlEwjVE8rb590mrqrli96A7y7YI8EuE
	LR7iyTHBoFl64EJD24ND6kXugg/kIXFhbryeyOp6uoiTrppHmM1Gbae8Q==
X-Received: by 2002:a17:903:1987:b0:2d9:2798:66d3 with SMTP id d9443c01a7336-2df7d728fc4mr201923575ad.0.1790683263491;
        Tue, 29 Sep 2026 05:01:03 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:01:02 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Deng <theandy.deng@gmail.com>,
	Bailu Lin <bailu.lin@vivo.com>,
	Bernard Zhao <bernard@vivo.com>,
	Bryan Wu <bryan.wu@analog.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chucheng Luo <luochucheng@vivo.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Dave Young <hidave.darkstar@gmail.com>,
	Dongsheng Song <dongshneg.song@gmail.com>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Eugene Teo <eugeneteo@kernel.sg>,
	Fu Wei <tekkamanninja@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	gao chao <gaochao49@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hailong Liu <liu.hailong6@zte.com.cn>,
	Harry Wei <harryxiyou@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Junhua Huang <huang.junhua@zte.com.cn>,
	Kangkai Yin <e12051@motorola.com>,
	Leigang Zang <zangleigang@hisilicon.com>,
	Li Yang <leoyang.li@nxp.com>,
	Li Zefan <lizf@cn.fujitsu.com>,
	Maggie Chen <chenqi@beyondsoft.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Punit Agrawal <punitagrawal@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tang Yizhou <tangyeechou@gmail.com>,
	TripleX Chung <xxx.phy@gmail.com>,
	Wang Chen <wangchen@cn.fujitsu.com>,
	Wang Cong <xiyou.wangcong@gmail.com>,
	Wang Wenhu <wenhu.wang@vivo.com>,
	Wan Jiabing <wanjiabing@vivo.com>,
	wheelz <kernel.zeng@gmail.com>,
	Will Deacon <will@kernel.org>,
	Wu XiangCheng <bobwxc@email.cn>,
	Xiaochen Wang <wangxiaochen0@gmail.com>,
	Xudong Guan <xudong.guan@gmail.com>,
	xu xin <xu.xin16@zte.com.cn>,
	yaxinsn <yaxinsn@163.com>,
	Yinglin Luan <synmyth@gmail.com>,
	Zhang Le <r0bertz@gentoo.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 4/7] docs/zh_TW: dev-tools: remove maintainer contact information
Date: Tue, 29 Sep 2026 19:59:52 +0800
Message-ID: <20260929115956.229610-5-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929115956.229610-1-chenyou910331@gmail.com>
References: <20260929115956.229610-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the :Translator: lines from the dev-tools/ translations, and the
Traditional Chinese maintainer lines from the plain-text header of
sparse.rst; the rest of that header is kept.  MAINTAINERS records who
looks after zh_TW, so the per-file copies only go stale.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/dev-tools/gcov.rst          | 1 -
 .../translations/zh_TW/dev-tools/gdb-kernel-debugging.rst    | 1 -
 Documentation/translations/zh_TW/dev-tools/index.rst         | 1 -
 Documentation/translations/zh_TW/dev-tools/kasan.rst         | 1 -
 Documentation/translations/zh_TW/dev-tools/sparse.rst        | 5 -----
 .../translations/zh_TW/dev-tools/testing-overview.rst        | 1 -
 6 files changed, 10 deletions(-)

diff --git a/Documentation/translations/zh_TW/dev-tools/gcov.rst b/Documentation/translations/zh_TW/dev-tools/gcov.rst
index 39ac3fff44cd..69965427a51a 100644
--- a/Documentation/translations/zh_TW/dev-tools/gcov.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gcov.rst
@@ -1,7 +1,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/gcov.rst
-:Translator: 趙軍奎 Bernard Zhao <bernard@vivo.com>
 
 在Linux內核裏使用gcov做代碼覆蓋率檢查
 =====================================
diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
index 4fd1757c3036..8faa87f26c6a 100644
--- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
-:Translator: 高超 gao chao <gaochao49@huawei.com>
 
 通過gdb調試內核和模塊
 =====================
diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
index 0d38e5f80e54..915449762d1a 100644
--- a/Documentation/translations/zh_TW/dev-tools/index.rst
+++ b/Documentation/translations/zh_TW/dev-tools/index.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/index.rst
-:Translator: 趙軍奎 Bernard Zhao <bernard@vivo.com>
 
 ============
 內核開發工具
diff --git a/Documentation/translations/zh_TW/dev-tools/kasan.rst b/Documentation/translations/zh_TW/dev-tools/kasan.rst
index 27fb7645174d..7728b50aa4b6 100644
--- a/Documentation/translations/zh_TW/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_TW/dev-tools/kasan.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/kasan.rst
-:Translator: 萬家兵 Wan Jiabing <wanjiabing@vivo.com>
 
 內核地址消毒劑(KASAN)
 =====================
diff --git a/Documentation/translations/zh_TW/dev-tools/sparse.rst b/Documentation/translations/zh_TW/dev-tools/sparse.rst
index 55f0ad2c0beb..7a3487a7b2c7 100644
--- a/Documentation/translations/zh_TW/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_TW/dev-tools/sparse.rst
@@ -6,17 +6,12 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
--------------------------------------------------------------------------
 Documentation/dev-tools/sparse.rst 的繁體中文翻譯
 
 如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。
 
-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 -------------------------------------------------------------------------
 
diff --git a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
index 3b08aad1da00..140f4f946833 100644
--- a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/testing-overview.rst
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
 
 ============
 內核測試指南
-- 
2.43.0

