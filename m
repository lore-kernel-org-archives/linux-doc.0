Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SORTED_RECIPS autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 234AA7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Jan 2019 18:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfANS4X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 13:56:23 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:38595 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbfANS4Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jan 2019 13:56:16 -0500
Received: by mail-pf1-f169.google.com with SMTP id q1so31573pfi.5
        for <linux-doc@vger.kernel.org>; Mon, 14 Jan 2019 10:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IX+dhyoUTqOpDLszzjf/ieQT97h5YR/fB1FZJT8KF+g=;
        b=bjNM4n5JQJjcBkQEP9H0ifXHNY9R+GwXkEQxPVrXB5Mun3iUrvB0NFllXtxcA1Uvn0
         MrdsTTXjQpEuct5EvMhN/lRgg+YahDgqEklRyoRTlQkPg9TmChVZRiretxzYTBGHZsDG
         8Hpt/I20ZY/QFL0kMN+2O+bLsXVTzKCx1kCDbP61lUDlL1O+25/40EyK78xtZYOPUGrH
         M1ZfMHKqVVrM3BynPJDjm8DlDbuQ2/pPA1hI7naYLlMtxDjLYILJpFR6CgJAil17WARx
         HpCvl8gXG/ic6/06+Vrk/3QVTJ0Cy1nFwpB8RRLqqsnrJtrY7/AawcGpAEggWshUucd7
         Yoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IX+dhyoUTqOpDLszzjf/ieQT97h5YR/fB1FZJT8KF+g=;
        b=UaYjBqHA7jj9Od5yMFLatCOXyFlwlvE6/Ezfg9yZgm315Pv9TqJYU6Y73rwK80iEMO
         9EzN0LmRKwK2/mXYTg4TBNzw6JQEzZ/fsebBPrk+ifsC9Ech9TSz4cQeJo7out239yo+
         ZcAJRln4K5uMN2HVZBLwDlsb8lrkJIkemxkUbhQGnNydJrqLuPsd0fqtOtWF+bY6xliK
         bmy6hI+UciGWSwQvF2aRSS4uoAtGadZ+LbwcMtjURV39DmLH5RiCH3DNUtlbXmtO4ANP
         mCAJv83mFyhWfft/MYzYmI8DC8FCRseyutMZqXOk6gcXTs3V89LiBHY51AFq7Ba0QY/8
         l21A==
X-Gm-Message-State: AJcUukfVU0gq709TQRpf10hAyIMxl3mpTZkJba8gdgS4XlWkltdLC0ui
        HIq+Dog7x92si9coeQFgTyqgJA==
X-Google-Smtp-Source: ALg8bN5Kpi2F/1XfU4wfPnYfrnu5GsC6PTXaB+IQkqeJ+6bvj6sUNa741hTnW9/6qIPBzPJmZjp2Qw==
X-Received: by 2002:a63:3204:: with SMTP id y4mr24104960pgy.41.1547492175765;
        Mon, 14 Jan 2019 10:56:15 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id m3sm1432736pgl.69.2019.01.14.10.56.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jan 2019 10:56:14 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gj7PB-0007vR-Vj; Mon, 14 Jan 2019 11:56:13 -0700
Date:   Mon, 14 Jan 2019 11:56:13 -0700
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joel Nider <JOELN@il.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leon@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH 1/3] docs-rst: infiniband: Convert user verbs doc to rst
Message-ID: <20190114185613.GF22910@ziepe.ca>
References: <1547456451-7102-1-git-send-email-joeln@il.ibm.com>
 <1547456451-7102-2-git-send-email-joeln@il.ibm.com>
 <20190114165621.GD22910@ziepe.ca>
 <20190114103421.7fef97c0@lwn.net>
 <OFE572E930.5960E029-ONC2258382.00673730-C2258382.0067A91D@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OFE572E930.5960E029-ONC2258382.00673730-C2258382.0067A91D@notes.na.collabserv.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 14, 2019 at 08:52:14PM +0200, Joel Nider wrote:
> > > Jonathan/linux-doc: Can you Ack at least the build system parts of
> > > this please? I can take it through the rdma tree, unless you prefer
> > > otherwise?
> > 
> > Can I make a request?  This appears to be user-oriented documentation;  can
> > we please place it into the userspace-api manual, rather than keeping it
> > in its own silo?
> 
> I knew someone was going to ask me to do that :-)
> I agree that userspace stuff should all be together, but I guess for 
> historical reasons this one stayed in the infiniband section. So if Jason 
> is ok with moving the doc, I'll take a look in the morning to see how best 
> to work that into the patchset.

I don't mind

Jason
