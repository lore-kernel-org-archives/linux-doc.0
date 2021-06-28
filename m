Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D835AC49EB7
	for <linux-doc@archiver.kernel.org>; Mon, 28 Jun 2021 13:35:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C604161C6B
	for <linux-doc@archiver.kernel.org>; Mon, 28 Jun 2021 13:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhF1Nh3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Jun 2021 09:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhF1NhS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Jun 2021 09:37:18 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE76C061224;
        Mon, 28 Jun 2021 06:34:36 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id c2so9281440qvs.6;
        Mon, 28 Jun 2021 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yiVjH7drAo/hpKZvWdxkrEPiw/X+9TJ0YlSENuQlC2o=;
        b=PZ8R8HiwJE5/ejSU+9j/rybwkmoJkBTRG3WUwXzzaorX5eOdJKTzxH0NP4jfVTwrij
         G4K2RkyjGFJ3FYzseDQ3FbuQu1wiceMEP4V7GKDwO/VypzJHDNbv2JEXXToxD0IorWwN
         E9jquJKQyGd1g2Up+lUKY41YT20tzJbCnFo8FZaQ/7c7VtW9rUbcA5BkhZxooYeWPI9h
         +WID2KnyTbQQqkD075eKVXT0deLY8b/fpRuxCsQ8MKrDHPuIYeO1h/UH/F2p1CJRTJ/F
         f+OPpGCLjDcP2OQMi5DVZoBusX8xeXqOKgA7QYugyvOqu5Nl6cb6b8aaLHzQjH0yWw2W
         31Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yiVjH7drAo/hpKZvWdxkrEPiw/X+9TJ0YlSENuQlC2o=;
        b=H/Drgq28D03z/tlOOCr/VKDZpqmlKhvofj3CHbrrSTryX1zYEAcXjWqGocq0QTF45y
         a+UNWEzlRMx4vmaetd6DojKgvcY3atq6Ma0jQ8HhfUNxEn1sxSIpXXeVdj+/L8b+DpIK
         EZeu08l77iQbFYuaCp1ObvDVonjvcOguDtQF+ymUjZFIDYMMq0pivhjBBN6ymDFJkWE5
         k3bDKivGJ61xovfXP1egXxv5F1cee+/aFUFayC4laPIo0qwMOZT2RB61YGfYOg5IXo0D
         2PHfFZnCQCL10vAanH9yaiGyWGcX0sb6H08WQ0PxwP0WBWH3ubtMBqX5SY5IUyRSPmQm
         mKQw==
X-Gm-Message-State: AOAM532mg+vzt8BlrWcnQcgIn74+iP4grsaTLU4QLKAKD4p5dNYOor+I
        K/IAARxGWtmpZKmAAUzIwig=
X-Google-Smtp-Source: ABdhPJyDAQoPlKb5jhvHQW08KCTtJ1TqfaVv2T52ChEMhE1BZDdoIW9wm7CZ86bn2A1PxualmJpMCQ==
X-Received: by 2002:a0c:eed3:: with SMTP id h19mr468325qvs.39.1624887275681;
        Mon, 28 Jun 2021 06:34:35 -0700 (PDT)
Received: from localhost.localdomain (ec2-35-169-212-159.compute-1.amazonaws.com. [35.169.212.159])
        by smtp.gmail.com with ESMTPSA id h1sm2276030qkm.50.2021.06.28.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 06:34:35 -0700 (PDT)
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
Subject: [PATCH v32 13/13] MAINTAINERS: Update for DAMON
Date:   Mon, 28 Jun 2021 13:33:55 +0000
Message-Id: <20210628133355.18576-14-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210628133355.18576-1-sj38.park@gmail.com>
References: <20210628133355.18576-1-sj38.park@gmail.com>
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
index 3d657e1fe359..fd440d494469 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5110,6 +5110,18 @@ F:	net/ax25/ax25_out.c
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

