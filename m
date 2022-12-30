Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0242C4167B
	for <linux-doc@archiver.kernel.org>; Fri, 30 Dec 2022 19:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiL3Tn1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Dec 2022 14:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiL3Tn0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Dec 2022 14:43:26 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0D914024
        for <linux-doc@vger.kernel.org>; Fri, 30 Dec 2022 11:43:25 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id h21so17801771qta.12
        for <linux-doc@vger.kernel.org>; Fri, 30 Dec 2022 11:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQ56hL2pZJLjzLwQ/3T/CpWJ1q/WCG6zfqoO1PWUhok=;
        b=HXW5xZVrFNQn6IFmuRqi6c/kp3HPyFLuASeWLDiU8QYfKNe0PB/mjBPGkAHL/te/tV
         bBWgSkWD9gmsNaa+zkwE/9QtOh+a5Adpf/6Luy0rf53L4bYU/Rmc1pL8SmutXRZ00uKV
         Tzvsny/YYQUQxCkUPSmamin7F9umRRs1DgMCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQ56hL2pZJLjzLwQ/3T/CpWJ1q/WCG6zfqoO1PWUhok=;
        b=fF7Wj3Fdp7VsaB9pFFati0BFLYtoCCK9ZKVoUTaO/OWiK/GepYq5d5VjcZcfStzWHv
         9YkcE8e25XD95x1SieQ5XeAwuxbb+TQnCQ1y46pCfdyCdzK8t2dwb0gYVuFauD0Rhm9B
         0xbA5p+d86dw/KW+ue/zYDvwjd3YTixbabNmOnlJgrvcMbzpokHn7Rxc8D025DI6TuHC
         llofpcePX7zBRhzVTyxATS+8Q2fOXLHCHh/LmmFyhuFJABNTBvLk3WgEqvdFjpBk4eNa
         Ezk3N0UrhlraPQo+vttdii1KeN9ZTs7CBLk24Awpz9xxl63yHhz2tRL2ufPMIZv1KEl7
         ZG8A==
X-Gm-Message-State: AFqh2koFWqQO6Sr3eEkrpvvj334SvW3q9AQg/fUsxm19LSlb4knaIpTj
        lMVvamr5qpuCvs61Sh3H1F1xiw==
X-Google-Smtp-Source: AMrXdXsTGc0WfJQMaRCIykxiekLmWiY+P1A+X9GhjScPIhmDzH8z/Ze9m4Y3IaGbaR/M2jnTnXMS4w==
X-Received: by 2002:ac8:4f17:0:b0:3a6:95ff:ffd4 with SMTP id b23-20020ac84f17000000b003a695ffffd4mr44080186qte.52.1672429404740;
        Fri, 30 Dec 2022 11:43:24 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id bl41-20020a05620a1aa900b00702d1c6e7bbsm15500477qkb.130.2022.12.30.11.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 11:43:24 -0800 (PST)
Date:   Fri, 30 Dec 2022 14:43:22 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Conor Dooley <conor@kernel.org>
Cc:     corbet@lwn.net, Conor Dooley <conor.dooley@microchip.com>,
        broonie@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Documentation: process: Document suitability of
 Proton Mail for kernel development
Message-ID: <20221230194322.gonid4ld27jwjfw4@nitro.local>
References: <20221228000330.3971104-1-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221228000330.3971104-1-conor@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 28, 2022 at 12:03:31AM +0000, Conor Dooley wrote:
> +This affects mail sent from their web GUI, from other mail clients using their
> +mail "bridge", as well as patches sent using ``git send-email``.

I suggest a minor tweak to wording here:

    The automatic encryption feature is also enabled for mail sent via the
    Proton Mail Bridge, so this affects all outgoing messages, including
    patches sent with ``git send-email``.

> +Unless a way to disable this "feature" is introduced, Proton Mail is unsuited
> +to kernel development.

Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Thanks!

-K
