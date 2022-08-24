Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100BBC00140
	for <linux-doc@archiver.kernel.org>; Wed, 24 Aug 2022 10:20:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236794AbiHXKT7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Aug 2022 06:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236795AbiHXKTv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 06:19:51 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B38CB7CB
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 03:19:49 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id q2so19290124edb.6
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=s0j2FSbwvmjKdvN+169nQdScgb7ALVuRcy3EIVLP7So=;
        b=DNYaMoJZfqTl1zDi6NfKZZNWYwlrnOiVUiJmcwR/S17jsY9fY/Ngvx8ghbhYAQYLBZ
         iosJQQDlAc2g+gT/jZ08h5QB8fcv4B7NVl0dzILk2YtT5fwGcE742npl8exZOAzm+0nu
         Gwl5Vid27xtbN7GAblRedWuh/ys90QXaZZvu+xQG6IAGfMTgGMhEc560XEWHesJI/Rn7
         crl2l5Bcu1/NXTW+J9mMKFiWXjfZGppPM3A0EvsLASxxnw3/XvZ1IZs2+glf+3Xczq1v
         7O/VRL7UEObRyKjXpOjb8Zi01VJ7UFfV02Bc6L/TKGpYLA8hihsJUgMZTgRx340ziDDD
         2Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=s0j2FSbwvmjKdvN+169nQdScgb7ALVuRcy3EIVLP7So=;
        b=JlkqaPyv/MPuDaVnDHEHfdm6d8vfkwCPhF8mKnpjM2O9NBdcXd57nRK0XNkvrLtKCl
         XDFiv95C8iwOoZScf0Blbl65NSx+449+P0+gOAgig0UPWWvf6MWUht0gyxlFPgj0TJUz
         owg7xKPTGGow35jKsQa4V4qvmYYy48mA1R/eS03gOMtvfrS11UOGdEix+AGftPvgCHWw
         +3rgcD9hV0En55T5dCxB9dXfBu/b3kt2JZsp0JouCW1POptOJEtrzMz/CTbzzB7wjHk2
         yYu+xdX5UtIpARLlLvsLQbLvSMt/9w/S5W0vu05ofXmVQZIZXnrRKWM5JQLKodljY4DI
         ElUQ==
X-Gm-Message-State: ACgBeo1xVEkmIE7BkMtwbOLV527FrFYDV+36gb92D5V82dhMlLBQPYMO
        c72nl/5Mc309PJzzqABEe6NS+g==
X-Google-Smtp-Source: AA6agR7qxhD95wx9Ex9KCuhMEFSKKxiH5pnOMNEntNXYgYlefJndvgHpOhNVzvJet7AGNK5e/+mN3A==
X-Received: by 2002:a05:6402:27c6:b0:446:71e1:7399 with SMTP id c6-20020a05640227c600b0044671e17399mr6988640ede.357.1661336387791;
        Wed, 24 Aug 2022 03:19:47 -0700 (PDT)
Received: from localhost ([2a02:8070:6389:a4c0:2ca9:6d59:782b:fff3])
        by smtp.gmail.com with ESMTPSA id d6-20020a50fb06000000b0043a5bcf80a2sm2794293edq.60.2022.08.24.03.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 03:19:47 -0700 (PDT)
Date:   Wed, 24 Aug 2022 06:19:46 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     tj@kernel.org, mkoutny@suse.com, surenb@google.com,
        gregkh@linuxfoundation.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] sched/psi: consolidate cgroup_psi()
Message-ID: <YwX7QvIpmPpxEHgI@cmpxchg.org>
References: <20220824081829.33748-1-zhouchengming@bytedance.com>
 <20220824081829.33748-9-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220824081829.33748-9-zhouchengming@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 24, 2022 at 04:18:27PM +0800, Chengming Zhou wrote:
> cgroup_psi() can't return psi_group for root cgroup, so we have many
> open code "psi = cgroup_ino(cgrp) == 1 ? &psi_system : cgrp->psi".
> 
> This patch move cgroup_psi() definition to <linux/psi.h>, in which
> we can return psi_system for root cgroup, so can handle all cgroups.
> 
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
