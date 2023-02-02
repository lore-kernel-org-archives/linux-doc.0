Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF23DC05027
	for <linux-doc@archiver.kernel.org>; Thu,  2 Feb 2023 15:09:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjBBPJu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 10:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjBBPJr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 10:09:47 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1FB88CC8
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 07:09:04 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id cr22so2087460qtb.10
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2E9zn+ToMChqAJjV6ZutpFgHJwReTtRL04XKbEEuVxs=;
        b=D49Pub0oFsmtKDM+i0yPx5so8Ey3zPdGciQUAqRywZib+NU6H7wy/1YeZxnSSJ900T
         4VlJ8WBppvk/tgpBZI2WF/NTs+72iuBZhDamCm8/kkdFDmhX4QVCQRWiosDors4rb9Sg
         TLM5pGFd53nuEIkcDqCPeJ3klihOCtUuW0c+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E9zn+ToMChqAJjV6ZutpFgHJwReTtRL04XKbEEuVxs=;
        b=Jt6CVHHop/AO8ntyL3j0bS8gzGiw3XDr/Fq+VMrA04RKZ5diyuKBKmXFiMJK0/QRop
         4ySVKuheePUYh4HGTV1hJKuH9cKqCvsEuJz1TzYA3FzMyrwN20f1d7PQ1WaSGEbkzqVw
         L48AcHrgTR6mBAkE0LdUxZDfIjNoASwJRksz2EnEISDcx+ddViFRjD5eUda47Ak3Zmp0
         /gEaolEhJ0yR02QQdw9DoY6vMUlv4jRqLIzOjku4w9jbeLL/v0lLBMQnJ1AtqfznG6vF
         IBVffChW80BpLCgIDYgUmb9xZIe7z15aByHsf+KwtyLg4atZyEZVkNkqwxKBl+UGIA35
         0/bw==
X-Gm-Message-State: AO0yUKU86EbhLDSGZ5/m8I98DlU5FaHlICJxBf3/uxEnN3yDmtoBlkV6
        EsyjNnXjuC4oEodno1A8ZDnEAg==
X-Google-Smtp-Source: AK7set8aPKmpgGjXY3zfRDCd5eMrn6Kx/DhIpyqMfqTzahBlYTampPz0k3hZtc5+Tdob1MQmTWPEbA==
X-Received: by 2002:a05:622a:1998:b0:3b8:3a7c:d204 with SMTP id u24-20020a05622a199800b003b83a7cd204mr12152621qtc.58.1675350538326;
        Thu, 02 Feb 2023 07:08:58 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id u15-20020a37ab0f000000b007049f19c736sm1521378qke.7.2023.02.02.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 07:08:57 -0800 (PST)
Date:   Thu, 2 Feb 2023 10:08:56 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
Message-ID: <20230202150856.lchr76nqih3vdul6@nitro.local>
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <1f217c94-b90f-359a-2142-0d3ae5d84fc6@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1f217c94-b90f-359a-2142-0d3ae5d84fc6@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 02, 2023 at 12:15:36PM +0100, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> Then I tried creating a shallow clone like this:
> 
> git clone
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> --depth 1 -b v6.1
> git remote set-branches --add origin master
> git fetch --all --shallow-exclude=v6.1
> git remote add -t linux-6.1.y linux-stable
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> git fetch --all --shallow-exclude=v6.1
> 
> This took only roundabout 2 minutes and downloads & stores ~512 MByte
> data (without checkout).

Can we also include the option of just downloading the tarball, if it's a
released version? That's the fastest and most lightweight option 100% of the
time. :)

> Not totally sure, but the shallow clone somehow feels more appropriate
> for the use case (reminder, there is a "quickly" in the document title),
> even if such a clone is less flexible (e.g. users have to manually add
> stable branches they are interested it; and they need to be careful when
> using git fetch).
> 
> That's why I now strongly consider using the shallow clone method by
> default in v2 of this text. Or does that also create a lot of load on
> the servers? Or are there other strong reason why using a shallow clone
> might be a bad idea for this use case?

As I mentioned elsewhere, this is only a problem when it's done in batch mode
by CI systems. A full clone uses pregenerated pack files and is very cheap,
because it's effectively a sendfile operation. A shallow clone requires
generating a brand new pack, compressing it, and then keeping it around in
memory for the duration of the clone process. Not a big deal when a few humans
here and there do it, but when 50 CI nodes do it all at once, it effectively
becomes a DDoS. :)

-K
