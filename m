Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2497AC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 09:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiDMJNE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Apr 2022 05:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234357AbiDMJMc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 05:12:32 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77750527E8
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 02:10:03 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id a16-20020a17090a6d9000b001c7d6c1bb13so1466621pjk.4
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 02:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=Pg7luZ++Yiz6BXPO8vT2DT8lHaX3TyOWB9pwfm+LL7k=;
        b=cB4wDSWfj2Rw0+tXzgPFMCDiHcwY97ZRE43jiobC9bTO0Vz1GpjipcdTUqUFlKL5t7
         9mBNEufVh0y3sfGLY87Cohdls+b7wao63r0oK665J6/jzM9T8e4YNG/+TjtR4YP7/YZC
         +m3lv9kd3TqxOqjgUPA9Zk0M+RHZkmb+9UU63KZlNgNDNLd5TyzuzFQhfdzTeX0wIwZP
         7kv6crMJ2L60cYY5wf2oNerJIfT3RcPhGpU17/NWk5tiuVFix9K2RM0QTt5ml4zVxyiN
         lJTJ6RIJ+hyvYGcwWmMSiWp7PzzqQd6XuXjI6WVCluoZ3OehAvFfZwBWIs4b0itVg9Yp
         j7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=Pg7luZ++Yiz6BXPO8vT2DT8lHaX3TyOWB9pwfm+LL7k=;
        b=pZ5RxekMahkYAskg1Cgpbuii18gOPDXumc57Chr1VL7oziOIu8yFY5nx7S+mZiD9UL
         1b707SD7czfvCjCemwhlIbkBnV6DhlfaW/cck5xX/5i0Q3C/9boY2jxmmO/DZCGeRVWr
         mJhsudjDrb3KY9yUcpfYtdoXhEl5whF0HGaioSJ4b+ylHut6phsf25H4hwbVr/Lx+SJS
         IWjv0WRKQ6hDMZxGsKFbo7gbeaeUM50jQx6EnSu+JMgAgUzchtdNanXA951rulzw/fs5
         EETC5NSdNdJMJoPaKsqmnpLWgrPQZIAk7vaszKKWYUUDUDXgjobCJpK89BaS74QuwStt
         EZvw==
X-Gm-Message-State: AOAM5309FGn7cV1te7LiWpuSGJAExGXPdK1g8gIdqai5hzT6u/ksCUXa
        xCIm88h4vERmDCEzZN1U7tELN+iOVUM=
X-Google-Smtp-Source: ABdhPJykTXXH/TKdYaCk+d758iMQN2OIOezPYIMdPhUR+sxlrLiAzilZxbzaQNuhN5lD3sjoX05FGQ==
X-Received: by 2002:a17:90b:1d05:b0:1cd:5fe6:ddbf with SMTP id on5-20020a17090b1d0500b001cd5fe6ddbfmr599194pjb.225.1649841002614;
        Wed, 13 Apr 2022 02:10:02 -0700 (PDT)
Received: from ?IPV6:240b:12:16e1:e200:dab9:36e3:918c:5ba1? ([240b:12:16e1:e200:dab9:36e3:918c:5ba1])
        by smtp.gmail.com with ESMTPSA id s24-20020a17090a441800b001ca9b5724a6sm2128457pjg.36.2022.04.13.02.10.01
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 02:10:02 -0700 (PDT)
Message-ID: <172fa015-26df-c978-853d-3aba67c581cc@gmail.com>
Date:   Wed, 13 Apr 2022 18:09:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     linux-doc@vger.kernel.org
From:   Kosuke Fujimoto <fujimotokosuke0@gmail.com>
Subject: Is there any Japanese translation maintainer?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

I would like to contact with Japanese documentation maintainer for some 
changes. However, it looks like there is no one listed in MAINTAINERS file.
Is there anyone who is maintaining Japanese documentation?

Best regards,
Kosuke
