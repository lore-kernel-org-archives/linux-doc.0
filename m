Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7115C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  5 Oct 2022 17:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbiJERrt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Oct 2022 13:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbiJERrW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Oct 2022 13:47:22 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D567A7FE4C;
        Wed,  5 Oct 2022 10:46:37 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AB05E385;
        Wed,  5 Oct 2022 17:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AB05E385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664991996; bh=nQzA5w9oXj1A+jXaVnUuiA57UEAL6+T7Qjr8/MkXPug=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XHfr4PVRDRU59DFce1L+LjzMepyZPWkxAHB9hS3d+exIGAbcnzDlT9u9MJj3BVSsJ
         gPbafUXJo67q0mf9KVAk+qM6jLhH3qWhc0BjCte6PHdUI0e8t4+rOp7GZo1oGv9X2f
         5bdLkQZHs6vkVSUDpY1s0Zn1luHTMQKvPpPmGkKnRShXQRhiVIefgTTCljOqCmgTtu
         2lMVm8+bwAU8nqFveLYXfA3a8SReGctOYeb1jc6AqDHL3T8bZS6uCBxUzf45rHbOsX
         wreDKdEYFVf42/XgWwtcSb19CbRk+mclcYxvf97p1IreFNs2PejWnM89GBp8r/PuVY
         ScqP+CeGYJE9Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/5] docs: tweak some Alabaster style parameters
In-Reply-To: <87lepuqixe.fsf@intel.com>
References: <20221004201222.281845-1-corbet@lwn.net>
 <20221004201222.281845-3-corbet@lwn.net> <87lepuqixe.fsf@intel.com>
Date:   Wed, 05 Oct 2022 11:46:35 -0600
Message-ID: <87lepu9n9g.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Tue, 04 Oct 2022, Jonathan Corbet <corbet@lwn.net> wrote:
>> This is just the beginning: tighten up the layout a bit to improve the
>> information density in the browser.  To that end, add a custom.css file to
>> tweak Alabaster CSS settings.
>
> Maybe it's just me, but on the wide 4K screen I have the page_width =
> 940px default is silly narrow.

The real problem, of course, is defining things in terms of pixels to
begin with.  Redefining those things in resolution-independent units
(em, for example) would be an improvement.

When we get our CSS person to show up they can certainly fix that up for
us :)

Thanks,

jon
