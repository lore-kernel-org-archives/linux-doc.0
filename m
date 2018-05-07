Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A6B87DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 23:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753149AbeEGX5O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 19:57:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50280 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752920AbeEGX5N (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 19:57:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 17465F1207;
        Mon,  7 May 2018 23:57:13 +0000 (UTC)
Received: from llong.remote.csb (ovpn-120-35.rdu2.redhat.com [10.10.120.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5EC53111AF3A;
        Mon,  7 May 2018 23:57:12 +0000 (UTC)
Subject: Re: [PATCH v7 1/4] ipc: IPCMNI limit check for msgmni and shmmni
To:     "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>
References: <1525726752-29281-1-git-send-email-longman@redhat.com>
 <1525726752-29281-2-git-send-email-longman@redhat.com>
 <20180507223910.GW27853@wotan.suse.de>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <edcc0a97-fbec-f511-36d2-fea0e123b4ee@redhat.com>
Date:   Mon, 7 May 2018 19:57:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180507223910.GW27853@wotan.suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Mon, 07 May 2018 23:57:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Mon, 07 May 2018 23:57:13 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/07/2018 06:39 PM, Luis R. Rodriguez wrote:
> On Mon, May 07, 2018 at 04:59:09PM -0400, Waiman Long wrote:
>> A user can write arbitrary integer values to msgmni and shmmni sysctl
>> parameters without getting error, but the actual limit is really
>> IPCMNI (32k). This can mislead users as they think they can get a
>> value that is not real.
>>
>> The right limits are now set for msgmni and shmmni so that the users
>> will become aware if they set a value outside of the acceptable range.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>  ipc/ipc_sysctl.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/ipc/ipc_sysctl.c b/ipc/ipc_sysctl.c
>> index 8ad93c2..f87cb29 100644
>> --- a/ipc/ipc_sysctl.c
>> +++ b/ipc/ipc_sysctl.c
>> @@ -99,6 +99,7 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
>>  static int zero;
>>  static int one = 1;
>>  static int int_max = INT_MAX;
>> +static int ipc_mni = IPCMNI;
>>  
>>  static struct ctl_table ipc_kern_table[] = {
>>  	{
>> @@ -120,7 +121,9 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
>>  		.data		= &init_ipc_ns.shm_ctlmni,
>>  		.maxlen		= sizeof(init_ipc_ns.shm_ctlmni),
>>  		.mode		= 0644,
>> -		.proc_handler	= proc_ipc_dointvec,
>> +		.proc_handler	= proc_ipc_dointvec_minmax,
>> +		.extra1		= &zero,
>> +		.extra2		= &ipc_mni,
>>  	},
>>  	{
>>  		.procname	= "shm_rmid_forced",
>> @@ -147,7 +150,7 @@ static int proc_ipc_auto_msgmni(struct ctl_table *table, int write,
>>  		.mode		= 0644,
>>  		.proc_handler	= proc_ipc_dointvec_minmax,
>>  		.extra1		= &zero,
>> -		.extra2		= &int_max,
>> +		.extra2		= &ipc_mni,
>>  	},
>>  	{
>>  		.procname	= "auto_msgmni",
>> -- 
>> 1.8.3.1
> It seems negative values are not allowed, if true then having
> a caller to use proc_douintvec_minmax() would help with ensuring
> no invalid negative input values are used as well.
>
>   Luis

Negative value doesn't mean sense here. So it is true that we can use
proc_douintvec_minmax() instead. However, the data types themselves are
defined as "int". So I think it is better to keep using
proc_dointvec_minmax() to be consistent with the data type.

Cheers,
Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
