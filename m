Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0EEC87D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Jul 2018 20:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbeGRU4A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Jul 2018 16:56:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:32797 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729700AbeGRU4A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jul 2018 16:56:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id r5-v6so2498751pgv.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Jul 2018 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=HKWPKp4OhQNPtuUh2A4lTKaE+Px7CtP8hYAARoUwSkI=;
        b=fElTP1A8Vg0Ke8cqdtPeLKorGfytM2ioy8KBSzqwP82D4Op4P68SbglP68DpofctzV
         IMPBBnfF9O5ZT+UJw64SLeD8fipSif5kYks6F8dlCT7iM8XztEeXCdydsglOO0+NEbl5
         AP4VZZiLalWpxQeFS5sIbLpn/4c8PjRoBv0IKdGC7Yl4dhv7hFuZiufAdMMEJKee1aqC
         +FlZ0n8iocoM4sq8S0LlpFPw7bbjLEJjgpirKSDAvsWUB0GOIMatlMVPemZ6PZMamCQH
         9GbucyutVxCgOvU8p4qNDhw1DBJH7NUcmrswZ4+acPNJh/aYmABwb3qR63Mx8ssSgxZ6
         Tt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=HKWPKp4OhQNPtuUh2A4lTKaE+Px7CtP8hYAARoUwSkI=;
        b=M1i404lMXM/zq4ruzFwOhirtDy1qCt1spo5YP9YNG2b1eeyXZRkKgAwHUwZ3TrQJSj
         FSSdMuXNBdv2jNENyAq5ZlBEPASNL0C9XpUPwl9knhhiIC3W0gTzbudYgyt63s23OtsB
         25F29dmHoufex2QOkrgGFHzqD3iECbEWKmeWMmpFIYDDfnI0wpV3CbJ1JnoehKoUKsUG
         G9Z2e4YBembLdvfGw1KKjuPneGtHhasFcsQcdOP0Q79g8FmiklifYZkB82d9IMVkISb3
         +klUrYDGWuWyI1XYEQVPSWVK7yoZEi18ocFpiIoRNSMc8T++1zF60x3qJkaIn1Jhu979
         WQCw==
X-Gm-Message-State: AOUpUlG4WWx3bsF0r6UrimVhtQZev4nHePMFTjL8vidvyOiO3rFvcv7C
        0j6ngx9GNiP9g+slRgPUq58RHQ==
X-Google-Smtp-Source: AAOMgpe6g9KAN0d+u5DuK50zBJPPx6XER2pNfGh2df4kXSZovhfpSwGRnOQ7tuYrYHOCQx8J3lQm/w==
X-Received: by 2002:a63:e452:: with SMTP id i18-v6mr7023038pgk.185.1531944989786;
        Wed, 18 Jul 2018 13:16:29 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id r19-v6sm21085410pgg.39.2018.07.18.13.16.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jul 2018 13:16:28 -0700 (PDT)
Date:   Wed, 18 Jul 2018 13:16:28 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Baoquan He <bhe@redhat.com>
cc:     mhocko@kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: Deprecate kernelcore=nn and
 movable_core=
In-Reply-To: <20180717233100.GH1724@MiWiFi-R3L-srv>
Message-ID: <alpine.DEB.2.21.1807181314230.49359@chino.kir.corp.google.com>
References: <20180717131837.18411-1-bhe@redhat.com> <alpine.DEB.2.21.1807171344320.12251@chino.kir.corp.google.com> <20180717233100.GH1724@MiWiFi-R3L-srv>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 18 Jul 2018, Baoquan He wrote:

> > > We can still use 'kernelcore=mirror' or 'movable_node' for the usage
> > > of hotplug and movable zone. If somebody shows up with a valid usecase
> > > we can reconsider.
> > > 
> > 
> > We actively use kernelcore=n%, I had recently added support for the option 
> > in the first place in 4.17.  It's certainly not deprecated.
> 
> Thanks for telling. Just for curiosity, could you tell the scenario you
> are using kernelcore=n%? Since it evenly spread movable area on nodes,
> we may not be able to physically hot unplug/plug RAM.
> 

To evenly distribute ZONE_MOVABLE over a set of nodes regardless of the 
many memory capacities of systems that we have where individual command 
lines cannot be tuned.  But you want to deprecate kernelcore=nn, not just 
the percent version, so I assume that's not the answer you're looking for. 
We do not enable CONFIG_MEMORY_HOTPLUG so this deprecation would break our 
userspace such that we cannot use ZONE_MOVABLE.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
