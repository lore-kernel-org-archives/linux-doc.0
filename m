Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2086C433E9
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 08:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79C7B64F07
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 08:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235243AbhCDICi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Mar 2021 03:02:38 -0500
Received: from [43.250.32.171] ([43.250.32.171]:8771 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S235270AbhCDIC3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Mar 2021 03:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=kUYDc/AUmPUbnAV89yq7DJXF5MVKs71fzVGkM
        Hy+Qsw=; b=iNZGyMlwNstLZ8Ykuz4W9FkO0+XekYPk8s2iqrYBBu5GtBoxOBj+2
        LYptCIyIEzUdSFCuE12jLN8hI2tkAiYpRC6exEpNUvyd5NrGyjQnw6cB98o3q4mV
        vijCh43Pr6+lT7QuavzXiPk/jPLWDh6begzHJx9t8kj0Nd2ciP9REQ=
Received: from mipc (unknown [120.238.248.239])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdDuk0BgPEwPAA--.40479S2;
        Thu, 04 Mar 2021 16:01:51 +0800 (CST)
Date:   Thu, 4 Mar 2021 16:01:50 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] docs/zh_CN: Add zh_CN/admin-guide/unicode.rst
Message-ID: <20210304080148.GA16612@mipc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdDuk0BgPEwPAA--.40479S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFW3Jw4xXw4xJr48tw1rCrg_yoWfZF1kpF
        n7WryxGw18J342kF13Gr4jqr1I9ry5ZrWUJF1rG3Wrtws8Ar40yr45tryFy3W3W3yxCayU
        Jay8tr4DCryjq3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqSb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU-KZXDUUU
        U
X-Originating-IP: [120.238.248.239]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add translation zh_CN/admin-guide/unicode.rst, and link it to
zh_CN/admin-guide/index.rst while clean its todo entry.

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/admin-guide/index.rst  |   2 +-
 .../zh_CN/admin-guide/unicode.rst             | 170 ++++++++++++++++++
 2 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/unicode.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index e7d8d43e4d4f..a716a48c8018 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -60,6 +60,7 @@ Todolist:
 
    clearing-warn-once
    cpu-load
+   unicode
 
 Todolist:
 
@@ -115,7 +116,6 @@ Todolist:
    sysrq
    thunderbolt
    ufs
-   unicode
    vga-softcursor
    video-output
    xfs
