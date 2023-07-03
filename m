Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B095C2FC2C
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 16:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjGCQs1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 12:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjGCQs0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 12:48:26 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B991B3;
        Mon,  3 Jul 2023 09:48:25 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 453EB380;
        Mon,  3 Jul 2023 16:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 453EB380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1688402905; bh=ga2EVcZjyUVLHKl6pxSbhkekHnekyK0nM7VX3UKTxPw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MxKMymnS/QXZ12hGw7nVY0jv3r80ODCvy5sDCB/WdK1ueibJUGeR7/NV+uschiU4/
         g7w23SwJDPPKcHZfMxr+hm8uWto7D3/vWkpDOkNsNBAQhV5A+3qAO0FB+M4sk7Wh86
         5U6M/LCG6xFhZdR9neBncjDO52tMWrCkrVq06qKcYix2rqnaQBvoInSvyAO4QFiOXq
         LgX/tiViQ9J12Gsw1GyYyzjzii+2EiV3COAvsa7Ba+HyBxz4789DIjagnJo3LHgPaq
         u3A7u4pbbpbFPaJSsNL5SvbU5YWV6o2ygosSNcsuTHOf+2vodQW2rue2N0G2hU1BkS
         wod2AHHL8vXnQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     linux-doc@vger.kernel.org, arkadiusz.kubalewski@intel.com,
        netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH docs] scripts: kernel-doc: support private / public
 marking for enums
In-Reply-To: <20230621223525.2722703-1-kuba@kernel.org>
References: <20230621223525.2722703-1-kuba@kernel.org>
Date:   Mon, 03 Jul 2023 10:48:24 -0600
Message-ID: <875y71j607.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> Enums benefit from private markings, too. For netlink attribute
> name enums always end with a pair of __$n_MAX and $n_MAX members.
> Documenting them feels a bit tedious.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> Hi Jon, we've CCed you recently on a related discussion
> but it appears that the fix is simple enough so posting
> it before you had a chance to reply.
> ---
>  scripts/kernel-doc | 3 +++
>  1 file changed, 3 insertions(+)

Hmm...somehow I missed the discussion, sorry.  Fix applied, thanks.

jon
