Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5065C7EE29
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jun 2023 12:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbjFAM4E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Jun 2023 08:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjFAM4D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Jun 2023 08:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF5F18F
        for <linux-doc@vger.kernel.org>; Thu,  1 Jun 2023 05:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685624115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NNOxzOcErgJCqL4q/p9uBhOs5ss6WduW2i2jw8kKEC0=;
        b=c9swZlYQWXGfVBA9ZyLuFEJGLsdxFmUdOnUispldALhA+eY/1O49odDl87H3wrHGGofOmz
        yiRuSzSpviC/SLgJhr34Yj0PmEBiNW/ZQ0N5LH3TR1AebTeIg0AGdfYNqoLOrBQw7qcSx7
        z3Bl8acl6yFRenFJPKqZ49WzrlC8oic=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-Car6J9oIONmPmegc24YEug-1; Thu, 01 Jun 2023 08:55:14 -0400
X-MC-Unique: Car6J9oIONmPmegc24YEug-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f71907c036so4903165e9.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Jun 2023 05:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685624113; x=1688216113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNOxzOcErgJCqL4q/p9uBhOs5ss6WduW2i2jw8kKEC0=;
        b=dts7fHLgoJPMpc6HpNMpjcdwZC7c1R7pL6Kd4G3l0ACtCvsrJZSRsFOrnWc61/xvsI
         lvG1Yfex8q+T+E5LR0xmzcQnvNaqVYc3QYX1/bypbqadN5BiOxNW1UeYKo5cW5ahepCK
         9Ifd1WI4oEnfubW0sPLug/PVMW09yhOsWztX2ox/Fyo49iLpXWv5RveX9rqxXp5nWzfp
         L0z4A5YYGZwFNdfzEYHg2igeKVwCLIJi9m43wFBdwkMS4JtqbmOBMaYCJLUV7PVaCe6k
         YfA7zRUVXYdsLixd3YLmboJ/3lrjXKUImghIYkSFssCR8XKcghAmPTOTL1z6XyBMfEM7
         SOWA==
X-Gm-Message-State: AC+VfDxek8LkPBTQ4OeJhK88+DA/cNqZqmmcJ9XKStxl2m02E3z6J0+b
        vXt/Kmu16Sa8kNsdAfj2cdwCDfrB4cxIzkAfVEZxxbs3AGquHdlDAm32StbIRxFo90uQnhrhvhY
        +CuC44d9JA1ATS9Wvzjl/
X-Received: by 2002:a7b:cd91:0:b0:3f4:ffaf:a862 with SMTP id y17-20020a7bcd91000000b003f4ffafa862mr2056795wmj.12.1685624113199;
        Thu, 01 Jun 2023 05:55:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ZEHqQAjMNM5hSipoal2Y0M7MURKTmpadnHvObYfh6OrZOJ9G8ArN4VWfB06DSx0EMyAmVFw==
X-Received: by 2002:a7b:cd91:0:b0:3f4:ffaf:a862 with SMTP id y17-20020a7bcd91000000b003f4ffafa862mr2056778wmj.12.1685624112892;
        Thu, 01 Jun 2023 05:55:12 -0700 (PDT)
Received: from localhost.localdomain ([176.206.22.140])
        by smtp.gmail.com with ESMTPSA id c18-20020a5d4f12000000b0030c4d8930b1sm630087wru.91.2023.06.01.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 05:55:12 -0700 (PDT)
Date:   Thu, 1 Jun 2023 14:55:10 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Vineeth Pillai <vineeth@bitbyteword.org>
Cc:     luca.abeni@santannapisa.it,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        youssefesmat@google.com,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/2] sched/deadline: Update GRUB description in the
 documentation
Message-ID: <ZHiVLuyZar1LF6H0@localhost.localdomain>
References: <20230530135526.2385378-1-vineeth@bitbyteword.org>
 <20230530135526.2385378-2-vineeth@bitbyteword.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530135526.2385378-2-vineeth@bitbyteword.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/05/23 09:55, Vineeth Pillai wrote:
> Update the details of GRUB to reflect the updated logic.
> 
> Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
> ---

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

