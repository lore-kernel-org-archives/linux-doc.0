Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCD4C61DA4
	for <linux-doc@archiver.kernel.org>; Mon,  6 Mar 2023 18:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjCFSGY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Mar 2023 13:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjCFSGX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Mar 2023 13:06:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B276C680
        for <linux-doc@vger.kernel.org>; Mon,  6 Mar 2023 10:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678125877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9r7yYUGNp08gKey/MpvPgw7RYMR3EobdhJmthIcjZSY=;
        b=OCSy4EQyV+R3dPZRzXJcZTzSdu6EiIcC49JLcgW3ahYsvVB5xEdQWepv49p+pjuWHCS4nc
        DsaLi703IFhAAtZn+dKsLr+2JzVPG3B53jdvototSfx2+K1nqoOMwlqTJJ4y5oOrIBmM2K
        XcbIH1fT5/pp5281SwSi8ERKqv1PR5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-ToDghNTgND-5JprmBG1tFQ-1; Mon, 06 Mar 2023 13:04:35 -0500
X-MC-Unique: ToDghNTgND-5JprmBG1tFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04C811802D44;
        Mon,  6 Mar 2023 18:04:35 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.76])
        by smtp.corp.redhat.com (Postfix) with SMTP id 6C32CC16029;
        Mon,  6 Mar 2023 18:04:32 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Mon,  6 Mar 2023 19:04:28 +0100 (CET)
Date:   Mon, 6 Mar 2023 19:04:25 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Gregory Price <gourry.memverge@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        avagin@gmail.com, peterz@infradead.org, luto@kernel.org,
        krisman@collabora.com, tglx@linutronix.de, corbet@lwn.net,
        shuah@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH v13 1/3] syscall_user_dispatch: helper function to
 operate on given task
Message-ID: <20230306180424.GA13201@redhat.com>
References: <20230301205843.2164-1-gregory.price@memverge.com>
 <20230301205843.2164-2-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301205843.2164-2-gregory.price@memverge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/01, Gregory Price wrote:
>
> Preparatory patch ahead of set/get interfaces which will allow a
> ptrace to get/set the syscall user dispatch configuration of a task.
>
> This will simplify the set interface and consolidates error paths.
>
> Signed-off-by: Gregory Price <gregory.price@memverge.com>

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

