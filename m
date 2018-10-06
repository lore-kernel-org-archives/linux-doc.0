Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55FF47D088
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Oct 2018 04:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbeJFLmu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 07:42:50 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45247 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbeJFLmu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 07:42:50 -0400
Received: by mail-pf1-f194.google.com with SMTP id u12-v6so2831583pfn.12
        for <linux-doc@vger.kernel.org>; Fri, 05 Oct 2018 21:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=buawwSaE4LVq8zBFZZNwx1NbiRZrm6PBPrDAaPIvISQ=;
        b=qWqMd31gcrcVQjNdxZoiBdKP0HWyFuwo0BIkNPbZ8HjshhBT3PwGuCf05pVfwBUl6b
         1qjMtOLs8ZIaGrn6tRCWkReXdgn3tOPwScftnwXowo8wrg7U1HFGMfcwwUbaxJ0+EhQm
         CE/QsbqS+FOcH3J7NeZsnNzRxmdZ1u70ZaGww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=buawwSaE4LVq8zBFZZNwx1NbiRZrm6PBPrDAaPIvISQ=;
        b=YoURUESg7AMaQGEWf2DyHs3ziTXm/IbbKCRjTI8ZWw63m8P59lQDCitlMaWQ758WZJ
         xL4x5+7qQXYDvn8TqYkxsiWSTu2EjpiFskeZ4rhMtyjMWOD/HiZAvYL+Zbiif23C06QB
         4+YjN3BvEYVrgX79rjeO3RYhYSqHyE6TOI7s8Rblgf/ztVRxy6ytP76wUEqzvIfd2Cjm
         BzMVqldSqHa0i+NU+bo0lP5c/6+FxgmQLYwhdbeykpd5IKp3xLmKxYO6syA0gNrzLywp
         pL+vpr1MREJPKW6I2f0zBt+KLF/5NiDiyVwyJVvZm3HfmevATbuDfl/jS9DuHnRpgxXa
         M4aw==
X-Gm-Message-State: ABuFfohPc6kB4QElmyNY/muSuJoIYp1FHaADkFaNPp9tjn/I9uuHiwuW
        7ny/5sRYmP731BMepfP5l+BJPw==
X-Google-Smtp-Source: ACcGV62ZJ35r8fo61+vj+CBq2/d4qs9WquhX1ssKrRQ7He+pzBe5xgq/yD9lCKUcKVssF5eJhkuCyw==
X-Received: by 2002:a63:d40c:: with SMTP id a12-v6mr12633830pgh.394.1538800860147;
        Fri, 05 Oct 2018 21:41:00 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id b3-v6sm17202258pfc.178.2018.10.05.21.40.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Oct 2018 21:40:58 -0700 (PDT)
Date:   Fri, 5 Oct 2018 21:40:57 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>, pantin@google.com
Subject: Re: [PATCH RFC 0/5] rcu doc updates for whatisRCU and checklist
Message-ID: <20181006044057.GA41279@joelaf.mtv.corp.google.com>
References: <20181005231815.170433-1-joel@joelfernandes.org>
 <20181005234628.GB2548@thunk.org>
 <20181006034540.GM2674@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181006034540.GM2674@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 05, 2018 at 08:45:40PM -0700, Paul E. McKenney wrote:
> On Fri, Oct 05, 2018 at 07:46:28PM -0400, Theodore Y. Ts'o wrote:
> > On Fri, Oct 05, 2018 at 04:18:09PM -0700, Joel Fernandes (Google) wrote:
> > > 
> > > Here are this week's rcu doc updates based on combing through whatisRCU and
> > > checklists. Hopefully you agree with them. I left several old _bh and _sched
> > > API references as is, since I don't think its a good idea to remove them till
> > > the APIs themselves are removed, however I did remove several of them as well
> > > (like in the first patch in this series) since I feel its better to "encourage"
> > > new users not to use the old API.
> > 
> > Hi Joel,
> > 
> > As it so happens, I just recently wrote my first RCU patch[1] (file
> > systems, especially on-disk data structures, generally tend not to be
> > good candidates for RCU semantics).
> > 
> > [1] http://patchwork.ozlabs.org/patch/979779/
> 
> Very cool!
> 
> One question...  In the following hunk:
> 
> ------------------------------------------------------------------------
> 
> @@ -5353,9 +5362,13 @@  static int ext4_remount(struct super_block *sb, int *flags, char *data)
>  #ifdef CONFIG_QUOTA
>  	sbi->s_jquota_fmt = old_opts.s_jquota_fmt;
>  	for (i = 0; i < EXT4_MAXQUOTAS; i++) {
> -		kfree(sbi->s_qf_names[i]);
> -		sbi->s_qf_names[i] = old_opts.s_qf_names[i];

Could you annotate this pointer (sbi->s_qf_names) with __rcu so it can be
checked by sparse for proper usage? Its also point #16 in the checklist.txt
RCU document. I enclosed a diff to do this below.

I also saw a bunch of places in super.c where the pointer isn't accessed from
an rcu read section or rcu_dereference, but it was a quick look so sorry if I
missed something. If its true, then are you planning to convert these to use
rcu_dereference and wrapped by an rcu_read_lock/unlock as well?

> +		to_free[i] = rcu_dereference_protected(sbi->s_qf_names[i],
> +						       &sb->s_umount);

Also should this be the following?
		to_free[i] = rcu_dereference_protected(sbi->s_qf_names[i],
					       lockdep_is_held(&sb->s_umount));

> +		rcu_assign_pointer(sbi->s_qf_names[i], old_opts.s_qf_names[i]);
>  	}
> +	for (i = 0; i < EXT4_MAXQUOTAS; i++)
> +		kfree(to_free[i]);
> +	synchronize_rcu();

I had same concern as Paul here about synchronize_rcu done before the kfree.

thanks,

 - Joel

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 5863fd22e90b..eec1b3090d04 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5083,7 +5083,7 @@ struct ext4_mount_options {
 	u32 s_min_batch_time, s_max_batch_time;
 #ifdef CONFIG_QUOTA
 	int s_jquota_fmt;
-	char *s_qf_names[EXT4_MAXQUOTAS];
+	char __rcu *s_qf_names[EXT4_MAXQUOTAS];
 #endif
 };
 
