Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D077C61DA4
	for <linux-doc@archiver.kernel.org>; Thu,  2 Feb 2023 19:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbjBBTji (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 14:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbjBBTjh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 14:39:37 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784D836FED
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 11:39:32 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id v17so4550574lfd.7
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 11:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JmnIaySd7zoAM6xF2ibXT8yo+UTOpvQnMVr9b5O/7+w=;
        b=ca1h9KkMFNsKgO7Ao0NeYlaifxp7NzGcaaakgNFyQLMxBSXDHTcSanf/uonLuKRR18
         lO7gVsm341hb9Nhg1BLsB8gPuvWRYHLOlq9HV87cUF6Vj8wjTPtsHShRpe/Vd30GyM78
         DjJAMh6ZqNcvDd+rLB79O+fNMlUiqjmmCA6so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmnIaySd7zoAM6xF2ibXT8yo+UTOpvQnMVr9b5O/7+w=;
        b=s95yfqFFQ3zqa3dmiMxI+7KRTZ05/WF3nDu1RWQT4H3yGJdC6sRbBeYc0JpcPTMUuM
         LHZ6PGqLyXKoDXcCWcq8Zt6AEzDYZNh5BHQVxPtdB0CFazfRE374mJCn+KBHU4XsrHwV
         r5DyseZZCBfSMFuVS93uYaEJM0XpalAoy7HAhqLaKK0wrhNBQEaCWenFnpX/fJOw8gtx
         DkRJy5br/dkVpOpqB+qV09v08TiBMRSUuxCqmBGptPQbBNZKoFasxEUTlWfnAGnodxRm
         F1fltsE87VNKDyMO8rUg+8vwQ8PtrOskXollTnnFetEs1k9m9fuvMic47ShaSu/nBnbe
         jU3g==
X-Gm-Message-State: AO0yUKX8POsYQOeFattjhqiTD+fw0vQt/BNe7aPoKGf7a93PgIJeF+zp
        pEoRJ1iptP/I8t1rkyASRUig8A8KtFHxqFsnJ9Q=
X-Google-Smtp-Source: AK7set9pAC5y9+HKvZEJQ7uD6yRRA36VFKb1R1S49agdpcKTlfoiuIzsF9fiHVATSp5CWT8gLvY+sA==
X-Received: by 2002:ac2:522f:0:b0:4b5:9138:145b with SMTP id i15-20020ac2522f000000b004b59138145bmr1782488lfl.14.1675366770454;
        Thu, 02 Feb 2023 11:39:30 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id a6-20020a19ca06000000b004d57d1c6ee7sm25450lfg.248.2023.02.02.11.39.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 11:39:30 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id o5so3050373ljj.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 11:39:29 -0800 (PST)
X-Received: by 2002:a17:906:f109:b0:882:e1b7:a90b with SMTP id
 gv9-20020a170906f10900b00882e1b7a90bmr2112186ejb.187.1675366759217; Thu, 02
 Feb 2023 11:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20230202145030.223740842@infradead.org>
In-Reply-To: <20230202145030.223740842@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 2 Feb 2023 11:39:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiF6y7CwR1P5_73aK2f=x=RZjwgh3sgeO3Mczv4XcDc8g@mail.gmail.com>
Message-ID: <CAHk-=wiF6y7CwR1P5_73aK2f=x=RZjwgh3sgeO3Mczv4XcDc8g@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Introduce cmpxchg128() -- aka. the demise of cmpxchg_double()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     corbet@lwn.net, will@kernel.org, boqun.feng@gmail.com,
        mark.rutland@arm.com, catalin.marinas@arm.com, dennis@kernel.org,
        tj@kernel.org, cl@linux.com, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, joro@8bytes.org, suravee.suthikulpanit@amd.com,
        robin.murphy@arm.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
        Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org,
        iommu@lists.linux.dev, linux-arch@vger.kernel.org,
        linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 2, 2023 at 7:29 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
>  - fixed up the inline asm to use 'u128 *' mem argument so the compiler knows
>    how wide the modification is.
>  - reworked the percpu thing to use union based type-punning instead of
>    _Generic() based casts.

Looks lovely to me. This removed all my concerns (except for the
testing one, but all the patches looked nice and clean to me, so
clearly it must be perfect).

                Linus
