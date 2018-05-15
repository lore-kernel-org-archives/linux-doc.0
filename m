Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DC96F7DF8A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 May 2018 16:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753130AbeEOQBm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 May 2018 12:01:42 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35920 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752984AbeEOQAx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 May 2018 12:00:53 -0400
Received: by mail-wm0-f65.google.com with SMTP id n10-v6so2124897wmc.1
        for <linux-doc@vger.kernel.org>; Tue, 15 May 2018 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=6jTWI7IhUgK3sTZNm4ryTYiyArqXRpgAwqG7eWJ/n7U=;
        b=kMc8OTYLep4nPtfKydoMvEgV34HQ7p/oIHdGjMvFXgjdJSw7o1+vItfqoBswOdEenj
         bdN8xJQQOd0OApIK7AqIsvEay9yYeDRN9C6HF5HPXP7xzvL3FDN5Yh2TiENuWqowsiZJ
         h6GdM5ojd83CnZtCyWu1lmHy4DSk+D+QJvU8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=6jTWI7IhUgK3sTZNm4ryTYiyArqXRpgAwqG7eWJ/n7U=;
        b=LOtO3FWsBcBlqRuIsK/8L4UNod0r2HkbscIbY9ezLMzJFNsPbJSUjir9PK2SRZedxN
         0w99D6nmll6qMVc3TZV7MaJM6xMvy+Pf54a+iqjJ4zc5XR7FFQAqvjTkBR7MncfKLe4t
         sElrg1YboEIUrB6ZZ/W/kBqQgrvvAc2/EK2X2C6lELdj6Jy91foCx171FyMBXq5MaQc0
         uOxmzfpIM7LFV0A0Y9MbqqGjD7SLaP19DLk8tcV9assMb/B44N5IboVM04e37nRo1DPm
         23PGjrEJbjGoEdVCwTDznNpNuWvlFHJasdSBSgwsGztjI4cGPKlstYGoVawt0e5xIaAN
         HcGg==
X-Gm-Message-State: ALKqPwc6o1dEaOhS/D+wrJseRIYCRxLOIaMwxU8L3tBHqW8mjPNNmMvh
        pn12o6TAN1n6JEFZ5Qh5ey+RIj78FM0RUl6XY+OP3ovg
X-Google-Smtp-Source: AB8JxZoZJ95yHSJiBajbEF06miu1Rnmkx/d8uEyu2OoqVJthViHEVXKhSUEwZnGGEJ5PDIGKw90iqR2zbrdMFK1i0GE=
X-Received: by 2002:a50:b512:: with SMTP id y18-v6mr18777362edd.195.1526400052289;
 Tue, 15 May 2018 09:00:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.161 with HTTP; Tue, 15 May 2018 09:00:51 -0700 (PDT)
In-Reply-To: <20180514141800.f1be30ce9d1f6ae20ca2d04c@arm.com>
References: <20180507172915.c032cd71c07b1849bf419a5f@arm.com>
 <CANLsYkyQLan3XajOz2uuoOF8OQchGfeu2ZkZJ9H1Xm9q==aXTw@mail.gmail.com>
 <20180514121959.a9a3d2fb3d3d270849ffbc39@arm.com> <a09cbbb5-0237-31f5-dc81-d816c9ec26c5@infradead.org>
 <20180514141800.f1be30ce9d1f6ae20ca2d04c@arm.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 15 May 2018 10:00:51 -0600
