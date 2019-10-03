Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8E0B57D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 14:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbfJCOeo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 10:34:44 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45162 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729949AbfJCOeo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Oct 2019 10:34:44 -0400
Received: by mail-lf1-f67.google.com with SMTP id r134so2003326lff.12
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2019 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hvhATlwGfyzse+9lgJuOQKk+XJVPQgsWU7QyuLbTa+Y=;
        b=R5NhMiwTWg9Str5l+j5vYpmLZDbmTPsgZ8TvltgouFfOYaOXhwRZjBuIRZH8KjOaL7
         rQbdWUA1Pt66YY3f2a8LSttvEhDB6cwIjVZS94ykci+fo/geFnvch8LCaW0YvE+7BosL
         0Ulk/Y1buj8QeivGnUH1btbcghmWjdRUIFavFvpKCLf59hxKPHPd73t88sxuBbyx/jyJ
         uf3nJWF7IZE+FBsQYJmGRXXICXNj8IjhTTdyUegdL7Wh/MsRI7AuvzpsPum+xHamQJKM
         j/h/eD3iJvpmFr4aVdXTm/hQwlgOPeeQ47PSo2IZ1vRHcSBV9qZTW4f95BIZ+gu8sdnb
         u26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hvhATlwGfyzse+9lgJuOQKk+XJVPQgsWU7QyuLbTa+Y=;
        b=mVnFCzw8tvW/6CM5Ey/TLSQn77rUImz2AkRm0Kx51PFB5cI5fj7QVO4qsqB4H0UNx2
         12wnTwEhhsAlDNUXqFJ0g5VW3tbaVPuADtEi9D5W81JGmoUzMJ770uhB+xqMAw//7Kyc
         0EOYrBPJhZ5Qbln9ENGdYkk3/oj2h1eUAf07DNSqUyHI9fk1LAEEw6Mbe7L8wxrgpEQL
         XKc7O4/bonumKMPzYhCCpQ5yAdCZeczKJeOlT6pcEVKh3ij38YbCKPpHOSYq1aXrLvk1
         PEnwqTVesMYFjbtZaDBL25/yIvQAI6zQhwtGNMes0ZaSyn2M/BQKausFpslY5pz+eoYH
         tlwA==
X-Gm-Message-State: APjAAAVSnMgIqnDLKuPn9Ym8yKFC9Zp2IhkpsOmmxjjfjDl89v6nDNwv
        I7hUyu5tn5GvZ10wbNYdyGeZ2oalfixEIpdRxAQBfw==
X-Google-Smtp-Source: APXvYqxzdsOLb8buBtK6RvHEFpfSWOJXyEBRpRiDNtKzXeUnHA0CllgxBBRm5WSuEe//ZJx/EU+gvI5WYGl1L3RQ1m0=
X-Received: by 2002:ac2:46ee:: with SMTP id q14mr5569285lfo.152.1570113282029;
 Thu, 03 Oct 2019 07:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191002153827.23026-1-j.neuschaefer@gmx.net>
In-Reply-To: <20191002153827.23026-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 16:34:30 +0200
Message-ID: <CACRpkdZ0ekYtZ4bZ-A4NZN6HO6XJzwpdZ_HjUL=FoWfG08UBtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mcde: Fix reference to DOC comment
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 2, 2019 at 5:39 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The :doc: reference did not match the DOC comment's name.
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Both patches applied!

Yours,
Linus Walleij
