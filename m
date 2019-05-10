Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D92667D919
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 May 2019 21:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfEJVCx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 May 2019 17:02:53 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37627 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbfEJVCx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 May 2019 17:02:53 -0400
Received: by mail-pl1-f195.google.com with SMTP id p15so3360989pll.4
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2019 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DSM9QnrDKXAguebkTcIHZr34hOXCazJ7jbiMS3sjFG0=;
        b=NLUaL4FHFVO2XZ1o5FiA591+OqnxOBnSqbPXObMPFh0sBANyhKWyCFLl+BFqyewWEz
         Pqez3RXkqGor24LQnV4Lwbn047iq4G+8z5FUU7/RLAcMGdCj9msWknntyfj1/Xo41a4y
         c7ECDM7JnkwFg3scDraci1UqQQ7O/7Gaha4fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DSM9QnrDKXAguebkTcIHZr34hOXCazJ7jbiMS3sjFG0=;
        b=gy82sjooGt6tK9wN8/g1PgMqhQCW8pKoa1eRWibtCdyIybqaZaOYu5iQC07Y7e7sBo
         eqVhXan1K2U9vfD5lTXfollY62qmjXHGojI2vlnH/YjrwczxT4k8U2gjFFiCIYM6urOd
         O/LrKNoZ7Gcsn2DNRVUqYCEB/CAiGKD9wzWVRdUolLCak/CzNpS4n1kHZht2Or8TVXmz
         3pNvwaFqoVbmCD965jiIauo31blCkaSc8UDkQG0AuKRDxDoL9Oz20s7HFzntcxLoEMeM
         S821HqjEaRBPSUkvBAo4XH7Z/VgewN0k0C6LigKuOhKei/lFrDLl++EnTPXmYUZ4gw7c
         nQSg==
X-Gm-Message-State: APjAAAVs9TJIiqt64syosAxnrTSF4U21UeKUSqi7n6xOxBE/z/G5GGq6
        ugtMKvQM+k/deCwCb2WH4WnvYw==
X-Google-Smtp-Source: APXvYqzFRosXWlE/0OD5jjgi4bX4YKhF9JmgF8D58Nbp+0mwQId0lGZmoxC0ixR3Q1C5A8ZPoiqHyA==
X-Received: by 2002:a17:902:b108:: with SMTP id q8mr10473611plr.110.1557522172297;
        Fri, 10 May 2019 14:02:52 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id y8sm6523333pgk.20.2019.05.10.14.02.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 10 May 2019 14:02:50 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
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
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Gregorczyk?= <michalgr@fb.com>,
        Michal Gregorczyk <michalgr@live.com>,
        Mohammad Husain <russoue@gmail.com>,
        Olof Johansson <olof@lixom.net>, qais.yousef@arm.com,
        rdunlap@infradead.org, rostedt@goodmis.org,
        Shuah Khan <shuah@kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Tamir Carmeli <carmeli.tamir@gmail.com>, yhs@fb.com
Subject: [PATCH 0/3] kheaders fixes for -rc
Date:   Fri, 10 May 2019 17:02:40 -0400
Message-Id: <20190510210243.152808-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Linus, Greg, Masahiro,
Here are some simple fixes for the kheaders feature. Please consider these
patches for an rc release. They are based on Linus's master branch. Thanks!

Joel Fernandes (Google) (3):
kheaders: Move from proc to sysfs
kheaders: Do not regenerate archive if config is not changed
kheaders: Make it depend on sysfs

init/Kconfig                                | 17 +++++----
kernel/Makefile                             |  4 +--
kernel/{gen_ikh_data.sh => gen_kheaders.sh} | 17 ++++++---
kernel/kheaders.c                           | 40 +++++++++------------
4 files changed, 38 insertions(+), 40 deletions(-)
rename kernel/{gen_ikh_data.sh => gen_kheaders.sh} (82%)

--
2.21.0.1020.gf2820cf01a-goog

