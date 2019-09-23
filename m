Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DCA547D913
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 14:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390953AbfIWOIk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 10:08:40 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:44338 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389738AbfIWOIk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Sep 2019 10:08:40 -0400
Received: by mail-yw1-f66.google.com with SMTP id u187so5223174ywa.11
        for <linux-doc@vger.kernel.org>; Mon, 23 Sep 2019 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eLbXfyJzh+CNXjjxIUFpnYYGETQ4UqgCIVHyFOjnoV8=;
        b=Zbo5KJNatZHi8F0+zI8CGJr1tW/mUoHn4vEK5PVb0piMTlMc2nVpV1KBO4w2F+uTro
         KPiA3LiAGbSAfKu+menMBQ0NorPe69vNZHAt107ogBQ+g0gu/8sSSamPe+sJG/5U1UfQ
         0OkjH0sPMsruEswKxOb8L1Ewidk4urm4FRPUusPYYCu+POfx5WByescbXRN+Jm3Qswi1
         CwryXI6Y067HkWaPJBWKt0lrkmTffcMFuY4VZGGRcs94kCAbtVDaTYOnBQ4sD35VmPWg
         ZAiALGdUjGSUqHOkxo69pyRd1h4NqcUz7ImREZOp99LkHN3nRpMv6NAJFqduPcRCslMu
         9O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eLbXfyJzh+CNXjjxIUFpnYYGETQ4UqgCIVHyFOjnoV8=;
        b=T713+U8HHyqPso08NcvWDrSuET2XfHrVnqu8CMLvxZeTh7JTxhdL0kk1AvGtaMtNuL
         lK9tl6pOJAINYT6rhoyAXbVPZziQrevR/GPiOYoBjSI/BwKKjZQU9V0unVOoDVA/JXYy
         52XYjMj9yg9Fgl1lXAXVXXuLpv8Iz9TPlEqvLJo/M7TaCGCK5TOOhzyo3L4G/G+8vj/w
         HTZKyMMPVgRkieaHXaesDG5XMwwh8HVXcmpZstJdl4Hh9JqMpkbeHCSepawqkVZCyNSa
         3LJcK+2tqkfb2ERRG5uId7ISRj1NhUkO75i89hjZaqOWLGaBUFQhSA1gaZN4Qewm8BUc
         V4mg==
X-Gm-Message-State: APjAAAVxgqi/RI0Lujtcjb8ob30LhsZ8rhvdb3cdzvu0SlWb/7JIw7+p
        YbGQECC5avNDnZ5tbZltHcfxDQ==
X-Google-Smtp-Source: APXvYqxnruDu0JvpWl1+7CxiyW2Ywlf37HwFjpHtml3Gro0m6A/4M7sAOHzqTO+ahIFUoPilpwn/8Q==
X-Received: by 2002:a81:4bc2:: with SMTP id y185mr22221130ywa.491.1569247718773;
        Mon, 23 Sep 2019 07:08:38 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id e130sm2591425ywh.50.2019.09.23.07.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 07:08:38 -0700 (PDT)
Date:   Mon, 23 Sep 2019 10:08:37 -0400
From:   Sean Paul <sean@poorly.run>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation/gpu: Fix no structured comments
 warning for drm_gem_ttm_helper.h
Message-ID: <20190923140837.GA218215@art_vandelay>
References: <20190920193558.89815-1-sean@poorly.run>
 <20190920193558.89815-2-sean@poorly.run>
 <20190923065946.rlchr5hubkogutw4@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923065946.rlchr5hubkogutw4@sirius.home.kraxel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 23, 2019 at 08:59:46AM +0200, Gerd Hoffmann wrote:
> On Fri, Sep 20, 2019 at 03:35:52PM -0400, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > Fixes
> > include/drm/drm_gem_ttm_helper.h:1: warning: no structured comments found
> 
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> 

Thanks, pushed to drm-misc-next

Sean

-- 
Sean Paul, Software Engineer, Google / Chromium OS
