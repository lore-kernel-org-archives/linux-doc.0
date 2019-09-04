Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A04117DE7D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Sep 2019 20:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbfIDTsC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Sep 2019 15:48:02 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35637 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfIDTsB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Sep 2019 15:48:01 -0400
Received: by mail-io1-f67.google.com with SMTP id b10so47074450ioj.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2019 12:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wvuud4zA0aelxuvnRUobLyqJekSvD1KYW4Jzg0u/ZQc=;
        b=Y0NOuo8bEuOroTj6m+/5EzJE3VAcUssNmVi+ZRKTlXHcWNd5foeOvxWu35e9TX3J5r
         7zBbLds+FE/dAiQnhG5iY1jU6Vj2t6r2dorZLcTHbaPO1lPHNY6qkr+bR4UDDMhd0Zh3
         8s+pLldygOTQ2MKr6a83xa6m0hCfyBAATJd09oKV0MdZ/6ENxaeIKgLJwng3FJsh/5S5
         jHV1ewitJX72Rcu0SUgy1NK31qZA69TVfjskyyxC38775GWGvq/ojyUwO5/c433eF+7I
         UYagQKo+VXxhVYfT78JAutHRyftID48DlYHE6ogvWI6Kz1TEN8LuLoXEPCrcqE7yR4/y
         wmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvuud4zA0aelxuvnRUobLyqJekSvD1KYW4Jzg0u/ZQc=;
        b=Y6TQ4oG3girakKe2k+WW2tcnILKXSwTFlanddONVF2o0UFVR70FK9I0ZSsBNcoRERS
         DbWx6wTmR6F0DqbftcsItsFdbHK0BoCLM9QsLFomvc0Hd1PkUQVvjEi9y9GVWEufmhSX
         Z3rKuvZ52JM9465mIp7VFM7qHsMgBk9Bi1FHZU19gkX2Ck1agTA7II+QCdPXzRQGWGpw
         3b3U+Z6GGs3u8hsj24WmWkkJacWukQF2rjlDCSDPNwVeWNslfjcLLFlu+a32uhumcROy
         g88kz3kt1gUV+eMcJsg0KMrTnaAFKu0L098PHvlTgC5TBwZ7scpFfTo/CQP3pgR5HjbV
         8I5g==
X-Gm-Message-State: APjAAAVBWpxdzW6lLkZgLySk+YT9fJnaUGZq6AKf2qhRI34ETaMHjV7n
        mrU0wytqdEQWj/qcgj+Q80SEQ7xid1atUgvWk+nuug==
X-Google-Smtp-Source: APXvYqzztImVgWfrY2RxM4IHFkQgBnx8FXE9py5dRz7xEOiF8hgk4S+nwn54/rqC1bitfrf3hoU2+K8SFwEHu7NpO5M=
X-Received: by 2002:a5d:8908:: with SMTP id b8mr2085148ion.237.1567626480311;
 Wed, 04 Sep 2019 12:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190829213321.4092-1-mike.leach@linaro.org> <20190829213321.4092-10-mike.leach@linaro.org>
 <20190903195951.GA25008@kroah.com> <CANLsYkwvasYKaepXuWdkTKDj7RquATaum-dmTZZQL237wesryQ@mail.gmail.com>
 <20190904054809.GB4511@kroah.com> <CANLsYkySX_3fGi4WLKHr7bv2=_j2UMyaTXCrwHSnzR-oH1V_ZQ@mail.gmail.com>
 <20190904161737.GA20662@kroah.com>
In-Reply-To: <20190904161737.GA20662@kroah.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 4 Sep 2019 13:47:49 -0600
Message-ID: <CANLsYkwGJKu3Ub55oP6br0yVaP5wy7F2Au4p1kCh0d7Ljzuxnw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] coresight: etm4x: docs: Update ABI doc for sysfs
 features added.
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Jon Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 4 Sep 2019 at 10:17, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 04, 2019 at 10:05:51AM -0600, Mathieu Poirier wrote:
> > On Tue, 3 Sep 2019 at 23:48, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Sep 03, 2019 at 04:51:40PM -0600, Mathieu Poirier wrote:
> > > > On Tue, 3 Sep 2019 at 13:59, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Thu, Aug 29, 2019 at 10:33:19PM +0100, Mike Leach wrote:
> > > > > > Update document to include the new sysfs features added during this
> > > > > > patchset.
> > > > > >
> > > > > > Updated to reflect the new sysfs component nameing schema.
> > > > > >
> > > > > > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > > > > > ---
> > > > > >  .../testing/sysfs-bus-coresight-devices-etm4x | 183 +++++++++++-------
> > > > > >  1 file changed, 115 insertions(+), 68 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > > > > index 36258bc1b473..112c50ae9986 100644
> > > > > > --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > > > > +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > > > > @@ -1,4 +1,4 @@
> > > > > > -What:                /sys/bus/coresight/devices/<memory_map>.etm/enable_source
> > > > > > +What:                /sys/bus/coresight/devices/etm<N>/enable_source
> > > > >
> > > > > You are renaming sysfs directories that have been around since:
> > > > >
> > > > > >  Date:                April 2015
> > > > >
> > > > > ???
> > > > >
> > > > > Really?
> > > > >
> > > > > That's brave.
> > > >
> > > >
> > > > When I worked on the coresight sysfs ABI a while back I specifically
> > > > added it at the "testing" level as I was well aware that things could
> > > > change in the future.  According to the guidelines in the
> > > > documentation userspace can rely on it which was accurate since the
> > > > interface didn't change for 4 years.  But the guidelines also mention
> > > > that changes can occur before the interfaces are move to stables, and
> > > > that programs are encouraged to manifest their interest by adding
> > > > their name to the "users" field.
> > > >
> > > > The interface was changed in 5.2 to support coresight from ACPI and
> > > > make things easier to understand for users.  It is a lot more
> > > > intuitive to associate an ETM tracer with the CPU it belongs to by
> > > > referring to the CPU number than the memory mapped address.  Given the
> > > > "testing" status of the interface and the absence of registered users
> > > > I decided to move forward with the change.  If "testing" is too strict
> > > > for that I suggest to add an "experimental" category where it would be
> > > > more acceptable to change things as subsystems mature.
> > >
> > > "testing" is not really "testing" if you have userspace tools/programs
> > > assuming the location and contents of specific files in sysfs.
> > >
> > > You can change things in sysfs by creating new files, but to do
> > > wholesale renaming like you did here can be very dangerous as you might
> > > be breaking things.
> >
> > Yes, something I have definitely considered.
> >
> > > Usually new files are created, not existing ones
> > > moved.
> >
> > In this case it would have meant a new symbolic link for every
> > coresight device, so twice a many entries under
> > $(SYS)/bus/coresight/device/.  That would have been a lot of clutter
> > and an increasing source of problems as the number of CPU and sinks
> > increases.  To me, and given the permissive definition of "testing"
> > found in the documentation, a clean break was a better option.
>
> Well, "testing" doesn't really matter in the end, if a tool/user relies
> on it, we have to keep it working properly.
>
> > > What tools use these today?  What is going to break?
> >
> > Other than local shell scripts I am not aware of any tools using these
> > today.  I am certainly open to discuss a better alternative but right
> > now, I just don't see one.
>
> Be aware that you might have to change this back if there is any
> objections.
>

We have an agreement.

Regards,
Mathieu
