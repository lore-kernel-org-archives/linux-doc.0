Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05087C4361B
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:50:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B461A23B99
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgLHRuZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 12:50:25 -0500
Received: from ms.lwn.net ([45.79.88.28]:38912 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbgLHRuZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 Dec 2020 12:50:25 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1D9BE300;
        Tue,  8 Dec 2020 17:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1D9BE300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607449784; bh=6OeIccjT8navNqk1ywiJAFEwFR9443hfeELt6U7X4SM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HQQa/xhg5xUHtfs9cQTgeCHCl2iHqCpuNrmMFvnZEMXe3fPLlRqwAKo8pNoRrF+98
         EihEOJCAMLYEPiuUtX/MYLD6TaDBuEeQRXpmnCbYwQIcL+Yz2Ia83GO9YX/xKviyvB
         KjmtmlKt+r0taEDbHVSALUeSJi5GVsa8GMr9/oINBCr8fpaXCpbRjqYYQs4w1jEJC1
         iT0jV34Wtn7UDNFtXSEAz3Sld3nJJQxESIJCjK48rJTGNT5ZdrQgicGg3/8w94d0Y4
         lixqeMlaXFEAo+6ZMXyGHCovkk+LWcLsMj2bBmzoOv1yrS6e/06upPhhJvUW+j5NSK
         znxDRQmeILInQ==
Date:   Tue, 8 Dec 2020 10:49:43 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Lee Jones <lee.jones@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] docs: add a reset controller chapter to the driver
 API docs
Message-ID: <20201208104943.499bf52c@lwn.net>
In-Reply-To: <20201201115754.1713-1-p.zabel@pengutronix.de>
References: <20201201115754.1713-1-p.zabel@pengutronix.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  1 Dec 2020 12:57:54 +0100
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Add initial reset controller API documentation. This is mostly intended
> to describe the concepts to users of the consumer API, and to tie the
> kerneldoc comments we already have into the driver API documentation.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.fr>
> ---
> Changes since v1 [1]:
> - Added a note that reset_control_status() does not accept reset control
>   array handles (Randy Dunlap)
> 
> [1] https://lore.kernel.org/lkml/20201117103306.17010-1-p.zabel@pengutronix.de/
> ---
>  Documentation/driver-api/index.rst |   1 +
>  Documentation/driver-api/reset.rst | 221 +++++++++++++++++++++++++++++
>  MAINTAINERS                        |   1 +
>  3 files changed, 223 insertions(+)
>  create mode 100644 Documentation/driver-api/reset.rst

I've applied this, thanks.

jon
