Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C5BFE7D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Jan 2019 10:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfAKKWm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Jan 2019 05:22:42 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39051 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfAKKWm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jan 2019 05:22:42 -0500
Received: by mail-ed1-f68.google.com with SMTP id b14so12657837edt.6
        for <linux-doc@vger.kernel.org>; Fri, 11 Jan 2019 02:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZPrExMqjX2aSg2yR/cKM5sDuT7CAwBh7xPK8cb41bao=;
        b=Ghf2qNccSpA7NEnN6SpJo1YEjgTFgUdEBCRA7jHQyPpNzGUzUC9988UGh8nCPz9P/3
         1mH1O21uQI8NldhNsSYLzE8H92KfJIDWk11xLL4uI7wEfG3IcGCb6ENMTLFeVx81PZ7l
         pDCVf1n8zkQn56zdOC8P5u0ew4pTcBT3tBmrlaL077/Fq852o5Go084lMq1YlCML/Zia
         X7MVCOv3ozbujDpOXi5Tanm6WxDQoJi1yK5tunmTX9baSkxDHdp69DzPdRZ/r9AOAlbn
         D47Q/E4Rl7b6psNY/FumqCQqmjLD/Cu0SUdge6Eo3pbNEZ9BBZVlvZSUVdFX0MhADMMY
         EOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZPrExMqjX2aSg2yR/cKM5sDuT7CAwBh7xPK8cb41bao=;
        b=djcNbhi52uRzpJVMHLtx+Iez4lrjN2pooBoRbPm1OVuHjg5W2loFRhPefzt3t5ggxQ
         3TedmKrruCpjhqpIOaqQ0XSjGRt9oqEsi51c/oUQcgxtN0Ts/KBL4Q1GNQHHiCrDnr8i
         ZMEvoP4d75fwjHe04FzVU/OOrrmChNueHhiFDafFGB433su+kR/1EJvrMnPOXaWIKQc4
         g6b2wW+slJ8PFv5puwLtaOJLn74vwr3Cx6vmXelcQh1qXeH1OuhIGNdBtFqRUov9DLkE
         eTkqEAPsys4f6Y7CmePZVETM0dl+VKwcO1o8nT51H790aB2F1BVgafTy8hIGdqatCuS0
         mffQ==
X-Gm-Message-State: AJcUukcFcbG0UsAcfTGc/NIHo7rlp72srt1oX7mSCFRabNfKoSwXQBmo
        u1gEOHQhbZvsYE5z77mo2Z2Mzg==
X-Google-Smtp-Source: ALg8bN67TOVnEU0oMn13ie4b+hH7Jk08ktufUBFz88c36nGxp2cJ/XIt4qgUzuOGlnh/DtJqAonuTQ==
X-Received: by 2002:a17:906:6d59:: with SMTP id a25-v6mr11394021ejt.54.1547202160422;
        Fri, 11 Jan 2019 02:22:40 -0800 (PST)
Received: from brauner.io ([2a02:8109:b6c0:d6c:c571:88:8aee:976c])
        by smtp.gmail.com with ESMTPSA id m14sm3093750edc.27.2019.01.11.02.22.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 02:22:39 -0800 (PST)
Date:   Fri, 11 Jan 2019 11:22:39 +0100
From:   Christian Brauner <christian@brauner.io>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/filesystems: add binderfs
Message-ID: <20190111102238.bpyyb6g4tmkm772h@brauner.io>
References: <20190110231309.12653-1-christian@brauner.io>
 <20190110164703.1dd6cee1@lwn.net>
 <20190110235641.nhuodos74i67jf64@brauner.io>
 <20190110170811.5d56f9cb@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190110170811.5d56f9cb@lwn.net>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 10, 2019 at 05:08:11PM -0700, Jonathan Corbet wrote:
> On Fri, 11 Jan 2019 00:56:42 +0100
> Christian Brauner <christian@brauner.io> wrote:
> 
> > >  - Please consider doing this in RST and tying it into our documentation
> > >    tree.  It's *almost* RST now, so the effort required will be almost
> > >    zero.  
> > 
> > Oh sure. I simply didn't know. I was just going by the files under
> > Documentation/filesystems/. Is this a separate git tree? If so, where is
> > located? Or can I just place it as
> > Documentation/filesystems/binderfs.rst?
> 
> The latter - plus an entry in index.rst.  Look at, say, path-lookup.rst in
> that directory now.

Good. Thanks!

> 
> > >  - Is it worth putting the example program in the samples/ directory?  Is
> > >    it something that would ever make any sense to run in its current form?  
> > 
> > Hm, I mean I can write a small binary that illustrates mounting and
> > allocating binder devices in binderfs.
> 
> This was just a thought - I sure don't want to try to send you off on some
> sort of project if it won't be useful! :)

I mean it'll be useful and it's really not a lot of work to be honest.
It's just extending the program I put into the commit message for
binderfs itself. :)

Thanks!
Christian
