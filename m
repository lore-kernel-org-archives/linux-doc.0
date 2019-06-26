Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C8217D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Jun 2019 14:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfFZO2V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 26 Jun 2019 10:28:21 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44012 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728092AbfFZO2U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jun 2019 10:28:20 -0400
Received: by mail-ed1-f65.google.com with SMTP id e3so3621579edr.10
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2019 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=RDzxId5d0cWk+Og3KjWmTmUc93/gQfEJUMFySwZomG0=;
        b=QEOzXwN4cDsvAl3fnj/WI0Yyq8XoY5VQ/1ZZo0YTXcPQaz7t7hzaRKCaRnRHIHiPGt
         zp3wPqP1RRIVvxImSiDl6NhJBgMjgo496X0ZA+o/q+gwPvwhoP6USmJAkOZsWfB7DEqS
         y2jLjM7JyZMFztMCPpCoUhWNkkAoVfNtxTL34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=RDzxId5d0cWk+Og3KjWmTmUc93/gQfEJUMFySwZomG0=;
        b=nLp66Nu7TBVio9SrgMDXv5414i7+lNt0jypBIVF8YYGOauH58NYRl/mT9QHAsp5K1y
         v+iud7sBzG7vvgnNsPQpwzGFYAz8dM2jSHnXsfDq1ErxjjcgLdcPe3eEhmRvtpdKfWYL
         msumKI+etDlj5WLtxQSL4/A1ozNiIgpO+wV7UN95fIBey8ZGsnHncy+gtAtmEQnLuDXG
         nRQpSXIdx+54OYH84npPQHhfWrrJblpXg2ryFmRm/G5FKo94hM9eStpoqqCsydC+EfC9
         fG6+b1vMOWkHD2SMVewlHJl4DjND1n+JWLO+Vgc9thXs2ALF8tv8oCkeuqbucknoDUqg
         yp4w==
X-Gm-Message-State: APjAAAXSS1tt6ZZL4jiUqEx96nuM5rAnpcPLw+1Z90T0KctEGeCC4yE+
        2ZvM8kfxcV19inetr8+cHnTdoA==
X-Google-Smtp-Source: APXvYqyHvtMQ1Lf+heBq8BjwPrx2FB7C/LXB6Iy0Y7C76qtBhDrUXHnqzdv+4phmpNRAYv0YzOY5Cw==
X-Received: by 2002:aa7:c619:: with SMTP id h25mr5603958edq.295.1561559298723;
        Wed, 26 Jun 2019 07:28:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id a8sm5564492edt.56.2019.06.26.07.28.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 07:28:17 -0700 (PDT)
Date:   Wed, 26 Jun 2019 16:28:15 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] docs: gpu: add msm-crash-dump.rst to the index.rst file
Message-ID: <20190626142815.GM12905@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
References: <e22a340cf94240094cfb38f8c62f6916ea99394a.1561556169.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e22a340cf94240094cfb38f8c62f6916ea99394a.1561556169.git.mchehab+samsung@kernel.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 26, 2019 at 10:36:11AM -0300, Mauro Carvalho Chehab wrote:
> This file is currently orphaned.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/gpu/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index 1fcf8e851e15..55f3f4294686 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -12,6 +12,7 @@ Linux GPU Driver Developer's Guide
>     drm-uapi
>     drm-client
>     drivers
> +   msm-crash-dump

Should be added to drivers.rst I think, since it's driver-specific
documentation.
-Daniel

>     vga-switcheroo
>     vgaarbiter
>     todo
> -- 
> 2.21.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
