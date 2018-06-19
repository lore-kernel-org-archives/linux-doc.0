Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 29B9E7D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 00:12:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S937032AbeFSAMU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 20:12:20 -0400
Received: from mail-yb0-f194.google.com ([209.85.213.194]:37008 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937015AbeFSAMS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jun 2018 20:12:18 -0400
Received: by mail-yb0-f194.google.com with SMTP id h141-v6so6647987ybg.4
        for <linux-doc@vger.kernel.org>; Mon, 18 Jun 2018 17:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AsNZBT64jfg2NrK7dSzVH8olUEndB/ZuURkU7lNk7rg=;
        b=Y2vrKh7tlDsCySliRFFUY1qSlhJBbqPM69j2pfp7D4skQCbtA908DwDYiBMyrnYeP7
         D8QwtynqoikpyaRjyd4D3CT8MrVfvxoTdV2/QJRVMeNUdBA0CaaILhnR6dKMr7b++iWa
         arZzjUVL55fTItQgP1Wb+BmkpZgilvwdAVS0NCcyCkUyR9mooT21IE46SAnlFy136sAW
         mvdjY9AGfjoq4JSaCxVzInSvDjziv/syGZx7OxdZIgZ2OgnE1FABeAb9c7tE3OFshnUz
         kqiirB4mX4rtS4M9HCm2sExPCMRRUYzxxop14ys16ewuuc6v1O8kV/eHOzg2JEaBg7Lm
         rVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AsNZBT64jfg2NrK7dSzVH8olUEndB/ZuURkU7lNk7rg=;
        b=entrBxATD4OayhGy6N8pT6xa4WZX5ET9TCUDUNsWH4D2XNjw1oUygJWbcgmOWfw6pe
         OOYimUgpzJTGPKz9tu4EzDwnEAgxWspDJfmJCCxCuwHCoHT2xVyJSO2W5yE/xPik6jWh
         4MhgNqcMdgXHC9zSby1b0W7JLOUz+xdCk+IzA0luz7/3/KutiaXi8xl6iug1CQtPT4CJ
         7z2x/YC4DWz24JSSfb1Ydh+L90/VRRsbyK+6ZmHR2H/83BsDoH7VTAQdT7JgIl1/ILhy
         vgPjdbv3D3yo/6z27+xKJNpcacokfmCwYoZR7gisC7Isu1dvqooPWmhhrJmyiDYKmxtK
         s6vw==
X-Gm-Message-State: APt69E2mGfz6UXBx0xTw43sQpCw+08NLIRWQI5gav8w0Teg4CA/1oV2B
        CaRxh0t6mWwKFoV+adFWAZbinkA3MMdFihmTvIQHKw==
X-Google-Smtp-Source: ADUXVKIpaQoZj7ytDJOnaHA9BEfvxUmoJVgGDjyfHC90XF8xjRhIjy47NCY2ctIZj+qyMM/UuB2mymKtSyQA6uG6u0k=
X-Received: by 2002:a25:7a01:: with SMTP id v1-v6mr6199659ybc.87.1529367137525;
 Mon, 18 Jun 2018 17:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20180522222805.80314-1-rajatja@google.com> <20180523175808.28030-1-rajatja@google.com>
 <20180523175808.28030-6-rajatja@google.com> <c27290dd401bb2954db4959559c39a00@codeaurora.org>
In-Reply-To: <c27290dd401bb2954db4959559c39a00@codeaurora.org>
From:   Rajat Jain <rajatja@google.com>
Date:   Mon, 18 Jun 2018 17:11:41 -0700
Message-ID: <CACK8Z6EHDv0d5zwgKj2N+DyxKEj9dVkSoN2Y_HTOKv8L9p-OAg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] Documentation/ABI: Add details of PCI AER statistics
To:     Oza Pawandeep <poza@codeaurora.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        "Busch, Keith" <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-pci <linux-pci@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jes Sorensen <jsorensen@fb.com>, Kyle McMartin <jkkm@fb.com>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Sat, Jun 16, 2018 at 10:24 PM <poza@codeaurora.org> wrote:
>
> On 2018-05-23 23:28, Rajat Jain wrote:
> > Add the PCI AER statistics details to
> > Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> > and provide a pointer to it in
> > Documentation/PCI/pcieaer-howto.txt
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > v2: Move the documentation to Documentation/ABI/
> >
> >  .../testing/sysfs-bus-pci-devices-aer_stats   | 103 ++++++++++++++++++
> >  Documentation/PCI/pcieaer-howto.txt           |   5 +
> >  2 files changed, 108 insertions(+)
> >  create mode 100644
> > Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> > b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> > new file mode 100644
> > index 000000000000..f55c389290ac
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> > @@ -0,0 +1,103 @@
> > +==========================
> > +PCIe Device AER statistics
> > +==========================
> > +These attributes show up under all the devices that are AER capable.
> > These
> > +statistical counters indicate the errors "as seen/reported by the
> > device".
> > +Note that this may mean that if an end point is causing problems, the
> > AER
> > +counters may increment at its link partner (e.g. root port) because
> > the
> > +errors will be "seen" / reported by the link partner and not the the
> > +problematic end point itself (which may report all counters as 0 as it
> > never
> > +saw any problems).
> > +
> > +Where:               /sys/bus/pci/devices/<dev>/aer_stats/dev_total_cor_errs
> > +Date:                May 2018
> > +Kernel Version: 4.17.0
> > +Contact:     linux-pci@vger.kernel.org, rajatja@google.com
> > +Description: Total number of correctable errors seen and reported by
> > this
> > +             PCI device using ERR_COR.
> > +
> > +Where:               /sys/bus/pci/devices/<dev>/aer_stats/dev_total_fatal_errs
> > +Date:                May 2018
> > +Kernel Version: 4.17.0
> > +Contact:     linux-pci@vger.kernel.org, rajatja@google.com
> > +Description: Total number of uncorrectable fatal errors seen and
> > reported
> > +             by this PCI device using ERR_FATAL.
> > +
> > +Where:               /sys/bus/pci/devices/<dev>/aer_stats/dev_total_nonfatal_errs
> > +Date:                May 2018
> > +Kernel Version: 4.17.0
> > +Contact:     linux-pci@vger.kernel.org, rajatja@google.com
> > +Description: Total number of uncorrectable non-fatal errors seen and
> > reported
> > +             by this PCI device using ERR_NONFATAL.
> > +
> > +Where:               /sys/bus/pci/devices/<dev>/aer_stats/dev_breakdown_correctable
> > +Date:                May 2018
> > +Kernel Version: 4.17.0
> > +Contact:     linux-pci@vger.kernel.org, rajatja@google.com
> > +Description: Breakdown of of correctable errors seen and reported by
> > this
> > +             PCI device using ERR_COR. A sample result looks like this:
> > +-----------------------------------------
> > +Receiver Error = 0x174
> > +Bad TLP = 0x19
> > +Bad DLLP = 0x3
> > +RELAY_NUM Rollover = 0x0
> > +Replay Timer Timeout = 0x1
> > +Advisory Non-Fatal = 0x0
> > +Corrected Internal Error = 0x0
> > +Header Log Overflow = 0x0
> > +-----------------------------------------
> why hex display ? decimal is easy to read as these are counters.

