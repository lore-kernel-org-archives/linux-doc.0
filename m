Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBE0C4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 00:43:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6218360230
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 00:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242935AbhHFAnd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 20:43:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241314AbhHFAnc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 20:43:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2BF361181;
        Fri,  6 Aug 2021 00:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1628210597;
        bh=a8GIAZH/SrBiqNH9BfQy1X36iX6vj+iZLd00Z0SVfgE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DhlFY1lMKQ3RbhQZoE/nkYwgdmKHCGaYfF/iaIVuM08g3mg8UWNhPDXSkCebZ2yCd
         tUEb8JFKycvqjRoVeODVekA7k9Zif/vtubqAx8UjQI465+GAkytdf2cnutDjtUK2Qb
         FkoPdcROQhXi9A1B9oz9268OgyffP9K6SstrtnxU=
Date:   Thu, 5 Aug 2021 17:43:16 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@Huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        brendanhiggins@google.com, corbet@lwn.net, david@redhat.com,
        dwmw@amazon.com, elver@google.com, fan.du@intel.com,
        foersleo@amazon.de, greg@kroah.com, gthelen@google.com,
        guoju.fgj@alibaba-inc.com, jgowans@amazon.com, joe@perches.com,
        mgorman@suse.de, mheyne@amazon.de, minchan@kernel.org,
        mingo@redhat.com, namhyung@kernel.org, peterz@infradead.org,
        riel@surriel.com, rientjes@google.com, rostedt@goodmis.org,
        rppt@kernel.org, shakeelb@google.com, shuah@kernel.org,
        sieberf@amazon.com, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v34 07/13] mm/damon: Implement a debugfs-based user
 space interface
Message-Id: <20210805174316.ff4b6eee629f9f05259058d9@linux-foundation.org>
In-Reply-To: <20210716081449.22187-8-sj38.park@gmail.com>
References: <20210716081449.22187-1-sj38.park@gmail.com>
        <20210716081449.22187-8-sj38.park@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 16 Jul 2021 08:14:43 +0000 SeongJae Park <sj38.park@gmail.com> wrote:

> +#define targetid_is_pid(ctx)	\
> +	(ctx->primitive.target_valid == damon_va_target_valid)
> +

I think this can be implemented as a static inline C function?

--- a/mm/damon/dbgfs.c~mm-damon-implement-a-debugfs-based-user-space-interface-fix-fix
+++ a/mm/damon/dbgfs.c
@@ -97,8 +97,10 @@ out:
 	return ret;
 }
 
-#define targetid_is_pid(ctx)	\
-	(ctx->primitive.target_valid == damon_va_target_valid)
+static inline bool targetid_is_pid(const struct damon_ctx *ctx)
+{
+	return ctx->primitive.target_valid == damon_va_target_valid;
+}
 
 static ssize_t sprint_target_ids(struct damon_ctx *ctx, char *buf, ssize_t len)
 {

We prefer this because it looks better, provides typechecking and can
in some situations suppress unused variable warnings.

