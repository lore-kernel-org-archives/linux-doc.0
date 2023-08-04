Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093EAC001DE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 05:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbjHDFP3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 01:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbjHDFNu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 01:13:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EBF4EC8;
        Thu,  3 Aug 2023 22:11:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD43761F30;
        Fri,  4 Aug 2023 05:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56FCC433CA;
        Fri,  4 Aug 2023 05:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691125891;
        bh=rIc4ykozsRDsPZ/g7jjpJL65quJxsmAmBoYsUCDt6Uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GsPQ9sJj+BMjgLYDrtlUIV3yX0951lFO+k5APdOoLe+flQ20VExPN3T/l8Yi34LrE
         F4gj3NDSUpxX1oFTvIGSBTADlGx854oRjgB1sZxwrHuq+x0LodOqWMEhR2KTQgdufg
         KQ67s5YTdQlvx3qy8zPLY+w2OZlWthOZKbv9hcmI=
Date:   Fri, 4 Aug 2023 07:11:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, tech-board@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
Subject: Re: [Tech-board] [PATCH] docs: Add a section on surveys to the
 researcher guidelines
Message-ID: <2023080409-certified-matter-da37@gregkh>
References: <87il9v7u55.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87il9v7u55.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 03, 2023 at 02:23:02PM -0600, Jonathan Corbet wrote:
> It is common for university researchers to want to poll the community with
> online surveys, but that approach distracts developers while yielding
> little in the way of useful data.  Encourage alternatives instead.
> 
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
