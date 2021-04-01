Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DC3C43470
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:56:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 534A460FF3
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 17:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbhDAR4a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46699 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237310AbhDARvU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 13:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617299480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Di0BWBiR9j8X6GwMiIH6dAiJ9FfCbmkOlLWEvf+m8I=;
        b=jQOthO5RBuy8EAUGTdzAx9QbusbJQKsbUwktEdu4AdI/fqq+LZa2U4L+BoP52TKsyCTx1M
        9VlVMl08S2xzU65a6YSHf3PcvPGi1Qu47GRlA3vM0cKuICVRjVU8cmCUW1JK1F2KykoXRa
        rg/vhAHeINh2d2mSJxdfew9xz72f7vA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-bTAKjHZSPq6gj4mYS1myTQ-1; Thu, 01 Apr 2021 09:49:18 -0400
X-MC-Unique: bTAKjHZSPq6gj4mYS1myTQ-1
Received: by mail-ej1-f69.google.com with SMTP id a22so2228205ejx.10
        for <linux-doc@vger.kernel.org>; Thu, 01 Apr 2021 06:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Di0BWBiR9j8X6GwMiIH6dAiJ9FfCbmkOlLWEvf+m8I=;
        b=FM/quvJiDgR00vdmwopg6yFniMk2beGzOXaGwyH6Yy7thtVylZ02YvctGoctZUX/MT
         FzNnNuk0FHX0cpe0j2n7tpsoAei1PRgEkHnOv4KRTli/Pr5VhvEiMRYNECfjYZXkkfcm
         /QvYq4JYTltIMd808vLR8eEePbWB+2yw0ZOgmBDOfMUiTjRqLzRtbDVU2ke1MHc5f6Ty
         nQMvZPNovsOKVqk+5Q7enGwiXkvXOnD9llRUyEhAiUUfnVfneG+0ngu/ifkelu5y4PQ5
         S29OR/ZiJJQU0EP8EqaGvRFF/DoZH6eGF4N6I3mJweP7xuiRtlSs5h4TUvNKKz7CPIiK
         A+Xg==
X-Gm-Message-State: AOAM532L9J5jqjSR7gUhEc04IsCJSu1FK78WBev82vVukW8KRQ8Uf6oY
        8ZEWz43EaLW4cFNzZnEc9Gk30NPmwUdFbJyTz2dnvERRkv+CsK5Xt8vY62wStjta0dEpqsEOUXb
        FgJ9uuzpwmK6B5pbq2yGc
X-Received: by 2002:a17:906:e48:: with SMTP id q8mr9366883eji.84.1617284957318;
        Thu, 01 Apr 2021 06:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQCqTJPlf5xHvtZrdLYGwFx8VHwJr7Nn508W2djrIkVNqJD9RRZhr4LvfkPbi+pedlY2rRgA==
X-Received: by 2002:a17:906:e48:: with SMTP id q8mr9366872eji.84.1617284957182;
        Thu, 01 Apr 2021 06:49:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g21sm2822186ejd.6.2021.04.01.06.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 06:49:16 -0700 (PDT)
Subject: Re: [PATCH 31/32] Documentation: update sysfs-platform_profile.rst
 reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-kernel@vger.kernel.org
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
 <828434d891e40234255e3f06c13827b7996b1ad1.1617279356.git.mchehab+huawei@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e042f8f8-0ba1-098d-2503-8c319c3c2bf9@redhat.com>
Date:   Thu, 1 Apr 2021 15:49:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <828434d891e40234255e3f06c13827b7996b1ad1.1617279356.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 4/1/21 2:17 PM, Mauro Carvalho Chehab wrote:
> The file name: Documentation/ABI/testing/sysfs-platform_profile.rst
> should be, instead: Documentation/userspace-api/sysfs-platform_profile.rst.
> 
> Update its cross-reference accordingly.
> 
> Fixes: a2ff95e018f1 ("ACPI: platform: Add platform profile support")
> Fixes: 8e0cbf356377 ("Documentation: Add documentation for new platform_profile sysfs attribute")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Rafael, I assume you will merge this through your tree?

Regards,

Hans

> ---
>  include/linux/platform_profile.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
> index a6329003aee7..e5cbb6841f3a 100644
> --- a/include/linux/platform_profile.h
> +++ b/include/linux/platform_profile.h
> @@ -2,7 +2,7 @@
>  /*
>   * Platform profile sysfs interface
>   *
> - * See Documentation/ABI/testing/sysfs-platform_profile.rst for more
> + * See Documentation/userspace-api/sysfs-platform_profile.rst for more
>   * information.
>   */
>  
> 

