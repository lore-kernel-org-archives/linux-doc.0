Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SUSPICIOUS_RECIPS,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 873807E66E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 14:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751289AbeCNOfr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 10:35:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:44881 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750779AbeCNOfo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 10:35:44 -0400
Received: from wuerfel.lan ([95.208.111.237]) by mrelayeu.kundenserver.de
 (mreue005 [212.227.15.129]) with ESMTPA (Nemesis) id
 0MLkAx-1ewOLr1lDf-000q3R; Wed, 14 Mar 2018 15:35:36 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-arch@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-doc@vger.kernel.org, linux-block@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH 00/16] remove eight obsolete architectures
Date:   Wed, 14 Mar 2018 15:34:59 +0100
Message-Id: <20180314143529.1456168-1-arnd@arndb.de>
X-Mailer: git-send-email 2.9.0
X-Provags-ID: V03:K0:WInKuzsl5E+V3c9AlxLSSxc+4ZGknT/OL6sbFGTOOKUoIWUHPce
 sOunIkU3WA3yS4K2U7KLuM21G9io/7RdSDfXqf1g08L51uCkoCyAjOMiXI4kUVcEF0/FqP/
 umDnF0uQsHtMOXgS1AiyzYPQ6W0JczwHRAY9QiiD/KUW+z5A+Vgixyn6TUIYx2uOcgiAjdC
 CrnI3DG9ch7X4/hA6MvHw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:wVHTYZy5nis=:leV/QOsRy+klt9pr0rr1GX
 0OpznBJ2TCgyn2XksizOCFLzDVV4U/maXG7iVijGIl/x2acLsLVbak981yRF0crwRhWM8VL0Y
 FmfTMV6G+Q+G/zGSZrMnuuRRmANd7hhyBBHjGVRlAJGdhrtgYXkTckB1A6KhY4dNJAX3agErt
 bULJRS0bBJY6VJFQz8aMgywVmctdOqlczTe3BJXyqcwCgssCKlZOlO6T2cbiBqJ1DTSVHQ7/Q
 yTH6O1t8GG6up8dacDsBihCPydN60UQIFzzNLQbEiH7hu83SIoXLGOXz6giGihUAh57L+1N3e
 KTeNMmlP8bvAwDBeOFoklj7K4SfHURuw6oGI059MQdksufa6i+Bh7VIhnHzLGoRcxJWNdkIAq
 6VBsOvp6WejaRqyrLdJ7Nm3CtReHmVyYYAtLB67+qQDv4CabeDWc6+TUpXMRNpb/CxSUhxPV8
 8EKWLg6tj+KuPiN7CO1Bknjxd3ALym6/8jHpNldZfOGVtMNYVsaFXeliEcOkRgQ0lte/F3w9L
 ryEcNNLHfTxbOGwpVp5pxgdmsL+N6nLM0yk9lfSmv3SbFD2zWtctbMSmpDHmr5Oi0Gw52NV/Z
 6Ai4bhFh5RCMdMqrp2bBL/DZMELXajKyorZcSTKuU+m3voOi/7c8boZFypspk6JnsARVMsojS
 QyAKMdF6waH9y8HWB45OYKbFtvNeo09G5Yx8t7ZRhnzsQFuHYP9fK6ZEcxxqPDh8AZEgz/PtD
 z7VWzn0Q/J5LOdpyygQ1C15sKWOO8zIdqI277Q==
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Here is the collection of patches I have applied to my 'asm-generic' tree
on top of the 'metag' removal. This does not include any of the device
drivers, I'll send those separately to a someone different list of people.

The removal came out of a discussion that is now documented at
https://lwn.net/Articles/748074/

Following up from the state described there, I ended up removing the
mn10300, tile, blackfin and cris architectures directly, rather than
waiting, after consulting with the respective maintainers.

However, the unicore32 architecture is no longer part of the removal,
after its maintainer Xuetao Guan said that the port is still actively
being used and that he intends to keep working on it, and that he will
try to provide updated toolchain sources.

