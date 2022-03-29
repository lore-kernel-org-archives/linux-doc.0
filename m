Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033BEC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 03:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbiC2DGt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 23:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiC2DGs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 23:06:48 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC34A2274D7
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 20:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=oelz9Y5BmSKvgoABg5AK3ArFvGur30QwoTySvrw52Q8=; b=EhlmsMigD7nhZk01j8g8qSuhqk
        AYOpJx9SeOezdNDV0651Y4DVCxxtK/yiKl4HnBHRdp8u6a+rnervTaCEjQ54BIeDXHll8PLVIeJyW
        lcCeMgjsN8RHFDBOnGOIS2/TAl6o8MdpYZmsrgsK0lrih0WE8yIpMsCqyCiSMTRExsXq0Quv/CoGE
        /pPtoxVWkkLKsejOHJGhQ7i4z/Bwdz6NM2GYN/kTELO+pT4jrUVMB2MMKGOeT2QyB4NSkkLNZw6st
        rLyCYsburz+o+BScrGswNBmh+NUU7psGRfcYN8COsBlsH6cGf5zrgGNqaATGfhraskrlYmCUuVQwR
        orVSXX0w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nZ2AK-00HVV8-0L; Tue, 29 Mar 2022 03:05:04 +0000
Date:   Tue, 29 Mar 2022 04:05:03 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Don't print anonymous union/struct to html
Message-ID: <YkJ3X4NdTbb0gf3Q@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just to be clear, I don't actually speak perl.

What I notice is that, without this patch, the htmldocs contain:

file:///home/willy/kernel/linux/Documentation/output/core-api/mm-api.html#c.folio

Members

flags

    Identical to the page flags.
{unnamed_union}

    anonymous
lru

    Least Recently Used list; tracks how recently this folio was used.
{unnamed_struct}

    anonymous
mlock_count

    Number of times any page in this folio is mlocked.

and that looks terrible.  Looking at the history of scripts/kernel-doc,
this wasn't supposed to happen.

Randy added support in 134fe01bfafa (2006), and there was an explicit
check to not output anything for anon union/struct.  It got reworked
slightly in 5f8c7c98ae38 (2007), but probably still worked the same.
I think it got broken by 151c468b44a8 (2017) which said:

    While here, I removed a unaligned check for !$anon_struct_union.
    This is not needed, as, if $anon_struct_union is not zero,
    $parameterdescs{$param} will be defined.

but I don't really know whether it was some later change to parameterdescs
that really broke it.

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 9c084a2ba3b0..64803fe15bd2 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1540,10 +1540,11 @@ sub push_parameter($$$$$) {
        elsif ($type eq "" && ($param eq "struct" or $param eq "union"))
        # handle unnamed (anonymous) union or struct:
        {
-               $type = $param;
-               $param = "{unnamed_" . $param . "}";
-               $parameterdescs{$param} = "anonymous\n";
+#              $type = $param;
+#              $param = "{unnamed_" . $param . "}";
+#              $parameterdescs{$param} = "anonymous\n";
                $anon_struct_union = 1;
+               return;
        }

        # warn if parameter has no description


