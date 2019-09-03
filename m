Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE46F7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Sep 2019 22:51:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbfICWvx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Sep 2019 18:51:53 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42834 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbfICWvx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Sep 2019 18:51:53 -0400
Received: by mail-io1-f65.google.com with SMTP id n197so37863220iod.9
        for <linux-doc@vger.kernel.org>; Tue, 03 Sep 2019 15:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYO7eVBCNrnpFOyRb3Amb6W0vdTOqYDKVyWymRh0QNs=;
        b=g+GVoCijZgDqSnsdGqVziBFgPBsX4jMTrSmbCCUhy3mGL8Fcbqk7jMlzoExRvAdOeh
         WA1uwt/XIXWne8OhY9TKjI2oZ//SyLg8Phrvfl6722RzurwumBKofu6L+1/UDVMF+l9G
         80MjqcJT7rR4p7ysdrj/F1b57bmozMjVHtEE2+rxdnyOmPoCQRFy9Ygq96ITVWPkFeDa
         cMyStSaXvUeKCVWcVoQgQAUiIcEBb2YqJl6AVOIucnlUYV+guv9KruXTjG4pVM5aRXWr
         LYmWAzNG7d6l0HMbj1M2jMaf5GtLXObTNeKE9/O1ZFTCfDGEa2e4cn23HTWBuaN8EP3/
         MLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYO7eVBCNrnpFOyRb3Amb6W0vdTOqYDKVyWymRh0QNs=;
        b=AG3K1qRD47LtHooe6oI1wTMyJGEb1x3lQHS12KW/6OekRGafxiDWnp8uPumhjGFVMZ
         cWt+SKdSincurXcLjeI2w8KDv2kTYGdrxMi7QwgijxUaF8L8hGQEtdGrP2lQY8AMrkvI
         z4hAHnuq3ze5zmmu4kjgT/wmQlzwCjlFZ+00z4dJKenGkLLwCAz+ffqQWwPm3//Df+ma
         cmdgC6TZscaP5TYNAAyluQtuDe3gug6B53Y27rQh4M/bNpI70f/FbsE46nS4Am+HaKN0
         OeHhOxgRZJ7JF9GdPtfrEyOogDJmD4t94vQwOTqpibl5VBTMN0wzTeBtqPBya1TRsJqm
         +i6A==
X-Gm-Message-State: APjAAAX4uGpYZZfApOh4v9i/3Os5AEJALolUCJ2syeCxxIGCpCeZoHxd
        xSRMoVo9DV8IrbS4uMAyZMSf5FLt650g6RsnldpAMQ==
X-Google-Smtp-Source: APXvYqyN4ahmzdcyJ7W9qi0KkM9Y5yP4GjOu24tSPXRsLsC+VsTfW+5Qc8eZJvDGOkt9ra+LaHsPs9XSVv+qQKxWRj8=
X-Received: by 2002:a02:92:: with SMTP id 140mr7435167jaa.98.1567551111624;
 Tue, 03 Sep 2019 15:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190829213321.4092-1-mike.leach@linaro.org> <20190829213321.4092-10-mike.leach@linaro.org>
 <20190903195951.GA25008@kroah.com>
In-Reply-To: <20190903195951.GA25008@kroah.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 3 Sep 2019 16:51:40 -0600
Message-ID: <CANLsYkwvasYKaepXuWdkTKDj7RquATaum-dmTZZQL237wesryQ@mail.gmail.com>
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

On Tue, 3 Sep 2019 at 13:59, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 29, 2019 at 10:33:19PM +0100, Mike Leach wrote:
> > Update document to include the new sysfs features added during this
> > patchset.
> >
> > Updated to reflect the new sysfs component nameing schema.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  .../testing/sysfs-bus-coresight-devices-etm4x | 183 +++++++++++-------
> >  1 file changed, 115 insertions(+), 68 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > index 36258bc1b473..112c50ae9986 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> > @@ -1,4 +1,4 @@
> > -What:                /sys/bus/coresight/devices/<memory_map>.etm/enable_source
> > +What:                /sys/bus/coresight/devices/etm<N>/enable_source
>
> You are renaming sysfs directories that have been around since:
>
> >  Date:                April 2015
>
> ???
>
> Really?
>
> That's brave.


When I worked on the coresight sysfs ABI a while back I specifically
added it at the "testing" level as I was well aware that things could
change in the future.  According to the guidelines in the
documentation userspace can rely on it which was accurate since the
interface didn't change for 4 years.  But the guidelines also mention
that changes can occur before the interfaces are move to stables, and
that programs are encouraged to manifest their interest by adding
their name to the "users" field.

The interface was changed in 5.2 to support coresight from ACPI and
make things easier to understand for users.  It is a lot more
intuitive to associate an ETM tracer with the CPU it belongs to by
referring to the CPU number than the memory mapped address.  Given the
"testing" status of the interface and the absence of registered users
I decided to move forward with the change.  If "testing" is too strict
for that I suggest to add an "experimental" category where it would be
more acceptable to change things as subsystems mature.

Thanks,
Mathieu

>
>
> What tool did you just break?
>
> greg k-h
