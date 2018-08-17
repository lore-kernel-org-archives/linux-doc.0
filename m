Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7E9B17D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 17 Aug 2018 16:53:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbeHQTz0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 17 Aug 2018 15:55:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:50580 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727218AbeHQTz0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 17 Aug 2018 15:55:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 26EF1ADBB;
        Fri, 17 Aug 2018 16:51:19 +0000 (UTC)
Date:   Fri, 17 Aug 2018 09:51:09 -0700
From:   Davidlohr Bueso <dave@stgolabs.net>
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>,
        manfred@colorfullife.com
Subject: Re: [PATCH v8 1/5] ipc: IPCMNI limit check for msgmni and shmmni
Message-ID: <20180817165109.GC32382@linux-r8p5>
References: <1529317698-16575-1-git-send-email-longman@redhat.com>
 <1529317698-16575-2-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1529317698-16575-2-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 Jun 2018, Waiman Long wrote:

>A user can write arbitrary integer values to msgmni and shmmni sysctl
>parameters without getting error, but the actual limit is really
>IPCMNI (32k). This can mislead users as they think they can get a
>value that is not real.
>
>The right limits are now set for msgmni and shmmni so that the users
>will become aware if they set a value outside of the acceptable range.
>
>Signed-off-by: Waiman Long <longman@redhat.com>

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>

>---
> ipc/ipc_sysctl.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
>index 8ad93c2..f87cb29 100644
>--- a/ipc/ipc_sysctl.c
>+++ b/ipc/ipc_sysctl.c
>@@ -99,6 +99,7 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
> static int zero;
> static int one = 1;
> static int int_max = INT_MAX;
>+static int ipc_mni = IPCMNI;
>
> static struct ctl_table ipc_kern_table[] = {
> 	{
>@@ -120,7 +121,9 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
> 		.data		= &init_ipc_ns.shm_ctlmni,
> 		.maxlen		= sizeof(init_ipc_ns.shm_ctlmni),
> 		.mode		= 0644,
>-		.proc_handler	= proc_ipc_dointvec,
>+		.proc_handler	= proc_ipc_dointvec_minmax,
>+		.extra1		= &zero,
>+		.extra2		= &ipc_mni,
> 	},
> 	{
> 		.procname	= "shm_rmid_forced",
>@@ -147,7 +150,7 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
> 		.mode		= 0644,
> 		.proc_handler	= proc_ipc_dointvec_minmax,
> 		.extra1		= &zero,
>-		.extra2		= &int_max,
>+		.extra2		= &ipc_mni,
> 	},
> 	{
> 		.procname	= "auto_msgmni",
>-- 
>1.8.3.1
>