diff --git a/Documentation/translations/zh_CN/admin-guide/unicode.rst b/Documentation/translations/zh_CN/admin-guide/unicode.rst
new file mode 100644
index 000000000000..ef7f3cb2c02e
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/unicode.rst
@@ -0,0 +1,170 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/admin-guide/unicode.rst`
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+Unicode（统一码）支持
+======================
+
+	（英文版）上次更新：2005-01-17，版本号 1.4
+
+此文档由H. Peter Anvin <unicode@lanana.org>管理，是Linux注册名称与编号管理局
+（Linux Assigned Names And Numbers Authority，LANANA）项目的一部分。
+现行版本请见：
+
+	http://www.lanana.org/docs/unicode/admin-guide/unicode.rst
+
+简介
+-----
+
+Linux内核代码已被重写以使用Unicode来将字符映射到字体。下载一个Unicode到字体
+（Unicode-to-font）表，八位字符集与UTF-8模式都将改用此字体来显示。
+
+这微妙地改变了八位字符表的语义。现在的四个字符表是：
+
+=============== =============================== ================
+映射代号        映射名称                        Escape代码 (G0)
+=============== =============================== ================
+LAT1_MAP        Latin-1 (ISO 8859-1)            ESC ( B
+GRAF_MAP        DEC VT100 pseudographics        ESC ( 0
+IBMPC_MAP       IBM code page 437               ESC ( U
+USER_MAP        User defined                    ESC ( K
+=============== =============================== ================
+
+特别是 ESC ( U 不再是“直通字体”，因为字体可能与IBM字符集完全不同。
+例如，即使加载了一个Latin-1字体，也允许使用块图形（block graphics）。
+
+请注意，尽管这些代码与ISO 2022类似，但这些代码及其用途都与ISO 2022不匹配；
+Linux有两个八位代码（G0和G1），而ISO 2022有四个七位代码（G0-G3）。
+
+根据Unicode标准/ISO 10646，U+F000到U+F8FF被保留用于操作系统范围内的分配
+（Unicode标准将其称为“团体区域（Corporate Zone）”，因为这对于Linux是不准确
+的，所以我们称之为“Linux区域”）。选择U+F000作为起点，因为它允许直接映射
+区域以2的大倍数开始（以防需要1024或2048个字符的字体）。这就留下U+E000到
+U+EFFF作为最终用户区。
+
+[v1.2]：Unicodes范围从U+F000到U+F7FF已经被硬编码为直接映射到加载的字体，
+绕过了翻译表。用户定义的映射现在默认为U+F000到U+F0FF，模拟前述行为。实际上，
+此范围可能较短；例如，vgacon只能处理256字符（U+F000..U+F0FF）或512字符
+（U+F000..U+F1FF）字体。
+
+Linux 区域中定义的实际字符
+---------------------------
+
+此外，还定义了Unicode 1.1.4中不存在的以下字符；这些字符由DEC VT图形映射使用。
+[v1.2]此用法已过时，不应再使用；请参见下文。
+
+====== ======================================
+U+F800 DEC VT GRAPHICS HORIZONTAL LINE SCAN 1
+U+F801 DEC VT GRAPHICS HORIZONTAL LINE SCAN 3
+U+F803 DEC VT GRAPHICS HORIZONTAL LINE SCAN 7
+U+F804 DEC VT GRAPHICS HORIZONTAL LINE SCAN 9
+====== ======================================
+
+DEC VT220使用6x10字符矩阵，这些字符在DEC VT图形字符集中形成一个平滑的过渡。
+我省略了扫描5行，因为它也被用作块图形字符，因此被编码为U+2500 FORMS LIGHT
+HORIZONTAL。
+
+[v1.3]：这些字符已正式添加到Unicode 3.2.0中；它们在U+23BA、U+23BB、U+23BC、
+U+23BD处添加。Linux现在使用新值。
+
+[v1.2]：添加了以下字符来表示常见的键盘符号，这些符号不太可能被添加到Unicode
+中，因为它们非常讨厌地取决于特定供应商。当然，这是糟糕设计的一个好例子。
+
+====== ======================================
+U+F810 KEYBOARD SYMBOL FLYING FLAG
+U+F811 KEYBOARD SYMBOL PULLDOWN MENU
+U+F812 KEYBOARD SYMBOL OPEN APPLE
+U+F813 KEYBOARD SYMBOL SOLID APPLE
+====== ======================================
+
+克林贡（Klingon）语支持
+------------------------
+
+1996年，Linux是世界上第一个添加对人工语言克林贡支持的操作系统，克林贡是由
+Marc Okrand为《星际迷航》电视连续剧创造的。这种编码后来被征募Unicode注册表
+（ConScript Unicode Registry，CSUR）采用，并建议（但最终被拒绝）纳入Unicode
+平面一。不过，它仍然是Linux区域中的Linux/CSUR私有分配。
+
+这种编码已经得到克林贡语言研究所（Klingon Language Institute）的认可。
+有关更多信息，请联系他们：
+
+	http://www.kli.org/
+
+由于Linux CZ开头部分的字符大多是dingbats/symbols/forms类型，而且这是一种
+语言，因此根据标准Unicode惯例，我将它放置在16单元的边界上。
+
+.. note::
+
+  这个范围现在由征募Unicode注册表正式管理。规范性引用文件为：
+
+	https://www.evertype.com/standards/csur/klingon.html
+
+克林贡语有一个26个字符的字母表，一个10位数的位置数字书写系统，从左到右
+，从上到下书写。
+
+克林贡字母的几种字形已经被提出。但是由于这组符号看起来始终是一致的，只有实际
+的形状不同，因此按照标准Unicode惯例，这些差异被认为是字体变体。
+
+======	=======================================================
+U+F8D0	KLINGON LETTER A
+U+F8D1	KLINGON LETTER B
+U+F8D2	KLINGON LETTER CH
+U+F8D3	KLINGON LETTER D
+U+F8D4	KLINGON LETTER E
+U+F8D5	KLINGON LETTER GH
+U+F8D6	KLINGON LETTER H
+U+F8D7	KLINGON LETTER I
+U+F8D8	KLINGON LETTER J
+U+F8D9	KLINGON LETTER L
+U+F8DA	KLINGON LETTER M
+U+F8DB	KLINGON LETTER N
+U+F8DC	KLINGON LETTER NG
+U+F8DD	KLINGON LETTER O
+U+F8DE	KLINGON LETTER P
+U+F8DF	KLINGON LETTER Q
+	- Written <q> in standard Okrand Latin transliteration
+U+F8E0	KLINGON LETTER QH
+	- Written <Q> in standard Okrand Latin transliteration
+U+F8E1	KLINGON LETTER R
+U+F8E2	KLINGON LETTER S
+U+F8E3	KLINGON LETTER T
+U+F8E4	KLINGON LETTER TLH
+U+F8E5	KLINGON LETTER U
+U+F8E6	KLINGON LETTER V
+U+F8E7	KLINGON LETTER W
+U+F8E8	KLINGON LETTER Y
+U+F8E9	KLINGON LETTER GLOTTAL STOP
+
+U+F8F0	KLINGON DIGIT ZERO
+U+F8F1	KLINGON DIGIT ONE
+U+F8F2	KLINGON DIGIT TWO
+U+F8F3	KLINGON DIGIT THREE
+U+F8F4	KLINGON DIGIT FOUR
+U+F8F5	KLINGON DIGIT FIVE
+U+F8F6	KLINGON DIGIT SIX
+U+F8F7	KLINGON DIGIT SEVEN
+U+F8F8	KLINGON DIGIT EIGHT
+U+F8F9	KLINGON DIGIT NINE
+
+U+F8FD	KLINGON COMMA
+U+F8FE	KLINGON FULL STOP
+U+F8FF	KLINGON SYMBOL FOR EMPIRE
+======	=======================================================
+
+其他虚构和人工字母
+-------------------
+
+自从分配了克林贡Linux Unicode块之后，John Cowan <jcowan@reutershealth.com>
+和 Michael Everson <everson@evertype.com> 建立了一个虚构和人工字母的注册表。
+征募Unicode注册表请访问：
+
+	https://www.evertype.com/standards/csur/
+
+所使用的范围位于最终用户区域的低端，因此无法进行规范化分配，但建议希望对虚构
+字母进行编码的人员使用这些代码，以实现互操作性。对于克林贡语，CSUR采用了Linux
+编码。CSUR的人正在推动将Tengwar和Cirth添加到Unicode平面一；将克林贡添加到
+Unicode平面一被拒绝，因此上述编码仍然是官方的。
-- 
2.20.1

