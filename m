Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09038C4708F
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 22:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1461613AD
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 22:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbhFAWss (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 18:48:48 -0400
Received: from ms.lwn.net ([45.79.88.28]:45660 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234799AbhFAWsr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Jun 2021 18:48:47 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9525D2CD;
        Tue,  1 Jun 2021 22:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9525D2CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622587625; bh=xIMGEeNC0jwgcpsFBDrTov+x2OwU5vVVEkoYch3fMRg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TnEMRgbBLQmN4AaGvRUrde9xPesPE+TG9OoYGNH4Cg1bqyrWIioF4DETRFtIAz5N9
         ewOInBMW+qQbRQlqSWj37t26VZskR7Q19ulmKC4mH8llqj7jXGl6See4hKkM8aJ9nh
         fXegrrkoguM6+GhPZnwXwzCn8q0akWwdqaWhfUelYavAWtYsnrR0Qpy7nZqJQlwmjW
         J4EQKwN2foaQN8emUNgAoXl2TvI7YaSkNUUo4Jh8ZX10cRvUwABOMRyYITvBB+pbzF
         XuwJ+8mDxR6IsTvezrUSBhZxIUAhEE/2KptoRCQmFQ0z0wLs6ODDHcrO30gmMbxQ5g
         yc9U7ENZheEOw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Christopher Brannon <cmbrannon@cox.net>,
        William Hubbs <w.d.hubbs@gmail.com>,
        collins@gene3.ait.iastate.edu,
        Steve Holmes <steve.holmes88@gmail.com>
Cc:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        gregkh@linuxfoundation.org, grandmaster@al2klimov.de,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: Convert the Speakup guide to rst
In-Reply-To: <20210601223743.carif4gkzcz5jo7j@begin>
References: <20210531215737.8431-1-igormtorrente@gmail.com>
 <875yyxbenm.fsf@meer.lwn.net> <20210601220643.uzep2ju2zlcmpa57@begin>
 <874keh9qk9.fsf@meer.lwn.net> <20210601223743.carif4gkzcz5jo7j@begin>
Date:   Tue, 01 Jun 2021 16:47:05 -0600
Message-ID: <87mts98aom.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Samuel Thibault <samuel.thibault@ens-lyon.org> writes:

> So we'd need Gene's, Christopher's, William's, and Steve's ack on adding
> the GPL alternative to the GFDL-1.2 licence.

That would be great.

One other thing that crosses my mind...we'll need to remove the GFDL
license text as well.  That's already technically a violation to have
within a GFDL-licensed document, since it cannot be distributed under
the terms of that license.  We have the GFDL text already in
LICENSES/deprecated/GFDL-1.2 if you want to refer to it (but the SPDX
tag is sufficient for that as well).

Thanks,

jon
