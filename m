Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8771A7E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 04:50:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750847AbeCPEub (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 00:50:31 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:37477 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750748AbeCPEu3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Mar 2018 00:50:29 -0400
Received: by mail-pf0-f193.google.com with SMTP id h11so3744758pfn.4;
        Thu, 15 Mar 2018 21:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZXG8LVzkueKq1SonOB8yr+3uUuDvpTn4DAMWyUhXHBU=;
        b=iuaRYmtA+z61K1rC32NNSz5v5YxY76I/jCU0cY/c2pp0+qurA0L3ZkKskFIrPaZuFI
         FAoQJdfB2sQKkC/RRUpjSDb4SxAYx+ciAdllsargWNZE2XsRDWO+BLorugEz7o6oxhMZ
         7jM7ILb74Poa9uP88CovtvRN2VedKL7XJydvhSAl754JZ9iTXnKZGTUBUvRkwOngXRwO
         jVLj1BTYUK8HXK40Ycymu1DQ+92uYpcG8ajFeBODzgU2Zfs/9MOZCiKSS84Z6e3YEejJ
         epkUryDu1r9jiUvIgCI0hvZJ2i3JVy9TuMJorfeit4CEUQD+Og2HAkXjhySkW2zhPmF2
         FHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZXG8LVzkueKq1SonOB8yr+3uUuDvpTn4DAMWyUhXHBU=;
        b=WgYnPh/THZ+6dz2VGrHMGuzDgJ2RRTYcIEFlfwC7pcNQel8Mq4BdicCOUabWkHrDCB
         4HfcRfx0NkRgqJmpx+x/dcLrKJcn4+vNZNv3LQ9DmQnBH9gOO3AA4IT4LXQ6jEa7A8kX
         9ZNigmE0gis9w6yjrPQc8nOIHVphzYDvf3puAVCAP+CJ6Q4jwVC0JzlHKiZ6Sn0fjpy6
         2u70UH4HYDguq0o3HYxEHlpqJ/V2bMGDHsFyTSOY0mhUfTruaD8/fWmiUX+uGfAxuD/l
         FzR4WHYdXw/Tj07f0HZg3nprMfgDBqx7fwfuGdKSQ3wKjsxSfx8OUfbkxIBJYdo2KpnR
         iQIw==
X-Gm-Message-State: AElRT7G5uxZIATUOxNbZDJixubmDmvLCssxOX/MM16hQ0+gIAdROxmGl
        sOvFFvdXOUgT4BPG1EI9bmI=
X-Google-Smtp-Source: AG47ELszBUow7lgV6sAHIE9oAlYxOIDc0e6j/J7/lnECCjCcTf7gn494naIk/nRl9KUDIO06gq2Y3Q==
X-Received: by 10.101.97.139 with SMTP id c11mr365964pgv.447.1521175828444;
        Thu, 15 Mar 2018 21:50:28 -0700 (PDT)
Received: from localhost ([223.186.166.178])
        by smtp.gmail.com with ESMTPSA id f23sm12238195pfn.132.2018.03.15.21.50.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Mar 2018 21:50:27 -0700 (PDT)
Date:   Fri, 16 Mar 2018 10:20:16 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     David Howells <dhowells@redhat.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        IDE-ML <linux-ide@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi <linux-spi@vger.kernel.org>, linux-usb@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Subject: Re: [PATCH 00/16] remove eight obsolete architectures
Message-ID: <20180316045016.GA7697@afzalpc>
References: <20180314143529.1456168-1-arnd@arndb.de>
 <2929.1521106970@warthog.procyon.org.uk>
 <CAK8P3a10hBz7QYk5v5MfhVMPOwFnWYTn95WZp1HtHrd7-GQpRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a10hBz7QYk5v5MfhVMPOwFnWYTn95WZp1HtHrd7-GQpRg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thu, Mar 15, 2018 at 10:56:48AM +0100, Arnd Bergmann wrote:
> On Thu, Mar 15, 2018 at 10:42 AM, David Howells <dhowells@redhat.com> wrote:

> > Do we have anything left that still implements NOMMU?

Please don't kill !MMU.

> Yes, plenty.

> I've made an overview of the remaining architectures for my own reference[1].
> The remaining NOMMU architectures are:
> 
> - arch/arm has ARMv7-M (Cortex-M microcontroller), which is actually
> gaining traction

ARMv7-R as well, also seems ARM is coming up with more !MMU's - v8-M,
v8-R. In addition, though only of academic interest, ARM MMU capable
platform's can run !MMU Linux.

afzal

> - arch/sh has an open-source J2 core that was added not that long ago,
> it seems to
>   be the only SH compatible core that anyone is working on.
> - arch/microblaze supports both MMU/NOMMU modes (most use an MMU)
> - arch/m68k supports several NOMMU targets, both the coldfire SoCs and the
>   classic processors
> - c6x has no MMU
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
