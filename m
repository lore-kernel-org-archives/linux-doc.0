Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA6FC761AF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Mar 2023 16:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjC2QSV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Mar 2023 12:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjC2QSU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Mar 2023 12:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3AC5B92
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680106627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9PZc/wL1SaOvzMH0Hm9CmGIiBNNws8MikE2aRTtEWQ4=;
        b=UgV6hCF1cOaKlBVeeu/5G14Y0hglfhAnmUUzhARACj3g9qYVYaL43m3jQtSm2sQ8Zcxo7X
        RdyJEeDtfGc0zp6FUyJ5SUA08BScOzPHftSDiZfybxMyYRiINYsyxee91dwZVO09c+r2p0
        sghoNZkzI9xvZgOHa8PbcS6HUMECEe4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-m06UBDt5NEeHbLQfow7d0g-1; Wed, 29 Mar 2023 12:03:36 -0400
X-MC-Unique: m06UBDt5NEeHbLQfow7d0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EBAE8030D3;
        Wed, 29 Mar 2023 16:03:35 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.161])
        by smtp.corp.redhat.com (Postfix) with SMTP id 82BCEC15BA0;
        Wed, 29 Mar 2023 16:03:31 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 29 Mar 2023 18:03:27 +0200 (CEST)
Date:   Wed, 29 Mar 2023 18:03:23 +0200
From:   Oleg Nesterov <oleg@redhat.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Gregory Price <gourry.memverge@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linux-Arch <linux-arch@vger.kernel.org>, avagin@gmail.com,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>, krisman@collabora.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, shuah <shuah@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, tongtiangen@huawei.com,
        Robin Murphy <robin.murphy@arm.com>,
        Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v14 1/4] asm-generic,arm64: create task variant of
 access_ok
Message-ID: <20230329160322.GA4477@redhat.com>
References: <20230328164811.2451-1-gregory.price@memverge.com>
 <20230328164811.2451-2-gregory.price@memverge.com>
 <20230329151515.GA913@redhat.com>
 <9a456346-e207-44e1-873e-40d21334e01b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a456346-e207-44e1-873e-40d21334e01b@app.fastmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/29, Arnd Bergmann wrote:
>
> On Wed, Mar 29, 2023, at 17:15, Oleg Nesterov wrote:
> >
> > This look as if access_ok() or __access_ok() doesn't depend on task, but
> > this is not true in general. Say, TASK_SIZE_MAX can check is_32bit_task()
> > test_thread_flag(TIF_32BIT...) and this uses "current".
> >
> > Again, we probably do not care, but I don't like the fact task_access_ok()
> > looks as if task_access_ok(task) returns the same result as "task" calling
> > access_ok().
>
> I think the idea of TASK_SIZE_MAX is that it is a compile-time constant and in fact independent of current, while TASK_SIZE
> takes TIF_32BIT into account.

Say, arch/loongarch defines TASK_SIZE which depends on test_thread_flag(TIF_32BIT_ADDR)
but it doesn't define TASK_SIZE_MAX, so __access_ok() will use TASK_SIZE.

Oleg.

