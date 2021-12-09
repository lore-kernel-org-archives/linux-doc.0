Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C134C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 20:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhLIUPV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 15:15:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhLIUPV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 15:15:21 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57311C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 12:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=0LMB/Zrbq20lxF1N6EBTpL6vRG5tAE5ezDL0O2682dw=; b=aGFsAVI+ZC1kaygdyOY0QnHIVR
        HH4egf9lF031xwHjsrN3sk3V+B0rMqfGDF4fQhsE7v8Tgh1+y686A/0FTfz78HKE2V7ek0Yb9CHPe
        jIwnqPV1IPTa5ZMzh0/KBk6j2h9SpB757z5ogELAbcxYzOJL/mbnuCqOxIw7hhP1eNdwlVEVx7PvS
        6CASD1X/EskaDqfQEX6GNu/NTaVESz5Tka3YVlQhOFlNmDKlODfWmOliK63ON6Y3qilsJlYaPbsEl
        xNREBR8pvOGUgbaKQkBiLIRB0Uq1oczKvoVxK/lLy+rHstdaaMkbVnKvJv2KrXC6X/q5i0czb9ere
        STPH7GGQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mvPlY-009gsf-Rm
        for linux-doc@vger.kernel.org; Thu, 09 Dec 2021 20:11:44 +0000
Date:   Thu, 9 Dec 2021 20:11:44 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Subject: Documenting operations structs
Message-ID: <YbJjAC/dDcaKl9a+@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If one wishes to add kernel-doc for, ohletssay, vm_operations_struct,
the html output is somewhat underwhelming.

-/*
+/**
+ * struct vm_operations_struct - Per-VMA methods.
+ *
  * These are the virtual MM functions - opening of an area, closing and
  * unmapping it (needed to keep files on disk up-to-date etc), pointer
  * to the functions called when a no-page or a wp-page exception occurs.
  */
 struct vm_operations_struct {
        void (*open)(struct vm_area_struct * area);
+       /**
+         * @close: Called when the VMA is being removed from the MM.
+         * Context: User context.  May sleep.  Caller holds mmap_lock.
+         */
        void (*close)(struct vm_area_struct * area);

That 'Context:' marker is not treated the same way as a Context:
heading in a function definition.  Adding a blank line between @close
and Context: improves the appearance somewhat, but it's still not
presented in the nicest possible way.

Any thoughts?  Do we have examples elsewhere in the kernel of method
tables being documented using kernel-doc?
