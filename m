Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3CE5D5
	for <linux-doc@vger.kernel.org>; Fri, 17 Nov 2023 03:47:54 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8CxruvpUldlS8s6AA--.47629S3;
	Fri, 17 Nov 2023 19:47:53 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxL93mUldl705FAA--.23797S3;
	Fri, 17 Nov 2023 19:47:52 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org
Cc: Yanteng Si <siyanteng@loongson.cn>,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	wu.xiangcheng@linux.dev,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 1/2] Docs/LoongArch: Update arch LoongArch introduction.rst
Date: Fri, 17 Nov 2023 19:47:47 +0800
Message-Id: <921854520b3a24fded927ab9e0cee18d11fa4e43.1700221148.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1700221148.git.siyanteng@loongson.cn>
References: <cover.1700221148.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxL93mUldl705FAA--.23797S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ary3Gr4rCFyrKrWDXF1rZrc_yoW8Jw4rpw
	10vr92gr45twn8W34kKa45WF40vFZ3GF4xCFsFkw18GFnrZ3Wvyayrtrn8XF1UA348AFWI
	q3s5Gw4FyF15AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

LoongArch-Vol1 has been updated to v1.10, the links in the
documentation are out of date, let's update it.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/arch/loongarch/introduction.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/loongarch/introduction.rst b/Documentation/arch/loongarch/introduction.rst
index 8c568cfc2107..5e6db78abeaf 100644
--- a/Documentation/arch/loongarch/introduction.rst
+++ b/Documentation/arch/loongarch/introduction.rst
@@ -375,9 +375,9 @@ Developer web site of Loongson and LoongArch (Software and Documentation):
 
 Documentation of LoongArch ISA:
 
-  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.02-CN.pdf (in Chinese)
+  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.10-CN.pdf (in Chinese)
 
-  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.02-EN.pdf (in English)
+  https://github.com/loongson/LoongArch-Documentation/releases/latest/download/LoongArch-Vol1-v1.10-EN.pdf (in English)
 
 Documentation of LoongArch ELF psABI:
 
-- 
2.31.4

