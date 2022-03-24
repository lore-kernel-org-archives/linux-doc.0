Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81BFC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Mar 2022 00:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346923AbiCXAzY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Mar 2022 20:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346883AbiCXAzX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Mar 2022 20:55:23 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E8D6249
        for <linux-doc@vger.kernel.org>; Wed, 23 Mar 2022 17:53:53 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id t5so2754398pfg.4
        for <linux-doc@vger.kernel.org>; Wed, 23 Mar 2022 17:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=piJRl+6ho54xwmr7pghjDhTXicnYnpxRZsVKlizVP2w=;
        b=ncbD6aUUYjopy6AUFwQmMJZaAS/Ak50tCwzvAEHKQDJ95bHstm8IcBwG/iFpqZ2I8k
         LJUqBujXQ/n42gzMRD9L1ixtxppDwm4oj3j3Q8FjAeRfHlmypm8Hp4pWm9bZU9z8Ylf+
         BooCoRZUFuCba9TOOiHjCFU96riHpf/g5U8TurQh/YJs0vaMXV2A+splVllIRrrzRzLa
         j+LULl3Ovs2gT62HcbcDwKzsf3XBFSvQJvSbOLIl+Z2jiUDGLpPNZNpVX1/5I8yNP0Of
         CyzYWcWuQBYpUSUASoOW1IibSyVPxKGtW/ZCOe5Q2jriz+L7hGi5eA3lmVQgaKXtlZVZ
         Dt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=piJRl+6ho54xwmr7pghjDhTXicnYnpxRZsVKlizVP2w=;
        b=Cfhy6eS/1+UqgWfQFSrc7CKb/sQCyN0nKqaSU7sr+Uq3ou+yQX9cJFIc9vwLxLpwtJ
         1AjyG+Zzbt4OavnC5xtViagNte7C7tdYLRtLB+UgrUDziS23MVk8R57QXi7ByDjkcpzr
         XaNQN4tLe33cnUwj3aEMZsyGn4qkeRVUrwgbzZIx7sRzdirfLDiOo4Vjiqc2c/HYUNQM
         G6F9MW3eRzOL57qDj3oFBRDRk+4KRjXA/jeChh4lroS9gBgwMq4zbls5bbvmVHBbWn7j
         gsXDsuywcJO02O1jcS14AGk7B4OXWNo6RkjM5BtE/QClwgtv7xpekSKj8twXHgFBsZz7
         C8Zg==
X-Gm-Message-State: AOAM530QZF1s3gJlNXmK+lAdo9jmd7ue2LpaLAe4OhxDqAoXac2b8yQA
        0B1PDbhAJQNRyAbO056+1XfCft5v+IzyScM0A1bx4w==
X-Google-Smtp-Source: ABdhPJxHN2wGkD2Tc/WqYsncT+yBTS4vCZ9XwGQvUgkbmHypLKbrccnEjmzxfzKvoZ0ITBzS/OdSkRLQ3MP8RVxzqA4=
X-Received: by 2002:aa7:86c6:0:b0:4fa:46d:6005 with SMTP id
 h6-20020aa786c6000000b004fa046d6005mr2684054pfo.86.1648083232815; Wed, 23 Mar
 2022 17:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220321220408.2381974-1-trix@redhat.com>
In-Reply-To: <20220321220408.2381974-1-trix@redhat.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 23 Mar 2022 17:53:45 -0700
Message-ID: <CAPcyv4jBh6v_=hBimbU=-dqV2GTEnuqxB26i5QTu4jBETpcRXQ@mail.gmail.com>
Subject: Re: [PATCH] nvdimm/blk: Fix title level
To:     Tom Rix <trix@redhat.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 21, 2022 at 3:04 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> make htmldocs fails with
> Sphinx parallel build error:
> docutils.utils.SystemMessage: ...nvdimm.rst:146:
>   (SEVERE/4) Title level inconsistent:
>
> PMEM-REGIONs, Atomic Sectors, and DAX
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> The PMEM vs BLK section was removed without changing
> the PMEM-REGIONS... title line.  Replace '^' with '_'.
>
> Fixes: f8669f1d6a86 ("nvdimm/blk: Delete the block-aperture window driver")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---

Looks good, thanks for the fix!

Jon, I'll take this through the nvdimm tree.
