Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA953C388F7
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 02:02:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 787192076B
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 02:02:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgJ1Vsv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:48:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:45096 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727911AbgJ1Vr5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:47:57 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B803C2E7;
        Wed, 28 Oct 2020 16:22:47 +0000 (UTC)
Date:   Wed, 28 Oct 2020 10:22:46 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andreas Klinger <ak@it-klinger.de>,
        Anton Vorontsov <anton@enomsg.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Benson Leung <bleung@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Chao Yu <chao@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Colin Cross <ccross@android.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jonathan Cameron <jic23@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Richard Cochran <richardcochran@gmail.com>,
        Richard Gong <richard.gong@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Tony Luck <tony.luck@intel.com>, Wu Hao <hao.wu@intel.com>
Subject: Re: [PATCH 00/33] ABI: add it to the documentation build system
Message-ID: <20201028102246.6af578ee@lwn.net>
In-Reply-To: <20201028144321.GA2302351@kroah.com>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
        <20201028144321.GA2302351@kroah.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 28 Oct 2020 15:43:21 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> If there's no complaints, I'd like to take all of the Documentation/ABI/
> updates in for 5.10-rc2 at the least, to make it easier to build on top
> of and to keep these types of mistakes from living longer than they
> should be.  And make merging easier with other trees over time.

No complaints here, even if you want to take the whole set.  Feel free to
add:

Acked-by: Jonathan Corbet <corbet@lwn.net>

...if you like.

Thanks,

jon
