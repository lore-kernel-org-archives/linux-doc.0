Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83435C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 03:34:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 639AC613C0
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 03:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbhDNDfG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 23:35:06 -0400
Received: from m32-153.88.com ([43.250.32.153]:37316 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233239AbhDNDfE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 23:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=fJ0WMmE+mZltptxq4JKt4yEmPP0nnjAWbggIc
        7kfrt0=; b=c8tLO6HYRh6lTZoAGSuTrZ6PRZWUjcHREhXwk16AkHdCxcQFWizCP
        1fwLKrVV7vZ68gS9HGQVsSyzzScM7WbG8oJsxyMblJplGy3H/5OGK6F2OBcWv30R
        ALg/WuqSMapDUoBiK7UPcmoKUXPdT9YUVu6sAUg0YfrT2UCfm0a1O0=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCHEyTNYnZg3rpuAA--.63185S2;
        Wed, 14 Apr 2021 11:34:38 +0800 (CST)
Date:   Wed, 14 Apr 2021 11:34:37 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org
Subject: [docs-next PATCH] docs/zh_CN: two minor fixes in zh_CN/doc-guide/
Message-ID: <20210414033435.GA27907@bobwxc.top>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCHEyTNYnZg3rpuAA--.63185S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4kZry3Xw13Cw1rXrWfGrg_yoW8tw13pr
        W0kryxG3ZxAr15C34UGryxCr4xCFWxua15KF4kJ34Sqrs5Kr4vqrWUK342kF92qrW0yFW5
        uF4avFWj9w4ayFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8GwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvjxUSYiRUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

zh_CN/doc-guide/kernel-doc.rst
  replace a ref tag to solve docs-next warning

zh_CN/doc-guide/parse-headers.rst
  fix an unperfect word

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
Rust part in doc-guide/kernel-doc.rst is from rust-next, I'll solve that 
tag there.

 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst    | 3 +--
 Documentation/translations/zh_CN/doc-guide/parse-headers.rst | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
index b0427944f8f0..82ec84470c0b 100644
--- a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
@@ -14,8 +14,7 @@ Linux内核源文件可以包含kernel-doc格式的结构化文档注释，用
           实际有着明显的不同。内核源包含成千上万个kernel-doc注释。请坚持遵循
           此处描述的风格。
 
-.. note:: kernel-doc无法包含Rust代码：请参考
-          :ref:`Documentation/rust/docs.rst <rust_docs>`。
+.. note:: kernel-doc无法包含Rust代码：请参考 Documentation/rust/docs.rst 。
 
 从注释中提取kernel-doc结构，并从中生成适当的 `Sphinx C 域`_ 函数和带有锚点的
 类型描述。这些注释将被过滤以生成特殊kernel-doc高亮和交叉引用。详见下文。
diff --git a/Documentation/translations/zh_CN/doc-guide/parse-headers.rst b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
index 3c6612a3e47e..a6f9d052979e 100644
--- a/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
+++ b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
@@ -184,4 +184,4 @@ enum foo { BAR1, BAR2, PRIVATE };
 许可证 GPLv2：GNU GPL version 2 <https://gnu.org/licenses/gpl.html>
 
 这是自由软件：你可以自由地修改和重新发布它。
-在法律允许的范围内，**没有任何保证**。
+在法律允许的范围内，**不提供任何保证**。
-- 
2.20.1

