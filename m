Return-Path: <SRS0=NxQi=CL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B605C433E2
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 16:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C211207EA
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 16:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ijE2vgHB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgIBQGV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Sep 2020 12:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgIBQGU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Sep 2020 12:06:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8504C061244
        for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2020 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=Gh47hmByb6F/k89EGrb3SNsSzs0dQHlHlTpbAVPcLKA=; b=ijE2vgHBxZdZTpPeR+xSZoIEEX
        N5/alLgFAmbI9f/br8mu5wbXiQpruy7miG1ElZHXAIQra9QgX35GKw1RFEXSXhzsmOzTlCI6aQk+m
        CskhLAdTxDWrjfqz1+sxOoCSvfYstSuJidy4TX4Wu6r6e4UrjkoRZy+ykWOmJIll38fkjalPP7j60
        ylN7xTUOOkU9IEjuRmCFz9qmgH11KeR/tHJ/0jAMrtRloOlhjo8exb+zZRHtquJQlJY2S2HZgqir3
        IFIkCgBn88z+R6BMy0HFPV7YxnCyS0KzXvTUaTtE3jV1coHzg1/kuSz6z/h6ctRDzkTtO/Mli1li3
        1lbnMUDA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kDVH7-0005K5-Eq; Wed, 02 Sep 2020 16:06:17 +0000
Subject: Re: [PATCH 2/4] Documentation/process: expand plain-text advice
To:     Drew DeVault <sir@cmpwn.com>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
References: <20200902155759.55895-1-sir@cmpwn.com>
 <20200902155759.55895-3-sir@cmpwn.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <022eb995-5d47-c564-af55-239d5c3ab848@infradead.org>
Date:   Wed, 2 Sep 2020 09:06:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902155759.55895-3-sir@cmpwn.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/2/20 8:57 AM, Drew DeVault wrote:
> This adds a link to https://useplaintext.email to email-clients.rst,
> which is a more exhaustive resource on configuring various mail clients
> for plain text use. submitting-patches.rst is also updated to direct
> readers to email-clients.rst to equip new contributors with the
> requisite knowledge to become a good participant on the mailing lists.
> 
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> ---
> Conflict of interest: I wrote and maintain the website this links to.
> 
>  Documentation/process/email-clients.rst      | 5 +++++
>  Documentation/process/submitting-patches.rst | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
> index c9e4ce2613c0..16586f6cc888 100644
> --- a/Documentation/process/email-clients.rst
> +++ b/Documentation/process/email-clients.rst
> @@ -25,6 +25,11 @@ attachments, but then the attachments should have content-type
>  it makes quoting portions of the patch more difficult in the patch
>  review process.
>  
> +It's also strongly recommended that you use plain text in your email body,
> +for patches and other emails alike. https://useplaintext.email may be useful

You could justify that first sentence by adding that some mailing lists drop/discard
emails that are in html.

> +for information on how to configure your preferred email client, as well as
> +listing recommended email clients should you not already have a preference.
> +
>  Email clients that are used for Linux kernel patches should send the
>  patch text untouched.  For example, they should not modify or delete tabs
>  or spaces, even at the beginning or end of lines.
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index f205753ae3d8..0dec104cb932 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -395,6 +395,9 @@ for their time.  Code review is a tiring and time-consuming process, and
>  reviewers sometimes get grumpy.  Even in that case, though, respond
>  politely and address the problems they have pointed out.
>  
> +See :ref:`Documentation/process/email-clients.rst` for recommendations on email
> +clients and mailing list etiquette.
> +
>  
>  Don't get discouraged - or impatient
>  ---------------------------------------
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
