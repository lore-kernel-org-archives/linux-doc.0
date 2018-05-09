Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D5ADE7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 13:43:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935054AbeEINn3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 09:43:29 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:37699 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934996AbeEINn1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 09:43:27 -0400
Received: by mail-wr0-f195.google.com with SMTP id h5-v6so11769427wrm.4
        for <linux-doc@vger.kernel.org>; Wed, 09 May 2018 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H3KlamWwT6DU9TBWT4/GK2YDXV+Mvhq+ReFOR0jEnXY=;
        b=LjfDFpBwlylQ3qcXwhZKtk9oQt07SbUA7tiUbYaPfc3dwTRW0oevdcUsNKI8cXxSgh
         c4EunPxpbmg4/LqGFD2r3qpmXMoLmlqkJ9vcB4sV41tFADja0TDiM9/xoS677McZ+qRB
         oNkI3d7dLSqO9LEA7l//c+GtDCCeayoeR7mHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H3KlamWwT6DU9TBWT4/GK2YDXV+Mvhq+ReFOR0jEnXY=;
        b=mACwvIUrgfO45fg8PHLU1oC4Z2s3FMlmCssEl+3pIBPRuZ5fNvWn3BhsgCGB2OSeZR
         JvzPBS9F07S2TBw9Fr7QtC84Z8i+VVXxStvzLkQZuoK3wNFBkRG2mKZl+eZy/dg4mmA/
         t4OF2rkFM0lPWnxkAWUjbsNle49pPT3/c6tYyhvgZpFOi9+V3tNESIqZTN0FsEtu+uxo
         kGSk+ECstdWno80r34DBbWFVYoTG7ARQRVt6Pap+GvUHGJYNR5tizpnTKgwlvGW1mduh
         zIK3E+Wx6Tgg5ozIfNPs66IzIHpamo3wS/jQeNJM2nvqLvwtCVnryORDhnmb8wXA+Vdr
         UU5A==
X-Gm-Message-State: ALQs6tBoyxv8m/USOX/w5HaJme+P6qINy6hJ88ADrHx2/O+urWjx1vpM
        5DqVtyWgVoTP6ErTMLTU3qHRng==
X-Google-Smtp-Source: AB8JxZrkBkuq6cSVN96+r0uf9ljEGTgCi/6I5CestM8yy6REjwbtVPdlDPr0kiWuwSrgT1E2GNG7KQ==
X-Received: by 2002:adf:b004:: with SMTP id f4-v6mr37810308wra.75.1525873405974;
        Wed, 09 May 2018 06:43:25 -0700 (PDT)
Received: from andrea (86.100.broadband17.iol.cz. [109.80.100.86])
        by smtp.gmail.com with ESMTPSA id y42-v6sm37096227wry.21.2018.05.09.06.43.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 May 2018 06:43:25 -0700 (PDT)
Date:   Wed, 9 May 2018 15:43:19 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 08/11] docs: refcount-vs-atomic.rst: prefix url with
 https
Message-ID: <20180509134319.GA14921@andrea>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
 <d5683242124d6070c9a2d665c59e274d94c8b3ba.1525870886.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5683242124d6070c9a2d665c59e274d94c8b3ba.1525870886.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

On Wed, May 09, 2018 at 10:18:51AM -0300, Mauro Carvalho Chehab wrote:
> There's a github URL there, but it is not prefixed by https.
> Add a prefix, to avoid false-positives with:
> 	./scripts/documentation-file-ref-check
> 
> As a side effect, Sphinx should also generate a cross-ref.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

There seems to be a "conflicting" patch ("applied" according to Jon):

    http://lkml.kernel.org/r/1525468309-5310-1-git-send-email-andrea.parri@amarulasolutions.com

Let me stress here that the github repo. is out-of-date (and we have
no plans to keep that in sync with mainline).

  Andrea


> ---
>  Documentation/core-api/refcount-vs-atomic.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/refcount-vs-atomic.rst b/Documentation/core-api/refcount-vs-atomic.rst
> index 83351c258cdb..185d659e350a 100644
> --- a/Documentation/core-api/refcount-vs-atomic.rst
> +++ b/Documentation/core-api/refcount-vs-atomic.rst
> @@ -17,7 +17,7 @@ in order to help maintainers validate their code against the change in
>  these memory ordering guarantees.
>  
>  The terms used through this document try to follow the formal LKMM defined in
> -github.com/aparri/memory-model/blob/master/Documentation/explanation.txt
> +https://github.com/aparri/memory-model/blob/master/Documentation/explanation.txt
>  
>  memory-barriers.txt and atomic_t.txt provide more background to the
>  memory ordering in general and for atomic operations specifically.
> -- 
> 2.17.0
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
