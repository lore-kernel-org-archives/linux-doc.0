Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3250C77B7A
	for <linux-doc@archiver.kernel.org>; Thu, 25 May 2023 16:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbjEYQXI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 May 2023 12:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239614AbjEYQXH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 May 2023 12:23:07 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D523C13A
        for <linux-doc@vger.kernel.org>; Thu, 25 May 2023 09:23:05 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-51b743d592dso838506a12.0
        for <linux-doc@vger.kernel.org>; Thu, 25 May 2023 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685031785; x=1687623785;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/HdBiYHXb0t/eYfGc/stu36RyqTGN6i7PmYRLl38sM4=;
        b=Ms1EfGgkWfjHyAEkYKEt1EK1c0RFGrAyO7YlB5VADfKnqvkE/3Q90TA52bwGi+C54/
         4z+1IXDYFa69QOgk9+iEezTtPmTRTiYRMdTcWoaEhiekfJZ5qanq/KVZ93a35S65Jy1j
         WpqPDkqSkNnqysAT/nWNmhFVZwb1W5f3wWjc82SXAd7yE53jFxhChegmF2f1mZSgvdYT
         2PjlMucBTIcEebTxQCHwZcOH/9IqHQZmKPDhGcGs2h8YJtbrrgclLGN8ttUXYsVvTJky
         PZgij3I8YJ2FZ/t6PC1NhWFH/yMM80DI+lHqqpwW/F0KchdCmxRw0s/1euxOMEabHbgj
         fvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685031785; x=1687623785;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HdBiYHXb0t/eYfGc/stu36RyqTGN6i7PmYRLl38sM4=;
        b=Gy1ecG78hx6wxCYjAsxp8FBR4v1ouF5iQWVYZJt81jrZDdvx+tpVGZE23ljFDp8HCr
         lQwpTKjaMQ8BYo1KQJ+ZFz3yUdrg62igLkzIJzJ2/SdDi9IyQeZKMmyZvFXAWCysfWqB
         vOoDjE3V+QZgVhhSEjDbsJQ4jCTBdJMl0mlISRk+fGVvEF2ekGzs8lRlQQ7+34AjrxQT
         iNCnWKQTfAcSoX9RbT2nNA8vem0RknKIspqF2CECGeDKMmHA7ZPrB5K/qzETPEoiGCMi
         So7hxERBCtTyyr3e3ANJk18mjCS14fgp62CKnh6Qqqh+lfHh7yTrnVgrQkouFUWqslvI
         0/SA==
X-Gm-Message-State: AC+VfDy7JxHfxyi3T70T1z+Otju+oXrE5iIz0gXe8zJfj+b3TFgGky0f
        uWO9OnO2qU8ybhDCcG/ef8UcoVKKPRg=
X-Google-Smtp-Source: ACHHUZ4eMNRNmPGVNI0d/g62J6qYg9y69eF3HSc+XqALVPDfQutlySlqNuJtdiVOrOZz4FeES2slvW+AmvQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:e847:0:b0:524:fba4:fd51 with SMTP id
 a7-20020a63e847000000b00524fba4fd51mr741353pgk.3.1685031785184; Thu, 25 May
 2023 09:23:05 -0700 (PDT)
Date:   Thu, 25 May 2023 09:23:03 -0700
In-Reply-To: <20230420104622.12504-2-ljrcore@126.com>
Mime-Version: 1.0
References: <20230420104622.12504-1-ljrcore@126.com> <20230420104622.12504-2-ljrcore@126.com>
Message-ID: <ZG+LZ4rATc8elt38@google.com>
Subject: Re: [PATCH v2 1/7] KVM: selftests: Replace int with uint32_t for nevents
From:   Sean Christopherson <seanjc@google.com>
To:     Jinrong Liang <ljr.kernel@gmail.com>
Cc:     Like Xu <like.xu.linux@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>,
        Aaron Lewis <aaronlewis@google.com>,
        David Matlack <dmatlack@google.com>,
        Vishal Annapurve <vannapurve@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Jinrong Liang <cloudliang@tencent.com>,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 20, 2023, Jinrong Liang wrote:
> From: Jinrong Liang <cloudliang@tencent.com>
> 
> From: Jinrong Liang <cloudliang@tencent.com>
> 
> Defined as type __u32, the nevents field in kvm_pmu_event_filter
> can only accept positive values within a specific range. Therefore,
> replacing int with uint32_t for nevents ensures consistency and
> readability in the code.

Not really.  It fixes one type of inconsistency that is fairly common (userspace
passing an integer count to the kernel), and replaces it with a different type
of inconsistency (signed iterator comparing against an unsigned count).  There's
already one of those in remove_event(), but I'd rather not create more.

Passing an unsigned int to track what *should* be a small-ish, postive integer
can also make it more difficult to detect bugs, e.g. assertions like this won't
work:

	TEST_ASSERT(nevents >= 0);

If this code were being written from scratch then I wouldn't object to using
uint32_t everywhere, but I don't see the point of trying to retroactively change
the code.
