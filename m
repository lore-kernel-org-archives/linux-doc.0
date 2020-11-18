Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E83C2D0E4
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 01:30:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 898B62220B
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 01:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfQCA4cw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgKRB36 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 20:29:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35733 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726411AbgKRB35 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 20:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605662996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5y9d1mDFu+1IAn4UKYshZB62u1n5Z+noiYA1PqcdhCk=;
        b=PfQCA4cwGft1kIrM88CZ+KZ1BincKYvjIkt7mdeyk55xAm9AZ6OspEj+6WHaxsNk10S9hk
        3Xi7y3fJG8Prp2uxfmSLuzdAS5Ad/5+fY2G2yIsaYEycJip/BgPqI5th9dPpbcE9P8wTVp
        bx0CKM96V8oiVNfJxUU0Wz9ATN3BFwg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-8w0z8A6OMlSAwhlWXUkQVA-1; Tue, 17 Nov 2020 20:29:55 -0500
X-MC-Unique: 8w0z8A6OMlSAwhlWXUkQVA-1
Received: by mail-qk1-f198.google.com with SMTP id x22so317185qkb.16
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 17:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5y9d1mDFu+1IAn4UKYshZB62u1n5Z+noiYA1PqcdhCk=;
        b=BTfhnLvcj4D+MnblLXoHsJRYv95o736peBsqQ/qFM1per6yXtZIfjdta1NkXVo12L6
         IAIeCDu395m1hZE9pT9iJ7Dk7VzWJeuCY4+6JBGckEq4l8n/wncJu6YKbMVtdVdpZ1m4
         rHvNXPZ5xrQGFFqjK6wQg9fIW9B8SgjAOfbm+WsARNhUYYpQlCBLNTfqSxXS1KQ2zr0B
         7oV96er+hVICVXOhSceJHmY47d8/qrspX15ASz3xFp3KrAIh995F/scXqZmPlFFW1py+
         vozE+NwWp4YlOOWZc24yXI/7fUH+qlyPY6juCuodnWLs7Gw7JH33pzkR4kmSZ7EPdqE1
         oFrw==
X-Gm-Message-State: AOAM530VrTL6t0EgBv9gUwJ/wCDSAWV+iFGV8VNfjpLcyl7j2kVHTzgp
        31I6zAinLO4i6ftCNdU/Vv+GWNOCOb5P1tY6AQ71lNjmnrDdYKrd7pE3wkobwr/uOSd2zWRSzri
        d3BnbF+qW3eurz/64b1NI
X-Received: by 2002:a0c:9bac:: with SMTP id o44mr2630008qve.43.1605662994570;
        Tue, 17 Nov 2020 17:29:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmxm5sTloYaS7lk1Nby+l3Pt4GRZsecKIapPOdPkL0PKYvK5KZOWnsOoSdlJa8/b2h2bRjjA==
X-Received: by 2002:a0c:9bac:: with SMTP id o44mr2630000qve.43.1605662994342;
        Tue, 17 Nov 2020 17:29:54 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c27sm15395005qkk.57.2020.11.17.17.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 17:29:53 -0800 (PST)
Subject: Re: [PATCH 2/2] fpga: dfl: look for vendor specific capability
To:     matthew.gerlach@linux.intel.com
Cc:     linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        mdf@kernel.org, hao.wu@intel.com, linux-doc@vger.kernel.org,
        corbet@lwn.net
References: <20201117012552.262149-1-matthew.gerlach@linux.intel.com>
 <20201117012552.262149-3-matthew.gerlach@linux.intel.com>
 <53b9cb12-8002-5737-ba8b-7c59687ead5a@redhat.com>
 <alpine.DEB.2.22.394.2011171457150.312724@rhweight-WRK1>
From:   Tom Rix <trix@redhat.com>
Message-ID: <2a81ac9c-482e-c0ec-ea71-d811fdf8a01a@redhat.com>
Date:   Tue, 17 Nov 2020 17:29:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2011171457150.312724@rhweight-WRK1>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


>> Is this really an either/or ?
>>
>> Could there be a base functionality on bar0 and a skew functionality on vendor bars?
>
> For simplicity I think either or is better.  If skew functionality is in vendor bars, why not just use the vendor bars all the time.
>
>>
>> If vendor is going to completely override, why not use bar0 ?
>
> I'm not sure I understand the question, but in v2 the legacy DFL search will only occur if there is no VSEC found.
>
Wondering if vsec was ignored, would the bar0 work ?

Or another way, how badly would an old driver behave.

consider incrementing the driver version if it would be bad.

Tom


>>
>> Tom
>>
>>>
>>>      if (ret)
>>>          goto irq_free_exit;
>>
>>
>

