Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 64A017DE7C
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Oct 2019 16:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfJBQOe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Oct 2019 12:14:34 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46719 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfJBQOd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Oct 2019 12:14:33 -0400
Received: by mail-pf1-f196.google.com with SMTP id q5so10594455pfg.13
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2019 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eeyTOg17q9KxMpdnKIdB7cChcxt684Nc0Z/pTXOp8y8=;
        b=EP1pH7wpiE0TYKvhUm2wWyzT1PRmnrtJW2S9yGvLz+UQS5H6/InXwE+x7vcQn0YkA8
         FvYrIpIaayfSv4Ts2FZYpj3clWi/NGLG/G3R7XP1QXkQqsFA+p03EIgoGlgNePuVOKte
         EV2xbhJPg+0sbcZIjH2QWZyQcxkXcsqBDBFBGsAG+au4XuTyaRh7n3OKaPHzKopsBy0D
         UKEmC1UUp5TnLJB/BzgH+VR7a60BkAmOYCpo8QG8Zz0WcDX/gt+ScP5hZv0bfiIbfid5
         VtIAGaDfjpZDJsmbs5y6TakZJvKeAeAbclrWPjG2I6CjzEY6C4bLgws3vjG9QhFFf/wO
         LjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eeyTOg17q9KxMpdnKIdB7cChcxt684Nc0Z/pTXOp8y8=;
        b=rlIg9w+Cu5ZmGfYrllj9BZfHxKT2M/2tHeKhJhTNGrd9OraGTH4/+s90pKBsZK1OG8
         J29mDj1Otcglrxr7S3gDG1x9bvhX3fKu9mi6WUZmsetz/mJQ9EiM4Re8jFtZx2sMnidU
         wUjVpVQjCGwuCBsHOQvFT5N8mNNvPv9xZz7Xow1dnXHOT3SR4dQqHseDMT3rkNNkO93e
         RpGjOp/+fRJlItfwqOlxFizC2hv2OpXak3OgMzlwEpTcsLK3tGfDRvqtB8QDlSoeNmCS
         eJaEsTlv4qzPBBCX87znxvTw78d1DuGy0YXHMkuvttOB7AWGKkiEX9VggSm0JbL/B4sj
         VJbQ==
X-Gm-Message-State: APjAAAUb53ncOsEWhWGryloHpBvNTRbwQlXimAOmYId6M6VkVCqTuifz
        FPlTQ33jZHs6ixsRhdBa8xr4aQ==
X-Google-Smtp-Source: APXvYqxrTJaVirNXUIMjjQQYz+vd4XBrvrCFGiFDXmev6sjlsTLcobvsJWUnNNcWVcQJlboCNdrkOA==
X-Received: by 2002:a62:e817:: with SMTP id c23mr5436656pfi.230.1570032873121;
        Wed, 02 Oct 2019 09:14:33 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
        by smtp.gmail.com with ESMTPSA id z25sm18095592pfn.7.2019.10.02.09.14.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 09:14:32 -0700 (PDT)
Subject: Re: [PATCH] Documentation: networking: device drivers: Remove stray
 asterisks
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-doc@vger.kernel.org
Cc:     Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Pensando Drivers <drivers@pensando.io>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191002150956.16234-1-j.neuschaefer@gmx.net>
From:   Shannon Nelson <snelson@pensando.io>
Message-ID: <1fd5d5df-30ea-2545-daf6-575473879cd6@pensando.io>
Date:   Wed, 2 Oct 2019 09:14:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002150956.16234-1-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/2/19 8:09 AM, Jonathan Neuschäfer wrote:
> These asterisks were once references to a line that said:
>    "* Other names and brands may be claimed as the property of others."
> But now, they serve no purpose; they can only irritate the reader.
>
[...]
> Fixes: df69ba43217d ("ionic: Add basic framework for IONIC Network device driver")

Acked-by: Shannon Nelson <snelson@pensando.io>


