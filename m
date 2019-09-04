Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 48F167FA35
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Sep 2019 16:16:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732764AbfIDQGE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Sep 2019 12:06:04 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:47050 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733009AbfIDQGD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Sep 2019 12:06:03 -0400
Received: by mail-io1-f67.google.com with SMTP id x4so45261485iog.13
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2019 09:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5lhWafqYFmhotqOeEvQEWgPd+ZPMMqTqg3Hle4q+xhU=;
        b=CHLprMwQX4fDdOh9+SC0j0oKqhpRV5SxjXmh82FD18bndq7o9RVQv3xwg1LlxDAY44
         LHMcYBPRJESuihYLmkWujLc9RW4n6/POEmyeQJQMWa4nxbe334mV63xyugLbOowTvPvY
         mblFSd9J/wgEeV2yeFxP7I+FL+xUs7diHC+xH5JLi/ZbgTa0xW6G5TrQ3aY7aMdivj/H
         fJwyuCjddPAENUptyq951q8DPWi767SWU7TrIgd9KuvKSOm+02Yrhj+XlwiiLVkQvo63
         piPY0o5VxYy9OFGvwB7GC6avakut7yxVQiAvZIm6568lpuf3mP5SbEFIUmguCQqzT/WJ
         oRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5lhWafqYFmhotqOeEvQEWgPd+ZPMMqTqg3Hle4q+xhU=;
        b=tXyrwa4qlrc3AUILZStaLNoKdkLqJaEhNsePu3yI7S2jONg9iE3tK7s2gMsEnBSX08
         5qkoXzAlty1eYIUk2+mAaa+nv6SkNeoY3synrOTXsgCVNxYWHRvjYYMT7yMWE+nwC8gu
         yp72FFNMbxqrqg4+BtET2E1ep96LefD9uhxFw374mqVmRlJeQbZb4b+UHrn30q/RiVCh
         oHnbOxShTVKiQ52Gde31XUBe4ue2d+N7Jzt3IWPzzHuBywp3e3tqatobkyadQjBABqEL
         PTlRxeJMm/TOl8SzknFAq9/V7tEbYE3IPNFivjhnfb+VkMY2uysDqR05LSSgR1SqrLJY
         HrcQ==
X-Gm-Message-State: APjAAAUil/lX7kmpAGrr4/5g54b2VmaSviAJ5Wpi9GFB52fZMaYUrxc2
        ryZOTC3s3Sr2zKRqUS1wvah5IL/9pAZV2pGzUUoESns/
X-Google-Smtp-Source: APXvYqz4yu3QVTFmHphFpeszsph5mwZpIGJqJee0ZteodLoeZweGPlU1B4ldAcZ9Edn8Xfx0kYtihi/V2VCWYezetpI=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr4404471iof.58.1567613162647;
 Wed, 04 Sep 2019 09:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190829213321.4092-1-mike.leach@linaro.org> <20190829213321.4092-10-mike.leach@linaro.org>
 <20190903195951.GA25008@kroah.com> <CANLsYkwvasYKaepXuWdkTKDj7RquATaum-dmTZZQL237wesryQ@mail.gmail.com>
 <20190904054809.GB4511@kroah.com>
In-Reply-To: <20190904054809.GB4511@kroah.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 4 Sep 2019 10:05:51 -0600
Message-ID: <CANLsYkySX_3fGi4WLKHr7bv2=_j2UMyaTXCrwHSnzR-oH1V_ZQ@mail.gmail.com>
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

On Tue, 3 Sep 2019 at 23:48, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 03, 2019 at 04:51:40PM -0600, Mathieu Poirier wrote:
> > On Tue, 3 Sep 2019 at 13:59, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Aug 29, 2019 at 10:33:19PM +0100, Mike Leach wrote:
> > > > Update document to include the new sysfs features added during this
> > > > patchset.
> > > >
> > > > Updated to reflect the new sysfs component nameing schema.
> > > >
> > > > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > > > ---
> > > >  .../testing/sysfs-bus-coresight-devices-etm4x | 183 +++++++++++-------
> > > >  1 file changed, 115 insertions(+), 68 deletions(-)
> > > >
> > > > diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > > index 36258bc1b473..112c50ae9986 100644
> > > > --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > > +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > > > @@ -1,4 +1,4 @@
> > > > -What:                /sys/bus/coresight/devices/<memory_map>.etm/enable_source
> > > > +What:                /sys/bus/coresight/devices/etm<N>/enable_source
> > >
> > > You are renaming sysfs directories that have been around since:
> > >
> > > >  Date:                April 2015
> > >
> > > ???
> > >
> > > Really?
> > >
> > > That's brave.
> >
> >
> > When I worked on the coresight sysfs ABI a while back I specifically
> > added it at the "testing" level as I was well aware that things could
> > change in the future.  According to the guidelines in the
> > documentation userspace can rely on it which was accurate since the
> > interface didn't change for 4 years.  But the guidelines also mention
> > that changes can occur before the interfaces are move to stables, and
> > that programs are encouraged to manifest their interest by adding
> > their name to the "users" field.
> >
> > The interface was changed in 5.2 to support coresight from ACPI and
> > make things easier to understand for users.  It is a lot more
> > intuitive to associate an ETM tracer with the CPU it belongs to by
> > referring to the CPU number than the memory mapped address.  Given the
> > "testing" status of the interface and the absence of registered users
> > I decided to move forward with the change.  If "testing" is too strict
> > for that I suggest to add an "experimental" category where it would be
> > more acceptable to change things as subsystems mature.
>
> "testing" is not really "testing" if you have userspace tools/programs
> assuming the location and contents of specific files in sysfs.
>
> You can change things in sysfs by creating new files, but to do
> wholesale renaming like you did here can be very dangerous as you might
> be breaking things.

Yes, something I have definitely considered.

> Usually new files are created, not existing ones
> moved.

In this case it would have meant a new symbolic link for every
coresight device, so twice a many entries under
$(SYS)/bus/coresight/device/.  That would have been a lot of clutter
and an increasing source of problems as the number of CPU and sinks
increases.  To me, and given the permissive definition of "testing"
found in the documentation, a clean break was a better option.

>
> What tools use these today?  What is going to break?

Other than local shell scripts I am not aware of any tools using these
today.  I am certainly open to discuss a better alternative but right
now, I just don't see one.

>
> thanks,
> greg k-h
