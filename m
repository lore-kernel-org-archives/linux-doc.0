Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8E2EB64D9
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jul 2023 13:40:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbjGLNkz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jul 2023 09:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbjGLNkz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jul 2023 09:40:55 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2BF19A7
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 06:40:53 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8c81e36c0so35058255ad.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Jul 2023 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689169253; x=1691761253;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3R0+IQvkrnQnU39Oyvspo6kg9ZBUBh3NOpdgKbP28Q=;
        b=kUaPpTjzrSmJSf3A/0N8Bjx35pzJ+R9vTPioEu+jki4TzCHjwK1QXrCxYvvcBfpiJ+
         Q06ZeYruQPizj41Kmb9QPpdhgG5O8S8WKlIPcUZSdIwoA7q9kViyX08OhNXmtX7q2Yhd
         veodMrjzSg3UPqUd840f5/jRUSgbbxlWJJISzHRQ9jSIAckUyw7w44mS+2IaZ4yWoYCI
         0Nke6G6TjpQY9PsgLb9GvhrPhCP5CuKOy/F+vzVtfcPkHW1KfUhIcyxjKXK6swxg4vmT
         0QxDvct6iSuEzMHcWCHEsc+bzitxb9npB5cuhGrzsBVz6NFFMGlPmWkg4iEQMjSqjt6b
         J5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689169253; x=1691761253;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3R0+IQvkrnQnU39Oyvspo6kg9ZBUBh3NOpdgKbP28Q=;
        b=Ipo+2BgpqrgbPCZGjyi4LmUlidTEnnzkPV+dNzeBbK5t+B4JgXH4pIURr5vSjBp5Vh
         clTIOVtarZylvNJAs5cDsRkLzAMOw6qySf6wYwO7YVoSZ4sjW4AQ9CGqfycaDKesqslE
         f6Ni3BQSfQYUd+zPshdJextvEAQL383QvJQzw3z+c5DwOaCpRdosGJ9yk6+mdN5Ji9tD
         OcQY2ATI8BVVNi4ERJem3b+fCHFzAk73Vm0ba+qoC+LWL0T8Q2pfwTHhOdFmb78A+2l2
         QywOGUgqIezCKrVT8LWYB5Ge2VswM6cUJvebXPzEJAaLcR+pDSd+HsAzAxR8gThxBMqK
         Jkew==
X-Gm-Message-State: ABy/qLbo59GSkGfzCJUuc8EiVzCGTwJUc1d3d97AUjSypZDW+x5M664t
        paOckvHALHPv1ooPDat8KMIOxuhAHWd0sjctEW4=
X-Google-Smtp-Source: APBJJlHqWGwANrvcMUuLz3oxOixxg8JACWF4MUlz5eaWWdretSN+IWL9V6Ed/DMFvROe8q5DStA27A==
X-Received: by 2002:a17:902:ea0d:b0:1b6:bced:1dd6 with SMTP id s13-20020a170902ea0d00b001b6bced1dd6mr17088119plg.35.1689169253365;
        Wed, 12 Jul 2023 06:40:53 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id bd5-20020a170902830500b001b8b4730355sm3941611plb.287.2023.07.12.06.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:40:52 -0700 (PDT)
In-Reply-To: <20230710193329.2742-1-palmer@rivosinc.com>
References: <20230710193329.2742-1-palmer@rivosinc.com>
Subject: Re: [PATCH] Documentation: RISC-V: hwprobe: Fix a formatting error
Message-Id: <168916915823.11099.3749390544258653138.b4-ty@rivosinc.com>
Date:   Wed, 12 Jul 2023 06:39:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        Conor Dooley <conor.dooley@microchip.com>,
        Evan Green <evan@rivosinc.com>,
        Heiko Stuebner <heiko@sntech.de>, andy.chiu@sifive.com,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux@rivosinc.com
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Mon, 10 Jul 2023 12:33:30 -0700, Palmer Dabbelt wrote:
> I'm not sure what I was trying to do with the ':'s, but they're just
> rendered to HTML which looks odd.   This makes "fence.i" look like
> "mvendorid" and such, which is seems reasonable to me.
> 
> 

Applied, thanks!

[1/1] Documentation: RISC-V: hwprobe: Fix a formatting error
      https://git.kernel.org/palmer/c/d6e724d3ef0b

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

