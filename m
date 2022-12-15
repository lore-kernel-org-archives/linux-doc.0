Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A460C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 15 Dec 2022 09:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiLOJzR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Dec 2022 04:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiLOJyw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Dec 2022 04:54:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0605420F5A
        for <linux-doc@vger.kernel.org>; Thu, 15 Dec 2022 01:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671098017;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aOMQqG6gaAklmVX8rdcaPnfjUYMFfjD3RzHjqdabLXs=;
        b=IUCDr2LXxEGvx291z10R+7lF1HXYpmjxBxq7DgKVGVmStdh6g09Xv7kSKLYYcHIXca/GP0
        eIZzgOnFcOLv+Pj3IErb4/VARbUiCVe5GNjmswiZwdes3DcR9tcfBKWfzRQSKquK7dorQA
        EQLabD+I6PD9yaM+y3gM3tJ2y54ddNQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-wcVsxnbLNsGKYJWRnvUohA-1; Thu, 15 Dec 2022 04:53:36 -0500
X-MC-Unique: wcVsxnbLNsGKYJWRnvUohA-1
Received: by mail-wm1-f69.google.com with SMTP id c1-20020a7bc001000000b003cfe40fca79so549551wmb.6
        for <linux-doc@vger.kernel.org>; Thu, 15 Dec 2022 01:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOMQqG6gaAklmVX8rdcaPnfjUYMFfjD3RzHjqdabLXs=;
        b=RC4CyP/MBy3IlAR/hyTSmN3of2lRTjsfumt0DOffkVRakzvExSMkKT1mJECnB2zPrH
         pLk+WvbeaGZ0faKGc+k2pJBV/k3TyUz3rMhLmEZ+kyTWF9TZhJ9JZ2em2LC7YFqCWTn9
         TP1ilyJgHDusNxOr/M7Ev/5Qtmh/ZdPIpIr23twUgbLhGmxks8Gb7ii5jzxta1dWpiR8
         VJTxnqCAdeplzT2D8WUAZeq+l00/qIIfcihuvFoYqUq7z/Oqa/dIh9Gf0VDKwJ11sf8q
         5/oD6Pef+4kbre8NAcih8vqKmBE2jytpd4RCfHjWl7m5NGFap9N8tV+PNhFbMgTkKOQE
         pxNg==
X-Gm-Message-State: ANoB5pm7S00enMrTtQhzb7wCKkBz3KcExiohInHeKY3JwOkrny5TR8sS
        KElQmLLI9756Pb7gIIN7naEkyVPmmKqbWAOrVmtBNhJa1ERYu8mFNhI+TG0nX2NARx7SyhusVd1
        N1o52BkrZRuJQj/oQ3Ot/
X-Received: by 2002:a05:600c:4d22:b0:3d1:cdf7:debf with SMTP id u34-20020a05600c4d2200b003d1cdf7debfmr21215675wmp.26.1671098014658;
        Thu, 15 Dec 2022 01:53:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf54Sxu27PikKHEdua27EQ4ofg4L9z3dGIL8de1ZPdl2AXWxg8V8inj3M85jKYvT1vAiolXufA==
X-Received: by 2002:a05:600c:4d22:b0:3d1:cdf7:debf with SMTP id u34-20020a05600c4d2200b003d1cdf7debfmr21215657wmp.26.1671098014349;
        Thu, 15 Dec 2022 01:53:34 -0800 (PST)
Received: from redhat.com ([2a02:14f:179:247f:e426:6c6e:c44d:93b])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b003cfd64b6be1sm7609383wmq.27.2022.12.15.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 01:53:33 -0800 (PST)
Date:   Thu, 15 Dec 2022 04:53:29 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     linux-doc@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] Documentation/process: Add Linux Kernel Contribution
 Maturity Model
Message-ID: <20221215044126-mutt-send-email-mst@kernel.org>
References: <20221214185714.868374-1-tytso@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214185714.868374-1-tytso@mit.edu>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 14, 2022 at 01:57:14PM -0500, Theodore Ts'o wrote:
> +  * The number of upstream kernel contributions by engineer, team, and
> +    organization (e.g., all people reporting up to a manager, director,
> +    or VP).

This is the only one that gave me pause. Seems eminently gameable by
trash variable-name-tweaking patches, unnecessary commit splitting etc.
I'm not going to name names but I'm seeing some of this as it is.
And if people decide to count patches posted as opposed to commits, oh
my ...  I don't think we should make people focus on the number of
contributions as opposed to their quality, and incorrect incentives tend
to promote incorrect behaviour.

Fundamentally I presume companies will evaluate contributions based on
how important the given functionality is for the company, so
I'm not sure we need to get involved here. Maybe just add this at the
end:

+    The metrics can be measured by team or
+    organization (e.g., all people reporting up to a manager, director,
+    or VP).

Or simply drop this part.
Besides this:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


-- 
MST

