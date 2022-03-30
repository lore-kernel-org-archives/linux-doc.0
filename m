Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD32C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 30 Mar 2022 19:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiC3Tpx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Mar 2022 15:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiC3Tpw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Mar 2022 15:45:52 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F164338B
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 12:44:06 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1E0F0732;
        Wed, 30 Mar 2022 19:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1E0F0732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1648669446; bh=47F2MjwMpR+EX8JHricGZIG1m+iz4vXWVyu5fB/95kc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=A38UzKJoySXwVGK3ZveJp18CG62bU1QzFSilHijE59SL0JTh6i5VTE2EmgqpZRUtz
         R005QRmuGvA78tSRa07CA+U940M8lT861h7F5alc63ag/2ETT19brdomzLM6OodDRG
         Tkhhd5b9tKYmaUCJZGGCxHsV0cS9g0F//mQxZYQ4E+4DMS/awPDXilvHmWV1RTE0h9
         m/0kVru+bkx8kOR8iX1EDYtUMJ5/z/MIRp8zmF/cKtzDc1DVS7LIiPBNboB5FcOn0r
         yoLSkYrMp2ASkXV+fkbXcCaYN2Ho2S9hsDQUAhuJLrqsP3DpGbLaG1wQnD+dbbwbgh
         B3ExKbTUuBKng==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
In-Reply-To: <29a61fd1-d736-4dc2-58d7-3cfec6e2bcfe@gmail.com>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net>
 <29a61fd1-d736-4dc2-58d7-3cfec6e2bcfe@gmail.com>
Date:   Wed, 30 Mar 2022 13:44:05 -0600
Message-ID: <87lewr2pkq.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

>> It's probably time to consider a bump there, but that is a bigger one
>> than I would want to do at this point.  So I'll just fast-track this
>> patch in; dropping it into the stable updates probably makes sense too.
>
> This can be applied cleanly for Linux>=5.15.
> For 5.10.x, there is a dependent commit:
>
>     37397b092e7f ("docs: sphinx-requirements: Move sphinx_rtd_theme to top")
>
> Linux 5.4.x needs another one:
>
>     d5afc9640a6d ("docs: update recommended Sphinx version to 2.4.4")
>
> ... and so on.
>
> How far do you want to backport this?

Ah...thanks for pointing that out.  I don't think it's worth dragging in
other commits, so 5.15 is it, I guess.

jon
