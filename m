Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CDAC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 13:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01DB361261
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 13:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237243AbhEQNTe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 09:19:34 -0400
Received: from smtprelay0156.hostedemail.com ([216.40.44.156]:60634 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235741AbhEQNTe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 09:19:34 -0400
Received: from omf11.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 4B13D8E47;
        Mon, 17 May 2021 13:18:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id EEA5F20A29C;
        Mon, 17 May 2021 13:18:15 +0000 (UTC)
Message-ID: <da2750b272ce3fd5bc52572036a41c427196c11f.camel@perches.com>
Subject: Re: [PATCH v3] Documentation: checkpatch: add description if no
 filenames are given
From:   Joe Perches <joe@perches.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 17 May 2021 06:18:13 -0700
In-Reply-To: <1621243800-27702-1-git-send-email-yangtiezhu@loongson.cn>
References: <1621243800-27702-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: EEA5F20A29C
X-Stat-Signature: uqwgz8pwa5gjz7yiihkm7ifkrzyf4jwn
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Bsuw/kvhPxzWmKVCCENV5N38rY/sSK9Y=
X-HE-Tag: 1621257495-726854
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2021-05-17 at 17:30 +0800, Tiezhu Yang wrote:
> After commit 45107ff6d526 ("checkpatch: if no filenames then read stdin"),
> if no filenames are given, it will read patch from stdin rather than exit
> directly. This means the script waits for input indefinitely, which
> confuses new checkpatch users at first.
> 
> Add some basic documentation on this behaviour of checkpatch to lower
> the confusion.

You might also consider adding something to the
checkpatch --help content in checkpatch itself.

> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
[]
> @@ -22,6 +22,8 @@ Usage::
>  
>    ./scripts/checkpatch.pl [OPTION]... [FILE]...
> 
> +When FILE is -, or absent, checkpatch reads from standard input.
> +
>  Available options:


