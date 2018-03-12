Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4BC47E6A4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Mar 2018 04:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751255AbeCLEcO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Mar 2018 00:32:14 -0400
Received: from mail-pl0-f50.google.com ([209.85.160.50]:38250 "EHLO
        mail-pl0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751252AbeCLEcN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Mar 2018 00:32:13 -0400
Received: by mail-pl0-f50.google.com with SMTP id m22-v6so8692143pls.5
        for <linux-doc@vger.kernel.org>; Sun, 11 Mar 2018 21:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0pftQXzllfu36EL7h6RvQnFyS19lqL2o8RUlkPi1A4Q=;
        b=HedZRWIgI5g1K31i/LIkhd7zbjq868pykr0NT6YQbcUPV/3Q8Jjl12jRsToktQ8Mbs
         UDVlRSo5FsMKFkitzSP0tJIATc+gMZedfDBWpio+Yh1yd91gqh2nZbUu911a/dYu1XVV
         Ui87BusOUaNvkXURaHUcJJuT/V/cDMg24Ha4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0pftQXzllfu36EL7h6RvQnFyS19lqL2o8RUlkPi1A4Q=;
        b=msEEle9LM4fb2NMqxwwCdzgY1PJ9QGY35fYREqXpbbNVe2ySAsbSi070iBAdcFhaIs
         /bCcVS4f+wLbY23cov27nF8J5U6qHP80Bu34OMqyko7waTKK1HBEgQRJb7rxDfxpus/s
         UYjQ++8XQce0HkFC3jf0iiNEUwT3MMiz/r91ztv58kVil74r+jlnP9U6okzQo1zmurb5
         G/jT6YRVB219JHt94YdX0G7KIuX3nIlWY0AVoaufD1LoHN3eNK+j/lGAoz8XdME2VqNx
         uiJXnhdOBZoCgwKpsjsQKKR83lE8KtEuyAbgqi/MY34hnZSgZRHqQoXI6L4g0CFhFMqM
         V+hQ==
X-Gm-Message-State: AElRT7FaUzrEPb3B17a3lVB1uBhsTZwtsYBaUDfA18vZ4KvFb2jEHF+H
        7SBAFWCSg5z6M/LQopqZ6oCfdg==
X-Google-Smtp-Source: AG47ELtgY+Y6pvTyiyPBpPMz/fAh2uyqD8U87ZqTw0Va7kkisNVqvjh/uE0jWeMaE64X7H6evUKyQw==
X-Received: by 2002:a17:902:ab93:: with SMTP id f19-v6mr7036109plr.180.1520829132434;
        Sun, 11 Mar 2018 21:32:12 -0700 (PDT)
Received: from localhost ([223.226.75.205])
        by smtp.gmail.com with ESMTPSA id j185sm12001070pgc.79.2018.03.11.21.32.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Mar 2018 21:32:11 -0700 (PDT)
Date:   Mon, 12 Mar 2018 10:02:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH V4] thermal: Add cooling device's statistics in sysfs
Message-ID: <20180312043209.GS6842@vireshk-i7>
References: <6e557b90950723065d49c9a545146ce31d7dc6e1.1516096153.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e557b90950723065d49c9a545146ce31d7dc6e1.1516096153.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16-01-18, 15:22, Viresh Kumar wrote:
> This extends the sysfs interface for thermal cooling devices and exposes
> some pretty useful statistics. These statistics have proven to be quite
> useful specially while doing benchmarks related to the task scheduler,
> where we want to make sure that nothing has disrupted the test,
> specially the cooling device which may have put constraints on the CPUs.
> The information exposed here tells us to what extent the CPUs were
> constrained by the thermal framework.

@Eduardo/Zhang: Are you going to merge this for 4.17 ?

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
