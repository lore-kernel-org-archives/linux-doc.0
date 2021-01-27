Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C817AC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jan 2021 04:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CE5A2070E
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jan 2021 04:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239546AbhA0EqB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 23:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391941AbhA0BZT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jan 2021 20:25:19 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8F0C061788
        for <linux-doc@vger.kernel.org>; Tue, 26 Jan 2021 17:12:05 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id i7so429312pgc.8
        for <linux-doc@vger.kernel.org>; Tue, 26 Jan 2021 17:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h4YmZOf34leeTQFI3eVZ6RKnokT375TaRDpu5h/uKr0=;
        b=C22G2NnLTkRdn/mttyEGOMoXxuTI2raLaGT4eCAOpNLzguJMhhMmlz0hxMQ5gA2Rj9
         qTOfsm8D9kYABK9iahC0LW6TJZGFYlNTBRFUajK7C0nvPhjSPfRyPxrSld7uQxz5yEPk
         8gOyD6zIHU7KjQD4jKwUI3I0eCeE4pQBotxDMRCpTJ3onB6SaWW6YcvXP1A3os4mkSh+
         ZWrMmw2P91GRl1Zfse3yYl0EuS7KKt7X4SpR8JphUOejt6zAT3zvjROsAJ8vux6lw3Tb
         YXzV6lDO0Zfg+oWDaGv5DDtrpWLiCpE/+MzqEQ1j9jOyYE+FHvZUTvAXPton0sk+fASu
         ZqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h4YmZOf34leeTQFI3eVZ6RKnokT375TaRDpu5h/uKr0=;
        b=mj/EOOTsmGB0BZ7c6I4hV0A/IK2DwV7fSH1HOhR6wYC838Vi+gTh5EKtIayWcCaEEC
         EsDOHvrLVxvRYGRWNFAPPRF64ROFUczriuEuXED97YFiabeJJXJ675MrtqQqNP6E/F8w
         vauWd/8cjH66MwlBeaKlhg6dSJgnDA5k+drqJNmmRGndZTvvjTHF5OZirZPaYTij6UgH
         kGZj6R5I/Sj0Xcp88i2mIBAczIXx00LzPNvVoWEuMBUryDvWpBayPXCY1amjBuzLoOyJ
         oZpVRcecs2+63BZo6D/yASpuXL6FTYrq8UV11Two2BmFYEsTm/1LW3BVUezPOyyhkfnm
         5Osg==
X-Gm-Message-State: AOAM531CmzK/AtxZ0RCEwhd67PsYG2tuOGtRoXr8ne/U/GBHJRnr6NG4
        FWT9qSb0gmkjIobmzJPc+HDgsQ==
X-Google-Smtp-Source: ABdhPJyEFpCKvCKNjaSTTtBB/neKejTeHgWHIeRI3pSHLk8JaIe8gAIqZfxZc0fdfHzlPPO0ubyR3w==
X-Received: by 2002:a65:6895:: with SMTP id e21mr8328535pgt.240.1611709924537;
        Tue, 26 Jan 2021 17:12:04 -0800 (PST)
Received: from google.com ([2620:0:1008:10:1ea0:b8ff:fe75:b885])
        by smtp.gmail.com with ESMTPSA id gx21sm136854pjb.31.2021.01.26.17.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 17:12:03 -0800 (PST)
Date:   Tue, 26 Jan 2021 17:11:59 -0800
From:   Vipin Sharma <vipinsh@google.com>
To:     Tejun Heo <tj@kernel.org>
Cc:     David Rientjes <rientjes@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Singh, Brijesh" <brijesh.singh@amd.com>,
        "Grimm, Jon" <jon.grimm@amd.com>,
        "Van Tassell, Eric" <eric.vantassell@amd.com>, pbonzini@redhat.com,
        lizefan@huawei.com, hannes@cmpxchg.org, frankja@linux.ibm.com,
        borntraeger@de.ibm.com, corbet@lwn.net, joro@8bytes.org,
        vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        gingell@google.com, dionnaglaze@google.com, kvm@vger.kernel.org,
        x86@kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v4 1/2] cgroup: svm: Add Encryption ID controller
Message-ID: <YBC937MFGEEiI63o@google.com>
References: <YAJsUyH2zspZxF2S@google.com>
 <YAb//EYCkZ7wnl6D@mtj.duckdns.org>
 <YAfYL7V6E4/P83Mg@google.com>
 <YAhc8khTUc2AFDcd@mtj.duckdns.org>
 <be699d89-1bd8-25ae-fc6f-1e356b768c75@amd.com>
 <YAmj4Q2J9htW2Fe8@mtj.duckdns.org>
 <d11e58ec-4a8f-5b31-063a-b6b45d4ccdc5@amd.com>
 <YAopkDN85GtWAj3a@google.com>
 <1744f6c-551b-8de8-263e-5dac291b7ef@google.com>
 <YBCRIPcJyB2J85XS@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBCRIPcJyB2J85XS@slm.duckdns.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 26, 2021 at 05:01:04PM -0500, Tejun Heo wrote:
> The whole thing seems pretty immature to me and I agree with you that coming
> up with an abstraction at this stage feels risky.
> 
> I'm leaning towards creating a misc controller to shove these things into:
> 
> * misc.max and misc.current: nested keyed files listing max and current
>   usage for the cgroup.
> 
> * Have an API to activate or update a given resource with total resource
>   count. I'd much prefer the resource list to be in the controller itself
>   rather than being through some dynamic API just so that there is some
>   review in what keys get added.
> 
> * Top level cgroup lists which resource is active and how many are
>   available.

Sounds good, we can have a single top level stat file

misc.stat
  Shows how many are supported on the host:
  $ cat misc.stat
  sev 500
  sev_es 10

If total value of some resource is 0 then it will be considered inactive and
won't show in misc.{stat, current, max}

We discussed earlier, instead of having "stat" file we should show
"current" and "capacity" files in the root but I think we can just have stat
at top showing total resources to keep it consistent with other cgroup
files.

Thanks
Vipin

