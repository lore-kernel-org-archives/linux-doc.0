Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354C0ECAAD8
	for <linux-doc@archiver.kernel.org>; Wed, 14 Sep 2022 00:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiINAdN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Sep 2022 20:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiINAdM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Sep 2022 20:33:12 -0400
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694AB56BBA;
        Tue, 13 Sep 2022 17:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1663115586;
        bh=mntmAyFdC2kyLkanzymJFmnOFp0qNaHrcUQTPCMpG28=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=V6bm5WGzVreuvA7AYf5vRmz7jsldQgO1UvYL6iXAq6myOLr9tyfgcTgPy/pl2BStL
         YERL3xlN90bWJPxnAG3BIipKEnSYhR8+VOPsDBH9Ye1s7c3OiGS4aILvOGsj3ICRd7
         tztAkFbQM3mh13nV+EIzB+o8uuaJgzHWI8kZunWs=
Received: from localhost.localdomain ([39.156.73.13])
        by newxmesmtplogicsvrsza9.qq.com (NewEsmtp) with SMTP
        id 84205884; Wed, 14 Sep 2022 08:33:02 +0800
X-QQ-mid: xmsmtpt1663115582t5axw7rw4
Message-ID: <tencent_924BF0B25425E2D5673409D1CF604F682505@qq.com>
X-QQ-XMAILINFO: MiE+axgVDEQLWWkhp1lRvcfi5FbXGdA445Ps8MQjTuekCzkHfUvIAKKjakqpLP
         PFWgq/KhkOTK5dutedYvfYn4CbeUNn4iShbVBDTxfsGSfyYptGxqeX8LCrl2s0e3xkp1sN6/x/a5
         oUUBgKChmK4fb3v9j3/DrlHFKlmAeiUXa3F+QWIUxT5D84w31Q63hJz357E/R+mLLLqJMPDGlgRz
         QnC9UmjzVfAD6+3rWLiZkFlY1HV7ZLtVqS52kvB0uae99JVdSNzT+ngvSJGdyP0Y5uoaXnAghGPG
         NbIHfyprsOmwSFY12sKh5Dmn0ixmiqUwZQee21zjiltmBd9Z3yjVyCs96bsszwq4Ou+Wn3fqPfG+
         zExOgH7glJqMxjgmfIuUTQP7y5nSTvT4Heezy91GWe79Wxx/O0/0S3YOUPRLQamcDp540df01qG8
         O3VWaIf/flYMwcmieBvChA63X/JLFM7Q7ijG68K8qa3jBL/cEvi+kbuuuYsh7rzD0SuSEiM7c+OB
         TzBGzP2vWEdjYRbUiZmfLl2ZMvtjssCMyc9edl87wdjtW+lGrHxy+LVP0m4nRpz9Hp4mmKz6d/jQ
         aaeWAx5WftOzzJwIvFjwt56EL4F692R/j5FLP8mHk2rSe6TOZA5wJZ1hE4j6uyqBX0lKV00zjVbE
         x7uBAzNr9v1jpnfzXXRQK/JJP/Gxd1re/05UItqZ7cIkqvJ7MSJlzagFqaFI3Wm52Eu/t+VE9kWQ
         xLkob1WZ8JU/6jx6Mo6tuz5i3YO70Eh4bxTC/DJr5R9iQryebgBzjist/RQURpoL2Zj9lhC1bcbk
         C0f2G5/uJQGW7XW0pt/LGhScU8yIWrQWPfTa55+vUsT6jPhhJtx9ASF5W+WHfRFVgEXZHB/M8vYp
         6G1fGQz3KHst9yBw9sWCmmneT8ovJILGkgSQq4dfyIeY1H9xCm47QA29P9EvsfZqt8CLMFOMP2vY
         PTnRBZ4f4+y46PzTnZfyblU290riRK
From:   Rong Tao <rtoax@foxmail.com>
To:     krzysztof.kozlowski@linaro.org
Cc:     corbet@lwn.net, erik@kryo.se, jkosina@suse.cz,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@leemhuis.info, lkp@intel.com,
        ojeda@kernel.org, rdunlap@infradead.org, rongtao@cestc.cn,
        rtoax@foxmail.com, tglx@linutronix.de,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2] Documentation: process/submitting-patches: misspelling "mesages"
Date:   Wed, 14 Sep 2022 08:33:00 +0800
X-OQ-MSGID: <20220914003300.13421-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <2e4c52b5-85e8-6951-8248-961c2cdb13e7@linaro.org>
References: <2e4c52b5-85e8-6951-8248-961c2cdb13e7@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix spelling mistakes, "mesages" should be spelled "messages".

Signed-off-by: Rong Tao <rtoax@foxmail.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
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

