Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8A5247D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Sep 2018 13:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbeIDRcf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Sep 2018 13:32:35 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36706 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbeIDRcf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Sep 2018 13:32:35 -0400
Received: by mail-ed1-f66.google.com with SMTP id f4-v6so3194341edq.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Sep 2018 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=eXYuAf+JCOuTyucs3DlR2NLG8nrxiiY1cqDAsD25atk=;
        b=A6j2roN6/HJnLdDDLlIq1Nbn/F5hN5kh+cqfJpX1f2kGWc8rPwqXkZEg5c9GutX4yh
         G6WH4/rcd7cF99Z8Gli6zT9TgKWw8dldAblKBoYH/IK+pS31THBZMBIil+dld6cZRzYL
         f2Zvb3F79IuIpQLU3xUcDdyjbanH3egGfHEm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=eXYuAf+JCOuTyucs3DlR2NLG8nrxiiY1cqDAsD25atk=;
        b=QVEDZDyqoj4R4aAlEP1gZZqWq+whn/JupTntbdbIse5Sfm74ij70iavXJX2sH2HgKz
         WCOEX6s1AeEesRSHzikz1K1f7Z6xUOu2QKE7Jg2G4g/E4zTWZa57dRtYUs22k0ILehWw
         6q/lCU6MTvtDWfNRO/d7ktPGFvx5L/1TYKjwfMlbsGnCC6PrHUaWVyXxEEMBmzKxF2C2
         Im3Gs0WQqYWmQZw6TCOCNWnR3RIeStXgWAfG+AAJx5xH5P70r4DQck4zTTnJNTwgTq/4
         LG5Grs8ntRKWTY5IPkNMp4fPX2M93sHMZnZVxEnxin9QAkZ5pIz1pDZaBd6l4DBQMnom
         iXgA==
X-Gm-Message-State: APzg51CUm+Dp/zODQ4SrMDhCkNmZg6z1CG1wAcylOeOVpkU8Lq6IazKo
        6AdfODguG2yVVOuKmwLKi5629Q==
X-Google-Smtp-Source: ANB0VdZdRrju1pEqdFrDtwFGjCRHMip3VGg8ybttv8M2nr4djWrPVuhgbYc3EkNbkhZg5p4GUXuIHA==
X-Received: by 2002:a50:c101:: with SMTP id l1-v6mr35537472edf.126.1536066450098;
        Tue, 04 Sep 2018 06:07:30 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-109.fiber7.init7.net. [212.51.149.109])
        by smtp.gmail.com with ESMTPSA id z56-v6sm15397043edz.54.2018.09.04.06.07.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Sep 2018 06:07:28 -0700 (PDT)
Date:   Tue, 4 Sep 2018 15:07:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     willy@infradead.org, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, sean@poorly.run,
        airlied@linux.ie, corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Document/gpu: Use new vm_fault_t type
Message-ID: <20180904130726.GR21634@phenom.ffwll.local>
Mail-Followup-To: Souptick Joarder <jrdr.linux@gmail.com>,
        willy@infradead.org, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, sean@poorly.run,
        airlied@linux.ie, corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180904041505.GA2712@jordon-HP-15-Notebook-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180904041505.GA2712@jordon-HP-15-Notebook-PC>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 04, 2018 at 09:45:05AM +0530, Souptick Joarder wrote:
> We have introduce new return type vm_fault_t for
> fault handler. Update the document for the same.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
> v2: Revert spaces added in v1

Thanks, applied to drm-misc-next.
-Daniel

> 
>  Documentation/gpu/drm-mm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 21b6b72..c3ae888 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -297,7 +297,7 @@ made up of several fields, the more interesting ones being:
>  	struct vm_operations_struct {
>  		void (*open)(struct vm_area_struct * area);
>  		void (*close)(struct vm_area_struct * area);
> -		int (*fault)(struct vm_fault *vmf);
> +		vm_fault_t (*fault)(struct vm_fault *vmf);
>  	};
>  
>  
> -- 
> 1.9.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
