Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3345EB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 13:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbjGTNok (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 09:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjGTNoi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 09:44:38 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB42319B5
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 06:44:36 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-57a3620f8c0so7920587b3.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689860676; x=1690465476;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RtUw718EqiyOItgwLRoWHschTDUolZNtcEeIulMXRuU=;
        b=Qe45Vgea9Eb6lR7WQMdTwnmQf8IRCSuAHhjorIGTWlHBqhWfzeyijpT5OgAiHcw5Hs
         PgcZM9ydmUS6rhORROj0FX3dxg7fHYAoo2UDvzSY9uSu4wja7RsRQA93RxTJ24pg9wpB
         LpnigSLz0auuL+KRAHJfFOjWkgH+AZKNeAcs6NMxAYiaR5D+Gq6nTdMwTvogm6bwNjbq
         OKXP2852kXFEg6DO51hM1sinDG8/mr5mYx94iv2TlC1Jl9bdaEzUiWN/+prDhRi4erZV
         HgakPHRBd+0MVwsC+HaBPJ838OSffS7i0ukpCHgu+aOvZV05NjwzI0GTpl6P/PbJ+PV6
         Fbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860676; x=1690465476;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtUw718EqiyOItgwLRoWHschTDUolZNtcEeIulMXRuU=;
        b=NqXMahEq5aKH50ehEY5ZpALoRwRMoqAFlnPrillfDu1+pWd/vTLZKcVrnoTzwYHOIf
         8rtcUqkxBrWCHG10wKX9sWYfb2baMeyluKauG9lFCFwZc1EWwY/UAOFgolWq0TenbcGO
         ZSQ2B+/mFky7sL3W5ASrs8CD/p5mlQtTIY07FNXfPqG2VnYNrhcaJhMPBoa9yW1y9Z3Y
         Fg8kdbVlv9Qa3Y7KDiSOqh2uIVvDAXmf6mDeyIVQprEjkM/FBzV5P0llLsD8laOVb27C
         GtK4Gs2wmzJUylGWBSNPUq1f4vAERw0r303ohwmQbHldMkC3uBISM5gnv1g1ULPrj6Sm
         9iqQ==
X-Gm-Message-State: ABy/qLZMBxdxYSN6N0+0AF+PQ0VBQEhPPSEShnlDxprV6Irtab0lwjfK
        NJKR7+nGaHmCJWqrCiOVQqR/xBPcfY7asig=
X-Google-Smtp-Source: APBJJlFtGDZZbmerF2xp0urcimT532Xxqp7VKULGWvIydvDQxihP8tafHJbfMTat9HbGQhQ6KJ2SC2jq2gjZKmg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:1709:b0:cab:e42c:876b with SMTP
 id by9-20020a056902170900b00cabe42c876bmr44853ybb.3.1689860675977; Thu, 20
 Jul 2023 06:44:35 -0700 (PDT)
Date:   Thu, 20 Jul 2023 13:44:28 +0000
In-Reply-To: <20230718054416.861412-2-tmgross@umich.edu>
Mime-Version: 1.0
References: <20230718054416.861412-2-tmgross@umich.edu>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720134428.3547917-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/2] docs: rust: update instructions for obtaining 'core' source
From:   Alice Ryhl <aliceryhl@google.com>
To:     tmgross@umich.edu
Cc:     alex.gaynor@gmail.com, benno.lossin@proton.me,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, corbet@lwn.net,
        gary@garyguo.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com,
        Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Trevor Gross <tmgross@umich.edu> writes:
> +	curl -L https://static.rust-lang.org/dist/rust-src-$(scripts/min-tool-version.sh rustc).tar.gz |
> +		tar -xzf - -C $(rustc --print sysroot)/lib \
> +		rust-src-$(scripts/min-tool-version.sh rustc)/rust-src/lib/ \
> +		--strip-components=3

I think this assumes that the sysroot path has no spaces. I would add
some quotes.

With that fixed, you may add
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

