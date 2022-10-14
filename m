Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC45C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 14 Oct 2022 17:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbiJNRlL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Oct 2022 13:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJNRlK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Oct 2022 13:41:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AE1240AB;
        Fri, 14 Oct 2022 10:41:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF95861BE9;
        Fri, 14 Oct 2022 17:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAF9C433C1;
        Fri, 14 Oct 2022 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665769268;
        bh=wUNTVERFE4YQwE0OB8nJQ2ksPGOcHHh82X6O7VEpQQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HzmcG6jv5bCeEkBXiLxNn7O65Bp/JLjZf3jF7p1y1BRRmqC5jK/dRseqn2l2wksXi
         1EMmHLo01H4DIIhzQo5x7lpFLAi+bgyTXcuxz3eVtA6Z/4cBEehPUUQN0sfVruWOnG
         cGA/l6PyVVdRLPOdi8cUXpgXBrMnjj66Uj7VyJiU=
Date:   Fri, 14 Oct 2022 19:41:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ben Hutchings <ben@decadent.org.uk>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <code@tyhicks.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] Documentation: process: replace outdated LTS table w/
 link
Message-ID: <Y0mfYMN81NG4r/xQ@kroah.com>
References: <Y0mSVQCQer7fEKgu@kroah.com>
 <20221014171040.849726-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014171040.849726-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 14, 2022 at 10:10:40AM -0700, Nick Desaulniers wrote:
> The existing table was a bit outdated.
> 
> 3.16 was EOL in 2020.
> 4.4 was EOL in 2022.
> 
> 5.10 is new in 2020.
> 5.15 is new in 2021.
> 
> We'll see if 6.1 becomes LTS in 2022.
> 
> Rather than keep this table updated, it does duplicate information from
> multiple kernel.org pages. Make one less duplication site that needs to
> be updated and simply refer to the kernel.org page on releases.
> 
> Suggested-by: Tyler Hicks <code@tyhicks.com>
> Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Changes v1 -> v2:
> * Rather than update table, use a link as per Tyler and Bagas.
> * Carry forward GKH's SB tag.

Looks great, thanks!
