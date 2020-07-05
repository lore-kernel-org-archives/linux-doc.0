Return-Path: <SRS0=xSVA=AQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E804C433E0
	for <linux-doc@archiver.kernel.org>; Sun,  5 Jul 2020 20:14:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8484B20724
	for <linux-doc@archiver.kernel.org>; Sun,  5 Jul 2020 20:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgGEUOq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Jul 2020 16:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbgGEUOq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Jul 2020 16:14:46 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05757C061794
        for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2020 13:14:46 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C07342E4;
        Sun,  5 Jul 2020 20:14:45 +0000 (UTC)
Date:   Sun, 5 Jul 2020 14:14:44 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tobias Klauser <tklauser@distanz.ch>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/features: Add kcov
Message-ID: <20200705141444.354cdb23@lwn.net>
In-Reply-To: <20200627092300.29438-1-tklauser@distanz.ch>
References: <20200627092300.29438-1-tklauser@distanz.ch>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 27 Jun 2020 11:23:00 +0200
Tobias Klauser <tklauser@distanz.ch> wrote:

> Add an arch support status file for kcov (ARCH_HAS_KCOV).
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  .../features/debug/kcov/arch-support.txt      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/features/debug/kcov/arch-support.txt

Applied, thanks.

jon
