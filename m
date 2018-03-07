Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8E4BE7E676
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 23:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934175AbeCGXaZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 18:30:25 -0500
Received: from mail-ua0-f196.google.com ([209.85.217.196]:41906 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933780AbeCGXaY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 18:30:24 -0500
Received: by mail-ua0-f196.google.com with SMTP id u99so2690127uau.8
        for <linux-doc@vger.kernel.org>; Wed, 07 Mar 2018 15:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XhkNdTPQJ7jOTsYucJ+JjXhJsAXzYavXcJCPEJxd/Os=;
        b=ResTCU+QACoAqffc7eZej9ySlbw4h1RDdovF+ROhLenqQEOASDZiujQUzzqxFCVIY+
         ln4rfV0ej7zr3frk2uzh1im3f5Z3q9Os5gM1EubRgKV/2iSDrxwCo6WwAhhJH7RwJG8g
         Df246uGM6nUWNQstn7Ih9wF2rp6RL9VNZTH78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XhkNdTPQJ7jOTsYucJ+JjXhJsAXzYavXcJCPEJxd/Os=;
        b=gBOFfo4ThF4RNHVFC7jaW5ZbPD7MVCVD6tf54NVbcXdJYhl2ZAkTOqpWTC6LgTxHq1
         lSEDmQ1K6TTW1QDucEC27o3a184pW/bcNQPY0PLPg8UASpIbMmSdPSWX6SdsMK78RIiT
         wr3bFNGft9mr/zy2dvML2Mah3oKV1YYHkGhi1d8Iy0QaPjKp6RKHbm4GlsBf+wnci62k
         XH9rC/CDPb+EE56Y0A+dyoC/Qfk/bn7rn+zeIpMOckgUSXeg2BSM5axNvK/gHVKDkCxb
         lzVWE7DPwcsfWRehnHbPTjrLhn5PK4KvYkYIgCMavmUqW6BLfoJapMop7P7wjRSTlaSk
         Ta6w==
X-Gm-Message-State: APf1xPCBrClVKANYSFTFp1Y+QFuy0IQ5uegtZJ0xu36SksND+pxb1241
        eYS1LGvPKoAyF3IRMlJiDCdMPqbvKzBvJAxJP+LEMw==
X-Google-Smtp-Source: AG47ELuTQdEeMEakjGeJm9h38RssXw0JbQWZLwXD8QoG+UoMWkUVUY7KJYn6J4cSZvmH5gMtWHRKyKzeCrwztPrwXkM=
X-Received: by 10.176.49.84 with SMTP id e20mr17472140uam.141.1520465422977;
 Wed, 07 Mar 2018 15:30:22 -0800 (PST)
MIME-Version: 1.0
References: <20180301184335.248378-1-djkurtz@chromium.org>
In-Reply-To: <20180301184335.248378-1-djkurtz@chromium.org>
From:   Daniel Kurtz <djkurtz@chromium.org>
Date:   Wed, 07 Mar 2018 23:30:11 +0000
Message-ID: <CAGS+omCr2YUcAmv9068kR1s4LOqCGij_ps3+9tQ92whVWvGBxg@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Daniel Kurtz <djkurtz@chromium.org>
Cc:     adurbin@chromium.org, Brian Norris <briannorris@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jslaby@suse.com, mingo@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        marc.zyngier@arm.com, frederic@kernel.org, dwmw@amazon.co.uk,
        tom.saeger@oracle.com, zohar@linux.vnet.ibm.com,
        alexander.levin@verizon.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 1, 2018 at 11:43 AM Daniel Kurtz <djkurtz@chromium.org> wrote:

> Currently when an earlycon is registered, the uartclk is assumed to be
> BASE_BAUD * 16 = 1843200.  If a baud rate is specified in the earlycon
> options, then 8250_early's init_port will program the UART clock divider
> registers based on this assumed uartclk.

> However, not all uarts have a UART clock of 1843200.  For example, the
> 8250_dw uart in AMD's CZ/ST uses a fixed 48 MHz clock (as specified in
> cz_uart_desc in acpi_apd.c).  Thus, specifying a baud when using earlycon
> on such a device will result in incorrect divider values and a wrong UART
> clock.

> Fix this by extending the earlycon options parameter to allow
specification
> of a uartclk, like so:

>   earlycon=uart,mmio32,0xfedc6000,115200,48000000

> If none is specified, fall-back to prior behavior - 1843200.

> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>

This general approach is facing resistance, so trying another more targeted
approach to work around the "BASE_BAUD=115200" assumption in arch/x86:

https://patchwork.kernel.org/patch/10265587/
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
