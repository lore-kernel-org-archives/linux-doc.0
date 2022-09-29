Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7E1C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 13:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233904AbiI2NeZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 09:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiI2NeY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 09:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34DC98D2C
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 06:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664458461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rlftdk2hTC+j/otuOrlxim4c/Udb5r6B+3NxPu2X4c8=;
        b=TwJGFFyo1NemyMN5hcd+QDijhr6vKz3ga9+3PB26EredUXUbJOOvn6cDS9juBU4NcWioOP
        gM2CGIqB53AdGTWSR4P0tzeptR1Zblujrsnl1/JU6dJnT44e8lJe2EEtq+F1uW8sRDKoLT
        XvMUJ5yYyg6ft3olYSfeuv8i9LGX7j8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-PqiVIw7_NlmLI8vyiKIa4Q-1; Thu, 29 Sep 2022 09:34:20 -0400
X-MC-Unique: PqiVIw7_NlmLI8vyiKIa4Q-1
Received: by mail-wr1-f72.google.com with SMTP id s5-20020adfa285000000b0022ad5c2771cso542114wra.18
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 06:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rlftdk2hTC+j/otuOrlxim4c/Udb5r6B+3NxPu2X4c8=;
        b=YUGZw8KZVIFdaBEhRyxrL9OOSeB8Ah7+ZGqRLevsxkkdzCvi4Xwn04np+0WhgSMrl4
         Eekb1m1aXGdn4tL/KALX/fCOCDuwBL4QddKcpqx/IJjY85qWGAzma2oTF/8xXRJmtLfO
         fowgdr1Pr1NUMlbDKRfEIDUSnIwpxV+p9PBmiVQw6sVdsCTrZl/aiVyikO9arHYiLvwR
         58vgvAOOzZpiX0ktMbFPjStKMLo3oNeS/17+IihVQglWHlhKV/kR+lVCwtCz8BNs4Wi6
         vejc63zetMXLE7JB4SNf2C6TMOcuJSSyR/oygN4PoQ7y/bZIuczDPO4AWp7PmyFnj+jf
         tmMQ==
X-Gm-Message-State: ACrzQf0Ned/ufmIY/wsTd2vIvtR0iENNmmxm71U4orm2bWR1dTeeX0t3
        +F2O+4UeqQHvGcRbTz596Y4/88nG7WSmH+vNA3Euh6MrTsVvrvkhVGo0cCpDcfKaX9Jvd30trOB
        pMnisIbyCquD/ucoYNC/n
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id u7-20020a7bc047000000b003b4adc71ecbmr2381498wmc.144.1664458457898;
        Thu, 29 Sep 2022 06:34:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7g3+/13oJtIk6NXj7j85h1BWgvBBXBz91Zb26yCGbshBNMrmY+Zd8Fz4y2SGNJh+4ZxKRZhA==
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id u7-20020a7bc047000000b003b4adc71ecbmr2381475wmc.144.1664458457692;
        Thu, 29 Sep 2022 06:34:17 -0700 (PDT)
Received: from localhost.localdomain ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d420e000000b0022cc895cc11sm3968487wrq.104.2022.09.29.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 06:34:16 -0700 (PDT)
Date:   Thu, 29 Sep 2022 15:34:13 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, robh@kernel.org, johannes@sipsolutions.net,
        ecree.xilinx@gmail.com, stephen@networkplumber.org, sdf@google.com,
        f.fainelli@gmail.com, fw@strlen.de, linux-doc@vger.kernel.org,
        razor@blackwall.org, nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next 1/6] docs: add more netlink docs (incl. spec
 docs)
Message-ID: <20220929133413.GA6761@localhost.localdomain>
References: <20220929011122.1139374-1-kuba@kernel.org>
 <20220929011122.1139374-2-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929011122.1139374-2-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 28, 2022 at 06:11:17PM -0700, Jakub Kicinski wrote:
> +Answer requests
> +---------------
> +
> +Older families do not reply to all of the commands, especially NEW / ADD
> +commands. User only gets information whether the operation succeeded or
> +not via the ACK. Try to find useful data to return. Once the command is
> +added whether it replies with a full message or only an ACK is uAPI and
> +cannot be changed. It's better to err on the side of replying.
> +
> +Specifically NEW and ADD commands should reply with information identifying
> +the created object such as the allocated object's ID.
> +
> +Having to rely on ``NLM_F_ECHO`` is a hack, not a valid design.
> +
> +NLM_F_ECHO
> +----------
> +
> +Make sure to pass the request info to genl_notify() to allow ``NLM_F_ECHO``
> +to take effect.

Do you mean that netlink commands should properly handle NLM_F_ECHO,
although they should also design their API so that users don't need it?

