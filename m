Return-Path: <SRS0=3gwW=AS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB49BC433E5
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jul 2020 18:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD48C206E9
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jul 2020 18:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cs-cmu-edu.20150623.gappssmtp.com header.i=@cs-cmu-edu.20150623.gappssmtp.com header.b="gXKzSiyH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgGGSyr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jul 2020 14:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgGGSyp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jul 2020 14:54:45 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5F3C061755
        for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2020 11:54:44 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id h17so3417628qvr.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2020 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs-cmu-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YGy/m8xEOQDT9obhvOtSDfmKKzyloXGXH1QLDCFSpUU=;
        b=gXKzSiyH2KH38Iomh2RKUzQr/kgTZOfZELJ4AoGxA3Fojy3lgC2BgyOLa6F6Fv3lqJ
         zUPXMKyTcQs6IIhgwrcIF4Jk5oZKjyj9I/OMNzuXgbPuJjegOX8LQx5HOzsYrRh0dWzG
         P2Wy89miBumJ361+UpdIVMIp2JXdmmk1+jQpU6k3WB9GAFgKYN4vK+gxxxtJYYvTT/yg
         fO2XZNKNhKX2as9ehMwtM0hWLSflEivRwHouz5d/WTW3toQVLyGTMfCHA3TOefe716zN
         wpRapQVk3BdqoczLNXjDHbKrsvXrwL6iapd4KJs2vyXfsZPbX3kQTLBCkcQRppuCIytS
         ge9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=YGy/m8xEOQDT9obhvOtSDfmKKzyloXGXH1QLDCFSpUU=;
        b=Kk1iuKxRAdUm9uDU7ex4WFwlkl4W8zn+/2kRZkyvTSXAll0LR0NFMiET0k4law8fJ5
         cjUlnLNSVuWD7iux0/R3w9depMWrCsrs8zW+sNP0cVPPiuXvVBQFqRnhip/hJBYUG3Yj
         fGNjMgp/kwIDKko5dW9RDRPuCxGePfm7oRChOuFf+cC1GJ0ycP6gMlrZvG3vSXVTIgD/
         45xH5w5bUOwfWIucCdhtwxR/NKzFQc1ZdfaJb3DgNplRgUCIG+y++8idFZEqHU2D8qAC
         kepPwbyO5rT7hElkgWZE/ngF7ERV1ek9AmOJHpL9c+R08lbfcxasn/Z1PUfMB26gslVL
         YFqw==
X-Gm-Message-State: AOAM530uxrJNDx9eqYm409Uc/uiLdmvMp62EWcsuQE/TqdBVSXOl1rEg
        GAWe5wpn+iCJZFhxnNNnSWd+hPabReE=
X-Google-Smtp-Source: ABdhPJw13M0HuQIPVgDgKor3Jdmhu+FHNzhiJ2M+bTVpGx9gz5MLzpmLxUmgdMz/ta0j3jp+jYxw2A==
X-Received: by 2002:a05:6214:2d2:: with SMTP id g18mr52680967qvu.215.1594148084186;
        Tue, 07 Jul 2020 11:54:44 -0700 (PDT)
Received: from cs.cmu.edu (tunnel29655-pt.tunnel.tserv13.ash1.ipv6.he.net. [2001:470:7:582::2])
        by smtp.gmail.com with ESMTPSA id x3sm26273037qkd.62.2020.07.07.11.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:54:43 -0700 (PDT)
Date:   Tue, 7 Jul 2020 14:54:41 -0400
From:   Jan Harkes <jaharkes@cs.cmu.edu>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, coda@cs.cmu.edu,
        codalist@coda.cs.cmu.edu
Subject: Re: [PATCH] Documentation: coda: annotate duplicated words
Message-ID: <20200707185441.f4jo62w3qjdcqkkj@cs.cmu.edu>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, coda@cs.cmu.edu,
        codalist@coda.cs.cmu.edu
References: <d7c2d274-de28-193f-5a98-9e3e16c6c9d5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7c2d274-de28-193f-5a98-9e3e16c6c9d5@infradead.org>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 07, 2020 at 11:49:31AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> At first glance it appears that the coda.rst file contains doubled
> words "name name" in two places. Turns out it is just confusing
> (at least to me), so try to make it clear that the second 'name'
> is just the name of a struct field/member.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jan Harkes <jaharkes@cs.cmu.edu>
> Cc: coda@cs.cmu.edu
> Cc: codalist@coda.cs.cmu.edu

Looks good to me.

Acked-by: Jan Harkes <jaharkes@cs.cmu.edu>


> ---
>  Documentation/filesystems/coda.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
