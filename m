Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1048E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Jul 2019 05:41:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbfGJFlQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Jul 2019 01:41:16 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44280 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfGJFlQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jul 2019 01:41:16 -0400
Received: by mail-ed1-f68.google.com with SMTP id k8so706036edr.11
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2019 22:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OY11rmPpSH+D8B6VvScwEBe1DCnbT7zlyAqSZqOZeb0=;
        b=ihwTjP2YwspvwpI3pjzBqD2hUsxrncATGTgnIPOnFXY6mfDORQh31kDn2f6cSXPhCe
         3f5yi/h9ijhl6A4ojNAXWfdvp0MXjixqZ0C1zlFAgwQHSCPNcTXh3abMzrE3ueLCQls/
         hO6tyWTTxdHzAvlT52DKHJ3jVqFpxiBsApA+6ylM0Jme/uo7zN0dVSyhnevSiLd5+8iD
         amIMpUFjVFFf8/NqYcNBGp6TgGc27rm0ArG2pu403aWMBIjpoTMAgczBXOSLwexrbpwo
         0IO4z5yiwR6XcTZ6YI1MFycImWIdJdxZiMrMYdFI39QmobvhxOFpULPPsh3BrIdEeNr+
         l4OQ==
X-Gm-Message-State: APjAAAXeSxu47+b4EPcaZ447s1ravktG5YNLAi+1qPtf3T88QNf5v4RM
        MPYes49U2bc9mdlF5AdTH5v2SQ==
X-Google-Smtp-Source: APXvYqxF0wyLFpJaD+4S490iaEEB7HCOq+xZWNx1hKV86gZ/6GN/YPQ1vMZ1zyd7tQmKqhL2DF4Ixg==
X-Received: by 2002:a50:91e5:: with SMTP id h34mr28907927eda.72.1562737274869;
        Tue, 09 Jul 2019 22:41:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:19db:ad53:90ea:9423? ([2001:b07:6468:f312:19db:ad53:90ea:9423])
        by smtp.gmail.com with ESMTPSA id g11sm893689wru.24.2019.07.09.22.41.13
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 22:41:14 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Documentation: virtual: convert .txt to .rst
To:     Luke Nowakowski-Krijger <lnowakow@eng.ucsd.edu>,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     rkrcmar@redhat.com, corbet@lwn.net, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190709200721.16991-1-lnowakow@neg.ucsd.edu>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8b24581c-427f-847a-7f77-2b3fc5c5334e@redhat.com>
Date:   Wed, 10 Jul 2019 07:41:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709200721.16991-1-lnowakow@neg.ucsd.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/07/19 22:07, Luke Nowakowski-Krijger wrote:
> After confirming with the appropriate lists that all the
> Documentation/virtual/* files are not obsolete I will continue
> converting the rest of the .txt files to .rst.

There is no obsolete information in Documentation/virtual/kvm.  Thanks
for this work!

Paolo
