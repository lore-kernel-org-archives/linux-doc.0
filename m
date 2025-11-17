Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C1257844;
	Mon, 17 Nov 2025 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763367743; cv=none; b=asx3HHwHe8epZSoBAo0jh3WFB0ndHcRuQQMAX/EIkatD+T4ClToC8xHwohAGaFV+CGt1P5DWDki48/NyCBOmouvjvW4C70mAPpOu+0Wxou4NRYHu5J8E2VmF4825w97olGqETKAb0D1I/GKWnqUeKtcjkD5kQ3WrsKMXHgNdTus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763367743; c=relaxed/simple;
	bh=Sad4kAP/p5UhKOTUnE/wx/ku/A/qft4X4r8lofpJM7M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ecI5hXrsvRtIpPogBpA+bV9SM6n5NYR0oiH9NHggv/LPKWDubXwoEO1UASZ0w1Smn2dOYQ9VDEZewahlXtJuZ7NLK0umJSg2nRke/E9+6yzyWMEGwtX7bS0UIt6yUru27nGoYZJc7ZUio0CCWERAlINXcpVJl182ULU8JwN1TrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 835581acc38e11f0a38c85956e01ac42-20251117
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_TXT, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:75974d08-695e-4b2f-8c1f-9eac984d1247,IP:10,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-INFO: VERSION:1.3.6,REQID:75974d08-695e-4b2f-8c1f-9eac984d1247,IP:10,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:d8d42873f79b1bdb58958e60eddd0d61,BulkI
	D:251117162211IHY37L9E,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|850,
	TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 835581acc38e11f0a38c85956e01ac42-20251117
X-User: zhaochenguang@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <zhaochenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1613736889; Mon, 17 Nov 2025 16:22:10 +0800
From: Chenguang Zhao <zhaochenguang@kylinos.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Chenguang Zhao <zhaochenguang@kylinos.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v4] docs/zh_CN: Update the Chinese translation of kbuild.rst
Date: Mon, 17 Nov 2025 16:22:04 +0800
Message-Id: <20251117082204.400487-1-zhaochenguang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Finish the translation of kbuild/kbuild.rst.

Update to commit 5cbfb4da7e06 ("kbuild: doc: improve
KBUILD_BUILD_TIMESTAMP documentation")

Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
---
v4:
 - Add space before and after English word as suggested by Dongliang
 - The changes in the v2 patch were not my contribution, they 
   were made by others and have already been merged into the
   English documentation.
---
 .../translations/zh_CN/kbuild/kbuild.rst      | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Documentation/translations/zh_CN/kbuild/kbuild.rst
index e5e2aebe1ebc..3b327ba12662 100644
--- a/Documentation/translations/zh_CN/kbuild/kbuild.rst
+++ b/Documentation/translations/zh_CN/kbuild/kbuild.rst
@@ -93,6 +93,16 @@ HOSTRUSTFLAGS
 -------------
 在构建主机程序时传递给 $(HOSTRUSTC) 的额外标志。
 
+PROCMACROLDFLAGS
+----------------
+用于链接 Rust 过程宏的标志。由于过程宏是由 rustc 在构建时加载的，
+因此必须以与当前使用的 rustc 工具链兼容的方式进行链接。
+
+例如，当 rustc 使用的 C 库与用户希望用于主机程序的 C 库不同时，
+此设置会非常有用。
+
+如果未设置，则默认使用链接主机程序时传递的标志。
+
 HOSTLDFLAGS
 -----------
 链接主机程序时传递的额外选项。
@@ -135,12 +145,18 @@ KBUILD_OUTPUT
 指定内核构建的输出目录。
 
 在单独的构建目录中为预构建内核构建外部模块时，这个变量也可以指向内核输出目录。请注意，
-这并不指定外部模块本身的输出目录。
+这并不指定外部模块本身的输出目录(使用 KBUILD_EXTMOD_OUTPUT 来达到这个目的)。
 
 输出目录也可以使用 "O=..." 指定。
 
 设置 "O=..." 优先于 KBUILD_OUTPUT。
 
+KBUILD_EXTMOD_OUTPUT
+--------------------
+指定外部模块的输出目录
+
+设置 "MO=..." 优先于 KBUILD_EXTMOD_OUTPUT.
+
 KBUILD_EXTRA_WARN
 -----------------
 指定额外的构建检查。也可以通过在命令行传递 "W=..." 来设置相同的值。
@@ -290,8 +306,13 @@ IGNORE_DIRS
 KBUILD_BUILD_TIMESTAMP
 ----------------------
 将该环境变量设置为日期字符串，可以覆盖在 UTS_VERSION 定义中使用的时间戳
-（运行内核时的 uname -v）。该值必须是一个可以传递给 date -d 的字符串。默认值是
-内核构建某个时刻的 date 命令输出。
+(运行内核时的 uname -v) 。该值必须是一个可以传递给 date -d 的字符串。例如::
+
+	$ KBUILD_BUILD_TIMESTAMP="Mon Oct 13 00:00:00 UTC 2025" make
+
+默认值是内核构建某个时刻的date命令输出。如果提供该时戳，它还用于任何initramfs
+归档文件中的mtime字段。Initramfs mtimes是32位的，因此早于Unix纪元1970年，或
+晚于协调世界时 (UTC) 2106年2月7日6时28分15秒的日期是无效的。
 
 KBUILD_BUILD_USER, KBUILD_BUILD_HOST
 ------------------------------------
-- 
2.25.1

