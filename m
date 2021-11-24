Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD722C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 24 Nov 2021 17:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349956AbhKXR4V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Nov 2021 12:56:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28511 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349937AbhKXR4U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Nov 2021 12:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637776389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mASyT0OMl03qWDFFy00mhqeWIkZHCHpjVkFxkJ6erhk=;
        b=gqtDLTFmO0qgymnX+dm+kwESu4jensgURt4UVaSaw6rNLuzM/MGEnbMaWizNFWTrMMXJ/Y
        Hud6oaQwHEqv3Q2iol9JDYalR4ly5CoFzjH/EBlOEi5pklRNeLV1+/qJI68EudEOEtBR85
        g/u1NQdFXLXYrVsUklT4G6pcjzYWE5o=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-euMk6Go2MM2o-GUzzJ0rVw-1; Wed, 24 Nov 2021 12:53:08 -0500
X-MC-Unique: euMk6Go2MM2o-GUzzJ0rVw-1
Received: by mail-ot1-f70.google.com with SMTP id g32-20020a9d12a3000000b0056f8e5396a1so2041790otg.7
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 09:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mASyT0OMl03qWDFFy00mhqeWIkZHCHpjVkFxkJ6erhk=;
        b=ObHCeEtdJFfgOq5V5JKF+zU8Vue2XEkoZoN51chNnp8bIiEh4D18JKaeEOidCI+V3k
         1AAQ4xglbw3v+VWoq133uzEnXpRRq0JtCLZ7cLm/5rkOiLmT1fL+V2vq6YTL9C4OJNn7
         1zkBpzryb55iK6NZjBxDeBKWFr2iTeOegnftA1R99TjZMsa7JU+dgS3Txwxe7i/DuyuG
         Fr4QTe8v8fn7B9OIKrMVDU0tIBI5F6lH328yWVzTAyYc2SK023p9g7flZlH3jf54vYS3
         16PPyvIxUiO9KcKHgl3gsVKUjXoTOk6s8RuDiqfQjXwAyEq5aUJdgnmPr4kFMLlRuz/G
         IgOQ==
X-Gm-Message-State: AOAM5330OEMVZjbbuPRTfxUAtlNEpO5n7btM8yw0LpESHMR9k6+RTrtm
        dZyFOyt0M07rA5tA54YW9NyfJbhgvSYT4uWYeDD3XAE77Vr4GuOT7G7JNzpTVjmkYOngFXG7TFT
        I9BTOFIExFx0Xwj3LBEmP
X-Received: by 2002:a54:4f1d:: with SMTP id e29mr8178818oiy.179.1637776387523;
        Wed, 24 Nov 2021 09:53:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRWB6L5DthV9JqtypnlgpgoikvWzzaSh5YU1GEzYTaFfOEcTtDdkodALrrMwzR5kHOWImEJg==
X-Received: by 2002:a54:4f1d:: with SMTP id e29mr8178778oiy.179.1637776387316;
        Wed, 24 Nov 2021 09:53:07 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id bj8sm123395oib.51.2021.11.24.09.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:53:06 -0800 (PST)
Date:   Wed, 24 Nov 2021 09:53:03 -0800
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Marco Elver <elver@google.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v2 23/23] objtool, kcsan: Remove memory barrier
 instrumentation from noinstr
Message-ID: <20211124175303.nwuk2zlnwkr7fj5f@treble>
References: <20211118081027.3175699-1-elver@google.com>
 <20211118081027.3175699-24-elver@google.com>
 <20211119203135.clplwzh3hyo5xddg@treble>
 <YZzQoz0e/oiutuq5@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YZzQoz0e/oiutuq5@elver.google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 23, 2021 at 12:29:39PM +0100, Marco Elver wrote:
> On Fri, Nov 19, 2021 at 12:31PM -0800, Josh Poimboeuf wrote:
> > On Thu, Nov 18, 2021 at 09:10:27AM +0100, Marco Elver wrote:
> [...]
> > > +	if (insn->sec->noinstr && sym->removable_instr) {
> [...]
> > I'd love to have a clearer name than 'removable_instr', though I'm
> > having trouble coming up with something.
> [...]
> 
> I now have the below as v3 of this patch. The naming isn't entirely
> obvious, but coming up with a short name for this is tricky, but
> hopefully the comments make it clear. We can of course still pick
> another name.
> 
> Does that look reasonable?
> 
> Note, I'd like this series to sit in -next for a while (probably from
> some time next week after sending v3 if there are no further
> complaints). By default everything will be picked up by the -rcu tree,
> and we're targeting Linux 5.18.
> 
> If you feel there might be objtool conflicts coming, this patch could be
> taken through another tree as there are no hard dependencies, as long as
> this patch reaches mainline before or with the rest.
> 
> Thanks,
> -- Marco

Looks good to me.  I don't know of any upcoming conflicts, feel free to
carry it with your series for now.

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

