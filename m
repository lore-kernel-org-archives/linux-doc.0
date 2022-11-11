Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73B6C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 11 Nov 2022 03:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbiKKDOK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Nov 2022 22:14:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbiKKDNv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Nov 2022 22:13:51 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6012859847
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 19:13:36 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id f8so2399817qkg.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 19:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.cmu.edu; s=google-2021;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tXjL2xuNTxaf0t25IHELw0JaF4AqnET6f5arztJ55Uo=;
        b=DsLeF3F08rYvUl/AA0cHfyK8lotasWlTVOH2CzWhqRnZvkDSqUTbfvKZM15qcBvva1
         r7mfwqI2oTaMRqViItEbWMIZ5KzFz6E0MYYMHfj7mkxbLZINR2yTC0xgwUaIECaFRtQl
         vkGDwWAepOB/V7PbtfIIaSFJoDKs/AAf6cOW7iuL04N9TUGR0H2FBJP+SFl9+rH/HvcM
         c7na7AlLxQFSlb8N1nuIxgnq9sD1yAdOCk3SLsUFEq+mOeMqOEr8j51VsC6rZS80FBZd
         BeSoUxEPhJ501Xkw5KfOEEWT/2lctEe6LKsmE+qyZRnr5qhc8ZK0Vrzw8tAnNoinrXAR
         XRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXjL2xuNTxaf0t25IHELw0JaF4AqnET6f5arztJ55Uo=;
        b=EHbwGTfCeK8lozVPXaeWQCnFPOOlWpx12kgtLskiPLmCLI59VSw7mz7mZhJwxecz9H
         Edyr7YRrlKN7yT0aWFR1RdN8+kg6A1KFyUqeHSrp7c1HTabphqkDCTfl3Hw3p9Sl5QY6
         yJiZtHrKPHmSwRWH+Ux4TqlSMVHNfHOVx2/zwD36t+dR/f6NlkHVtxyO+eMlk4vhQ3G2
         s9ABMDpJzEp4eUlpnWETKyd8hP6/GVsKSefatncJIGYYpThn3UzZ/tyT7hAEhjHIalhz
         CMQ7cHejtbOdBuRpU4dyax0UO9nMnXT1v83Gm438dmsGgntrvm6ra+Ax1ShPv2LT24C6
         7YeA==
X-Gm-Message-State: ACrzQf1TahYrCEYcPnkLJis0Lz90Q/s70ewrr7+O02O7LJz8Qlddnwc4
        VsrVf4nyXqu7jZVG6W1gax0GGw==
X-Google-Smtp-Source: AMsMyM7AJuEUxzarcx3ig4AyyQmI79bdpe9h8iNEshQfMBSSzfM492lzn5DNnWOJFy7TTYpR3yAnnQ==
X-Received: by 2002:a37:8081:0:b0:6fa:ac63:f836 with SMTP id b123-20020a378081000000b006faac63f836mr2409555qkd.43.1668136415435;
        Thu, 10 Nov 2022 19:13:35 -0800 (PST)
Received: from cs.cmu.edu (tunnel29655-pt.tunnel.tserv13.ash1.ipv6.he.net. [2001:470:7:582::2])
        by smtp.gmail.com with ESMTPSA id hj10-20020a05622a620a00b003a582090530sm581354qtb.83.2022.11.10.19.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 19:13:34 -0800 (PST)
Date:   Thu, 10 Nov 2022 22:13:32 -0500
From:   Jan Harkes <jaharkes@cs.cmu.edu>
To:     Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: Re: [PATCH v3 05/15] coda: remove CODA_MAGIC
Message-ID: <20221111031332.qt2ggahuo6gcnwiz@cs.cmu.edu>
References: <cover.1668128257.git.nabijaczleweli@nabijaczleweli.xyz>
 <91a186d5a3ebebb10ca5f9dd460448ff42c5229d.1668128257.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91a186d5a3ebebb10ca5f9dd460448ff42c5229d.1668128257.git.nabijaczleweli@nabijaczleweli.xyz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 10, 2022 at 08:14:01PM -0500, Ahelenia Ziemiańska wrote:
> We have largely moved away from this approach, and we have better
> debugging tooling nowadays: kill it.

I still haven't received a response to my earlier email asking what
better debug tooling you are talking about.

I gave an example of an older bug, which has been fixed, where a Coda
inode accidentally ending up in ext4 through an mmap path. This ended up
scribbling over a spinlock in the coda_inode_info data which resulted
into pretty random system lockups.

This was actually quite hard to track down because there is no check
that `file_inode(vma->vm_file)` actually returns the inode of another
file system. So I'd be interesting what this tooling is or how it can
be used to better catch/identify such cases.

So I actually like this type of magic because it can potentially catch
some cases that should never happen. We could rename it to from MAGIC to
ASSERT, we don't remove asserts from code because of better debug tooling.
Those random 4 bytes in a Coda internal structure are not in a hot path.

Jan

