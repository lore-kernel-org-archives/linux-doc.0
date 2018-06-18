Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4C8F07D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 19:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936135AbeFRTS2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 15:18:28 -0400
Received: from mail-pg0-f54.google.com ([74.125.83.54]:45769 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936049AbeFRTS1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jun 2018 15:18:27 -0400
Received: by mail-pg0-f54.google.com with SMTP id z1-v6so7956296pgv.12
        for <linux-doc@vger.kernel.org>; Mon, 18 Jun 2018 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MEGMrQazpc74n9IOCwqfsLFkAPFgwcCj8Cly9S0nyAg=;
        b=rbKxbSnK4IeHQv2k+AxOWGSXMqe6aBfM4rkVB5ekWOTvnKeX09NREr3g2cLTJOBmCt
         6L5bjoOmkv2ZfSfJvO46xLcG4gk/h5AhMfMGmdjZyrhda77AgTJtUkgvQnwgOYlhqGI6
         B1ArjTufq3nWWQGSfwAmUfDcKFLi20VFkvBksDdPRIOrSrkA/Fs2inc6mxPz/ffE9AmT
         xJJtCSo4t/F/UCOyYjRzN0p3Klw5VUyS5m/x+cR0iJSnGJ1kTMSp0m/pvWWkC+h2V0P3
         mGRWOMoz2szqnwiJexY7MWrKfPLJvirLTN5KUWQI5sprTssD7vpHXVyW+D4Pw7AmN4Lh
         nRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MEGMrQazpc74n9IOCwqfsLFkAPFgwcCj8Cly9S0nyAg=;
        b=DZqV022pfki18Gsy6JVmUOZs7nbNHT0ysBb5P4TbJoETC6zz2EbwPYLAZrc5lvaKrK
         BGzHK0S+VAO1+NWHM4i89efxzCT5gFc/+tizWEg/UB5CTRZ1VdHL/Yiit/vBCKS+Tc//
         6Vh+mPHCu/wHZcBlKdEpV+QpCkU1Cc1c+8MX5q1RnHMJO88XSm+xSbSUSd580569UXul
         VW+QWPKqNWgBe4NPlp9lapGSWdc7JR1DGRvx7i2SA6G5/w5vOc47q51m7+Hvp5+EAJqz
         AkGkcuYzcX20CDtvrypCGrcoUYG4VZ4bltgpe54XI7G/pDcX9If71wgOXXzi7UBrnVKv
         wBpw==
X-Gm-Message-State: APt69E2SDuV6266HdOEcqikAJxd7a7pmbRd7qoyvb/U9rqH+bx1cDvNd
        4IHD/E6n1SXw+sYpmm7NicpRr5wj3ZI=
X-Google-Smtp-Source: ADUXVKKMzPrA+geJ1FpIDL3maIgeT4e9ICf3M+FxOTQjSbt29oUBZUhU2pFQjpDDwCn92CDzr6Q5yg==
X-Received: by 2002:a62:3c15:: with SMTP id j21-v6mr14869275pfa.7.1529349506916;
        Mon, 18 Jun 2018 12:18:26 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:0:1000:1611:6077:8eec:bc7e:d0f4])
        by smtp.googlemail.com with ESMTPSA id x8-v6sm32820302pfa.87.2018.06.18.12.18.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jun 2018 12:18:26 -0700 (PDT)
Subject: Re: overlayfs: caller_credentials option bypass creator_cred
To:     Vivek Goyal <vgoyal@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-unionfs@vger.kernel.org, linux-doc@vger.kernel.org
References: <20180618154222.19279-1-salyzyn@android.com>
 <20180618185448.GA8749@redhat.com>
From:   Mark Salyzyn <salyzyn@android.com>
Message-ID: <f141f883-0dbd-10ea-83b9-a1b38119b0c5@android.com>
Date:   Mon, 18 Jun 2018 12:18:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180618185448.GA8749@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/18/2018 11:54 AM, Vivek Goyal wrote:
> On Mon, Jun 18, 2018 at 08:42:15AM -0700, Mark Salyzyn wrote:
>> All accesses to the lower filesystems reference the creator (mount)
>> and not the source context.  This is a security issue.
> Can you elaborate with an example that how this is a security issue.
> mounter's check is in addition to caller's check. So we have two
> checks in ovl_permission(). overlay inode gets the credentials from
> underlying inode and we first check if caller is allowed to the
> operation and if that's allowed, then we check if mounter is allowed
> to do the operation.
init which does the mount and represents the creator_cred which is 
granted a restricted MAC to do just what it needs to do, eg mount, but 
not be able to access the files. The caller comes in and is rejected 
because init domain is not allowed, even though the caller's domain is. 
MAC does not require overlap in privileges between the creator and the user.

-- Mark
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