Have no particular preference. Since these can be potentially large
numbers, just had a random thought that hex might make it more
concise. I can change to decimal if that is preferable.

> > +
> > +Where:               /sys/bus/pci/devices/<dev>/aer_stats/dev_breakdown_uncorrectable
> > +Date:                May 2018
> > +Kernel Version: 4.17.0
> > +Contact:     linux-pci@vger.kernel.org, rajatja@google.com
> > +Description: Breakdown of of correctable errors seen and reported by
> > this
> > +             PCI device using ERR_FATAL or ERR_NONFATAL. A sample result
> > +             looks like this:
> > +-----------------------------------------
> > +Undefined = 0x0
> > +Data Link Protocol = 0x0
> > +Surprise Down Error = 0x0
> > +Poisoned TLP = 0x0
> > +Flow Control Protocol = 0x0
> > +Completion Timeout = 0x0
> > +Completer Abort = 0x0
> > +Unexpected Completion = 0x0
> > +Receiver Overflow = 0x0
> > +Malformed TLP = 0x0
> > +ECRC = 0x0
> > +Unsupported Request = 0x0
> > +ACS Violation = 0x0
> > +Uncorrectable Internal Error = 0x0
> > +MC Blocked TLP = 0x0
> > +AtomicOp Egress Blocked = 0x0
> > +TLP Prefix Blocked Error = 0x0
> > +-----------------------------------------
> > +
> > +============================
> > +PCIe Rootport AER statistics
> > +============================
> > +These attributes showup under only the rootports that are AER capable.
> > These
> > +indicate the number of error messages as "reported to" the rootport.
> > Please note
> > +that the rootports also transmit (internally) the ERR_* messages for
> > errors seen
> > +by the internal rootport PCI device, so these counters includes them
> > and are
> > +thus cumulative of all the error messages on the PCI hierarchy
> > originating
> > +at that root port.
>
> what about switches and bridges ?

