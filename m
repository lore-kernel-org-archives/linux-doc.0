Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0EC517D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 22:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbfADWOY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 17:14:24 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:40247 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfADWOY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 17:14:24 -0500
Received: by mail-lf1-f51.google.com with SMTP id v5so26386925lfe.7
        for <linux-doc@vger.kernel.org>; Fri, 04 Jan 2019 14:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=M/8wGXkGpm/xk6H6zVGsJG9P9t+6/qgN0t02TsVaqmQ=;
        b=sc5yB6OQuLMPoTgeD8Llbbs5o3c2GkmXYakJD4wdhdmTo/TWTgT7E9S3+1qRULdyRC
         a2bA8tbhYQB1hg9YSpe4mNIE7w2g8xoTaQWxFPOFCQF1kGb5WY1dDFsEa/P7fvRdjBlt
         IHAbZmRmsUF7wTYQL13EC7AjlGVNRP1PRE2YReZDGYoHXJmY13Cg6tPq4YM4ljyBUYT9
         v3eP83gA3yc6T04Maey/5JJieOEzqYiuy4/+phc2RdDwnvaZyACWGVE68/9uIb0PRDfo
         hPbX+43tpqTQvfqqPop3MM0h/GLaL2SFjgPfUtHIRuSWegfvK1Lt+kTfZ9ejeFMTWaVi
         q6yg==
X-Gm-Message-State: AA+aEWbRhcm3wtZ8Ul3xvCfnEBl67Rxdjv/jeImNQp1TqZiaXP36bEmC
        b08dHkIz59qCT+y2EUkczLZDA2njc0tsGdq0ekzJmzqayw8=
X-Google-Smtp-Source: AFSGD/VAIWyfNhKr0rPUZ1nf6sLdEQR0yquIDxCYGuUipc2wou+TIWMk4K1xfFUs603640LCa1RhW9PxT22hgHU7gxE=
X-Received: by 2002:a19:22c2:: with SMTP id i185mr28633270lfi.2.1546640062035;
 Fri, 04 Jan 2019 14:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20181201005239.27471-1-mcroce@redhat.com>
In-Reply-To: <20181201005239.27471-1-mcroce@redhat.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Fri, 4 Jan 2019 23:13:46 +0100
Message-ID: <CAGnkfhzfQB-4WHri2hDPEXy87Uzch6=DTE4SEo5Jy0YodoB=ZQ@mail.gmail.com>
Subject: Re: [RFC] Documentation: use RFC 5735 subnet for examples
To:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 1, 2018 at 1:52 AM Matteo Croce <mcroce@redhat.com> wrote:
>
> RFC 5735 defines this subnets for documentation and example code:
>
>   192.0.2.0/24 as TEST-NET-1
>   198.51.100.0/24 as TEST-NET-2
>   203.0.113.0/24 as TEST-NET-3
>
> Replace where possible the IP addresses in the documentation with
> addresses belonging to the test subnets.
>

Ping, any comment, veto, or objection on this?

Regards,
-- 
Matteo Croce
per aspera ad upstream
