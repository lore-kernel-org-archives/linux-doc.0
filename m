Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A29C4332F
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 10:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiLCKfs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 05:35:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiLCKfr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 05:35:47 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB5C3E0BF;
        Sat,  3 Dec 2022 02:35:46 -0800 (PST)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 05808536;
        Sat,  3 Dec 2022 10:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 05808536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1670063746; bh=goHac4FskvmXCbJX1Nix3zvxWwkUM/OEHx0CYZfBl5Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mBnle8lcpJUp3rpqKrmoHJLl4QE8qx/rzY0g/PiP6HH1FblZJXZS9f65A/pROryx9
         I+kxzRyfZ8TdnlRtWS3zLZjiIFVJQdoZFojdudcPX8ftXggquI2BpzXv3iwK2KDAcx
         UO1XcWne3GqxyEnhWwdjHiy5k+Wsm6Vh2DwLdC2vSYtRmbFme6OqILqzI3HP5CJQV0
         0H23rMnHn1UI8qowjYWbOX5AkJ3gdzX6bYWoa3+2lWOzXJaXJ128WvhLtnmYQsJjdX
         Porvdca/K/FIFHxEiUgav9peHP45FM95/3kZg/BVNE+huA4Rzla3r8mTr/AcugSsGi
         g0tnHeP/JNGxA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        oe-kbuild-all@lists.linux.dev,
        Ammar Faizi <ammarfaizi2@gnuweeb.org>,
        GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Documentation/osnoise: escape underscore of NO_ prefix
In-Reply-To: <20221128155044.617f8416@gandalf.local.home>
References: <202211240447.HxRNftE5-lkp@intel.com>
 <20221125034300.24168-1-bagasdotme@gmail.com>
 <871bacc9-6c0b-9841-107e-da60a2c8e01e@kernel.org>
 <20221128155044.617f8416@gandalf.local.home>
Date:   Sat, 03 Dec 2022 03:35:39 -0700
Message-ID: <877cz8pyf8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Steven Rostedt <rostedt@goodmis.org> writes:

> Jon,
>
> Care to take this?
>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

I was about to, but it doesn't apply here.  The problem being fixed
seemingly came in through your tree and currently only exists in
linux-next, so I think you need to apply it.

Thanks,

jon
