Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F80C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 22:27:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2929A60FC1
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 22:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244769AbhIMW2p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Sep 2021 18:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54296 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244989AbhIMW2p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Sep 2021 18:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631572048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ed60XhekeWquIFLKIHPQ4y2Tgzq2QS36FAffaebUrj0=;
        b=Pm/Bcwbxgs2yC8586DcP0MSkF6JgDqxSXgKD8tud+7B7mAy8dUmck87TOGOjQ63rm6JQXX
        HzNB9b+hV+79ciwwqbZuTFaqz3KFAFT0jh8TqbB7P1AHNfTPQ0ZBHlQoXNnZvQiX53c6YY
        DJ0BKYFITJycmiuxzkX8XDAi39l2tgI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-LF5gIdLPOl-vUnPcw_r2_A-1; Mon, 13 Sep 2021 18:27:27 -0400
X-MC-Unique: LF5gIdLPOl-vUnPcw_r2_A-1
Received: by mail-io1-f71.google.com with SMTP id e18-20020a6b7312000000b005be766a70dbso14953383ioh.19
        for <linux-doc@vger.kernel.org>; Mon, 13 Sep 2021 15:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ed60XhekeWquIFLKIHPQ4y2Tgzq2QS36FAffaebUrj0=;
        b=R+lpJBpkTZLq5KTbHXiRKvZg998qaCJcDwOyjbztYrWOoSVdF0I7/J68SsZm9tjKOo
         epAGyx1xvyZntLFxRB+vlf65snY2cZjmtXnm2nx38jqDPj+wJGjaDCZux7l7I42mDxy3
         ffz14ZC3CtN85BNUGv3SHSmcRxDWuCusPDAoLRaNXnLn1wU08mi1XJNl3R1yVduEeUqV
         Q7WuUPqmXAzs1uUrxaBl8Wxyd7nFai1fBBCUMcIQmjPe9RJe6MkAHv2SPOnPcJ7OGtb+
         zxHrlio7K6cv8/98TKTsD9d55SMWrEbEb6i8BGuzcL04qLaY1WG+m92f/63+4CAE4Hvo
         QggA==
X-Gm-Message-State: AOAM533D/uRpgSf8SY65CNhyowdsh5FiC/qoO8QmXpfS6krLlKv0TjD4
        iBmtpg5WdyUPFHGt5gUPyBd5NYr6AsZ3regC8rUowJVwtHM2FxLv/djtu6FMEyIldByYk4vA/Tg
        ho6+AbPgVxOc/rUwzhr35
X-Received: by 2002:a05:6602:2e0c:: with SMTP id o12mr6655573iow.59.1631572046778;
        Mon, 13 Sep 2021 15:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2Be4X0ICHDQBimF+mHMVXCAyyI9/XcjxSzsnAR7FEgXBWZfVi9jiMU8MDsACdC3ZIM8EokA==
X-Received: by 2002:a05:6602:2e0c:: with SMTP id o12mr6655564iow.59.1631572046636;
        Mon, 13 Sep 2021 15:27:26 -0700 (PDT)
Received: from halaneylaptop.redhat.com (068-184-200-203.res.spectrum.com. [68.184.200.203])
        by smtp.gmail.com with ESMTPSA id d10sm5809457ilu.54.2021.09.13.15.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 15:27:26 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Jason Baron <jbaron@akamai.com>, Jonathan Corbet <corbet@lwn.net>,
        Jim Cromie <jim.cromie@gmail.com>
Cc:     Andrew Halaney <ahalaney@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] Documentation: dyndbg: Improve cli param examples
Date:   Mon, 13 Sep 2021 17:24:40 -0500
Message-Id: <20210913222440.731329-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913222440.731329-1-ahalaney@redhat.com>
References: <20210913222440.731329-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jim pointed out that using $module.dyndbg= is always a more flexible
choice for using dynamic debug on the command line. The $module.dyndbg
style is checked at boot and handles if $module is a builtin. If it is
actually a loadable module, it is handled again later when the module is
loaded.

If you just use dyndbg="module $module +p" dynamic debug is only enabled
when $module is a builtin.

It was recommended to illustrate wildcard usage as well.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
Suggested-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index d0911e7cc271..4bfb23ed64ec 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -357,7 +357,10 @@ Examples
   Kernel command line: ...
     // see whats going on in dyndbg=value processing
     dynamic_debug.verbose=1
-    // enable pr_debugs in 2 builtins, #cmt is stripped
-    dyndbg="module params +p #cmt ; module sys +p"
+    // Enable pr_debugs in the params builtin
+    params.dyndbg="+p"
+    // enable pr_debugs in all files under init/
+    // and the function pc87360_init_device, #cmt is stripped
+    dyndbg="file init/* +p #cmt ; func pc87360_init_device +p"
     // enable pr_debugs in 2 functions in a module loaded later
     pc87360.dyndbg="func pc87360_init_device +p; func pc87360_find +p"
-- 
2.31.1

