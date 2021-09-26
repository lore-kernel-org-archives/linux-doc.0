Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF7FC433F5
	for <linux-doc@archiver.kernel.org>; Sun, 26 Sep 2021 01:53:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD78261019
	for <linux-doc@archiver.kernel.org>; Sun, 26 Sep 2021 01:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhIZBye (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 25 Sep 2021 21:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhIZBye (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 25 Sep 2021 21:54:34 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAC0C061570
        for <linux-doc@vger.kernel.org>; Sat, 25 Sep 2021 18:52:58 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id s11so14015807pgr.11
        for <linux-doc@vger.kernel.org>; Sat, 25 Sep 2021 18:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=JdzglYwYErLJTXq1oXBXFhHc0GGgxDM+bLCxaY6dGRU=;
        b=lPgo9aMzBGclDq2+Jhm0gDVLmgTZgWkFTeQqBrAckEvzR6bvhD/BzA6JiqIlHSkkot
         DGkpUlX+3wW7PZ095DD7IvNtr9e3UUyP7uXOhMmQ/omwbhKVS3s6Lhvc3T0ZeFii8SJ/
         TbWsZJQzBdcBu8qh/OTo6wh84xhB5Nha/aSmSxnJX6QfznLAPaIRrfVb8mFkab4W4g4L
         7O9f6OVt1uxXR7/0e3SWTZQkFd6DDPFZy5R0Xc81EPvfmy7pb79A2Zz6UklIEtfXt85q
         I51OpWsnaETP6p4qdoG/RB+CHnBDjGrC+/EG67JuN93Zv5Ec7BrAdepHBzdhuIvwtYTr
         GX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=JdzglYwYErLJTXq1oXBXFhHc0GGgxDM+bLCxaY6dGRU=;
        b=zPvBPQk8I1PbujbcedKWsIMrfk5y/ql0s2nHz/zSvPrPlmiZfIi49K54GN2XRZLPGU
         8e5PT+O+GwedrI7J2KqJwS2MXNNM/fA72mCKZxNRURgnrjKi3YOLwbpEKqjE0uddbAHk
         4hnRHz+HTysGslZUf7Chg+ZEQO6q7H9vZnNo+ANbKeDHmIwpg8pzfipOp/izlKI4t990
         GjEQrGu3WNw3gbzmX6o60uPp25uKu432pvuN+bcC5CxUMRgveCw5BoTXUIuBXpQ3ydeo
         uKZAGXKpviFQ8lYbfF6VfQNlEJNc3mz7Fbk1xtvn5ePkzptPeVgMFxC72Tbl7N6Rxgjy
         CAAA==
X-Gm-Message-State: AOAM531rdUM9bBCv+PPvprpsIU5CwrH8y6obR69Axh7xcxAOAx461fXv
        o5gzXIPAWUZ0ZA/EQsNTk4pvkNeHb1ms1Q==
X-Google-Smtp-Source: ABdhPJzKCUPWqbooOeb8NvJYGPkM/dqOUV5Z966VD4m6o+vrlG3Njt4GTmX35SsP47FCddT0Qqre8g==
X-Received: by 2002:aa7:968e:0:b0:447:a593:926e with SMTP id f14-20020aa7968e000000b00447a593926emr16837081pfk.27.1632621178040;
        Sat, 25 Sep 2021 18:52:58 -0700 (PDT)
Received: from [192.168.28.11] ([172.58.139.12])
        by smtp.gmail.com with ESMTPSA id b11sm14471696pge.57.2021.09.25.18.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Sep 2021 18:52:57 -0700 (PDT)
To:     toybox <toybox@lists.landley.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Rob Landley <rob@landley.net>
Subject: Does anybody want to create a new "man 2 ioctl_list"?
Message-ID: <084d63f5-c764-837b-e460-69132f430a3b@landley.net>
Date:   Sat, 25 Sep 2021 21:12:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Michael Kerrisk deleted the old ioctl_list man page last year because nobody was
maintaining it:

https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/man2?id=3de87d46840d

But it's not actually that _hard_, just time consuming. There are about 3500
interesting ioctl macro definitions in the current kernel source:

  $ egrep --include '*.[ch]' -r '[^A-Z]_IO(|C|W|R|WR)[(]' * | \
    grep -v 'drivers/staging' | grep -v 'tools/' | wc -l
  3533

Each of which boils down to some entry point handling it and handing it off to a
function that does a thing. Random example, the symbol SPI_IOC_RD_MODE from the
above list (without the wc -l) greps to drivers/spi/spidev.c in function
spidev_ioctl which winds up being:

        case SPI_IOC_RD_MODE:
                retval = put_user(spi->mode & SPI_MODE_MASK,
                                        (__u8 __user *)arg);

which is struct spi_device *spi; which is defined in include/linux/spi/spi.h
(Trick: grep spi_device include/ -r | grep '{' ) and then there's a comment
block before the header which has:

 * @mode: The spi mode defines how data is clocked out and in.
 *      This may be changed by the device's driver.
 *      The "active low" default for chipselect mode can be overridden
 *      (by specifying SPI_CS_HIGH) as can the "MSB first" default for
 *      each word in a transfer (by specifying SPI_LSB_FIRST).

So that ioctl reads that info into the supplied field.

It would be really nice if there was an automated way to do this, but so far...

Rob
