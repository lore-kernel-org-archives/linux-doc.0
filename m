Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C3D97D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 Jan 2019 17:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbfAHRDU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 Jan 2019 12:03:20 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43724 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbfAHRDT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jan 2019 12:03:19 -0500
Received: by mail-pl1-f195.google.com with SMTP id gn14so2163719plb.10;
        Tue, 08 Jan 2019 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cYWpuEYMzpZdmiStmls+Tjr5IbAwC0fWogVWMtvRkFI=;
        b=MemujaHDqzkqnoznP65m5tJMRT3LRWBZArigFtMaEGL+/g1k0on0CRujPpSHFx69QU
         CMz/UEAF2D3xDnwekerybtE6eu/EEmcWXKPJd+DY9gDWKrgKl6cyNlPdrRBzALavMrl4
         eNgX+e1qfTSacgdtXdeB08sV2jkHivoZQCgJ1XaNUkTeG/aB6jhsjtaxkEeUw70J+q8O
         OFPAQEtNVorW2PX3h51IfY1glp7/DKfBMRr982Wt+r74Cd3iRWYJmu0CS54HpqyGSv17
         d0pFI2EWSqEH7onU7W7diATnZEsJjfA/3hIfzoAK/GRGHsvbEm0quJMaYKVGFt4zpK3w
         OXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=cYWpuEYMzpZdmiStmls+Tjr5IbAwC0fWogVWMtvRkFI=;
        b=LpHWjCZGy73LQ82G8GSSgLlxquxClcv/+oQeHYsofR4L7ejCFBm1isGcJ1O648W+si
         XssmEgCBoKY0UNNrCWvwv+BuV+uGv4GJhmcZAKv00KXHcc3ONzM5llAig3+L5Gd10HZz
         ubMYArKACGKiShOEW1JuFYei9STf7GJAT7gRts7iKqqlSEnRPGFbwvx3JbKaVLjM4q9k
         aDySrE0qb77VkEI4sYMmDRjYLtdLkooq2YWdVYoqEn1mBv48c7XFiN3a+aZ2hJQBqpsP
         FJtbxQ2PpeC760SQSnvuQVopasuxyWUlXdhvlwwJTvxLrSeKAfJU+NUv3Pkq4uGjW9ci
         UmUw==
X-Gm-Message-State: AJcUukehk21MOEkgxCKGJS6fJSJMGa8RKXoHe6xdfZGppm6nVUTJ9rwS
        5qTWjHzEfJuLmiushtHLJRNmyt08
X-Google-Smtp-Source: ALg8bN5ydWz8jQCmBbhc+xayFzevBRDUhwTPU+XA6h/V3kNB0HbPdMGFCwqP7L6m+/+lwyu4s8bHww==
X-Received: by 2002:a17:902:9006:: with SMTP id a6mr2492731plp.334.1546966998388;
        Tue, 08 Jan 2019 09:03:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i21sm114039029pgm.17.2019.01.08.09.03.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jan 2019 09:03:17 -0800 (PST)
Date:   Tue, 8 Jan 2019 09:03:15 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Chengguang Xu <cgxu519@gmx.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix typo in Documentation/hwmon/f71882fg
Message-ID: <20190108170315.GA25858@roeck-us.net>
References: <20190104142722.24824-1-cgxu519@gmx.com>
 <20190107154049.4e10e0c5@lwn.net>
 <20190107231622.GA2126@roeck-us.net>
 <20190107161847.07b67a33@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107161847.07b67a33@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 07, 2019 at 04:18:47PM -0700, Jonathan Corbet wrote:
> On Mon, 7 Jan 2019 15:16:22 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > > Applied, thanks.  
> > >   
> > Ok, I'll drop the patch from hwmon.
> 
> Oops, sorry, I didn't realize you'd picked that up.  Would you prefer that
> I stood back and let you handle Documentation/hwmon in the future?
> 

So far I took it as my responsibility, but I don't really care
one way or another as long as I am at least copied.

I already dropped this patch, so please keep it.

Guenter
