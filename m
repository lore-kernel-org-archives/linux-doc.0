Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F057E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 May 2019 23:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfENXZO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 May 2019 19:25:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34117 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfENXZN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 19:25:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id n19so309346pfa.1
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2019 16:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Jy0W2AOE8X2G5DhaX0aRTRku/ISFojI4Jx+xxzmku0=;
        b=MQyJklXnbo6c96JLKB7QksEJHkSpFBHsrJS476t6XQjCpcmGuNq+IaehI46rq7cwoT
         5/83MudsTcPwLAbJQi+E/WmVnctS8ig6t3ILH9hcfgEVCDySDpa/WBKmvGuT+TW4+eQ/
         S0mwkFbAjmxc5fsPkl2wQBiW7k+GUPaiQJ2GyWSoGs0PuW8MdgL5cUCvBhefg1tJKEs1
         qTdCbxKYYLs1akDBll4MhMba7K4eHfr7lI87DpyzfvZwtlscx4zjYkzIKYzvyEhxi2i1
         yOVJ7B7mk2BP2yJFkPIlDEqeXR3rL1YA08yj2q7YWAYVfzf7Fawslh7NINITcHYKajd3
         6xGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Jy0W2AOE8X2G5DhaX0aRTRku/ISFojI4Jx+xxzmku0=;
        b=af3eyhp8gaOQx9LyWAVNA5AYuUG2tM30p/WYfCk8uxmRyRGd639M4mRwdkOhc4xRwK
         KcTP5EDqGYZ0GFA02ciVJBduhDA3LnYNWOZUHBJXkLmc3ZUz+fjV8Xwqbf52KdqKUdXj
         KqqiRYuE2Mj2w2+A9lFIJy9NMdG9Hmv4AkN6TyhWaTVDX+sCLMmMqHGSaSkb6AVI/idh
         260rlYLLCKoM84KC43aAcoyfxsuy7uQeVi5vIZ1dS0B7Jb2++wNrlHB2IJ1Lt6T3Z1F0
         ErRB78CeRR0qHHiuCqQOHPsXQrDzKhLijXKTDQ3S0yZSHRmggvaJ6RETdAdQ393vzC/3
         jYPw==
X-Gm-Message-State: APjAAAWNmi+ZnUJV3L+Yr/RBOxSrj70ByXyaLxQ2pW0HJVKsiID7qVp/
        vNcS2lt8h4/DxYknWr0hF/gCiQ==
X-Google-Smtp-Source: APXvYqwFT36xTe7xIV4JHHBk0GWoU89u5XYlVl2IpbZ1GuRL1xHoENSFO5jHtT0PWOMWGfK71tbjWA==
X-Received: by 2002:a62:6585:: with SMTP id z127mr4445645pfb.179.1557876312369;
        Tue, 14 May 2019 16:25:12 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:2:d714:29b4:a56b:b23b])
        by smtp.gmail.com with ESMTPSA id 2sm205811pgc.49.2019.05.14.16.25.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 16:25:11 -0700 (PDT)
Date:   Tue, 14 May 2019 16:25:06 -0700
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com
Subject: Re: [PATCH v4 16/18] MAINTAINERS: add entry for KUnit the unit
 testing framework
Message-ID: <20190514232506.GA16788@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-17-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514221711.248228-17-brendanhiggins@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 14, 2019 at 03:17:09PM -0700, Brendan Higgins wrote:
> Add myself as maintainer of KUnit, the Linux kernel's unit testing
> framework.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c2fce72e694f..8a91887c8d541 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8448,6 +8448,17 @@ S:	Maintained
>  F:	tools/testing/selftests/
>  F:	Documentation/dev-tools/kselftest*
>  
> +KERNEL UNIT TESTING FRAMEWORK (KUnit)
> +M:	Brendan Higgins <brendanhiggins@google.com>
> +L:	linux-kselftest@vger.kernel.org
> +L:	kunit-dev@googlegroups.com
> +W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
> +S:	Maintained
> +F:	Documentation/kunit/

Dang it! I forgot to update the documentation path...

Will fix in next revision.

> +F:	include/kunit/
> +F:	kunit/
> +F:	tools/testing/kunit/
> +
>  KERNEL USERMODE HELPER
>  M:	Luis Chamberlain <mcgrof@kernel.org>
>  L:	linux-kernel@vger.kernel.org
> -- 
> 2.21.0.1020.gf2820cf01a-goog
> 
