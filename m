Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 917B77D584
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Sep 2018 18:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730377AbeIFW4A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Sep 2018 18:56:00 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38866 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbeIFW4A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Sep 2018 18:56:00 -0400
Received: by mail-pg1-f196.google.com with SMTP id t84-v6so3799063pgb.5
        for <linux-doc@vger.kernel.org>; Thu, 06 Sep 2018 11:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hr6P5TygTHl/oHPHtePFA77lLt4zl7jMvYUPCT4B3nw=;
        b=B2bcD0FhAzrBZBycjo0Jie9Mme2DBD72spKSSUo3BRG32gG37hkVtGTPZ1HARhc6gQ
         FVwEk7H/U/v6NAhQf/1ynZ8MmV0iYa8PcYTufX2oCfnRN6Fgftlbykj6rkF2AvoZc1Es
         E07MqeegOUZMRMu9IRqEABRJktkZ02aJzCwaUfqijJ8zT4r/68AiogIPsDXd+lOgc+/e
         KbzhAmi4IbC2OPW64YuIMVv9+Wz9nb5EKPz08lnlN+39bVZmIq7gjrJ4Vo1O9WSl2ezY
         OgFxbLxr+jRsxbjCNrv2YJf9Mlr7oecWjS+oy5mGuOB/trHITd4O7PLizE63zWa7pKkP
         LzeQ==
X-Gm-Message-State: APzg51BV82mwkuw5iDdn1pkn6EBr99XfqHAUKpkX9ajY3O8627gDT7ji
        n3k4VQAaAlhSsvuyD6SmGDDRVA==
X-Google-Smtp-Source: ANB0VdZN75wUKBAdl/x5558iqLdQqh/1Ko4uFOxuOu11xwYfatys+PgZ6lk+k2g3aBydwXp1W+e6XQ==
X-Received: by 2002:a63:481:: with SMTP id 123-v6mr4208747pge.129.1536257960299;
        Thu, 06 Sep 2018 11:19:20 -0700 (PDT)
Received: from localhost ([207.114.172.147])
        by smtp.gmail.com with ESMTPSA id v8-v6sm7401061pff.120.2018.09.06.11.19.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Sep 2018 11:19:19 -0700 (PDT)
Date:   Thu, 6 Sep 2018 11:19:18 -0700
From:   Moritz Fischer <mdf@kernel.org>
To:     Alan Tull <atull@kernel.org>
Cc:     Moritz Fischer <moritz.fischer.private@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-fpga@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 3/8] fpga: bridge: add devm_fpga_bridge_create
Message-ID: <20180906181918.GA20419@archbook>
References: <20180904212237.3078-1-atull@kernel.org>
 <20180904212237.3078-4-atull@kernel.org>
 <CAJYdmeO0RegP4q1tVow1U0=Zc42GEHMuqsHsvHvMqp89zZ6Wpw@mail.gmail.com>
 <CANk1AXQaSLziycCv4X50xufehu7AgV34pxydxs8H14uFREy4YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANk1AXQaSLziycCv4X50xufehu7AgV34pxydxs8H14uFREy4YQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On Wed, Sep 05, 2018 at 10:38:53AM -0500, Alan Tull wrote:
> > > - * fpga_bridge_unregister - unregister and free a fpga bridge
> > > - * @bridge:    FPGA bridge struct created by fpga_bridge_create
> > > + * fpga_bridge_unregister - unregister a FPGA bridge
> > > + *
> > > + * @bridge: FPGA bridge struct
> > > + *
> > > + * This function is intended for use in a FPGA bridge driver's remove function.
> > > + * If the bridge was created with devm_fpga_bridge_create(), the bridge struct
> > > + * will be automatically freed.  If the bridge was created with
> > > + * fpga_bridge_create(), the caller is responsible for freeing the bridge with
> > > + * fpga_bridge_free().
> >
> > I find the formulation somewhat confusing, since it could be
> > interpreted as if you
> > used the devm_() functions you don't have to call unregister().
> 
> Yes I'm being too verbose and it's making things muddled.  How about
> if I take out the part that starts with "If bridge was created..."?
> That just leaves "This function is intended for use in a FPGA bridge
> driver's remove function."

Sounds good.

Moritz
