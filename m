Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 366B27D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 13 Jun 2019 15:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfFMPxk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 13 Jun 2019 11:53:40 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:43720 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731600AbfFMI7z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jun 2019 04:59:55 -0400
Received: by mail-yw1-f68.google.com with SMTP id t2so8024711ywe.10
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2019 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2+9AWuuxtYq5kDObExhhjKauucpmi9PpKTbQpENwdxw=;
        b=n6tXgtU9jyCYIoEnopcXb3kvdH3pJPnNaZUgr1h0kYuBqfuVkDfZdhDI0C+M0DShsJ
         mtpEej7Q7tu2iYouCZdzXTxI9G/6f7S/D8RS8ub9Y5Fyp2eQGzED8xB15X7TvNMjjUTW
         2WGPWrOH5drqi1Z2nq9jnoeSfhd24IPTN8FDU+Uf4oEDF8jDbTxUAr6k2/pklQYA/cgJ
         Wo718mB+1Nr1bhMm4baOFs4Ehv107XvmCkzvWQjVfsUwC0xLmmNsTroDwDjM11k8XWe0
         orlt9dkGJM1m0c/rfBdcQ4mRYIWRKdFar+ydaHnVVN+wHBJVJj+UaZCVtw109orLDmEP
         MYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2+9AWuuxtYq5kDObExhhjKauucpmi9PpKTbQpENwdxw=;
        b=LlHffn7/cBlYYw6ys0B34xCP1X1f5fg0y6+sCo1MUTDxfLeO+IqMI+Y21gk434Niuc
         JkmX2Tg0dh5JwMPU0/Y+ij4ip4risGCjHqo7dkqFyCzcI/DsLCacY565Q4MgVdihuFst
         6sOzlU0u+MNkkBCZGWm2Y04rmy+0/+b0gqpryhdciH5jD4heVaDIi0PJPvoqaEhyxRMj
         PsDSe6XyfRn/BEUzhcda+mIh76x7fSPv7zppyjCOuKEaGmpU4RU2vUDusIVjfDeDZhEN
         Wwfzvjlq82RfnNfdyW0CpbNC5hUy4hfkhf9f7k5ZaSZF4KU5gZHAOobADZg3H0SIoi6P
         +tMA==
X-Gm-Message-State: APjAAAW/MJwhDoKShX6WKf2uvyaQt8OGYaL9HkxzsaK1RTlkLl6d37CK
        PhtCRn35R5Y7ryubRL8OeOA/Iy93Iqoo61ou
X-Google-Smtp-Source: APXvYqxCEx653iUhqyan6kGQNPIR/w4+osLNDQGaSLrv8KI2gz87AEfJHMcrWUO3XewvyXWR1KK79g==
X-Received: by 2002:a81:3494:: with SMTP id b142mr19026909ywa.79.1560416394346;
        Thu, 13 Jun 2019 01:59:54 -0700 (PDT)
Received: from [172.20.10.3] (mobile-166-172-57-221.mycingular.net. [166.172.57.221])
        by smtp.gmail.com with ESMTPSA id l5sm574202ywf.11.2019.06.13.01.59.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 01:59:53 -0700 (PDT)
Subject: Re: [PATCH] block/switching-sched.txt: Update to blk-mq schedulers
To:     Andreas Herrmann <aherrmann@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org
References: <20190612065009.GA11361@suselix>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a781a669-85ec-6df1-a18d-6d329b2f5ff6@kernel.dk>
Date:   Thu, 13 Jun 2019 02:59:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612065009.GA11361@suselix>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/12/19 12:50 AM, Andreas Herrmann wrote:
> 
> Remove references to CFQ and legacy block layer which are gone.
> Update example with what's available under blk-mq.

Applied, thanks.

-- 
Jens Axboe

