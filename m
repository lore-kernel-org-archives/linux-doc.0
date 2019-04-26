Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DD90B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Apr 2019 19:05:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfDZTFC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Apr 2019 15:05:02 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33485 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfDZTFA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Apr 2019 15:05:00 -0400
Received: by mail-pl1-f193.google.com with SMTP id y3so1153985plp.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Apr 2019 12:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z9AyiFqY1ENFqV9YmNMD37qROLwE6fbwD+4JkmtFGY4=;
        b=deVVfzHQ41dDSpLyAFByS7i7feCsT9AN5gFZpSyEv2k6Gt025jvy8sbD3Po7T+y7rK
         wlyzPVU8RaAJNOUIZIXsxVeTsdfT3iZkyBFS3LDDzqdEiuYskAUL976W+oTM4n2lyB9u
         W7dnBKtq6b+Dn9vbrgnQ3Ox8PvAu1m0d2aJJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z9AyiFqY1ENFqV9YmNMD37qROLwE6fbwD+4JkmtFGY4=;
        b=CBiexU21EdFBy7WiCpLpj/IH852lnKTD6+o+gVPJwSFGMMxo/M+ZYgjSUDpSmUk/IT
         mvqeYM84TFv+iLdmyAB3ksKPKe+0hXznREUIV0X8VJfBSR2FRth8GfZSpNpN1f0dvatI
         dQOkxR7TJrQTxE2FVXRluS7Do8RGioigmpQthyz5Px9ks4+XCZ8wGqhXXvAPiEWeesd6
         ng4BVfJfJ2oVxu+1WqFc2Y8K2vIpsaEX1qcoVo488eLMvOfFshG/ONTE15iG9m9wMNbe
         DEnpjpmcHd4YOCS8EX3DzNpBqvYP5eqUER69PgD495DjxvP/kbqcpDR24WCpMZQeStkC
         HKCA==
X-Gm-Message-State: APjAAAVXaIMihdhoXuP4kWUXMbjsPsr1gd7T/tOtDJvo0PlEp35yqMFi
        7pkvoBeJeHQQz+XZM0y306logA==
X-Google-Smtp-Source: APXvYqybObXn2RDEoCZH3ICMc6DaHbqAHmavixCVsnORgBMonxDOiirZLpqm/ij7kF7oXPdICnIsuA==
X-Received: by 2002:a17:902:7c90:: with SMTP id y16mr4355637pll.309.1556305499652;
        Fri, 26 Apr 2019 12:04:59 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id j22sm7756797pfi.139.2019.04.26.12.04.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 12:04:58 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, dancol@google.com,
        Dan Williams <dan.j.williams@intel.com>,
        dietmar.eggemann@arm.com, gregkh@linuxfoundation.org,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>, mhiramat@kernel.org,
        qais.yousef@arm.com, rdunlap@infradead.org, rostedt@goodmis.org,
        Shuah Khan <shuah@kernel.org>, yhs@fb.com
Subject: [PATCH v7 resend 2/2] init/config: Do not select BUILD_BIN2C for IKCONFIG
Date:   Fri, 26 Apr 2019 15:04:30 -0400
Message-Id: <20190426190430.172543-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190426190430.172543-1-joel@joelfernandes.org>
References: <20190426190430.172543-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit 13610aa908dc ("kernel/configs: use .incbin directive to
embed config_data.gz"), IKCONFIG no longer uses BUILD_BIN2C so prevent
it from being selected in Kconfig.

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 47c0db6e63a5..26a364a95b57 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -562,7 +562,6 @@ config BUILD_BIN2C
 
 config IKCONFIG
 	tristate "Kernel .config support"
-	select BUILD_BIN2C
 	---help---
 	  This option enables the complete Linux kernel ".config" file
 	  contents to be saved in the kernel. It provides documentation
-- 
2.21.0.593.g511ec345e18-goog

