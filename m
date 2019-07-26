Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A1C8F7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 22:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfGZWKg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 18:10:36 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46708 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfGZWKf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 18:10:35 -0400
Received: by mail-wr1-f65.google.com with SMTP id z1so55806433wru.13
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2019 15:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3uH6wRDL6m6XJhTTMaf9vseYu7YZD/ywsLcXQB/jjqU=;
        b=gRwFBhXFYJfA75M/HEdp8ls9oB9Iqr3v3cbcAdX0YN2re7cxgXOiyNGqdV7y940UPQ
         xEAGEx83Sx0AScNU61MufPYcTqHXboUs77qQIZbyFLS+Z1KWXzwacdV2TBBpkabIXPIS
         3t25KPcq+uPMwdErdl7zvAb2+50heWp13Zz87W54VqJ6b2+tjIZYL9Eny8Zn4mq59bWs
         VSnpDw/un6SKkrcWSSQYt420RvJq+X7LgBHo2uzl7siD3ZzOHUpaLgNLz7dgKDUOR50r
         P0rxejLO/ww+4as8POGBXSkLKzdxYgr2S+zj7oOa/8JdyEDX/qjxwZNZ2GKjutnZm5zh
         VasQ==
X-Gm-Message-State: APjAAAUAe/FB06Umb0UAbqT7HaBRsI+Hh/FS4Xxxvk6Xs7bo78X7zT7n
        U+CscFPuLzD+tPhsHJmnuA3TJg==
X-Google-Smtp-Source: APXvYqzcff0a62xyZ1uFR2gsycPFMbRcnCLACAl1fTNDob/Jl6sm3/hEJ5mjpbBEtl+zmxqlsSDf9A==
X-Received: by 2002:a5d:568e:: with SMTP id f14mr22603718wrv.167.1564179033572;
        Fri, 26 Jul 2019 15:10:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9036:7130:d6ec:a346? ([2001:b07:6468:f312:9036:7130:d6ec:a346])
        by smtp.gmail.com with ESMTPSA id k9sm37976888wmi.33.2019.07.26.15.10.32
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 15:10:33 -0700 (PDT)
Subject: Re: [PATCH] Documentation: move Documentation/virtual to
 Documentation/virt
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Christoph Hellwig <hch@lst.de>, rkrcmar@redhat.com,
        jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190724072449.19599-1-hch@lst.de>
 <b9baabbb-9e9b-47cf-f5a8-ea42ba1ddc25@redhat.com>
 <20190724120005.31a990af@lwn.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <be4ba4a7-a21b-8c56-4517-8886a754ff55@redhat.com>
Date:   Sat, 27 Jul 2019 00:10:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724120005.31a990af@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/07/19 20:00, Jonathan Corbet wrote:
>  - kvm/api.txt pretty clearly belongs in the userspace-api book, rather
>    than tossed in with:
> 
>  - kvm/review-checklist.txt, which belongs in the subsystem guide, if only
>    we'd gotten around to creating it yet, or
> 
>  - kvm/mmu.txt, which is information for kernel developers, or
> 
>  - uml/UserModeLinux-HOWTO.txt, which belongs in the admin guide.
> 
> I suspect that organization is going to be one of the main issues to talk
> about in Lisbon.  Meanwhile, I hope that this rename won't preclude
> organizational work in the future.

Absolutely not, this rename was just about a badly-named directory.  I
totally agree with the above reorganization.  Does the userspace API
cover only syscall or perhaps sysfs interfaces?   There are more API
files (amd-memory-encryption.txt, cpuid.txt, halt-polling.txt msr.txt,
ppc-pv.txt, s390-diag.txt) but, with the exception of
amd-memory-encryption.txt and halt-polling.txt, they cover the
emulated-hardware interfaces that KVM provides to virtual machines.

Paolo
