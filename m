Return-Path: <SRS0=ajHd=6Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EA7C47255
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 22:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D08A2070B
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 22:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QuMzdF6P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgEKWjR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 May 2020 18:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725828AbgEKWjQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 May 2020 18:39:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB22C061A0C
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 15:39:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 145so5385950pfw.13
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 15:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iAjP/dx+TOMD3h2UkM1NHk9+DSE/HLxGXOk37w+Uu04=;
        b=QuMzdF6PS8DlHrgHS13L45Y9TnYal1cjdG9qFL4fSAMYsADcAWEElruJKaZMbOYFY8
         LLYN/42JZ4pb/bgLL6M2LY+My3cI4oIAEiUGxljboC2qy+VchFpRvHmr0RbSV8NUHYru
         ZE+amPP6HfKJFhKzEmlKRLFeK6aGAM3UVxyiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iAjP/dx+TOMD3h2UkM1NHk9+DSE/HLxGXOk37w+Uu04=;
        b=rCfUvIs3Zc3nHQXZWyU8Ou68io9fV5ifwkqTfc0aXB3jEXDmwy1NjtXVTCQf5IeCOf
         stOWr0MrPfzDVh1u24X8uHrRwzKvJdKFVyq7aWNTAKd380ImOa3tXoUwi+q+3IfN3iZJ
         xQSbshYwKCmjkBoffhg/2MWY9oIFm4KyPQy28bFGE8ue8YtVFlJcoKkoJsiD0KztOBLK
         tOliK0YEtigcx5CzNMtgduzReMWi6+OoACRkZ9zNwszNZOd6iBKMIHWLWsv4d7DGlgRU
         EgODAffqcTOCLDqWTAPFG+ihCZsicXw7Cx/LFAvCsguv3UA8Lw/gM5I9EY8PVgelDShN
         3oIQ==
X-Gm-Message-State: AGi0Pub6R0Ua8IvgL1QtgIIYuW7cAp34egw0t+u3U397PPRBFwqH9Otf
        o8wPXveWyAfXJV9oV08O82WZ0Q==
X-Google-Smtp-Source: APiQypJrZN+k1vOsrote6dfc4R1IK2fAk8lFQlDXHNEbyE2cjka13mhe1A3zpKLQZ+uySGgGBTXm7Q==
X-Received: by 2002:a63:7801:: with SMTP id t1mr15712443pgc.192.1589236755921;
        Mon, 11 May 2020 15:39:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y2sm10207468pfq.16.2020.05.11.15.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:39:14 -0700 (PDT)
Date:   Mon, 11 May 2020 15:39:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Rob Herring <robh@kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v7 00/18] pstore: mtd: support crash log to block and mtd
 device
Message-ID: <202005111537.E2DA45A259@keescook>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, May 10, 2020 at 01:24:18PM -0700, Kees Cook wrote:
>   pstore/ram: Move dump_oops to end of module_param list
>   pstore/platform: Switch pstore_info::name to const
>   pstore/platform: Move module params after declarations
>   pstore/platform: Use backend name for console registration
>   pstore/ram: Refactor ftrace buffer merging
>   pstore/ftrace: Provide ftrace log merging routine
>   printk: Introduce kmsg_dump_reason_str()

For those following along, I've added these to for-next/pstore, as
they're all prep patches for the rest of this series.

-- 
Kees Cook
