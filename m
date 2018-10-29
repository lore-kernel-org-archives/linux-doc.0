Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 96A737D8BB
	for <lwn-linux-doc@archive.lwn.net>; Mon, 29 Oct 2018 16:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbeJ3BlS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 29 Oct 2018 21:41:18 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:46578 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbeJ3BlQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Oct 2018 21:41:16 -0400
Received: by mail-pg1-f176.google.com with SMTP id m9-v6so1479033pgl.13
        for <linux-doc@vger.kernel.org>; Mon, 29 Oct 2018 09:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=C+Rs4o3BXVT0ax4Boh47WCS59+Mua9waLchkNV67xPc=;
        b=MTFDQO7ejSDQQzuFjnhL68aww82CFqI6/LYzLGYzDut7MCztHfajNUN12DTXdMKY0q
         L5Zt+BkGPRNq1aaGNd0QUGRt8lkzU5eNPNw7cuZaED6oX6nDyTMYrFmHsCwNFlyvc8WC
         OwQu7nVdgWLlpnjkD6NKWodbg0yQkPVCxKZ9IlUfiCtRhA0s9dnIEdP3EfX0spVtASyx
         MZpp0OBPczCnSdDYKDK26GDQhH7NyLdHYC3AicCsxrPdcIXsqlH+So5gi0Kb2emDwy3c
         kyTmYdwQKLHS53cdueKo1BlFCwFlq8MAEHtxgOb3EZ/CLpgJ8QZ1hdhxnRmpBLiy4JVK
         sNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=C+Rs4o3BXVT0ax4Boh47WCS59+Mua9waLchkNV67xPc=;
        b=StsfWFE9lMq20FlHJ6ieHt86U2SiH5sfBUexcj6mPrvnbhiNIzvSO+8EpfGtC4YucO
         kQhrSXDDw9aLNLrrBPNdH3YDv7LFFtx5lg0p3Lzjs46xrqcyE5B/ZOFxAHLtv1U2vzvm
         CIkMmn6gGgI+8O3kbWPhOZODgTc5izPMcc97LJ5LTR+mRDuEZBJpI07mDKRNAqa/Lwak
         tZzhxvfaUf0c4sYpOtzxOqOa46s3TyfkkI+fkOad87tIRPpjO2GHa7lZHdursXvbyStR
         EiScS4pAaAsn1HPZ48FYnySvi5GcYhG2pJkeNEFRJij1Y98pv6SJ7N13Mo3sRTmZSO56
         x+Vw==
X-Gm-Message-State: AGRZ1gIgkwApTlZMpvZvIWzX9cUashgPwOO2BLnK7H6r3wP9yBVFd/EN
        zOW2LTwSikA9qPgCz0Yt4dmNMQ==
X-Google-Smtp-Source: AJdET5exAcM5eGzbwkQuv4PSNn6rF8fkPdAai1QNuC26eOsWlkizcXwP6Ye+/hRXDeZb/zeHeM/XHg==
X-Received: by 2002:a63:24f:: with SMTP id 76-v6mr14327725pgc.67.1540831910928;
        Mon, 29 Oct 2018 09:51:50 -0700 (PDT)
Received: from paullawrence.mtv.corp.google.com ([2620:0:1000:1601:da51:dc8c:708a:5253])
        by smtp.gmail.com with ESMTPSA id 23-v6sm4062159pgp.77.2018.10.29.09.51.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Oct 2018 09:51:50 -0700 (PDT)
Subject: Re: [dm-devel] [RFC] dm-bow working prototype
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, linux-doc@vger.kernel.org,
        kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, dm-devel@redhat.com,
        Shaohua Li <shli@kernel.org>
References: <20181023212358.60292-1-paullawrence@google.com>
 <20181023221819.GB17552@agk-dp.fab.redhat.com>
 <296148c2-f2d9-5818-ea76-d71a0d6f5cd4@google.com>
 <alpine.LRH.2.02.1810241514310.4080@file01.intranet.prod.int.rdu2.redhat.com>
 <4a934593-1bd1-be5f-35c0-945c42762627@google.com>
 <alpine.LRH.2.02.1810261558460.28906@file01.intranet.prod.int.rdu2.redhat.com>
From:   Paul Lawrence <paullawrence@google.com>
Message-ID: <fba91b2e-4b2e-8daf-ff64-a12c9139cada@google.com>
Date:   Mon, 29 Oct 2018 09:51:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1810261558460.28906@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> The snapshot target could be hacked so that it remembers space trimmed
> with REQ_OP_DISCARD and won't reallocate these blocks.
>
> But I suspect that running discard over the whole device would degrade
> performance more than copying some unneeded data.
>
> How much data do you intend to backup with this solution?
>
>
We are space-constrained - we will have to free up space for the backup 
before we apply the update, so we have to predict the size and keeping 
usage as low as possible is thus very important.

Also, we've discussed the resizing requirement of the dm-snap solution 
and that part is not attractive at all - it seems it would be impossible 
to guarantee that the resizing happens in a timely fashion during the 
(very busy) update cycle.

Thanks everyone for the insights, especially into how dm-snap works, 
which I hadn't fully appreciated. At the moment, and for the above 
reasons, we intend to continue with the dm-bow solution, but do want to 
keep this discussion open. If anyone is going to be at Linux Plumbers, 
I'll be presenting this work and would love to chat about it more.
