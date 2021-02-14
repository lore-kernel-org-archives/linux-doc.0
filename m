Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3B5C433E0
	for <linux-doc@archiver.kernel.org>; Sun, 14 Feb 2021 16:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FC89600EF
	for <linux-doc@archiver.kernel.org>; Sun, 14 Feb 2021 16:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhBNQ6Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 14 Feb 2021 11:58:24 -0500
Received: from smtprelay0168.hostedemail.com ([216.40.44.168]:43844 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229637AbhBNQ6Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 14 Feb 2021 11:58:24 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id EDC4B18029299;
        Sun, 14 Feb 2021 16:57:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: place77_161588327634
X-Filterd-Recvd-Size: 2333
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Sun, 14 Feb 2021 16:57:41 +0000 (UTC)
Message-ID: <b2e25e683a3e2f31d4dc2d666e082634e30643b3.camel@perches.com>
Subject: Re: [PATCH RFC v3 2/3] docs: add documentation for checkpatch
From:   Joe Perches <joe@perches.com>
To:     Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc:     linux-doc@vger.kernel.org, lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Date:   Sun, 14 Feb 2021 08:57:40 -0800
In-Reply-To: <20210213131513.51386-3-dwaipayanray1@gmail.com>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
         <20210213131513.51386-3-dwaipayanray1@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 2021-02-13 at 18:45 +0530, Dwaipayan Ray wrote:
> Add documentation for kernel script checkpatch.pl.
> This documentation is also parsed by checkpatch to
> enable a verbose mode.
> 
> The message types in checkpatch are documented with rst
> field lists. A total of 33 checkpatch type descriptions
> are added.

Alphabetic ordering isn't that great for these entries.
Please group them by use:

whitespace/code layout style:
SPACING, TRAILING_WHITESPACE, LINE_SPACING

commit message defects:
BAD_SIGN_OFF, BAD_STABLE_ADDRESS_STYLE, COMMIT_COMMENT_SYMBOL, COMMIT_MESSAGE

Allocation style:
group: ALLOC_ARRAY_ARGS, ALLOC_SIZEOF_STRUCT, ALLOC_WITH_MULTIPLY

> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
[]
> +4 Type Descriptions
> +-------------------
> +
> +This section contains a description of all the message types in checkpatch.
> +
> +.. Types in this section are also parsed by checkpatch.
> +.. Please keep the types sorted alphabetically.
> +
> +:ALLOC_ARRAY_ARGS:
> +  The first argument for kcalloc or kmalloc_array should be the
> +  number of elements.  sizeof() as the first argument is generally
> +  wrong.

If you look at the generated .html file, the output format  is poor.

It would probably be better to use
**<TYPE>**
for each of these blocks instead of
:<TYPE>:

and update the script appropriately.

