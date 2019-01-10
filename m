Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 74AD97D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Jan 2019 23:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbfAJX4p (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Jan 2019 18:56:45 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41861 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727705AbfAJX4p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jan 2019 18:56:45 -0500
Received: by mail-ed1-f68.google.com with SMTP id a20so11662662edc.8
        for <linux-doc@vger.kernel.org>; Thu, 10 Jan 2019 15:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RKKaQjsv4Ps4QaDXlz2Kbrdhx+3vq2p7DIwKilUCu+Q=;
        b=gBRGjVEzzHHjs9Kxz9qmjwlS5rAvNpHKHMR3j/RRzNVi/SPcY80c/QR0kyrpydTTJc
         BvCIyYA/TUbDdSBr79ZMnynMno49ttXggigjsRi0P6bv+Bv9wEI7Rgkg7d0SSnbWAD42
         hSH/V6tnPstdTLVnNhC/PCNUMtG1eHChIol7c1YDPm8/PMUmU6eFwwU5Jmd+7prinoc7
         dr+lurmvEn72/Swf4TUZ2kXMwv7R+7ukEmnp6I3luCMOkn7g0BMhoQxGSm9qJnbEGM3a
         bwJ3xa7mJPzf5mCqJlOsrqIpkYSOtIpmptoZzyet6wKbBDcuJMbVdPq4mvCbVBVBt0HY
         xXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RKKaQjsv4Ps4QaDXlz2Kbrdhx+3vq2p7DIwKilUCu+Q=;
        b=kfLrOar5vz7huqNfSkT47ZLFESwXcNJ6EBHb43YrikVceARY6B8k6/Hmyz1fJt1qXQ
         RqxPK2lQuJsWXHndOHibjuvRcP5jl5N61r10WG+S8NfveV4FsOwV9OTDlnvGS57+79Rh
         fgzY9P1fcA1Iu+Dh3qg/4HWSq19w7uGO/WdGavAqzstbKeesuXPfIwT8Bq6WAWLgMnPD
         WQjIUkKEhRPxB3aYauan91d4Agc9pnEAj1zahhEcxGsKdR3Gio1sc+jfp2V8ZOzuP1Kk
         mvOLT5xk/X4BYCF7dcrGExPjDAIsFbTIY85N5yEWQ0+5fzI4OgYItNwYdfTHFjEtrD1y
         pLxA==
X-Gm-Message-State: AJcUukcz4teHc/h6kJ7YyshK+B69G9UyUuM7AeonpS5aDNcT2SERAbZo
        H/g+IjgsyFVKHKtpQQFkXzW49A==
X-Google-Smtp-Source: ALg8bN7rq9a7f+WdmQbMa9wdhL1PSWJKfVTuLPmAwNg2Ogw9husPRUqNAVwq5e309XaqeQvm+XBhMg==
X-Received: by 2002:a17:906:20c2:: with SMTP id c2-v6mr8085291ejc.241.1547164603532;
        Thu, 10 Jan 2019 15:56:43 -0800 (PST)
Received: from brauner.io ([2a02:8109:b6c0:d6c:c571:88:8aee:976c])
        by smtp.gmail.com with ESMTPSA id e35sm2075779eda.13.2019.01.10.15.56.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 15:56:43 -0800 (PST)
Date:   Fri, 11 Jan 2019 00:56:42 +0100
From:   Christian Brauner <christian@brauner.io>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/filesystems: add binderfs
Message-ID: <20190110235641.nhuodos74i67jf64@brauner.io>
References: <20190110231309.12653-1-christian@brauner.io>
 <20190110164703.1dd6cee1@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190110164703.1dd6cee1@lwn.net>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 10, 2019 at 04:47:03PM -0700, Jonathan Corbet wrote:
> On Fri, 11 Jan 2019 00:13:09 +0100
> Christian Brauner <christian@brauner.io> wrote:
> 
> > This documents the Android binderfs filesystem used to dynamically add and
> > remove binder devices that are private to each instance.
> > 
> > Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
> 
> Seems like a worthwhile addition overall.  I know nothing about binderfs,
> so can't speak to the accuracy, of course.  I do have a couple of
> metacomments, though:
> 
>  - Please consider doing this in RST and tying it into our documentation
>    tree.  It's *almost* RST now, so the effort required will be almost
>    zero.

Oh sure. I simply didn't know. I was just going by the files under
Documentation/filesystems/. Is this a separate git tree? If so, where is
located? Or can I just place it as
Documentation/filesystems/binderfs.rst?

> 
>  - It should probably have an SPDX line at the top.

Yup, can add.

> 
>  - Is it worth putting the example program in the samples/ directory?  Is
>    it something that would ever make any sense to run in its current form?

Hm, I mean I can write a small binary that illustrates mounting and
allocating binder devices in binderfs.

Thanks!
Christian
