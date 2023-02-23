Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298DDC636D7
	for <linux-doc@archiver.kernel.org>; Thu, 23 Feb 2023 18:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjBWSjC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Feb 2023 13:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBWSjB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Feb 2023 13:39:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA3528877
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 10:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677177494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DLzkYWlqDfHO1zvCfSXGiM4cVbbzITU5Ng0iiPPY5/U=;
        b=W2fwHtT+P5wFaxbL5ftlYdtfRP0wlV7P79NxAAxW2sR7XUvZ1BgJKFbYBZ0PqdSbuZnGtF
        c84ZYuok80bN883FDWL5TuMDe2wVdxMtAFLxpE7R2mYy+D2kwV03d/Los5bh/MhVHmbw0L
        g/mIDLp8/19nx6DGE3mQqMkEoQhb23c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-CUN6l3LlNvmpVV9oob4o8Q-1; Thu, 23 Feb 2023 13:38:08 -0500
X-MC-Unique: CUN6l3LlNvmpVV9oob4o8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E1D719711D0;
        Thu, 23 Feb 2023 18:38:05 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.239])
        by smtp.corp.redhat.com (Postfix) with SMTP id F2C2A404BEC6;
        Thu, 23 Feb 2023 18:38:02 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 23 Feb 2023 19:38:00 +0100 (CET)
Date:   Thu, 23 Feb 2023 19:37:56 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Gregory Price <gregory.price@memverge.com>
Cc:     Gregory Price <gourry.memverge@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        avagin@gmail.com, peterz@infradead.org, luto@kernel.org,
        krisman@collabora.com, tglx@linutronix.de, corbet@lwn.net,
        shuah@kernel.org
Subject: Re: [PATCH v11 2/2] ptrace,syscall_user_dispatch: checkpoint/restore
 support for SUD
Message-ID: <20230223183756.GB26182@redhat.com>
References: <20230221201740.2236-1-gregory.price@memverge.com>
 <20230221201740.2236-3-gregory.price@memverge.com>
 <20230222124834.GA15591@redhat.com>
 <Y/YzloHpiyOSvZfK@memverge.com>
 <20230223123020.GA26182@redhat.com>
 <Y/eG4oHc2jz6uSfi@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/eG4oHc2jz6uSfi@memverge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/23, Gregory Price wrote:
>
> On Thu, Feb 23, 2023 at 01:30:20PM +0100, Oleg Nesterov wrote:
> >
> > Well, if this is the only reason then this check and the "size" argument
> > ahould be removed, imo.
> >
> > But perhaps it can be useful for future extensions, I dunno.
> >
> > Oleg.
> >
>
> I suppose yes it could also be used to detect differences in versioning
> if the struct changes in the future, and that would not require an API
> change in the future to support it.

Yes this is what I tried to say. So I won't argue.

Oleg.

