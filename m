Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB14C636D6
	for <linux-doc@archiver.kernel.org>; Wed, 22 Feb 2023 18:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbjBVSvl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Feb 2023 13:51:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbjBVSvk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 13:51:40 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2F446A2
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 10:51:39 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-536eace862cso48178897b3.16
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 10:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yqEECA7T14uUEIASP+IpGDgg85ZCOvdRmhNcjI3Iles=;
        b=qFu2nZFTrTIDgiui6Mnc8nAfWXy3MGuClnECitY08YuGQQb9v6QJj0VhQlA1Hne1PX
         jwbFjOAh23hL3XupWMXZLLCXKP4THYXpwTr42U1/q1g/QQfC4G2UWmMJyoEBLapf31zr
         9fMEjCBZJjzx/JmpivZXbiOKlQHgUAMx6sN9r3/FCL+Jj7XJGZLGZQ97FlgwMMVBEVNM
         9fIitAEtjpeHnK+4ww/FLrj3EscM62WsIQie3jEK2g6DQO1Xip7pL3Yng35IBOv/bAxe
         x4u6XdkQANWQh3E7/i3BPLdBdEkQDUHrPuK+JE1eZA6241r6sMUD9BLBydK2LBAn6kE5
         6Qpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqEECA7T14uUEIASP+IpGDgg85ZCOvdRmhNcjI3Iles=;
        b=H5KCKf/I9ijasGGhbYcCOvgdluS7Ok3s8lfxAtLfgUf/+rZtoLTPMZPKJx9Tx/5OyU
         zYi5M1iva0NOVwzzcxPrimUhQakJg7bxGrQ6ukE57ERIiT0LOMj4xbLzh+G4/OyLB1Yo
         7U9PiegJGoCQ8JikmvG7PvpQpKo8cwmTSZBgJBjW9ijlxDoAGbu2GpuTWA/sZl+wlmoA
         7w+3uGZ67P4b9Cu5Wf5doyHeRkHz7KpU4UE+fXQpa2NeGOIex3q58UdSTRjMe+P63wcj
         /CKG3kWNglXhECWdQFNfrSJ1RcXCGcnvkUvs8GL8Aox32OjRRbHvr6py+WvHyk4L9X3s
         HuMg==
X-Gm-Message-State: AO0yUKUQpMVOJgTHbLHSobpMG7V1v45Qx05ZbFo21zSUW7ugMhe0Y+7h
        LlksAfQXyqA+lPrpD63BLeWzqmMKc/w=
X-Google-Smtp-Source: AK7set+8IP+LPPuvRfdebQR1ad4tDs9Va9qipjTvwoCKkZH0ygi5W3DkzGpQdJCQHMTdaByTbpW1nzgLFfc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1:b0:a27:40c4:e12c with SMTP id
 l1-20020a056902000100b00a2740c4e12cmr54899ybh.2.1677091898129; Wed, 22 Feb
 2023 10:51:38 -0800 (PST)
Date:   Wed, 22 Feb 2023 10:51:36 -0800
In-Reply-To: <20230220034910.11024-1-shahuang@redhat.com>
Mime-Version: 1.0
References: <20230220034910.11024-1-shahuang@redhat.com>
Message-ID: <Y/ZkOFL0O5szHsYP@google.com>
Subject: Re: [PATCH] KVM: Add the missed title format
From:   Sean Christopherson <seanjc@google.com>
To:     Shaoqin Huang <shahuang@redhat.com>
Cc:     kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 20, 2023, Shaoqin Huang wrote:
> The 7.18 KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 now is not a title, make it
> as a title to keep the format consistent.
> 
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>

Looks like it simply got missed by the ReST conversion.

Fixes: 106ee47dc633 ("docs: kvm: Convert api.txt to ReST format")
Reviewed-by: Sean Christopherson <seanjc@google.com>
