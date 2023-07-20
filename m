Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8E5EB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 13:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbjGTNp0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 09:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjGTNpZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 09:45:25 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFBA198D
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 06:45:24 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57320c10635so7475097b3.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689860723; x=1690465523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=knRbu80OJ8CLJhnQO5wWqGTxy3faZAYp+dQGDLVzoX4=;
        b=zxZpchrshqL9I6eRR0BSKpc4nlBOwFpJNgyzgAgyo8mdlxp4vOYkBJ4BXuZc9IRmq1
         axPzkYA2cII3XkAGh5UNoEuQtecPd46bK/AI5xTCpC6gyiYWR3HqJuyq0MB9qrMb8SzU
         9LA80ZPYiDXt/qzAOphsh0rEzLM1fVaqk0lHNc+8tjmcO2GNPKZ/sSFKzypfD6bmqmwD
         05qWWPNMy7fWLXeLSFKPsNDTLIj05DIcCYhgJDfslWBWgPBs1QXdafRPpoRimlViandm
         ul4P5w7SHX3ExnXrAXJv2pMqND95cC0LNFTU3u7Uog5PUKlg1PovZU6EKvs/Il6Ehkw0
         qTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860723; x=1690465523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knRbu80OJ8CLJhnQO5wWqGTxy3faZAYp+dQGDLVzoX4=;
        b=ZYtVfXS0x9X7Ryc65M9u1jUIbqkak2Cp+CCmYoyQUtx8sfIfc5nnScelWUSkP4KsXN
         fWwgFbzs7UN7Jh7TpMe7lH4prXS/TmaueojmNxlX7QHi//qLhFwzS4U3YRdr+8qng370
         GWQLXJWOVYKZW0JnkrxyJxDZoZrwy6s1busljGjyZe67/RPnBinURfs0L2eEikmqdAAm
         lOH1wEhkQlEFLMlR6aX8Xb9TDH6ATkJMzROYiIw59W2MfBfXB3iAcUhU7svZcYOkjnsO
         vu99Jn56F7BAJSd4NcWqR1wPcDMcbWCEewSMGkoTOHh8qYTnm8CpxIGVvIWm9FWw7AF0
         eD2A==
X-Gm-Message-State: ABy/qLbU/4K0zvcumnABXLb7Oo7yqflSJudzumg4oh9PAlK6ozdbnvdT
        vJcEgru+3tVQh6e9HVnj6UOyTenIUxg9hFA=
X-Google-Smtp-Source: APBJJlGplpoVryvURkn9ZSMo+zrTMcglju2HavshLybsiFTib7Swl5mhM9Plg6FME4ZvmaeT9vcCZhCdLZ5Du9Q=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:b70d:0:b0:581:7b58:5e70 with SMTP id
 v13-20020a81b70d000000b005817b585e70mr59909ywh.5.1689860723759; Thu, 20 Jul
 2023 06:45:23 -0700 (PDT)
Date:   Thu, 20 Jul 2023 13:45:19 +0000
In-Reply-To: <20230718054416.861412-3-tmgross@umich.edu>
Mime-Version: 1.0
References: <20230718054416.861412-3-tmgross@umich.edu>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720134519.3548499-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/2] docs: rust: clarify what 'rustup override' does
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

> The behavior of 'rustup override' is not very well known. This patch is
> a small edit that adds details about what it does, so users have a better
> understanding of how it affects their system toolchain (i.e., it does
> not affect system toolchain and only sets a directory-specific
> override).
> 
> Signed-off-by: Trevor Gross <tmgross@umich.edu>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
