Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D921E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun,  4 Aug 2019 00:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbfHDAWA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 3 Aug 2019 20:22:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbfHDAWA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 3 Aug 2019 20:22:00 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 046C52087C;
        Sun,  4 Aug 2019 00:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564878119;
        bh=IGpBwgR5XcH5gav/JzYjv9T3JfVw2oR4QfQ/k93nyYg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=OniBmjTgg/h5un7/sziCUtQeYJ5MOo4hf5F6nxNXEOwzVEhcjn9exE+86bos4M9VP
         MuCrqSRwh2JMHRC0lzltLSy7TK9u5ZntCLltsmSJM/+LuCHUJYW4Y+ILPfq4o4tc2W
         195JEuFjtkQydcqCQKQxdRp0xTQ+Ok1mshPDCtp8=
Date:   Sun, 4 Aug 2019 02:21:55 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        security@kernel.org, linux-doc@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] Documentation/admin-guide: Embargoed hardware security
 issues
In-Reply-To: <nycvar.YFH.7.76.1908040214090.5899@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.1908040220450.5899@cbobk.fhfr.pm>
References: <20190725130113.GA12932@kroah.com> <nycvar.YFH.7.76.1908040214090.5899@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 4 Aug 2019, Jiri Kosina wrote:

> On Thu, 25 Jul 2019, Greg Kroah-Hartman wrote:
> 
> > To address the requirements of embargoed hardware issues, like Meltdown,
> > Spectre, L1TF, etc. it is necessary to define and document a process for
> > handling embargoed hardware security issues.
> 
> I don't know what exactly went wrong, but there is a much more up-to-date 
> version of that document (especially when it comes to vendor contacts), 
> which I sent around on Thu, 2 May 2019 20:23:48 +0200 (CEST) already. 
> Please find it below.
> 
> 
> 
> From: Jiri Kosina <jkosina@suse.cz>

And this should've been

	From: Thomas Gleixner <tglx@linutronix.de>

as Thomas wrote most part of the text of course.

Sorry for the noise,

-- 
Jiri Kosina
SUSE Labs

