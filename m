Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0E5117D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 15:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729754AbfABP7c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 10:59:32 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:45574 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729119AbfABP7b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jan 2019 10:59:31 -0500
Received: by mail-yw1-f68.google.com with SMTP id d190so12167763ywd.12;
        Wed, 02 Jan 2019 07:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KEm4etM4eth7Ri6QC0Qy/Ny7yfGhtJOfLTX5Wxxna5k=;
        b=sRHxOSdaBaFi473jP/zE8RO9engV9JPOtZIuRliV1TWd0k54Fw+0C5nRZdb0NGQpTI
         mowTKqB2k2/1KNRAYO12wMiaZu4d78283qupOjiq6OcJ4GU4aX4Sn5XvIx07YvUwnxfg
         iT8ug0uyks3nHXzPxufcBj9VrxQNK6S0jJutD3Uq8xY48yJUPaVLFbyVvLBeJrZliWUA
         1PBductC3wEaNMfo/jAt66ZqkHGMcjNx5gtd6TGb7EJHxjg5vFzmKEiK7TTg0d/sYlaM
         hYKFmuSw2ozLN/1n6ic7PhVfroD6T92C3wkzPWGnEjgfsA03atxNto6K3CukhScLs6al
         aoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KEm4etM4eth7Ri6QC0Qy/Ny7yfGhtJOfLTX5Wxxna5k=;
        b=PVw15p96Sj3APhs7pQBenc2GWesHIhLeLE60Nh6A7ZxQA2QCkoULtEliYsrPWPGU+w
         CGW7tQ58uxC2z3xdJqqzr+qsB6LU/E9WYIlpE+eCTiwT6lSoNjDRhbEogmrFBDsknypR
         G++G6Bu6ZEsoQuH2L6QbTPRPqWENVjWxnfKWAiWfEkSfczAhYh8a56o6TK/GtWEb2FHZ
         BmA8oHF2AW7i5lRlYmvi3dw7eBAU+uD1Xdt4i4Xe95gRklr4Hq9PtwQgjSPzTjI4LUnn
         2E3T1o5jvJr/r6B7j9Pf+Eqbx2SSlOE0n1pamOzs5VuXwVHV+z+ekpxRiJ7DRwU3gY1v
         MuNA==
X-Gm-Message-State: AA+aEWYgdVlzOCt30Y3sXIl9tEGY59+Hdbh9gwSroircXcP3xsgndrl5
        IpYkcaJhzc6ciXwgkNnwOxo=
X-Google-Smtp-Source: AFSGD/U5RK14IhPpEa+Evj4RPFjYA0hD645oUXuq+AypuCIR80KZDnBZCVg4PNDItZh1tKrC2GsO8A==
X-Received: by 2002:a81:2b04:: with SMTP id r4mr45856882ywr.511.1546444770354;
        Wed, 02 Jan 2019 07:59:30 -0800 (PST)
Received: from localhost ([2620:10d:c091:200::6:f03d])
        by smtp.gmail.com with ESMTPSA id q185sm19612505ywe.87.2019.01.02.07.59.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Jan 2019 07:59:29 -0800 (PST)
Date:   Wed, 2 Jan 2019 07:59:28 -0800
From:   Tejun Heo <tj@kernel.org>
To:     Otto Sabart <ottosabart@seberm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: cgroup: add missing literal block
Message-ID: <20190102155928.GP2509588@devbig004.ftw2.facebook.com>
References: <20181230190155.GA15155@personal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181230190155.GA15155@personal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 30, 2018 at 08:01:55PM +0100, Otto Sabart wrote:
> This patch fixes multiple build warnings:
> "WARNING: Block quote ends without a blank line; unexpected unindent."
> 
> Signed-off-by: Otto Sabart <ottosabart@seberm.com>

Applied to cgroup/for-4.22.

Thanks.

-- 
tejun
