Return-Path: <SRS0=kdU1=EL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BA4C4741F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 15:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B3AB21D81
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 15:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QPE6XwbQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730977AbgKEPAU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Nov 2020 10:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730854AbgKEPAT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Nov 2020 10:00:19 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56DFC0613CF;
        Thu,  5 Nov 2020 07:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=/abP978i8fSQssBpWowZMWNHrfqF74CKuQx5R+Ko4q8=; b=QPE6XwbQsnFE9Vg4cul0wx02Ky
        DU5hbMExC8IszNS/6+pNlnGundeA1AVUVWnFatXxRoJUvcAx7fO8C66doRSiQ5P01gek+3MlvlmVb
        CLyooHl/+gN+AVHLjXV07MVR16Q3pqOKSe7oMUayvP05JH4uFPfuoWew6RLUtF1IlTvme1RsROZxg
        EKnybJPoCe4p2ZUgT62TUb+7FV8rEfu3MlsSqd5ARDDcLxZI9tJVKCjGbNzt+eNvAU9LfwQ+vCiF3
        Z7Sl8dD3ZnBeHt/IzpRnV4te8HRy4VGO9EjJTW7Bfemmu6prO9rHyoMxz667rhG2lWHA9OXM9B99Q
        APcBHtJw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kagkL-0007TV-7x; Thu, 05 Nov 2020 15:00:17 +0000
Date:   Thu, 5 Nov 2020 15:00:17 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 56/56] scrpits: kernel-doc: validate kernel-doc markup
 with the actual names
Message-ID: <20201105150017.GL17076@casper.infradead.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <a21343a7012c87391c4850bf3151ebd82add8d1c.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a21343a7012c87391c4850bf3151ebd82add8d1c.1603469755.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 23, 2020 at 06:33:43PM +0200, Mauro Carvalho Chehab wrote:
> Kernel-doc currently expects that the kernel-doc markup to come
> just before the function/enum/struct/union/typedef prototype.
> 
> Yet, if it find things like:
> 
> 	/**
> 	 * refcount_add - add a value to a refcount
> 	 * @i: the value to add to the refcount
> 	 * @r: the refcount
> 	 */
> 	static inline void __refcount_add(int i, refcount_t *r, int *oldp);
> 	static inline void refcount_add(int i, refcount_t *r);
> 
> Kernel-doc will do the wrong thing:

I wonder if we could change kernel-doc to be (optionally) less verbose.
If we allowed people to write:

/**
 * Add a value to a refcount.
 * @i: The value to add to the refcount
 * @r: The refcount
 */

and had the kernel-doc script pick up the name of the following function
automatically, would that be an improvement we could all agree on?
