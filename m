Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 802F17D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 22:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933975AbeEWWCv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 18:02:51 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:38773 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933791AbeEWWCt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 18:02:49 -0400
Received: by mail-pf0-f196.google.com with SMTP id o76-v6so11154296pfi.5;
        Wed, 23 May 2018 15:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SxR00VCGCXMsKzi6yyIgx/zN3SRISeTuqJ6hiYaIuJU=;
        b=Zw1vXZyyOiEkbhiUWU8rtqaZMQzNc050cPFyWpapEQ8eugMtstWvfoiaptAesQf3QJ
         mlU11Xp/BCsz+XzyWYVCq7tQJJ7a8ekfxBZmugsaTjFXyttK71W4PHyUPRwLl01/dLkq
         bkayYG5RCLChUo3/E60lzb5SIqxzSUMjTxZ9+Dg9I/+WNRLQtR9R7FatWEuBgGeYj/Es
         D/iW1JiLjHQb7Oy/8M+EEcJrKW++UxbjMV62xSDbzy4VDUomKfoDXluhv3kRInVh+V1d
         4EE9sCLq/JAXFmmdRbw1omX5hzGEhha/Gnd4XPrsMEWCe6Yr9VU0hy8XG/CQ6ApiHPzD
         RGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SxR00VCGCXMsKzi6yyIgx/zN3SRISeTuqJ6hiYaIuJU=;
        b=tf4koKstpHihqPA27tSZ+2JM7THJ7TWuWcDga8coUnVAzG3/XZ5jUZDEXqthpRncHd
         FNOk76pblw/WqE+rOszzVixDfKz9oqnw9GK+EMZLyfZFHj6ipWsuaSsF89XOIacYnd5b
         QfBWvw6AjljI/EbhdZRBHaWn0BtGHXQkacyLHpSNN26O73AaSt9gkL976fywhr4lYXKw
         O54N1Rg7nQn4W8PpdHhKmyrID3B7RT/6gCBCkishwn/2Bnno0rGMTIJ8m2DS929l5YTE
         EwEMyeb5yumRbEmYdfrFCM9HU+JEUMUZthem2sWJRxVv73doGqJhJszFf+4w1pkxzav5
         OUUg==
X-Gm-Message-State: ALKqPwdQO73joEF6hNifkTb3zyjG+37lKLuN1xeF/Z6lBtsf/4GBX+Wu
        XkO+yK9W57sKJrkBxRbR4aw=
X-Google-Smtp-Source: AB8JxZrhje+BAN3CcIlkY5olfp3P1TCIyya/K6wqvaAbR23YqhQ0LJ9UQLGx/PIAJzeU1UGqVT5eew==
X-Received: by 2002:a65:550d:: with SMTP id f13-v6mr3644731pgr.324.1527112968819;
        Wed, 23 May 2018 15:02:48 -0700 (PDT)
Received: from ast-mbp ([2620:10d:c090:180::1:19c8])
        by smtp.gmail.com with ESMTPSA id b5-v6sm26663209pgc.16.2018.05.23.15.02.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 May 2018 15:02:47 -0700 (PDT)
Date:   Wed, 23 May 2018 15:02:45 -0700
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Olsa <jolsa@kernel.org>,
        Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH bpf-next v2 0/3] bpf: add boot parameters for sysctl knobs
Message-ID: <20180523220244.a4u25kapqbjnmpr4@ast-mbp>
References: <20180523121806.GA27675@asgard.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180523121806.GA27675@asgard.redhat.com>
User-Agent: NeoMutt/20180223
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 23, 2018 at 02:18:19PM +0200, Eugene Syromiatnikov wrote:
> Some BPF sysctl knobs affect the loading of BPF programs, and during
> system boot/init stages these sysctls are not yet configured.
> A concrete example is systemd, that has implemented loading of BPF
> programs.
> 
> Thus, to allow controlling these setting at early boot, this patch set
> adds the ability to change the default setting of these sysctl knobs
> as well as option to override them via a boot-time kernel parameter
> (in order to avoid rebuilding kernel each time a need of changing these
> defaults arises).
> 
> The sysctl knobs in question are kernel.unprivileged_bpf_disable,
> net.core.bpf_jit_harden, and net.core.bpf_jit_kallsyms.

- systemd is root. today it only uses cgroup-bpf progs which require root,
  so disabling unpriv during boot time makes no difference to systemd.
  what is the actual reason to present time?

- say in the future systemd wants to use so_reuseport+bpf for faster
  networking. With unpriv disable during boot, it will force systemd
  to do such networking from root, which will lower its security barrier.
  How that make sense?

- bpf_jit_kallsyms sysctl has immediate effect on loaded programs.
  Flipping it during the boot or right after or any time after
  is the same thing. Why add such boot flag then?

- jit_harden can be turned on by systemd. so turning it during the boot
  will make systemd progs to be constant blinded.
  Constant blinding protects kernel from unprivileged JIT spraying.
  Are you worried that systemd will attack the kernel with JIT spraying?

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
