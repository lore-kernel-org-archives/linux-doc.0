Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8069F7E69D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 12:06:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751475AbeCOMGY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 08:06:24 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59144 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751372AbeCOMGX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Mar 2018 08:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GEswkaFpgx1Wvb11I76ALzNuhAqjGQ+t6+FiJUyNniU=; b=GqmKOBjbUkHe3UmbZ0K2aI/nE5
        B2qjpmbPShI8g/A8pd848YevEJefmNZtIbThrHMmXAaYVwIe1MLKhomgRnmy0pKRP9F31kjUDp1nP
        8058z9iYY5MTSopN5+l9xPYVkwn7wcoeP+nBu+ZM4oJ87FOVFlyvGs8OSZ22MKnyRJ4i4BGDgRY84
        L163l4mZFp5FOjZM6NNnbzdaHGY3Pducm/LCROR2h//kXeMFn/6I2UYuj8eEcy4iBHNTCWriI5dbZ
        v97ERB41G5a82XEG04lgT2+M9DqMWyeVEDDSss7iV4F0/Ws79f0gPn/bIKErHQhARaD3xABdXaUmQ
        h8od0NgQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1ewReJ-000121-Aw; Thu, 15 Mar 2018 12:06:23 +0000
Date:   Thu, 15 Mar 2018 05:06:23 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] kernel-doc: Remove __sched markings
Message-ID: <20180315120623.GB9949@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Matthew Wilcox <mawilcox@microsoft.com>

I find the __sched annotations unaesthetic in the kernel-doc.  Remove
them like we remove __inline, __weak, __init and so on.

Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index ae3cac118a11..eb986a7809d3 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1578,6 +1578,7 @@ sub dump_function($$) {
     $prototype =~ s/__meminit +//;
     $prototype =~ s/__must_check +//;
     $prototype =~ s/__weak +//;
+    $prototype =~ s/__sched +//;
     my $define = $prototype =~ s/^#\s*define\s+//; #ak added
     $prototype =~ s/__attribute__\s*\(\(
             (?:

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
