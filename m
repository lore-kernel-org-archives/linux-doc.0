Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2804C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 31 Mar 2022 15:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbiCaP3A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Mar 2022 11:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbiCaP3A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Mar 2022 11:29:00 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DB021BC64
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 08:27:12 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id x20so79872ybi.5
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 08:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cx/jntd5MtnfHbFJ6wQ9WBx8f0jFn2F4QMSwBKsbTL4=;
        b=mVdPagKPXbg/QhIYsGWCJRl0DmguSrdOwYYbfPnVMr1G3le8ZKSu5YjOddra9OGvI7
         H9MV7C9xeMksTMeKlBwk8ErYL7URvVvdSuLRw2UkyQ+3z+/O/CkQoyU0eJvmk5hR9cnK
         4WPPALU0TjTgMtGG4XODtRfqfxn6IWI+Nyd1X6vtR9Mr+tiZZkVmXliVn7kafwcCZtX2
         hOboxmDzcDt3etSfNC8CVZF+ZAlam97F+dEOljJfqRohQB9bnHL3oj5SyOUYb0sfZ+3Q
         sp3maiD42lL+bTsT89OqAzWD/e8MwLwGi77A/KNGlJnd8Tp7K0o32Wt9ZRt9GZTus2lh
         ga1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cx/jntd5MtnfHbFJ6wQ9WBx8f0jFn2F4QMSwBKsbTL4=;
        b=or8Qyya7h1zFcYiwL3liHqMzmjVt0VpEk8UdP1iJsMOBUdVOLATAixCRNF3kKOwPjI
         7Lqe6muwvQSCJmB676QJSl5nYvylOvvzKtS8oNVePhZGndsRWC7dAIXdzW0ADFL5/Tu9
         JDGhOxMJMvTXqCrXm8BTi4GDsqNrPBfq9bAxFNd6ExF050cRVIR+Kvwi+GZY7jB1ELNd
         hUw/iqaJPuwQJPa497ZHqi/xBNTwpy4ObXn+rfH9pNzjAimjJoD0gj/1yXjZ0CZLSHM+
         Arf99oZcCR/NehK/55n25jKQfhEmvYB82rVWpTQJpG0uHoNNmsjhZhq6b7cf+mb5IJSv
         gt1Q==
X-Gm-Message-State: AOAM532NsZXxLjaxO/oSm46u4OxgA86m41UHIhKoeXiroGUpDNKweT47
        L68L7f6guKRaTP8fLpUQirA0RbDC6VLZN+KhtXQHMQ==
X-Google-Smtp-Source: ABdhPJymbOBZrreddHigBujDJlMqXgN3WqeEPo+QbNHV7yN5YOS5zGWkPHsxrYDAlBtOVDuhB3tZPjTB/KwbHkmJyuc=
X-Received: by 2002:a25:cdca:0:b0:633:c810:6ca with SMTP id
 d193-20020a25cdca000000b00633c81006camr4561768ybf.261.1648740431209; Thu, 31
 Mar 2022 08:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220330153745.20465-2-songmuchun@bytedance.com> <202203312010.ct30oFE6-lkp@intel.com>
In-Reply-To: <202203312010.ct30oFE6-lkp@intel.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 31 Mar 2022 23:26:35 +0800
Message-ID: <CAMZfGtU7ctporSD=U-MGFX7H+x=12ZSSOe-ds5qyFQakg4po0w@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] mm: hugetlb_vmemmap: introduce STRUCT_PAGE_SIZE_IS_POWER_OF_2
To:     kernel test robot <lkp@intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        kbuild-all@lists.01.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 31, 2022 at 8:40 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Muchun,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on hnaz-mm/master]
> [also build test ERROR on mcgrof/sysctl-next linus/master next-20220331]
> [cannot apply to v5.17]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Muchun-Song/add-hugetlb_free_vmemmap-sysctl/20220330-234018
> base:   https://github.com/hnaz/linux-mm master
> config: ia64-randconfig-s031-20220331 (https://download.01.org/0day-ci/archive/20220331/202203312010.ct30oFE6-lkp@intel.com/config)
> compiler: ia64-linux-gcc (GCC) 11.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-dirty
>         # https://github.com/intel-lab-lkp/linux/commit/5164c566d4fbdb808689ee4552ed95eab421522e
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Muchun-Song/add-hugetlb_free_vmemmap-sysctl/20220330-234018
>         git checkout 5164c566d4fbdb808689ee4552ed95eab421522e
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 prepare
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/ia64/include/asm/thread_info.h:10,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/ia64/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:78,
>                     from include/linux/spinlock.h:55,
>                     from include/linux/kref.h:16,
>                     from include/linux/mm_types.h:8,
>                     from mm/struct_page_size.c:10:
> >> arch/ia64/include/asm/asm-offsets.h:1:10: fatal error: generated/asm-offsets.h: No such file or directory
>        1 | #include <generated/asm-offsets.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>    make[2]: *** [scripts/Makefile.build:127: mm/struct_page_size.s] Error 1
>    make[2]: Target '__build' not remade because of errors.
>    make[1]: *** [Makefile:1261: prepare0] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:226: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
>

It is a circular dependency issue, I'll fix this in the next version.
Thanks for your report.
