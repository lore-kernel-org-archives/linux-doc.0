Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66223C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  2 Jul 2022 07:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbiGBHkI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 2 Jul 2022 03:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbiGBHkI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Jul 2022 03:40:08 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CE92018B
        for <linux-doc@vger.kernel.org>; Sat,  2 Jul 2022 00:40:06 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id c6-20020a17090abf0600b001eee794a478so8565622pjs.1
        for <linux-doc@vger.kernel.org>; Sat, 02 Jul 2022 00:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=86ivI2kTplNSggLHC7HK9uwoRfFFJ0gxKxjC/jAY+Ys=;
        b=dwv38yQIHbTdA0OgqGmwqNjiGod6x/VVWvZOWZk2R3GlN5HUNmenXqFdAJ6PbuylF+
         iCWqGdp7sIcq0JITW8Ruh3iYLHGkHnA7kLSbTJuUJFDkHFKQNL1ozSl5NKWDWYgM5LXi
         uCtEm6QddTpFuTtPcwEYCwgUbt9jAwrLXIDK5VUBjPtrH3d+ZsZtWSr4oGoqcD5sJVyK
         +8EEwLnqWNHtY+jOTrq9XWhkwQW3wkCbVceMH3q6qAA5RmK9m5V20t6hXq7WPE71b2eg
         Moq+Bde4PnqdDcdCfI0eS1+PoVo74BZfqghpyYZIbxTqep1QLpoVBmdwHMcHWNxw5lx5
         tOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=86ivI2kTplNSggLHC7HK9uwoRfFFJ0gxKxjC/jAY+Ys=;
        b=kXko/NL8UXfal13zxraABO9KaLzULKr6S6eB8LjzS7jUH+o3XL4Ys7x/fxYutm8qld
         8r/BqmCwRWvEa4mndVioA+aXWZKHJimOs0qSwT/E7koPvzvWwzcn2rYLGa/OkdjwuPGf
         m0mTMdbZ0JHR697I66CLSY4G1ROIfzMTCPMR9QuRT6YHJrPT5t7gtzTyB1H5lJiVjlev
         UAUXwfIeLkF81hkFeC/4Gs+HVjrksweouS4w2V4aTIjYHEbMivR4b21lvTWglhZXowzl
         c45qFqaTkp/W7YZOHwrfzVP+VdAr+NIOar/mtX4IZ01Z8jgqg2h8LXtXawGaX49qboo9
         C3nA==
X-Gm-Message-State: AJIora8Uaw3g1oxL5XgiELZGSLjprWeSwI337n7LLlK9v1JgNWo+7Jex
        R1OkULE/zoGZ0EBN6jrqR406kiOrvZC1cQ==
X-Google-Smtp-Source: AGRyM1tUXVAA49bCcGTyyalI4mYrruhy841ebQTwx3VE1e8qsbL2mxih5nFoqSeAQpGzXjfG+oUGYA==
X-Received: by 2002:a17:902:ef92:b0:16a:1ef1:22db with SMTP id iz18-20020a170902ef9200b0016a1ef122dbmr23593237plb.2.1656747606531;
        Sat, 02 Jul 2022 00:40:06 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-78.three.co.id. [180.214.233.78])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902d58500b0016a1096bc95sm16721883plh.12.2022.07.02.00.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 00:40:05 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 91DFF1037E5; Sat,  2 Jul 2022 14:40:01 +0700 (WIB)
Date:   Sat, 2 Jul 2022 14:40:00 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Ben Gardon <bgardon@google.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Matlack <dmatlack@google.com>,
        Peter Xu <peterx@redhat.com>, linux-doc@vger.kernel.org
Subject: Re: [linux-next:master 4541/7282] htmldocs:
 Documentation/virt/kvm/api.rst:8217: WARNING: Unexpected indentation.
Message-ID: <Yr/2UKna9f9b2O/D@debian.me>
References: <202207021352.PpKTUY8V-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202207021352.PpKTUY8V-lkp@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 02, 2022 at 01:07:39PM +0800, kernel test robot wrote:
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> Documentation/virt/kvm/api.rst:8217: WARNING: Unexpected indentation.
> 
> vim +8217 Documentation/virt/kvm/api.rst
> 
>   8211	
>   8212	:Capability KVM_CAP_VM_DISABLE_NX_HUGE_PAGES
>   8213	:Architectures: x86
>   8214	:Type: vm
>   8215	:Parameters: arg[0] must be 0.
>   8216	:Returns 0 on success, -EPERM if the userspace process does not
> > 8217		 have CAP_SYS_BOOT, -EINVAL if args[0] is not 0 or any vCPUs have been
>   8218		 created.
>   8219	
> 

I think this is fixed by this series [1].

[1]: https://lore.kernel.org/linux-doc/20220627095151.19339-1-bagasdotme@gmail.com/

-- 
An old man doll... just what I always wanted! - Clara
