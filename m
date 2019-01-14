Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 995BA7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Jan 2019 14:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfANOXA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 09:23:00 -0500
Received: from mga04.intel.com ([192.55.52.120]:64435 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbfANOXA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jan 2019 09:23:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jan 2019 06:22:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,477,1539673200"; 
   d="scan'208";a="138101920"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.72.79])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2019 06:22:55 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Brian Starkey <Brian.Starkey@arm.com>
Cc:     Liviu Dudau <Liviu.Dudau@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, nd <nd@arm.com>,
        "linux-doc\@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "arnd\@arndb.de" <arnd@arndb.de>,
        "corbet\@lwn.net" <corbet@lwn.net>,
        "airlied\@linux.ie" <airlied@linux.ie>,
        "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "nicolas.ferre\@microchip.com" <nicolas.ferre@microchip.com>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "davem\@davemloft.net" <davem@davemloft.net>,
        "maxime.ripard\@bootlin.com" <maxime.ripard@bootlin.com>,
        "malidp\@foss.arm.com" <malidp@foss.arm.com>,
        "mchehab+samsung\@kernel.org" <mchehab+samsung@kernel.org>,
        "akpm\@linux-foundation.org" <akpm@linux-foundation.org>,
        Ayan Halder <Ayan.Halder@arm.com>,
        "sean\@poorly.run" <sean@poorly.run>
Subject: Re: [RFC AFBC 03/12] drm/afbc: Add AFBC modifier usage documentation
In-Reply-To: <20190114141322.6l3th2hjbsm7fzhp@DESKTOP-E1NTVVP.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1543836703-8491-1-git-send-email-ayan.halder@arm.com> <1543836703-8491-4-git-send-email-ayan.halder@arm.com> <2158b458c240874e5c974a2cae374c3fbf682e48.camel@collabora.com> <20190111180758.GK20661@e110455-lin.cambridge.arm.com> <871s5f5sx9.fsf@intel.com> <20190114141322.6l3th2hjbsm7fzhp@DESKTOP-E1NTVVP.localdomain>
Date:   Mon, 14 Jan 2019 16:24:33 +0200
Message-ID: <87won748ri.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Jan 2019, Brian Starkey <Brian.Starkey@arm.com> wrote:
> AFBC is a relatively well-established name, whereas arm-fbc is not a
> term anyone will be familiar with.

First time I ever heard of AFBC. ;)

> We could name the file "arm-afbc.rst", though I am slightly against
> namespacing it that way for the reason mentioned above - it
> does/will/should apply to more than just the gpu/drm/arm tree.

Fair enough. It's not like the name is part of the ABI, so I guess let's
go with this, and we can rename later if we come up with a better name.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
