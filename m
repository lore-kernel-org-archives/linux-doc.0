Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB4647D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Sep 2019 05:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbfIDFsN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Sep 2019 01:48:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:49132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbfIDFsM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Sep 2019 01:48:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED9EF2341D;
        Wed,  4 Sep 2019 05:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567576091;
        bh=62m/BaM2YlXpmhbO43sigHiSBNsLNfopQ+9alrBU8Ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=caFw/CP6kgw8MfCH1kbcN+WHvs6pfPT9ZtQw39wOSGIorocqZRYE0OcBZNa0sN4JU
         d9JZMRlOge964dSm1wDiVndNArHIykNg5LkYfGsodxb1HJmge+XF2RmrpRWtr8BTYJ
         qhIVtxwWj1WapFbegav98S/iOkBXB2ZW2XF8ADZ0=
Date:   Wed, 4 Sep 2019 07:48:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Jon Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 09/11] coresight: etm4x: docs: Update ABI doc for
 sysfs features added.
Message-ID: <20190904054809.GB4511@kroah.com>
References: <20190829213321.4092-1-mike.leach@linaro.org>
 <20190829213321.4092-10-mike.leach@linaro.org>
 <20190903195951.GA25008@kroah.com>
 <CANLsYkwvasYKaepXuWdkTKDj7RquATaum-dmTZZQL237wesryQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwvasYKaepXuWdkTKDj7RquATaum-dmTZZQL237wesryQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 03, 2019 at 04:51:40PM -0600, Mathieu Poirier wrote:
> On Tue, 3 Sep 2019 at 13:59, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Aug 29, 2019 at 10:33:19PM +0100, Mike Leach wrote:
> > > Update document to include the new sysfs features added during this
> > > patchset.
> > >
> > > Updated to reflect the new sysfs component nameing schema.
> > >
> > > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > > ---
> > >  .../testing/sysfs-bus-coresight-devices-etm4x | 183 +++++++++++-------
> > >  1 file changed, 115 insertions(+), 68 deletions(-)
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > index 36258bc1b473..112c50ae9986 100644
> > > --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > @@ -1,4 +1,4 @@
> > > -What:                /sys/bus/coresight/devices/<memory_map>.etm/enable_source
> > > +What:                /sys/bus/coresight/devices/etm<N>/enable_source
> >
> > You are renaming sysfs directories that have been around since:
> >
> > >  Date:                April 2015
> >
> > ???
> >
> > Really?
> >
> > That's brave.
> 
> 
> When I worked on the coresight sysfs ABI a while back I specifically
> added it at the "testing" level as I was well aware that things could
> change in the future.  According to the guidelines in the
> documentation userspace can rely on it which was accurate since the
> interface didn't change for 4 years.  But the guidelines also mention
> that changes can occur before the interfaces are move to stables, and
> that programs are encouraged to manifest their interest by adding
> their name to the "users" field.
> 
> The interface was changed in 5.2 to support coresight from ACPI and
> make things easier to understand for users.  It is a lot more
> intuitive to associate an ETM tracer with the CPU it belongs to by
> referring to the CPU number than the memory mapped address.  Given the
> "testing" status of the interface and the absence of registered users
> I decided to move forward with the change.  If "testing" is too strict
> for that I suggest to add an "experimental" category where it would be
> more acceptable to change things as subsystems mature.

"testing" is not really "testing" if you have userspace tools/programs
assuming the location and contents of specific files in sysfs.

You can change things in sysfs by creating new files, but to do
wholesale renaming like you did here can be very dangerous as you might
be breaking things.  Usually new files are created, not existing ones
moved.

What tools use these today?  What is going to break?

thanks,
greg k-h
