Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B0F5B7DE59
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Sep 2018 16:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbeIZWtS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 26 Sep 2018 18:49:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:34506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728241AbeIZWtR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Sep 2018 18:49:17 -0400
Received: from vmware.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 438562147D;
        Wed, 26 Sep 2018 16:35:28 +0000 (UTC)
Date:   Wed, 26 Sep 2018 12:35:22 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Abderrahmane Benbachir <abderrahmane.benbachir@polymtl.ca>,
        linux-security-module@vger.kernel.org,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH security-next v3 04/29] LSM: Remove initcall tracing
Message-ID: <20180926123522.4080d9eb@vmware.local.home>
In-Reply-To: <20180925001832.18322-5-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
        <20180925001832.18322-5-keescook@chromium.org>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 24 Sep 2018 17:18:07 -0700
Kees Cook <keescook@chromium.org> wrote:

> This partially reverts commit 58eacfffc417 ("init, tracing: instrument
> security and console initcall trace events") since security init calls
> are about to no longer resemble regular init calls.

I'm not against the change, but how much are they going to "no longer
resemble regular init calls"?

-- Steve

> 
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: Abderrahmane Benbachir <abderrahmane.benbachir@polymtl.ca>
> Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Cc: linux-security-module@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  security/security.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/security/security.c b/security/security.c
> index 892fe6b691cf..41a5da2c7faf 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -30,8 +30,6 @@
>  #include <linux/string.h>
>  #include <net/flow.h>
>  
> -#include <trace/events/initcall.h>
> -
>  #define MAX_LSM_EVM_XATTR	2
>  
>  /* Maximum number of letters for an LSM name string */
> @@ -47,17 +45,13 @@ static __initdata char chosen_lsm[SECURITY_NAME_MAX + 1] =
>  
>  static void __init do_security_initcalls(void)
>  {
> -	int ret;
>  	initcall_t call;
>  	initcall_entry_t *ce;
>  
>  	ce = __start_lsm_info;
> -	trace_initcall_level("security");
>  	while (ce < __end_lsm_info) {
>  		call = initcall_from_entry(ce);
> -		trace_initcall_start(call);
> -		ret = call();
> -		trace_initcall_finish(call, ret);
> +		call();
>  		ce++;
>  	}
>  }

