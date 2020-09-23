Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BA1C2D0A8
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 10:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87D4C20C56
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600857299;
	bh=kwj+MhVObNQUm9nV5n/DvTgTBurF6if/3blRrCazPoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kFj2wN556hcsGjg891NjfK9BPmY8R0xglx7gQmn7RtRWSZCL69fvSsezgvdOgS/Cv
	 WlDnbEPeDVh5SpFnGyY1yksZ8zWxGlhFAgWc6tm5SbuVraM/H+R5+8pBeKNEPsgtlS
	 2xa+sxsljJ5n29nwJkkOYvnWe+BvUTRxKmsU2qfw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIWKe7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 06:34:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgIWKe6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Sep 2020 06:34:58 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B35C20C56;
        Wed, 23 Sep 2020 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600857298;
        bh=kwj+MhVObNQUm9nV5n/DvTgTBurF6if/3blRrCazPoM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xdbg6wKNVEGs6d04CD1hC1IfvkMepKP+DMKIX387XT1DMnoXcFNRJlaeqj0RCrsEq
         tEIjC6R/w8+zoNksdbIH7KuC6CuyueTi9JU6LXp7UJB4F21/kzZj2vbNehcU8LdpHT
         IRvvZkD6zLKLrYhNuPphGjbr0R9hJmWf+7oopgdA=
Date:   Wed, 23 Sep 2020 12:35:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, keescook@chromium.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/11] counters: Introduce counter and counter_atomic
Message-ID: <20200923103517.GJ3154647@kroah.com>
References: <cover.1600816121.git.skhan@linuxfoundation.org>
 <e57eb89132000b255b5a7952cb82725ec2f3e4e0.1600816121.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e57eb89132000b255b5a7952cb82725ec2f3e4e0.1600816121.git.skhan@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 22, 2020 at 07:43:30PM -0600, Shuah Khan wrote:
> Introduce Simple atomic and non-atomic counters.
> 
> There are a number of atomic_t usages in the kernel where atomic_t api
> is used strictly for counting and not for managing object lifetime. In
> some cases, atomic_t might not even be needed.
> 
> The purpose of these counters is twofold: 1. clearly differentiate
> atomic_t counters from atomic_t usages that guard object lifetimes,
> hence prone to overflow and underflow errors. It allows tools that scan
> for underflow and overflow on atomic_t usages to detect overflow and
> underflows to scan just the cases that are prone to errors. 2. provides
> non-atomic counters for cases where atomic isn't necessary.
> 
> Simple atomic and non-atomic counters api provides interfaces for simple
> atomic and non-atomic counters that just count, and don't guard resource
> lifetimes. Counters will wrap around to 0 when it overflows and should
> not be used to guard resource lifetimes, device usage and open counts
> that control state changes, and pm states.
> 
> Using counter_atomic to guard lifetimes could lead to use-after free
> when it overflows and undefined behavior when used to manage state
> changes and device usage/open states.
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  Documentation/core-api/counters.rst | 158 +++++++++++++
>  MAINTAINERS                         |   7 +
>  include/linux/counters.h            | 343 ++++++++++++++++++++++++++++
>  lib/Kconfig                         |  10 +
>  lib/Makefile                        |   1 +
>  lib/test_counters.c                 | 283 +++++++++++++++++++++++

Tests for new apis, nice!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
