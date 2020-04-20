Return-Path: <SRS0=VSGv=6E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE42C3815B
	for <linux-doc@archiver.kernel.org>; Mon, 20 Apr 2020 06:56:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0045321473
	for <linux-doc@archiver.kernel.org>; Mon, 20 Apr 2020 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587365807;
	bh=NRQSnfI5gnep9vHtivz30a2pSzEbLwZgMLXEO6LT+i0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=Y2i+x/9NC5zmcoiOd++HBBVd1vpjUYRFALjemvjqVJhAe31aZ6MWa9qxiiWAPZ7I6
	 s00Mq7Vq6aRjvEaXD5eJ7y1L0YDf3kya+fQr7R0cChDpAJgL2LiofcbXjQYsfr1wGN
	 585TAKsNN5xzunykV8StEpLbHFfmDn7ZFSexDMPg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDTG4q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Apr 2020 02:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725959AbgDTG4q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Apr 2020 02:56:46 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8366DC061A0C
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2020 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=X/v8Z0YkHiHsX9OtsVssmTwi5zmYAXyf+YH2GZxvCKY=; b=BmjMl8Qf3mmDrWUaea8RATT3R+
        f65Eqv5E1WshwMgCWCAAZeRR36Vz/+EPv0V+mTR+Phi+0tk6KDLIN9ENtqwJ3CXhkhYnFl+iKkpto
        MtGMJgidNqnpywWOnP0ILr9iNyvY8w9YP5qZV9rPEA6v0mb/LrQmic6L6lysUHOMjE9eCioYgKn59
        QjWaGuKKs09DTiLa4D0GrQ+Z8jIaiUPNZG6xfw253OcsUnsW8Fmr52IVWhzwv8rrrbFXMUtIyytmS
        hAGLqQMIPnOcdQwzoPuoVVOkmoxTpbeNdaL5RhSIZmvJXLvVshv8DBoSmRGPQuF9sWTwE98XFB9Tw
        LcV4qEgA==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jQQMG-00031F-N9; Mon, 20 Apr 2020 06:56:45 +0000
Date:   Mon, 20 Apr 2020 08:56:41 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Saheed Bolarinwa <refactormyself@gmail.com>
Cc:     skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
Subject: Re: Clarification on the behaviour of checkpatch.pl
Message-ID: <20200420085641.5d8f1a0b@coco.lan>
In-Reply-To: <445b3e38-123e-eb72-2bbb-c40ac4ea9899@gmail.com>
References: <445b3e38-123e-eb72-2bbb-c40ac4ea9899@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 20 Apr 2020 02:20:19 +0200
Saheed Bolarinwa <refactormyself@gmail.com> escreveu:

> Hello,
> 
> My experience is that checkpatch.pl will not flag some warnings when I use
> 
> the '-f' flag. This especially true for .rst files. My understanding is 
> that this flag
> 
> is needed to use it with a raw source file instead of a patch.
> 
> Please, I will like to confirm if this is a normal behaviour or is it my 
> system setup.
> 
> Below is an example from the current stable release linux-5.6.y
> 
>     [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl -f
>     ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>     total: 0 errors, 0 warnings, 279 lines checked
> 
>     ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst has no
>     obvious style problems and is ready for submission.
> 
> 
>     [saheed@net linux-stable]$ perl ./scripts/checkpatch.pl
>     ./Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
>     WARNING: Possible unwrapped commit description (prefer a maximum 75
>     chars per line)
>     #6:
>     TAA is a hardware vulnerability that allows unprivileged speculative
>     access to
> 
>     ERROR: Does not appear to be a unified-diff format patch
> 
>     total: 1 errors, 1 warnings, 0 lines checked

If you don't use "-f" flag, then you need to pass a patch to checkpatch,
e. g.:

	git show --pretty=email | ./scripts/checkpatch.pl

That's btw what you need to do with all patches you would submit upstream.

The "-f" flag is used only when you want to run a check on an entire file
(and not to the lines modified by a patch).


Thanks,
Mauro
