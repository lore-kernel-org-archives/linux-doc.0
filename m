Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3E1ECAAA1
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 22:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiIFWW4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 18:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiIFWWz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 18:22:55 -0400
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19393A74D8;
        Tue,  6 Sep 2022 15:22:54 -0700 (PDT)
Received: from in01.mta.xmission.com ([166.70.13.51]:44186)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1oVgy1-003QV3-Fj; Tue, 06 Sep 2022 16:22:49 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:36510 helo=email.froward.int.ebiederm.org.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1oVgy0-0059LQ-Ho; Tue, 06 Sep 2022 16:22:49 -0600
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     Oleksandr Natalenko <oleksandr@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Huang Ying <ying.huang@intel.com>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Will Deacon <will@kernel.org>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Stephen Kitt <steve@sk2.org>, Rob Herring <robh@kernel.org>,
        Joel Savitz <jsavitz@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Xiaoming Ni <nixiaoming@huawei.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Renaud =?utf-8?Q?M=C3=A9trich?= <rmetrich@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Grzegorz Halat <ghalat@redhat.com>, Qi Guo <qguo@redhat.com>
References: <20220903064330.20772-1-oleksandr@redhat.com>
Date:   Tue, 06 Sep 2022 17:22:42 -0500
In-Reply-To: <20220903064330.20772-1-oleksandr@redhat.com> (Oleksandr
        Natalenko's message of "Sat, 3 Sep 2022 08:43:30 +0200")
Message-ID: <87r10ob0st.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-XM-SPF: eid=1oVgy0-0059LQ-Ho;;;mid=<87r10ob0st.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.110.29.46;;;frm=ebiederm@xmission.com;;;spf=softfail
X-XM-AID: U2FsdGVkX183ktpcDsO2i5qxSMubB4C4aoJTeBSr4uo=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH] core_pattern: add CPU specifier
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Oleksandr Natalenko <oleksandr@redhat.com> writes:

> Statistically, in a large deployment regular segfaults may indicate a CPU issue.
>
> Currently, it is not possible to find out what CPU the segfault happened on.
> There are at least two attempts to improve segfault logging with this regard,
> but they do not help in case the logs rotate.
>
> Hence, lets make sure it is possible to permanently record a CPU
> the task ran on using a new core_pattern specifier.

I am puzzled why make it part of the file name, and not part of the
core file?  Say an elf note?

The big advantage is that you could always capture the cpu and
will not need to take special care configuring your system to
capture that information.

Eric

> Suggested-by: Renaud Métrich <rmetrich@redhat.com>
> Signed-off-by: Oleksandr Natalenko <oleksandr@redhat.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 1 +
>  fs/coredump.c                               | 5 +++++
>  include/linux/coredump.h                    | 1 +
>  3 files changed, 7 insertions(+)
>
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 835c8844bba48..b566fff04946b 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -169,6 +169,7 @@ core_pattern
>  	%f      	executable filename
>  	%E		executable path
>  	%c		maximum size of core file by resource limit RLIMIT_CORE
> +	%C		CPU the task ran on
>  	%<OTHER>	both are dropped
>  	========	==========================================
>  
> diff --git a/fs/coredump.c b/fs/coredump.c
> index a8661874ac5b6..166d1f84a9b17 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -325,6 +325,10 @@ static int format_corename(struct core_name *cn, struct coredump_params *cprm,
>  				err = cn_printf(cn, "%lu",
>  					      rlimit(RLIMIT_CORE));
>  				break;
> +			/* CPU the task ran on */
> +			case 'C':
> +				err = cn_printf(cn, "%d", cprm->cpu);
> +				break;
>  			default:
>  				break;
>  			}
> @@ -535,6 +539,7 @@ void do_coredump(const kernel_siginfo_t *siginfo)
>  		 */
>  		.mm_flags = mm->flags,
>  		.vma_meta = NULL,
> +		.cpu = raw_smp_processor_id(),
>  	};
>  
>  	audit_core_dumps(siginfo->si_signo);
> diff --git a/include/linux/coredump.h b/include/linux/coredump.h
> index 08a1d3e7e46d0..191dcf5af6cb9 100644
> --- a/include/linux/coredump.h
> +++ b/include/linux/coredump.h
> @@ -22,6 +22,7 @@ struct coredump_params {
>  	struct file *file;
>  	unsigned long limit;
>  	unsigned long mm_flags;
> +	int cpu;
>  	loff_t written;
>  	loff_t pos;
>  	loff_t to_skip;
