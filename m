Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFFECCA47A
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jun 2022 19:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243232AbiFNTnn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Jun 2022 15:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348261AbiFNTnl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jun 2022 15:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2EC6C2A729
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 12:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655235820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0kBJ9jVSmrZsPatTagpukwacW+JAMXi3G+ttyb9CVmA=;
        b=MyiNEDZYK9V2SLrKcBGEeXweuETpKR2OYWzdBF244P6uyu9N45ibDrgDGqtk3oAXDqp8IE
        R3SBCVAlcip+SKPCGnuB/04kBQSz3JkINfXwBfeWYpGEYxJ0Lq2lEDDM0XcAPj1Srt4nUG
        dDzOzlQ8HBP54XvLg/in2splZSVCKF8=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-yyKqtxJjPmGKPfyJgMed0w-1; Tue, 14 Jun 2022 15:43:38 -0400
X-MC-Unique: yyKqtxJjPmGKPfyJgMed0w-1
Received: by mail-il1-f198.google.com with SMTP id j5-20020a922005000000b002d1c2659644so7161573ile.8
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 12:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0kBJ9jVSmrZsPatTagpukwacW+JAMXi3G+ttyb9CVmA=;
        b=uk4iWeOfbAExW9h+Q5QNjB8UPmVf65qqBq9dJeVptVoc35JtsnKfSs2uGYCqdSdl8m
         S9BkOxv59ifRzreNZbyqwqaVMmxurwQspBZ3OhE4Hr28Feja+i/ytq5RysjZ+swA18dn
         sMd3lNGjCp63wNAJrd64achOfFm5I3qz2uhrfdyy5nmSZcubcB19d672VpVuw+DKw4iX
         ykZaLAGFb5JxGm2N921oI8fEctg3ytopCgvInD9xTLy/3d3TaEdbwkAgxBInlna5c9UW
         tgdfk7weCwD+oK7oBbgTZ/p9xdU6TRC37PP9doV/D0YhzkZ6lGM/K0ujuFP2GTdbfMju
         3AnA==
X-Gm-Message-State: AOAM533fzLNAZdWV5P/Vs4FydzCLzno/xkQhVIDuIK3uGgjEqGXd2ULQ
        jc/tdrUNQ/MvU8uLzOLLm2WPV+mWEn7KfCxVatp3u97Q6J6/sh2APRbVgECzRA+1CrHSsi1zYmk
        dnlfSHviB7k/X2Du8+rin
X-Received: by 2002:a05:6638:2711:b0:332:1030:d6c2 with SMTP id m17-20020a056638271100b003321030d6c2mr3742579jav.263.1655235818126;
        Tue, 14 Jun 2022 12:43:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyka9HjOgMy6b8pnRt/A/embx73zjB9YhZLRYD1IRFIZfVzSN4bJjcwuFQgiPhot6lgYqIMuA==
X-Received: by 2002:a05:6638:2711:b0:332:1030:d6c2 with SMTP id m17-20020a056638271100b003321030d6c2mr3742560jav.263.1655235817943;
        Tue, 14 Jun 2022 12:43:37 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id y11-20020a02904b000000b0032e6f0d3796sm5225276jaf.145.2022.06.14.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 12:43:37 -0700 (PDT)
Date:   Tue, 14 Jun 2022 15:43:34 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Charan Teja Reddy <charante@codeaurora.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
        Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        zhangyi <yi.zhang@huawei.com>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 6/6] selftests: vm: add /dev/userfaultfd test cases to
 run_vmtests.sh
Message-ID: <Yqjk5qEvNk9l72P3@xz-m1.local>
References: <20220601210951.3916598-1-axelrasmussen@google.com>
 <20220601210951.3916598-7-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220601210951.3916598-7-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 01, 2022 at 02:09:51PM -0700, Axel Rasmussen wrote:
> This new mode was recently added to the userfaultfd selftest. We want to
> exercise both userfaultfd(2) as well as /dev/userfaultfd, so add both
> test cases to the script.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

