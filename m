Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0077C6FD19
	for <linux-doc@archiver.kernel.org>; Mon, 13 Mar 2023 18:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjCMSIo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjCMSIV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Mar 2023 14:08:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8318224CBB
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 11:08:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1E45961454
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 18:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E19AC433D2;
        Mon, 13 Mar 2023 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678730896;
        bh=O1dUfINXR84NwcToeMGRu+tsgQgwJUouCduZWnkQ7oQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d/HtN/jWKseU+meHCXqrO9NXEoabF1+0LOhri9cQEop7IR3U/eD1sLgH7nRdfj2jm
         etZdffMNU8I4P1a4inGJWGIgoi0cdmBbiTjW757tjyKR0FP4QecCsc1DRPvipWMyVy
         ozg6WfYAjTqX6QYL7eMttaYWzFpUGApy+cZUljwY+TAGkugQfzJB8Ez5sx+aKvJEr3
         npRGxpmSrag+n+fXTnxM1AgrNoYkIH1KlaRNu6oKuTMBsAixmHRfpccTealcQjyDzv
         +VS98B6/pLkYlPng/DTk1N3tOPnXyW5JPMAC71lLrICBB5+bW/AbzNDwoOZHZ6mZNm
         Y7tSfmV/49pmQ==
Date:   Mon, 13 Mar 2023 11:08:15 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Bharath SM <bharathsm.hsk@gmail.com>,
        David Howells <dhowells@redhat.com>, davem@davemloft.net,
        edumazet@google.com, "pabeni@redhat.com" <pabeni@redhat.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>
Subject: Re: [PATCH] dns_resolver: correct documentation error in dns
 resolver
Message-ID: <20230313110815.57961698@kernel.org>
In-Reply-To: <b4674fec-9763-ef16-9b6b-c2292df2f469@gmail.com>
References: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
        <b4674fec-9763-ef16-9b6b-c2292df2f469@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 13 Mar 2023 10:44:39 +0700 Bagas Sanjaya wrote:
> On 3/13/23 02:42, Bharath SM wrote:
> > Fix error in dns_resolver documentation
> >   
> 
> I can't tell what the error you fix is unless I see the diff below.
> At a first glance, I though that you fix Sphinx warnings.
> 
> Also, is this patch [PATCH net]?

No strong preference, dns_resolver is sort of in between network
filesystems and actual networking. So Ack for linux-doc taking this
directly if that's easier.
