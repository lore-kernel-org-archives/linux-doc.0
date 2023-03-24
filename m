Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6220AC76195
	for <linux-doc@archiver.kernel.org>; Fri, 24 Mar 2023 23:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbjCXXgK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Mar 2023 19:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjCXXgJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 19:36:09 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCE9DBD6
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 16:36:07 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id t24-20020a1709028c9800b0019eaa064a51so1980819plo.10
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679700967;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gzD6dvewUhBNbui2HQuAy2o+vZGdl9ePlxoAR6ib/9w=;
        b=Q+pLF4cI7TqbBRgJQrqjz/nHaYu/kAlRlCtQ+1M5RdvHRFGrYnrfayiE7id9WzQymk
         pJE5ifKOQ+ExThs2jkMcWYP2dYivx5haQFx2mZlvHn+6TXsmVog2gVNzItwDg/NxoFGC
         kRvzCCO4MtagWEMfYAJ+6BrY/tlib9ya7ePnkvW/FGm7VhTqD04iM6VgMbidfXvaQKxE
         qi9S6nB8UPqBl3S/Pod/CNqXUic58cWlrn2z4FIfvd4JwDkhl9VJ3SH8oc8wHnaZAabv
         n9EF0UIL+biI2ipakbQ4YRkHghDonTFXcANnwT1xw9tpyiUj5WPlszGrB7zRpXS2CvtW
         NmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679700967;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzD6dvewUhBNbui2HQuAy2o+vZGdl9ePlxoAR6ib/9w=;
        b=NhQ8Pzc25eb7y8o/iscRsr8nSDgvxyMl7KGi1zLDn6SWwLMIUBE5jPgx4pDwh/PJe5
         xQ7/Fv48JS/gRKTgFhrpUOGW5DPkjmHxig+Pv8X/KC/Xg8krmEIz01pO1QtmfXuyddKQ
         HLEXv3vt3y7JJAiwvH8oVDTAubtXJUMPKJ+x/+SJjXXNnLDG7tjE++DjgoxQNjfvz4XP
         zyEGNPHQlvtMg++kEqQsN1yi6Ak5cAF7ABhSaa7KkLjudiIolpoK/aN6fK2DZTzByhh1
         Cttb/m5SGMphdDv0J0qQCtb6Mc4BJURq/sFPxzNQEe7dyh3ILIrW81AHATjL/ylCBjFV
         tU5Q==
X-Gm-Message-State: AAQBX9eMcTN8Gm7fV2+Uqu9WOWDT9a/0VFk9qBj4w8JIGpql2/iUX/2s
        qktlHDzJp42bU3psLkxW9iN+AIHBOUQ=
X-Google-Smtp-Source: AKy350YVBNOjjf+YX+5dkelN2BJWsr6boD7sAFGS/e0SbB44Ze2RR3ifnGzlHxlDn3qrW0JHEI32abPGKuU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:da8e:b0:1a1:d366:b0b2 with SMTP id
 j14-20020a170902da8e00b001a1d366b0b2mr1509662plx.11.1679700967504; Fri, 24
 Mar 2023 16:36:07 -0700 (PDT)
Date:   Fri, 24 Mar 2023 16:35:45 -0700
In-Reply-To: <20230223052851.1054799-1-jun.miao@intel.com>
Mime-Version: 1.0
References: <20230223052851.1054799-1-jun.miao@intel.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <167969120469.2754732.14170657866913653110.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: Fix comments that refer to the non-existent install_new_memslots()
From:   Sean Christopherson <seanjc@google.com>
To:     Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com,
        Jun Miao <jun.miao@intel.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 23 Feb 2023 13:28:51 +0800, Jun Miao wrote:
> The function of install_new_memslots() was replaced by kvm_swap_active_memslots().
> In order to avoid confusion, fix the comments that refer the non-existent name of
> install_new_memslots which always be ignored.
> 
> 

Applied to kvm-x86 generic, thanks!

[1/1] KVM: Fix comments that refer to the non-existent install_new_memslots()
      https://github.com/kvm-x86/linux/commit/b0d237087c67

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes
