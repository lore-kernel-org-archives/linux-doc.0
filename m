Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50285C433FE
	for <linux-doc@archiver.kernel.org>; Fri,  6 May 2022 14:29:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442201AbiEFOc6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 May 2022 10:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442195AbiEFOc5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 May 2022 10:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 21BD268FA3
        for <linux-doc@vger.kernel.org>; Fri,  6 May 2022 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651847354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Sl3tayqSeSwStUmGAN4VOsTJbnxMRfuI6128fPfMd2A=;
        b=NMrterZM6gS9DKYWKt+hIYatFR/eHiSNg278yQkOn8WwXxfZ0AnII1/jxx90IxqOBX8Rnz
        isCSo3FJGhe1Zu8epuVhG9lvJ5r1nPKvR/LUfOb8+rJ+pmkgNeS9I2VAMuAOr2IRZGD0Ny
        HTO6jsO2Mk3ASYdVAJOUEvDFnJyivts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-rFIbqaMeOQSzRU-fSNvhKw-1; Fri, 06 May 2022 10:29:08 -0400
X-MC-Unique: rFIbqaMeOQSzRU-fSNvhKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66A2C1014A63;
        Fri,  6 May 2022 14:29:08 +0000 (UTC)
Received: from lorien.usersys.redhat.com (unknown [10.22.32.97])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 114664010E2C;
        Fri,  6 May 2022 14:29:08 +0000 (UTC)
Date:   Fri, 6 May 2022 10:29:06 -0400
From:   Phil Auld <pauld@redhat.com>
To:     Joseph Salisbury <joseph.salisbury@canonical.com>
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, stable@vger.kernel.org,
        peterz@infradead.org, tglx@linutronix.de
Subject: Re: [PATCH] docs: sched: Update sched-rt-group Documentation For
 Gender Inclusiveness
Message-ID: <YnUwsnt52aB0sZi0@lorien.usersys.redhat.com>
References: <20220505021424.12656-1-joseph.salisbury@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505021424.12656-1-joseph.salisbury@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 04, 2022 at 10:14:24PM -0400 Joseph Salisbury wrote:
> Document assumes root user is he:
> "assumes root knows what he is doing."
> 
> Update documentation for inclusivness, since root is not limited by gender.
> 
> Fixes: 60aa605dfce2 ("sched: rt: document the risk of small values in the bandwidth settings")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joseph Salisbury <joseph.salisbury@canonical.com>
> ---
>  Documentation/scheduler/sched-rt-group.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/scheduler/sched-rt-group.rst b/Documentation/scheduler/sched-rt-group.rst
> index 655a096ec8fb..e55fee6772c4 100644
> --- a/Documentation/scheduler/sched-rt-group.rst
> +++ b/Documentation/scheduler/sched-rt-group.rst
> @@ -19,7 +19,7 @@ Real-Time group scheduling
>  ==========
>  
>   Fiddling with these settings can result in an unstable system, the knobs are
> - root only and assumes root knows what he is doing.
> + root only and assumes root knows what they are doing.
>

Now there's a singular vs plural problem.

"... assumes root users know ..."  ?



Cheers,
Phil

>  Most notable:
>  
> -- 
> 2.34.1
> 

-- 

