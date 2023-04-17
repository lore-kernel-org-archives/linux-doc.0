Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19D9C77B77
	for <linux-doc@archiver.kernel.org>; Mon, 17 Apr 2023 14:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjDQOgI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Apr 2023 10:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjDQOgH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Apr 2023 10:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88DA3AA0
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681742107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nKC9O5ntfTB8FFBQ3U6lqT7ATFuyfdua81IpKIWSC2c=;
        b=LB/hkokfWyl6DEJrB/UjeJV3Dy+Is+aRp1itFbJ3EDaSXTSILqpGcncgiJJaNDFMlxeopq
        91SvSy+qSGvGRmMapDRFRMznUpCMvjB5skIuz7htkliwlQhuFe6TGkBpxHE1wrJDjdHo4W
        dfNaCzhtrkl4i71iUZ8c5yrUYQ0xQHo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-HsqR7cZ0PQagevm_Qwc3xA-1; Mon, 17 Apr 2023 10:35:06 -0400
X-MC-Unique: HsqR7cZ0PQagevm_Qwc3xA-1
Received: by mail-wm1-f71.google.com with SMTP id q19-20020a05600c46d300b003ef69894934so11682206wmo.6
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 07:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681742105; x=1684334105;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKC9O5ntfTB8FFBQ3U6lqT7ATFuyfdua81IpKIWSC2c=;
        b=Ri+QXIcxIpV9rLHwj6e/9CIuNTKJwR/Pk/Ey2smjaFfnmB7osP6yK+AxSmR22D7K81
         x9o563rgsvKGywD9VeMzvMKLjl1huuQzHhuSpV23ZvgYO7zUGmBliJ9nNe2KdXfJUKUh
         uiyLJtZwaSur7PnAG/dAsHpcUH9lvjRe51ZbGaA2tF050U+nTRxgrbHhmoMQ+EbZ4eGg
         ngtEDyRD7JTzLhmTlSC/arePqUXue5bCnKGT9Xk5dwsSzjX+q7fqeuDyenmsQHts7UXh
         PEfuwP9JubWtrdkFNoi6x9QliQX1gbyZK6UdWSj9TgU9mtN3UOCVYGxPitLOUO+LLFXV
         KDcw==
X-Gm-Message-State: AAQBX9fgcB2TXgWx8uC8AUJyOIjQGKoABn53DZmn8L29G2b7XP9+8ikG
        WTD0vPN+IYaq+6vremB7xO3gX02zVIlZFiPLHKzLtlT43vUv92+SSuBYW91MBZ+1bpm2t2PsNz6
        3CO9r3SMk0jIOty/jkzigscv+5M74
X-Received: by 2002:a05:600c:2195:b0:3f1:7277:eaa with SMTP id e21-20020a05600c219500b003f172770eaamr3122998wme.31.1681742105525;
        Mon, 17 Apr 2023 07:35:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOrJE/aPCFeEwGeJSkkFbLEOP6OoqvoOsP3dJ51tp858c+XL14GvgOi/VSa7eA1BIISoC4kw==
X-Received: by 2002:a05:600c:2195:b0:3f1:7277:eaa with SMTP id e21-20020a05600c219500b003f172770eaamr3122981wme.31.1681742105222;
        Mon, 17 Apr 2023 07:35:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:db07:68a9:6af5:ecdf? (p200300cbc700fc00db0768a96af5ecdf.dip0.t-ipconnect.de. [2003:cb:c700:fc00:db07:68a9:6af5:ecdf])
        by smtp.gmail.com with ESMTPSA id s6-20020a7bc386000000b003f172ec4022sm4134398wmj.18.2023.04.17.07.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 07:35:04 -0700 (PDT)
Message-ID: <355f42d1-4354-376d-ab27-7e55d06e64a6@redhat.com>
Date:   Mon, 17 Apr 2023 16:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 3/3] selftests/mm: add new selftests for KSM
Content-Language: en-US
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org, willy@infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230415225913.3206647-1-shr@devkernel.io>
 <20230415225913.3206647-4-shr@devkernel.io>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230415225913.3206647-4-shr@devkernel.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +/* Verify that KSM can be enabled / queried with prctl. */
> +static void test_prctl(void)
> +{
> +	int ret;
> +
> +	ksft_print_msg("[RUN] %s\n", __func__);
> +
> +	ret = prctl(PR_SET_MEMORY_MERGE, 1, 0, 0, 0);
> +	if (ret < 0 && errno == EINVAL) {
> +		ksft_test_result_skip("PR_SET_MEMORY_MERGE not supported\n");
> +		return;
> +	} else if (ret) {
> +		ksft_test_result_fail("PR_SET_MEMORY_MERGE=1 failed\n");
> +	}

Just realized we're missing a "return;" in case of the failure here.

-- 
Thanks,

David / dhildenb

