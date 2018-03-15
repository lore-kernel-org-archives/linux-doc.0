Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 387687E677
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 10:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751719AbeCOKm3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 06:42:29 -0400
Received: from mail-io0-f193.google.com ([209.85.223.193]:42140 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751619AbeCOKm1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Mar 2018 06:42:27 -0400
Received: by mail-io0-f193.google.com with SMTP id u84so8006769iod.9;
        Thu, 15 Mar 2018 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ZWtDfsAN0MZ+GvEWwyvYYZHXVAxDF/l0zA8mle5J9/A=;
        b=C0hxn5WZ1WWsK+0UKMxIaU2Q8QrQ1RQtbIx4hctAEy1UZUnSM/CXsbgWYzOnhKUyZA
         tsFntY6MJxcqbD6+1ZH/31lbvCuLHcRPx5pCcSvIm343bdztq0zqLVOmTRi5wKKp0vZ1
         0DLbxs8xMlnuEiAt22iSc9WKSKuVxQLwW4jzAG+Zl4m3S0ANNZiSmEAgl2m+1rMFn+rZ
         W4lDmudmVLQuXzIX/D+48u0GeqYzgzfJjXAv84/kt6iPewqMYSK3Qvmcr8i4W2U76mnP
         Lffzs2GcxwOoPjuAOSapLdjANB17CQumSxIKkQQx8IAEaSqNXRLM7r0hRlwpNKdz69Cm
         2aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=ZWtDfsAN0MZ+GvEWwyvYYZHXVAxDF/l0zA8mle5J9/A=;
        b=C19drKIQpjcALjNC6OXa3KCLI6L+KKVjCUSjntX1H+0fcODBW7mrfiJJ32fWtpySQx
         tzEk6bPqhHz3RTYOSe9oHRg/0sf2OimyPuFxlXdomlIgQbDXG/iCrh5MQCp57UR3G9R0
         PdKUGmFZ9N/7vDRpQDeH/2c1dSL0XQ3Mx+1veyYf1iEyEf+jSuTf2e61Hy1RTtb9aQOy
         ucq0ECJLb+Sj233+whR3plxO0zBh0SbuBy/mrf+xybZ4aAK1nOww3m3q3oJDPy7QbsSK
         cIpflfqhj74Q3hoKJ9Yd1D+EM+HDKZnovEjn7QM48B8SMQtch/aIgSp6oUuDX0UdoiyK
         8cLw==
X-Gm-Message-State: AElRT7Grn08FWkY1WEtB+nBaF1U5ib6UjEvtCsyNvKaK3nA7JkvPd04V
        0vSIxfYJ9w+RQFXtiD6ErpsGZPjmQW61cmNKkrk=
X-Google-Smtp-Source: AG47ELvDThOAhXeoopzNlhr7sk1wlJ5kaxI1y5vHP/frykFEwZXlZ6HbL8zYtn7A5GI1kw6nJFENblo9N0WTIwSGwBo=
X-Received: by 10.107.62.86 with SMTP id l83mr2097916ioa.22.1521110546412;
 Thu, 15 Mar 2018 03:42:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.34.71 with HTTP; Thu, 15 Mar 2018 03:42:25 -0700 (PDT)
In-Reply-To: <6c9d075c-d7a8-72a5-9b2d-af1feaa06c6c@suse.de>
References: <20180314143529.1456168-1-arnd@arndb.de> <2929.1521106970@warthog.procyon.org.uk>
 <6c9d075c-d7a8-72a5-9b2d-af1feaa06c6c@suse.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 15 Mar 2018 11:42:25 +0100
X-Google-Sender-Auth: 8jLxCQUuti_PaQ_nVlrEsrtBKl4
Message-ID: <CAK8P3a01pfvsdM1mR8raU9dA7p4H-jRJz2Y8-+KEY76W_Mukpg@mail.gmail.com>
Subject: Re: [PATCH 00/16] remove eight obsolete architectures
To:     Hannes Reinecke <hare@suse.de>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 15, 2018 at 10:59 AM, Hannes Reinecke <hare@suse.de> wrote:
> On 03/15/2018 10:42 AM, David Howells wrote:
>> Do we have anything left that still implements NOMMU?
>>
> RISC-V ?
> (evil grin :-)

Is anyone producing a chip that includes enough of the Privileged ISA spec
to have things like system calls, but not the MMU parts?

I thought at least initially the kernel only supports hardware that has a rather
complete feature set.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
