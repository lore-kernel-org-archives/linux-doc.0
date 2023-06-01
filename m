Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5B8C77B7E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jun 2023 10:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjFAKga (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Jun 2023 06:36:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbjFAKg3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Jun 2023 06:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68773129
        for <linux-doc@vger.kernel.org>; Thu,  1 Jun 2023 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685615740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rrDwJW6rdR8dN4m357pAF7Ua9/6hSt/PkPvQJS4/ohw=;
        b=MrQtDBPojSDBXpyvlTh80mABROAbeKwdpGpiC40wvaJuPtCgiQW4So1kz4hRUtiZuQlNbE
        1w5PmqjOZ7VHF98zWt6BFXzSfnaP8fg1nYNV4iBVGHIh0V28c+/rAxY38XVsV0pblMqZLW
        WPKSKg5J54UesbJYFIc9jiNwv9ZR014=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-x-FIJVyVMDak1ra9akaMGA-1; Thu, 01 Jun 2023 06:35:39 -0400
X-MC-Unique: x-FIJVyVMDak1ra9akaMGA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-96fe843f61eso49059966b.2
        for <linux-doc@vger.kernel.org>; Thu, 01 Jun 2023 03:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685615738; x=1688207738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rrDwJW6rdR8dN4m357pAF7Ua9/6hSt/PkPvQJS4/ohw=;
        b=EUnMaiX9tc+VX4ktKmHsxFwA1KMWVxkvIBUpGE2sO6lUU7NEecWGURaotqZb+6FKI2
         zjIQYNvb8Yh/bVPjUi3LKo5IXnc9x37NGQ0qQqVhbndCZvCZ+vzJJ+Egkae68SqsfENU
         3PaPxRY4NiAn1NMDHB3sRu+yAcGE8Py8nOrKSPeQLD48Mr5F2TVDo6F4cgRIIJ1BF2x8
         Gf9m8NWFycx+YVDP24YHlgvjP9+7uULByx9X99ZIwMOhfxABPS9cMBGVlDXRykgIbQVp
         /rB5xwbZzgbb6PnfDFAQXlupqsYsbyKqHDgdd8U51NcfRvu/LW/a/XCSEopzMAjawTEx
         y1Nw==
X-Gm-Message-State: AC+VfDyHNvkKXiTJ4FiBFq/f58/RJqyoCzOy2c5gbCJSjOVlB0+djds0
        L3j9uA4i6cNkC6+qVc8R869Eqe9EWFh2z8FPSddccqLXjmwU4pkdUClFL3UTnoOb8Du/FDjG7e2
        HrBK1aZC8wEyFXTqoejFg
X-Received: by 2002:a17:907:9622:b0:973:8c47:2a02 with SMTP id gb34-20020a170907962200b009738c472a02mr10361562ejc.38.1685615738395;
        Thu, 01 Jun 2023 03:35:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Mo/A5zf7eo3B8l/xRufQqDR6igktxXe10DaKxJb+GTZweZEr0bpLVcum/5v2HT72MQwW/7g==
X-Received: by 2002:a17:907:9622:b0:973:8c47:2a02 with SMTP id gb34-20020a170907962200b009738c472a02mr10361541ejc.38.1685615738201;
        Thu, 01 Jun 2023 03:35:38 -0700 (PDT)
Received: from [192.168.0.224] (host-87-12-203-248.business.telecomitalia.it. [87.12.203.248])
        by smtp.gmail.com with ESMTPSA id u21-20020a170906b11500b0096f738bc2f7sm10415228ejy.60.2023.06.01.03.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:35:37 -0700 (PDT)
Message-ID: <d4cbf715-da95-e304-4aaf-9daf529d695b@redhat.com>
Date:   Thu, 1 Jun 2023 12:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 2/2] sched/deadline: Update GRUB description in the
 documentation
Content-Language: en-US
To:     Vineeth Pillai <vineeth@bitbyteword.org>,
        luca.abeni@santannapisa.it, Juri Lelli <juri.lelli@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Steven Rostedt <rostedt@goodmis.org>, youssefesmat@google.com,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Mel Gorman <mgorman@suse.de>
References: <20230530135526.2385378-1-vineeth@bitbyteword.org>
 <20230530135526.2385378-2-vineeth@bitbyteword.org>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
In-Reply-To: <20230530135526.2385378-2-vineeth@bitbyteword.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/30/23 15:55, Vineeth Pillai wrote:
> Update the details of GRUB to reflect the updated logic.
> 
> Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>

Reviewed-by: Daniel Bristot de Oliveira <bristot@kernel.org>

Thanks!
-- Daniel

