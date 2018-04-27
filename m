Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 65FA07DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 09:49:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757805AbeD0JtS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 05:49:18 -0400
Received: from mail-pg0-f67.google.com ([74.125.83.67]:41972 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757353AbeD0JtR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 05:49:17 -0400
Received: by mail-pg0-f67.google.com with SMTP id m21-v6so1168354pgv.8
        for <linux-doc@vger.kernel.org>; Fri, 27 Apr 2018 02:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fGMPJXMGnQAeLhPI2NgbT6R5rRhgPpDyQfB9U6Jxtw0=;
        b=h33XKY7zk4Pg7YxBAZczArpdqk5mvwI1xPbl18pGxfGDn3cMDeC+xKzjLIMljgY2La
         bVkuS1Ny0slr6GdBfkBIXw3DKvasTlqNMRAs8YRalpF1k67AOyklVNv16NNnJJT5ynXR
         cKWTOePA7il0j3ha5//wtcAZMSvjUk+X+wFuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fGMPJXMGnQAeLhPI2NgbT6R5rRhgPpDyQfB9U6Jxtw0=;
        b=Uu0Mz7s2n1co8i0L2gv1mAK5t0ZRwcaLfGlIM9GgZjwKqP8r14lC72LvssN9xqqNyU
         O7P4d1O1o/QrLYGEsmgn/9luonvNpsion2CHeIJZu7kT/INhcLuHbLsdjiDJ+iIHErj4
         /ROYIOORTcYvsH9NIiZu14Nz9W5zaa4TdEVo9IHKVI6j3J/5tdJY7pNsJVBxT+mvDGtv
         6BN0lOWh1xNpIU/cbOAplfp1/DYEzh5fukbuxUqoJ+6DCHc0BOwq4IYcULThgMk747PG
         aYUCLHCIXssn/LigDXXdhkgOdX182ONo/vfxQNubQZK/ZMeo5i9nbjWIg1RFcFRSblXX
         hpEg==
X-Gm-Message-State: ALQs6tBa5eMvJjfzl7wyqYdk68cQkAWMi5MgLXf/5bkCImMlsQKIpTN/
        NSu7oGXmkbwZed+oCzcOOamCpg==
X-Google-Smtp-Source: AB8JxZpk1GLAZ04HIGGjlsqCj/AyA/mAWFRtrpU3yX11sOYmRvADo5xvhBCALXTAmXXpyLU/5PZt+A==
X-Received: by 2002:a17:902:6549:: with SMTP id d9-v6mr1680271pln.196.1524822556961;
        Fri, 27 Apr 2018 02:49:16 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li1168-94.members.linode.com. [45.79.69.94])
        by smtp.gmail.com with ESMTPSA id f22sm2948723pff.146.2018.04.27.02.49.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Apr 2018 02:49:15 -0700 (PDT)
Date:   Fri, 27 Apr 2018 17:49:10 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf, doc: Update bpf_jit_enable limitation for
 CONFIG_BPF_JIT_ALWAYS_ON
Message-ID: <20180427094910.GA31015@leoy-ThinkPad-X240s>
References: <1524709611-29437-1-git-send-email-leo.yan@linaro.org>
 <275e03a2-b74e-8f60-4ffe-26c9a79fae9d@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <275e03a2-b74e-8f60-4ffe-26c9a79fae9d@iogearbox.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 27, 2018 at 11:44:44AM +0200, Daniel Borkmann wrote:
> On 04/26/2018 04:26 AM, Leo Yan wrote:
> > When CONFIG_BPF_JIT_ALWAYS_ON is enabled, kernel has limitation for
> > bpf_jit_enable, so it has fixed value 1 and we cannot set it to 2
> > for JIT opcode dumping; this patch is to update the doc for it.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  Documentation/networking/filter.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/networking/filter.txt b/Documentation/networking/filter.txt
> > index fd55c7d..feddab9 100644
> > --- a/Documentation/networking/filter.txt
> > +++ b/Documentation/networking/filter.txt
> > @@ -483,6 +483,12 @@ Example output from dmesg:
> >  [ 3389.935851] JIT code: 00000030: 00 e8 28 94 ff e0 83 f8 01 75 07 b8 ff ff 00 00
> >  [ 3389.935852] JIT code: 00000040: eb 02 31 c0 c9 c3
> >  
> > +When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is set to 1 by default
> > +and it returns failure if change to any other value from proc node; this is
> > +for security consideration to avoid leaking info to unprivileged users. In this
> > +case, we can't directly dump JIT opcode image from kernel log, alternatively we
> > +need to use bpf tool for the dumping.
> > +
> 
> Could you change this doc text a bit, I think it's slightly misleading. From the first
> sentence one could also interpret that value 0 would leaking info to unprivileged users
> whereas here we're only talking about the case of value 2. Maybe something roughly like
> this to make it more clear:
> 
>   When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is permanently set to 1 and
>   setting any other value than that will return in failure. This is even the case for
>   setting bpf_jit_enable to 2, since dumping the final JIT image into the kernel log
>   is discouraged and introspection through bpftool (under tools/bpf/bpftool/) is the
>   generally recommended approach instead.

Yeah, your rephrasing is more clear and better.  Will do this and send
new patch soon.  Thanks for your helping.

> Thanks,
> Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
