Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B059C41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 16:56:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A6E32075A
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 16:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgJFQ4h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 12:56:37 -0400
Received: from smtprelay0192.hostedemail.com ([216.40.44.192]:36932 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725902AbgJFQ4h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Oct 2020 12:56:37 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id BDBD763D;
        Tue,  6 Oct 2020 16:56:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: juice93_3f08596271c8
X-Filterd-Recvd-Size: 2140
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Tue,  6 Oct 2020 16:56:32 +0000 (UTC)
Message-ID: <1c2595d8df301b1e7f42a6f0093321a41bfea825.camel@perches.com>
Subject: Re: [PATCH v5 00/52] Fix html build with Sphinx  3.1 and above
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Alexander Aring <alex.aring@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jakub Kicinski <kuba@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Jason Wessel <jason.wessel@windriver.com>,
        Kees Cook <keescook@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, Sean Young <sean@mess.org>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Tejun Heo <tj@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Date:   Tue, 06 Oct 2020 09:56:31 -0700
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-10-06 at 16:02 +0200, Mauro Carvalho Chehab wrote:
> This series add proper support for Sphinx 3.1 and above for building the html docs.

Thanks Mauro.

I do like how the source docs are simplified for human reading
instead of having to mentally skip useless markup notations.


