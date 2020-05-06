Return-Path: <SRS0=EZYx=6U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA71BC28CBC
	for <linux-doc@archiver.kernel.org>; Wed,  6 May 2020 19:38:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B644320747
	for <linux-doc@archiver.kernel.org>; Wed,  6 May 2020 19:38:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJBtLCbp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbgEFTiX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 May 2020 15:38:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37184 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729279AbgEFTiW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 May 2020 15:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588793901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4yGP/vMyHodm9DIXtqpc9Y5085eYUUAufi7jwsRMqFY=;
        b=bJBtLCbpiYSfHeOTzpKfxlnfTdkiWiffsuNOi8hZY/kUUDYAgDYF4H+1DYaUuUdnO1cYPx
        g+LFd4QUn8FTapE7XEndlCuW8mPDfovnDjEveKLgzgHm/QJkQbnugEyy2P+HykxUDJ98Li
        pwG3EDYCKx2GHvMna8U9W8VkfxAEMDc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-igwSq4QOPW2ClWPUgnsuYA-1; Wed, 06 May 2020 15:38:19 -0400
X-MC-Unique: igwSq4QOPW2ClWPUgnsuYA-1
Received: by mail-qk1-f197.google.com with SMTP id d187so2941634qkc.18
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2020 12:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4yGP/vMyHodm9DIXtqpc9Y5085eYUUAufi7jwsRMqFY=;
        b=DwIKUI2zb0oGfJ9BoOi8emifT9H1R98ewy+9MAFErrQuiKGmDQivRhmoUuRUAsqUDJ
         CESzGQe/GyfaRFC9hWkImNf1IesyrTVoFTIbeG6zSV15Rzuo/LTsw+MH1vrYCRGA8U06
         yzNPUNlSEKvtWnuPnsjQBi2EujCUz7Gsw2/FmzQLkcaEaRfIk1S60XyVWzAAD63zfXiI
         SnKxT3ua8XiatlazsS/6lr3PCoK4qHtudi81ksdkhYZ1FcI9H3L8wOlQ7f2EQ9s0xQHt
         KWSy3rsO17EAx3ov+C3jdQ/o6+37WDPu/N8RG2BYcnnIUpzf4OTDqS18zeNEtmtHJoc6
         Q8UA==
X-Gm-Message-State: AGi0PuYiUWMD8mUdG6e7enrRy8X1MHdwryP2Zb7vlYoABXKrcQUDVXR5
        330QcG4tPqJhpXcIMwEIvzfH+Jw099axUvudhZY0G7yvx+b9OFmMukxaDpga5AqHmmgaS0k4DP2
        Oe5duNZ4jkiSEI2ExBjXm
X-Received: by 2002:ac8:6cf:: with SMTP id j15mr10289653qth.143.1588793899434;
        Wed, 06 May 2020 12:38:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypJgeGRbgQoROxq+NzNkpj9p1DQBrBYEowm2aG2YpEWn4T7EEcbZzi+caA0aMstz/KZmNOVVMA==
X-Received: by 2002:ac8:6cf:: with SMTP id j15mr10289631qth.143.1588793899217;
        Wed, 06 May 2020 12:38:19 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id h188sm2445057qke.82.2020.05.06.12.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 12:38:18 -0700 (PDT)
Date:   Wed, 6 May 2020 15:38:16 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Daniel Colascione <dancol@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Mel Gorman <mgorman@techsingularity.net>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Jerome Glisse <jglisse@redhat.com>, Shaohua Li <shli@fb.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, timmurray@google.com,
        minchan@google.com, sspatil@google.com, lokeshgidra@google.com
Subject: Re: [PATCH 2/2] Add a new sysctl knob:
 unprivileged_userfaultfd_user_mode_only
Message-ID: <20200506193816.GB228260@xz-x1>
References: <20200423002632.224776-1-dancol@google.com>
 <20200423002632.224776-3-dancol@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200423002632.224776-3-dancol@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 22, 2020 at 05:26:32PM -0700, Daniel Colascione wrote:
> +unprivileged_userfaultfd_user_mode_only
> +========================================
> +
> +This flag controls whether unprivileged users can use the userfaultfd
> +system calls to handle page faults in kernel mode.  If set to zero,
> +userfaultfd works with or without UFFD_USER_MODE_ONLY, modulo
> +unprivileged_userfaultfd above.  If set to one, users without
> +SYS_CAP_PTRACE must pass UFFD_USER_MODE_ONLY in order for userfaultfd
> +to succeed.  Prohibiting use of userfaultfd for handling faults from
> +kernel mode may make certain vulnerabilities more difficult
> +to exploit.
> +
> +The default value is 0.

If this is going to be added... I am thinking whether it should be easier to
add another value for unprivileged_userfaultfd, rather than a new sysctl. E.g.:

  "0": unprivileged userfaultfd forbidden
  "1": unprivileged userfaultfd allowed (both user/kernel faults)
  "2": unprivileged userfaultfd allowed (only user faults)

Because after all unprivileged_userfaultfd_user_mode_only will be meaningless
(iiuc) if unprivileged_userfaultfd=0.  The default value will also be the same
as before ("1") then.

Thanks,

-- 
Peter Xu

