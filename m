Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FB4C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jul 2022 18:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiGES1T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Jul 2022 14:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiGES1S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jul 2022 14:27:18 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979F918E0A
        for <linux-doc@vger.kernel.org>; Tue,  5 Jul 2022 11:27:17 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id r22so5189851pgr.2
        for <linux-doc@vger.kernel.org>; Tue, 05 Jul 2022 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JdqHzcPX4oGiiLBqKHpCQsJaaSCU20s5i1YlMAF6Bcg=;
        b=qMMm/qNpxmUwI+WJyBlm9l4xScD45QR1hnEZEvrZV0UMfriDbQz2j00hJyPqqtRF+g
         GtqUqtLDJTqjfw+scmGtXt5QPK7rBqHlD7p6PZoR4/UsFhtIrL06w6J96hEIVEDbvBv8
         /9qwq0Sjm+2OvrhphiEkJvmpxPJaC2+8Rx9ZwrKOB6fD5OgKjizBu1NwvYI9vu/oU3II
         /rNZKX8GlvVlDtVQic/QtLVTR7T53xAwffGrMEK7NqXfWbqQTLyZg0g7ptsQ6lrZl4lE
         5YZzB7dbA8slfdE1RjV97CTXvqPbnxufkZbYgyhfhBJiSMOC4aZWRRMBMw2+qd7+KT05
         TKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JdqHzcPX4oGiiLBqKHpCQsJaaSCU20s5i1YlMAF6Bcg=;
        b=Zl6VtwAbatdsnMicYIwbvpnwz7Buiyku2qXUu6dhFpKAUpAKCZTAM8JjgD+a8v5WEs
         eM/z5Och9Tb9s22u6UzhhTOoTajAioIp/4dBviEVY25Q9P/G/0lJRHAZPY3QokdL44yL
         S2qOuBs/BZBa16PYqyEnp+v58jSfw6uvdkIEebZRHvfgKmHSaGTuRZnNgXnVc/4E9j7B
         cRp8twrDtKA7UpHJPI9BEVxsXU0xmi1uofgwyahweyXUQCKudFCn0eiHytLXvH+ypZqy
         h/ADPRlwTUEtTwmdViS0FNLoz9jZkDeRgWwyTRdzlud4aIsOLAXtH2DjWUTqPL2zQHap
         hETw==
X-Gm-Message-State: AJIora/oheN+6kTN8ZzLUNwvPjxgv/JbYGEpXyOrSUQDN/wIokCd7SSu
        nyTVZ0RS/fyaQsBwg+QIawPMpw==
X-Google-Smtp-Source: AGRyM1sn+ljw7VPJjaeql/NiGTSsY8c1S29siW2527UZbUPjnp6BieUiF4kCejUc9lmo5Q+Lu7t6Vg==
X-Received: by 2002:a65:6b8a:0:b0:3fc:4c06:8a8d with SMTP id d10-20020a656b8a000000b003fc4c068a8dmr30438843pgw.83.1657045636868;
        Tue, 05 Jul 2022 11:27:16 -0700 (PDT)
Received: from hermes.local (204-195-112-199.wavecable.com. [204.195.112.199])
        by smtp.gmail.com with ESMTPSA id b9-20020a170902d50900b0016a1e2d148csm10924109plg.32.2022.07.05.11.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 11:27:16 -0700 (PDT)
Date:   Tue, 5 Jul 2022 11:27:13 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Paolo Abeni <pabeni@redhat.com>,
        Francois Romieu <romieu@fr.zoreil.com>, davem@davemloft.net,
        netdev@vger.kernel.org, edumazet@google.com, corbet@lwn.net,
        jdmason@kudzu.us, vburru@marvell.com, jiawenwu@trustnetic.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove neterion/vxge
Message-ID: <20220705112713.644cf3b4@hermes.local>
In-Reply-To: <20220705110634.4a66389a@kernel.org>
References: <20220701044234.706229-1-kuba@kernel.org>
        <Yr8rC9jXtoFbUIQ+@electric-eye.fr.zoreil.com>
        <20220701144010.5ae54364@kernel.org>
        <cbd7e14b3496229497ae49edbb68c04d4c1d7449.camel@redhat.com>
        <20220705110634.4a66389a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 5 Jul 2022 11:06:34 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 05 Jul 2022 08:17:24 +0200 Paolo Abeni wrote:
> > On Fri, 2022-07-01 at 14:40 -0700, Jakub Kicinski wrote:  
> > > 100%, I really wish something like that existed. I have a vague memory
> > > of Fedora or some other distro collecting HW data. Maybe it died because
> > > of privacy issues?    
> > 
> > AFAICS that database still exists and is active:
> > 
> > https://linux-hardware.org/?view=search&vendor=neterion&d=All
> > 
> > It shows no usage at all for the relevant vendor.
> > 
> > On the flip side, it looks like the data points come mostly/exclusively
> > from desktop systems, not very relevant in this specific case.  
> 
> GTK! There is a whole bunch of old Mellanox NICs reported so I think
> there is _some_ server coverage. I'm leaning towards applying the patch.

Looks like S2IO became Neterion and then was acquired by Exar in 2010.
Then MaxLinear acquired Exar in 2017.
Looks like they dropped out of NIC business and only do switches??
