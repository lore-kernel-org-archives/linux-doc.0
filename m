Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 39A187D584
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 09:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbeH1MxD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 08:53:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:57202 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726979AbeH1MxC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 28 Aug 2018 08:53:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 58C55AF6C;
        Tue, 28 Aug 2018 09:02:21 +0000 (UTC)
Date:   Tue, 28 Aug 2018 11:02:20 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Matthew Wilcox <willy@infradead.org>,
        Harry Cutts <hcutts@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jiri.kosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/3] Add the `REL_WHEEL_HI_RES` event code
In-Reply-To: <20180823190124.GB53155@dtor-ws>
Message-ID: <nycvar.YFH.7.76.1808281101500.25787@cbobk.fhfr.pm>
References: <20180823183057.247630-1-hcutts@chromium.org> <20180823183057.247630-2-hcutts@chromium.org> <20180823185722.GA24777@bombadil.infradead.org> <20180823190124.GB53155@dtor-ws>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 23 Aug 2018, Dmitry Torokhov wrote:

> > > +  - If a vertical scroll wheel supports high-resolution scrolling, this code
> > > +    will be emitted in addition to REL_WHEEL. The value is the (approximate)
> > > +    distance travelled by the user's finger, in 256ths of a millimeter.
> > 
> > Is it too late to change this to an actual unit like micrometres?
> 
> No love for imperial roots? Sure, micrometers would work too I think.

I don't really care strongly :) Is either of you going to update the 
patch? Otherwise I'll just apply as-is.

Thanks,

-- 
Jiri Kosina
SUSE Labs

