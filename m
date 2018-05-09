Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F5127DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 19:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965307AbeEITYf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 15:24:35 -0400
Received: from namei.org ([65.99.196.166]:60024 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965097AbeEITYd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 May 2018 15:24:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id w49JMiAf014269;
        Wed, 9 May 2018 19:22:44 GMT
Date:   Thu, 10 May 2018 05:22:44 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Roy Pledge <Roy.Pledge@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@zh-kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-fbdev@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 11/11] docs: fix broken references with multiple
 hints
In-Reply-To: <63a4f8a93f9115475bc184d0f37d076c9b9c75ff.1525870886.git.mchehab+samsung@kernel.org>
Message-ID: <alpine.LRH.2.21.1805100522240.12749@namei.org>
References: <cover.1525870886.git.mchehab+samsung@kernel.org> <63a4f8a93f9115475bc184d0f37d076c9b9c75ff.1525870886.git.mchehab+samsung@kernel.org>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 9 May 2018, Mauro Carvalho Chehab wrote:

> The script:
> 	./scripts/documentation-file-ref-check --fix-rst
> 
> Gives multiple hints for broken references on some files.
> Manually use the one that applies for some files.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>


Acked-by: James Morris <james.morris@microsoft.com>


-- 
James Morris
<jmorris@namei.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
