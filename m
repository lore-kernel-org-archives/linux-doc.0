Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1991F7D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 14:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S937238AbeFSOMB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 10:12:01 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46680 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965783AbeFSOL7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 10:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iVVJl7dqFUDMwlL/z7zZ5Mgd6nkF+94CaeTuiIf/BrA=; b=ny6kIxV+vWWC957EcT80nwodZ
        6tKhzId4NGkInNp0cZ7WH3P+sOKj8pmLwkBySf52ArAt4K0s3R6Q7o1ymCXi9iXvggnrCnP4uOl+y
        RcFPC64Ri6oXfmcJkeTF9RHdjr/vkSMZ1j994PYCQcjLpO0HOax5FIsiwnAzFxm2prdlbq0PNrPr4
        Epf0YOpWwMfWAChDPzRYl0ALtYAqsbgswSzLyjt+GwR8ck4tjuS15uEUaYBbIoHfOc7MyMAJQs65+
        DjVFQTFZp6S9f00YOJEX9TQBpJPtFhDd/GlnMner+iRSuTakRttmecNSH1BicCg1KDmdPfk6d4PI1
        TBQt6I2IQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fVHMS-0007ft-Q5; Tue, 19 Jun 2018 14:11:56 +0000
Date:   Tue, 19 Jun 2018 07:11:56 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <mawilcox@microsoft.com>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation/sphinx: add "nodocs" directive
Message-ID: <20180619141156.GC1438@bombadil.infradead.org>
References: <1529328996-16247-1-git-send-email-rppt@linux.vnet.ibm.com>
 <20180618171028.GD28748@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180618171028.GD28748@bombadil.infradead.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 18, 2018 at 10:10:28AM -0700, Matthew Wilcox wrote:
> On Mon, Jun 18, 2018 at 04:36:34PM +0300, Mike Rapoport wrote:
> > Hi,
> > 
> > These patches allow passing "-no-doc-sections" option to scripts/kernel-doc
> > from the sphinx generator.
> > 
> > This allows to avoid duplicated DOC: sections when "kernel-doc:" directive
> > is used without explicit selection of functions or function types. For
> > instance, [1] has "IDA description" and "idr synchronization" twice.
> 
> Hah, I just found an abandoned patch for this in a disused git tree.
> I was wondering whether I needed to resurrect it.  Enthusiastically,
> 
> Acked-by: Matthew Wilcox <willy@infradead.org>

Here's the patch I found (I couldn't refind it at the time):

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index d15e07f36881..d86d88da1d75 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -47,6 +47,7 @@ class KernelDocDirective(Directive):
     optional_arguments = 4
     option_spec = {
         'doc': directives.unchanged_required,
+        'nodoc': directives.unchanged,
         'functions': directives.unchanged_required,
         'export': directives.unchanged,
         'internal': directives.unchanged,
@@ -74,6 +75,8 @@ class KernelDocDirective(Directive):
             export_file_patterns = str(self.options.get('internal')).split()
         elif 'doc' in self.options:
             cmd += ['-function', str(self.options.get('doc'))]
+        elif 'nodoc' in self.options:
+            cmd += ['-no-doc-sections']
         elif 'functions' in self.options:
             for f in str(self.options.get('functions')).split():
                 cmd += ['-function', f]

I did it while I was trying to create good radix tree documentation,
which led to me realising that was a Herculean task (specifically: the
stables).

I ended up doing this instead:

+The Public API
+==============
+
+The public API can be found in ``<linux/radix-tree.h>``.  To use a
+radix tree in your data structure, embed a :c:type:`struct radix_tree_root`
+in it, and initialise it using ``INIT_RADIX_TREE``.  You can also use
+a file-local or global radix tree by defining a :c:type:`RADIX_TREE` as you
+would a :c:type:`LIST_HEAD`.
+
+.. Not actually "internal", but I need to exclude the 'doc' paragraph, and
+   this is the best way to do it.
+.. kernel-doc:: include/linux/radix-tree.h
+   :internal:
+
+.. kernel-doc:: lib/radix-tree.c
+   :export:

I'm not sure if I agree with me-of-January-2017 that this is the "best"
way to do it, but maybe that'll point to another way of achieving the
same thing.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
