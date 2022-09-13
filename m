Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D34C54EE9
	for <linux-doc@archiver.kernel.org>; Tue, 13 Sep 2022 05:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiIMFM3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Sep 2022 01:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiIMFM2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Sep 2022 01:12:28 -0400
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282333F308;
        Mon, 12 Sep 2022 22:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1663045942;
        bh=un3wW3Q9eJYQrOv+2NY7IIUwgvKVP+G0a31QQZrKJkU=;
        h=From:To:Cc:Subject:Date;
        b=FBiv6sCpNLmHpHXq8xbV6pH90LWp/M/a8boyBw5Y9OoOAGceAYwOZ28sKEbkJNR4U
         DUw6hFLDRTrQYLui3N2WSDWAGaLDHhvpOyndnGmvD+/Jckae/jocRCbVZUHpOL0pAP
         zmtdg8Dj+RueqdppgOuPOOFWqi9yAbeYj8oCtG8g=
Received: from localhost.localdomain ([39.156.73.13])
        by newxmesmtplogicsvrsza31.qq.com (NewEsmtp) with SMTP
        id 2CC2C414; Tue, 13 Sep 2022 13:11:12 +0800
X-QQ-mid: xmsmtpt1663045872t8pn9uxoj
Message-ID: <tencent_6A928C02229619E8099167DD5CCAA8D8BF0A@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8jAfGuQjgM9SdmnY8NmYi/2THULIh0pWbMJaLKqKXq7iOyeHbXL
         5WCpD3+z9Z3kyKAEAqXwEjQtTb0tKKJrc884luO0ZGq81WiRxkSW+TVzl86P/NCWhGxi5vQbYYPT
         EyD9yWQOT2ZRGYlkAtCXhbly+5kWtZucToSv25OE4dWVDH9FKMXmF+6wj+/SUSfsCyPsUo+he0F+
         0IRM/88Q12N15eFzPNpL5qFoof/pAT2k+gzECMrHd+MC4ZVMM076TQP7fGHBtzHNZz2trszmi7dU
         lAW2C9p24vaAbijSBG768Ip5oL5mDHk2KbqqXP7riXX8mYmXBWbR9lLeknv/M3DbeOYkEkq1inGN
         DEAenckYI7A2u9oML3XTNwl3WiWE9dEeT+CFfnn9hG2R4I5gsQhfTi2FZZIXA6xsNI9Jf/W6oLki
         iSYUDb5F+1rAVAu8B4I4PRhJJyAE8/AHBVgf3rZ4NO1xjftlbOq3GrXjoW1EppVgVRt8Xw01f0XR
         WtPTcSItJQ2pFxmLQ/GYYsggu0d4SPiEZW5f2gsWdteAzcBZksjSrR6PSQtGphprknHRHiz+S95M
         cKmWo2+hxG78ow+/gkGV8oW3of8IxI07ZtDS1oQiMcRvUyQOqVzFjPk9M4GPg98pfImTRgg6IBPn
         N9GqWcLehDP+qyzveiaCk9hdaVZRWST35TtyqVq70xFpf1xA1yWMPlsmgxOBg3nCgqZRYEA+lbXj
         vhjwKIG2mNEhTX2xi8wW/rCNb3L7kSI4pa1ADFAyEEX47gL8Q9x8l0jp1Ki9JatLXx1nwYZ37h8C
         dgbpP4Bpv7na5c1ie9gNrd7FnYeAmId8Kd0rrQs5A/zakSUq+mapXbLjrQxtrPCN9LlGKQRTJHzw
         klo4auqhTggn1gwN+Qp5BGQZeiZW3XUrvVhy15qhP0K5WauWcFb1NBfy4uHd9gE9fazKuI0MDpfQ
         UOqb/GqFZKLzlmdS0zHAaRQ2txwYeG2DUkizZMq1FERQ9oGvSbIA==
From:   Rong Tao <rtoax@foxmail.com>
To:     corbet@lwn.net
Cc:     Rong Tao <rtoax@foxmail.com>, kernel test robot <lkp@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Erik Ekman <erik@kryo.se>, Jiri Kosina <jkosina@suse.cz>,
        Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: process/submitting-patches: misspelling "mesages"
Date:   Tue, 13 Sep 2022 13:11:09 +0800
X-OQ-MSGID: <20220913051110.10737-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix spelling mistakes, "mesages" should be spelled "messages".

Signed-off-by: Rong Tao <rtoax@foxmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 Documentation/process/submitting-patches.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index be49d8f2601b..7dc94555417d 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -715,8 +715,8 @@ references.
 
 .. _backtraces:
 
-Backtraces in commit mesages
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Backtraces in commit messages
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Backtraces help document the call chain leading to a problem. However,
 not all backtraces are helpful. For example, early boot call chains are
-- 
2.31.1

