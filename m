Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3E0C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 11 May 2022 10:03:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbiEKKDk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 May 2022 06:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233835AbiEKKDi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 06:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1E9AD5DA69
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652263412;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/vtPNJw1+YnhXgRCJ8NELfFcD+FTH1I0JZLJZh7rb18=;
        b=JN+VbiMoZCOzR+ZMg7f4axfLqwA4zSa/U2pMPwTjQc8/rUMWKDl4AqlIE3xBXTJfzg4HUs
        VuYonyDBDnStWNQmO+qfc2VtLPYGpToNZZETqVkey/KDltTCRAuYJscfcbDCPeeornxW1i
        F6ltjOIiL0w1o5qzKROZUwM3nyedRL4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-CRCt2CJHMSqD8I1SZsYzBw-1; Wed, 11 May 2022 06:03:31 -0400
X-MC-Unique: CRCt2CJHMSqD8I1SZsYzBw-1
Received: by mail-wm1-f72.google.com with SMTP id n186-20020a1c27c3000000b00392ae974ca1so1357394wmn.0
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/vtPNJw1+YnhXgRCJ8NELfFcD+FTH1I0JZLJZh7rb18=;
        b=vEolJ/Jxcd1U+aLmE3Fxnvg+LhZOcpv5RygvJhjK8RrvU3pa/MuTHiSCUFu7Bi7NlS
         VhbBMAvy+VzzJ33E8qevBPQ4QX3sJ7uYzMxa+KwEq33vKYIwQcejU9EKXib+UYvuGm0I
         M7UTJumFTT7lSqbSBo1CGpTHU5zgF9W+/nQ7UTfg2Aru2B3NJRAfOGwJ//zUc1iEEAdH
         Jrmp/zYb9PikkrYmtJ5k/L5kxfQwW9PKmvcs3sAIGUu8GYWTB4d3bYcYnbXXlY29r/46
         OLNCQ1LgxeSQCPk2Kq3yne+7Tes+TGk+2/lXtCbsfMNZ9e9fVbaKjfRfNQ7dsqfatJNE
         Lkzg==
X-Gm-Message-State: AOAM533K0cV2IhYIuRkIGzOoEvyWEDDqC43OJKSxlm5Cqabgxoz8lvuo
        TnI7OVIhl1s37kkhnKJa73/r7e8PiBCNivkc2/gqZauygXFOHGNAFaLX9mvTzFsx6wFycC0VjgR
        f2cjXR6l3Ys/dyQKEIS9S
X-Received: by 2002:a05:6000:1707:b0:20c:660c:7c78 with SMTP id n7-20020a056000170700b0020c660c7c78mr22100335wrc.150.1652263410379;
        Wed, 11 May 2022 03:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/mtciUUA/2mXBlfux7nSrDs5vehkcW7+aoBUwQ+SGHeAN3Wa6iGwpRl/7vAo47q2NqMsjgA==
X-Received: by 2002:a05:6000:1707:b0:20c:660c:7c78 with SMTP id n7-20020a056000170700b0020c660c7c78mr22100313wrc.150.1652263410167;
        Wed, 11 May 2022 03:03:30 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b00394699f803dsm5480419wms.46.2022.05.11.03.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 03:03:29 -0700 (PDT)
Message-ID: <e5408379-ce8f-46dc-0673-71b10743b563@redhat.com>
Date:   Wed, 11 May 2022 12:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/todo: Add entry for converting kselftests to kunit
Content-Language: en-US
To:     linux-kernel@vger.kernel.org
Cc:     Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20220509130846.694397-1-javierm@redhat.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220509130846.694397-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/9/22 15:08, Javier Martinez Canillas wrote:
> Many of the kselftests in DRM can be converted to kunit tests instead,
> since that framework is more suitable for unit testing.
> 
> Suggested-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed this to drm-misc (drm-misc-next).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

