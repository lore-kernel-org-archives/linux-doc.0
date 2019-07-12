Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 73E0A7D910
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Jul 2019 17:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfGLRBg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Jul 2019 13:01:36 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42910 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727482AbfGLRAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Jul 2019 13:00:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id t132so4785843pgb.9
        for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2019 10:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T5MSBvyW+UnMIf1PMXwWQpclTkJPOBVtLcNCxIfokXY=;
        b=W4pcI9yzebCS/ajeXGrdH4WDZbUsJndTMc7qtATG156f3ffkoMMnM+27/wia2nKDJk
         8+5mV67a7LLoP3HBFS64qyErr1wWta5bAaSdftnGrTPpiVb4PMfGdj4gRSASKJrtE/bk
         y6MZeHXSPOQSGLoKr4GkENL9AUyzztzIy9lqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T5MSBvyW+UnMIf1PMXwWQpclTkJPOBVtLcNCxIfokXY=;
        b=RRB73ENO0hXtRQ7cdE68U3m1wgmp6sQhfYj43xLSKtCIly9d373mr75jMFfyISe31j
         HMEiid37GrXKiYC0T08Kkw8dS2KeQU0jQ1zsiHrHDzVn5INiKE9KwhnAipWv56dyf8Dd
         tgAOPmnhy5XhoSjeYY0Iy1y+nngHJiM6bH3j1mtMO0ftBjnqM364MDZ7exiNUbj9IjBZ
         AmKmakGzXij0AUdGziqG9u39kHoSze77c1O6FvEOrynwOoapvx34vqjp+yX2FTU/1QXr
         hNxHFi8b/XOWvTvNz2MoSEMFrJGBm1rUzLUHKoJSk01T1/Q55fKaFTTdM2UA2k+LAJ9u
         oXqw==
X-Gm-Message-State: APjAAAUw7gqKIKSzBjaIshC7rebihZ1FiyQGdIQLRQ5SpC3rODJgC0pz
        imR1iYM3TMenXP6LkPDlUJo=
X-Google-Smtp-Source: APXvYqzuhVtiWBYlZH/aw0dkC1YS/lLyobD9k2bBGXEKSZ5NHGo/6vz/hQ+QEQLkxRGkEG+1756i7A==
X-Received: by 2002:a65:4489:: with SMTP id l9mr12246140pgq.207.1562950850333;
        Fri, 12 Jul 2019 10:00:50 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id a15sm7127385pgw.3.2019.07.12.10.00.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 10:00:49 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Borislav Petkov <bp@alien8.de>, c0d1n61at3@gmail.com,
        "David S. Miller" <davem@davemloft.net>, edumazet@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, keescook@chromium.org,
        kernel-hardening@lists.openwall.com, kernel-team@android.com,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        neilb@suse.com, netdev@vger.kernel.org,
        Oleg Nesterov <oleg@redhat.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Pavel Machek <pavel@ucw.cz>, peterz@infradead.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        Tejun Heo <tj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, will@kernel.org,
        x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH v2 4/9] ipv4: add lockdep condition to fix for_each_entry
Date:   Fri, 12 Jul 2019 13:00:19 -0400
Message-Id: <20190712170024.111093-5-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190712170024.111093-1-joel@joelfernandes.org>
References: <20190712170024.111093-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 net/ipv4/fib_frontend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index b298255f6fdb..ef7c9f8e8682 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -127,7 +127,8 @@ struct fib_table *fib_get_table(struct net *net, u32 id)
 	h = id & (FIB_TABLE_HASHSZ - 1);
 
 	head = &net->ipv4.fib_table_hash[h];
-	hlist_for_each_entry_rcu(tb, head, tb_hlist) {
+	hlist_for_each_entry_rcu(tb, head, tb_hlist,
+				 lockdep_rtnl_is_held()) {
 		if (tb->tb_id == id)
 			return tb;
 	}
-- 
2.22.0.510.g264f2c817a-goog

