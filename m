Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EB2287D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 17:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbeJPB2x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 21:28:53 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:36270 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbeJPB2x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Oct 2018 21:28:53 -0400
Received: by mail-yb1-f194.google.com with SMTP id 5-v6so7824534ybf.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Oct 2018 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ettus-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LP9KqfGe7J0+MJqL6fpz6qAgw9M6tsvAiyg9rZFcTw4=;
        b=yut1JrBUwC0dGe3gRvrj4kNntdG4c7ZigxRAmlH44ZcTNQCObdyOaBMG07z0fd8Y2k
         EFNMuoZbTvXI1MpZRwdN91tiFGyQ4avQ5ewR4LE/ZRUWyBSl1WMqhEF5mWdeR1kA3yfW
         5hwipkuOnUaleOJ1ebayZb3RN5+fi9xmMkCvVAcdpbQrKj0DEwspPXeoMIuYkOTMaZ1M
         Qb14U9Z/Jr5gI0keHb/XuRw7OugHdWl99w9GLZPOTRTQ+57rVF5sNAvg20AAwc/On7/p
         bZ3wCoe02xLDfnDP/6QrChKYQy4pscIDU8J53z9SxknRmz3TfE7QhvJYMeAZM2aAnM1c
         jfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LP9KqfGe7J0+MJqL6fpz6qAgw9M6tsvAiyg9rZFcTw4=;
        b=oJ/aEEge+LT8FtZKNSwLymDeZXAIVU+hKXLYcPAE/V7bTA5mZRiIiTyWylAREM7ssl
         ZK03yA1xh3r7cj7EI5trRSZ40FS9P7oLS52TG1+8r7hcEUX49gA3jXDybLWNw9rQTmqk
         TaXLF20uhsdrsMmc5X8vr+szigKeLV9iNOhnnRxdFl+t8qscso1Tgh1+ClAEUhy2jb86
         mwqTdc8RhGZujrYw+08TiUCjinzuvo3K+tqF9IKVuR3ueeyp9m8KXLysP+PGkbZ43J4e
         QC1J4n9HA9rsTc1x3can/dCDEEhlhhWy/E+63gYV9SE2Xh/H42gjSY1rKb08X7LMq7YE
         4Ppw==
X-Gm-Message-State: ABuFfoh3PPPC6Y0qch6pGu+WFmbQHcA0OUhWu4j+Sz6eFv9AUBStn4gI
        RJL5Ta9OaiNgyNm8vFN2mwMsbLquvMgQgHBlUIqkWA==
X-Google-Smtp-Source: ACcGV62QpcSFFKdT/6WeoWC61Mnyyx1s32NFO5BsZvja7aNz+hs1lzdp99E6dzkPy+hRBZbUNVZ9cxOKkb76K1zsxhU=
X-Received: by 2002:a25:3186:: with SMTP id x128-v6mr9840904ybx.227.1539625359548;
 Mon, 15 Oct 2018 10:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <1537978342-17697-1-git-send-email-atull@kernel.org>
 <1537978342-17697-2-git-send-email-atull@kernel.org> <CANk1AXRoNFqxg3OZLkOsFyn5R+qMPCmoz9MwULfyqwBStzBj7A@mail.gmail.com>
In-Reply-To: <CANk1AXRoNFqxg3OZLkOsFyn5R+qMPCmoz9MwULfyqwBStzBj7A@mail.gmail.com>
From:   Moritz Fischer <moritz.fischer@ettus.com>
Date:   Mon, 15 Oct 2018 10:32:37 -0700
Message-ID: <CAAtXAHfkLnuZTwHAMe3WqYDh4K2y7CSsWZVzDqKvTyVO4RxcbA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] fpga: mgr: add devm_fpga_mgr_create
To:     Alan Tull <atull@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Federico Vaga <federico.vaga@cern.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-fpga@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On Mon, Oct 15, 2018 at 7:55 AM Alan Tull <atull@kernel.org> wrote:
>
> On Wed, Sep 26, 2018 at 11:12 AM Alan Tull <atull@kernel.org> wrote:
>
> Any other comments on this patchset?

Looks good to me, Sorry for the delay

Acked-by: Moritz Fischer <mdf@kernel.org>

Cheers,

Moritz
