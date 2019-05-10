Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B181C7D8A4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 May 2019 21:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbfEJVDJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 May 2019 17:03:09 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33504 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfEJVDI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 May 2019 17:03:08 -0400
Received: by mail-pg1-f194.google.com with SMTP id h17so3579784pgv.0
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2019 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g9Gow6vM42aJp56wjf9r7GBUU79udYOMt8dacDWI13Q=;
        b=UVBj/OwFLiTzum6IDgk7LUVfg4GiBlqfYvJJl4E6HY2WxlnZ0tj+8Mbyp8HNH5SRIF
         xlPqFSE4NCYZBHfO7irbMEN+Vg+YxVQx3scJ2UAuP3Tk7DRfDauHCWrKS0qfq1K4r+C8
         3DBrBuEM2rpf+Pk1qNBmlldbVkgMKr/w1GTH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g9Gow6vM42aJp56wjf9r7GBUU79udYOMt8dacDWI13Q=;
        b=IFM8b5aol/+UpzufpNRP+CkWzOBe3MGriwgByHs5l3nK0KEVU1cgO02QzndPwRCl0S
         y4oEFCbABVVnVkYlFhJSyfyyp8pBqpJfC/g7LBZ6uxm0K+Is+3e6xDj4nElKQ61CRSTC
         Z/cLKO9DggIDd3pE+YQY/GBbq6jQZ/SrY1FAL7tKHRpAPKgYgZE2wxYU1OoZHm0HnOAu
         UhaK/kyRUiptfbVAztHChfqPTs1t2ubyXWbLu0CRBY8hM2vbWxfKl+uWAA6+o308Eo1c
         L+prZlhYd3tPh1tvngy+YEJjsjW6T72ymUiPlpAQ9b3Ao8nhRx1Xtq/k++L5fR+cRN7M
         8mfQ==
X-Gm-Message-State: APjAAAXFNu3Hm3siQ+8n5j4vlqQ37c8ULyexQWoSoUQNCrG4QqkWAah/
        4A8vCekqXImcQNi7F/XWtgtuvw==
X-Google-Smtp-Source: APXvYqxx7K5CBGqKQ/c/VTttlOFyb3tvfg/8U27VnQPYkICRqEywBVXgF7yTbE4iu6TL2YhtYXVtAQ==
X-Received: by 2002:a63:2118:: with SMTP id h24mr16498738pgh.320.1557522187805;
        Fri, 10 May 2019 14:03:07 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id y8sm6523333pgk.20.2019.05.10.14.03.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 10 May 2019 14:03:06 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, atishp04@gmail.com,
        bpf@vger.kernel.org, Brendan Gregg <bgregg@netflix.com>,
        Brendan Gregg <brendan.d.gregg@gmail.com>, dancol@google.com,
        Daniel Borkmann <daniel@iogearbox.net>,
        Dan Williams <dan.j.williams@intel.com>,
        dietmar.eggemann@arm.com, duyuchao <yuchao.du@unisoc.com>,
        gregkh@linuxfoundation.org, Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manjo Raja Rao <linux@manojrajarao.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Gregorczyk?= <michalgr@fb.com>,
        Michal Gregorczyk <michalgr@live.com>,
        Mohammad Husain <russoue@gmail.com>,
        Olof Johansson <olof@lixom.net>, qais.yousef@arm.com,
        rdunlap@infradead.org, rostedt@goodmis.org,
        Shuah Khan <shuah@kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Tamir Carmeli <carmeli.tamir@gmail.com>, yhs@fb.com
Subject: [PATCH 3/3] kheaders: Make it depend on sysfs
Date:   Fri, 10 May 2019 17:02:43 -0400
Message-Id: <20190510210243.152808-4-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190510210243.152808-1-joel@joelfernandes.org>
References: <20190510210243.152808-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kheaders archive is exposed through SYSFS in /sys/kernel/. Make it
depend on SYSFS as it makes no sense to enable this feature without it.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index ce08adf0f637..f27138a8cf28 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -581,6 +581,7 @@ config IKCONFIG_PROC
 
 config IKHEADERS
 	tristate "Enable kernel headers through /sys/kernel/kheaders.tar.xz"
+	depends on SYSFS
 	help
 	  This option enables access to the in-kernel headers that are generated during
 	  the build process. These can be used to build eBPF tracing programs,
-- 
2.21.0.1020.gf2820cf01a-goog

