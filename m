Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FF9C004D4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 15:49:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbjASPtu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 10:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbjASPtU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 10:49:20 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121118766A;
        Thu, 19 Jan 2023 07:48:22 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id v6so6766680ejg.6;
        Thu, 19 Jan 2023 07:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+tTabZx+wRH0q9rQET/ShTDrcAyEnuICfb94pTN2GUM=;
        b=iky8ya8NU/DHJz202+GYWQjeF1iemoJGbw32VHJJa8eQ+PwWvZ+OxDrLU96UIdlWet
         LWrS0kWKZQFWzDQySFMdKqVoIj4KUGlecedMivjg0uDiZvcIauFkIINfpWVJ+rhpdmgM
         yS9h7JH9N6bCiD2q+lIeKFwe5s2sOjKv4W0d1r5cnUsLn6/u+YL++G9C1XFOzR2T9E2w
         DGrED2IWP6f5L2gMotbXo9D+I8EeTTlh6r+6iBuHmKdeWKLkMkjscmVd+l8MqW3iRbHy
         SYQPUm0+BDJqrh7WRWhNYTRPzGFIiW5FkZASdt48fidfAGo9YyQUj6rFqYKkmfI+EoJ3
         WJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tTabZx+wRH0q9rQET/ShTDrcAyEnuICfb94pTN2GUM=;
        b=qzzK5E7e2qUTeMTCzj+2JPC19fVixmI5g2bJarGyxwo8CSKN11+ZNZn8XyTGozQUHH
         jPNBG4q+ENgFbsQ+KvjCVVeiNJWwhIc67KX41BvxXFy29LUKRONeWAoKZ5vFmNyraImv
         cx6RYvK+nJ6mZHT25/KTIGh2yVnm5vng9clSHhKq5sQHEyf67afEXlNH47t61AwLGTzK
         Yx47+hFxkbd8d/97m036mXWKBiV4zQK4sOcuhW0L9osIYNNnZIBiHZ+Fv+FotH4MedTw
         lW3Wrcy9NCtVq1D7NWz2pKE8svtaVFMRp2hB0106PyLWZlX2r0hWadck/ADk+I2xHovx
         eFXA==
X-Gm-Message-State: AFqh2kqMqDuB9Ms53Xr/eE0BUNv1YFJbmZsH4YTSl6vdPZ4sme74V7d+
        yyGx+H7Nwpr9srtWE8BTL8pqhy3HuNWKbw==
X-Google-Smtp-Source: AMrXdXv7yD7sMrLgeYfr0ZU6vU3gqZlBC/pFeriSs04hIkXVA9qMRXXvW36r+UKhqpeiryPG59u3ww==
X-Received: by 2002:a17:906:38c3:b0:872:82d3:4162 with SMTP id r3-20020a17090638c300b0087282d34162mr11538199ejd.44.1674143300518;
        Thu, 19 Jan 2023 07:48:20 -0800 (PST)
Received: from skbuf ([188.27.185.85])
        by smtp.gmail.com with ESMTPSA id kx4-20020a170907774400b007c10d47e748sm16418971ejc.36.2023.01.19.07.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 07:48:20 -0800 (PST)
Date:   Thu, 19 Jan 2023 17:48:17 +0200
From:   Vladimir Oltean <olteanv@gmail.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, robh@kernel.org, johannes@sipsolutions.net,
        stephen@networkplumber.org, ecree.xilinx@gmail.com, sdf@google.com,
        f.fainelli@gmail.com, fw@strlen.de, linux-doc@vger.kernel.org,
        razor@blackwall.org, nicolas.dichtel@6wind.com,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH net-next v3 1/8] docs: add more netlink docs (incl. spec
 docs)
Message-ID: <20230119154817.cg6cgzmirc46xqyy@skbuf>
References: <20230119003613.111778-1-kuba@kernel.org>
 <20230119003613.111778-2-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119003613.111778-2-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 18, 2023 at 04:36:06PM -0800, Jakub Kicinski wrote:
> Add documentation about the upcoming Netlink protocol specs.
> 
> Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> --

I considered this an useful read, thanks.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