What about them? AIUI, the switches forward the ERR_ messages from
downstream devices to the rootport, like they do with standard
messages. They can potentially generate their own ERR_ message and
that would be reported no different than other end point devices.

> Also Can you give some idea as e.g what is the difference between
> dev_total_fatal_errs and rootport_total_fatal_errs  (assuming that both
> are same pci_dev.

For a pci_dev representing the rootport:

dev_total_fatal_errors = how many times this PCI device *experienced*
a fatal problem on its own (i.e. either link issues while talking to
its link partner, or some internal errors).

rootport_total_fatal_errors = how many times this rootport was
*informed* about a problem (via ERR_* messages) in the PCI hierarchy
that originates at it (can be any link further downstream). This
includes the dev_total_fatal_errors also, because any errors detected
by the rootport are also "informed" to itself via ERR_* messages. In
reality, this is just the total number of ERR_FATAL messages received
at the rootport. This sysfs attribute will only exist for root ports.

>
> rootport_total_fatal_errs gives me an idea that how many times things
> have been failed under this pci_dev ?

Yes, as above.

> which means num of downstream link problems. but I am still trying to
> make sense as how it could be used,
> since we dont have BDF information associated with the number of errors
> anywhere (except these AER print messages)
>

Agree. That is a limitation. The challenges being more record keeping,
more complicated sysfs representation, and given that PCI devices may
come and go, how do we know it is the same device before we collate
their stats etc.

>
> and dev_total_fatal_errs as you mentioned above that problematic EP,
> then say root-port will report it and increment
> dev_total_fatal_errs ++
> does it also increment root-port_total_fatal_errs ++ in above scenario ?

Yes, as above, it will also root-port_total_fatal_errs++ for the root
port of that hierarchy.

Thanks,

Rajat

>
> > +
> > +Where:               /sys/bus/pci/devices/<dev>/aer_stats/rootport_total_cor_errs
> > +Date:                May 2018
> > +Kernel Version: 4.17.0
> > +Contact:     linux-pci@vger.kernel.org, rajatja@google.com
> > +Description: Total number of ERR_COR messages reported to rootport.
> > +
> > +Where:               /sys/bus/pci/devices/<dev>/aer_stats/rootport_total_fatal_errs
> > +Date:                May 2018
> > +Kernel Version: 4.17.0
> > +Contact:     linux-pci@vger.kernel.org, rajatja@google.com
> > +Description: Total number of ERR_FATAL messages reported to rootport.
> > +
> > +Where:
> > /sys/bus/pci/devices/<dev>/aer_stats/rootport_total_nonfatal_errs
> > +Date:                May 2018
> > +Kernel Version: 4.17.0
> > +Contact:     linux-pci@vger.kernel.org, rajatja@google.com
> > +Description: Total number of ERR_NONFATAL messages reported to
> > rootport.
> > diff --git a/Documentation/PCI/pcieaer-howto.txt
> > b/Documentation/PCI/pcieaer-howto.txt
> > index acd0dddd6bb8..91b6e677cb8c 100644
> > --- a/Documentation/PCI/pcieaer-howto.txt
> > +++ b/Documentation/PCI/pcieaer-howto.txt
> > @@ -73,6 +73,11 @@ In the example, 'Requester ID' means the ID of the
> > device who sends
> >  the error message to root port. Pls. refer to pci express specs for
> >  other fields.
> >
> > +2.4 AER Statistics / Counters
> > +
> > +When PCIe AER errors are captured, the counters / statistics are also
> > exposed
> > +in form of sysfs attributes which are documented at
> > +Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> >
> >  3. Developer Guide
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
