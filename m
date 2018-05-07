Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E59F7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 23:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753347AbeEGXRH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 19:17:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:50109 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753171AbeEGXRG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 19:17:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0E69FAF92;
        Mon,  7 May 2018 23:17:04 +0000 (UTC)
Date:   Mon, 7 May 2018 23:17:04 +0000
From:   "Luis R. Rodriguez" <mcgrof@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>, tglx@linutronix.de,
        arnd@arndb.de, Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH v7 3/4] ipc: Allow boot time extension of IPCMNI from 32k
 to 2M
Message-ID: <20180507231704.GX27853@wotan.suse.de>
References: <1525726752-29281-1-git-send-email-longman@redhat.com>
 <1525726752-29281-4-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525726752-29281-4-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 07, 2018 at 04:59:11PM -0400, Waiman Long wrote:
> diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
> index 49f9bf4..d62335f 100644
> --- a/ipc/ipc_sysctl.c
> +++ b/ipc/ipc_sysctl.c
> @@ -120,7 +120,8 @@ static int proc_ipc_sem_dointvec(struct ctl_table *table, int write,
>  static int zero;
>  static int one = 1;
>  static int int_max = INT_MAX;
> -static int ipc_mni = IPCMNI;
> +int ipc_mni __read_mostly = IPCMNI;
> +int ipc_mni_shift __read_mostly = IPCMNI_SHIFT;
>  
>  static struct ctl_table ipc_kern_table[] = {
>  	{

Is use of ipc_mni and ipc_mni_shift a hot path? As per Christoph Lameter,
its use should be reserved for data that is actually used frequently in hot
paths, and typically this was done after performance traces reveal contention
because a neighboring variable was frequently written to [0]. These would also
be tightly packed, to reduce the number of cachelines needed to execute a
critical path, so we should be selective about what variables use it.

Your commit log does not describe why you'd use __read_mostly here. It would
be useful if it did.

[0] https://lkml.kernel.org/r/alpine.DEB.2.11.1504301343190.28879@gentwo.org

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
