Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B0F37D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Sep 2018 10:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbeIKP3F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Sep 2018 11:29:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41117 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbeIKP3F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Sep 2018 11:29:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id z96-v6so25417264wrb.8;
        Tue, 11 Sep 2018 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5lSTW4jcr/kBKZh3YwlioaRIkS5eLsudiGIVatyzQqo=;
        b=HB3nic18lNktcpSSx1zLp+1PZZj7pmNK72+Fo6NwEOxHYGOiiCFPuQHjx0RJKRMyWq
         h1dtRGqvKQgghqMhPTsuBpx4sNWtmgdAvILoojEW1oLjpduQZSBLa7cU3gD1WpM5XGZk
         hGeLminriGWHfO79iIo1iMC/ftormRSAJh1j8070GnZfeiJ2JgmZSNxt4GsAUkfIHSbd
         3C6obzDuEZsXEbOY0m82n+G+UcejMGV+Ly/Kxhdn8Ag3g/pRjioGRqYCwk18gYmBx6Yx
         bhVMCor8hJQu2mzJgkdPL+UTjhA7flT/8zl/S988AYtDszmQ62UTladkXifMJTpn2e+2
         ZNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5lSTW4jcr/kBKZh3YwlioaRIkS5eLsudiGIVatyzQqo=;
        b=NCxMTiwBgKLrGtXI6GGrcDObNSMnvYRlO8ibu4YSuBQURJOS0pXQHOFnABsnYNGaSV
         vJTwmt6mNm+2RSPvvaHLrmvtIUPY/D/xc4XgF+WzAxVD52LFDGzTe6FaXXFm4uVYPRjz
         75hRB/7LhPeYN3BmhNt8m2sY0+T+LQGI2Hk3A4n/FgH66MZnBysSBKn3+pDwA2XXvCkc
         WDK7tczkswG0RQ8jgYFM3V6gRfOBCnwn5V6ew/tBhYLhdEm3boTUnxA5b+e7D006aHAT
         CtFKy9oBaWwg7ABd6XkmC4UhDpnWnXDcOfqzrPh3X+HZSFUDdiotMrK5qMYhORYllW3F
         st7Q==
X-Gm-Message-State: APzg51DGw3pcFOuFkoWkIo5Udjres1wUBUNCLuEuBnR954E1dF04MBjY
        D6hMghVWk8R3qjpsrhStetWYFJC+
X-Google-Smtp-Source: ANB0VdYQLReZWjzoBlWqXKYIFYPIbY/d20iOmMr1IGZowKmoJsKlDmWPBKTRGL3jpbuo1k88T5HAjA==
X-Received: by 2002:a1c:1a48:: with SMTP id a69-v6mr889949wma.43.1536661821196;
        Tue, 11 Sep 2018 03:30:21 -0700 (PDT)
Received: from [192.168.8.147] (144.21.90.92.rev.sfr.net. [92.90.21.144])
        by smtp.gmail.com with ESMTPSA id 139-v6sm1152580wmp.4.2018.09.11.03.30.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Sep 2018 03:30:20 -0700 (PDT)
Subject: Re: [PATCH RESEND net-next] docs: net: Convert tcp.txt to RST format
To:     "Tobin C. Harding" <me@tobin.cc>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180911071324.11199-1-me@tobin.cc>
From:   Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <7f50abcd-f2fa-c043-9e5b-8e5ca89c52a1@gmail.com>
Date:   Tue, 11 Sep 2018 03:30:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180911071324.11199-1-me@tobin.cc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 09/11/2018 12:13 AM, Tobin C. Harding wrote:
> Restructured text is the kernel documentation format of choice now.
> Some text from tcp.txt is out of date, specifically the function
> tcp_write() does not appear to be in the tree anymore.  Also the
> following data members have been removed
> 
> 	  sk->tcp_pend_event
> 	  sk->transmit_queue
> 	  sk->transmit_new
> 	  sk->transmit_end
> 	  sk->tcp_last_tx_ack
> 	  sk->tcp_dup_ack
> 
> Remove section 'How the new TCP output machine [nyi] works'.  This
> leaves only a single section so we can name the document with that
> section heading now.
> 
> Convert tcp.txt to RST format.  Add GPLv2 SPDX tag.
> 
> Signed-off-by: Tobin C. Harding <me@tobin.cc>
>

I dunno, this 'doc' is probably useless and should be deleted.


