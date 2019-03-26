Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD01C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Mar 2019 18:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732369AbfCZSSu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Mar 2019 14:18:50 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45058 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731904AbfCZSSu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Mar 2019 14:18:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id m16so11624417edd.12;
        Tue, 26 Mar 2019 11:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bsow1X4q7i7i6LGYg9TTZCc77skn5gkjBjb0nG6qTh0=;
        b=S06fW6+Vc68JhbO2O8sGjQBcpsij7sqKANemcaZDdLfnQVZUc7AlJWBfbK1t9VJb9u
         m2LckdhphjxSJ9p876wRnhR0k6YLY/coGtOVkRploKS3YSuhcp+trl0WDrLBM7aiV6V4
         QVzjaQxOQZ07/+Z/Y2SbeIib9LYJu6paYfv8NIgDRUiNH6Cy7pQgVIzrNK1D+kH56wkL
         PJEWapuQKbPaKXRIrXnY4pXePDGYfN0YPqda/p1iDSxjXaCd3yw4Du8lWThVFR3VMeVl
         KeZCWlxF0WZQjPKsC1aTJ2qS7vGhe1yDrMFpr3J18a4aylo7kGX2N2SnorLbxsbps60x
         zjFQ==
X-Gm-Message-State: APjAAAXd/mBiHpzKgnmb7osOqIX0K4b9UWc5CUet3BkG3bBnJywLD6gl
        CLLDXLKdzjf34bo3KXTULdIKco2EAdloqOwn8NY=
X-Google-Smtp-Source: APXvYqzVw5QthfJaMGAusoK83QXzFzkNhkkZDC34WiWPY+JZSlhTmxVNiQqRd1pruZ9OiKZanE519ABh2LV+AWr4QoU=
X-Received: by 2002:a50:89fa:: with SMTP id h55mr21083002edh.296.1553624328651;
 Tue, 26 Mar 2019 11:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <e2810a5317d3a109a98204e883fd1461f77b9339.1551160674.git.len.brown@intel.com>
 <43f15c3d7b5e0fd7e3f257d4c0736200f6198971.1551160674.git.len.brown@intel.com> <20190307144552.GC19434@e105550-lin.cambridge.arm.com>
In-Reply-To: <20190307144552.GC19434@e105550-lin.cambridge.arm.com>
From:   Len Brown <lenb@kernel.org>
Date:   Tue, 26 Mar 2019 14:18:37 -0400
Message-ID: <CAJvTdKmmYSvwqbo35+ON8qauRTxAt5+nOkriFwcRVHkTmPtPcQ@mail.gmail.com>
Subject: Re: [PATCH 05/14] cpu topology: Export die_id
To:     Morten Rasmussen <morten.rasmussen@arm.com>
Cc:     X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org,
        Len Brown <len.brown@intel.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 7, 2019 at 9:45 AM Morten Rasmussen
<morten.rasmussen@arm.com> wrote:

> Can we add the details about die_id further down in cputopology.txt as
> well?

Done.

> > diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> > --- a/arch/x86/include/asm/topology.h
> > +++ b/arch/x86/include/asm/topology.h
...
> > +#define topology_die_id(cpu)                 (cpu_data(cpu).cpu_die_id)
> >  #define topology_core_id(cpu)                        (cpu_data(cpu).cpu_core_id)

> The above is x86 specific and seems to fit better with the next patch in
> the series.

No problem, I split that x86 line into a separate x86-specific patch.

thanks Morten,

Len Brown, Intel Open Source Technology Center
