Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD6A27D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 19:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S968146AbeEYToH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 15:44:07 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33188 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968065AbeEYToG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 15:44:06 -0400
Received: by mail-pf0-f194.google.com with SMTP id a20-v6so3045657pfo.0;
        Fri, 25 May 2018 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eEEg4wouaudEzRNiHAgFckPNUFwGYaTrL6nGma6JbX0=;
        b=q9Ta2+yUDUA6gTxU7grW2nHlQXDhdcT2Aigg+a8GqGnASIPNlHC10f5Uukr0Dp7JYL
         NRiSiNaWT+R2NrFm2Yb5HOWqZn5XGpN1/nPkIGFWrA2fGhq1B/I+TQKh7Hc9AGpOd6aM
         TozDG0SX2mBLD9vbUa3W04JwytlnY39MJLc7MHqcRfJ3RyCttid46mcO8C0TQXojh21j
         CI8Ts/GG2VOJWS0xSwnB3peO3TziEo8mJRFvohhsBnKca1YvbwfqJeQwyymjR0OSYzN2
         Oerf0V1Mc1d4m/PnJwdcUbutzZSz56d+rDWUkhL0WXipexSOCavClE55qwqwzQ3Xbvc/
         Ncow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eEEg4wouaudEzRNiHAgFckPNUFwGYaTrL6nGma6JbX0=;
        b=Tvd6wmXVOTLlBv1HwaqVwynamPq263G2/YZAtEmfbwl7YGc4APugVg1Mh8bTcxBclh
         NrnZH+V0yqNsAocRRnZresf3WhERxA29omEyV97AHAEnscP6yF/dP4vfjaIAb2rq2/Rb
         lW1tOO9aAGlDYLAgUS0RNnk43m8gLbId/hCk8SIV7x2JCR+UsU7QDW0UUlGvXljhunPt
         risKRYWAi+TeQNx+lfd+eG/9IvUXubK8d+Z2jv81WBdoPTAViHWDlkzM8lcVA4awgJIp
         RERwCK7QQgsHofxd1NDCzGvMRTFRBH2VlR/LWBQNOw8vA+c2bxSjRCTmuiYwLR5YtyPV
         PDvw==
X-Gm-Message-State: ALKqPwe/BebcGcbZo7/SPaGdfSt6iB3Z5Xc3EMEnVgxyrAi9/NxsIELa
        hj6gukcx5EdsB8Bq+GMsHxQ=
X-Google-Smtp-Source: AB8JxZq1xHdsablrwxQT/97sGyG3Q/qqGFZCVQ7Hm32aHRwpAXzwqo7t/cDLWRCmYGzwj2OaaqzbhQ==
X-Received: by 2002:a62:fc8:: with SMTP id 69-v6mr3901341pfp.14.1527277444692;
        Fri, 25 May 2018 12:44:04 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:a20f])
        by smtp.gmail.com with ESMTPSA id z16-v6sm29596134pge.90.2018.05.25.12.44.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 12:44:03 -0700 (PDT)
Date:   Fri, 25 May 2018 12:44:01 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Olsa <jolsa@kernel.org>
Subject: Re: [PATCH bpf-next v2 0/3] bpf: add boot parameters for sysctl knobs
Message-ID: <20180525194359.qckwj3tnsbufyapz@ast-mbp>
References: <20180523121806.GA27675@asgard.redhat.com>
 <20180523220244.a4u25kapqbjnmpr4@ast-mbp>
 <20180524094108.066d885a@redhat.com>
 <20180524233449.ga664pzexrkzepfv@ast-mbp>
 <20180525165009.GA20952@asgard.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180525165009.GA20952@asgard.redhat.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 25, 2018 at 06:50:09PM +0200, Eugene Syromiatnikov wrote:
> On Thu, May 24, 2018 at 04:34:51PM -0700, Alexei Starovoitov wrote:
> > On Thu, May 24, 2018 at 09:41:08AM +0200, Jesper Dangaard Brouer wrote:
> > > On Wed, 23 May 2018 15:02:45 -0700
> > > Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> > > 
> > > > On Wed, May 23, 2018 at 02:18:19PM +0200, Eugene Syromiatnikov wrote:
> > > > > Some BPF sysctl knobs affect the loading of BPF programs, and during
> > > > > system boot/init stages these sysctls are not yet configured.
> > > > > A concrete example is systemd, that has implemented loading of BPF
> > > > > programs.
> > > > > 
> > > > > Thus, to allow controlling these setting at early boot, this patch set
> > > > > adds the ability to change the default setting of these sysctl knobs
> > > > > as well as option to override them via a boot-time kernel parameter
> > > > > (in order to avoid rebuilding kernel each time a need of changing these
> > > > > defaults arises).
> > > > > 
> > > > > The sysctl knobs in question are kernel.unprivileged_bpf_disable,
> > > > > net.core.bpf_jit_harden, and net.core.bpf_jit_kallsyms.  
> > > > 
> > > > - systemd is root. today it only uses cgroup-bpf progs which require root,
> > > >   so disabling unpriv during boot time makes no difference to systemd.
> > > >   what is the actual reason to present time?
> systemd also runs a lot of code, some of which is unprivileged.

systemd processes sysctl configs first. It's essential for system
security to do so. If you have concerns in how systemd does that
please bring it up with systemd folks.

> > > > - say in the future systemd wants to use so_reuseport+bpf for faster
> > > >   networking. With unpriv disable during boot, it will force systemd
> > > >   to do such networking from root, which will lower its security barrier.
> No, it will force systemd not to use SO_REUSEPORT BPF.

sorry this argument makes no sense to me.

> > > > - bpf_jit_kallsyms sysctl has immediate effect on loaded programs.
> > > >   Flipping it during the boot or right after or any time after
> > > >   is the same thing. Why add such boot flag then?
> Well, that one was for completeness.

Should we convert all sysctls to bootparams for 'completeness' ?

> > > > - jit_harden can be turned on by systemd. so turning it during the boot
> > > >   will make systemd progs to be constant blinded.
> > > >   Constant blinding protects kernel from unprivileged JIT spraying.
> > > >   Are you worried that systemd will attack the kernel with JIT spraying?
> I'm worried that systemd can be exploited for a JIT spraying attack.

I'm afraid we're not on the same page with definition of 'JIT spraying attack'.

> Another thing I'm concerned with is that the generated code is different,
> which introduces additional complication during debugging.

specifically what kind of complication?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
