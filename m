Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771A1C433E5
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 17:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DC816198C
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 17:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhCSR0d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Mar 2021 13:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhCSR00 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Mar 2021 13:26:26 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC9EC06175F
        for <linux-doc@vger.kernel.org>; Fri, 19 Mar 2021 10:26:26 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ha17so5014497pjb.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Mar 2021 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=G2ciI+8gLo1fSwlXD2q75g0c52yk/hMrZ0yweTlh3Wk=;
        b=VcZIRP1tPwWzWYflvDs2QtRdxoWgthJmMjpQFcvI0cw/Oi8U3fDykMwMJHUCRgLwLN
         IHz3cdgeMpGlUNdsWBkf889IaBIr31ob91+6VjKlBUZbqbRwigbvyhVbfasbWmvR5lSa
         t3CWNSy3svupvHUJAS0mJ7ozPSUoiXCBicW70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=G2ciI+8gLo1fSwlXD2q75g0c52yk/hMrZ0yweTlh3Wk=;
        b=HMwASeq1CCPVv/aWgSNM8jK5cFwhs6ndBaZwofoCKMguIA7UOlKxRgZcE2/h3bAc0R
         XXYcRmcbu+8aASjUmjEEbWeUVKc9R/fwpXXWx2grEQ92NVN8lkhpWUmRulVqM816l8lk
         5z76nYVEravR9NAfj5m8q1RiMcFbpjRsLINx1otCdxBhRvG6Ymr12ZN7xGvD4mgN0pMh
         xkuyMB0CwKXo4RlpZkBrkSo1eRaC+fBtJ479LCkMzMvlSERBIlbn/5ghraHDj5Dh4Hq1
         q8KtVmIpgVRaKwT+qMA5FmgjThPbh1aWdptEwAO7p4Nnr1kYz4LI6KUm5QGaUipI1e7h
         In4A==
X-Gm-Message-State: AOAM531OEP2Cj+tDUT0OYfIt+b7td4do9J1pTrkqoETm2hhaxlWwa1at
        cOsBdXM9pjPaQiQXRegb9qKUHQ==
X-Google-Smtp-Source: ABdhPJzOKA9F+yXMnxyRNFmJt9DfXWSRK0fZPjEUoInFJxIRVNA3uwgGEl8gbZRw8mSeGT/QAF3Jqw==
X-Received: by 2002:a17:90a:a403:: with SMTP id y3mr10703577pjp.227.1616174786403;
        Fri, 19 Mar 2021 10:26:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r23sm6188880pje.38.2021.03.19.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:26:25 -0700 (PDT)
Date:   Fri, 19 Mar 2021 10:26:25 -0700
From:   Kees Cook <keescook@chromium.org>
To:     =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>, Jann Horn <jannh@google.com>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Casey Schaufler <casey@schaufler-ca.com>,
        David Howells <dhowells@redhat.com>,
        Jeff Dike <jdike@addtoit.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Shuah Khan <shuah@kernel.org>,
        Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
        kernel-hardening@lists.openwall.com, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        linux-security-module@vger.kernel.org, x86@kernel.org,
        =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>
Subject: Re: [PATCH v30 11/12] samples/landlock: Add a sandbox manager example
Message-ID: <202103191026.E2F74F8D9@keescook>
References: <20210316204252.427806-1-mic@digikod.net>
 <20210316204252.427806-12-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210316204252.427806-12-mic@digikod.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 16, 2021 at 09:42:51PM +0100, Mickaël Salaün wrote:
> From: Mickaël Salaün <mic@linux.microsoft.com>
> 
> Add a basic sandbox tool to launch a command which can only access a
> list of file hierarchies in a read-only or read-write way.
> 
> Cc: James Morris <jmorris@namei.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Serge E. Hallyn <serge@hallyn.com>
> Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>

I'm very happy to see any example!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
