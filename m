Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EC9C433E6
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 14:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B46E64F51
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 14:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbhBBOfg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Feb 2021 09:35:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48345 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234625AbhBBOeb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Feb 2021 09:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612276384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MOfLz2ooS1YVxqAqeLs03INDucXpuqKyLYasthASKR4=;
        b=fkp4KvtsAwTJnW0l8wYhfrP42SJuWM8LFePUnV/Bgw8XJKb7fTNRpL3m4qg7+rforVtgM/
        d7XaJOscg1QQaGIfSjHKadrLwEJfXy3ezZWil2BYes07cQHVdTusPXp7denGBIGQT+ul5B
        df2ACjYASuvgOnD3Tc7djSitQNcSzJc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-R8-N6IRmP1-dbwJ2k0D-cw-1; Tue, 02 Feb 2021 09:33:02 -0500
X-MC-Unique: R8-N6IRmP1-dbwJ2k0D-cw-1
Received: by mail-wr1-f70.google.com with SMTP id p16so12308897wrx.10
        for <linux-doc@vger.kernel.org>; Tue, 02 Feb 2021 06:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MOfLz2ooS1YVxqAqeLs03INDucXpuqKyLYasthASKR4=;
        b=N5wGNvTlZT5f03njeBipL3vbGFmMmF/2CxBPakl64GgIRrqiQngfRRmyViElpmGn2c
         6+rKluJ5Vkkz2truOcuKc3JK+eWbxOdtHViuiNDwcap2QZMziJSlhM39ZC1RSR9QOa3l
         iAKGhS2omii889h7a3EVIPshON2D2uJ/dsFoRE9zAq1IkQ/wdE/fgl1HBijjSNMFWIKy
         m5lNrr+Tta3+MMc8BSjkIWqjjp3QTEgXdwuWsA86IJjsHVmayzCoWweFL+jjX3XT3V7j
         x54FtRD1aHj7S/EMOkvvU6MuuYqGEfHX81PGB8hpzZf9v3IG5C8kb/smBXtAO/Y80nya
         Tdgg==
X-Gm-Message-State: AOAM532YGLjP+SJArnRTep2POpIsmWd/nHQHB/kXMNqEoqAKyJYWTOzr
        z8gT4csg21mexgJiywYskV06ipBci8XGHE7eEh7YlvBH6Jzqk2vuTRrnPmTr1VpFvAWWs8FEqVr
        6bFcMSDxQz9uZDEKX8rky
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr24388390wrd.118.1612276379286;
        Tue, 02 Feb 2021 06:32:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNlKeX+el7cMOrZK5yq6RtSBJMhNR+o0snQl4QXFgxLrVEgd3S6vtJXgCeHmPNLUWxDwZ7tg==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr24388360wrd.118.1612276379086;
        Tue, 02 Feb 2021 06:32:59 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
        by smtp.gmail.com with ESMTPSA id b138sm3242759wmb.35.2021.02.02.06.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 06:32:54 -0800 (PST)
Date:   Tue, 2 Feb 2021 09:32:50 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Adrian Catangiu <acatan@amazon.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        kvm@vger.kernel.org, linux-s390@vger.kernel.org,
        gregkh@linuxfoundation.org, graf@amazon.com, arnd@arndb.de,
        ebiederm@xmission.com, rppt@kernel.org, 0x7f454c46@gmail.com,
        borntraeger@de.ibm.com, Jason@zx2c4.com, jannh@google.com,
        w@1wt.eu, colmmacc@amazon.com, luto@kernel.org, tytso@mit.edu,
        ebiggers@kernel.org, dwmw@amazon.co.uk, bonzini@gnu.org,
        sblbir@amazon.com, raduweis@amazon.com, corbet@lwn.net,
        mhocko@kernel.org, rafael@kernel.org, mpe@ellerman.id.au,
        areber@redhat.com, ovzxemul@gmail.com, avagin@gmail.com,
        ptikhomirov@virtuozzo.com, gil@azul.com, asmehra@redhat.com,
        dgunigun@redhat.com, vijaysun@ca.ibm.com, oridgar@gmail.com,
        ghammer@redhat.com
Subject: Re: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <20210202092418-mutt-send-email-mst@kernel.org>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <1610453760-13812-2-git-send-email-acatan@amazon.com>
 <20210127221505.GB24799@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127221505.GB24799@amd>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 27, 2021 at 11:15:05PM +0100, Pavel Machek wrote:
> Hi!
> 
> > - Solution
> > 
> > The System Generation ID is a simple concept meant to alleviate the
> > issue by providing a monotonically increasing u32 counter that changes
> > each time the VM or container is restored from a snapshot.
> 
> I'd make it u64.
> 
> But as people explained, this has race problems that may be impossible
> to solve?

Well the read/write interface could be used in a safe way thinkably:

- application checks VM gen id
- application sends a transaction e.g. to  database
- application re-checks VM gen id
- if id changed, application checks the database for duplicate
  transactions

not sure how can the mmap interface be used safely.
Drop it for now?



> Best regards,
> 								Pavel
> 								
> -- 
> http://www.livejournal.com/~pavelmachek


