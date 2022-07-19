Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4405C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jul 2022 01:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbiGSBoi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jul 2022 21:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbiGSBoi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jul 2022 21:44:38 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD748EE38
        for <linux-doc@vger.kernel.org>; Mon, 18 Jul 2022 18:44:36 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id k19so10627913pll.5
        for <linux-doc@vger.kernel.org>; Mon, 18 Jul 2022 18:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2nO9FwyY1G9lCIdVUmm/9OhOZAniRbrh1Y2DUlSpc0Q=;
        b=JgQAYnia1hWi3txioiNXmRDSrO6nz/gQmuDdU9l2q0bWLA5ZrIIMHuNjuIi885x7VW
         yQlHB1+n5DVm91PQdx9YkSH9egf9RNkU3udoWVFoiZBHTxT0h+WwWMAwLNCl322ENjMM
         Uf71kS3G0BzmSSqTglMYNFo8qKolbGN4uoYd4rYV2BLzCYZhBulYDhEaEwvh+FlhrkIR
         xVRDdz4dtYdl6hTyIfcCsBNmSa2PKHjEdIFvs1ykR16DHcQi9eICuKqPw5YrqMBDKLgf
         tkfcqgE5IyXRMPGq7DMLRw9X1e27RA4BVEkMrlyglMX7csuH8sV1yjQkiFnInL1Pu8mD
         l+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2nO9FwyY1G9lCIdVUmm/9OhOZAniRbrh1Y2DUlSpc0Q=;
        b=xyjTC5jASOdZRssX8u+LhuBS3iqpCp/bNeQxPVMTZeR7O9pyOUEtBWgC1CU2WZeWdG
         YZirJvxcJOrOCH1wnIgCTetaQofrhi3vbp9vD1N8w0gHaXmdU5uk7W0PM3+wM8RfnIpY
         5OeyeLqXN4Q4cGDcpekTAgHEExOBV3hmWon5OGb3qWZU+O3Ukthn/H8Jd2K6H9pXtXO5
         Mc4eDiAfHhwA4Q88L1te2P289AaUERve758yHxTU9FdlBVengSkphcBU63kDt0jURUU9
         +RM45tVUYKk0zl/DXkpZ1IoTcMg9tlaJ1kpAvUq4Epecun83Zeml8MWK+jvMCffX4lzF
         SiSg==
X-Gm-Message-State: AJIora/nctWhcAqL1dkE81bdvpMBKezHAQRIjgkXnX0hjexOjqN6yDDA
        XnzreWQzD49/6v+LovrERPy3y2J0l78=
X-Google-Smtp-Source: AGRyM1vw7xERH5dLPKZ9M3+raUn41pIqzMW/jiAWw589b84SJHjlhmprw7V40O3EC7E8TPxe5JRVeg==
X-Received: by 2002:a17:90a:2c0d:b0:1ef:c839:c34b with SMTP id m13-20020a17090a2c0d00b001efc839c34bmr42533950pjd.39.1658195076146;
        Mon, 18 Jul 2022 18:44:36 -0700 (PDT)
Received: from [192.168.43.80] (subs09a-223-255-225-65.three.co.id. [223.255.225.65])
        by smtp.gmail.com with ESMTPSA id h29-20020aa796dd000000b0052a198c2046sm10124833pfq.203.2022.07.18.18.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 18:44:35 -0700 (PDT)
Message-ID: <7290298b-b615-c80c-8d7f-e05ad6e5eb0a@gmail.com>
Date:   Tue, 19 Jul 2022 08:44:31 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 19/41] doc-dyndbg: edit dynamic-debug-howto for
 brevity, audience
Content-Language: en-US
To:     Jim Cromie <jim.cromie@gmail.com>, lkml@kernel.org,
        jbaron@akamai.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, rostedt@goodmis.org,
        linux-doc@vger.kernel.org
References: <20220718194717.31319-1-jim.cromie@gmail.com>
 <20220718194717.31319-20-jim.cromie@gmail.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220718194717.31319-20-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/19/22 02:46, Jim Cromie wrote:
> -You can view the currently configured behaviour of all the debug
> -statements via::
> +You can view the currently configured behaviour in the *prdbg* catalog:
>  
> -  nullarbor:~ # cat <debugfs>/dynamic_debug/control
> +  :#> head -n7 /proc/dynamic_debug/control
>    # filename:lineno [module]function flags format
> -  net/sunrpc/svc_rdma.c:323 [svcxprt_rdma]svc_rdma_cleanup =_ "SVCRDMA Module Removed, deregister RPC RDMA transport\012"
> -  net/sunrpc/svc_rdma.c:341 [svcxprt_rdma]svc_rdma_init =_ "\011max_inline       : %d\012"
> -  net/sunrpc/svc_rdma.c:340 [svcxprt_rdma]svc_rdma_init =_ "\011sq_depth         : %d\012"
> -  net/sunrpc/svc_rdma.c:338 [svcxprt_rdma]svc_rdma_init =_ "\011max_requests     : %d\012"
> -  ...
> +  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
> +  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
> +  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
> +  init/main.c:1426 [main]run_init_process =_ "    %s\012"
> +  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
> +  init/main.c:1429 [main]run_init_process =_ "    %s\012"
>  

The block above is screen output, so keep using literal code block
marker (::).

What isn't described in the patch description is $PS1, which changed
to just root prompt (without username).


> +Kernel Configuration
> +====================
> +
> +Dynamic Debug is enabled via kernel config items:
> +
> +  CONFIG_DYNAMIC_DEBUG=y	# build catalog, enables CORE
> +  CONFIG_DYNAMIC_DEBUG_CORE=y	# enable mechanics only, skip catalog
> +

Also use literal code blockhere

> +Fedora's distro-kernel has both, and has 7250 *prdbgs*.  Each callsite
> +record uses 56 bytes, so the impact on memory is non-trivial.
> +
> +If you do not want to enable dynamic debug globally (i.e. in some embedded
> +system), you may set ``CONFIG_DYNAMIC_DEBUG_CORE`` as basic support of dynamic
> +debug and add ``ccflags := -DDYNAMIC_DEBUG_MODULE`` into the Makefile of any
> +modules which you'd like to dynamically debug later.
> +

This assumes one has Fedora installed, so I think this should be
written as distro-agnostic.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
