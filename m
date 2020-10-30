Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8810EC4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 14:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 203752076E
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604066428;
	bh=SQY9btLcVx02wKeES278fkHq50CU5n16gUg7TTg7C4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=zb5N+aH2kTxMgvP99RoQgdxk4kwPgBOCTP7d0BBuZPh1bNbU+LlFG8u7qYvNAlzDE
	 +LSgZWQuUMb3MUut562PXCETjx6eiDBHt6/6RY7QiIjwetr40UsCYdnJdqC8pabwSI
	 qr6N9C3RABNTQ+5m/gbj2vChlnOn4NYCLlyny7a8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgJ3OA1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 10:00:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgJ3OA1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 30 Oct 2020 10:00:27 -0400
Received: from coco.lan (ip5f5ad5bb.dynamic.kabel-deutschland.de [95.90.213.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B2A62072C;
        Fri, 30 Oct 2020 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604066426;
        bh=SQY9btLcVx02wKeES278fkHq50CU5n16gUg7TTg7C4k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SBC9F+DRm12fAdUx4LAFRz3vENqpfGMsDwloEa1LJ5v23VRMLbJxqFtYknmMTxwn2
         9hHp6N+ByHhuCF+dIYl4Opt5bElP4fwxlxaOmrS+VZuzxrhwXBocz0i6oLgcmcspzy
         QrFErBG0xZXDJ9n0LMVifLwvFVDp5Ymo9yKS9Mp4=
Date:   Fri, 30 Oct 2020 15:00:19 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: excess bolding in html
Message-ID: <20201030150019.1cc6db7d@coco.lan>
In-Reply-To: <20201030125313.GH27442@casper.infradead.org>
References: <31362b3b-469f-1f74-d929-b6faa7ae4e30@infradead.org>
        <20201030083748.4db9848b@coco.lan>
        <20201030113147.GG27442@casper.infradead.org>
        <db164a2a-83f1-efd0-1c73-a4a77785bb59@darmarit.de>
        <20201030125313.GH27442@casper.infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 30 Oct 2020 12:53:13 +0000
Matthew Wilcox <willy@infradead.org> escreveu:

> On Fri, Oct 30, 2020 at 01:28:59PM +0100, Markus Heiser wrote:
> > Am 30.10.20 um 12:31 schrieb Matthew Wilcox:  
> > > On Fri, Oct 30, 2020 at 08:37:48AM +0100, Mauro Carvalho Chehab wrote:  
> > > > Just changing the kernel-doc markup at kernel/futex.c:
> > > > 
> > > > 	/**
> > > > 	 * futex_setup_timer - set up the sleeping hrtimer.
> > > > 	 * @time:	ptr to the given timeout value
> > > > 	 * @timeout:	the hrtimer_sleeper structure to be set up
> > > > 	 * @flags:	futex flags
> > > > 	 * @range_ns:	optional range in ns
> > > > 	 *
> > > > 	 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
> > > > 	 *	   value given
> > > > 	 */
> > > > 
> > > > To:
> > > > 
> > > > ...
> > > > 	 * Return:
> > > > 	 *
> > > > 	 * Initialized hrtimer_sleeper structure or NULL if no timeout
> > > > 	 * value given
> > > > 	 */
> > > > 
> > > > Should fix it.  
> > > 
> > > Or just remove the indent.
> > > 
> > >   * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
> > >   * value given.  
> > 
> > To add my 2 cent:
> > 
> > The return value should be described in a dedicated section
> > named "Return:", like shown im Mauro's example (compare [1]).
> > 
> > For on-liners I think it is OK to use the short form (compare [2]).
> > 
> > [1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#return-values
> > [2] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation  

Yeah, I would use myself something like:

	Return: foo

only for single-line returns, using:

	Return:

	foo
	bar

for multi-line ones.

-

Anyway, I tried the enclosed patch. With that, it should now recognize 
kernel-doc markups with:

 	 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
 	 *	   value given

And:

	 * Returns: 0 on success, -ENOSPC if no suitable hole is found, -EINTR if
	 * asked to wait for eviction and interrupted.
	 */
	(this example came from drivers/gpu/drm/i915/i915_gem_gtt.c)

I only did a fast check here, in order to verify if it won't be
producing additional warnings. I didn't check the html output.
Just the resulting ReST from kernel-doc and the "make htmldocs" warnings.

PS.: This handles only "Note(s)" and "Return(s)" sections.
     Description and @var: are already handled using a different
     logic elsewhere.

     This could likely be generalized, but more work (and tests)
     are required.

Thanks,
Mauro

[PATCH] scripts: kernel-doc: better handle spaces after section markups

Better handle things like:

	* Return: foo
	*         description

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index f699cf05d409..a91a2420cccf 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -389,7 +389,7 @@ my $doc_com_body = '\s*\* ?';
 my $doc_decl = $doc_com . '(\w+)';
 # @params and a strictly limited set of supported section names
 my $doc_sect = $doc_com .
-    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:(.*)';
+    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)(\s*:)(.*)';
 my $doc_content = $doc_com_body . '(.*)';
 my $doc_block = $doc_com . 'DOC:\s*(.*)?';
 my $doc_inline_start = '^\s*/\*\*\s*$';
@@ -865,8 +865,21 @@ sub output_highlight_rst {
     my $in_literal = 0;
     my $litprefix;
     my $block = "";
+    my $spaces = "";
+    my $first = 1;
 
     foreach $line (split "\n",$input) {
+        if ($first) {
+		$spaces = $1 if ($line =~ (m/^(\s+)/));
+		$first = 0;
+        }
+
+        if ($spaces ne "") {
+		if (!($line =~ s/^$spaces//)) {
+		    $spaces = "";
+		}
+        }
+
 	#
 	# If we're in a literal block, see if we should drop out
 	# of it.  Otherwise pass the line straight through unmunged.
@@ -2135,8 +2148,9 @@ sub process_body($$) {
     }
 
     if (/$doc_sect/i) { # case insensitive for supported section names
+	my $spaces = "$1$2";
 	$newsection = $1;
-	$newcontents = $2;
+	$newcontents = $3;
 
 	# map the supported section names to the canonical names
 	if ($newsection =~ m/^description$/i) {
@@ -2161,11 +2175,20 @@ sub process_body($$) {
 
 	$in_doc_sect = 1;
 	$state = STATE_BODY;
-	$contents = $newcontents;
 	$new_start_line = $.;
-	while (substr($contents, 0, 1) eq " ") {
-	    $contents = substr($contents, 1);
+
+	if ($newsection =~ m/(return|note)/i) {
+	    $spaces =~ s/\S/ /g;
+	    $newcontents = $spaces . $newcontents;
+	    $newcontents =~ s/^\s+$//;
+	    $contents = $newcontents;
+	} else {
+	    $contents = $newcontents;
+	    while (substr($newcontents, 0, 1) eq " ") {
+		$newcontents = substr($newcontents, 1);
+	    }
 	}
+
 	if ($contents ne "") {
 	    $contents .= "\n";
 	}


