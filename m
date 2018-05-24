Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 20A8B7D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 23:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966239AbeEXXez (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 19:34:55 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:38544 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965649AbeEXXey (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 19:34:54 -0400
Received: by mail-pf0-f196.google.com with SMTP id o76-v6so1631080pfi.5;
        Thu, 24 May 2018 16:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3u+UAXW39kUTomzKNkZAYLf7I5dPbH+DW2XY0+4ug24=;
        b=gVAnTOFxm3WSRDgGDyyQqtfbcMb7Ebmcj1WYAoCi3DhIy3qe51bsHzq24W1kCriodM
         Mjr9dAys2R28TYU1uqqeiyGUg9XHFMY3P6I9wO/6FG4YI9ftWECrPkxha5+H5qf9iocW
         NIZ2wTPPft13IhEJ1E9anm7cCTMP3pWo2t/JGbx7cw0myJ/YBi4mXNZEjlrch07JEncP
         uvTIb49RCtdtlTiC7mVAzd3pAFPOy/V0GoaaJDjcISfih7F4TeIcPPi0VKHIYJ8nasCG
         stPqmg7T7UmYFRi2yQs/vVL9bliOI2pG6xnoAo+1P/YxIIlYicqpz53ku6aQWmQdzC/N
         8QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3u+UAXW39kUTomzKNkZAYLf7I5dPbH+DW2XY0+4ug24=;
        b=PzbJZux8FaEKZzQqaFVsTTdrorFG4VI1+irKAO6OFGwOKEmoefzeCq/EmyKCKEVzBK
         guV8EhdJ28JvPUhFnzFgP2G/2xHFzNfxlJx+x0t4Rdo08jpXGGOL7QGdCdnsHNM23N9N
         YgVga5qXChxKjVEbEtxMEFEFSQMMu1/rS5JE5F48Yw1Yr6DLhv4DiL3qUZbwmxODMPou
         R3QJonaV4tTPxUdWSDtPIDa5BhhyoLG65/2LNTrpMyIB5Y+T12gr8V7e0fBz/jiF3zHb
         kcwSr9GUp9M3zUgirDJeTLaBQWP6QSUXL8KHWufOKEoO9M/2r5YOVe3SwQ4WUQlrymCV
         68JA==
X-Gm-Message-State: ALKqPwd4eVt3U6Gdb0AtvyYCRaV6/SlG7Sp4pnbp6GhPWbEEPySJB/Cg
        wGiGWawLoxZfhU1vWR6ijHeMwZgF
X-Google-Smtp-Source: AB8JxZoHTDq9hxxcfqEeHdDrTWRMhPxbGoa9t8zSJDqQjUnoaZPfzulBq+OzagsCcz0ZcDY3uJZ6yw==
X-Received: by 2002:a63:a807:: with SMTP id o7-v6mr33417pgf.83.1527204893725;
        Thu, 24 May 2018 16:34:53 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:18be])
        by smtp.gmail.com with ESMTPSA id f78-v6sm43499964pfk.138.2018.05.24.16.34.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 May 2018 16:34:52 -0700 (PDT)
Date:   Thu, 24 May 2018 16:34:51 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     Eugene Syromiatnikov <esyr@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Olsa <jolsa@kernel.org>
Subject: Re: [PATCH bpf-next v2 0/3] bpf: add boot parameters for sysctl knobs
Message-ID: <20180524233449.ga664pzexrkzepfv@ast-mbp>
References: <20180523121806.GA27675@asgard.redhat.com>
 <20180523220244.a4u25kapqbjnmpr4@ast-mbp>
 <20180524094108.066d885a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180524094108.066d885a@redhat.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 24, 2018 at 09:41:08AM +0200, Jesper Dangaard Brouer wrote:
> On Wed, 23 May 2018 15:02:45 -0700
> Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
> 
> > On Wed, May 23, 2018 at 02:18:19PM +0200, Eugene Syromiatnikov wrote:
> > > Some BPF sysctl knobs affect the loading of BPF programs, and during
> > > system boot/init stages these sysctls are not yet configured.
> > > A concrete example is systemd, that has implemented loading of BPF
> > > programs.
> > > 
> > > Thus, to allow controlling these setting at early boot, this patch set
> > > adds the ability to change the default setting of these sysctl knobs
> > > as well as option to override them via a boot-time kernel parameter
> > > (in order to avoid rebuilding kernel each time a need of changing these
> > > defaults arises).
> > > 
> > > The sysctl knobs in question are kernel.unprivileged_bpf_disable,
> > > net.core.bpf_jit_harden, and net.core.bpf_jit_kallsyms.  
> > 
> > - systemd is root. today it only uses cgroup-bpf progs which require root,
> >   so disabling unpriv during boot time makes no difference to systemd.
> >   what is the actual reason to present time?
> > 
> > - say in the future systemd wants to use so_reuseport+bpf for faster
> >   networking. With unpriv disable during boot, it will force systemd
> >   to do such networking from root, which will lower its security barrier.
> >   How that make sense?
> > 
> > - bpf_jit_kallsyms sysctl has immediate effect on loaded programs.
> >   Flipping it during the boot or right after or any time after
> >   is the same thing. Why add such boot flag then?
> > 
> > - jit_harden can be turned on by systemd. so turning it during the boot
> >   will make systemd progs to be constant blinded.
> >   Constant blinding protects kernel from unprivileged JIT spraying.
> >   Are you worried that systemd will attack the kernel with JIT spraying?
> 
> 
> I think you are missing that, we want the ability to change these
> defaults in-order to avoid depending on /etc/sysctl.conf settings, and
> that the these sysctl.conf setting happen too late.

What does it mean 'happens too late' ?
Too late for what?
sysctl.conf has plenty of system critical knobs like
kernel.perf_event_paranoid, kernel.core_pattern, etc
The behavior of the host is drastically different after sysctl config
is applied.

> For example with jit_harden, there will be a difference between the
> loaded BPF program that got loaded at boot-time with systemd (no
> constant blinding) and when someone reloads that systemd service after
> /etc/sysctl.conf have been evaluated and setting bpf_jit_harden (now
> slower due to constant blinding).   This is inconsistent behavior.

net.core.bpf_jit_harden can be flipped back and forth at run-time,
so bpf progs before and after will be either blinded or not.
I don't see any inconsistency.
In general I think bootparams should be used only for things
like kpti=on/off that cannot be set by sysctl.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
