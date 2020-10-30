Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B301C00A89
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 17:30:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EBBA208B6
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 17:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rYhzrMuh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgJ3Ra3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 13:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbgJ3Ra2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 13:30:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD053C0613D2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 10:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=aCDWSM3+qiVQKEzFFAdYpj4Re0LyBLD/h0QcWSQlF38=; b=rYhzrMuh7CKLNsm5Kon7vvOLGy
        FNArv+ZY4XFJ24QN86QxcEq58pdyO66yhhDX5tY0Ds5nCKvbsfsEtdgy5oXsu2Zy77Q6kEdXkf7W7
        9rtsDeWwidJb4KLBVGonx4WyyftU+XmSPbZW+zBO81qBxMz1bfpnZZGFFTNQ7C+LbyPPKegll6DK+
        sHHX/rXiC5ngdX1AUR2oR/WpqnLo5gk1FZANsW9v4G++pZGPnUuNK/jI4iUszWdgrgG5SCS0eZYAd
        DAu7GEx+rgLsLU7m7U5vv7Gheza7Sp3ZNBinyxELKUM4rgQ9izNusIbvVID7U4rt2CzDxqVYx517C
        +icn3NHQ==;
Received: from [2601:1c0:6280:3f0::371c]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kYYEL-0002bI-85; Fri, 30 Oct 2020 17:30:26 +0000
Subject: Re: excess bolding in html
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <31362b3b-469f-1f74-d929-b6faa7ae4e30@infradead.org>
 <20201030083748.4db9848b@coco.lan>
 <20201030113147.GG27442@casper.infradead.org>
 <db164a2a-83f1-efd0-1c73-a4a77785bb59@darmarit.de>
 <20201030125313.GH27442@casper.infradead.org>
 <20201030150019.1cc6db7d@coco.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b4e9dad2-c501-623e-4c2d-66e9170a4b9e@infradead.org>
Date:   Fri, 30 Oct 2020 10:30:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030150019.1cc6db7d@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,
Thanks for the patch.

