Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 77E877D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Nov 2018 10:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbeKNUvT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Nov 2018 15:51:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:28558 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727704AbeKNUvT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Nov 2018 15:51:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Nov 2018 02:48:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,232,1539673200"; 
   d="scan'208";a="107967306"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.72.61])
  by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2018 02:48:34 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Ben Hutchings <ben.hutchings@codethink.co.uk>,
        dri-devel@lists.freedesktop.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Dave Airlie <airlied@redhat.com>, C.Emde@osadl.org
Subject: Re: [PATCH 0/5] Fixes and additions to EDID generation
In-Reply-To: <20181113171053.is24iz65egl22aw7@xylophone.i.decadent.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20181113171053.is24iz65egl22aw7@xylophone.i.decadent.org.uk>
Date:   Wed, 14 Nov 2018 12:49:11 +0200
Message-ID: <8736s4j5nc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Nov 2018, Ben Hutchings <ben.hutchings@codethink.co.uk> wrote:
> This series adds two more EDIDs that I needed for a project some time ago,
> and fixes some problems that I found along the way.

See also [1]. The patches there have been applied via the linux-doc
tree.

> There isn't a listed maintainer for Documentation/EDID but it looks
> like it falls under the DRM umbrella.  Please let me know if this the
> wrong place.

Cc: linux-doc, Jon and Dave.

The Documentation/EDID directory was merged by Dave along with the EDID
firmware loader mechanism in da0df92b5731 ("drm: allow loading an EDID
as firmware to override broken monitor").

I think it would be reasonable to handle the EDID stuff via dri-devel
and the drm trees, and modify MAINTAINERS to reflect that. Thoughts?

(And in the long run we should use or write a tool to generate EDIDs
instead of using assembly with macros. And like Jon already mentioned in
the other thread, even the assembly probably shouldn't be under
Documentation. But I digress.)


BR,
Jani.

[1] http://mid.mail-archive.com/1541407715-5417-1-git-send-email-cniedermaier@dh-electronics.de

>
> Ben.
>
> Ben Hutchings (5):
>   drm: EDID: Remove a mess involving the number 63
>   drm: EDID: Fix bit masking of {X,Y}{OFFSET,PULSE}
>   drm: EDID: Don't force make to be silent
>   drm: EDID: Add a 1280x720 (720p) EDID
>   drm: EDID: Add a 1280x768 ("WXGA") EDID
>
>  Documentation/EDID/1024x768.S  |  4 ++--
>  Documentation/EDID/1280x1024.S |  4 ++--
>  Documentation/EDID/1280x720.S  | 45 ++++++++++++++++++++++++++++++++++++++++++
>  Documentation/EDID/1280x768.S  | 45 ++++++++++++++++++++++++++++++++++++++++++
>  Documentation/EDID/1600x1200.S |  4 ++--
>  Documentation/EDID/1680x1050.S |  4 ++--
>  Documentation/EDID/1920x1080.S |  4 ++--
>  Documentation/EDID/800x600.S   |  4 ++--
>  Documentation/EDID/HOWTO.txt   |  4 ++--
>  Documentation/EDID/Makefile    | 12 +++++------
>  Documentation/EDID/edid.S      | 10 ++++------
>  11 files changed, 114 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/EDID/1280x720.S
>  create mode 100644 Documentation/EDID/1280x768.S

-- 
Jani Nikula, Intel Open Source Graphics Center
