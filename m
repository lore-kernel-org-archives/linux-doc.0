Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D27C636CC
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 13:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjBPNeI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 08:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjBPNeI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 08:34:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185A12BF2B
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676554393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kDxOo4bfzqJtI+IAIUxoUzNCQsLES8Y2nciI7tqhkpk=;
        b=S4PhNuC6dFnfI8mWnEtMPQ1gwwA+I7+m4Egi08AR7XckFCaoxe8rb/MK3rExeWFO6+0F9O
        YYIiuhzlQ+Y75H/nOL89pMQSrffCN+mbshgWbNiMR0a3eQ+51SX9vjQxJNqMHnggKYxhbW
        rB6rTpBrNZ5htKwCh/kPVQCglqzKAgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-lmYvAoRvNzS9R8i5ASnrcg-1; Thu, 16 Feb 2023 08:33:11 -0500
X-MC-Unique: lmYvAoRvNzS9R8i5ASnrcg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE5BB85CBE5;
        Thu, 16 Feb 2023 13:33:10 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (ovpn-193-101.brq.redhat.com [10.40.193.101])
        by smtp.corp.redhat.com (Postfix) with SMTP id 3D48E492B17;
        Thu, 16 Feb 2023 13:33:08 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 16 Feb 2023 14:33:06 +0100 (CET)
Date:   Thu, 16 Feb 2023 14:33:03 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Gregory Price <gregory.price@memverge.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Gregory Price <gourry.memverge@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        avagin@gmail.com, peterz@infradead.org, luto@kernel.org,
        krisman@collabora.com, corbet@lwn.net, shuah@kernel.org
Subject: Re: [PATCH v9 1/1] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
Message-ID: <20230216133303.GB5200@redhat.com>
References: <20230210072503.1808-1-gregory.price@memverge.com>
 <20230210072503.1808-2-gregory.price@memverge.com>
 <871qmttiqa.ffs@tglx>
 <Y+rPH0T5r38+l2gB@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+rPH0T5r38+l2gB@memverge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/13, Gregory Price wrote:
>
> On Mon, Feb 13, 2023 at 09:26:21PM +0100, Thomas Gleixner wrote:
> > On Fri, Feb 10 2023 at 02:25, Gregory Price wrote:
> > > +struct ptrace_sud_config {
> > > +	__u64 mode;
> > > +	__s8 *selector;
> >
> > How is this correct for a 32bit ptracer running on a 64bit kernel? Aside
> > of not wiring up the compat syscall without any argumentation in the
> > changelog.
> >
>
> I'm having a little trouble wrapping my head around what is "right" here
> with regard to compat.  Granted I've never had to deal with compat
> issues, so please excuse the ignorance if this is a trivial issue.

The problem is the sizeof(selector). 4 bytes for 32bit ptracer but the
kernel will write 8 bytes. I think you should make "selector" __u64 too.

Oleg.

