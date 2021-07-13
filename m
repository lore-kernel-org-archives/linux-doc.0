Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E96C11F6B
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jul 2021 12:34:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 428FE61006
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jul 2021 12:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236135AbhGMMhf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jul 2021 08:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236436AbhGMMhe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jul 2021 08:37:34 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F78C0613DD;
        Tue, 13 Jul 2021 05:34:44 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id k3so7363997qtq.7;
        Tue, 13 Jul 2021 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6R7C33T9zqkhEREJ7j8K/B4n6HyuZSTXftep1lupJmI=;
        b=FFFOHDRQdyPbqCsYaAP25UbMSyqLEO4+ec1mo3BW+aaYt+YaZPkh4eoZ94WJGV5TWL
         Bvr+Z+KKYxfrJ04G+TkUIKQ/xkiSp74bYkAfpMbn7//GYC2/YTLgFEx4DXM5Uo+98Gga
         1F+UPjR6P2uUgoEO6GmNlcn5dGP4b6sHku79dlkZoI1/91xHBTLx+KR0RR3Vr3MDXh+C
         /3gQFsV+qh8XCphUYbRxOu67QdwCXHLLpxKdsK5vDvji2AvymInN/MCjsIY7bKbp1rvN
         l6gZAZDK0KZjCLXDn5AB7bO9DH6NknOCI0NNeKNIGRoxHEohFmIDcktSaExC3F1w70hT
         lLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6R7C33T9zqkhEREJ7j8K/B4n6HyuZSTXftep1lupJmI=;
        b=fcv3x2qjWMKTpKyTnqE+NE01l/tNWoOP7A+Sq4rpKtWmt15LL0MTUVHIdK4VEQdfdl
         qhsBGA6Lh1pzrNJwAzvrXoJxNs/LIakOuF/cMJqfrq3SVQQCC1ycNdQZGwCPzC+mLonW
         5mXgFaivHT3D9OHf+brbq13rkHJ2fH8Hoc3LHjH2xBEgaxgGbTCXth8gdApunZfBcyjI
         OVVoso7aB0VNGiqmjoT6G6MQDFyn4N4KZCDOfUzFtn/T4A23KZggrZUlh6EA8vj8YJsU
         bhxguXkMT7TkZuwe5CZkCV9R7hxw0ZX3eVR0bddXHRXuWaPFTB4v8LFfu4u63KCnmWb8
         CozQ==
X-Gm-Message-State: AOAM531SXZaunWDKoAvMidVjAtJamzp59tQT3+FG+R6Xp7MzaRCmdMqQ
        HnZq+ip6UeJHXxsRIDOGYM8=
X-Google-Smtp-Source: ABdhPJymiozTTeBdJ/2AiwpH+h0BgTGoKKXKOPiY154rveFSaVzE9EWqYQF0zGqm9E70TrZx3O3xMA==
X-Received: by 2002:ac8:5a13:: with SMTP id n19mr729391qta.49.1626179683855;
        Tue, 13 Jul 2021 05:34:43 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id k14sm6849327qtm.18.2021.07.13.05.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 05:34:43 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     akpm@linux-foundation.org
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        sj38.park@gmail.com, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v33 13/13] MAINTAINERS: Update for DAMON
Date:   Tue, 13 Jul 2021 12:33:56 +0000
Message-Id: <20210713123356.6924-14-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713123356.6924-1-sj38.park@gmail.com>
References: <20210713123356.6924-1-sj38.park@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit updates MAINTAINERS file for DAMON related files.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Markus Boehme <markubo@amazon.de>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a61f4f3b78a9..d492ae8b77de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5114,6 +5114,18 @@ F:	net/ax25/ax25_out.c
 F:	net/ax25/ax25_timer.c
 F:	net/ax25/sysctl_net_ax25.c
 
+DATA ACCESS MONITOR
+M:	SeongJae Park <sjpark@amazon.de>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	Documentation/admin-guide/mm/damon/*
+F:	Documentation/vm/damon/*
+F:	include/linux/damon.h
+F:	include/trace/events/damon.h
+F:	mm/damon/*
+F:	tools/damon/*
+F:	tools/testing/selftests/damon/*
+
 DAVICOM FAST ETHERNET (DMFE) NETWORK DRIVER
 L:	netdev@vger.kernel.org
 S:	Orphan
-- 
2.17.1

