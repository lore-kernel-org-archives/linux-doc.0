Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30E3E81E1C
	for <linux-doc@archiver.kernel.org>; Fri,  6 Oct 2023 16:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbjJFQxK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Oct 2023 12:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjJFQxK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 12:53:10 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88750BF
        for <linux-doc@vger.kernel.org>; Fri,  6 Oct 2023 09:53:08 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3296b3f03e5so623272f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Oct 2023 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1696611187; x=1697215987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h970WFqLxvJe5qinLhTrSPPuLT8BDW9gx47optmXmQ8=;
        b=jf5tBwEZFz7nyGkBzrCUrbD8Tm81IUwIEi1cGUpciDJfFG1z1fAUhA6QGKTa7YVN8Y
         iRlwlTLyB0GBvVaVlOIfFr8WIK6t7C9njwzsOwYvVzF61VGjW0x/40mSYhLyzBkrI7c6
         eaLNx8gxGvqBIoQ/PuXkCzzvqElNXZzKoUT6xop/Uv4QWbFvThBXg5NI1372dcjCKTLq
         OyHTxqVtlnWpP3MHSJYRtnlMTbQDFPm4tekhlBWap93Fng03POBnpxTPHgdDiK9+helo
         MAYl+t5x+BZNk9ELcMwFHibzgdngKFSAPwbNe6YGC8wIzkKxQmsVVl4RU3ONm+1JVL48
         LnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696611187; x=1697215987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h970WFqLxvJe5qinLhTrSPPuLT8BDW9gx47optmXmQ8=;
        b=tAVvBxHKaJehSHekk0/hPj9+kb5hgjPgPGzr7UMNRJBKE6BexCEcZfDvCbfeuBYZsD
         krGJ0E2ouFf7eujLQ2aGstPc/mIgNaNPNk0Y/eIyNlbti4tic7bEOFy+lJMIg1PZ9sT/
         fNHU21W7oZRk+JqVJlewMpzee7K0g9Vx9oQFGAEIFRFsLRupNwUuzjTMngfdZLrkVioP
         SplnF4CR6skM3vPdLCIuKBCE2pw17ArLBM0+pO3/CPjs17OYKk5HGr5Yin8z5z5wZTaU
         j8I8Am+wD0+ylz17t4rv6prvjdPP3ebHkyA7CEnf4wePdDPLYFO5TwiTODfTPws8R/Vg
         eMWA==
X-Gm-Message-State: AOJu0Yzdh58Kje9BcnsFF/phx3kkv/SYIR7h99bWOzjhovI1zKwcvzuO
        nd0n9rxKs7mDVjiYyREABRKNg/KarystVQvGUj8=
X-Google-Smtp-Source: AGHT+IG7AIHYrhwpOEb9IZJnVzjhVWheK168zk+9p/ADPkPcpyNkE8a+S1hlq/Czi4cKRB1GsbKksw==
X-Received: by 2002:adf:fa49:0:b0:31f:97e2:a933 with SMTP id y9-20020adffa49000000b0031f97e2a933mr7798228wrr.56.1696611186809;
        Fri, 06 Oct 2023 09:53:06 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id z7-20020a7bc7c7000000b003fee567235bsm6395414wmk.1.2023.10.06.09.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 09:53:05 -0700 (PDT)
Date:   Fri, 6 Oct 2023 18:53:04 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
        davem@davemloft.net, pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, linux-doc@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v3 2/5] dpll: spec: add support for pin-dpll
 signal phase offset/adjust
Message-ID: <ZSA7cEEc5nKl07/z@nanopsycho>
References: <20231006114101.1608796-1-arkadiusz.kubalewski@intel.com>
 <20231006114101.1608796-3-arkadiusz.kubalewski@intel.com>
 <ZR/9yCVakCrDbBww@nanopsycho>
 <20231006075536.3b21582e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006075536.3b21582e@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fri, Oct 06, 2023 at 04:55:36PM CEST, kuba@kernel.org wrote:
>On Fri, 6 Oct 2023 14:30:00 +0200 Jiri Pirko wrote:
>> >+version: 2  
>> 
>> I'm confused. Didn't you say you'll remove this? If not, my question
>> from v1 still stands.
>
>Perhaps we should dis-allow setting version in non-genetlink-legacy
>specs? I thought it may be a useful thing to someone, at some point,
>but so far the scoreboard is: legit uses: 0, confused uses: 1 :S
>
>Thoughts?

I don't know what the meaning of version is. I just never saw that being
touched. Is there any semantics documented for it?

Kuba, any opinion?
