Return-Path: <SRS0=QMax=AL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE44C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 30 Jun 2020 18:44:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B86A206CB
	for <linux-doc@archiver.kernel.org>; Tue, 30 Jun 2020 18:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7fj2XBv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgF3SoY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Jun 2020 14:44:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35616 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726067AbgF3SoY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jun 2020 14:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593542662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PedFDc2DtQMOIGWMojnCcvUFPVJqYYNEpNxS2Hp4sso=;
        b=i7fj2XBv3if4K7+j7KNAQtaSAoTUBGb7H2DlLBcgqbCN6wYRBXx0Nf8ZpZIJyhN8ASuGHe
        /WfS0RGr62yiyTpGbPqU6GWu0w7m7jdDq5ydDEsQ0CbSlbJYpm7648vZNvMZDlpDrE/YIx
        XcXxLo8gf+1H5hMCRIiBme8keSGI62U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-MhzRCPfVPU6mEIMJAxws8w-1; Tue, 30 Jun 2020 14:44:20 -0400
X-MC-Unique: MhzRCPfVPU6mEIMJAxws8w-1
Received: by mail-qk1-f200.google.com with SMTP id j79so15261886qke.5
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2020 11:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PedFDc2DtQMOIGWMojnCcvUFPVJqYYNEpNxS2Hp4sso=;
        b=bOiZf80ruhaLN9kqFWDaDgobTNltRP3VZLxJj1+OJ2SGux6b2MEn/dRqYsC1jGFLnK
         pdzORKloZL9+PLLhd8MKWgotAXGmARiQqEktjvmy/2kAVyPjiBxhP9xX7ZxEEIWEtpL7
         hLNB+YriaWD7R/aa2abTvpYevZ91KFWE/9Xz9g/SrtZdG1KoMWgL2fi3FgXwl0qFt0Zp
         FgzFfZpBjyEFulFTK7AL6CrWhskS/P6mX6oplS4uz02I/tJNewl+h/XZeZqleWzDJZwX
         KJ+gIYvO0ui0T9OG7cgCPeStBPV7kBw8NSUAKd7R6XRwT9lMMNILU29GsP2noTOVA459
         G7oA==
X-Gm-Message-State: AOAM532Ke0ggsgBTqfHzSZWuy0ekDPZP5mYbz50ZeeOMtjdPQPGFas9R
        jplqQm92BcVVNHp9D6AdIVqwvh10KZVC+xlpzYgI2gQEKKWCpzMmz1LrHpgZFQwnAkLCmpPFJMM
        BPvUzdx/lJ2AfOdKQ/cPM
X-Received: by 2002:a37:a14c:: with SMTP id k73mr21323492qke.145.1593542659924;
        Tue, 30 Jun 2020 11:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwBx2LZuulFWLqg/mQP1Ihml2J1c5LqD4NJxngK+OBmKCXx8SAyvZunhLXcfXhUVrRNoRbpA==
X-Received: by 2002:a37:a14c:: with SMTP id k73mr21323479qke.145.1593542659736;
        Tue, 30 Jun 2020 11:44:19 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id a11sm3208689qkh.103.2020.06.30.11.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 11:44:18 -0700 (PDT)
Subject: Re: [RFC 1/1] fpga: dfl: RFC PCI config
To:     Randy Dunlap <rdunlap@infradead.org>, hao.wu@intel.com,
        mdf@kernel.org, corbet@lwn.net
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200630171656.20151-1-trix@redhat.com>
 <20200630171656.20151-2-trix@redhat.com>
 <67f7f2b8-3567-aadd-30d6-4cfbc0bc8ce5@infradead.org>
From:   Tom Rix <trix@redhat.com>
Message-ID: <78a250ab-29ad-f7cb-3fa2-482e76db207a@redhat.com>
Date:   Tue, 30 Jun 2020 11:44:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <67f7f2b8-3567-aadd-30d6-4cfbc0bc8ce5@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> I haven't tested this, but in general it's not safe to select something like
> SENSORS* or HWMON* unless you first check that CONFIG_HWMON is enabled.
> Otherwise this would usually cause kconfig warning(s).
>
> But don't add things like
> 	select HWMON
> 	select SPI
> 	select SPI_MASTER
>
> because we don't enable subsystems (like HWMON or SPI) just inside one
> driver's kconfig entry.
> The driver(s) should instead depend on HWMON, SPI, SPI_MASTER etc.

Yes, I thought this was ugly. The next rev addresses this issue.  The config will not be fully automagic.  User will have enough information in the doc to figure out the other subsystems.  

Tom