On 10/30/20 7:00 AM, Mauro Carvalho Chehab wrote:
> Em Fri, 30 Oct 2020 12:53:13 +0000
> Matthew Wilcox <willy@infradead.org> escreveu:
> 
>> On Fri, Oct 30, 2020 at 01:28:59PM +0100, Markus Heiser wrote:
>>> Am 30.10.20 um 12:31 schrieb Matthew Wilcox:  
>>>> On Fri, Oct 30, 2020 at 08:37:48AM +0100, Mauro Carvalho Chehab wrote:  
>>>>> Just changing the kernel-doc markup at kernel/futex.c:
>>>>>
>>>>> 	/**
>>>>> 	 * futex_setup_timer - set up the sleeping hrtimer.
>>>>> 	 * @time:	ptr to the given timeout value
>>>>> 	 * @timeout:	the hrtimer_sleeper structure to be set up
>>>>> 	 * @flags:	futex flags
>>>>> 	 * @range_ns:	optional range in ns
>>>>> 	 *
>>>>> 	 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
>>>>> 	 *	   value given
>>>>> 	 */
>>>>>
>>>>> To:
>>>>>
>>>>> ...
>>>>> 	 * Return:
>>>>> 	 *
>>>>> 	 * Initialized hrtimer_sleeper structure or NULL if no timeout
>>>>> 	 * value given
>>>>> 	 */
>>>>>
>>>>> Should fix it.  
>>>>
>>>> Or just remove the indent.
>>>>
>>>>   * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
>>>>   * value given.  
>>>
>>> To add my 2 cent:
>>>
>>> The return value should be described in a dedicated section
>>> named "Return:", like shown im Mauro's example (compare [1]).
>>>
>>> For on-liners I think it is OK to use the short form (compare [2]).
>>>
>>> [1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#return-values
>>> [2] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation  
> 
> Yeah, I would use myself something like:
> 
> 	Return: foo
> 
> only for single-line returns, using:
> 
> 	Return:
> 
> 	foo
> 	bar
> 
> for multi-line ones.
> 
> -
> 
> Anyway, I tried the enclosed patch. With that, it should now recognize 
> kernel-doc markups with:
> 
>  	 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
>  	 *	   value given
> 
> And:
> 
> 	 * Returns: 0 on success, -ENOSPC if no suitable hole is found, -EINTR if
> 	 * asked to wait for eviction and interrupted.
> 	 */
> 	(this example came from drivers/gpu/drm/i915/i915_gem_gtt.c)
> 
> I only did a fast check here, in order to verify if it won't be
> producing additional warnings. I didn't check the html output.
> Just the resulting ReST from kernel-doc and the "make htmldocs" warnings.
> 
> PS.: This handles only "Note(s)" and "Return(s)" sections.
>      Description and @var: are already handled using a different
>      logic elsewhere.
> 
>      This could likely be generalized, but more work (and tests)
>      are required.
> 
> Thanks,
> Mauro


I can confirm that the bolding in struct hrtimer_sleeper * futex_setup_timer()
is fixed after applying this patch.

OTOH, the bolding for int seq_open() remains as it was previously.
The only way that I could eliminate it was a small source file patch:

---
 fs/seq_file.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- linux-next-20201030.orig/fs/seq_file.c
+++ linux-next-20201030/fs/seq_file.c
@@ -47,7 +47,9 @@ static void *seq_buf_alloc(unsigned long
  *	ERR_PTR(error).  In the end of sequence they return %NULL. ->show()
  *	returns 0 in case of success and negative number in case of error.
  *	Returning SEQ_SKIP means "discard this element and move on".
- *	Note: seq_open() will allocate a struct seq_file and store its
+ *
+ *	Note:
+ *	seq_open() will allocate a struct seq_file and store its
  *	pointer in @file->private_data. This pointer should not be modified.
  */
 int seq_open(struct file *file, const struct seq_operations *op)


> [PATCH] scripts: kernel-doc: better handle spaces after section markups
> 
> Better handle things like:
> 
> 	* Return: foo
> 	*         description
> 
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index f699cf05d409..a91a2420cccf 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -389,7 +389,7 @@ my $doc_com_body = '\s*\* ?';
>  my $doc_decl = $doc_com . '(\w+)';
>  # @params and a strictly limited set of supported section names
>  my $doc_sect = $doc_com .
> -    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)\s*:(.*)';
> +    '\s*(\@[.\w]+|\@\.\.\.|description|context|returns?|notes?|examples?)(\s*:)(.*)';
>  my $doc_content = $doc_com_body . '(.*)';
>  my $doc_block = $doc_com . 'DOC:\s*(.*)?';
>  my $doc_inline_start = '^\s*/\*\*\s*$';
> @@ -865,8 +865,21 @@ sub output_highlight_rst {
>      my $in_literal = 0;
>      my $litprefix;
>      my $block = "";
> +    my $spaces = "";
> +    my $first = 1;
>  
>      foreach $line (split "\n",$input) {
> +        if ($first) {
> +		$spaces = $1 if ($line =~ (m/^(\s+)/));
> +		$first = 0;
> +        }
> +
> +        if ($spaces ne "") {
> +		if (!($line =~ s/^$spaces//)) {
> +		    $spaces = "";
> +		}
> +        }
> +
>  	#
>  	# If we're in a literal block, see if we should drop out
>  	# of it.  Otherwise pass the line straight through unmunged.
> @@ -2135,8 +2148,9 @@ sub process_body($$) {
>      }
>  
>      if (/$doc_sect/i) { # case insensitive for supported section names
> +	my $spaces = "$1$2";
>  	$newsection = $1;
> -	$newcontents = $2;
> +	$newcontents = $3;
>  
>  	# map the supported section names to the canonical names
>  	if ($newsection =~ m/^description$/i) {
> @@ -2161,11 +2175,20 @@ sub process_body($$) {
>  
>  	$in_doc_sect = 1;
>  	$state = STATE_BODY;
> -	$contents = $newcontents;
>  	$new_start_line = $.;
> -	while (substr($contents, 0, 1) eq " ") {
> -	    $contents = substr($contents, 1);
> +
> +	if ($newsection =~ m/(return|note)/i) {
> +	    $spaces =~ s/\S/ /g;
> +	    $newcontents = $spaces . $newcontents;
> +	    $newcontents =~ s/^\s+$//;
> +	    $contents = $newcontents;
> +	} else {
> +	    $contents = $newcontents;
> +	    while (substr($newcontents, 0, 1) eq " ") {
> +		$newcontents = substr($newcontents, 1);
> +	    }
>  	}
> +
>  	if ($contents ne "") {
>  	    $contents .= "\n";
>  	}
> 
> 


-- 
~Randy

