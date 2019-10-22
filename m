Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FE7F7D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Oct 2019 17:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730432AbfJVRAi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 Oct 2019 13:00:38 -0400
Received: from ms.lwn.net ([45.79.88.28]:47660 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730363AbfJVRAi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 22 Oct 2019 13:00:38 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8268037B;
        Tue, 22 Oct 2019 17:00:37 +0000 (UTC)
Date:   Tue, 22 Oct 2019 11:00:36 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Lee Jones <lee.jones@linaro.org>, kernel@pengutronix.de
Subject: Re: [RFC] docs: add a reset controller chapter to the driver API
 docs
Message-ID: <20191022110036.5c2edc05@lwn.net>
In-Reply-To: <20191022164547.22632-1-p.zabel@pengutronix.de>
References: <20191022164547.22632-1-p.zabel@pengutronix.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 22 Oct 2019 18:45:47 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Add initial reset controller API documentation. This is mostly indented
> to describe the concepts to users of the consumer API, and to tie the
> kerneldoc comments we already have into the driver API documentation.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

One quick comment...

>  Documentation/driver-api/index.rst |   1 +
>  Documentation/driver-api/reset.rst | 217 +++++++++++++++++++++++++++++
>  2 files changed, 218 insertions(+)
>  create mode 100644 Documentation/driver-api/reset.rst
> 

[...]

> +Shared and exclusive resets
> +---------------------------
> +
> +The reset controller API provides either reference counted deassertion and
> +assertion or direct, exclusive control.
> +The distinction between shared and exclusive reset controls is made at the time
> +the reset control is requested, either via :c:func:`devm_reset_control_get_shared`
> +or via :c:func:`devm_reset_control_get_exclusive`.

:c:func: isn't needed anymore, and is actively discouraged - the function
references will be linked anyway.  So just say function() rather than
:c:func:`function` everywhere, please.

Thanks,

jon
