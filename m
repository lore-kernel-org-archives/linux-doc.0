Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E49C6FD1C
	for <linux-doc@archiver.kernel.org>; Fri, 24 Mar 2023 23:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjCXXhV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Mar 2023 19:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231717AbjCXXhU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 19:37:20 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295B5113C4
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 16:37:03 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id j18-20020a170902da9200b001a055243657so1962633plx.19
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 16:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679701022;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+BJi54U0cmiUHoWXHQzl0xPiOaPcA8Tmmek78k7nC0=;
        b=DK9Ah+gQ4AHjZizsWS6hZn22cxoOChaz9yL0sYmaVA8CI/Igw5yKJrin2rJezaSNJC
         4riaqrV7SD/jpl3P0onjeXE9TgkhCZhrcaSQiIPptBaoL9IAIDXGF2+aTp34TrnDKD+e
         ENs+7N9w9qH0hQSZUK7v2ORWv6PePruA841mD5r4YZZzRvZE2kSj1X7nyncVCsw1nrPM
         JoiOe2Q+7IoBnZ526RiaN6JoOvdF1HKT2RvfdFFADB4wvpR8h3UB58GpNxV3bMoLTHye
         VWSAGukLHGGe4Qn8g39NIzM6IBLXglb+eggv1UpdmahS8RvtH9jK2g8XXuJJNZfBQqrh
         w1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679701022;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D+BJi54U0cmiUHoWXHQzl0xPiOaPcA8Tmmek78k7nC0=;
        b=urTe6m6lUgq8vvA/8rewgus2AoqyQu3UWnesSW2YEMcC8oKOL4jLj+rGNJMyWiLjAT
         0DCGP1/odQ8P8Ir7+EzS+rfqh5e8mMH7irLiJ2H1H9FZMOTJxhaWFfkjY/p9YTQNvqWp
         FFNEjyx4YsCs8Vr8S1TWoutkUaiqopzxqAy070OcHlpM8OKx+xJipv+lHBgpmqGyoruH
         ir1HFGnbeFZkIXKBqR3AQ3bA8LmKZjCftHNcp6L2ku+urrhxiZy4k16CZE66FAQ7KlbK
         +5GQw1kzOZSD59G7TTcQCxJoJnhVwVI9gCYcM6DRR2J7veJdPsi7XuNqdcjFautHhKP1
         0a3A==
X-Gm-Message-State: AAQBX9e8vsbNXsVWHLBmrt52phTpQ8Isgcb3rA/b493b98q42CmHS4HY
        pKoOVumwZGdDsRpgDWSiChHw5JFQ8GQ=
X-Google-Smtp-Source: AKy350ZfgixPvBRUEyfab6W97rcYv6yYxHQUo/MV8CsklYh7JiEmQEicV9gESAGH9hDr+4awxZU7sDoseGw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:bb97:b0:1a1:ffc5:1e8d with SMTP id
 m23-20020a170902bb9700b001a1ffc51e8dmr1453284pls.3.1679701022677; Fri, 24 Mar
 2023 16:37:02 -0700 (PDT)
Date:   Fri, 24 Mar 2023 16:35:51 -0700
In-Reply-To: <20230220034910.11024-1-shahuang@redhat.com>
Mime-Version: 1.0
References: <20230220034910.11024-1-shahuang@redhat.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <167969119815.2754691.17747317733864412835.b4-ty@google.com>
Subject: Re: [PATCH] KVM: Add the missed title format
From:   Sean Christopherson <seanjc@google.com>
To:     Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
        Shaoqin Huang <shahuang@redhat.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 20 Feb 2023 11:49:09 +0800, Shaoqin Huang wrote:
> The 7.18 KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 now is not a title, make it
> as a title to keep the format consistent.
> 
> 

Applied to kvm-x86 generic, thanks!

[1/1] KVM: Add the missed title format
      https://github.com/kvm-x86/linux/commit/752b8a9b4d98

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes
