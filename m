Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 90F4E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 18:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732480AbfJAS0I (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 14:26:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46158 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731034AbfJAS0H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Oct 2019 14:26:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id q5so8626187pfg.13
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2019 11:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zqsAipJBT/+l6hHcipqnKpFpMM4A80W4tvsIakuG5CE=;
        b=g5QA2RQoe+ZqGhmmwzTRV8KB6BVTAuTsSyf3gaXExsBraZ1sXNs+w6QTQFAeTULPBP
         PaoUbh+njFeHRfH8CiwTrxIdbQPqR7Sm1kxQgXUltqo/Oa61SemzAOELrxcRBHfJ6cvi
         fWpNairMz6FZah2H/4t2m/96PvOOjygR4rPyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zqsAipJBT/+l6hHcipqnKpFpMM4A80W4tvsIakuG5CE=;
        b=orUVYycjlBkqY1xkcVuSV4Cor0eMqoxvdzORZRFm876InQe3ooSbDSvIiw7jJ2YCjx
         A8oiPnSkDyfg8q++jxNRTKEiRQvAjSksGBRuMcZP6D6Z9c9hBgLygjva5C+G3m557mAQ
         ZQ48QF6QxjwEgEUz/BaVSQCbA8qa130A5dPHeQp+TBDBcHVP/DImShmZUhdmyEi3lgmH
         f6mpq5N66F629OVV3MqFKHhyCF40b91NP9HBvo4A/eE9qZ1hf8QdkQ7pSNyA18WYPJyL
         z/PHg8UJPlisdl7ZjmOTJVXe2Q1FLlVGDwGWsJYRrxhfVL0bdA28ihqa0bmMrh2C/n+u
         gZ7w==
X-Gm-Message-State: APjAAAV1696+E4Co+xjV3VE35Ms+Lri9xsbfAx5b5qtbmJ9njt6Oci3l
        eSLhIyCp9f8KoesGlzbwk0Fjn1zsaGs=
X-Google-Smtp-Source: APXvYqyIpgN6OMZZun5BSeRfWkyvMJAYXr0Kg9rgz1eEcJUaLgX3ig+qYOn4DUrT3tL82rBWIejrOg==
X-Received: by 2002:a17:90a:28c5:: with SMTP id f63mr7051535pjd.67.1569954366452;
        Tue, 01 Oct 2019 11:26:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c8sm16082912pfi.117.2019.10.01.11.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 11:26:05 -0700 (PDT)
Date:   Tue, 1 Oct 2019 11:26:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: Programmatically render MAINTAINERS into ReST
Message-ID: <201910011125.AF5245230@keescook>
References: <20190924230208.12414-1-keescook@chromium.org>
 <20191001083147.3a1b513f@lwn.net>
 <20191001120930.5d388839@coco.lan>
 <20191001113506.12720205@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001113506.12720205@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 01, 2019 at 11:35:06AM -0600, Jonathan Corbet wrote:
>          for line in open(path):
> +            if sys.version_info.major == 2:
> +                line = unicode(line, 'utf-8')

Ah-ha! Thanks. I've sent v2 now. :)

-- 
Kees Cook