Message-ID: <CANLsYkzaFYd=Uo7ZNxiuE3bsg7FrRTyaVEqj=j5mg6zoXDXNLg@mail.gmail.com>
Subject: Re: [PATCH v3] coresight: documentation: update sysfs section
To:     Kim Phillips <kim.phillips@arm.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14 May 2018 at 13:18, Kim Phillips <kim.phillips@arm.com> wrote:
> - Align and show updated ls devices output from the TC2, based on
>   current driver
>
> - Provide an example from an ETMv4 based system (Juno)
>
> - Reflect changes to the way the RAM write pointer is accessed since
>   it got changed in commit 7d83d17795ef ("coresight: tmc: adding sysFS
>   management entries").
>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Kim Phillips <kim.phillips@arm.com>

I'm good with this version - Jonathan, should I take this through my
tree of you'll take care of it?

In case of the former:
Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> v3: address Randy Dunlap's showns->shown,  corrected - and + line merging
> v2: address Mathieu's comment about clarifying the sinks on the Juno
>     vs. TC2 platforms.
>
>  Documentation/trace/coresight.txt | 43 +++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
> index 6f0120c3a4f1..15d2a0f1e1b8 100644
> --- a/Documentation/trace/coresight.txt
> +++ b/Documentation/trace/coresight.txt
> @@ -141,13 +141,25 @@ register the device with the core framework.  The unregister function takes
>  a reference to a "struct coresight_device", obtained at registration time.
>
>  If everything goes well during the registration process the new devices will
> -show up under /sys/bus/coresight/devices, as showns here for a TC2 platform:
> +show up under /sys/bus/coresight/devices, as shown here for a TC2 platform:
>
>  root:~# ls /sys/bus/coresight/devices/
> -replicator  20030000.tpiu    2201c000.ptm  2203c000.etm  2203e000.etm
> -20010000.etb         20040000.funnel  2201d000.ptm  2203d000.etm
> +20010000.etb   20040000.funnel 2201d000.ptm  2203d000.etm  replicator
> +20030000.tpiu  2201c000.ptm    2203c000.etm  2203e000.etm
>  root:~#
>
> +and here for a Juno platform:
> +
> +root@juno:~# ls /sys/bus/coresight/devices/
> +20010000.etf    20120000.replicator  22040000.etm     230c0000.funnel
> +20030000.tpiu   20130000.funnel      220c0000.funnel  23140000.etm
> +20040000.funnel  20140000.etf        22140000.etm     23240000.etm
> +20070000.etr    20150000.funnel      23040000.etm     23340000.etm
> +root@juno:~#
> +
> +Note that on Juno users can select the ETF, ETR and TPIU as a sink target while
> +on TC2, the ETB and TPIU can be selected.
> +
>  The functions take a "struct coresight_device", which looks like this:
>
>  struct coresight_desc {
> @@ -193,16 +205,16 @@ the information carried in "THIS_MODULE".
>  How to use the tracer modules
>  -----------------------------
>
> -Before trace collection can start, a coresight sink needs to be identify.
> +Before trace collection can start, a coresight sink needs to be identified.
>  There is no limit on the amount of sinks (nor sources) that can be enabled at
>  any given moment.  As a generic operation, all device pertaining to the sink
>  class will have an "active" entry in sysfs:
>
>  root:/sys/bus/coresight/devices# ls
> -replicator  20030000.tpiu    2201c000.ptm  2203c000.etm  2203e000.etm
> -20010000.etb         20040000.funnel  2201d000.ptm  2203d000.etm
> +20010000.etb   20040000.funnel 2201d000.ptm  2203d000.etm  replicator
> +20030000.tpiu  2201c000.ptm    2203c000.etm  2203e000.etm
>  root:/sys/bus/coresight/devices# ls 20010000.etb
> -enable_sink  status  trigger_cntr
> +enable_sink  mgmt  power  subsystem  trigger_cntr  uevent
>  root:/sys/bus/coresight/devices# echo 1 > 20010000.etb/enable_sink
>  root:/sys/bus/coresight/devices# cat 20010000.etb/enable_sink
>  1
> @@ -216,16 +228,13 @@ trigger a trace capture:
>  root:/sys/bus/coresight/devices# echo 1 > 2201c000.ptm/enable_source
>  root:/sys/bus/coresight/devices# cat 2201c000.ptm/enable_source
>  1
> -root:/sys/bus/coresight/devices# cat 20010000.etb/status
> -Depth:          0x2000
> -Status:         0x1
> -RAM read ptr:   0x0
> -RAM wrt ptr:    0x19d3   <----- The write pointer is moving
> -Trigger cnt:    0x0
> -Control:        0x1
> -Flush status:   0x0
> -Flush ctrl:     0x2001
> -root:/sys/bus/coresight/devices#
> +
> +Observe the write pointer moving:
> +
> +root:/sys/bus/coresight/devices# cat 20010000.etb/mgmt/rwp
> +0x1a8
> +root:/sys/bus/coresight/devices# cat 20010000.etb/mgmt/rwp
> +0x19a6
>
>  Trace collection is stopped the same way:
>
> --
> 2.17.0
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
