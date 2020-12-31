Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DCEC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 31 Dec 2020 22:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F15442076E
	for <linux-doc@archiver.kernel.org>; Thu, 31 Dec 2020 22:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgLaWwa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Dec 2020 17:52:30 -0500
Received: from ms.lwn.net ([45.79.88.28]:37932 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726779AbgLaWwa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 31 Dec 2020 17:52:30 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E1317385;
        Thu, 31 Dec 2020 22:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E1317385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1609455110; bh=M2zxpxkyVC/J7cMQNyBeprh14ga8BXVuohvfGySyqAg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bp70MrmVEPLCcp1UI5wyOCJkFVFEyWApvlvbgDtizp1Z08Kq6u18SO+tI4hy0kNRG
         CJVl7y80NAVjmvVVR6LnUTpPBeQ2LUSJFnre/iHkKn3L8MOE8hGtSHEUD1pjWornLV
         MNNVkAQUDJjQSQG/+q5iirJRl4q41rUWiRNLhmZgbCEHgKrruZ0M/HduY3VHptQQxE
         az5LrZGS5gtJbmdbG4IJKkbppd1QXaSZqCG4aZcE3PBCcBQpd4oOg13XMS5B0BkqwK
         JpiBkOOW04GxX4q1PwBhPMO66zQu0yj3UDaFVOWNt1ozkPi1gMM7T5uTyFKddrjedU
         jK+mxAxVnTCYA==
Date:   Thu, 31 Dec 2020 15:51:48 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] atomic: remove further references to atomic_ops
Message-ID: <20201231155148.4b74e863@lwn.net>
In-Reply-To: <20201220060927.21582-1-lukas.bulwahn@gmail.com>
References: <20201220060927.21582-1-lukas.bulwahn@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 20 Dec 2020 07:09:27 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit f0400a77ebdc ("atomic: Delete obsolete documentation") removed
> ./Documentation/core-api/atomic_ops.rst, but missed to remove further
> references to that file.
> 
> Hence, make htmldocs warns:
> 
>   Documentation/core-api/index.rst:53: WARNING:
>   toctree contains reference to nonexisting document 'core-api/atomic_ops'
> 
> Also, ./scripts/get_maintainer.pl --self-test=patterns warns:
> 
>   warning: no file matches    F:    Documentation/core-api/atomic_ops.rst
> 
> Remove further references to ./Documentation/core-api/atomic_ops.rst.
> 
> Fixes: f0400a77ebdc ("atomic: Delete obsolete documentation")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

I've applied this, thanks.

jon
