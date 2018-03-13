Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9299E7E66E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 00:07:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751415AbeCMAH4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Mar 2018 20:07:56 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:46628 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751359AbeCMAH4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Mar 2018 20:07:56 -0400
Received: by mail-wr0-f193.google.com with SMTP id m12so17642973wrm.13;
        Mon, 12 Mar 2018 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=Su2tUA7jUAhqQOaUKRkxfBcqoNkPeRH8HSK9dLHkrFI=;
        b=LCFTFGb5aEJt1CetmEHGVevBh8hSAi5FQo5maHbaNXbp/VaxV2tcy1Giasmz0mxFp6
         UjeljGFBaUjQ26y3wvojqxogW7sWVX+dQUt9UFf2hD39A71QPzm4F9nY+UcwVX6UEJrH
         ZZByAAas8fZKbnHAx/W/Rft8dP9Z47KZEnbJ4RdgHqpEh/vkBWaDyOF1Wp8Lgo5qvK2q
         GBH0qiP+asj0UUzL6dvtgFo1/xsn8GRjZkg3tnfQVb/gP3EsBElfEMxisQSxvROSvYDX
         tRIellSHgkVd5U/4eVtCFvcmcZLOfduaeKx8xQN7d/nZKFJ3TYEjJeDMJe/DJjKck5BY
         m56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=Su2tUA7jUAhqQOaUKRkxfBcqoNkPeRH8HSK9dLHkrFI=;
        b=RJ0Y+RinLGxxnSYa/Yxib8qwD7YZTjQV07OoImn/q1t11upw/rCVFhMwUSawBX9q6M
         /l0YCc7d+vb0Ff0jY05EGXeIZVgKMxnz0gyD1dvupzA9ztkiVkQF8IeWXdKN58Pr7wSQ
         T6WNrEfm2hf2tX0gxzIoxHOWypCTVXaP2bO+V+gXfGVvrgJhODyHvlab3DpoEOfVBPkE
         lo7SmuBp6fH09EdzJOWnrls6vlAjLKMiFGzjNdYCL6Z6dJaEBCIVkDpyMYIhBy2DcNiM
         jKx4t8+daBB6yegjroUhKUHwyT7aPXdAcoaV9VFSdK2vPlmiUmQ95fyrOj9mI3O624zP
         ddPg==
X-Gm-Message-State: AElRT7EWFyYKk16xbDanFNPDVHds7HlwisUUk7UNbe+YuDT51PU+irVI
        yq2b7VW3IvvdQYQ6/NxRxE3XYO1MGKA=
X-Google-Smtp-Source: AG47ELsvVNOiy2IC8LbfY56Cz2OaAvgXYWiA4EU/QZHVA7bl4soiEnHcjmaRuG++4IxYiu45RbG0Iw==
X-Received: by 10.28.51.67 with SMTP id z64mr3824627wmz.59.1520899674778;
        Mon, 12 Mar 2018 17:07:54 -0700 (PDT)
Received: from gmail.com ([193.125.157.122])
        by smtp.gmail.com with ESMTPSA id 33sm2559107wrs.74.2018.03.12.17.07.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Mar 2018 17:07:54 -0700 (PDT)
Date:   Tue, 13 Mar 2018 01:07:37 +0100
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
To:     w@1wt.eu, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Doc: misc-devices: move lcd-panel-cgram.txt to auxdisplay/
Message-ID: <20180313000737.aybluy746piwyzll@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: elm/2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 7005b58458e4beecaf5efacb872c456bc7d3541a ("Staging: add lcd-panel
driver") introduced the panel driver, which is now in
drivers/auxdisplay.

Cc: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
---
 Documentation/{misc-devices => auxdisplay}/lcd-panel-cgram.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/{misc-devices => auxdisplay}/lcd-panel-cgram.txt (100%)

diff --git a/Documentation/misc-devices/lcd-panel-cgram.txt b/Documentation/auxdisplay/lcd-panel-cgram.txt
similarity index 100%
rename from Documentation/misc-devices/lcd-panel-cgram.txt
rename to Documentation/auxdisplay/lcd-panel-cgram.txt
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
