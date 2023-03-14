Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBC0C6FD1C
	for <linux-doc@archiver.kernel.org>; Tue, 14 Mar 2023 15:31:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjCNPbv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Mar 2023 11:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbjCNPbf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Mar 2023 11:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7384FF1E
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678807767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pFFMMmPTz5x1S9NARoP2V2gZHa5Y3DQ4tWz8LK+dCLM=;
        b=fxZUWti973wFTOMt62oH7dL4IzPvp/yMYbS2f+Dx8xRcbS67SdTUV8GHx1U0fJ2JF4trqg
        l51eXVEd/wC97F41cQ+BBhR+J2Wi6akcEgb6zhwIh/HvEKavQTWM0iDmGOWs23HTtzozFb
        626Ezt4beioCeh4tGg8h9vy75PDu1y8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-ZyrVTjhPM4Sy_UzJqCmgZg-1; Tue, 14 Mar 2023 11:29:25 -0400
X-MC-Unique: ZyrVTjhPM4Sy_UzJqCmgZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8611800B23;
        Tue, 14 Mar 2023 15:29:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A00DD400D927;
        Tue, 14 Mar 2023 15:29:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
References: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
To:     Bharath SM <bharathsm.hsk@gmail.com>
Cc:     dhowells@redhat.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, "pabeni@redhat.com" <pabeni@redhat.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>
Subject: Re: [PATCH] dns_resolver: correct documentation error in dns resolver
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3730952.1678807763.1@warthog.procyon.org.uk>
Date:   Tue, 14 Mar 2023 15:29:23 +0000
Message-ID: <3730953.1678807763@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bharath SM <bharathsm.hsk@gmail.com> wrote:

> Fix error in dns_resolver documentation
> 
> Signed-off-by: Bharath SM <bharathsm@microsoft.com>

Acked-by: David Howells <dhowells@redhat.com>

