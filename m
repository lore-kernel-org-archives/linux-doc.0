Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576EFC433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:51:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3141561222
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbhDGHvd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:51:33 -0400
Received: from [43.250.32.171] ([43.250.32.171]:27493 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S233140AbhDGHvc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 03:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=cLeUCRAa59aZJTAcf+jzJGTgDC0R1kYm/baIZ
        5BGzyE=; b=IkLiGaQdLwlDsoXfAfG9waskOYbppBD/sNSfKF/ibqtr30p930Tby
        nerLGNS9NIPHB8lvpjAclPAPcMuiZoYrvrXSXWSxvX33O7ZqHI/cTasUdnX8Q34p
        TxrCv6Zk4i6XhXhsKquPKUd5aacWdtlplTNrv4wlnQitgy1I9gjuxY=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAXi9FuZG1g915QAA--.49844S2;
        Wed, 07 Apr 2021 15:51:12 +0800 (CST)
Date:   Wed, 7 Apr 2021 15:51:10 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v3 4/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/parse-headers.rst
Message-ID: <ebccf009f3cf77b3340e39e9675f26d8d75ca3f6.1617699755.git.bobwxc@email.cn>
References: <cover.1617699755.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1617699755.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgAXi9FuZG1g915QAA--.49844S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKFW3trykXr4xGw4fuFy5CFg_yoW7ArWUpw
        s7WrZ7Wa17Kr9FkFZ7GF9xX3y3CF4xZa1fKF1Ivw1SyrnYvFWUArW7K347Gr9xW3yFya4j
        vFW3AF42kry3CFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUUHKZJUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new translation
  Documentation/translations/zh_CN/doc-guide/parse-headers.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/doc-guide/parse-headers.rst         | 182 ++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/doc-guide/parse-headers.rst

diff --git a/Documentation/translations/zh_CN/doc-guide/parse-headers.rst b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
new file mode 100644
index 000000000000..4f6fa083a3c5
--- /dev/null
+++ b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
@@ -0,0 +1,182 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+包含用户空间API头文件
+===========================
+
+有时，为了描述用户空间API并在代码和文档之间生成交叉引用，需要包含头文件和示例
+C代码。为用户空间API文件添加交叉引用还有一个好处：如果在文档中找不到相应符号，
+Sphinx将生成警告。这有助于保持用户空间API文档与内核更改同步。
+:ref:`parse_headers.pl <parse_headers_zh>` 提供了生成此类交叉引用的一种方法。
+在构建文档时，必须通过Makefile调用它。有关如何在内核树中使用它的示例，请参阅
+``Documentation/userspace-api/media/Makefile`` 。
+
+.. _parse_headers_zh:
+
+parse_headers.pl
+-----------------
+
+脚本名称
+~~~~~~~~~
+
+
+parse_headers.pl——解析一个C文件，识别函数、结构体、枚举、定义并对Sphinx文档
+创建交叉引用。
+
+
+用法概要
+~~~~~~~~~
+
+
+\ **parse_headers.pl**\  [<选项>] <C文件> <输出文件> [<例外文件>]
+
+<选项> 可以是： --debug, --help 或 --usage 。
+
+
+选项
+~~~~~
+
+
+
+\ **--debug**\
+
+ 开启脚本详细模式，在调试时很有用。
+
+
+\ **--usage**\
+
+ 打印简短的帮助信息并退出。
+
+
+
+\ **--help**\
+
+ 打印更详细的帮助信息并退出。
+
+
+说明
+~~~~~
+
+
+通过描述API的文档中的有交叉引用的解析后文本块，将C头文件或源文件（<C文件>）
+转换进ReStructureText。它接受一个可选的<例外文件>，其中描述了哪些元素将被忽略
+或指向非默认引用。
+
+输出被写入到<输出文件>。
+
+它能够识别定义、函数、结构体、typedef、枚举和枚举符号，并为它们创建交叉引用。
+它还能够区分用于指定Linux ioctl的 ``#define`` 。
+
+<例外文件> 包含两种类型的语句： \ **ignore**\  或 \ **replace**\ .
+
+ignore标记的语法为：
+
+
+ignore \ **type**\  \ **name**\
+
+The \ **ignore**\  意味着它不会为类型为 \ **type**\ 的 \ **name**\ 符号生成
+交叉引用。
+
+
+replace标记的语法为：
+
+
+replace \ **type**\  \ **name**\  \ **new_value**\
+
+The \ **replace**\  味着它将为 \ **type**\ 类型的 \ **name**\ 符号生成交叉引
+用，但是它将使用 \ **new_value**\ 来取代默认的替换规则。
+
+
+这两种语句中， \ **type**\ 可以是以下任一项：
+
+
+\ **ioctl**\
+
+ ignore 或 replace 语句应用于ioctl定义，如：
+
+ #define	VIDIOC_DBG_S_REGISTER 	 _IOW('V', 79, struct v4l2_dbg_register)
+
+
+
+\ **define**\
+
+ ignore 或 replace 语句应用于在<C文件>中找到的任何其他 ``#define`` 。
+
+
+
+\ **typedef**\
+
+ ignore 和 replace 语句应用于<C文件>中的typedef语句。
+
+
+
+\ **struct**\
+
+ ignore 和 replace 语句应用于<C文件>中的结构体名称语句。
+
+
+
+\ **enum**\
+
+ ignore 和 replace 语句应用于<C文件>中的枚举名称语句。
+
+
+
+\ **symbol**\
+
+ ignore 和 replace 语句应用于<C文件>中的枚举值名称语句。
+
+ replace语句中， \ **new_value**\  会自动使用 \ **typedef**\ , \ **enum**\
+ 和 \ **struct**\ 类型的 :c:type: 引用；以及 \ **ioctl**\ , \ **define**\  和
+ \ **symbol**\ 类型的  :ref: 。引用的类型也可以在replace语句中显式定义。
+
+
+示例
+~~~~~
+
+
+ignore define _VIDEODEV2_H
+
+
+忽略<C文件>中的 #define _VIDEODEV2_H 。
+
+ignore symbol PRIVATE
+
+
+如下结构体：
+
+enum foo { BAR1, BAR2, PRIVATE };
+
+不会为 \ **PRIVATE**\ 生成交叉引用。
+
+replace symbol BAR1 :c:type:\`foo\`
+replace symbol BAR2 :c:type:\`foo\`
+
+
+如下结构体：
+
+enum foo { BAR1, BAR2, PRIVATE };
+
+它会让BAR1和BAR2枚举符号交叉引用C域中的foo符号。
+
+
+
+缺陷
+~~~~~
+
+
+请向Mauro Carvalho Chehab <mchehab@kernel.org>报告有关缺陷。
+
+中文翻译问题请找中文翻译维护者。
+
+
+版权
+~~~~~
+
+
+版权所有 (c) 2016 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
+
+许可证 GPLv2：GNU GPL version 2 <https://gnu.org/licenses/gpl.html>
+
+这是自由软件：你可以自由地修改和重新发布它。
+在法律允许的范围内，**没有任何保证**。
-- 
2.20.1

