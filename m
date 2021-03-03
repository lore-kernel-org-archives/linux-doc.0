Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E27C433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83B8664EEC
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1451182AbhCDAal (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:30:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:34642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236430AbhCCOHF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Mar 2021 09:07:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C686764EAE;
        Wed,  3 Mar 2021 14:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614780360;
        bh=Dp0+D625HwAqvxI89RK1lqFQ0TMsmccmmw5X2AV2AqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xxJcA485F5jgnpF+bBLXnNgks0su/Sl0PRgMADE7m/ptDwGJNSX26wM6eextQlun9
         iyxOKNSGbKnvSJfGzXpesfvbixiMru1o9ms6VqsmSUnbqa0fK1COCrCZK7DUCT5827
         xVwj1KXxkqePMJ8sTxlm2UP0UwBDs4CGMGToUT4Q=
Date:   Wed, 3 Mar 2021 15:05:57 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: driver-model: device: Add helper macro examples
Message-ID: <YD+XxZ2/8vPeDt05@kroah.com>
References: <20210303133845.3939403-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303133845.3939403-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 03, 2021 at 02:38:43PM +0100, Geert Uytterhoeven wrote:
> 	Hi Jon, Greg, Rafael,
> 
> The DEVICE_ATTR_* and ATTRIBUTE_GROUPS() helper macros have existed for
> more than a decade, but are still not mentioned in the driver-model
> device documentation.  Hence this patch series adds them, including
> examples, to the documentation.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (2):
>   docs: driver-model: device: Add DEVICE_ATTR_{RO,RW} examples
>   docs: driver-model: device: Add ATTRIBUTE_GROUPS() example

Thanks for adding these:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
