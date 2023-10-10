Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC59DCD68ED
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 07:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442460AbjJJHoG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Oct 2023 03:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442640AbjJJHoG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 03:44:06 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E766A4
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 00:44:04 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5334d78c5f6so9183526a12.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1696923843; x=1697528643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QVEQlE8CCIVwnGqK4YUqVY53iGiWzOI0vN++OTPijXI=;
        b=Fv1gD1zvbwzj8xqoaspwQSGZfY/xNOAagvhZNyXStLh9LcYD30fCPwI1fgX2HnDV8G
         YZzkG/fzijPtnQ2eIajXgEsnrxZAowvLnHDDQ3CITSZsLVd8UiUHSWRrMIVDLkufYplz
         yFQUbrXLioql/QcPkARRgzPURLVTDRy2kDhieLH8hU1Xc0GsbXzqly/INX36zHCgBP+4
         UAGmGleelIZyiacwYv3v3NIuik5wCd/BEDF9C9+HUbzi/EaMnSktdjcAarneVzzlBa2b
         vbqQwlzT/CuMI6655GL8Te0lPGDuwD75ujlXZcp4DYHOIRP91YPb7dhs18fdQWWasVN9
         Gn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696923843; x=1697528643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVEQlE8CCIVwnGqK4YUqVY53iGiWzOI0vN++OTPijXI=;
        b=nkS6l8cb/LZCYHD4fGm3BsA6UTScnUVnP9qTZk3Q9qi5BcdyUD4YxHxajdgLttq7Zc
         hgUo9nB2ASJSxTrvV4dQt3/NLzMnI8OFFKH0Mv5JvEhygwU5jPiSw84BD9YkYq7Iag33
         +RO6/g2HGnDFVCJ5LUXMrC9jaEMyqAJ7pQVlNq5K7M3BV3enCozwDOM3nuT/8TYI5yt6
         YkVTarfAxfo9yWZVNxY1kWdoj3BcK2t074V3hjTVK8AOjZD/N40/35PsicTMptlRm5TM
         xK0qHASu+HwIxx9I22aUXBeaO9giHeEW92wMQYeRJob+gwtVwlfn6wvF+wQ7UnXxHOu2
         uqUg==
X-Gm-Message-State: AOJu0Yz6w87e1CboUI7Jq+Orsa3PcqJabM637vtrDtYg3NOLTNDyS5IF
        zozCCt6C5tq546IYFXVs4Jj0AA==
X-Google-Smtp-Source: AGHT+IFL1RLTSKOpPDsX7c9Y6kK6SnX0Eigk+JI0p0u06K7LwkxKxcdtMGpejJCVdqaTlJBwab2cTA==
X-Received: by 2002:a05:6402:1257:b0:530:c363:449c with SMTP id l23-20020a056402125700b00530c363449cmr13150716edw.40.1696923842725;
        Tue, 10 Oct 2023 00:44:02 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id o14-20020aa7c50e000000b0052595b17fd4sm7153292edq.26.2023.10.10.00.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 00:44:02 -0700 (PDT)
Date:   Tue, 10 Oct 2023 09:44:00 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v4 0/5] dpll: add phase-offset and phase-adjust
Message-ID: <ZSUAwPOy8HAsB4+8@nanopsycho>
References: <20231009222616.12163-1-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009222616.12163-1-arkadiusz.kubalewski@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tue, Oct 10, 2023 at 12:26:11AM CEST, arkadiusz.kubalewski@intel.com wrote:
>Improve monitoring and control over dpll devices.
>Allow user to receive measurement of phase difference between signals
>on pin and dpll (phase-offset).
>Allow user to receive and control adjustable value of pin's signal
>phase (phase-adjust).
>
>v3->v4:
>- do not increase do version of uAPI header as it is not needed (v3 did
>  not have this change)
>- fix spelling around commit messages, argument descriptions and docs
>- add missing extack errors on failure set callbacks for pin phase
>  adjust and frequency
>- remove ice check if value is already set, now redundant as checked in
>  the dpll subsystem
>
>v2->v3:
>- do not increase do version of uAPI header as it is not needed
>
>v1->v2:
>- improve handling for error case of requesting the phase adjust set
>- align handling for error case of frequency set request with the
>approach introduced for phase adjust
>
>
>Arkadiusz Kubalewski (5):
>  dpll: docs: add support for pin signal phase offset/adjust
>  dpll: spec: add support for pin-dpll signal phase offset/adjust
>  dpll: netlink/core: add support for pin-dpll signal phase
>    offset/adjust
>  ice: dpll: implement phase related callbacks
>  dpll: netlink/core: change pin frequency set behavior


I'm fine with the set at is now. Thanks!
set-
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
