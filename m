Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C4BCA7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 03:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753975AbeEHDHk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 23:07:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:56934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753958AbeEHDHi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 23:07:38 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E62F21742;
        Tue,  8 May 2018 03:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1525748858;
        bh=8d3kpyaJJRmlPwVZ1GZBvNCkcypBgyv2h2QhVMWDb14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G/Lv8+dlFTf0VRB00duCFSOBTnorfHf/+SOhhTWUVufZuwiM9w+/y5pvSNRPrRWLw
         goztdYsGpYH0pCb4xHzxbeEGsX8SDaaKITRaedZD80qS1fo3Dsm/vHTanWvYJS1CoD
         dQDEX8wgNOdK9jvMGWS/CQ4wjm82hCEMPDkdpeRg=
Date:   Tue, 8 May 2018 05:07:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Masanari Iida <standby24x7@gmail.com>,
        linux-pm@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 02/18] docs: fix location of request_firmware & friends
Message-ID: <20180508030724.GB1882@kroah.com>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <9e40d0b3a085a937b42ec60a3b2409cf820ca713.1525684985.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e40d0b3a085a937b42ec60a3b2409cf820ca713.1525684985.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 07, 2018 at 06:35:38AM -0300, Mauro Carvalho Chehab wrote:
> commit 5d6d1ddd2730 ("firmware: move firmware loader into its own directory")
> and other commits renamed the old firmware_class.c file and split it
> into separate files, but documentation was not changed accordingly,
> causing Sphinx errors.
> 
> Change the location accordingly at the documentation files.
> 
> While here, add a missing entry at request_firmware.rst for
> release_firmware() function.
> 
> Fixes: 5d6d1ddd2730 ("firmware: move firmware loader into its own directory")
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Luis R. Rodriguez <mcgrof@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
