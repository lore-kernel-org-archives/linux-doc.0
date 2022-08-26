Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1974ECAAD2
	for <linux-doc@archiver.kernel.org>; Fri, 26 Aug 2022 08:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245009AbiHZIkM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Aug 2022 04:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245188AbiHZIju (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Aug 2022 04:39:50 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDEFD5EA0
        for <linux-doc@vger.kernel.org>; Fri, 26 Aug 2022 01:38:58 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id fy31so1416106ejc.6
        for <linux-doc@vger.kernel.org>; Fri, 26 Aug 2022 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=R71pwovWKW2n+2d6b0m1mgjy0dLnYi4JvtwlQD06gkA=;
        b=HOYhgdUFdplD2/K5nkpukqq6uv07hu/JT8XDpoArdztp2I4032fFuMUGt3qDx/Z2aN
         G81QFtnRocphML9ByFf3YBnAsnTgYXseUp46UBefnFeLQ/RAdYwH0ND7MHrrrVv/g81D
         FLNcCXc1h1kM0geWX62XIGz+V1biKkGWZiVA91kN68Iug1cUEE4lrL5gzMBu5u30tYHj
         BgQVn9bplMsF7NKZHd+1WQyE0BOUT/lzmRYSqzHxODCibb8F75rLqxgnobNQjUSJ0DzA
         Biij0ShT3EOMaCOLt8e0yZ3zasIjt6JwGL4YezsWpET4KXZ0DSIrPbY4vs41IWhXLiyS
         9WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=R71pwovWKW2n+2d6b0m1mgjy0dLnYi4JvtwlQD06gkA=;
        b=Dyzl00t3r1lIFVexD+HlcsR7iUQZ7Yr5BHZcZAmMZtJ0l6jM2MDLqv+35gXjCxS3KV
         CKB/EFLKiP+dYUiXiYKnp3/VyG/fAJE+1LNf0VImbaXVt4mWx5Mkut/S3loOqydkuLiZ
         maIPwNj6Ev4vvgmNj538DflJTvCu4zqoZZ6d5oevNgign15i4pMJEblc5AGhBxAozu9U
         mgu8HXlI4dRM0f2ZsEafdcWIX9iM4CCH6meJkD6VRtDQlFJ2V1PF1cbm6kGLXGegq0K0
         aW/boF8ZQmnuj/q+FA/cfg7g0buHDqOeEaaDiA9cnXX/T1Vp2fT2iwmZzTBWQC6aFzTV
         Aa8A==
X-Gm-Message-State: ACgBeo2/G8AXKV09AroE/gDRiXn2N5m/MObgjmt2IEKAJY+kympehz2i
        olJYzd4ynIFbQ9ZadsEIc1u7rA==
X-Google-Smtp-Source: AA6agR7xZ/f2/7JcXvjG+baYgsb4aGLjnb/LeMzknsCulmovamHT43pUaI8v/g1EIwOCnTvvdm+aNQ==
X-Received: by 2002:a17:907:9710:b0:731:67b1:dc3b with SMTP id jg16-20020a170907971000b0073167b1dc3bmr4825640ejc.709.1661503136627;
        Fri, 26 Aug 2022 01:38:56 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id n17-20020aa7c691000000b0044657ecfbb5sm948867edq.13.2022.08.26.01.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 01:38:55 -0700 (PDT)
Date:   Fri, 26 Aug 2022 10:38:54 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Keller, Jacob E" <jacob.e.keller@intel.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        David Ahern <dsahern@kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [iproute2-next v3 2/3] mnlg: add function to get
 CTRL_ATTR_MAXATTR value
Message-ID: <YwiGnm3gj9z9FOmP@nanopsycho>
References: <20220725205650.4018731-1-jacob.e.keller@intel.com>
 <20220725205650.4018731-3-jacob.e.keller@intel.com>
 <Yt+b3XGbAixaf124@nanopsycho>
 <CO1PR11MB50890D5A3470D9921711A91AD6759@CO1PR11MB5089.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB50890D5A3470D9921711A91AD6759@CO1PR11MB5089.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fri, Aug 26, 2022 at 02:40:20AM CEST, jacob.e.keller@intel.com wrote:
>
>
>> -----Original Message-----
>> From: Jiri Pirko <jiri@resnulli.us>
>> Sent: Tuesday, July 26, 2022 12:47 AM
>> To: Keller, Jacob E <jacob.e.keller@intel.com>
>> Cc: netdev@vger.kernel.org; Jonathan Corbet <corbet@lwn.net>; Jiri Pirko
>> <jiri@nvidia.com>; David S. Miller <davem@davemloft.net>; Eric Dumazet
>> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
>> <pabeni@redhat.com>; Nguyen, Anthony L <anthony.l.nguyen@intel.com>;
>> David Ahern <dsahern@kernel.org>; Stephen Hemminger
>> <stephen@networkplumber.org>; linux-doc@vger.kernel.org
>> Subject: Re: [iproute2-next v3 2/3] mnlg: add function to get
>> CTRL_ATTR_MAXATTR value
>> 
>> Mon, Jul 25, 2022 at 10:56:49PM CEST, jacob.e.keller@intel.com wrote:
>> >Add a new function to extract the CTRL_ATTR_MAXATTR attribute of the
>> >CTRL_CMD_GETFAMILY request. This will be used to allow reading the
>> >maximum supported devlink attribute of the running kernel in an upcoming
>> >change.
>> >
>> >Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
>> 
>> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
>
>I had a new approach which just extracted maxattr and stored it hwnever we call CTRL_CMD_GETFAMILY, which I think is a preferable approach to this. That was part of the series I sent recently to support policy checking. I think I'd prefer that route now over this patch.

Send it :)

>
>Thanks,
>Jake
