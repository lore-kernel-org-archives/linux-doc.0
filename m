Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB93C55181
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 08:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7AFC20B1F
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587458300;
	bh=Qr5FUfaB4owUP9VXnUWfA2uwlu3TEsj3sRzKuBkauHI=;
	h=Date:From:To:Subject:List-ID:From;
	b=bCLuFwUDXayqJdsdx745o/HfWCFJCEpgDo5acXCILLkFPqMsh6hWEWaofLzWoRyCy
	 yTg+KZjJOOAhfmeZ9UdhYaeaPuYZpmlC6pBw4+6lEMow8/iqsB9cF/ClA7cxJie9o0
	 Xy/YqHj1EgXWWMRq7eG0TU+MZyxbouvKal2xbKiE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgDUIiU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 04:38:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbgDUIiT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 04:38:19 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A943520CC7;
        Tue, 21 Apr 2020 08:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587458298;
        bh=Qr5FUfaB4owUP9VXnUWfA2uwlu3TEsj3sRzKuBkauHI=;
        h=Date:From:To:Subject:From;
        b=own2jJhl+ToBPOWgMB1PgRoC+urAs2kipKFXva6VzBzWpRqJ8Z+4ALb7avYbeufb3
         yPtn/GQiuXAX2Aq/zsqmQAbwr+cU++/5M0R6KyQqJgmYo5s8XijJyIGAyHqSJdhRed
         yA7LhVv9ySVbmHR4evadBnkEDEEE90ryRFlYQgUw=
Date:   Tue, 21 Apr 2020 10:38:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Path troubles when using SPHINXDIRS option
Message-ID: <20200421103814.4e0fa4c3@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi,

While building from v5.7-rc2 + media, I noticed that SPHINXDIRS option
stopped working.

What happens is that, if we don't pass this option, Sphinx assumes that
the "absolute" path is "Documentation/". So, include options like this:

	.. include:: /ABI/stable/firewire-cdev
	    :literal:


would be evaluated as Documentation/ABI/stable/firewire-cdev if built
without SPHINXDIRS. However, if we do SPHINXDIRS=driver-api, then
the "absolute" patch would be "Documentation/driver-api", causing this
error:

	Sphinx parallel build error:
	docutils.utils.SystemMessage: /devel/v4l/patchwork/Documentation/driver-api/firewire.rst:22: (SEVERE/4) Problems with "include" directive path:

This is specially bad for build jobs (like one we have on jenkins that
is meant to test media patches), as, due to some Sphinx bug, prevents
sphinx-build to stop, making the toolset to run forever.

I suspect that some change at conf.py could address the path issue.

I'll try to investigate further.

Just to be 100% sure that this is not some version-specific bad
behavior, I tested (using the latest patch version) Sphinx from
version 1.7.9 up to 2.4.4. The same two errors happen on all
versions.

Markus,

Maybe you may have some idea about how to fix those issues.

The parallel build error would likely require fixing something
inside Sphinx code, making it abort if it gets a "SEVERE" error.

Regards,
Mauro
