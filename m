Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3D8CD54AB
	for <linux-doc@archiver.kernel.org>; Tue, 19 Sep 2023 08:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbjISIyy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Sep 2023 04:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjISIym (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Sep 2023 04:54:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688D0131;
        Tue, 19 Sep 2023 01:53:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5274DC433C8;
        Tue, 19 Sep 2023 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1695113619;
        bh=vaM9XujXeErMiUJR9Emy3Wd84QrswDsnFHmrPWGnP3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FLLd6uXlkKnqZAu62F3c58mAiaRiXosNiF5hIo21358ZlBPBD4qiGGE2f3enJQr5W
         NtCZHbIOEzvJ+KnApf4ohCucCzLHkGRITaqzQngWn+AhqPvKIYI+teqtdpJJ408jex
         8wpPlHGBHuDksEdxhORGUvFrzjmO8NPpyjjNt6l4=
Date:   Tue, 19 Sep 2023 10:53:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ivan Orlov <ivan.orlov0322@gmail.com>
Cc:     perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
        alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
Message-ID: <2023091917-zippy-alienate-3efc@gregkh>
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
 <20230918181044.7257-2-ivan.orlov0322@gmail.com>
 <2023091955-dried-popsicle-f3d8@gregkh>
 <56a4a085-6b1d-19c6-4160-4513c8c41e57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56a4a085-6b1d-19c6-4160-4513c8c41e57@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 19, 2023 at 12:46:34PM +0400, Ivan Orlov wrote:
> By the way, is there any way to detect such issues automatically? I've seen
> that the kernel test robot detects a lot of similar stuff, perhaps there is
> any tools/linters which can be set up locally?

Not that I know of, sorry, I rely on the kernel test robot for lots of
these things :)

But, the robot is running all open tests, so dig into the public repo of
it to see what it is using and perhaps run those tests locally?  Lots of
them are just different build options and running sparse.

thanks,

greg k-h
