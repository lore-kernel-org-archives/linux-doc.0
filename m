Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBEFC25B07
	for <linux-doc@archiver.kernel.org>; Wed, 10 Aug 2022 06:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbiHJGFX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Aug 2022 02:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbiHJGFT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Aug 2022 02:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F34D621251
        for <linux-doc@vger.kernel.org>; Tue,  9 Aug 2022 23:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660111517;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sBlUQH9ZYI87QjLCL8xa8WoZuHTUiJ4rE7hGqowqg5w=;
        b=JFt5yGjCjReLu2WbPSarLgcUcw/Hf+AKe7EKg7E5d2qHAVolYkkj2qQft8jUfLj8ghQlOb
        AdcD78bz6YcX8pjO282e33xTRm9euYbhACb2/gJpvaGS8PHkFSeLp1jro9e3MyhWXbeRLS
        KkozRAGZWzyYhlGkMJ0kTyUlTgYdGmU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-06xJyrRiNbasfk_UdASCHA-1; Wed, 10 Aug 2022 02:05:15 -0400
X-MC-Unique: 06xJyrRiNbasfk_UdASCHA-1
Received: by mail-ed1-f71.google.com with SMTP id v19-20020a056402349300b0043d42b7ddefso8523050edc.13
        for <linux-doc@vger.kernel.org>; Tue, 09 Aug 2022 23:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=sBlUQH9ZYI87QjLCL8xa8WoZuHTUiJ4rE7hGqowqg5w=;
        b=IBLw4AtWGLyfhPPyyc97qdks7QYelNerQS5a8E1TiXdroTnGhhrGOl5z9JSh490V0A
         XPaerlPy6bUglYz9eLiu1cNKrGAHYCmzB1vZ9FO555FElj17mOpUzMAlTNwREOcBd105
         StTNgwohCEjuhsq3FeXLx+//Bb42bUXDrKskRC5uO1/wyvDuZaDUWgR4qkUV4sQ8XE3p
         ScHigXsrrDYOi6+0Jpqo7hB++uppUCrSyTGnPW0uwchk/Q5zzly8L6GqRv6e8ek/24/J
         YE3SKmwDrkAjUuvJwyj6XrSIGWOsDIM9RkMVoPtwZ2mq0XKnoUSEXQ6SRStBgx2GM9pw
         Z18A==
X-Gm-Message-State: ACgBeo2YkQR735xB1dpohYIkYTct+/ds5XwkxzvJrF1lGre1VteO1xk9
        mvAc5n8tnzkXB5XLdnJOe1VspcawWnw79wHet8dxtD3samk3f+AaNf8s1p+ix7qENWI4RS23weL
        FmwFX8UQYcmsRz5mtNobI
X-Received: by 2002:a17:906:fd84:b0:730:acee:d067 with SMTP id xa4-20020a170906fd8400b00730aceed067mr19393953ejb.206.1660111514487;
        Tue, 09 Aug 2022 23:05:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zsECaQisdchCePlp4yUAvq88BKlsK7g/FdrfvnijgIa0+CeZxy11peJJUHhW3QeKUTE6NCQ==
X-Received: by 2002:a17:906:fd84:b0:730:acee:d067 with SMTP id xa4-20020a170906fd8400b00730aceed067mr19393941ejb.206.1660111514262;
        Tue, 09 Aug 2022 23:05:14 -0700 (PDT)
Received: from redhat.com ([2.52.152.113])
        by smtp.gmail.com with ESMTPSA id b18-20020a17090630d200b00732a5b3d09csm1658020ejb.89.2022.08.09.23.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 23:05:13 -0700 (PDT)
Date:   Wed, 10 Aug 2022 02:05:09 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>, kernel@openvz.org,
        David Hildenbrand <david@redhat.com>,
        Wei Liu <wei.liu@kernel.org>, Nadav Amit <namit@vmware.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 1/2] Enable balloon drivers to report inflated memory
Message-ID: <20220810020330-mutt-send-email-mst@kernel.org>
References: <7bfac48d-2e50-641b-6523-662ea4df0240@virtuozzo.com>
 <20220809094933.2203087-1-alexander.atanasov@virtuozzo.com>
 <20220809063111-mutt-send-email-mst@kernel.org>
 <d8fd3251-898d-89fe-226e-e166606c6983@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8fd3251-898d-89fe-226e-e166606c6983@virtuozzo.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 10, 2022 at 08:54:52AM +0300, Alexander Atanasov wrote:
> On 9.08.22 13:32, Michael S. Tsirkin wrote:
> > On Tue, Aug 09, 2022 at 12:49:32PM +0300, Alexander Atanasov wrote:
> > > @@ -153,6 +156,14 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
> > >   		    global_zone_page_state(NR_FREE_CMA_PAGES));
> > >   #endif
> > > +#ifdef CONFIG_MEMORY_BALLOON
> > > +	inflated_kb = atomic_long_read(&mem_balloon_inflated_kb);
> > > +	if (inflated_kb >= 0)
> > > +		seq_printf(m,  "Inflated(total): %8ld kB\n", inflated_kb);
> > > +	else
> > > +		seq_printf(m,  "Inflated(free): %8ld kB\n", -inflated_kb);
> > > +#endif
> > > +
> > >   	hugetlb_report_meminfo(m);
> > >   	arch_report_meminfo(m);
> > 
> > 
> > This seems too baroque for my taste.
> > Why not just have two counters for the two pruposes?
> 
> I agree it is not good but it reflects the current situation.
> Dirvers account in only one way - either used or total - which i don't like.
> So to save space and to avoid the possibility that some driver starts to use
> both at the same time. I suggest to be only one value.

I don't see what would be wrong if some driver used both
at some point.

> 
> > And is there any value in having this atomic?
> > We want a consistent value but just READ_ONCE seems sufficient ...
> 
> I do not see this as only a value that is going to be displayed.
> I tried to be defensive here and to avoid premature optimization.
> One possible scenario is OOM killer(using the value) vs balloon deflate on
> oom will need it. But any other user of that value will likely need it
> atomic too. Drivers use spin_locks for calculations they might find a way to
> reduce the spin lock usage and use the atomic.
> While making it a long could only bring bugs without benefits.
> It is not on a fast path too so i prefer to be safe.

Well we do not normally spread atomics around just because we
can, it does not magically make the code safe.
If this needs atomics we need to document why.

> -- 
> Regards,
> Alexander Atanasov

