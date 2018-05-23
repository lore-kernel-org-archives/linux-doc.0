Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E1BB7DF8D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 12:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932696AbeEWMA6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 08:00:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59390 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932552AbeEWMA5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 May 2018 08:00:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 512464187E41;
        Wed, 23 May 2018 12:00:57 +0000 (UTC)
Received: from localhost (ovpn-200-23.brq.redhat.com [10.40.200.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BB48410C5636;
        Wed, 23 May 2018 12:00:49 +0000 (UTC)
Date:   Wed, 23 May 2018 14:00:48 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Olsa <jolsa@kernel.org>,
        brouer@redhat.com
Subject: Re: [PATCH 0/3] bpf: add boot parameters for sysctl knobs
Message-ID: <20180523140048.5c5218cc@redhat.com>
In-Reply-To: <20180523113542.GD3888@asgard.redhat.com>
References: <20180521122923.GA15717@asgard.redhat.com>
        <20180521185811.2r6372timh5rfs5n@ast-mbp.dhcp.thefacebook.com>
        <20180523113542.GD3888@asgard.redhat.com>
Followup-To: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 23 May 2018 12:00:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 23 May 2018 12:00:57 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'brouer@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 23 May 2018 13:35:47 +0200
Eugene Syromiatnikov <esyr@redhat.com> wrote:

> On Mon, May 21, 2018 at 11:58:13AM -0700, Alexei Starovoitov wrote:
> > On Mon, May 21, 2018 at 02:29:30PM +0200, Eugene Syromiatnikov wrote:  
> > > Hello.
> > > 
> > > This patch set adds ability to set default values for
> > > kernel.unprivileged_bpf_disable, net.core.bpf_jit_harden,
> > > net.core.bpf_jit_kallsyms sysctl knobs as well as option to override
> > > them via a boot-time kernel parameter.  
> > 
> > Commits log not only should explain 'what' is being done by the patch,
> > but 'why' as well.  
> 
> Some BPF sysctl knobs affect the loading of BPF programs, and during
> system boot/init stages these sysctls are not yet configured. A
> concrete example is systemd, that has implemented loading of BPF
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

Hi Eugene,

You have to resend the entire patchset with this explanation in the
cover-letter.  Your old patchset have been dropped from patchwork[1]
due to being marked with "Changes Requested".

Please remember to give it a "V2" tag and also specify which git tree
you are targeting[2], like [PATCH bpf-next V2].


[1] http://patchwork.ozlabs.org/project/netdev/list/?series=45617&state=%2a

[2] https://github.com/netoptimizer/linux/blob/bpf_doc10/Documentation/bpf/bpf_devel_QA.rst#q-how-do-i-indicate-which-tree-bpf-vs-bpf-next-my-patch-should-be-applied-to
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
