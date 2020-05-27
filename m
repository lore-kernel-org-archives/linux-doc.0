Return-Path: <SRS0=njH7=7J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E27BC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 27 May 2020 15:00:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE0212088E
	for <linux-doc@archiver.kernel.org>; Wed, 27 May 2020 15:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HqyZ62wq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389496AbgE0PAy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 May 2020 11:00:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60289 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389431AbgE0PAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 May 2020 11:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590591650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S79dLGaDC34U88k/muBN2/cWWvIJSeZD2zX/jWO3DQQ=;
        b=HqyZ62wq65EjS28vdAkZgOXOiZGvFEBIZt52vgHPIGALvC4SBd/OsoRKQ+/gosi/E83S4r
        fqGfTikqbMJxOWSE7qNWiGBAIZYKSKq+YtdmDRNH6EGFTZM+l9oVkqQECwy1QfO0UyJVXg
        FBpgINzedbcMRW9ijZ5JL5R3qvWXdRg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-A2JVuz5jN969J-BHzOqnFg-1; Wed, 27 May 2020 11:00:47 -0400
X-MC-Unique: A2JVuz5jN969J-BHzOqnFg-1
Received: by mail-ed1-f71.google.com with SMTP id bm11so10147402edb.8
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2020 08:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S79dLGaDC34U88k/muBN2/cWWvIJSeZD2zX/jWO3DQQ=;
        b=cNmYwtfAhyo2fpUbY2o4y18z5WmqT4EqlkQrrWKCiQnrek7s3CpSsdbBoxpWkN1EP4
         Vrbb76ZJWafRTzmBgQkPYsnro96MsAMeR5lRYIIVbtPN8vRIEzl+VsDE7AiH/srXIThv
         MRswa01e3oo20sT7JsoWGBlTM67djfAlWn6x/Q0euVrLbNNNkbG4pPXU9UzrVnD4x6X/
         +gGrBLt6Zyt4cUhcRn/K+7t3K0NEmSCPRPQ2H/CkAuPE2pFMOAhxBDT4wd09NJKKrs6z
         m5a9aEVd+fQckNEe1V3sJrXkhKcA7HZyaZpBJ/S5mdAElOsN3Cntas6CXxoYm4b7OPe4
         oBuw==
X-Gm-Message-State: AOAM530PEflWtjQ5lvuSUbm+yMPXQFd2O41P3b1u8D/aaBszEgkeDnju
        sJM+wwZcWGd774rBCKiKM7BEK2KJN7N3FVdCu1zHWW4K4dxk27w73CGJpQFiNJ+Og4l/oNPyTvD
        OmXCt/OQX1eBqSkn0JuSx
X-Received: by 2002:a17:906:1442:: with SMTP id q2mr3491288ejc.33.1590591646007;
        Wed, 27 May 2020 08:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxzNY5UhO1mssuYEm2F2UYGESNfuhTc2d/FaV+VoTyW39e+803AKyGa34dCi6Lxc3HyJGruA==
X-Received: by 2002:a17:906:1442:: with SMTP id q2mr3491234ejc.33.1590591645542;
        Wed, 27 May 2020 08:00:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8? ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
        by smtp.gmail.com with ESMTPSA id l1sm3053400ejd.114.2020.05.27.08.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 08:00:45 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
To:     Andrew Lunn <andrew@lunn.ch>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, kvm@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Jim Mattson <jmattson@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
        David Rientjes <rientjes@google.com>,
        Jonathan Adams <jwadams@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <6a754b40-b148-867d-071d-8f31c5c0d172@redhat.com>
 <20200527133309.GC793752@lunn.ch>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b0d11337-3ea4-d874-6013-ff8c3e9d6f26@redhat.com>
Date:   Wed, 27 May 2020 17:00:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200527133309.GC793752@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/05/20 15:33, Andrew Lunn wrote:
>> I don't really know a lot about the networking subsystem, and as it was
>> pointed out in another email on patch 7 by Andrew, networking needs to
>> atomically gather and display statistics in order to make them consistent,
>> and currently this is not supported by stats_fs but could be added in
>> future.
> 
> Do you have any idea how you will support atomic access? It does not
> seem easy to implement in a filesystem based model.

Hi Andrew,

there are plans to support binary access.  Emanuele and I don't really
have a plan for how to implement it, but there are developers from
Google that have ideas (because Google has a similar "metricfs" thing
in-house).

I think atomic access would use some kind of "source_ops" struct
containing create_snapshot and release_snapshot function pointers.

Paolo

