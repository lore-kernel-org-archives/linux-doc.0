Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85736C5519F
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 08:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 076BB221F1
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 08:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DmN5Wcax"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgKRIVR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29825 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726270AbgKRIVR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Nov 2020 03:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605687676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G6KbmzkjPXdz5sd/mUlYtsiRppY2HL0oovb3kA5qA88=;
        b=DmN5WcaxiJBo/y6HXemUCWlx4Lq229FAfIxiRl9gVcU3kUNzGJUgADQ0mP0wyQkxxLfAKT
        I0AYO94JoanTJTXet9EnH2hRkl7aptnwkdSPpTBa9MTVhsz3i/vKIUZTLZXwgZet22FcUp
        G1F33DkPobCdlg4biKCukZ+rVaPeUOY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-uefEeVKzN-epg0rC2BqQuw-1; Wed, 18 Nov 2020 03:21:15 -0500
X-MC-Unique: uefEeVKzN-epg0rC2BqQuw-1
Received: by mail-ed1-f70.google.com with SMTP id x15so477462edr.10
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2020 00:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G6KbmzkjPXdz5sd/mUlYtsiRppY2HL0oovb3kA5qA88=;
        b=hoYBhSNvMN30sKT14MziLShukho9PBeD/GBpdRGbWAldaCsKYmhVMK0O9aQyCgTCXQ
         wEFgmDtqwxzaMMSLuRJ8OPN2/qFf0Vy4KcZK6oTd4uSh3o4pKRY9Se43whr1LYNVsB5W
         DcEz5PfcrjcjnAjfaEvPME3FQiwQ8g02Rqhpaa14UoGS/cM8KfERRT/Hj7fB3QjKjDo3
         YQXxHSLM/oMmg9QRamZ3kHadU5MGH67nLxW9d275P16CGSIuIokXOX7fbEWlfJ4Dvi0X
         FFRr1ufPk6JAk7/u1akXCrx6o8H9elXR7xK309ArcYC/vz38j81B1YYZDeO3KS0z4J+0
         yf9g==
X-Gm-Message-State: AOAM531gqnieIwBMjH+NQXfZZKUSSPRnqjNzQfOE+geHxme1WnDesAQt
        qr/1ZqTHLdX7+S3gkwEFcqC//AdGeQkVQLBZQzANJqDVC8xbTgZGXX6jTmTPhL6AQPi2AnPhXFn
        OzuHsOPvmPKi2p8Alnztqzm7bE4O7Ox6+AoBEUaw4R53hckscZQKLci9pzQZ6AYavXvXOkln3
X-Received: by 2002:a17:906:ca93:: with SMTP id js19mr24197404ejb.537.1605687673308;
        Wed, 18 Nov 2020 00:21:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnL15xTPVl8NBwdM1yC9jhzhLP8R3S6JTXtQ9uX4GF3tz9G3svQWxLIaZfoDvgEd1r2A6fww==
X-Received: by 2002:a17:906:ca93:: with SMTP id js19mr24197387ejb.537.1605687673057;
        Wed, 18 Nov 2020 00:21:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id b1sm12672359ejg.60.2020.11.18.00.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 00:21:12 -0800 (PST)
Subject: Re: [RFC] Add kernel-doc test script
To:     Eduardo Habkost <ehabkost@redhat.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20201030144713.201372-1-pbonzini@redhat.com>
 <20201030144713.201372-3-pbonzini@redhat.com>
 <20201113152106.7b4a07ee@lwn.net>
 <20201113223912.GK17076@casper.infradead.org>
 <20201117212452.GM1235237@habkost.net>
 <20201117213051.GA29991@casper.infradead.org>
 <20201117223612.GN1235237@habkost.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <19ebee73-0e7a-7dc1-5948-072ae153e383@redhat.com>
Date:   Wed, 18 Nov 2020 09:21:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117223612.GN1235237@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/11/20 23:36, Eduardo Habkost wrote:
> +# the -man output includes the build date
> +export KBUILD_BUILD_TIMESTAMP=1991-08-25

Nice :)

> +ok=yes
> +
> +# don't even try to test other formats if -none fails:
> +test none -none || exit 1
> +
> +test rst2 -rst -sphinx-version 3.0.0 || ok=no

Do you want 3.0.0 here too?

> +test rst3 -rst -sphinx-version 3.0.0 || ok=no
> +test man -man || ok=no

Also since you are at it you might as well rename the function to 
something other than "test", it's a bit confusing due to the "test" 
shell builtin.

Paolo

