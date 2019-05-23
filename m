Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A9B967D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 23 May 2019 10:15:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbfEWKPi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 23 May 2019 06:15:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54315 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfEWKPi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 May 2019 06:15:38 -0400
Received: by mail-wm1-f65.google.com with SMTP id i3so5178779wml.4
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2019 03:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fOiVgoN82KE8hZ6hb2y3oHBGCVTmpcagcUclcAWOin4=;
        b=LBHp/9h702G4i8S/oj4Hnu6m+pNAjq9sheSoLtX9xigReIQRcuIB1408TO0q8dFaf3
         6yVo/PWyL7hGUz2R2FJs4gZSNNjvixhwgL6OgpFe3ZPMrKI9ecutnwbtHwHPEm2S0Sxh
         ykerDsAQOI9CVIdwhfp1AEjGHEYfdUqrd3bOMCTFOWPy3Vbz0N6MQOxq9pu/UHwkkRjm
         cgPgdjFOeQlcnFHTMcptH6isjpKj9BcSr4J6JGCc+9vOmmefCtK0V+04Qs8cmmodO9d4
         4lpD/ta7CzYfyV6h3FqoA1J+EksjO/mDi5LDuHftJsKa9lXsA5+WXKkKmn019fRz7Plf
         Fk/w==
X-Gm-Message-State: APjAAAW4jbL2Z+EViMzEn0a1DP5RA78/gfBStliv+lyOmAF5lZx5qVMd
        CmFFF5tUMQiimMyOjdd7d56XAw==
X-Google-Smtp-Source: APXvYqzBOZoHAw42kYYHFQfMTllL8gg9KY4gD1CnZ1zx61rB5Sk4JjLHT3/hnl/FXagEWu53NtIsIA==
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr11613624wmd.110.1558606536551;
        Thu, 23 May 2019 03:15:36 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id c14sm23252213wrt.45.2019.05.23.03.15.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:15:35 -0700 (PDT)
Date:   Thu, 23 May 2019 12:15:34 +0200
From:   Oleksandr Natalenko <oleksandr@redhat.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 0/8] docs: Fixes for recent versions of Sphinx
Message-ID: <20190523101534.cenmf7rexa7gerot@butterfly.localdomain>
References: <20190522205034.25724-1-corbet@lwn.net>
 <20190523093944.mylk5l3ginkpelfi@butterfly.localdomain>
 <877eah7a2k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877eah7a2k.fsf@intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 23, 2019 at 01:13:23PM +0300, Jani Nikula wrote:
> On Thu, 23 May 2019, Oleksandr Natalenko <oleksandr@redhat.com> wrote:
> > Thanks for the efforts. I've run this on top of Linus' tree, and the
> > only sphinx-related deprecation warning I've spotted is this one:
> >
> > /home/onatalen/work/src/linux/Documentation/sphinx/cdomain.py:51: RemovedInSphinx30Warning: app.override_domain() is deprecated. Use app.add_domain() with override option instead.
> >   app.override_domain(CDomain)
> >
> > Otherwise, it builds.
> 
> Please share your Sphinx version (sphinx-build --version).

[~]$ sphinx-build --version
sphinx-build 2.0.1

-- 
  Best regards,
    Oleksandr Natalenko (post-factum)
    Senior Software Maintenance Engineer
