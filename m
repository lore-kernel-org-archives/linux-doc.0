Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848579;
	b=H4GhTPsdnbMkeLLs9YurMP3Mm5qP3oD9fWyo7NwK7FREaDC/vqj21s+cNGc702Mj1Wxr
	 abG1pvSWhmJjjiCK589M3wPkKDdsekgSDikGNaYqlC1i99GGYRXCMcmItGaxpz/91/uxq
	 BfssKajPJjO8w6VSZpHGFMJ/Gp7s5omIh1GUMUJxMx1iG731/yYtgBJseA/yGBtwY6yh2
	 Dw4kq89nVCenJGNBoDwKYRR1xv2bkSVc6E/MZVUXSA7i1q10OmtIYrnGstxE3HlADZdHA
	 2frC22T/oWG5q9y6peJBANkw7Ybtg0r3WOSYXU7Eg1gCRvD70dqT1MDbjCQnO5GCwTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848579;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=tVuc2ZMwhlztWYK24pZ5LBSFShB7jDEpTep/QX7QmME=;
	b=OlsbZcZ0x90cXe1ceOp36AKvBNPtUVT6NK4RWV/Cm5LAI38xNPXKVMpFJM/3NNXWuFpa
	 96RWrMoJq8pnrfWNTiux+8Z7kXrYM6jLRHcDew8PXSSPF959Ud2C4SJuPBHPsdavuBabr
	 KZQIhz4Apf4WWXCbbBpF6o0hUuvJ0splW8abJ/JuyBsMEuLeA+W1lFaFwxbmyuFLq4PgK
	 74kIZJecO8qpNLICanQbUvjGOrsmLGioDV8gUXjiITl9xBRESAf7EZfjDJPxqffxcd1/m
	 EEz7GliiTRqUoAKehTk7MG21/NojDFPfHY/eF3Kd6XxQ+71YauSWCz4i7zdwEdg+/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D372B606A323;
	Sat, 28 Nov 2026 06:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D372B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMA2HxJ7eQprruYJAA--.30107S2;
	Sat, 28 Nov 2026 14:49:31 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnsjxseQprphd_AA--.15110S11;
	Sat, 28 Nov 2026 14:49:30 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 9/9] docs/zh_CN: remove stale Original fields from SCSI and IPE translations
Date: Sat, 28 Nov 2026 14:49:16 +0800
Message-ID: <20261128064916.3481435-10-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261128064916.3481435-1-dzm91@hust.edu.cn>
References: <20261128064916.3481435-1-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMA2HxJ7eQprruYJAA--.30107S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW7JFWrCFWrXw48Gw1fXrb_yoW8Xr17pF
	yvgr1Iq3W8Jw15Cr18Gry7GF1xKFWxGayUGF9Fq3ZYqFs5tw4vyrsxtryDKas3Xry0yFW5
	XFsa9rWF9r1jyw7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	WxJVW8Jr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r
	4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UGApnUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Remove the stale Original fields from the WD719x and IPE
translations. Both English sources use the same relative paths
under Documentation.

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/translations/zh_CN/scsi/wd719x.rst  | 2 --
 Documentation/translations/zh_CN/security/ipe.rst | 2 --
 2 files changed, 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/scsi/wd719x.rst b/Documentation/translations/zh_CN/scsi/wd719x.rst
index 79757c42032b..f56eef04fd00 100644
--- a/Documentation/translations/zh_CN/scsi/wd719x.rst
+++ b/Documentation/translations/zh_CN/scsi/wd719x.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/scsi/libsas.rst
-
 :翻译:
 
  张钰杰 Yujie Zhang <yjzhang@leap-io-kernel.com>
diff --git a/Documentation/translations/zh_CN/security/ipe.rst b/Documentation/translations/zh_CN/security/ipe.rst
index 55968f0c7ae3..51065bbc53a1 100644
--- a/Documentation/translations/zh_CN/security/ipe.rst
+++ b/Documentation/translations/zh_CN/security/ipe.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/security/sak.rst
-
 :翻译:
  赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
 
-- 
2.51.0

