Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3414AC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Mar 2022 10:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346765AbiCXKHZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Mar 2022 06:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235422AbiCXKHY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Mar 2022 06:07:24 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10BA9F6D9
        for <linux-doc@vger.kernel.org>; Thu, 24 Mar 2022 03:05:52 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2e6650cde1bso44953727b3.12
        for <linux-doc@vger.kernel.org>; Thu, 24 Mar 2022 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bv5JJorVRmW6dCmxnx8S5NTjYP3/PgiSEly+T//n5I=;
        b=PETwV25Y0Zjl0fzvfBVhFmYZhz86bj+JjkCdM6nwdhPHtZxOfBJvM5FgoGKm+8Iey5
         B1lC7TdYxhe+tXa6SAk4+oxpw2PaBw5rniAwdx7sqP+KdYJMI3brvXmnntobIDlvRk98
         td5Qtw+qcZbT/fsL1amHR9cYXKyZ6n123Eo6dn+gjbLY1J+e4uBTM28G8HSoNLjjwkjZ
         Q0XzttG9Ck5mnHF/+SKqq9NjkIxVY6vwUyeSvonUlWeI/JX2q1Yn7oxL3pQlPxQT9Q4q
         SJsHCoW2WxnQSB7QVWMyGXzV3AUwiznSMOV5IQ3Lm+JjxgNQaKHkETXsu16t9UImjD5D
         zwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bv5JJorVRmW6dCmxnx8S5NTjYP3/PgiSEly+T//n5I=;
        b=DjNkpD+N4nlQdg8rdUc8R8zeAa1GSsNp78aySLRABxkCqmelQaIgmNGCULvggeh4QF
         M6BSECrCZ2fsoOVOXu0ajNAJ2su+YqMVvRi/k/UBPiF29PpKyyOMJgJx2Tna47E+MKpz
         bcR4bvPTa7thTIyRyzRC+oN4DoMxlhM88TDqnBa0PuH/uIKfouFerOs6LIKnW2xO6FjQ
         oTL2F6liJ1rmEOrJc6tBmUkURUtK3tHmatHcOBLTYXURpY9VvK2IcQmATvjLt61/O0Jx
         UNSXcTxAiYmW37dyKSg2Rz6gbuuFLVtsU92whp3IaGb4yk5+u2jvbkYNCTNvcZl8Edxc
         NWZg==
X-Gm-Message-State: AOAM530vn3N8eImNLBuS5q2JZsGti5UK3d0z+VAXQMcUfvgJ4w70lLhW
        /0x4kmS2V7kp1gUwhek+taJOPw99aXGI2eA19CEhCA==
X-Google-Smtp-Source: ABdhPJzuzNNBFuEu6Lvk2gVmyx0qgGn0g1wagWz2hVnsvNpcbTCPj7RAzR96bGe8pUt1QfEyqmy7w7jieldQx6vmQKw=
X-Received: by 2002:a0d:ccca:0:b0:2e6:2b53:3f16 with SMTP id
 o193-20020a0dccca000000b002e62b533f16mr3916253ywd.35.1648116352160; Thu, 24
 Mar 2022 03:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220323125523.79254-2-songmuchun@bytedance.com>
 <202203240546.MHJzsBaO-lkp@intel.com> <20220323151311.289dd405440932e1d6d80f30@linux-foundation.org>
 <7872f093-e26d-3403-d6cf-c6c1a782242b@intel.com>
In-Reply-To: <7872f093-e26d-3403-d6cf-c6c1a782242b@intel.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 24 Mar 2022 18:05:15 +0800
Message-ID: <CAMZfGtWcTrK_=953jy-3mrpG+U5-ZySoKiyox+-p4u1cK17nyw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] mm: hugetlb_vmemmap: introduce STRUCT_PAGE_SIZE_IS_POWER_OF_2
To:     "Chen, Rong A" <rong.a.chen@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        kernel test robot <lkp@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>, kbuild-all@lists.01.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 24, 2022 at 5:40 PM Chen, Rong A <rong.a.chen@intel.com> wrote:
>
>
>
> On 3/24/2022 6:13 AM, Andrew Morton wrote:
> > On Thu, 24 Mar 2022 06:06:41 +0800 kernel test robot <lkp@intel.com> wrote:
> >
> >> Hi Muchun,
> >>
> >> Thank you for the patch! Yet something to improve:
> >>
> >> [auto build test ERROR on hnaz-mm/master]
> >> [also build test ERROR on linus/master next-20220323]
> >> [cannot apply to mcgrof/sysctl-next v5.17]
> >> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://git-scm.com/docs/git-format-patch]
> >>
> >> url:    https://github.com/0day-ci/linux/commits/Muchun-Song/add-hugetlb_free_vmemmap-sysctl/20220323-205902
> >> base:   https://github.com/hnaz/linux-mm master
> >> config: arc-randconfig-r043-20220323 (https://download.01.org/0day-ci/archive/20220324/202203240546.MHJzsBaO-lkp@intel.com/config)
> >> compiler: arc-elf-gcc (GCC) 11.2.0
> >> reproduce (this is a W=1 build):
> >>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>          chmod +x ~/bin/make.cross
> >>          # https://github.com/0day-ci/linux/commit/64211be650af117819368a26d7b86c33df5deea4
> >>          git remote add linux-review https://github.com/0day-ci/linux
> >>          git fetch --no-tags linux-review Muchun-Song/add-hugetlb_free_vmemmap-sysctl/20220323-205902
> >>          git checkout 64211be650af117819368a26d7b86c33df5deea4
> >>          # save the config file to linux build tree
> >>          mkdir build_dir
> >>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc prepare
> >>
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>>> cc1: fatal error: cannot open 'kernel/bounds.s' for writing: No such file or directory
> >
> > It would take a lot of talent for Munchun to have caused this!
> >
> > Methinks you just ran out of disk space?
>
> Hi Andrew,
>
> Thanks for the reply, I tried to apply this patch to the head of
> mainline and I still can reproduce the error in my local machine:
>
> $ wget -q -O -
> https://lore.kernel.org/lkml/20220323125523.79254-2-songmuchun@bytedance.com/raw
> | git apply -v
> $ mkdir build_dir && wget
> https://download.01.org/0day-ci/archive/20220324/202203240546.MHJzsBaO-lkp@intel.com/config
> -O build_dir/.config
> $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross
> O=build_dir ARCH=arc olddefconfig prepare
> make --keep-going CONFIG_OF_ALL_DTBS=y CONFIG_DTC=y
> CROSS_COMPILE=/home/nfs/0day/gcc-11.2.0-nolibc/arc-elf/bin/arc-elf-
> --jobs=72 O=build_dir ARCH=arc olddefconfig prepare
> ...
> cc1: fatal error: cannot open 'kernel/bounds.s' for writing: No such
> file or directory
> compilation terminated.
> make[3]: *** [../scripts/Makefile.build:121: kernel/bounds.s] Error 1
> make[3]: Target '__build' not remade because of errors.
> make[2]: *** [../Makefile:1191: prepare0] Error 2
> make[2]: Target 'prepare' not remade because of errors.
>

I'll look at this, thanks for your report.
