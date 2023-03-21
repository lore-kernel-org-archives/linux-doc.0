Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E77C6FD1D
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 00:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjCUAso (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Mar 2023 20:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjCUAsn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Mar 2023 20:48:43 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D244EF8C
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 17:48:42 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id x11so12061914pja.5
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 17:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112; t=1679359722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdgphQPiN1nDc5Om0zpNZDCetCUSQ5OqCdbYegrSoyo=;
        b=c4bfvamElohAf/pkG3oSnnZ2G0iDWn77i2EP8Nl/KXTOimEd0sRgCeoCj3K1QD5266
         42MsngC7nCC58bal1ZC0QAQsZvk0G5S5zv22f7HbsClPVuQEd0j/Api2WX7rxy/t6D5k
         vOEDk1piYRcLZ976a7OYdiVb03VKgO2IdKDChoivZWfzfIQO9LtDQneOAL4CgwRIie9a
         CuCkhReRGkkECwJpf+oXZnxpRrlP4JcuPEHQaUijlMhTtTp0m7PevVF7sAalo0YbaDdo
         B7RlqWPE6A+InMTh4/9JqLUfZi9l4J/70U8+w3Lk2ZUjbzCsePB/E8/fchbYMNvcZrY6
         Uf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679359722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdgphQPiN1nDc5Om0zpNZDCetCUSQ5OqCdbYegrSoyo=;
        b=jepRYoNLK7UMW45BR1xfweURo9n03aEqFU5qNBVIZ5G4OSBK7Q6Wv9eDtNqz1FZeGk
         +jC+dbpFXBCjC/6ueiFy364dM9Lq92QuWmBocvNkAsCj9q/ZwjOo1niFE2aMc0sTOopv
         nauarKE4wJyTlN6DPDpyDwB52hYEwCjM4Omf70a8fiyDvP8jDohQJzDxW24nH6AoBoON
         eaMJo1/neX2cAK4ZgQXoNX3f2TU2js+ZFKJ04bSGkOhT9A0oYq3+Eb2ZIkMVM9vWK4H2
         M6uq3uQqv+c9ewyneZ11aRrDrs6eXz2dIUGDLRtYEOn1fVGEoC5ksXkYPo1wRZkHwEPY
         l3sQ==
X-Gm-Message-State: AO0yUKW2LX8TGOw3igSoT/YWJKiK1eVj89sNkmCKYU7jlNOquaY5G3yY
        J6IwnBUuyfjMpNSXmtiV16aYog==
X-Google-Smtp-Source: AK7set+SNNkatnUrPtylad8ioYjMrZkoKZaT47BRgbvh/ivP+e4GpYCXZ7wj8fCAG6Dt00nfq1YjZg==
X-Received: by 2002:a17:902:d18a:b0:1a0:6852:16dd with SMTP id m10-20020a170902d18a00b001a0685216ddmr322160plb.12.1679359721957;
        Mon, 20 Mar 2023 17:48:41 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902d34600b00198d7b52eefsm7239906plk.257.2023.03.20.17.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 17:48:41 -0700 (PDT)
Date:   Mon, 20 Mar 2023 17:48:40 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>, davem@davemloft.net,
        netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: networking: document NAPI
Message-ID: <20230320174840.4db888eb@hermes.local>
In-Reply-To: <20230320170221.27896adb@kernel.org>
References: <20230315223044.471002-1-kuba@kernel.org>
        <8da9b24b-966a-0334-d322-269b103f7550@gmail.com>
        <20230320170221.27896adb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 20 Mar 2023 17:02:21 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 16 Mar 2023 16:16:39 -0700 Florian Fainelli wrote:
> > Did it not stand for New API?  
> 
> I think it did. But we had extra 20 years of software development
> experience and now agree that naming things "new" or "next" is
> a bad idea? So let's pretend it stands for nothing. Or NAPI API ;)


Maybe just a footnote like:
  [1] Was originally referred to as New API in 2.4 Linux.
