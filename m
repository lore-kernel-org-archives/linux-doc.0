Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DFC767D071
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Jul 2018 10:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753439AbeGEKjG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Jul 2018 06:39:06 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40039 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753409AbeGEKjF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Jul 2018 06:39:05 -0400
Received: by mail-lj1-f195.google.com with SMTP id a6-v6so6305361ljj.7;
        Thu, 05 Jul 2018 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=1fGsup6DZOec5PkakbxKj6/huecf/uJS5zR5JIMAAXs=;
        b=vcaZRzOjj+r39XxqQS2npK+s5jEDAPsCOVc2b795GRdRqr6Zfhg4qX0cOm4k9nl8vN
         fH78Blzf4ME3WtJtoPWLLQ/71wE8CNjsnglino7WWeOTEPetMUvSRvKDwUv2rEIPhXER
         Xq8z8qg2M2voKBB/I74PCWjQ3mXC/4lAZR7twe137Be2iV/Vnm2jhuBKWXatnL+99eq6
         yiN1/S/ECMJw5ZLQDDJBzXBbO9+OrIBJYnF7FQ0NkiqsIkdsZl1XW/w4m3x6RX+jcniz
         cD38fYqOKZ3xL58cQN0mb0bjVSh1PgJBUsocg/Io0CQchE8nT7UApmoC+pyXqzL+3qXK
         R/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=1fGsup6DZOec5PkakbxKj6/huecf/uJS5zR5JIMAAXs=;
        b=il72ImWQWIJYaDvYYtdIU0V/9l3AGkQ/vS9lpUrjkLQBwQi0msP3+QZounAAdKpo3F
         iO6KL8X/f2OBz2ftblgPMkb86tnNTP/pxZP3ZV1VmNa6yekfa3LF2HVw3ReyCuH9+Qkv
         os0366UmiU/M+YufVloy5nTRiS7nc0Zb8CIGM9ExOKgaipOutQ/3kKcBpca/ptRElsMa
         a6isQ/v8KNAG71eDbs+MD9vS/CvTsq3WPM0r7gtkRre7JcnoOfGs6vvkOjzkWLfnYASf
         CjTrxUZEbaO/ldhMCaGRz5QT24gzb8NM56CT1VzD6L+eHtj9VkGsNbouje6ys+tKjykv
         Jb2Q==
X-Gm-Message-State: APt69E3nN8fA3lqRIVocga3/uB8yGYgJ1oVBY4nF8urr782nTkmXgBPY
        BC5ixlNAx+STR0LVnrKFD1w=
X-Google-Smtp-Source: AAOMgpdmOIYnCBH9d00E2nNd1g7GFZHKmb8s+RLj12aDZuVm8tGklear8etmk6V6RHGLrVf5fWllUA==
X-Received: by 2002:a2e:750d:: with SMTP id q13-v6mr3795931ljc.56.1530787144183;
        Thu, 05 Jul 2018 03:39:04 -0700 (PDT)
Received: from xi.terra (c-8bb2e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.178.139])
        by smtp.gmail.com with ESMTPSA id h20-v6sm1350201lfl.77.2018.07.05.03.39.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jul 2018 03:39:03 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1fb1f3-00014r-28; Thu, 05 Jul 2018 12:38:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
        linux-doc@vger.kernel.org, Chris Jakob <chris.jakob@gmail.com>
Subject: [PATCH 0/2] USB: serial: kl5kusb105 clean ups
Date:   Thu,  5 Jul 2018 12:38:31 +0200
Message-Id: <20180705103833.4095-1-johan@kernel.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As reported by Chris, the kl5kusb105 does not work with KLSI devices so
remove the device-id entry which even had a typo in it.

In fact, the sole remaining Palmconnect device is also listed in the
visor driver (PALM_M100_ID), but the protocol used there looks different
from what the one kl5kusb105 uses so we can't simply remove the driver.

Let's just leave this for now...

Johan


Johan Hovold (2):
  USB: serial: kl5kusb105: remove KLSI device id
  USB: serial: clean up kl5kusb105 documentation

 Documentation/usb/usb-serial.txt | 9 ---------
 drivers/usb/serial/kl5kusb105.c  | 1 -
 drivers/usb/serial/kl5kusb105.h  | 3 ---
 3 files changed, 13 deletions(-)

-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
