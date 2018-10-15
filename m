Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7720D7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 02:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbeJOKbO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 06:31:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32976 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbeJOKbO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Oct 2018 06:31:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id 78-v6so6517236pfq.0
        for <linux-doc@vger.kernel.org>; Sun, 14 Oct 2018 19:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CfP9bckGZAz9VDsWFkEm+7rjWCsijRJ0HBC+jzrBiDI=;
        b=Pmoy8HpVGV3aorg0pZ8Xg9o7wELAyl7Ts5KdYmWq8olmgzEIdQSh6R2RSjUWssWwQ9
         rZ+Fi3aSsDODiD1/XrLkdGNLknZKyhHXYBgJcCCALMi+u4Uyx0sqKCJ4BsLiJobYM+PW
         nLUiC+x6AZxrql4e/eXgp2z2shTxmgPCHUBSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CfP9bckGZAz9VDsWFkEm+7rjWCsijRJ0HBC+jzrBiDI=;
        b=RjAXGmidwAxl7opN1W0yHyZecDP85SrTH8dVS5iBbDJ+EpbGQPY3xVj7v5O0SuQpp/
         4LRgYX1JGzrewrCeDRyse/SY2SjcSdDNzSZ4dL5ebCljIa7oyyRyCBZHAaoCY+XhdbPM
         8JUA0I3yXCxGyD8thoLuCjtYYciYk+dfMgyFKBVIPosZWMnevV3Rs/tALdcYFl2u4J2X
         c44qX5NVtDj1fQbI6I2hsxktf7kU+uf6grp9Lsefa0UxRwf6DZu8stmiKqz7n7xnXFq7
         +GEMopu6oMe0RFD2eUiA1zAhLwn3zVsj1juBYog0cX3wSL3EPHlMgBJBP6ENXki3/x2z
         9Vbw==
X-Gm-Message-State: ABuFfoiJt9FcS2TgG7rdnux9QdJIIvOcpx4ZjMQrlIgjzgFgOzSHlqUJ
        tY4hUbk9wc5ExtuxHkcWhv2HcA==
X-Google-Smtp-Source: ACcGV62qI5HWbNu6YiaJ63JAr/FAQXuq2ZRMVTqQoMfB58rzSr/QopzvJh1vl6d6yOoOsbL5C0644w==
X-Received: by 2002:a62:384c:: with SMTP id f73-v6mr15756296pfa.242.1539571680364;
        Sun, 14 Oct 2018 19:48:00 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id 6-v6sm10562838pgl.6.2018.10.14.19.47.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Oct 2018 19:47:59 -0700 (PDT)
Date:   Sun, 14 Oct 2018 19:47:58 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RFC] doc: rcu: remove obsolete (non-)requirement about
 disabling preemption
Message-ID: <20181015024758.GA227989@joelaf.mtv.corp.google.com>
References: <20181014212955.95267-1-joel@joelfernandes.org>
 <20181014231731.GN2674@linux.ibm.com>
 <20181015020827.GA217384@joelaf.mtv.corp.google.com>
 <20181015021349.GB217384@joelaf.mtv.corp.google.com>
 <20181015023328.GP2674@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181015023328.GP2674@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 14, 2018 at 07:33:28PM -0700, Paul E. McKenney wrote:
> On Sun, Oct 14, 2018 at 07:13:49PM -0700, Joel Fernandes wrote:
> > On Sun, Oct 14, 2018 at 07:08:27PM -0700, Joel Fernandes wrote:
> > > On Sun, Oct 14, 2018 at 04:17:31PM -0700, Paul E. McKenney wrote:
> > > > On Sun, Oct 14, 2018 at 02:29:55PM -0700, Joel Fernandes (Google) wrote:
> > > > > The Requirements.html document says "Disabling Preemption Does Not Block
> > > > > Grace Periods". However this is no longer true with the RCU
> > > > > consolidation. Lets remove the obsolete (non-)requirement entirely.
> > > > > 
> > > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > 
> > > > Good catch, queued, thank you!
> > > 
> > > Thanks! By the way after I sent the patch, I also tried Oleg's experiment to
> > > confirm that this is indeed obsolete.  :)
> > > 
> > > One thing interesting came up when I tried synchronize_rcu_expedited()
> > > instead of synchronize_rcu() in Oleg's experiment, I still saw a multiple
> > > millisecond delay between when the rcu read section completely and the
> > > synchronize_rcu_expedited returns:
> > > 
> > > For example, with synchronize_rcu_expedited, the 'SPIN done' and the 'SYNC
> > > done' are about 3 millisecond apart:
> > > [   77.599142] SPIN start
> > > [   77.601595] SYNC start
> > > [   82.604950] SPIN done!
> > > [   82.607836] SYNC done!
> > >  I saw anywhere from 2-6 milliseconds.
> > > 
> > > The reason I bring this up is according to Requirements.html: In some cases,
> > > the multi-millisecond synchronize_rcu() latencies are unacceptable. In these
> > > cases, synchronize_rcu_expedited() may be used instead,.. so either I messed
> > > something up in the experiment, or I need to update this part of the document ;-)
> 
> In normal testing, 2-6 milliseconds is indeed excessive.  Could you please
> point me at Oleg's experiment?  Also, what CONFIG_PREEMPT setting were
> you using?  (My guess is CONFIG_PREEMPT=y.)

The CONFIG_PREEMPT config I am using is CONFIG_PREEMPT=y.

> > So I realized I'm running in Qemu so it could also be a scheduling delay of
> > the vcpu thread. So apologies about the noise if the experiment works fine
> > for you.
> 
> I used rcuperf, which might not be doing the same thing as Oleg's
> experiment.

The experiment is mentioned at:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg912055.html

If you apply the below diff, it applies cleanly on rcu/dev. And then run:
taskset 2 perl -e 'syscall 157, 666, 5000' &
taskset 1 perl -e 'syscall 157, 777'

diff --git a/kernel/sys.c b/kernel/sys.c
index cf5c67533ff1..b654b7566ca3 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2261,6 +2261,9 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
 	return -EINVAL;
 }
 
+#include <linux/delay.h>
+
+
 SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		unsigned long, arg4, unsigned long, arg5)
 {
@@ -2274,6 +2277,19 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 
 	error = 0;
 	switch (option) {
+	case 666:
+		preempt_disable();
+		pr_crit("SPIN start\n");
+		while (arg2--)
+			mdelay(1);
+		pr_crit("SPIN done!\n");
+		preempt_enable();
+		break;
+	case 777:
+		pr_crit("SYNC start\n");
+		synchronize_rcu();
+		pr_crit("SYNC done!\n");
+		break;
 	case PR_SET_PDEATHSIG:
 		if (!valid_signal(arg2)) {
 			error = -EINVAL;