In the end, it seems that while the eight architectures are extremely
different, they all suffered the same fate: There was one company in
charge of an SoC line, a CPU microarchitecture and a software ecosystem,
which was more costly than licensing newer off-the-shelf CPU cores from
a third party (typically ARM, MIPS, or RISC-V). It seems that all the
SoC product lines are still around, but have not used the custom CPU
architectures for several years at this point.

      Arnd

Arnd Bergmann (14):
  arch: remove frv port
  arch: remove m32r port
  arch: remove score port
  arch: remove blackfin port
  arch: remove tile port
  procfs: remove CONFIG_HARDWALL dependency
  mm: remove blackfin MPU support
  mm: remove obsolete alloc_remap()
  treewide: simplify Kconfig dependencies for removed archs
  asm-generic: siginfo: remove obsolete #ifdefs
  Documentation: arch-support: remove obsolete architectures
  asm-generic: clean up asm/unistd.h
  recordmcount.pl: drop blackin and tile support
  ktest: remove obsolete architectures

David Howells (1):
  mn10300: Remove the architecture

Jesper Nilsson (1):
  CRIS: Drop support for the CRIS port

Dirstat only (full diffstat is over 100KB):

   6.3% arch/blackfin/mach-bf548/include/mach/
   4.5% arch/blackfin/mach-bf609/include/mach/
  26.3% arch/blackfin/
   4.1% arch/cris/arch-v32/
   5.6% arch/cris/include/arch-v32/arch/hwregs/iop/
   4.1% arch/cris/include/arch-v32/mach-a3/mach/hwregs/
   4.7% arch/cris/include/arch-v32/
   7.8% arch/cris/
   5.6% arch/frv/
   5.5% arch/m32r/
   7.0% arch/mn10300/
   7.6% arch/tile/include/
   6.4% arch/tile/kernel/
   0.0% Documentation/admin-guide/
   0.0% Documentation/blackfin/
   0.0% Documentation/cris/
   0.0% Documentation/devicetree/bindings/cris/
   0.0% Documentation/devicetree/bindings/interrupt-controller/
   2.8% Documentation/features/
   0.5% Documentation/frv/
   0.0% Documentation/ioctl/
   0.0% Documentation/mn10300/
   0.0% Documentation/
   0.0% block/
   0.0% crypto/
   0.0% drivers/ide/
   0.0% drivers/input/joystick/
   0.0% drivers/isdn/hisax/
   0.0% drivers/net/ethernet/davicom/
   0.0% drivers/net/ethernet/smsc/
   0.0% drivers/net/wireless/cisco/
   0.0% drivers/pci/
   0.0% drivers/pwm/
   0.0% drivers/rtc/
   0.0% drivers/spi/
   0.0% drivers/staging/speakup/
   0.0% drivers/usb/musb/
   0.0% drivers/video/console/
   0.0% drivers/watchdog/
   0.0% fs/minix/
   0.0% fs/proc/
   0.0% fs/
   0.0% include/asm-generic/
   0.0% include/linux/
   0.0% include/uapi/asm-generic/
   0.0% init/
   0.0% kernel/
   0.0% lib/
   0.0% mm/
   0.0% samples/blackfin/
   0.0% samples/kprobes/
   0.0% samples/
   0.0% scripts/mod/
   0.0% scripts/
   0.0% tools/arch/frv/include/uapi/asm/
   0.0% tools/arch/m32r/include/uapi/asm/
   0.0% tools/arch/mn10300/include/uapi/asm/
   0.0% tools/arch/score/include/uapi/asm/
   0.0% tools/arch/tile/include/asm/
   0.0% tools/arch/tile/include/uapi/asm/
   0.0% tools/include/asm-generic/
   0.0% tools/scripts/
   0.0% tools/testing/ktest/examples/
   0.0% tools/testing/ktest/

Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org
Cc: linux-ide@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: linux-pwm@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-mm@kvack.org
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
