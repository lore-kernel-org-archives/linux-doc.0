Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 124E58F
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 02:02:38 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8AxlPC9LltlMi87AA--.51448S3;
	Mon, 20 Nov 2023 18:02:37 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxP92yLltlJG5HAA--.27432S4;
	Mon, 20 Nov 2023 18:02:33 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: corbet@lwn.net,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	alexs@kernel.org,
	bobwxc@email.cn,
	wu.xiangcheng@linux.dev,
	yizhou.tang@shopee.com,
	linux-doc@vger.kernel.org,
	chenhuacai@kernel.org
Subject: [PATCH v1 2/3] docs/zh_CN: Adjust the number of characters per line in magic-number.rst to less than 40
Date: Mon, 20 Nov 2023 18:02:24 +0800
Message-Id: <b3c1b55a442280c583518c45495e5540d6797548.1700474235.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1700474235.git.siyanteng@loongson.cn>
References: <cover.1700474235.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxP92yLltlJG5HAA--.27432S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW3GrW5Kw4fCFy5AryUWw13WrX_yoW7uF47pr
	s2gas3J3W2kryj9rykGrWxuF4kAFWxGa17Ka1kAwn7trs5Jw4UJrsxGFn8ZwnIga4kZayj
	v3yjgrWFvFn293XCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU82jg7UUUUU==

The current lines are too long and unfriendly to developers who use
vim to read documents, especially on small monitors, so let's adjust
to less than 40 characters.

In addition, some translations were modified incidentally.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/process/magic-number.rst            | 69 +++++++++++--------
 1 file changed, 39 insertions(+), 30 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/process/magic-number.rst
index 4a92ebb619ee..4e4aeaca796c 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/process/magic-number.rst
@@ -1,58 +1,67 @@
-.. _cn_magicnumbers:
-
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/process/magic-number.rst <magicnumbers>`
+:Original: Documentation/process/magic-number.rst
+
+:翻译:
 
-如果想评论或更新本文的内容，请直接发信到LKML。如果你使用英文交流有困难的话，也可
-以向中文版维护者求助。如果本翻译更新不及时或者翻译存在问题，请联系中文版维护者::
+ 贾威威 Jia Wei Wei <harryxiyou@gmail.com>
 
-        中文版维护者： 贾威威 Jia Wei Wei <harryxiyou@gmail.com>
-        中文版翻译者： 贾威威 Jia Wei Wei <harryxiyou@gmail.com>
-        中文版校译者： 贾威威 Jia Wei Wei <harryxiyou@gmail.com>
+:校译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
 Linux 魔术数
 ============
 
-这个文件是有关当前使用的魔术值注册表。当你给一个结构添加了一个魔术值，你也应该把这个魔术值添加到这个文件，因为我们最好把用于各种结构的魔术值统一起来。
+这个文件是有关当前使用的魔术值注册表。当你给一个结构体添加了一个魔术值，你也
+应该把这个魔术值添加到这个文件，因为我们最好把用于各种结构体的魔术值统一起来。
 
-使用魔术值来保护内核数据结构是一个非常好的主意。这就允许你在运行期检查(a)一个结构是否已经被攻击，或者(b)你已经给一个例行程序通过了一个错误的结构。后一种情况特别地有用---特别是当你通过一个空指针指向结构体的时候。tty源码，例如，经常通过特定驱动使用这种方法并且反复地排列特定方面的结构。
+使用魔术值来保护内核数据结构是一个 **非常好的主意** 。这就允许你在运行时检
+查一个结构体(a)是否已经被攻击，或者(b)你已经给一个例程传递了一个错误的结构
+体。最后一种情况特别地有用---特别是当你通过一个空指针指向结构体的时候。例如，
+tty源码经常通过特定驱动使用这种方法用来反复地排列特定方面的结构体。
 
-使用魔术值的方法是在结构的开始处声明的，如下::
+使用魔术值的方法是在结构体的开头声明它们，如下::
 
         struct tty_ldisc {
 	        int	magic;
         	...
         };
 
-当你以后给内核添加增强功能的时候，请遵守这条规则！这样就会节省数不清的调试时间，特别是一些古怪的情况，例如，数组超出范围并且重新写了超出部分。遵守这个规则，这些情况可以被快速地，安全地避免。
+当你以后给内核添加增强功能的时候，请遵守这条规则！这样就会节省数不清的调试
+时间，特别是一些古怪的情况，例如，数组超出范围并且覆盖写了超出部分。利用这
+个规则，这些情况可以被快速地，安全地检测到这些案例。
+
+变更日志::
 
-		Theodore Ts'o
-		  31 Mar 94
+					Theodore Ts'o
+					31 Mar 94
 
-给当前的Linux 2.1.55添加魔术表。
+  给当前的Linux 2.1.55添加魔术表。
 
-		Michael Chastain
-		<mailto:mec@shout.net>
-		22 Sep 1997
+					Michael Chastain
+					<mailto:mec@shout.net>
+					22 Sep 1997
 
-现在应该最新的Linux 2.1.112.因为在特性冻结期间，不能在2.2.x前改变任何东西。这些条目被数域所排序。
+  现在应该最新的Linux 2.1.112.因为在特性冻结期间，不能在2.2.x前改变任
+  何东西。这些条目被数域所排序。
 
-		Krzysztof G.Baranowski
-	        <mailto: kgb@knm.org.pl>
-		29 Jul 1998
+					Krzysztof G.Baranowski
+					<mailto: kgb@knm.org.pl>
+					29 Jul 1998
 
-更新魔术表到Linux 2.5.45。刚好越过特性冻结，但是有可能还会有一些新的魔术值在2.6.x之前融入到内核中。
+  更新魔术表到Linux 2.5.45。刚好越过特性冻结，但是有可能还会有一些新的魔
+  术值在2.6.x之前融入到内核中。
 
-		Petr Baudis
-		<pasky@ucw.cz>
-		03 Nov 2002
+					Petr Baudis
+					<pasky@ucw.cz>
+					03 Nov 2002
 
-更新魔术表到Linux 2.5.74。
+  更新魔术表到Linux 2.5.74。
 
-		Fabian Frederick
-                <ffrederick@users.sourceforge.net>
-		09 Jul 2003
+					Fabian Frederick
+					<ffrederick@users.sourceforge.net>
+					09 Jul 2003
 
 ===================== ================ ======================== ==========================================
 魔术数名              数字             结构                     文件
-- 
2.31.4

