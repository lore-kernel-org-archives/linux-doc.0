Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B87EA7D0D8
	for <lwn-linux-doc@archive.lwn.net>; Sun, 13 Jan 2019 22:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfAMW2O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 13 Jan 2019 17:28:14 -0500
Received: from foss.arm.com ([217.140.101.70]:52674 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbfAMW2O (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 13 Jan 2019 17:28:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCCED80D;
        Sun, 13 Jan 2019 14:28:13 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DCE13F5BD;
        Sun, 13 Jan 2019 14:28:13 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id EBF76682073; Sun, 13 Jan 2019 22:28:11 +0000 (GMT)
Date:   Sun, 13 Jan 2019 22:28:11 +0000
From:   Liviu Dudau <Liviu.Dudau@arm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Brian Starkey <brian.starkey@arm.com>,
        Ayan Halder <ayan.halder@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Documentation: Add AFBC modifier usage documentation
Message-ID: <20190113222811.GM20661@e110455-lin.cambridge.arm.com>
References: <20190111180749.GJ20661@e110455-lin.cambridge.arm.com>
 <20190111111234.0dce504f@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190111111234.0dce504f@lwn.net>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 11, 2019 at 11:12:34AM -0700, Jonathan Corbet wrote:
> On Fri, 11 Jan 2019 18:07:49 +0000
> Liviu Dudau <Liviu.Dudau@arm.com> wrote:
> 
> > I have a patch adding documentation for the AFBC modifiers supported
> > by the DRM framework with an upcoming patch series. Patch has been
> > out for review for a while, please pull.
> > 
> > The include/uapi/drm/drm_fourcc.h change is only a comment pointing
> > towards the file's location, I hope this is fine to pull via your tree.
> 
> I guess I can merge this (though I'd rather get it as a patch), but GPU
> stuff normally goes up through the DRM tree.  Daniel, might you be
> planning to grab this one?

I thought anything under Documentation goes via your tree. If that's not
the case, don't worry, I can push it via drm-misc tree.

Best regards,
Liviu

> 
> Thanks,
> 
> jon

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
