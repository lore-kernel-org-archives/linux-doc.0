Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08D7C388F9
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 11:59:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D67C21D7B
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603281552;
	bh=iQJKeOcoMrfxe0TxGMxnR3EtyZpzJ7uGLe3SYzav/XE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=j6NxZvIwFFgLMU8bwL4/jR0EEa9uIfWi9NKdnc33yFRDu/YYIv3haC6zC5geFi7Lz
	 m0AxnAXzO97NIN0Vm0GXQfZtNVrZhQzPJbYG/9/QbnAYfMipgiYF+VlLUmogcRsu8Z
	 gUlfphJN/JGxeM4zKg1m6aN6hn/jThXUdN2uP1O8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439758AbgJUL7L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 07:59:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:51804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439720AbgJUL7L (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Oct 2020 07:59:11 -0400
Received: from coco.lan (ip5f5ad5a8.dynamic.kabel-deutschland.de [95.90.213.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B5B821789;
        Wed, 21 Oct 2020 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603281550;
        bh=iQJKeOcoMrfxe0TxGMxnR3EtyZpzJ7uGLe3SYzav/XE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZDZvY6VTcDEWY3Z84x64jvN/zuBBALzRdBdE/WC7iisi8XILmGmnGe0j0vGffSEp6
         9Si6RtmBX8SaGQqIAKYYxz7WQ/HIn/Z1KglUjbcqqHh2xPDm06Gu4ct0Us6619xpsn
         C0TCVI6uBoCgwkbTpuIIHtKv3clALLT/bgwIXIII=
Date:   Wed, 21 Oct 2020 13:59:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        William Kucharski <william.kucharski@oracle.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/24] mm: pagemap.h: fix two kernel-doc markups
Message-ID: <20201021135903.719e1f30@coco.lan>
In-Reply-To: <20201021112819.GJ20115@casper.infradead.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
        <54ea6dd0fc37c48aef3fc3ae454c54a80db313dc.1602590106.git.mchehab+huawei@kernel.org>
        <20201013122654.GE20115@casper.infradead.org>
        <20201021115557.24c83c35@coco.lan>
        <20201021112819.GJ20115@casper.infradead.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 21 Oct 2020 12:28:19 +0100
Matthew Wilcox <willy@infradead.org> escreveu:

> On Wed, Oct 21, 2020 at 11:55:57AM +0200, Mauro Carvalho Chehab wrote:
> > Hi Matthew,
> > 
> > Em Tue, 13 Oct 2020 13:26:54 +0100
> > Matthew Wilcox <willy@infradead.org> escreveu:
> >   
> > > On Tue, Oct 13, 2020 at 02:14:37PM +0200, Mauro Carvalho Chehab wrote:  
> > > > Changeset 6c8adf8446a3 ("mm: add find_lock_head") renamed the
> > > > index parameter, but forgot to update the kernel-doc markups
> > > > accordingly.    
> > > 
> > > The patch is correct (thank you!), but the description here references
> > > a git commit id that's only found in the -next tree and is unstable.
> > > 
> > > Andrew, can you fold this into the offending commit?  
> > 
> > Patch already reached upstream. So, it gained a stable reference.
> > 
> > So, I'm changing its description to:
> > 
> >   Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >   Date:   Thu Sep 10 08:38:07 2020 +0200
> > 
> >     locking/refcount: move kernel-doc markups to the proper place  
> 
> This is the wrong changelog?

Sorry! Yeah, that was the wrong one. I'm enclosing the right one
with the complete patch.

Thanks,
Mauro

[PATCH] mm: pagemap.h: fix two kernel-doc markups

Changeset a8cf7f272b5a ("mm: add find_lock_head") renamed the
index parameter, but forgot to update the kernel-doc markups
accordingly.

Fixes: a8cf7f272b5a ("mm: add find_lock_head")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index c77b7c31b2e4..e1e19c1f9ec9 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -344,9 +344,9 @@ static inline struct page *find_get_page_flags(struct address_space *mapping,
 /**
  * find_lock_page - locate, pin and lock a pagecache page
  * @mapping: the address_space to search
- * @offset: the page index
+ * @index: the page index
  *
- * Looks up the page cache entry at @mapping & @offset.  If there is a
+ * Looks up the page cache entry at @mapping & @index.  If there is a
  * page cache page, it is returned locked and with an increased
  * refcount.
  *
@@ -363,9 +363,9 @@ static inline struct page *find_lock_page(struct address_space *mapping,
 /**
  * find_lock_head - Locate, pin and lock a pagecache page.
  * @mapping: The address_space to search.
- * @offset: The page index.
+ * @index: The page index.
  *
- * Looks up the page cache entry at @mapping & @offset.  If there is a
+ * Looks up the page cache entry at @mapping & @index.  If there is a
  * page cache page, its head page is returned locked and with an increased
  * refcount.
  *
