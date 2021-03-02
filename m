Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D089BC433E0
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89DCD64F1D
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580300AbhCBSBE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Mar 2021 13:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345665AbhCBHHC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 02:07:02 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED18FC061788;
        Mon,  1 Mar 2021 23:06:02 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id s8so23888863edd.5;
        Mon, 01 Mar 2021 23:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tmhS/KeYVyEtrVqK4ma4bE7yqEBsOwF+0svPZ4Fg20U=;
        b=eXUR/nfuzca1Q19Y5H8qRi7q/IK3HZEspy6KH0KjdLofWadozZfNmae5HZifLdY8s4
         BERO++xo9gP5/vJFHT4shh8PcNsG84xbDAcFPt23xxM97HNwynxvK91MgJ/EOaNzZzOC
         ZsnoyWJUo3JS0wX+IGDzI5DHTCjBOqr9cf6BbtGLSNglrjFqC7nv5U1Irx5iLXDGqKCa
         BJmK5WzEsH32gKcYuvBgGunBDEclSkSMSfSdnC/lfkUfNrngVlLZDXqaRtpfMBaQKNJU
         radHeu9NxBPR9+9jkvlSq/FUd28SOJPo3PZrjGxtJRw8ZHD8TQ3MAV7s39bOqrg/IBIK
         VnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=tmhS/KeYVyEtrVqK4ma4bE7yqEBsOwF+0svPZ4Fg20U=;
        b=BnsX/vccwWM1pxcTubmo9fR6AtzC3BepIps65w/6Ni5zzZsoPvnFFuwfolzB9B6sAJ
         2dwaKAgYXAlgx5Z6N2320Qog2gzOrl9MteTFw4Gg2+9x8a2FhxRmGkgRsjoHvEVZcHpA
         6ExY03v9tfCdIAa3XhxlwQom3eUHTmrRvVbMyyG4EIF+MBKjxJmUysat+6oYPILLc2J9
         /QoLjjk2A1XPU1tbn/E08Z3KonW9g833ztw3OhIpn1G++XjpInGuXnuhZi7CyLP/d5qc
         R5sgdhE9qVxhCVvQI/XUgFKCAY4mHXHXDXOuH0nAf67yJDQJAVIbaJ31gfdtSIhO87LX
         +2AQ==
X-Gm-Message-State: AOAM533bacYGTqtfxkU4qJ4Jcuyj7j5TUSSWj6t4uYublL3hnykaYkAP
        3hWLg6XVD4W30h+DBDwt6uQ=
X-Google-Smtp-Source: ABdhPJxr0BAdDdpzb0RXsFS3MohsZq2i2dgUNGG+e/XDpdfTmnUKmCC+bC2IH+zY60ILoxNPBKhErA==
X-Received: by 2002:aa7:d4d6:: with SMTP id t22mr16321161edr.376.1614668761706;
        Mon, 01 Mar 2021 23:06:01 -0800 (PST)
Received: from gmail.com (20014C4E1C864000F9B8756A94F10216.dsl.pool.telekom.hu. [2001:4c4e:1c86:4000:f9b8:756a:94f1:216])
        by smtp.gmail.com with ESMTPSA id c20sm16444696eje.59.2021.03.01.23.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 23:06:01 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Tue, 2 Mar 2021 08:05:59 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        paulmck@kernel.org, mhocko@suse.com,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 3/3] kernel/smp: add more data to CSD lock debugging
Message-ID: <20210302070559.GB2809110@gmail.com>
References: <20210301101336.7797-1-jgross@suse.com>
 <20210301101336.7797-4-jgross@suse.com>
 <YD0fTLnQTQ7/M7fx@hirez.programming.kicks-ass.net>
 <c7c1eeb5-21b3-339b-4b25-a6c8df820146@suse.com>
 <YD1SJNDeGcNOO00s@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YD1SJNDeGcNOO00s@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Mar 01, 2021 at 08:16:12PM +0100, Jürgen Groß wrote:
> > >    https://lkml.kernel.org/r/20210220231712.2475218-2-namit@vmware.com
> > 
> > They are already in tip locking/core (Ingo applied them).
> 
> I'm very tempted to undo that :-(

Sorry about that - I'm sorting out the conflicts with the concurrent TLB 
flush series.

Thanks,

	Ingo
