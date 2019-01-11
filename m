Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 563BF7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Jan 2019 18:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730972AbfAKSMg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Jan 2019 13:12:36 -0500
Received: from ms.lwn.net ([45.79.88.28]:59844 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727745AbfAKSMf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Jan 2019 13:12:35 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4044D2F3;
        Fri, 11 Jan 2019 18:12:35 +0000 (UTC)
Date:   Fri, 11 Jan 2019 11:12:34 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Liviu Dudau <Liviu.Dudau@arm.com>
Cc:     Brian Starkey <brian.starkey@arm.com>,
        Ayan Halder <ayan.halder@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Documentation: Add AFBC modifier usage documentation
Message-ID: <20190111111234.0dce504f@lwn.net>
In-Reply-To: <20190111180749.GJ20661@e110455-lin.cambridge.arm.com>
References: <20190111180749.GJ20661@e110455-lin.cambridge.arm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Jan 2019 18:07:49 +0000
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> I have a patch adding documentation for the AFBC modifiers supported
> by the DRM framework with an upcoming patch series. Patch has been
> out for review for a while, please pull.
> 
> The include/uapi/drm/drm_fourcc.h change is only a comment pointing
> towards the file's location, I hope this is fine to pull via your tree.

I guess I can merge this (though I'd rather get it as a patch), but GPU
stuff normally goes up through the DRM tree.  Daniel, might you be
planning to grab this one?

Thanks,

jon
