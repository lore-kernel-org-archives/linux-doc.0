Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81CBC001B0
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 20:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbjHKUwU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 16:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjHKUwT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 16:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375602D55
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 13:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691787097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T8aVoixM0xxO+gfsUyyhZDp4bChNMHCVGjLRMPROvP8=;
        b=ND/zo0nfbyrtRPuOhDKVA89mjhP7jQ/8rPPwXm/ydLLvYZAGMrS1jlCMXrP6qVqp/yMhdc
        YpXEJa/3fXPMNheY6Ng7/wjbHVTjv8AH7/bHk0VZjOb9V18azI9IKNFOCPdyjhoMCfb3Hi
        MdUgI563ajbPd2qA89pZLO7KZULDgdI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-fGIGEgg-PVaTDbL_WXAuIw-1; Fri, 11 Aug 2023 16:51:35 -0400
X-MC-Unique: fGIGEgg-PVaTDbL_WXAuIw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-637948b24bdso6297816d6.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 13:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691787095; x=1692391895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8aVoixM0xxO+gfsUyyhZDp4bChNMHCVGjLRMPROvP8=;
        b=elR+7DacN4Bcux+VO+IgHxsyd1iTQbQ/8WSEwOLjxSdivu0tdYuy9GgpuK6tb9IZLe
         Bjb0Pc+Dwpl1iGFQZnXpYy52fpUmCT4+jbcSOmfIMd4gQTRgGVOkXvP+Hu5l8sWhbW8V
         YYGtkpnVwGqprz9ca+SMbittlb1/Nh0lcBNDHk+H0E+dTDutElpa+ZBdF3/zHR3zkdwE
         Xom8Ulg5Dwtn5pmigL4gdCHNzD4fh4T3U8Lgw4xblPjhjapdiTCWY+/N0gzMOjtR8Wff
         jO0E3bsmwbkuHNkzEi/VwsIsw/7g68sMl8RigXGaVMWlLQWG6dDSsbsJ9xY/w6Ql35+c
         r7jA==
X-Gm-Message-State: AOJu0YxzRJg9K4TF5wTWX8XDe/MHtFcZN8u98RJkKwjSKJgdf5BQ6CN9
        cqV2d2d+9jC79fpLDjybLGVHSxDh5f+k9e84c5gbwm7Eul5+6a5rgH+WCorjUbxLJHgPW/RY7pk
        W9IOs2QbAJqTHylICC3Vf
X-Received: by 2002:a05:6214:3002:b0:63f:7d29:1697 with SMTP id ke2-20020a056214300200b0063f7d291697mr3549009qvb.2.1691787094966;
        Fri, 11 Aug 2023 13:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsPsGGsWG+AWvL3NdKiHHIMNHgjAVmUCW2ANACa31+gfznIUk9YVZFCFV5mZXxugGUYOyp/w==
X-Received: by 2002:a05:6214:3002:b0:63f:7d29:1697 with SMTP id ke2-20020a056214300200b0063f7d291697mr3548975qvb.2.1691787094629;
        Fri, 11 Aug 2023 13:51:34 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id f8-20020a0caa88000000b00637873ff0f3sm1479316qvb.15.2023.08.11.13.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:51:32 -0700 (PDT)
Date:   Fri, 11 Aug 2023 16:51:30 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Geffon <bgeffon@google.com>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Shuah Khan <shuah@kernel.org>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "T.J. Alumbaugh" <talumbau@google.com>,
        Yu Zhao <yuzhao@google.com>,
        ZhangPeng <zhangpeng362@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH mm-unstable fix] mm: userfaultfd: check for start + len
 overflow in validate_range: fix
Message-ID: <ZNafUoITDCuQOTMO@x1n>
References: <20230810192128.1855570-1-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810192128.1855570-1-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 10, 2023 at 12:21:28PM -0700, Axel Rasmussen wrote:
> A previous fixup to this commit fixed one issue, but introduced another:
> we're now overly strict when validating the src address for UFFDIO_COPY.
> 
> Most of the validation in validate_range is useful to apply to src as
> well as dst, but page alignment is only a requirement for dst, not src.
> So, split the function up so src can use an "unaligned" variant, while
> still allowing us to share the majority of the code between the
> different cases.
> 
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Closes: https://lore.kernel.org/linux-mm/8fbb5965-28f7-4e9a-ac04-1406ed8fc2d4@arm.com/T/#t
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

