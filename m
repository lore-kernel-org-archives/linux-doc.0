Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30301C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 07:35:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345724AbiELHfW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 03:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345085AbiELHfV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 03:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0C20713F1DC
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652340919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+zsFil+xpvaoKN6a+jTI1zh8ma/r9ny4YN2UU7DGZeg=;
        b=fllsoleq3ityokjbDJG60sOZc8GEBpybaiJMoIfOAuk9gQt4SqIs07YRbF3kygMKkReW0F
        cphMFykVubLD9ChB3LkOED5eirtxTIlqmYhcwP7EbUDUcjQk/yOZQkZUOW104qnWD8RrhM
        lQ4ssX5979ohc0fI5jm/CcIbuRSDYjs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-DzCj7FMGN9-Zu05L7vIeXw-1; Thu, 12 May 2022 03:35:17 -0400
X-MC-Unique: DzCj7FMGN9-Zu05L7vIeXw-1
Received: by mail-wr1-f70.google.com with SMTP id p10-20020adfaa0a000000b0020c4829af5fso1718236wrd.16
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 00:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=+zsFil+xpvaoKN6a+jTI1zh8ma/r9ny4YN2UU7DGZeg=;
        b=pNQ6Dnrrw9hFXkvdE2yFBvxnHFruAKV3VT3NYxdMz4hUHtvBry8hpdASEBkrJQs1tT
         GLtoqUHtsvwKBoZKgEautykPfFSkN8AaVxbguMdnCK4sM6huazF5tL5WpMLF3M6cJrHj
         cySlON53BNQWQ7S+BG7tGdMk8jJ823fWxRFAeVJvPAKx136WV7JY4Qe1zbYZorIO6J/1
         SIS7bpUgv7TxyFoyKYoZkp4N18HRU6s6bTTxIuG+uLqxqLzseKQI/TTLnAHX2kg9gcro
         syEVNwiSb+kylom65HOOAG5QybGvMGDp0MZIjMKpYa/3qLWaOM8BEJp6BrWrss5rBzqH
         KzcA==
X-Gm-Message-State: AOAM532mF4c1yKfjN7DMXUL4FNtOQU/zAoUqu0h00EFhh0P9HlG+0eOb
        ULv2wfaXDWCCfxbou2pnD/KavBf2TAe91nJYWGBYJo+df++TrGgUjhgHO6iz+Nw27kcG7+xqBTc
        hlZ7I5eBnnXvcrEwu/8O4
X-Received: by 2002:a05:600c:a01:b0:395:c416:d82d with SMTP id z1-20020a05600c0a0100b00395c416d82dmr536186wmp.88.1652340916515;
        Thu, 12 May 2022 00:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxkHWUCG109V9dmEtXYn9ON6yKtJ2KB9KefS0ZtZFYwDhXPmkaHKz4k0WD7SYd3wb+b0eANA==
X-Received: by 2002:a05:600c:a01:b0:395:c416:d82d with SMTP id z1-20020a05600c0a0100b00395c416d82dmr536163wmp.88.1652340916271;
        Thu, 12 May 2022 00:35:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:d200:ee5d:1275:f171:136d? (p200300cbc701d200ee5d1275f171136d.dip0.t-ipconnect.de. [2003:cb:c701:d200:ee5d:1275:f171:136d])
        by smtp.gmail.com with ESMTPSA id y12-20020adff6cc000000b0020c5253d920sm3973325wrp.108.2022.05.12.00.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 00:35:15 -0700 (PDT)
Message-ID: <f9a45337-102a-6787-4cef-3ef799490f01@redhat.com>
Date:   Thu, 12 May 2022 09:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 1/4] mm: hugetlb_vmemmap: disable
 hugetlb_optimize_vmemmap when struct page crosses page boundaries
Content-Language: en-US
To:     Muchun Song <songmuchun@bytedance.com>, corbet@lwn.net,
        mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220509062703.64249-1-songmuchun@bytedance.com>
 <20220509062703.64249-2-songmuchun@bytedance.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220509062703.64249-2-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09.05.22 08:27, Muchun Song wrote:
> If the size of "struct page" is not the power of two but with the feature
> of minimizing overhead of struct page associated with each HugeTLB is
> enabled, then the vmemmap pages of HugeTLB will be corrupted after
> remapping (panic is about to happen in theory).  But this only exists when
> !CONFIG_MEMCG && !CONFIG_SLUB on x86_64.  However, it is not a conventional
> configuration nowadays.  So it is not a real word issue, just the result
> of a code review.
> 
> But we cannot prevent anyone from configuring that combined configure.
> This hugetlb_optimize_vmemmap should be disable in this case to fix this
> issue.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

