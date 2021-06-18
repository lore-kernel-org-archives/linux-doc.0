Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C10C48BDF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 14:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14EA86124C
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 14:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbhFROgO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Jun 2021 10:36:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234482AbhFROgO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Jun 2021 10:36:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E015C61260;
        Fri, 18 Jun 2021 14:34:03 +0000 (UTC)
Date:   Fri, 18 Jun 2021 15:34:01 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Rustam Kovhaev <rkovhaev@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: kmemleak: add more details about kmemleak usage
Message-ID: <20210618143401.GD16116@arm.com>
References: <20210617210420.392412-1-rkovhaev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617210420.392412-1-rkovhaev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 17, 2021 at 02:04:20PM -0700, Rustam Kovhaev wrote:
> a user may need to initiate a manual scan twice via debugfs before
> kmemleak reports an orphan object.
> this is mentioned in Testing section, let's mention this again in the
> Usage section for better visibility.
> 
> Link: https://lore.kernel.org/lkml/YMpEtyUP0vuWo9HV@nuc10/
> Signed-off-by: Rustam Kovhaev <rkovhaev@gmail.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
