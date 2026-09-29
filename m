Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573151AFEB
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683276; cv=none; b=eYLW0NH1kawwZaLfPiZrgdPaxy+QkczBEuzPkw7pFzApstUzCtsaKLG/+6YekldZ7Bdxr7jzXRlQmnXrvSYtg21I55fXJGX2WBV9JrPc7bcIgwXzqOQlGwPSNePOrIUOOVTXG8aDsqbc/s20xM0JFseHyB9n98lMybh7H2jUaBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683276; c=relaxed/simple;
	bh=vIDOCYTnu259SQITleiwRxJem2HFoM1pdL93tt/izHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sO0W+LTnQgGwWG0lN1jGPQlLeBxegZH8awcZkB4h7K2F36GRadp+Sm/X86ZxbZjuGea69Et7HSorIpXB9v3ll8Uc71b6/9gwSd32q1EFaxf5LwJ6HvJqgULhrTw4jKfyh8lSaMfeKf/FJgwolQCFP+Nys5WX0j1BzqKoBgE+pjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fS4I09ha; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fS4I09ha"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d81eso3360655ad.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683275; x=1791288075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zuNp0QF5+TJLlDYg4fr24aC4I45ysF+3R8J5X7Towlc=;
        b=fS4I09ha777ocCWBpvKD8fkslPhcIg2XyTy9YWe1omFZPyfRN/dMVo6ph5b/ZyzytR
         HhFunsYq+7ubsP0Rz2sNQHcxXtZzIQElPy07lXaldhHeKdm5m3e4fm8H1YLsZyaLI0ZP
         0KOVG7RQBNCse4BOmlEyxBWxpdOxOu6WOIWqQ+vvgsotUghYKe3uSTnOamZYhp9nmGoi
         RzVq5Iw42P4SxOS8Y+vqH2z9QNAzn5h1lgB2Z1otmuLZE8wjohG/36qtLywlkAMxta6Y
         NmhgGKds1dclGiNgmb7X4GMKiXJ3eB3xObbX4Vq6GtFAfsqsHF15oW8Tf5knKws5lh4N
         Zdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683275; x=1791288075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuNp0QF5+TJLlDYg4fr24aC4I45ysF+3R8J5X7Towlc=;
        b=n5fsNgRnnontAL2jwX4Wqn+yFCyG1Ui/sSQh+0rabio+gCaZeakO3lN6LD0NZaMIDg
         Gm/mFL2+glcKhwKcn1b0dMqu8SQQHWT2RzowWmmYDGphh78lZ6mjMsMXmQiXI+7JG1I1
         JVAjF1GhGrUz442rDCJSg1hQTjgGcHG0GyE7lhLB09xAiSxqnBYejlyZoibB0N2DIu2B
         jswLeD7ho2+SqQVDWf7VRbTwcmK+omtOrryNsnE2Qxpt9A5R543k89mOqTdSZbCr46f4
         uEQ1lEqbyABc5+Dny4FDtjB9c83FHRbIGoG8PykYA5p5DvJJauRZJ8TVwmRCiwa3cLG1
         Q41w==
X-Forwarded-Encrypted: i=1; AKwUvByUmijtnvRmHW+3EfHrIoWMAwpZhHO+QSbamKT1yV5ynzhNjl2I5QcXeNAawD3+cj2VFaYwBbDasrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJStWJ4MEqPrqs+9Rv6S6Qf7ZIYAytTfaL5wjUUdSJKH8e9j2d
	sf/0EU7L31g6h7qXipmPpi/cNQciK2OtJkgokN3xcrPYBMP/zgVg03fP
X-Gm-Gg: AYBFou25KV35XDBvmBG3m22/XZF6HKykNLejO3gGddfkQRobTbiGm7hwoQNEpij0bCw
	9yfBlTvdUJOKrjarrOzvCHIZrCw9TX5bgiAOS7oNqEWVW9i9xl2EDb+5GJlCoo2fzYYwE3nGvvJ
	TLLtSA08ebp8lLEtJza2gNTx/rqfTUVkXBoNG8/In9xz8OScBuJTfz+vhPiG8WBLT3xvyk02Jv5
	WrIB0bNDEXIVKS5YJweL9yhNIqpiXTQBfpPQK5zgX3r9iD8qc/ZZKvR1LcswZRtspLCZAjoI2c6
	Pwdup3z/nqdr4rucTprdSIOuEDlJfq9kRO0vJFTxRXyPakEEHZsLIM37M5t7EeWDfhleG22CyqG
	TLVJmdw6hVGCbCaKPo07kseje+y2glnJ6nTNZG5yTyisjXk5wBbDzQGIpPkEOyXWCXuvgGYE+b1
	7/L7ozbqjEJxdVDsozo/Jxe1RKaVorDhZ0T5FjrBXzCfUJQY9R4PiTvXCDQ1OFoQdbrg4x4Ywga
	pAwOvEybN0ki51aQYNXO5BUAf98HsZ8kqNKrNsythtgmbZPN2lxyKpccNvRZofkStHcuA==
