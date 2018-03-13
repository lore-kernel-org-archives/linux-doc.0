Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8089A7E688
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 08:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752391AbeCMIg5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 04:36:57 -0400
Received: from mail-pf0-f178.google.com ([209.85.192.178]:37295 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752268AbeCMIg4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Mar 2018 04:36:56 -0400
Received: by mail-pf0-f178.google.com with SMTP id h11so5560728pfn.4
        for <linux-doc@vger.kernel.org>; Tue, 13 Mar 2018 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mL32Qb7PMaToZ6OovPJmLjkkGuuIkNuo7fzNpBbDyuE=;
        b=SwV+yhJ/xESeZ2nN+3Zw1iEhfv7kwz7Nd2dSPbIogBFJytCPAvfvxwCidIW5r9fuYa
         czkgArKmW600DsQjQKEIAZR1ziz75UGcBuqNsspHWsHtGdjliD8Tl5hEStjLmRFMDEaU
         SF8CviC7FjMDsBI4/c5HqvJOggOiibbSUFOfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mL32Qb7PMaToZ6OovPJmLjkkGuuIkNuo7fzNpBbDyuE=;
        b=FnRw577UlxsZiUMxAbah8mEXgdQosBtPjIWn786snu+Qw9w2mqVj2NNPk5tkSGp+ly
         F4MaCAiqT+eJN1KEioVx/4Vn5ZFKxTosDzYiwOAk33c8xSIFgwNYYLx84SEPk9e66KkR
         zWx5oJZSAmcG+dFx8faLRqD1UGAXFaGLD6YwJUX7oJUWIr4Cw0uFENQDIcckdSDGkSiJ
         dH6kvxh6FfZbMBRW9sbNFpE515VagI/Si2zwLfg1BaDWv+JOF/vXLTHMxwHLBDFQs9iC
         v98KXv24wmkZ/NzeVNNcp5UBWLBGPYH7W4T8Df9je1VDebqwvxooBg9HvA5VjM5dhAfL
         0xlA==
X-Gm-Message-State: AElRT7E2eA0RPgTbJSwztGT8pLri06KGQmbruwlayWATU92/dR3NGCUt
        aiyoj9jaF6PDN52zSg6Dl6524Q==
X-Google-Smtp-Source: AG47ELubn+JTSWWeB6aZOnTk/Wx9s5C/6ow1+WFSnD3gYUT3zPKfDOJu6WmHt7ApdQNwvgxK/0tItA==
X-Received: by 10.99.174.5 with SMTP id q5mr8951869pgf.170.1520930216061;
        Tue, 13 Mar 2018 01:36:56 -0700 (PDT)
Received: from localhost ([223.226.75.205])
        by smtp.gmail.com with ESMTPSA id s78sm20604028pfa.161.2018.03.13.01.36.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Mar 2018 01:36:55 -0700 (PDT)
Date:   Tue, 13 Mar 2018 14:06:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH V4] thermal: Add cooling device's statistics in sysfs
Message-ID: <20180313083653.GA15832@vireshk-i7>
References: <6e557b90950723065d49c9a545146ce31d7dc6e1.1516096153.git.viresh.kumar@linaro.org>
 <1520924571.3766.8.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1520924571.3766.8.camel@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13-03-18, 15:02, Zhang Rui wrote:
> Hi, Viresh,
> 
> I will queue it for 4.17, with just one minor fix below.
> 
> On 二, 2018-01-16 at 15:22 +0530, Viresh Kumar wrote:

> > +	cdev->stats = stats;
> > +	stats->last_time = ktime_get();
> > +	stats->max_states = states;
> > +	cdev->stats = stats;
> > +
> 
> cdev->stats is set twice here, I will remove the first one.

Thanks for catching that :)

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
