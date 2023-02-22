Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925BDC636D6
	for <linux-doc@archiver.kernel.org>; Wed, 22 Feb 2023 18:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjBVSzR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 13:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjBVSzQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 13:55:16 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A4F2CFC1
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 10:55:16 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id u6so3761798ilk.12
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 10:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4f4KAu5FcuZRh3bQO/pEC/Gq/Kig7c/VMZHAX6Cyzk=;
        b=IsHICxuo35+/EFnSzxVMkfyeAn1cdD6WQ7p2xoG3LQjOqvmr9q03+NIV0UCsOkoB8Z
         vzR1H52dQTcBKGwSH9/PeJKVDNwCALGFCPDNuiew+DrT0LD0bXneW0A7STFtrdzLs0wZ
         rqrbsmIXnfO3IISCXgdIJ//9YejhCeU5ub2zejiHHcBVLxqMmKAs69qCk9f/gcBYEdV0
         V0SjyZMsEPblJAelDgbR7i/HJhrVbYDRqJ2/V3KrhSE87jQaI9qzBx43FW94kd/ILetJ
         W6V1nAut75was+7Ws5gmy1ZjX3B49dveA1nbaLCAuft0d+1K0GWpSb30Le4Fw4Q9QNuP
         nJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4f4KAu5FcuZRh3bQO/pEC/Gq/Kig7c/VMZHAX6Cyzk=;
        b=T0sqwxuMR5ucgG9+QnJ/oUYAd0++06qEyRY41MLJHHSja5YJYuID+LPS/mDA5g0Ty7
         77+mslosgN6m0enjKanMmjndcQbwrjG+nzJFjyofnOuQCPH+H5kTsExEPVt297sM7ldn
         hU6v4aYDqfyvLEEhVlFdf8B9kI3omp/BGDnAnx2Dd/JOMhXZ90Hnjo5OWtXVDynDmFsS
         MjozkEsoH0oK/cWK1HijBFnJ0gY7n6G38s5KirVTx4HreMEmH4tbTIuB1jvlIYjvlsas
         CDtkQd//Je5vpaIxUk/H/EhYakBAXHCrwlVOjRWOPbio/lLtrRwgEW0G0NRgV2Hvu5c1
         pUeg==
X-Gm-Message-State: AO0yUKUOXLeluAvDKM2Wv3QljXU5mtof8JnuNy+AZS1izwwkRcIjxZ2w
        /uOfa8p+PRabFGuJYlD1OGbMsQ==
X-Google-Smtp-Source: AK7set+XhW61NoYQaJ+pmjULr4fMZyYfO5h6FOq4U4/2U/7LfWDww1Z1TIGzxmW4o4gW4GR568DiTg==
X-Received: by 2002:a05:6e02:8aa:b0:315:9a7e:fb03 with SMTP id a10-20020a056e0208aa00b003159a7efb03mr5796202ilt.29.1677092115154;
        Wed, 22 Feb 2023 10:55:15 -0800 (PST)
Received: from google.com ([2620:15c:183:200:4099:d580:c693:eb7f])
        by smtp.gmail.com with ESMTPSA id l23-20020a02ccf7000000b003acde48bdc3sm2154706jaq.111.2023.02.22.10.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:55:14 -0800 (PST)
Date:   Wed, 22 Feb 2023 11:55:10 -0700
From:   Ross Zwisler <zwisler@google.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Linux BPF <bpf@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Maguire <alan.maguire@oracle.com>
Subject: Re: [PATCH v2] Documentation: bpf: Fix link to BTF doc
Message-ID: <Y/ZlDnioTn+hj03/@google.com>
References: <20230222083530.26136-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222083530.26136-1-bagasdotme@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 22, 2023 at 03:35:30PM +0700, Bagas Sanjaya wrote:
> Ross reported broken link to BTF documentation
> (Documentation/bpf/btf.rst) in Documentation/bpf/bpf_devel_QA.rst. The
> link in question is written using external link syntax, with the target
> refers to BTF doc in reST source (btf.rst), which doesn't exist in
> resulting HTML output.
> 
> Fix the link by replacing external link syntax with simply writing out
> the target doc, which the link will be generated to the correct HTML doc
> target.
> 
> Link: https://lore.kernel.org/linux-doc/Y++09LKx25dtR4Ow@google.com/
> Fixes: 6736aa793c2b5f ("selftests/bpf: Add general instructions for test execution")
> Reported-by: Ross Zwisler <zwisler@google.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> Changes since v1 [1]:
> 
>   * Reword patch description (I don't see external link semantics on
>     Sphinx documentation [2] when I submit v1).
>   * Drop the corresponding orphan target definition.
>   * Rebase on top of current bpf tree.
> 
> Ross, do you want to give a Reviewed-by or Acked-by?

Sure, thanks for the fix:
Acked-by: Ross Zwisler <zwisler@google.com>