X-Received: by 2002:a17:902:e542:b0:2d6:3c1a:85ef with SMTP id d9443c01a7336-2df7dfc93c6mr198422455ad.4.1790683274658;
        Tue, 29 Sep 2026 05:01:14 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:01:14 -0700 (PDT)
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
Subject: [PATCH v2 5/7] docs/zh_TW: filesystems: remove maintainer contact information
Date: Tue, 29 Sep 2026 19:59:53 +0800
Message-ID: <20260929115956.229610-6-chenyou910331@gmail.com>
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

Remove the credit information from the filesystems/ translations: the
:Translator: field in index.rst, the 譯者 literal blocks in debugfs.rst
and virtiofs.rst, and the maintainer and translator lines in the
plain-text header of sysfs.txt, whose remaining header is kept.
MAINTAINERS records who looks after zh_TW, and the names here credit
the zh_CN translations this tree was converted from.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/filesystems/debugfs.rst         | 10 ----------
 Documentation/translations/zh_TW/filesystems/index.rst |  2 --
 Documentation/translations/zh_TW/filesystems/sysfs.txt | 10 ----------
 .../translations/zh_TW/filesystems/virtiofs.rst        |  8 --------
 4 files changed, 30 deletions(-)

diff --git a/Documentation/translations/zh_TW/filesystems/debugfs.rst b/Documentation/translations/zh_TW/filesystems/debugfs.rst
index cda7d0e18b9b..17e12fc57400 100644
--- a/Documentation/translations/zh_TW/filesystems/debugfs.rst
+++ b/Documentation/translations/zh_TW/filesystems/debugfs.rst
@@ -8,16 +8,6 @@
 Debugfs
 =======
 
-譯者
-::
-
-	中文版維護者： 羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	中文版翻譯者： 羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	中文版校譯者:  羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	繁體中文版校譯者: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
-
 版權所有2020 羅楚成 <luochucheng@vivo.com>
 
 
diff --git a/Documentation/translations/zh_TW/filesystems/index.rst b/Documentation/translations/zh_TW/filesystems/index.rst
index 88f0e632bfe2..87307a291c8e 100644
--- a/Documentation/translations/zh_TW/filesystems/index.rst
+++ b/Documentation/translations/zh_TW/filesystems/index.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
-:Translator: Wang Wenhu <wenhu.wang@vivo.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_filesystems_index:
 
diff --git a/Documentation/translations/zh_TW/filesystems/sysfs.txt b/Documentation/translations/zh_TW/filesystems/sysfs.txt
index d1cee02ef1de..8509776dc3cc 100644
--- a/Documentation/translations/zh_TW/filesystems/sysfs.txt
+++ b/Documentation/translations/zh_TW/filesystems/sysfs.txt
@@ -8,22 +8,12 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Patrick Mochel	<mochel@osdl.org>
-		Mike Murphy <mamurph@cs.clemson.edu>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
 Documentation/filesystems/sysfs.rst 的中文翻譯
 
 如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
-英文版維護者： Patrick Mochel	<mochel@osdl.org>
-		Mike Murphy <mamurph@cs.clemson.edu>
-中文版維護者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版翻譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版校譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-繁體中文版校譯者：胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 
 以下爲正文
 ---------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/filesystems/virtiofs.rst b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
index 704a0ee44fd2..f3a682094266 100644
--- a/Documentation/translations/zh_TW/filesystems/virtiofs.rst
+++ b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
@@ -4,14 +4,6 @@
 
 :Original: :ref:`Documentation/filesystems/virtiofs.rst <virtiofs_index>`
 
-譯者
-::
-
-	中文版維護者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	中文版翻譯者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	中文版校譯者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	繁體中文版校譯者：胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ===========================================
 virtiofs: virtio-fs 主機<->客機共享文件系統
 ===========================================
-- 
2.43.0

