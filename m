Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2D2C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 07:13:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EE84610CB
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 07:13:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhETHPT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 03:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50665 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230102AbhETHPS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 May 2021 03:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621494837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X397uYzu/1SGZ7jXQoaSeO5WeNNNY9/Yz6fG++yQyTE=;
        b=Nv5vMJ1A/WeeNVH6Dm5Ge6YB1iB68ONaWI3zUnJgoj79HgIom6c4EjPWmaaEXEA28KQXr3
        MnvLMacFM4rsPx7wmvmIGdfY6mj5v4g554Hgl/S32B5bLDzuPsBMwiW4E+G8LxL0jaZoGh
        dMXKxHHKokVZzIwWV6aoqjVyZcuKGiQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-d1sK5rY9OzOXUrbhuxa_nQ-1; Thu, 20 May 2021 03:13:53 -0400
X-MC-Unique: d1sK5rY9OzOXUrbhuxa_nQ-1
Received: by mail-ed1-f69.google.com with SMTP id cn20-20020a0564020cb4b029038d0b0e183fso9068636edb.22
        for <linux-doc@vger.kernel.org>; Thu, 20 May 2021 00:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X397uYzu/1SGZ7jXQoaSeO5WeNNNY9/Yz6fG++yQyTE=;
        b=kiPzANZWBmnLAorFSTU9epD0jM2yC77eFkZgahli8JrAtzWe1VHJgSCExzRqSJOhwE
         qg+tBy+6NTUJQ102+ymobtuyUgAg9ygcUEKLhTt4oSucB/Xwns+giR7sgtIYA6TmOnds
         Zgk7t1DtYkuc6M7fzZAsPIoTI6yp2Kawi8Zphd4ZLrDO6F8Tkdt1j1+sAnjKEGS1Cmw9
         ztGVXAlqENA3aIuN2Eevq0dBUH4jQz91c/xcUlSKOkgd4lDGPPYLqD2ZgfwAJlQlVPlO
         buS24ewPJ2OA2lQ3KW8GPuDag+ExP3l6gDvQ0gS8L3PKV5Id+6v/HxvomMC+HtREPPa7
         I2ug==
X-Gm-Message-State: AOAM533tnQCSO75boK+GVRSPbv/xeqG1dVVB3enttkGa4dYOPS9Wi7z3
        W9MTyLyVUFJJ3zsipWktI8aJkMHU525kURmsGK7kSg6az4yf6/yGpMD4UckkBnPK2xywGn93Mhc
        qlXoKR99Yi+PYNTZtorRlnR9m4YgTkGp+7YVh8ikvpuyXCbiVbfaY72bzfont0kHKi+6TME0=
X-Received: by 2002:a17:906:710a:: with SMTP id x10mr3270218ejj.516.1621494832222;
        Thu, 20 May 2021 00:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxibTGTIU5aNfe7e7C+nhhm86RevK1TLm9JeCA0fjdCXTc0xThi0q3SFi5juTDfWbQvOudDdQ==
X-Received: by 2002:a17:906:710a:: with SMTP id x10mr3270183ejj.516.1621494831957;
        Thu, 20 May 2021 00:13:51 -0700 (PDT)
Received: from x1.bristot.me (host-87-19-51-73.retail.telecomitalia.it. [87.19.51.73])
        by smtp.gmail.com with ESMTPSA id qo19sm923768ejb.7.2021.05.20.00.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 00:13:51 -0700 (PDT)
Subject: Re: [RFC PATCH 04/16] rv/include: Add deterministic automata monitor
 definition via C macros
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Gabriele Paoloni <gabriele.paoloni@intel.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1621414942.git.bristot@redhat.com>
 <1e67370a0808714325b434edfe8f84178867af47.1621414942.git.bristot@redhat.com>
 <20210519182739.GG21560@worktop.programming.kicks-ass.net>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <c638d724-c9d8-d640-eb99-8e684e2d594b@redhat.com>
Date:   Thu, 20 May 2021 09:13:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519182739.GG21560@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/19/21 8:27 PM, Peter Zijlstra wrote:
> On Wed, May 19, 2021 at 01:36:25PM +0200, Daniel Bristot de Oliveira wrote:
> 
>> +struct da_monitor {
>> +	char curr_state;
>> +	bool monitoring;
>> +	void *model;
>> +};
>> +
>> +#define MAX_PID		 1024000
> 
>> +/*
>> + * Functions to define, init and get a per-task monitor.
>> + *
>> + * XXX: Make it dynamic? make it part of the task structure?
> 
> Yes !
> 
> I'd start with maybe adding a list_head to da_monitor and embedding a
> single copy into task_struct and link from there. Yes lists suck, but
> how many monitors do you realistically expect to run concurrently?

Good to know I can use the task struct! This will make my life easier. I did it
this way because I started doing the code all "out-of-tree," as modules... but
being in kernel gives such possibilities.

I will try to implement your idea! I do not see many concurrent monitors
running, and as the list search will be linear to the number of active
monitors... it might not even justify any more complex data structure.

Thanks Peter!

-- Daniel

>> + */
>> +#define DECLARE_DA_MON_INIT_PER_TASK(name, type)				\
>> +										\
>> +struct da_monitor da_mon_##name[MAX_PID];					\
> 
> That's ~16M of memory, which seems somewhat silly.
> 
>> +										\
>> +static inline struct da_monitor *da_get_monitor_##name(pid_t pid)		\
>> +{										\
>> +	return &da_mon_##name[pid];						\
>> +}										\
>> +										\
>> +void da_monitor_reset_all_##name(void)						\
>> +{										\
>> +	struct da_monitor *mon = da_mon_##name;					\
>> +	int i;									\
>> +	for (i = 0; i < MAX_PID; i++)						\
>> +		da_monitor_reset_##name(&mon[i]);				\
>> +}										\
>> +										\
>> +static void da_monitor_init_##name(void)					\
>> +{										\
>> +	struct da_monitor *mon = da_mon_##name;					\
>> +	int i;									\
>> +										\
>> +	for (i = 0; i < MAX_PID; i++) {						\
>> +		mon[i].curr_state = model_get_init_state_##name();		\
>> +		mon[i].monitoring = 0;						\
>> +		mon[i].model = model_get_model_##name();			\
>> +	}									\
>> +}										\
> 

