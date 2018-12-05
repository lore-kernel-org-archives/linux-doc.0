Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 071C57D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 07:35:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbeLEHfA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 02:35:00 -0500
Received: from mail-pl1-f176.google.com ([209.85.214.176]:35089 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbeLEHfA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 02:35:00 -0500
Received: by mail-pl1-f176.google.com with SMTP id p8so9655765plo.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Dec 2018 23:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=iH0xbYUDB3oTs9lK4TxdFHYfcIqtagE5wPfwFn+2+W0=;
        b=B7VD+YAsxHlW/hsjhw0Px4QZ+Wr2w/yzZk3xQerQe5vmnhxH29is5r+X05dEZRBuqm
         FLb61NBuM2o/p1U4ta2HPkZPfmA/B8I5vQsklGAzvLdRzYrDRt/4EQ/pr1woy3OjqMa9
         dDCBPt83KMu7qdItrP1yVoRMh3WJzT8KTkMWb8OukBzroaFUG4j1GV8/iLAV6Q8o0gnn
         1kydeou9jQhjh3fn059kAj+k5XRKtFwcfxUJYGJqtKTutBQXVLUlgJIHK9G1gYYgjhlW
         EkFYaVPXcS7uv8mkyZf8EKYLvW2LNHovalo3vwttDXtZcWS1H2Gp7IXMwPW5XMPtVdMC
         vVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=iH0xbYUDB3oTs9lK4TxdFHYfcIqtagE5wPfwFn+2+W0=;
        b=O8aQiElVM9rZ5Tsj5GlmMwvkuoWpfsf85AlSqnDGAlr76EPnKtv3HaENYzpUFHU6G8
         Eaq4RJ/X6UZqdEksEF2eW6e4/FxbOESY2vPzGpDfHZssFEFe8aBO/YwVEfzlzABsUb0B
         HPY/HXKjcJv6yLzYIdptSgxgZvLogR0VO61IKfGVUamWBDDheem0fiqqx/IZJij7hLj6
         HOXOcL0GD5gOG59isZwmeeEU2DuxF83doRt6yjZLGsa35KLq0Wgfa7A/sT6FJUkSG0bf
         kbkbtuaeG5DIGoThuQ8M0mubaw2DfnCZY5keRuW8UEKP8xCzSfQZu0wal8+7meV8m4Te
         DHNw==
X-Gm-Message-State: AA+aEWb3DxLhe0TxyZuppv94ylAiDHns5xMAga17/ViB7qXfJWCeoaep
        R0igeTCM2xUA6X0bYU0nzqG0dw==
X-Google-Smtp-Source: AFSGD/WVu+GnVP2BBEgbBcgsu3dlsIE3D6MJTUrv9RTqslar96nkUJ90yX1R/Vh01rqFIx28aIu4gQ==
X-Received: by 2002:a17:902:ab92:: with SMTP id f18mr22224945plr.221.1543995299443;
        Tue, 04 Dec 2018 23:34:59 -0800 (PST)
Received: from cakuba.netronome.com ([2601:646:8e00:727e::5])
        by smtp.gmail.com with ESMTPSA id 12sm17926372pgd.35.2018.12.04.23.34.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Dec 2018 23:34:59 -0800 (PST)
Date:   Tue, 4 Dec 2018 23:34:55 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     David Miller <davem@davemloft.net>
Cc:     corbet@lwn.net, oss-drivers@netronome.com, netdev@vger.kernel.org,
        jesse.brandeburg@intel.com, dsahern@gmail.com, jiri@resnulli.us,
        stephen@networkplumber.org, henrik@austad.us,
        linux-doc@vger.kernel.org
Subject: Re: [RFC] net: documentation: build a directory structure for
 drivers
Message-ID: <20181204233455.41e78793@cakuba.netronome.com>
In-Reply-To: <20181204.211327.172944025163036359.davem@davemloft.net>
References: <20181204014328.14424-1-jakub.kicinski@netronome.com>
        <20181204.211327.172944025163036359.davem@davemloft.net>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 04 Dec 2018 21:13:27 -0800 (PST), David Miller wrote:
> From: Jakub Kicinski <jakub.kicinski@netronome.com>
> Date: Mon,  3 Dec 2018 17:43:28 -0800
> 
> > Documentation/networking/ is full of cryptically named files with
> > driver documentation.  This makes finding interesting information
> > at a glance really hard.  Move all those files into a directory
> > called device_drivers (since not all drivers are for device) and
> > fix up references.
> > 
> > RFC v0.1 -> RFC v1:
> >  - also add .txt suffix to the files which are missing it (Quentin)
> > 
> > Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> > Reviewed-by: Quentin Monnet <quentin.monnet@netronome.com>
> > ---
> > I'm posting as an RFC to see what the general feeling is about
> > such a patch.  I can split into per-driver changes later if that's
> > the best way forward.  
> 
> I'm fine with this patch as-is.
> 
> Do you mind if I just apply it to net-next?

Not at all.  

I feel slightly bad for not CCing all the maintainers but then again it
just a slight reorg, I don't see a strong reason anyone would
particularly care.  

Thanks!
