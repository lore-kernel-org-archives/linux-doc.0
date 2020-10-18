Return-Path: <SRS0=QA7a=DZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954A8C43467
	for <linux-doc@archiver.kernel.org>; Sun, 18 Oct 2020 15:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53A79207DE
	for <linux-doc@archiver.kernel.org>; Sun, 18 Oct 2020 15:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXW2s2cw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgJRPwR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Oct 2020 11:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35735 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726364AbgJRPwQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Oct 2020 11:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603036335;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=98NF5I6kW3PEIcXhLOKqmMDjTo2gmlFaETZTllsyzbc=;
        b=eXW2s2cwTi3F4VGWSjbxrULm7vx2pqBo7Whj+hIXq++u8mHniFXW5Q1gYjpYGtP3FQMdBS
        P7X5fIKFbLSTuF3/Um9jfD3L8qBl7W/kAuX7rdPfgcvBIZW6krwibdxjOr/6VqVti4hIw3
        7/e7ngcdJ1zz64Krp6RkYXZM/Gx+tbo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-U3Uh1sCNPzyjG2_26qnPHQ-1; Sun, 18 Oct 2020 11:52:13 -0400
X-MC-Unique: U3Uh1sCNPzyjG2_26qnPHQ-1
Received: by mail-wr1-f69.google.com with SMTP id k14so6271822wrd.6
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2020 08:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=98NF5I6kW3PEIcXhLOKqmMDjTo2gmlFaETZTllsyzbc=;
        b=mC+Npt7R/QOnXPLKZk2cP2msc7je2Pq0NhNHwgNjliqrnke7D8le00SKLML8rIfh0s
         KGInpDPPtjwc4sFd5q0G4AdgIqjFHoHe4pwmwkA0eaqkGUIpDxQDqArf+W4aW++NRUZk
         mCEjz2xq5TmQ76UzpcEpkCM2eGuwYLlhf+B/9xiz4sOHDmRodIAiM/YZ7j8SxyAWCFqG
         sh+ZWZPKaouXZ+z0xCL8YAMTBh+Jz2OwncnuQB+6BZSK9SeSOuYw9CqORbo9sTGJnS4a
         PgA5feLWckRU17Yz+mZcrjkedAAfJbTBsDvO66P7T69XWFUa4kmzudcO+KG97UPBtiXL
         Fxfg==
X-Gm-Message-State: AOAM533O8Yi03omfF8KeVS8n3Ng+SBflv0tWSk/d+AvpwSBFp4z1E4xi
        f5JYARyEKdqfvTi06FnB6SHgU5YWD8MJCvsGV32oqrScZdiV8MwYNSnNR/S4wI40zoTET6+OkIx
        tDQqb1igrpX5Kbti269yl
X-Received: by 2002:a05:6000:1084:: with SMTP id y4mr14633141wrw.138.1603036332032;
        Sun, 18 Oct 2020 08:52:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDk0m1PaAgQbG5uGn8JDuTOpRDE6IZs81q1mD08uCdggM28IdBmZmD2H7MRJNdhDzXVGo/nQ==
X-Received: by 2002:a05:6000:1084:: with SMTP id y4mr14633124wrw.138.1603036331866;
        Sun, 18 Oct 2020 08:52:11 -0700 (PDT)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
        by smtp.gmail.com with ESMTPSA id i8sm12624962wmd.14.2020.10.18.08.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 08:52:11 -0700 (PDT)
Date:   Sun, 18 Oct 2020 11:52:06 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Jann Horn <jannh@google.com>, Willy Tarreau <w@1wt.eu>,
        Colm MacCarthaigh <colmmacc@amazon.com>,
        "Catangiu, Adrian Costin" <acatan@amazon.com>,
        Andy Lutomirski <luto@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        "Graf (AWS), Alexander" <graf@amazon.de>,
        "Woodhouse, David" <dwmw@amazon.co.uk>, bonzini@gnu.org,
        "Singh, Balbir" <sblbir@amazon.com>,
        "Weiss, Radu" <raduweis@amazon.com>, oridgar@gmail.com,
        ghammer@redhat.com, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Qemu Developers <qemu-devel@nongnu.org>,
        KVM list <kvm@vger.kernel.org>,
        Michal Hocko <mhocko@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Linux API <linux-api@vger.kernel.org>
Subject: Re: [PATCH] drivers/virt: vmgenid: add vm generation id driver
Message-ID: <20201018114625-mutt-send-email-mst@kernel.org>
References: <CAG48ez0EanBvDyfthe+hAP0OC8iGLNSq2e5wJVz-=ENNGF97_w@mail.gmail.com>
 <20201017033606.GA14014@1wt.eu>
 <CAG48ez0x2S9XuCrANAQbXNi8Jjwm822-fnQSmr-Zr07JgrEs1g@mail.gmail.com>
 <6CC3DB03-27BA-4F5E-8ADA-BE605D83A85C@amazon.com>
 <CAG48ez1ZtvjOs2CEq8-EMosPCd_o7WQ3Mz_+1mDe7OrH2arxFA@mail.gmail.com>
 <20201017053712.GA14105@1wt.eu>
 <CAG48ez1h0ynXfGap_KiHiPVTfcB8NBQJ-2dnj08ZNfuhrW0jWA@mail.gmail.com>
 <20201017064442.GA14117@1wt.eu>
 <CAG48ez3pXLC+eqAXDCniM0a+5yP2XJODDkZqiUTZUOttCE_LbA@mail.gmail.com>
 <CAHmME9qHGSF8w3DoyCP+ud_N0MAJ5_8zsUWx=rxQB1mFnGcu9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qHGSF8w3DoyCP+ud_N0MAJ5_8zsUWx=rxQB1mFnGcu9w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 17, 2020 at 03:24:08PM +0200, Jason A. Donenfeld wrote:
> 4c. The guest kernel maintains an array of physical addresses that are
> MADV_WIPEONFORK. The hypervisor knows about this array and its
> location through whatever protocol, and before resuming a
> moved/snapshotted/duplicated VM, it takes the responsibility for
> memzeroing this memory. The huge pro here would be that this
> eliminates all races, and reduces complexity quite a bit, because the
> hypervisor can perfectly synchronize its bringup (and SMP bringup)
> with this, and it can even optimize things like on-disk memory
> snapshots to simply not write out those pages to disk.
> 
> A 4c-like approach seems like it'd be a lot of bang for the buck -- we
> reuse the existing mechanism (MADV_WIPEONFORK), so there's no new
> userspace API to deal with, and it'd be race free, and eliminate a lot
> of kernel complexity.

Clearly this has a chance to break applications, right?
If there's an app that uses this as a non-system-calls way
to find out whether there was a fork, it will break
when wipe triggers without a fork ...
For example, imagine:

MADV_WIPEONFORK
copy secret data to MADV_DONTFORK
fork


used to work, with this change it gets 0s instead of the secret data.


I am also not sure it's wise to expose each guest process
to the hypervisor like this. E.g. each process needs a
guest physical address of its own then. This is a finite resource.


The mmap interface proposed here is somewhat baroque, but it is
certainly simple to implement ...

-- 
MST

