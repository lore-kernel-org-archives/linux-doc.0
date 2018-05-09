Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7B8A67DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 19:32:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965372AbeEITcE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 15:32:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:32804 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964850AbeEITcD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 May 2018 15:32:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 5019FADDC;
        Wed,  9 May 2018 19:32:01 +0000 (UTC)
Date:   Wed, 9 May 2018 19:32:00 +0000
From:   "Luis R. Rodriguez" <mcgrof@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH v7 1/4] ipc: IPCMNI limit check for msgmni and shmmni
Message-ID: <20180509193200.GU27853@wotan.suse.de>
References: <1525726752-29281-1-git-send-email-longman@redhat.com>
 <1525726752-29281-2-git-send-email-longman@redhat.com>
 <20180507223910.GW27853@wotan.suse.de>
 <edcc0a97-fbec-f511-36d2-fea0e123b4ee@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edcc0a97-fbec-f511-36d2-fea0e123b4ee@redhat.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 07, 2018 at 07:57:12PM -0400, Waiman Long wrote:
> On 05/07/2018 06:39 PM, Luis R. Rodriguez wrote:
> > On Mon, May 07, 2018 at 04:59:09PM -0400, Waiman Long wrote:
> >> A user can write arbitrary integer values to msgmni and shmmni sysctl
> >> parameters without getting error, but the actual limit is really
> >> IPCMNI (32k). This can mislead users as they think they can get a
> >> value that is not real.
> >>
> >> The right limits are now set for msgmni and shmmni so that the users
> >> will become aware if they set a value outside of the acceptable range.
> >>
> >> Signed-off-by: Waiman Long <longman@redhat.com>
> >> ---
> >>  ipc/ipc_sysctl.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
> >> index 8ad93c2..f87cb29 100644
> >> --- a/ipc/ipc_sysctl.c
> >> +++ b/ipc/ipc_sysctl.c
> >> @@ -99,6 +99,7 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
> >>  static int zero;
> >>  static int one = 1;
> >>  static int int_max = INT_MAX;
> >> +static int ipc_mni = IPCMNI;
> >>  
> >>  static struct ctl_table ipc_kern_table[] = {
> >>  	{
> >> @@ -120,7 +121,9 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
> >>  		.data		= &init_ipc_ns.shm_ctlmni,
> >>  		.maxlen		= sizeof(init_ipc_ns.shm_ctlmni),
> >>  		.mode		= 0644,
> >> -		.proc_handler	= proc_ipc_dointvec,
> >> +		.proc_handler	= proc_ipc_dointvec_minmax,
> >> +		.extra1		= &zero,
> >> +		.extra2		= &ipc_mni,
> >>  	},
> >>  	{
> >>  		.procname	= "shm_rmid_forced",
> >> @@ -147,7 +150,7 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
> >>  		.mode		= 0644,
> >>  		.proc_handler	= proc_ipc_dointvec_minmax,
> >>  		.extra1		= &zero,
> >> -		.extra2		= &int_max,
> >> +		.extra2		= &ipc_mni,
> >>  	},
> >>  	{
> >>  		.procname	= "auto_msgmni",
> >> -- 
> >> 1.8.3.1
> > It seems negative values are not allowed, if true then having
> > a caller to use proc_douintvec_minmax() would help with ensuring
> > no invalid negative input values are used as well.
> >
> >   Luis
> 
> Negative value doesn't mean sense here. So it is true that we can use
> proc_douintvec_minmax() instead. However, the data types themselves are
> defined as "int". So I think it is better to keep using
> proc_dointvec_minmax() to be consistent with the data type.

Huh, no... If you *know* the valid values *are* only positive, the right
thing to do is to then *change* the data type. Tons of odd bugs can creep
up because of these stupid things.

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
