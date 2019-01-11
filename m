Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E7A477D8A9
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Jan 2019 18:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731434AbfAKSHw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Jan 2019 13:07:52 -0500
Received: from foss.arm.com ([217.140.101.70]:60980 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727745AbfAKSHv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Jan 2019 13:07:51 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85B541596;
        Fri, 11 Jan 2019 10:07:51 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55CE83F6CF;
        Fri, 11 Jan 2019 10:07:51 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id ABE8D68207C; Fri, 11 Jan 2019 18:07:49 +0000 (GMT)
Date:   Fri, 11 Jan 2019 18:07:49 +0000
From:   Liviu Dudau <Liviu.Dudau@arm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Brian Starkey <brian.starkey@arm.com>,
        Ayan Halder <ayan.halder@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation: Add AFBC modifier usage documentation
Message-ID: <20190111180749.GJ20661@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

I have a patch adding documentation for the AFBC modifiers supported
by the DRM framework with an upcoming patch series. Patch has been
out for review for a while, please pull.

The include/uapi/drm/drm_fourcc.h change is only a comment pointing
towards the file's location, I hope this is fine to pull via your tree.

Many thanks,
Liviu


The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://linux-arm.org/linux-ld.git for-upstream/documentation

for you to fetch changes up to 3affaa5a7ca3ca114e01049bc45e3ed4a3955505:

  drm/afbc: Add AFBC modifier usage documentation (2019-01-11 17:52:06 +0000)

----------------------------------------------------------------
Brian Starkey (1):
      drm/afbc: Add AFBC modifier usage documentation

 Documentation/gpu/afbc.rst    | 235 ++++++++++++++++++++++++++++++++++++++++++
 Documentation/gpu/drivers.rst |   1 +
 MAINTAINERS                   |   3 +-
 include/uapi/drm/drm_fourcc.h |   3 +
 4 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/afbc.rst

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
