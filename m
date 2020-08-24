Return-Path: <SRS0=Idq9=CC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6422DC433DF
	for <linux-doc@archiver.kernel.org>; Mon, 24 Aug 2020 22:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4656D20706
	for <linux-doc@archiver.kernel.org>; Mon, 24 Aug 2020 22:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHXWIz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Aug 2020 18:08:55 -0400
Received: from ms.lwn.net ([45.79.88.28]:56762 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgHXWIy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 24 Aug 2020 18:08:54 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7F91860C;
        Mon, 24 Aug 2020 22:08:54 +0000 (UTC)
Date:   Mon, 24 Aug 2020 16:08:53 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     brandon.jiang.a@outlook.com
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix typo for abituguru documentation
Message-ID: <20200824160853.4b367add@lwn.net>
In-Reply-To: <DM5PR22MB0892E4FEFCA9ED055B0A8E71AC580@DM5PR22MB0892.namprd22.prod.outlook.com>
References: <DM5PR22MB0892E4FEFCA9ED055B0A8E71AC580@DM5PR22MB0892.namprd22.prod.outlook.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 22 Aug 2020 15:46:40 +0800
brandon.jiang.a@outlook.com wrote:

> From: Brandon Jiang <brandon.jiang.a@outlook.com>
> 
> Typo fix for abituguru,abituguru3 and abituguru-datasheet
> 
> Signed-off-by: Brandon Jiang <brandon.jiang.a@outlook.com>
> ---
>  Documentation/hwmon/abituguru-datasheet.rst | 6 +++---
>  Documentation/hwmon/abituguru.rst           | 4 ++--
>  Documentation/hwmon/abituguru3.rst          | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

jon
