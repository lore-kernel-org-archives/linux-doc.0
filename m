Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FFCEB64D9
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jun 2023 16:40:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbjFOQkQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Jun 2023 12:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjFOQkN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jun 2023 12:40:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B320C213F
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686847168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=85Cde2lC1B5p+slsHblZ/ywkw9kOFzxqw+4KoOzSvts=;
        b=EezBJypgjPjVrpJBGfCMRH5ZysFd+q61d55B5yEp3kl1DnQBsyTO83ghLKnIHqnSD0YEcs
        g07Gru8lziP1Bz7qeA8oZ1YzM2+jjKK4Yzp0pt6vexcJudwG0eHUR5P8eulQ8ndCiPEF75
        bJ3Wb6jYqlMBk89BGHJS7kL5sjaoWcE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-jnNyTYJIOn2SFwFr4barCQ-1; Thu, 15 Jun 2023 12:39:23 -0400
X-MC-Unique: jnNyTYJIOn2SFwFr4barCQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9749b806f81so177720966b.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 09:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686847162; x=1689439162;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85Cde2lC1B5p+slsHblZ/ywkw9kOFzxqw+4KoOzSvts=;
        b=GssBaGH7CSKPEoArLflrSisxWthKFPsfWvSZd6AkNaMiHFlOq82xzRlKO0OJMe++IJ
         PnwOJnVe+Qybl69QDekdBjuPLEUcure3CysXE4h0LWUdHwj0Mmgm12cw3WXx76dVktQs
         SlTE6IdOjAoXXkGz/zlg9BBpmdg0gC/46WhLeXK0DoU2+Fofxhm4O9Koy23kBrH2WFxR
         XK3Cj6xDQBJJC1FzNAaDpfBzR0nXXc9N6bZ5hytZ8gPRQFZmLpgB5zt4mQBeJ54jdpzP
         cGhp8B2V2AzIJ57L8ViRU1ZcGqkkvmP51a9LnPRvmTvTtc3iwG1obwfHoeoMWur/ZtfE
         PBaA==
X-Gm-Message-State: AC+VfDwJdzWdtKJUN4Cpz/1O7LQs0048CVR5kcH7GAomVHq8ao/WW1Ic
        hzENFqHlMa3qgUdGthVF+CVSIMvQMeqg0uwfr9LmNZ/yEfEx9bPMs9U7p6+13CD0lHc+JODL7zN
        TE+YCoDfMcoPxovdKpMPU
X-Received: by 2002:a17:906:478f:b0:96f:aadb:bf81 with SMTP id cw15-20020a170906478f00b0096faadbbf81mr20890711ejc.45.1686847162685;
        Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HFzj8oji+QgifVAS8W5rrkeLVzDVniPUlQYTVJZN7par6lelAUrI2LEXLSV910896GtiXog==
X-Received: by 2002:a17:906:478f:b0:96f:aadb:bf81 with SMTP id cw15-20020a170906478f00b0096faadbbf81mr20890694ejc.45.1686847162404;
        Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c? ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
        by smtp.gmail.com with ESMTPSA id a13-20020a170906684d00b0096f7500502csm9582514ejs.199.2023.06.15.09.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 09:39:22 -0700 (PDT)
Message-ID: <68cd25de-e767-725e-2e7b-703217230bb0@redhat.com>
Date:   Thu, 15 Jun 2023 18:39:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Content-Language: en-US
To:     Liam.Howlett@oracle.com
Cc:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, matthew.brost@intel.com,
        boris.brezillon@collabora.com, alexdeucher@gmail.com,
        ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
        jason@jlekstrand.net, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20230606223130.6132-1-dakr@redhat.com>
From:   Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/7/23 00:31, Danilo Krummrich wrote:

>    Maple Tree:
>      - Maple tree uses the 'unsinged long' type for node entries. While this
>        works for 64bit, it's incompatible with the DRM GPUVA Manager on 32bit,
>        since the DRM GPUVA Manager uses the u64 type and so do drivers using it.
>        While it's questionable whether a 32bit kernel and a > 32bit GPU address
>        space make any sense, it creates tons of compiler warnings when compiling
>        for 32bit. Maybe it makes sense to expand the maple tree API to let users
>        decide which size to pick - other ideas / proposals are welcome.

I remember you told me that the filesystem folks had some interest in a 
64-bit maple tree for a 32-bit kernel as well. Are there any news or 
plans for such a feature?

For the short term I'd probably add a feature flag to the GPUVA manager, 
where drivers explicitly need to promise not to pass in addresses 
exceeding 32-bit on a 32-bit kernel, and if they don't refuse to 
initialize the GPUVA manager on 32-bit kernels - or something similar...


