Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083E8C63797
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 13:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236837AbjAQNQX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 08:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236775AbjAQNQL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 08:16:11 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF82B4C06
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 05:15:57 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id v19so28051477ybv.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=speSHNYY7UY/VdkKSKSzAPd+LB5tLtqCK38I+sQK0WE=;
        b=iuY779kCZkgs1i3TJHyaoB2OYp2y4UXVeAhDi5HqtuGQfjKC4jG8HrnzdB6SN3EkR/
         2nYFg5Zh5RbwdAQZGyYwV98xO4AgZMxYK3B1mx4o6KgC1XnnhnFP6AiB0VEVt/YxERde
         flKtvACWDm+891ml32I3GsO2iYHLgotbUxkvM8kL3CQOZ0u2UkENSHolMuQMLhMKE/xe
         LTQmekU+6z1QwVRup+9f7At80Pf/R1cuRMQW/4eoFu2M13dTL4WwmITVWqu5r14EUtAA
         Yg75DI449A7EfVw1LH1SuSVZpyOLLnOtCnVf2xcq6lyTfjyN/95YcJ4kwMkwfwb7yYF/
         YFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=speSHNYY7UY/VdkKSKSzAPd+LB5tLtqCK38I+sQK0WE=;
        b=aTcYrdfsmQ0mKyjDZa1jV1k38af0KbcCFbN1N45D3FPVa4foQlikioBnIE6MApt31G
         hqlkykDsI9Z29JPx3Q3QCW8OAkMxQJ9BwEqlC1B1y3VINWZrS2hTlRlDlEFdQZGI8gkf
         74LTBdAERGrAJJAHbwdxKX2grRZq7qmD91vRokuEkIjRixQ/S67Y4VychTxHIS0m1Ft+
         iKwsPHC3kw00220eKQuDW2RkqnnnJeV7aNmC5yxpsIr8sNw1Bx7S725znbcvLDxu9zx5
         xy95rclmycUDktDcNN/xheL7njo47P4JRGyJHhH6g/tQWbV/gzm+xpWJDLXrMR4nYuvM
         Q0RA==
X-Gm-Message-State: AFqh2krh4Qj3+JN9dxW/W3p5m4c5bUwNWh85cAs7bUAy1QfE/B0scelt
        S2dDw0JlkurjNvj6dQdwbtn5obFdFwR8UkxOddZ/dA==
X-Google-Smtp-Source: AMrXdXtQJRhkiJoJn3gtcZ2O1RYFepN01V3AepnypVv38ICpDuM0Nw4YvhauZDgojFLioy3ywrONiSypPavhEKGex/U=
X-Received: by 2002:a25:9d88:0:b0:7c0:acd2:6300 with SMTP id
 v8-20020a259d88000000b007c0acd26300mr320846ybp.520.1673961356936; Tue, 17 Jan
 2023 05:15:56 -0800 (PST)
MIME-Version: 1.0
References: <20230116153347.15786-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230116153347.15786-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 14:15:45 +0100
Message-ID: <CACRpkdbVa3XEDzcuy7iCqx0cvj4trzPe7N0B5PswA1mQ7O+GtA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Proofreading and updating the
 documentation accordingly
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 16, 2023 at 4:33 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Proofreading and updating the documentation accordingly, i.e. fixed:

Both patches applied! Thanks for your usual attention to details.

Yours,
Linus Walleij
