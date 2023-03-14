Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E72C6FD1C
	for <linux-doc@archiver.kernel.org>; Tue, 14 Mar 2023 08:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjCNITP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Mar 2023 04:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjCNISu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Mar 2023 04:18:50 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4210D211E8
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 01:18:22 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id l3so194983pjv.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 01:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678781901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3WKn90TG7abxmannS8HSG4yC/lQHmEP7t+WZ4jI4KU=;
        b=BVilWFmiglikYkOaZs/mh1LHDZA6aDOpo6NNZU+8udmOakMbbokgmi7yMDgQHfT1LE
         8vLb4x+02IDJUFLKsvhpttNaZI+ywzaYGfwteV1joSqXlyM6TSKKYmv3j6k/U+HfYZTH
         k11hNrmBWvUE4GyKkn/9IFktLWwUlrbORSA/veN5UcUS1NmFI+Uqi+PaEvz+s7KDVeoy
         I49m4yg5a3w9VeO5EwsZJOdSDqKHjQPckQBVoqTFF1O7NwdiRmexjbfH21rCRY9v4iUz
         8Mnwr5m7bZTALtVUDbrkMrl7cAvt4ZFmb4RC16ht2vNJV4sMC3Bm4qzrzKnMStDcKmRk
         rIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3WKn90TG7abxmannS8HSG4yC/lQHmEP7t+WZ4jI4KU=;
        b=GSA3KjhUnN9EOloR/KVsYYAPWAsAg0Ri2VHBdUPM35awSZH3ZlNmMmpuVcKtsltid3
         R0LScKNYAEtjVkjReljOSjeGW+FvjlIh6faUyZFVlUoGmtOobEy89kWj5Raq7DF3Eomb
         xfzMRGis6hAVW/zpM/LCr21Z6Uv7Uhn9jMvii2YL+iCbFp9zKYDRHu7T//Fb4+aEYbAc
         HEGTJhF7QyFJhrA1gPmGXfmHiCghjMTpkmfINfkj3Hhi2eVvJ4PIk0hBK+LygZSiEl4n
         MLHMj3ywRVeU+3es+zBBipLzZLVX3Ro9SAvcvr72PVOP2sY2fj6IjqffqEAh5KrCUPyS
         oykg==
X-Gm-Message-State: AO0yUKUOqgdYIrQ1bZFhSB9vbQ1N4G1RvIWxBx4mIpoEJMtULLmzMKAq
        zn1kPpk7z5Fbj+uy9PIgf+M=
X-Google-Smtp-Source: AK7set9bYx8QNzhNkIvlWntFht++AkUMwfPnJ44188fdrYNeeXIi0LAphcrjNtsK2WV1x+alEwXRrQ==
X-Received: by 2002:a17:902:d2c7:b0:19e:8bfe:7d70 with SMTP id n7-20020a170902d2c700b0019e8bfe7d70mr46795067plc.52.1678781901581;
        Tue, 14 Mar 2023 01:18:21 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-23.three.co.id. [180.214.232.23])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b00196807b5189sm1097012plj.292.2023.03.14.01.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 01:18:21 -0700 (PDT)
Message-ID: <06c615d6-e7d1-9a78-d45f-5d5b37aa8fbf@gmail.com>
Date:   Tue, 14 Mar 2023 15:18:16 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dns_resolver: correct documentation error in dns resolver
To:     Bharath SM <bharathsm.hsk@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     David Howells <dhowells@redhat.com>, davem@davemloft.net,
        edumazet@google.com, "pabeni@redhat.com" <pabeni@redhat.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>
References: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
 <b4674fec-9763-ef16-9b6b-c2292df2f469@gmail.com>
 <20230313110815.57961698@kernel.org>
 <CAGypqWyGZ+xSJ154i9CtmeG1Q5-eRw6tyVYVY79LC_c9HCir9Q@mail.gmail.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAGypqWyGZ+xSJ154i9CtmeG1Q5-eRw6tyVYVY79LC_c9HCir9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/14/23 01:56, Bharath SM wrote:
>>> I can't tell what the error you fix is unless I see the diff below.
>>> At a first glance, I though that you fix Sphinx warnings.
> Fixing incorrect sysfs path, right?
> 
> yes, It fixes the incorrect sysfs path in dns_resolver documentation.
> 

OK. Can you please send v2 with patch description mentioning above?

Also, can you configure your email client to have a reply below the
quote and not on above (aka top-posting)? When replying, you may also
need to trim unnecessary context lines, leaving the appropriate ones
intact.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

