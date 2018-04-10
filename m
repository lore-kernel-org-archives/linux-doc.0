Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 499407DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 10:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751611AbeDJKVK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 06:21:10 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36405 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751929AbeDJKVH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Apr 2018 06:21:07 -0400
Received: by mail-wm0-f66.google.com with SMTP id x82so22307956wmg.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Apr 2018 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=78ZUQrficYkKwCvnpLxT+rhQpXFxaubJzYxu+XSnnm0=;
        b=YSqB7blOLI7NxalAv1S3pInGo+5W5LdD303c1jCU0kpbIJSM3i51Z82wW4xfLBoLaw
         xlZUHBdppYBtJmaVngu7+rW+S9vJNmvdGRQhHP2qpmbvaaomKkLNfVPMZ2FTMiVPKxfS
         MSgVsoPdb9ax1/Tvm88otbCS5PlnF8RFZZqbxvzCzbi6ist+YZOLpKZz9x8/lqydb1B7
         f7dhOdftaKTbpLroesrTHpaR2VxKWQ3CRWmrzFYrAIq9D1HdKm/6wVI7iwroHjBtmx6f
         LDO5nYk/w7fGbXZIGpT30v52EHxk1DJzx5ppCq1txfhgtXIt0mQJC01CtQyrBtBkgRtI
         Q9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=78ZUQrficYkKwCvnpLxT+rhQpXFxaubJzYxu+XSnnm0=;
        b=srVlvS1Ils5beOXQH6JYCLsf67mEWvlqyNADEvE0vMtAaY2XXQ2MxM11r6kCzvRjQz
         Ag5Q5JoLQJSEW6no7HBe+vURyomMsb+YVUuw/kAEwJ474BjMeJ79WZmUtE6498eCrMW5
         jNN0PkuSPybjT/216AoqfYOBWatz699soTS6UbkAcXAA0nIBqz8zKsEX7EOSa2k+ce29
         nLbS0ghQpt0mbAE2IulOT0Bw9AMLYtYrhxmE5F0Hk3Xs0zFTk6nUkd0P2z58TLDbokOy
         R5MbQ8Uj5nyLD8cjN8vMw4GG4N6Ny7popCzsitJb8EsnQbujGYaWVsNNU+O/xBH+ipFC
         UWAA==
X-Gm-Message-State: ALQs6tAE+oHETO9/VLCRBkl/cDSv43Kk3K9CN4/tjkaPoxrw9N/KEG4t
        2xBinuwwnvBCQdWI05TXycaeSA==
X-Google-Smtp-Source: AIpwx48HLcrHsm30jt4dbZLoCwH0oTYlBgM+v5Ds6beaKAlJA1DicgUJSbnfgWXyL0asHjs41bqMMA==
X-Received: by 10.80.245.189 with SMTP id u58mr2293917edm.270.1523355666495;
        Tue, 10 Apr 2018 03:21:06 -0700 (PDT)
Received: from [172.20.1.93] (host-79-78-33-110.static.as9105.net. [79.78.33.110])
        by smtp.gmail.com with ESMTPSA id g44sm1705003edc.63.2018.04.10.03.21.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Apr 2018 03:21:05 -0700 (PDT)
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
 <16d4d67a-ab36-3e58-1082-52f0898546e5@netronome.com>
 <20180410014751.mqwqdyujvybir6g5@ast-mbp.dhcp.thefacebook.com>
From:   Quentin Monnet <quentin.monnet@netronome.com>
Openpgp: preference=signencrypt
Autocrypt: addr=quentin.monnet@netronome.com; prefer-encrypt=mutual; keydata=
 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
 RHhSHGnKaQ6MfrTge5Q0h5A=
Message-ID: <cf228f29-1d41-be4f-7b6b-b1c47ab9f4fa@netronome.com>
Date:   Tue, 10 Apr 2018 11:21:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180410014751.mqwqdyujvybir6g5@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-04-09 18:47 UTC-0700 ~ Alexei Starovoitov
<alexei.starovoitov@gmail.com>
> On Mon, Apr 09, 2018 at 02:25:26PM +0100, Quentin Monnet wrote:
>>
>> Anyway, I am fine with keeping just signatures, descriptions and return
>> values for now. I will submit a new version with only those items.
> 
> Thank you.
> 
> Could you also split it into few patches?
>  include/uapi/linux/bpf.h   | 2237 ++++++++++++++++++++++++++++++++++++--------
>  scripts/bpf_helpers_doc.py |  568 +++++++++++
>  2 files changed, 2429 insertions(+), 376 deletions(-)
> 
> replying back and forth on a single patch of such size will be tedious
> for others to follow.
> May be document ~10 helpers at a time ? Total of ~7 patches and extra
> patch for .py ?
> 

Sure, I'll do that. And I'll try to group helpers in a patch by author,
it should also help for reviewing the descriptions.

Quentin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
