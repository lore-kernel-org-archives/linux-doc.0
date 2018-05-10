Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 830517DE79
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 14:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965567AbeEJOV0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 10:21:26 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47210 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934609AbeEJOVZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 10:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xkbLYB5azBsX96n8SS3szmlSIjx1iz/JZuPQ0VRYKhc=; b=JpSgSLtlDUpmQ8/OI2pKOb0aG
        Y9+u+r83yV/23g8d95Hk9W50SAMugkHVg0XHm8sJGE+cTaN1erB1BUU6/EGUB4AxZYCEsJAjVfK8y
        +9mEzIF3Naah2R9gVqiniUFiSUGY/dBpzYXbDrMIT3c5xDgwg7wo1tDdQFWbb8sToYCy73nGprdBp
        lKEsd6J+doyePnjaONoMQ4pQCie/x6vzblhfeLPZ6Dyj8lzf6HTLcmJMTN9s1miuKPqC1w9LrJwjC
        ftStLpzN6XB6IIlwXfgD+LvRz8MV7FdlYIwTfc6acoVzw0sL4US0ZfkmaEMjs/N14w2kCHKDDDx88
        qE9JYePXQ==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGmRa-0003Zn-QT; Thu, 10 May 2018 14:21:19 +0000
Date:   Thu, 10 May 2018 11:21:13 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510112113.4db65764@vento.lan>
In-Reply-To: <20180510073012.5902088e@lwn.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
        <20180510083838.GA21846@infradead.org>
        <20180510063805.1859b1aa@vento.lan>
        <20180510073012.5902088e@lwn.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 10 May 2018 07:30:12 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Thu, 10 May 2018 06:38:05 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > (Peter said):  
> > > Independent of any philosophical discussion not allowing a setence to
> > > end with a single ':' is completely idiotic.  Please fix the tooling
> > > instead to allow it, as it is very important for being able to just
> > > write understandable comments.    
> 
> FWIW, there's no problem with a sentence ending with a single colon.
> It's only an issue if you want to flag a special interpretation for the
> text that follows that sentence.  Just to be precise.
> 
> > Patches are welcome, although I don't see any easy way to solve it.  
> 
> I could envision some sort of heuristic that would recognize an indented
> block containing code.  Probably we could go simpler and force the
> "literal block" treatment for any indented block that lacks explicit
> enumeration markers.  So:
> 
> 	this->would_be("a literal block");
> 
> but:
> 
>   - This would not be
> 
> Such a thing would likely be a bit fragile (people feel, rightly, that
> they can put anything into normal text) but it might just work well
> enough.  For best results, it should probably be done as part of Sphinx
> itself, rather than yet another ugly hack in the kerneldoc script.

I guess that it also won't work...

$ git grep -A2 "\*\s.*\s.*:$" -- $(git grep kernel-doc:: Documentation/|cut -d : -f 4-)

Present some matches that seem to be violating such hint.

drivers/edac/edac_device.h:/* The offset value can be:
drivers/edac/edac_device.h- *   -1 indicating no offset value
drivers/edac/edac_device.h- *   0 for zero-based block numbers

drivers/gpu/drm/drm_scdc_helper.c: *    As per the spec:
drivers/gpu/drm/drm_scdc_helper.c- *            TMDS clock rate for pixel clock < 340 MHz = 1x the character
drivers/gpu/drm/drm_scdc_helper.c- *            rate = 1/10 pixel clock rate

I didn't actually check if those are part of a Kernel-doc markup, though,
but it shows that people sometimes don't add a "prepend" character to
a list.

In the specific case of errors, prepending with a "-" can be weird,
as it may lead ugly things like:

	* - -1 indicating no offset value
	* - 0 for zero-based block numbers

The problem with a hint-based mechanism is that it will generate
false hints. If added, we may end by needing to add extra tags to
disable the hints mechanism where it gets wrong, or to periodically
do code changes at kernel-doc comments in order to make the hints
logic happy.

So, IMO, we should provide non-hints based mechanism, like forcing the
string that prepends the colon to have a keyword that will make it to
parse the block as literal, where expressions like:

	See the code-block foo:
	See the following code example:
	See the following flow diagram:
	See the following artwork:

Is the best alternative to avoid "::", as on the enclosed patch.

> This particular problem may be solvable, and I'll look into it, but not
> right away.  The offline world is being rather insistently obnoxious
> these days...

Thanks,
Mauro

[PATCH] Mark a diagram at wait.h as such, using a code-block for it

Instead of explicitly using "::" to mark the diagram,
detect it based on code words inside the description.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

diff --git a/include/linux/wait.h b/include/linux/wait.h
index d9f131ecf708..c360c5947374 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -101,7 +101,7 @@ init_waitqueue_func_entry(struct wait_queue_entry *wq_entry, wait_queue_func_t f
  * lead to sporadic and non-obvious failure.
  *
  * Use either while holding wait_queue_head::lock or when used for wakeups
- * with an extra smp_mb() like:
+ * with an extra smp_mb() like on this diagram:
  *
  *      CPU0 - waker                    CPU1 - waiter
  *
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0057d8eafcc1..1c69072997f8 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -803,7 +803,12 @@ sub output_highlight_rst {
 	#
 	if (! $in_literal) {
 	    $block .= $line . "\n";
-	    if (($line =~ /$sphinx_literal/) || ($line =~ /$sphinx_cblock/)) {
+	    if ($block =~ s/(code|example|artwork|flow|diagram)([^\:]*:)\n/$1$2:\n/) {
+		$in_literal = 1;
+		$litprefix = "";
+		$output .= highlight_block($block);
+		$block = ""
+	    } elsif (($line =~ /$sphinx_literal/) || ($line =~ /$sphinx_cblock/)) {
 		$in_literal = 1;
 		$litprefix = "";
 		$output .= highlight_block($block);


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
