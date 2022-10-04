Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AE2C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 00:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiJDAAc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 20:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiJDAA3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 20:00:29 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074C315FF5
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 17:00:25 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 83so4602728pfw.10
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 17:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=o2b6tkTm79Hq7cBFTASISNpumWfJdTPRV3REM28Za+c=;
        b=RHkLlXama069cxi74bxt00Ik3yKbCp7eqcjpJ+BrwE/1Guzo7yRXeE2Mlwg9/Q1pft
         FpU8rWJ0zhvXTgdtu5ZrT9wcAMy8omqjXqtd+QnQLb72g+yiqjNZwXumr+AvRy9LNXuJ
         PhYt7Z/apm2VoEc6VJGKm4Os53iN72KHY4TqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=o2b6tkTm79Hq7cBFTASISNpumWfJdTPRV3REM28Za+c=;
        b=uU6JZZxRxNTeT7NOTdlqRsO31830jECfzp4/JA3G8nhZQmnMFs9ipwdb6DmnAOmrti
         kmGYaCds2hKZkMx5pkmHvKRerPp5RJYPBi++lYfTrQhGBET36Ij8qjUjCK8DC4g55fC+
         yp0axBzYwhNQJJ98iychESjbyg4ZDFeNHSzBtYAYd6jqT3cM730rfzbyaq7gn6bz8v4w
         jBZllRDJqvUbtRiwwXUbSUHNRL74g1d3wnX7kF2FrpnGat0TLMwDLxtXBbHjzyTrSyRL
         TYz19UZJXeXr1pjDK32t+QPnhgykt7eB1n/VUKhvNFcvMmYLBTQfnMWJ0VeUHMbt2ucu
         41BQ==
X-Gm-Message-State: ACrzQf0CadeZnotKeAq0CiXOlriBHCrUFcIUxGd8jJssRfDqoF8armMj
        zsV5sGi4+vuKyj27d4hFSknrEg==
X-Google-Smtp-Source: AMsMyM4XTe6Addd3B3fzFGMr8MXv7g/1myw41iKI39g5lf9c2CLcuvJt36Ijei3dGll/IC1/xnbqFA==
X-Received: by 2002:a63:5d48:0:b0:43a:390b:2183 with SMTP id o8-20020a635d48000000b0043a390b2183mr20651434pgm.29.1664841624524;
        Mon, 03 Oct 2022 17:00:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e80d00b00178ac4e70dcsm7787131plg.185.2022.10.03.17.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 17:00:23 -0700 (PDT)
Date:   Mon, 3 Oct 2022 17:00:23 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V . Shankar" <ravi.v.shankar@intel.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        joao.moreira@intel.com, John Allen <john.allen@amd.com>,
        kcc@google.com, eranian@google.com, rppt@kernel.org,
        jamorris@linux.microsoft.com, dethoma@microsoft.com,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [OPTIONAL/RFC v2 38/39] x86/cet/shstk: Add ARCH_CET_UNLOCK
Message-ID: <202210031700.3C9BB219A@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-39-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929222936.14584-39-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 03:29:35PM -0700, Rick Edgecombe wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Userspace loaders may lock features before a CRIU restore operation has
> the chance to set them to whatever state is required by the process
> being restored. Allow a way for CRIU to unlock features. Add it as an
> arch_prctl() like the other CET operations, but restrict it being called
> by the ptrace arch_pctl() interface.

Hrm, please make this build-depend on CRIU...

-- 
Kees Cook
