Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0052C54FD0
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 10:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9903420679
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587465364;
	bh=+838GLrmI0oqy49oTTR+LVdWKauHyeH6Gcy/YBpQd2g=;
	h=Date:From:To:Subject:In-Reply-To:References:List-ID:From;
	b=uCMKj/7SBqXQo9wYTWDDtglrrb/heHLlmrpH3p24GOO4R73A0vSbGx3KAbsuZkxbh
	 DcueuaMAWDc5l3vro+IIk45Im8sDCjjx5Ez7kqkavt2SVIOqyBcLQJNWQV5ot2vWNL
	 pVQ8bm/YEt9DPhmLSETvgv8yxEEiTynCKtJxzNNo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgDUKgE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 06:36:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:33730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgDUKgD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 06:36:03 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 604F220663;
        Tue, 21 Apr 2020 10:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587465363;
        bh=+838GLrmI0oqy49oTTR+LVdWKauHyeH6Gcy/YBpQd2g=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=Sn6fIrhlXte9LYFQzrBxXheUQuiTLmj4MjNRiyJftb2w6p8of3WZnUGeDMMkujEUZ
         7eq+x1XWPGbn1QygTxFg+y5bJfQ59ruyGyPRA0EynJKq7LsBA0N7VCrGhR0yvupXKf
         CFtOjkxiOaz487aEGf0QHCJW3nRm44QKHz0dqxFY=
Date:   Tue, 21 Apr 2020 12:35:59 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: Path troubles when using SPHINXDIRS option
Message-ID: <20200421123559.2c0be5ce@coco.lan>
In-Reply-To: <20200421103814.4e0fa4c3@coco.lan>
References: <20200421103814.4e0fa4c3@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 21 Apr 2020 10:38:14 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Hi,
> 
> While building from v5.7-rc2 + media, I noticed that SPHINXDIRS option
> stopped working.
> 
> What happens is that, if we don't pass this option, Sphinx assumes that
> the "absolute" path is "Documentation/". So, include options like this:
> 
> 	.. include:: /ABI/stable/firewire-cdev
> 	    :literal:
> 
> 
> would be evaluated as Documentation/ABI/stable/firewire-cdev if built
> without SPHINXDIRS. However, if we do SPHINXDIRS=driver-api, then
> the "absolute" patch would be "Documentation/driver-api", causing this
> error:
> 
> 	Sphinx parallel build error:
> 	docutils.utils.SystemMessage: /devel/v4l/patchwork/Documentation/driver-api/firewire.rst:22: (SEVERE/4) Problems with "include" directive path:
> 
> This is specially bad for build jobs (like one we have on jenkins that
> is meant to test media patches), as, due to some Sphinx bug, prevents
> sphinx-build to stop, making the toolset to run forever.
> 
> I suspect that some change at conf.py could address the path issue.
> 
> I'll try to investigate further.

More updates on it:

It seems that the main issue is that Sphinx passes Documentation/foo
to docutils, when SPHINXDIRS=foo is used, and docutils prevent
access anything outside Documentation/foo on its include and toctree
directives.

So, even trying to use "../ABI/some_doc" would fail.

-

The other issue is that SphinxParallelError doesn't stop the
build multithreading tasks. As Documentation/docutils.conf is set to 
abort on severe errors, this causes Sphinx to keep running forever,
doing nothing.

I did already a workaround to prevent media Jenkins job to hang
due to those issues. So, I'm moving on. Hopefully, someone with
more experience with Sphinx, docutils and python multithreading
can work on some fixes for it.

Thanks,
Mauro
