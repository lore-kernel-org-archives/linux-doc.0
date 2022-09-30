Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1488C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 08:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbiI3IfR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 04:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiI3IfO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 04:35:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432B4AB1BD
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664526908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XSPa4FtzDmD4JTH1460N7eSs7BBD1Xd0E/VxTc3dU50=;
        b=IPQMOU669Jo8XIASV3Ns2hlzoDEr7lW4ovSLCCZDNDPU/3qnJMZGQzmIuSeOlYTZZ8/xCM
        VCdKBp5FoIWLD+k4Za4Cz1ss/RRo60jVdkA15GDTwELYpP6qe0Axeq48f1h4WiBNu+xXf7
        yOra6r5HD2qfmnJCQRroQgciN5G5aFs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-WrW8tCH1MaCQLM2j8Kxc2A-1; Fri, 30 Sep 2022 04:35:06 -0400
X-MC-Unique: WrW8tCH1MaCQLM2j8Kxc2A-1
Received: by mail-wr1-f71.google.com with SMTP id s5-20020adfa285000000b0022ad5c2771cso1311682wra.18
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 01:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=XSPa4FtzDmD4JTH1460N7eSs7BBD1Xd0E/VxTc3dU50=;
        b=1HzlZNbNNUFE6uj0HfPp7Jsq3G0PkbnPkY2GSRMOSxY7SxrhEIYSGJX0YhtTJ9kllH
         X0zHpddjK/OD/NtYW//MapEXk52IcWhpfxErboyyk7qlVtzIRsizk9soUWAArfdNXs+1
         sCBTJJjAKOK3hvg8X/OwVhpHoDOuS64JH5uKV0dxxCQCg1L9KBkl6BQK1ZW129BByBdx
         Qzcvz/F4j3gVMBDgYGLZy2PEtdfPCNjbfOj4xc5qyrZ8yF9GNtpGyWbyvxBuA20N+lWJ
         ji5fLP+NUqTqefXy7afWrmoHC8Cxz+2KtKg85BTfl+fG72DDJOPCnFZcRdUhbwRJR4Aq
         Bo4Q==
X-Gm-Message-State: ACrzQf3xlWlB90ByyJRV56BlWSvO+7gyV4a0c0Sgmua9JasVRf1zLP6i
        xUVignB8lCu2FV9H+txp2qmHGVL6iiMnkOFPVPK+AJDO/7WS3D0rA2Pio07qBxPEhJqYM4CAaj5
        VKOn4RQ7poz6XHUwwNDFJ
X-Received: by 2002:a5d:457b:0:b0:22b:24d6:1a9f with SMTP id a27-20020a5d457b000000b0022b24d61a9fmr4791902wrc.201.1664526905292;
        Fri, 30 Sep 2022 01:35:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qbKFNb2m2Iu07r8/LxpIsS0EuY6Hrbu/kOEB16WwNHE5p0FYk3g9x2L3Nsyb/SpVgiNef4Q==
X-Received: by 2002:a5d:457b:0:b0:22b:24d6:1a9f with SMTP id a27-20020a5d457b000000b0022b24d61a9fmr4791882wrc.201.1664526905044;
        Fri, 30 Sep 2022 01:35:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:c00:48b:b68a:f9e0:ebce? (p200300cbc70c0c00048bb68af9e0ebce.dip0.t-ipconnect.de. [2003:cb:c70c:c00:48b:b68a:f9e0:ebce])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d4fc5000000b0022ccc22ca95sm1452643wrw.13.2022.09.30.01.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 01:35:04 -0700 (PDT)
Message-ID: <23acdcfa-efd5-755d-6cd5-0631fd3a721c@redhat.com>
Date:   Fri, 30 Sep 2022 10:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH -next v5 3/4] selftests/memory-hotplug: Adjust log info
 for maintainability
Content-Language: en-US
To:     Zhao Gongyi <zhaogongyi@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Cc:     akinobu.mita@gmail.com, corbet@lwn.net, osalvador@suse.de,
        shuah@kernel.org
References: <20220930063527.108389-1-zhaogongyi@huawei.com>
 <20220930063527.108389-4-zhaogongyi@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220930063527.108389-4-zhaogongyi@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30.09.22 08:35, Zhao Gongyi wrote:
> Redirect misleading error message to /dev/null for
> offline_memory_expect_success(), And, add an output
> for online->offline test.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>   tools/testing/selftests/memory-hotplug/mem-on-off-test.sh | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> index 91a7457616bb..74ee5067a8ce 100755
> --- a/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> +++ b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
> @@ -207,8 +207,11 @@ echo -e "\t trying to offline $target out of $hotpluggable_num memory block(s):"
>   for memory in `hotpluggable_online_memory`; do
>   	if [ "$target" -gt 0 ]; then
>   		echo "online->offline memory$memory"
> -		if offline_memory_expect_success $memory; then
> +		if offline_memory_expect_success $memory &>/dev/null; then
>   			target=$(($target - 1))
> +			echo "-> Success"
> +		else
> +			echo "-> Failure"
>   		fi
>   	fi
>   done
> @@ -267,7 +270,7 @@ prerequisite_extra
>   echo 0 > $NOTIFIER_ERR_INJECT_DIR/actions/MEM_GOING_OFFLINE/error
>   for memory in `hotpluggable_online_memory`; do
>   	if [ $((RANDOM % 100)) -lt $ratio ]; then
> -		offline_memory_expect_success $memory
> +		offline_memory_expect_success $memory &>/dev/null

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

