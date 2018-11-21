Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 144E07D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Nov 2018 13:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbeKVAKx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Nov 2018 19:10:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50100 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727100AbeKVAKx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Nov 2018 19:10:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 207E081DEC;
        Wed, 21 Nov 2018 13:36:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com [10.36.116.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4F7AC1019633;
        Wed, 21 Nov 2018 13:36:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 0830B9F12; Wed, 21 Nov 2018 14:36:25 +0100 (CET)
Date:   Wed, 21 Nov 2018 14:36:24 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Ben Hutchings <ben.hutchings@codethink.co.uk>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 0/5] Fixes and additions to EDID generation
Message-ID: <20181121133624.i4vxgt7atnv3ads6@sirius.home.kraxel.org>
References: <20181113171053.is24iz65egl22aw7@xylophone.i.decadent.org.uk>
 <8736s4j5nc.fsf@intel.com>
 <20181121093530.GL4266@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121093530.GL4266@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 21 Nov 2018 13:36:27 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

  Hi,

> > (And in the long run we should use or write a tool to generate EDIDs
> > instead of using assembly with macros. And like Jon already mentioned in
> > the other thread, even the assembly probably shouldn't be under
> > Documentation. But I digress.)
> 
> If we do that, maybe stuff the EDID things into Documentation/gpu? Would
> need an ack from media folks I think, but imo would make sense.

Oh, btw:  I've written a edid generator for qemu for the virtual display
devices, and I've also added a small test tool so you don't have to boot
a virtual machine to test the thing.  Will ship with the upcoming qemu
3.1 release.  You might find this useful ...

cheers,
  Gerd

============================== cut here ==============================
# qemu-edid -h

This is a test tool for the qemu edid generator.

Typically you'll pipe the output into edid-decode
to check if the generator works correctly.

usage: qemu-edid <options>
options:
    -h             print this text
    -o <file>      set output file (stdout by default)
    -v <vendor>    set monitor vendor (three letters)
    -n <name>      set monitor name
    -s <serial>    set monitor serial
    -d <dpi>       set display resolution
    -x <prefx>     set preferred width
    -y <prefy>     set preferred height
    -X <maxx>      set maximum width
    -Y <maxy>      set maximum height

# qemu-edid | edid-decode 
Extracted contents:
header:          00 ff ff ff ff ff ff 00
serial number:   49 14 34 12 00 00 00 00 2a 18
version:         01 04
basic params:    a5 28 1e 78 06
chroma info:     ee 91 a3 54 4c 99 26 0f 50 54
established:     21 08 00
standard:        e1 c0 d1 c0 01 01 01 01 01 01 01 01 01 01 01 01
descriptor 1:    25 20 00 66 41 00 1a 30 00 1e 33 40 93 2e 11 00 00 18
descriptor 2:    00 00 00 fd 00 32 7d 1e a0 78 01 0a 20 20 20 20 20 20
descriptor 3:    00 00 00 fc 00 51 45 4d 55 20 4d 6f 6e 69 74 6f 72 0a
descriptor 4:    00 00 00 f7 00 0a 00 4a a2 24 29 20 00 00 00 00 00 00
extensions:      01
checksum:        19

Manufacturer: RHT Model 1234 Serial Number 0
Made week 42 of 2014
EDID version: 1.4
Digital display
8 bits per primary color channel
DisplayPort interface
Maximum image size: 40 cm x 30 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4
Default (sRGB) color space is primary color space
First detailed timing is preferred timing
Established timings supported:
  640x480@60Hz
  800x600@60Hz
  1024x768@60Hz
Standard timings supported:
  2048x1152@60Hz
  1920x1080@60Hz
Detailed mode: Clock 82.290 MHz, 403 mm x 302 mm
               1024 1280 1310 1382 hborder 0
                768  771  774  794 vborder 0
               -hsync -vsync 
Monitor ranges (bare limits): 50-125Hz V, 30-160kHz H, max dotclock 1200MHz
Monitor name: QEMU Monitor
Established timings III
Has 1 extension blocks
Checksum: 0x19 (valid)

CEA extension block
Extension version: 3
6 bytes of CEA data
  Video data block
    VIC 125 Unknown mode 
    VIC 101 4096x2160@50Hz 
    VIC  96 3840x2160@50Hz 
    VIC  89 2560x1080@50Hz 
    VIC  31 1920x1080@50Hz 
0 native detailed modes
Checksum: 0xf2 (valid)

