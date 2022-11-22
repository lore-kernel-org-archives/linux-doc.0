Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11801C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 22 Nov 2022 14:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbiKVOse (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Nov 2022 09:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233194AbiKVOsc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Nov 2022 09:48:32 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E54558BD2
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 06:48:28 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bs21so25077823wrb.4
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6VQZkRoHrqA7rpJ+k+Bc7BZuP/PY0GhLVjONMwr17o=;
        b=arkcTSSZ565+8zxaVnvMMkhBjDeyuV8uwARQodCjT/IrprezMx/J6gpGSxOsDOi6W0
         gzJQa/c/lk4i7feXnNiDgYk1VKfuckuqYMFg49LHY6zQ4i8tiic+81Kt1W8hxwAYNkGD
         XmZO2UXUf7FwmsVuEr0WLD/XKQQG94xP3axjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6VQZkRoHrqA7rpJ+k+Bc7BZuP/PY0GhLVjONMwr17o=;
        b=UJeEUQ0XK9I6kCV9I4jp+FqwJHVZl65ymJK1BktoRlX2+2y/8CuTQNdslkGGkYKJ81
         L+11japzwAiB5/s76kDlV5LjXPc9bC92UBkDsxfQ13JP1RL+3DzjvVkM/cCdqHqsJhxe
         8u2cUnCuzRdVuKjcA0z7I6kV9za1gXoo35aURT/Ru7LqUIkE3L3+/1c834UwXxiqhpXU
         CzZxoZ3MKJhvS3saHYaUJ1KMZNTmxDwMIXCR+iISQoqXL6I4IMQnRbYIr5X5uDMRZwEs
         uQYIXraeN0F6kVuavwkq3u8XeuUXPXOB2U9m7uSsg2Ek0fc/PcX1gJZMqlagUBI9dYfv
         SpDQ==
X-Gm-Message-State: ANoB5pnyOolGm51SjHhp6dMHCn43yTHDhoPuFpUW8rZi7DvoMa8yDe4I
        H2ZYG9ahLgMqSsULgvbCTygdSA==
X-Google-Smtp-Source: AA0mqf74yf0WzGebkyR4zTY7KjsNMhDDBQMASADAm4iZKkPhgzAhOhyQoa4x3u5MiOZWvy6god7z9A==
X-Received: by 2002:a5d:4ccb:0:b0:236:d611:4fcf with SMTP id c11-20020a5d4ccb000000b00236d6114fcfmr3765675wrt.192.1669128507148;
        Tue, 22 Nov 2022 06:48:27 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003c5571c27a1sm21728939wmo.32.2022.11.22.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 06:48:26 -0800 (PST)
Date:   Tue, 22 Nov 2022 15:48:24 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] drm/doc: make drm-uapi igt-tests more readable
Message-ID: <Y3zhOP6enOmUmapQ@phenom.ffwll.local>
References: <20221118235137.6859-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118235137.6859-1-rdunlap@infradead.org>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 18, 2022 at 03:51:37PM -0800, Randy Dunlap wrote:
> Correct grammar and make the use of the igt-tests more readable.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jonathan Corbet <corbet@lwn.net>

Pushed to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  Documentation/gpu/drm-uapi.rst |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff -- a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -402,19 +402,19 @@ It's possible to run the IGT-tests in a
>  	1. Use IGT inside a VM
>  	2. Use IGT from the host machine and write the results in a shared directory.
>  
> -As follow, there is an example of using a VM with a shared directory with
> -the host machine to run igt-tests. As an example it's used virtme::
> +Following is an example of using a VM with a shared directory with
> +the host machine to run igt-tests. This example uses virtme::
>  
>  	$ virtme-run --rwdir /path/for/shared_dir --kdir=path/for/kernel/directory --mods=auto
>  
> -Run the igt-tests in the guest machine, as example it's ran the 'kms_flip'
> +Run the igt-tests in the guest machine. This example runs the 'kms_flip'
>  tests::
>  
>  	$ /path/for/igt-gpu-tools/scripts/run-tests.sh -p -s -t "kms_flip.*" -v
>  
> -In this example, instead of build the igt_runner, Piglit is used
> -(-p option); it's created html summary of the tests results and it's saved
> -in the folder "igt-gpu-tools/results"; it's executed only the igt-tests
> +In this example, instead of building the igt_runner, Piglit is used
> +(-p option). It creates an HTML summary of the test results and saves
> +them in the folder "igt-gpu-tools/results". It executes only the igt-tests
>  matching the -t option.
>  
>  Display CRC Support

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
