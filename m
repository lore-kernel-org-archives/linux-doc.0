Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F033C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 23 Jul 2022 15:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiGWPoK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 23 Jul 2022 11:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234008AbiGWPoG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Jul 2022 11:44:06 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C5A1F62C
        for <linux-doc@vger.kernel.org>; Sat, 23 Jul 2022 08:44:01 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id fy29so13215411ejc.12
        for <linux-doc@vger.kernel.org>; Sat, 23 Jul 2022 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vzbWWqxYeYmLDBePzGJZG4u77RbNrENkiUPgbd2i+ek=;
        b=C76uGIWVZX1OHxEG4XznyoLri0sHiDUk31pJHae/yAP2qUBtoyvVFJ6AiqWk5xwsf4
         xpuzkyKMKqio802O4NGA24Yz1Z9ZmWxQ/Jb2tRRJOPlSdMmkynMaKh2sMWncAaTpe9Mv
         4ln/lZH/BwkjqkDboNJcpl8unxEuILWMvUZtSNGZ5lFGzoGsfG0R1JyfAynoKdqpp3Mc
         qdRNNcy3WCit/52vpRbDEU/McVzTaCZ2oKCP7po2TBt92wH+6wjQWvfSRLf0SZCPa0Pz
         2WmsHD1KZWBoqHqjwJzUwiyWK/hsGn+g0LQjTTw1a6UEveNxcGxiBa19x7SivDPVLs4C
         Ro9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vzbWWqxYeYmLDBePzGJZG4u77RbNrENkiUPgbd2i+ek=;
        b=kmUOI45DQEnoObq07UP8EBFTMuo26BKznC4CF5+VAkYXhMulDg9O5hb+LL/1Zl9QN0
         13TiOrSxe0kFppU6nhBMCj1VOcPjOT0psMp72Z9iRkaV+dgBICi3Pi844RxushgtB9i2
         RoyHzeRPM0LIgs4Yi8KRqHwg6V99Prynv09FaPmbg0tQ0zXISxc7ngmkgp3xyKdm+BKV
         /246HaEmA8i7goiX6f/0n4U0qfcu20etcnCdxLHj9gPWa6sy0bGWW8v1EWFuDh9Gt/ZH
         /XET/MnhM7en1c0QLOM0m57r3/T3XynpT5oZJ07PGYXLmegnvSXxEZoWQyMIQHNuCsPA
         viyA==
X-Gm-Message-State: AJIora/GIyYXY5yebyCPFUQC4vRo14n7CsZqED9WKTLL/+5JqzG6xnKH
        0/3t41tIfCUJLl/OvC92QJ6Ppw==
X-Google-Smtp-Source: AGRyM1vlA9IvYPgdQRXjnokImcQLgvSSbSzQxehA3bchGJ58rbFWaNZECNVjDmku9kf5pVwoBj17qg==
X-Received: by 2002:a17:907:7b87:b0:72e:d45a:17af with SMTP id ne7-20020a1709077b8700b0072ed45a17afmr3833010ejc.73.1658591039932;
        Sat, 23 Jul 2022 08:43:59 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id i12-20020a170906090c00b0072af56103casm3214985ejd.220.2022.07.23.08.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 08:43:59 -0700 (PDT)
Date:   Sat, 23 Jul 2022 17:43:58 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vikas Gupta <vikas.gupta@broadcom.com>
Cc:     jiri@nvidia.com, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        dsahern@kernel.org, stephen@networkplumber.org,
        edumazet@google.com, pabeni@redhat.com, ast@kernel.org,
        leon@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
        michael.chan@broadcom.com, andrew.gospodarek@broadcom.com
Subject: Re: [PATCH net-next v6 1/2] devlink: introduce framework for
 selftests
Message-ID: <YtwXPt1VzGQr/6Bg@nanopsycho>
References: <20220723042206.8104-1-vikas.gupta@broadcom.com>
 <20220723042206.8104-2-vikas.gupta@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723042206.8104-2-vikas.gupta@broadcom.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sat, Jul 23, 2022 at 06:22:05AM CEST, vikas.gupta@broadcom.com wrote:
>Add a framework for running selftests.
>Framework exposes devlink commands and test suite(s) to the user
>to execute and query the supported tests by the driver.
>
>Below are new entries in devlink_nl_ops
>devlink_nl_cmd_selftests_show_doit/dumpit: To query the supported
>selftests by the drivers.
>devlink_nl_cmd_selftests_run: To execute selftests. Users can
>provide a test mask for executing group tests or standalone tests.
>
>Documentation/networking/devlink/ path is already part of MAINTAINERS &
>the new files come under this path. Hence no update needed to the
>MAINTAINERS
>
>Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
>Reviewed-by: Michael Chan <michael.chan@broadcom.com>
>Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
