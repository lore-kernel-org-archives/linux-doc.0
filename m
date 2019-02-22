Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3BFE7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 12:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfBVMyO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 07:54:14 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39384 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfBVMxr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Feb 2019 07:53:47 -0500
Received: by mail-wr1-f66.google.com with SMTP id l5so2256862wrw.6
        for <linux-doc@vger.kernel.org>; Fri, 22 Feb 2019 04:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9mSxyMmz1xjHsHJUyT/WYIPnpYi9SCNSb/qUJqV67bQ=;
        b=dFFShaLkfC9Jd78NrGHT6+qV8Fa9yuKItk3VxryuG9FBzLyVutr/noYyEqX9rPsCPB
         4FR/7879ajA8ORjVk4I07QF8PQLg274w2Q+K0O39R3Ga3Hhea7F4g92KaP8LM4y5+Hso
         eJt1r7agSQJ/Q7Cx/ewAN6NsplIo0lNiUtrymbVmaJov1lsCukOg7OdDCcVG/G6dymSR
         5NrIRbGPjHAFt0tx/2kWNS9S69vHxnpOLSsET8RPCLmIYV5M4RxLn41hJi0rYK9TmjkN
         4J4iqkL9iIltHwkRu+ZKdYA7Xy0gQC5aG2HVCItmVD26gYOu7PxGByh9QtCwnvGsjRA4
         qTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9mSxyMmz1xjHsHJUyT/WYIPnpYi9SCNSb/qUJqV67bQ=;
        b=N9Q7f34qPV+TXybtgB/O4iLvbQKHMPW9p9e5m0uvtMMyFFo2kChRi8pTzeJ7+pyowg
         HPhctt7Ljk5hT9XJotfuXD+e4Mx3eif3lG5s8llfgHIcSlqFI76e3FFMsj1UlYz/uRow
         eoyarKCpRRSa7OVJ/rtCJgKaC1HYAQtsii7GCi+wICnvv97F/An1to1WGLV6uhVjh6Ol
         N1fqksDNNi/7lhFeBqOtD94aOJk57ZrUddk9hsN7r51CAmbtp7rkbPEQvQpbOzbyWaQq
         EVAUEg11kJ+C/jrGwqQI9fHoXVxreBThbPno96yt18it8evZfbIbXUix45BSi0UMy5Tb
         Oh5A==
X-Gm-Message-State: AHQUAuZ6TBefwLG5CMWFY8INxZwh2QtB5elyyGqLqMUUt/ikcuL2T58b
        ELjGOY+TKVE3Ub2KbRa/kMMasQ==
X-Google-Smtp-Source: AHgI3IYB1rxXC3qLSPjqnlg3vyINEmisEJ9COGx3+BlbVTSYQsvRd/r4g+wzkk/8Tl6H/RsXQOXN5Q==
X-Received: by 2002:a5d:500c:: with SMTP id e12mr3055201wrt.27.1550840025673;
        Fri, 22 Feb 2019 04:53:45 -0800 (PST)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:13:8ce:d7fa:9f4c:492])
        by smtp.gmail.com with ESMTPSA id o14sm808209wrp.34.2019.02.22.04.53.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Feb 2019 04:53:44 -0800 (PST)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v10 08/12] net, arm64: untag user pointers in tcp_zerocopy_receive
Date:   Fri, 22 Feb 2019 13:53:20 +0100
Message-Id: <ebc80132c8ebf6016821ddffbb7e461bd2484824.1550839937.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.rc0.258.g878e2cd30e-goog
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 net/ipv4/tcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index cf3c5095c10e..80f3c1fb9809 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1756,6 +1756,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
 	int inq;
 	int ret;
 
+	address = untagged_addr(address);
+
 	if (address & (PAGE_SIZE - 1) || address != zc->address)
 		return -EINVAL;
 
-- 
2.21.0.rc0.258.g878e2cd30e-goog

