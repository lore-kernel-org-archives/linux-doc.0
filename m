Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ED2617DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 15:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758480AbeD0PxY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 11:53:24 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36315 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758469AbeD0PxX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 11:53:23 -0400
Received: by mail-wm0-f67.google.com with SMTP id n10so3744708wmc.1;
        Fri, 27 Apr 2018 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2sc/CNdVlf4F5Yk38jJlRMvufevC5RNZM7Z1+H4ADF4=;
        b=qdvPJiKwVdrXsV/LUjmIGTTESEUGrNSnA5TUx/cyRQT9t4MUHGt4smSfUU6AYWvdoc
         15puliqyzGZ2vsPX7WlxkPGL2IjVkHUgGEFmKMuOtLMdXIJKdnd16vMMfE/NM7Hj+wtL
         0buIUuLTwuXvIUjURCJiZY4v3dManFrzFiCYr1+SOCRXY5tJaS1fhwT5hCzOGJ4KLYXd
         r6fne9uxmXFLh0r0FEzc29ryB3yCOCBGxLheOWHHZW2xEtezTZq3zGR1GRk83WNLuLAa
         j/KwhPVZDpY/eKqGNsPo9dgj1iayvOkmp81KeMNBZZmvJSuOxRBvyecy8deonYeqRstd
         wdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2sc/CNdVlf4F5Yk38jJlRMvufevC5RNZM7Z1+H4ADF4=;
        b=sMpKDPd3/Twv4Ffm9rudQe1Dq/LfbOKQXAjtxrBQ8J9RJ5zq9HlInvtRzOhMKqci1W
         2BSMlhYMnSH/0LaowycHz/OSNvIRxP3EAZp4mh7VUNus3FIVNUuke7AuV0QMXXYG3jzl
         MR9gvSn7t8yAeIw1u3iwvBCS8u1qY7C+SeWPozenUBb3kSmkU0z0WfYUm4gJhUJAJQ/U
         sCynqI3KuMNAQpC49218Mri70rrW2PSj8D5IU+I1nEhCRlq4vGjdbHv3pbuIqHy13e0q
         SpjiDxeh2xLR76d5sGRuHW85eHdEJD7/8mPK0wT2yfjoGgmuhd4tfa5Hzrf1LpTbQxgS
         Z1nQ==
X-Gm-Message-State: ALQs6tBAsfgXvJtqBZPbO5J+ic6fzxY2+kK+TxSahYa3lYjG+5e1WcTo
        zkcatMlytncmNSQOT3EKYTo=
X-Google-Smtp-Source: AB8JxZozl46oim1QLZmgbihKLRD1Hfr3JNOsw32WKuOea/WpgJqWv75MWbOkGFbs/s7qsr8gVqTVfA==
X-Received: by 10.28.160.26 with SMTP id j26mr1649554wme.74.1524844402031;
        Fri, 27 Apr 2018 08:53:22 -0700 (PDT)
Received: from AHABDELS-M-M2VD (wifi-guest-target.gssi.infn.it. [192.135.27.147])
        by smtp.gmail.com with ESMTPSA id k89sm1543193wmc.15.2018.04.27.08.53.21
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 08:53:21 -0700 (PDT)
Date:   Fri, 27 Apr 2018 17:53:20 +0200
From:   Ahmed Abdelsalam <amsalam20@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     davem@davemloft.net, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [net-next] ipv6: sr: Add documentation for seg_flowlabel sysctl
Message-Id: <20180427175320.9690fefcead52e3b73ad100f@gmail.com>
In-Reply-To: <e9dcc2ad-798f-5dce-a508-e3d1fb450d0e@infradead.org>
References: <1524825344-2573-1-git-send-email-amsalam20@gmail.com>
        <e9dcc2ad-798f-5dce-a508-e3d1fb450d0e@infradead.org>
X-Mailer: Sylpheed 3.4.1 (GTK+ 2.24.21; x86_64-apple-darwin10.8.0)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 27 Apr 2018 08:47:14 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 04/27/2018 03:35 AM, Ahmed Abdelsalam wrote:
> > This patch adds a documentation for seg_flowlabel sysctl into
> > Documentation/networking/ip-sysctl.txt
> > 
> > Signed-off-by: Ahmed Abdelsalam <amsalam20@gmail.com>
> > ---
> >  Documentation/networking/ip-sysctl.txt | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
> > index 5dc1a04..7528f71 100644
> > --- a/Documentation/networking/ip-sysctl.txt
> > +++ b/Documentation/networking/ip-sysctl.txt
> > @@ -1428,6 +1428,19 @@ ip6frag_low_thresh - INTEGER
> >  ip6frag_time - INTEGER
> >  	Time in seconds to keep an IPv6 fragment in memory.
> >  
> > +IPv6 Segment Routing:
> > +
> > +seg6_flowlabel - INTEGER
> > +	Controls the behaviour of computing the flowlabel of outer
> > +	IPv6 header in case of SR T.encaps
> > +
> > +	-1 set flowlabel to zero.
> > +	0 copy flowlabel from Inner paceket in case of Inner IPv6
> 
> 	                            packet
> 

Thanks
I fixed it in v2 of the patch.
-- 
Ahmed Abdelsalam <amsalam20@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
