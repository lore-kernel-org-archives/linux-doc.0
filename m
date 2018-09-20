Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B15D7E42A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 17:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388268AbeITXI2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 19:08:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51527 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbeITXI1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 19:08:27 -0400
Received: by mail-wm1-f67.google.com with SMTP id y2-v6so339077wma.1;
        Thu, 20 Sep 2018 10:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kZws1JBtb+e6LCZ++aOvnGEdZInUrW1YdgzCF3tRjOM=;
        b=aH5KRNN7bpqo7GgJbTa3bdbnKiznxj1QRridFK7a98Lgbq1cEM30HxNoU/mEcLnaSl
         RS81kPPtda1lie/st9XLgsqykKcp/x+BZRbTbrQYj0wdKv2z6bXODxaO9MhbSE4LKeqW
         nnZ8xdz8qJiUou7cOjpa+If7Q0/fABVtM+x2y9zMuCixkoOGUNPtohHD0NFVvS4P011E
         mOe2QWUVV7LWwWmz4e4ZjQWf7rQjkN5DPJrsDIctCQAezzWJmGT3p9liicRj1SSgicx9
         I8rtzf0wP6SlVSE20I0mCyL2jQmhgbYisK3uAU9PeLwM4nvIZhyNpWPYO6IMcPqFpA1/
         sLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kZws1JBtb+e6LCZ++aOvnGEdZInUrW1YdgzCF3tRjOM=;
        b=JaaWpfL+U9z3y/Svud5M0JB+M1jVvEYEEA4Q89QY0CFdwrX5i/7+/ykDCKzg4RV2eE
         9+JOMySQ02lBtinKp5BiX3DNhgDWbw2Ss500H9F/r7YZOzjbzr8oWHA0ijaxT9BWafok
         K/MKMBD8z7znmCF2wy8u0y6TUtbqFx3hY98GpzI+WMpQBRdWqwPcS5OEHyswWPxx2fYa
         3wKRx+PiloniKLcs7E95oVT3UhZHa/GAVe5NWTzp/HPKqQBSmDFUWVCJ/PvFY1wEydUI
         Ecdc5QgiosiDbID6cVQH8sH6w1Aq9AN1t+iAX6dCfkDSJua1WWRBOz8uHTHMh3PLKfu6
         bkgg==
X-Gm-Message-State: APzg51DExAJFgV9qIAwsf3MnrzZ5kZKuK/WLo7xGM4a7JHwSb/gigBj1
        w49KkMxPmEzaI7OzgpfO4m4=
X-Google-Smtp-Source: ANB0VdYlXps34Qa98w0QUMlN77Nz3bVdxyFDq9JwIORinKAnhr32EcEesF7yjizFBGS8sJb4RQN5ww==
X-Received: by 2002:a1c:4007:: with SMTP id n7-v6mr3917202wma.108.1537464235105;
        Thu, 20 Sep 2018 10:23:55 -0700 (PDT)
Received: from localhost.localdomain (62.83.35.8.dyn.user.ono.com. [62.83.35.8])
        by smtp.gmail.com with ESMTPSA id q200-v6sm3466562wmd.2.2018.09.20.10.23.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 10:23:54 -0700 (PDT)
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "David S . Miller" <davem@davemloft.net>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Sandipan Das <sandipan@linux.vnet.ibm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Paul Burton <paul.burton@mips.com>,
        David Rientjes <rientjes@google.com>, Willy Tarreau <w@1wt.eu>,
        Martin Sebor <msebor@gmail.com>,
        Christopher Li <sparse@chrisli.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Theodore Ts'o <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefan Agner <stefan@agner.ch>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v5 14/15] Compiler Attributes: auxdisplay: panel: use __nonstring
Date:   Thu, 20 Sep 2018 19:23:00 +0200
Message-Id: <20180920172301.21868-15-miguel.ojeda.sandonis@gmail.com>
In-Reply-To: <20180920172301.21868-1-miguel.ojeda.sandonis@gmail.com>
References: <20180920172301.21868-1-miguel.ojeda.sandonis@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Let gcc know these arrays are not meant to be NUL-terminated
by annotating them with the new __nonstring variable attribute;
and remove the comment since it conveys the same information.

Signed-off-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
---
 drivers/auxdisplay/panel.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/panel.c b/drivers/auxdisplay/panel.c
index 3b25a643058c..21b9b2f2470a 100644
--- a/drivers/auxdisplay/panel.c
+++ b/drivers/auxdisplay/panel.c
@@ -155,10 +155,9 @@ struct logical_input {
 			int release_data;
 		} std;
 		struct {	/* valid when type == INPUT_TYPE_KBD */
-			/* strings can be non null-terminated */
-			char press_str[sizeof(void *) + sizeof(int)];
-			char repeat_str[sizeof(void *) + sizeof(int)];
-			char release_str[sizeof(void *) + sizeof(int)];
+			char press_str[sizeof(void *) + sizeof(int)] __nonstring;
+			char repeat_str[sizeof(void *) + sizeof(int)] __nonstring;
+			char release_str[sizeof(void *) + sizeof(int)] __nonstring;
 		} kbd;
 	} u;
 };
-- 
2.17.1

