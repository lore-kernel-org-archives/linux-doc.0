Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254E3C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 17:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E42F664F07
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 17:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhBVR2J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 12:28:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhBVR2H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Feb 2021 12:28:07 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B0DC061786
        for <linux-doc@vger.kernel.org>; Mon, 22 Feb 2021 09:27:26 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id e9so8163706plh.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Feb 2021 09:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=edcfb6u/1BZN0KQqup+/d7AkLC2yW/srYObkME7xBZw=;
        b=WQVEROLZ/gB3RzKmDk5qFHfwaGxNwkrLQN0J/bFqnSSFzhuAy7x3pFQ8jlpZ7ZD3ll
         TYTuE+x07gkfKrYoip61kR6eR3uu4Wxb25u2EgUU3KjsdJSo81W0gkD89mH3YV0QN6c5
         BDPzjqP8LWC1LAHsgBOtphwnuEYAeOG6voZZZid1mVyW5WO5pRWCu8Sk1cz4Qnli7JiC
         BDojUO+Y8W4HB0HJZ3uyfo+V6wm5dLemqjwcOUW810l/I1BuckNRdziovy4rAf4fSy70
         W3n+G06fQd+woOgHozPIl14hD98+AV/5hmbzfRtdPpzF/yiOzLff6qLXLYLrBFEQbqEK
         4+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=edcfb6u/1BZN0KQqup+/d7AkLC2yW/srYObkME7xBZw=;
        b=O3BRBOtJNuGTNHxe+jy5lqSiva+7AUMUST1uvgFYMKxh2RDF8FT9swz60CzSWnHyWA
         KVfZTP8+x+1vCRCrTmYf/Jv0/FgPTRFmFLzWhd6foVabUSluIwq6Di358DUYVzWGNEq9
         IN/6ZwGHb56/7SNl98sGM1N7MBaqXg2SOMyo1UQbHEi/23OQTe2j6WSwRHB8QmD9Z4Gp
         viHEmjaPUp0xTRNRrCd5jFdwrsnmLErFjjMFp1Sl7uhCRTNGcZGywcmo2hPlVERjACXM
         7Zpc6SjK+xxJ3hWszOVdAIDFYBg9Q1jEQX3fUjp0WgSAo7kXaWt9zXPAVj0+EG3fc7Ru
         p33g==
X-Gm-Message-State: AOAM531dZlLCycE6JaXM5QyEtBJwFDc4IcMei4233aAVupnmtx4tcP+R
        /+8Jonpcw6LdzvzGHMNdKFjjKdxXAAllYg==
X-Google-Smtp-Source: ABdhPJw1d2qboOMWAmrZuuWgFSfoPCLXsgUVeus6Kk6uLUbaq1hUf8xWFoLVJw58F2c0YmFPKhm8kw==
X-Received: by 2002:a17:902:b48b:b029:e3:7808:aab4 with SMTP id y11-20020a170902b48bb02900e37808aab4mr23021419plr.54.1614014845604;
        Mon, 22 Feb 2021 09:27:25 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:d92b:2fcb:b6a3:bcc0? ([2405:201:600d:a089:d92b:2fcb:b6a3:bcc0])
        by smtp.gmail.com with ESMTPSA id n1sm18662545pgn.94.2021.02.22.09.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 09:27:25 -0800 (PST)
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, corbet@lwn.net
Cc:     linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
From:   Aditya <yashsri421@gmail.com>
Subject: Investigating parsing error for struct/union
Message-ID: <5933570a-7768-26b2-40d0-1acac999d9f6@gmail.com>
Date:   Mon, 22 Feb 2021 22:57:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan, Lukas

While investigating "error: Cannot parse struct or union!", I
discovered few more patterns causing this error:
1) A large part of this error(~80%) occurs due to the presence of one
or more lines(such as '#define' lines) between commented code and
struct declaration.

For e.g., in include/linux/platform_data/apds990x.h:

/**
 * struct apds990x_chip_factors - defines effect of the cover window
 * @ga: Total glass attenuation
 * @cf1: clear channel factor 1 for raw to lux conversion
 * @irf1: IR channel factor 1 for raw to lux conversion
 * @cf2: clear channel factor 2 for raw to lux conversion
 * @irf2: IR channel factor 2 for raw to lux conversion
 * @df: device factor for conversion formulas
 *
 * Structure for tuning ALS calculation to match with environment.
 * Values depend on the material above the sensor and the sensor
 * itself. If the GA is zero, driver will use uncovered sensor default
values
 * format: decimal value * APDS_PARAM_SCALE except df which is plain
integer.
 */
#define APDS_PARAM_SCALE 4096
struct apds990x_chip_factors {
	int ga;
	int cf1;
	int irf1;
	int cf2;
	int irf2;
	int df;
};


2) If struct does not contain any members, for e.g., in
include/linux/xz.h:

/**
 * struct xz_dec - Opaque type to hold the XZ decoder state
 */
struct xz_dec;

Here, it causes error as the curly braces and members expected by the
regex, are absent.
This kind of use has also been made in include/linux/zstd.h:

/**
 * struct ZSTD_DDict - a digested dictionary to be used for decompression
 */
typedef struct ZSTD_DDict_s ZSTD_DDict;


3) Different Syntax than expected. For e.g.:
    a) struct xyz struct_name {} syntax. This syntax has been used in
arch/arm/mach-omap2/omap_hwmod_common_data.c file
    b) "static __maybe_unused const struct st_sensors_platform_data
default_press_pdata = {" in drivers/iio/pressure/st_pressure.h.
This kind of syntax has also been used in
drivers/iio/accel/st_accel.h, and drivers/iio/gyro/st_gyro.h

I wanted to take your opinion if we should extend support for any of
these syntax, causing the error. If not, perhaps we can make the
documentation a bit clear, atleast for (1), which causes most of these
errors; so as to not include any lines between comment and struct
declaration.

What do you think?

Thanks
Aditya
