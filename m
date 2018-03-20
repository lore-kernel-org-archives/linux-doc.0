Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3D8E7DE76
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 17:12:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751834AbeCTRMN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 13:12:13 -0400
Received: from mail-pf0-f193.google.com ([209.85.192.193]:40510 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751522AbeCTRLs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 13:11:48 -0400
Received: by mail-pf0-f193.google.com with SMTP id x1so887320pfh.7
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=2CFOtttD5OuL9wCpzLUN7T4BNKbV/NX4o0OcBCvVg2A=;
        b=ZCgikdYvaVaB12TYZSjx6+IXhWsU9TMVSQZez4ptO1BAJ/2vPe7r+DHoAuGpd3fAQF
         egGoEhkDrirHZ/mnAPa029rrV6egXUfg2uWdFoaaRtl6I+d6ctaQb6AVO/cJqQgKyd2z
         tP6e1sDo8CTPmxARcygrn/S2cZJ7Wjm5ok8ALbR26VptKknkyLT+BFyXFHhN/0UtNl++
         E3AOby10+M3MsLqCMSmLSrUX15poSmkPE5/KmvImLh5tnIx2bEri/LFHmPKjHMxTDnHE
         //hC/Z8pwtlOvOelk7zIjgWzpbNNbzWA0lNilRsEBhx2PxhW3E3TnSLX5/L9Nds5RxIt
         GZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=2CFOtttD5OuL9wCpzLUN7T4BNKbV/NX4o0OcBCvVg2A=;
        b=McgKQstAxhUQFZu3bBxEbEzn6lwU2NTQhppgHiQ/eoEtFT0ASQoHnFhDmBZuJLI6Jh
         SrjLDG9JpkrVWuk0Oh2UFp/lYjo4ZNqB6ttXZT4dLqb21F/8s4zG8gZLixHJQ38wg5kq
         zDdYppFgJwinRztU7grC5k2VqcSixtW7XWHBTtCW0WY1rqsdjB5Qyf5EQejymyHzMrVV
         iuouQSxUiNoO5vM3fKNFisPM9lRbPm0VwBNdmUN7YC6Z3gHXOqT3QLri9sz76ErD6A9x
         XYszEEPN9IbRltVjzt/xWR6g9NnJ38Y2B1ATZHjgA/NRMOJckIIFPlNW9PygoZfZ0Fwo
         WhJQ==
X-Gm-Message-State: AElRT7FJ4dHygoS4vmHkcQ6aPwi9IQooeQIwSCXZupxKFwTi2K3SGZMO
        upzxhFp7BDvy57H0mhEot1Niqw==
X-Google-Smtp-Source: AG47ELuMxOFzugm09+HMnP33/rXnHfvMfaq2EX6Yrhp+puW00QaTiWKcDwXN28nuFmRqjJRTfmSNEg==
X-Received: by 10.99.47.4 with SMTP id v4mr3154910pgv.42.1521565908309;
        Tue, 20 Mar 2018 10:11:48 -0700 (PDT)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id s7sm3843724pgr.90.2018.03.20.10.11.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Mar 2018 10:11:47 -0700 (PDT)
Date:   Tue, 20 Mar 2018 10:11:47 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Mar 2018 10:01:23 PDT (-0700)
Subject:     Re: [PATCH 00/16] remove eight obsolete architectures
In-Reply-To: <CAK8P3a01pfvsdM1mR8raU9dA7p4H-jRJz2Y8-+KEY76W_Mukpg@mail.gmail.com>
CC:     hare@suse.de, dhowells@redhat.com, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-input@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-f6731cb9-8394-419d-b14b-c6fcd6c0930d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 15 Mar 2018 03:42:25 PDT (-0700), Arnd Bergmann wrote:
> On Thu, Mar 15, 2018 at 10:59 AM, Hannes Reinecke <hare@suse.de> wrote:
>> On 03/15/2018 10:42 AM, David Howells wrote:
>>> Do we have anything left that still implements NOMMU?
>>>
>> RISC-V ?
>> (evil grin :-)
>
> Is anyone producing a chip that includes enough of the Privileged ISA spec
> to have things like system calls, but not the MMU parts?
>
> I thought at least initially the kernel only supports hardware that has a rather
> complete feature set.

We currently do not have a NOMMU port.  As far as I know, everyone who's
currently producing RISC-V hardware with enough memory to run Linux has S mode
with paging support.  The ISA allows for S mode without paging but there's no
hardware for that -- if you're going to put a DRAM controller on there then
paging seems pretty cheap.  You could run a NOMMU port on a system with S-mode
and paging, but With all the superpage stuff I don't think you'll get an
appreciable performance win for any workload running without an MMU so there's
nothing to justify the work (and incompatibility) of a NOMMU port there.

While I think you could implement a NOMMU port on a machine with only M and U
modes (and therefor no address translation at all), I don't know of any MU-only
machines that have enough memory to run Linux (ours have less than 32KiB).  A
SBI-free Linux would be a prerequisite for this, but there's some interest in
that outside of a NOMMU port so it might materialize anyway.

Of course, QEMU could probably be tricked into emulating one of these machines
with little to no effort :)...  That said, I doubt we'll see a NOMMU port
materialize without some real hardware as it's a lot of work for a QEMU-only
target.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
