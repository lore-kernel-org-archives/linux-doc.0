Return-Path: <SRS0=t8tM=DY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135B6C43457
	for <linux-doc@archiver.kernel.org>; Sat, 17 Oct 2020 13:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D29D720756
	for <linux-doc@archiver.kernel.org>; Sat, 17 Oct 2020 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602942663;
	bh=xHyrZDkpw4xtH8tXTI9/HLzwefOR49SnPpbecwDhS1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nIzXeqFba9F2rsgCCIU3ON58mf2yjBYO1cdbfSNDwsecdJsy0buDHUKTdUaFv6EGe
	 3DKoxuivssHuWL7/7o+SOzeU1xOSp8Nfyu2BsBv47to21T93HTdnO31vu7bvZqCZkK
	 2rytgEnG9k3/Ihms+LVb79QhDjBoj6XFSvT3Jn4k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438200AbgJQNvD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Oct 2020 09:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438199AbgJQNvC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Oct 2020 09:51:02 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5561CC061755
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2020 06:51:02 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id q63so4256811qkf.3
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2020 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=4MgdNESWv5eDl+CUOXr6F2inTCBbN7co4Pv3gwx16Wc=;
        b=EiXO03NhEk2wbgmN0avyaTVn215mJlgFIRwAZkNm4U8ohgwsX9ZY+vAuSi4wAEkgDf
         Sw9MTqnCownGn9LsP+J8b5Xx5BFRtMXmNvFxexLlVfmNZedq4QF9KyojkQmFxJucDlZz
         MXxaua1SrN6eBr+RouqCqyTySXgVnZ3uaDe9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=4MgdNESWv5eDl+CUOXr6F2inTCBbN7co4Pv3gwx16Wc=;
        b=kcX2PLM6FbOq4St35vlJ0fDAFSkoUsdJbIzra0uFFVHHxjvxHCNW6u8u8wCaiWt0R7
         VlC8Wdbk8BpxETTRRsnBv6DHajvClLllfeBdeWp6LVLAdA39z5tQ30UuA/capecpk2fo
         we0wgnc1bc8WTcDl1M2ze6OYRZ0lb1kCj7EJnwJqL9D3V64NLMHkJ6WYObgkrJdC08lk
         eu1QPzkNJAoI+IKw4pVppFHbS+lMhGmJB1w8vPUY58TJiFCMYmJodev1zKOD8V7UyyZS
         dCHSSSZBPdSYolTTTmmXGOvmh3lMfKmO4JpJ23INxAcSa1JdOcWR2/eCXTQBFWQb058h
         tPwA==
X-Gm-Message-State: AOAM53018qrtxvn8h3THyuVKBOTzES9JfmlLBVx6kNRIZbL63mhJhJmx
        g5QiKCmeOAITjBxpTyLeak0pCw==
X-Google-Smtp-Source: ABdhPJwPgt9GwEUG+ybkb4xxn9y8igRaI2t/gURb9hFpkSJ8NgJbpMtJD+JGsolQE0HM633TfuLc3g==
X-Received: by 2002:a37:9b42:: with SMTP id d63mr8411455qke.49.1602942661073;
        Sat, 17 Oct 2020 06:51:01 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id w6sm2115321qkb.6.2020.10.17.06.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 06:51:00 -0700 (PDT)
Date:   Sat, 17 Oct 2020 09:50:58 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Backing up the PGP master key
Message-ID: <20201017135058.mxlbuxqekpvy3hqx@chatter.i7.local>
Mail-Followup-To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201014213406.GA7622@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014213406.GA7622@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 15, 2020 at 12:34:06AM +0300, Jarkko Sakkinen wrote:
> Konstantin, writing to you based on 'git blame' :-)
> 
> The maintainer guide recommends using paperkey for the PGP master key,
> which is a prefectly sane method.
> 
> I was just wondering that isn't a backup to a USB stick a reasonable
> option? E.g. get a few USB sticks (new, unweared), store your master key
> to each of them and put to safe.

Sure, it's an option as well. I believe the guide recommends three 
different backups:

1. thumb drive within reach for regular access
2. another drive in case the first one goes bad
3. paperkey backup in the vault

There's no reason why #2 above can't go into the vault as well, if 
you're inclined. I wouldn't skip paperkey, since I'm generally wary of 
putting anything long-term onto electronic media due to things like 
charge decay, cosmic rays, or other weird phenomena resulting in flipped 
bits.

-K
