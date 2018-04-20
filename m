Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7F80A7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 05:30:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751254AbeDTFac convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 01:30:32 -0400
Received: from esa4.barco.c3s2.iphmx.com ([68.232.151.234]:51152 "EHLO
        esa4.barco.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750729AbeDTFac (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Apr 2018 01:30:32 -0400
X-Greylist: delayed 596 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Apr 2018 01:30:31 EDT
X-IronPort-AV: E=Sophos;i="5.49,300,1520902800"; 
   d="scan'208";a="8121030"
Received: from 68.172-183-91.adsl-static.isp.belgacom.be (HELO emeasmtp.barco.com) ([91.183.172.68])
  by esa4.barco.c3s2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 20 Apr 2018 04:20:34 -0100
Received: from lists.barco.com (10.197.195.31) by emeasmtp.barco.com
 (10.248.103.26) with Microsoft SMTP Server (TLS) id 14.3.361.1; Fri, 20 Apr
 2018 07:20:33 +0200
Received: from peko by lists.barco.com with local (Exim 4.84_2) (envelope-from
 <peter.korsgaard@barco.com>)   id 1f9OYD-0006ZQ-Nh; Fri, 20 Apr 2018 07:25:37
 +0200
From:   Peter Korsgaard <peter.korsgaard@barco.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     <linux-i2c@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] i2c: i2c-mux-gpio: move header to platform_data
References: <20180419200015.15095-1-wsa@the-dreams.de>
        <20180419200015.15095-3-wsa@the-dreams.de>
Date:   Fri, 20 Apr 2018 07:25:37 +0200
In-Reply-To: <20180419200015.15095-3-wsa@the-dreams.de> (Wolfram Sang's
        message of "Thu, 19 Apr 2018 22:00:08 +0200")
Message-ID: <85fu3qzbxq.fsf@lists.barco.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>>>>> "WS" == Wolfram Sang <wsa@the-dreams.de> writes:

WS> This header only contains platform_data. Move it to the proper directory.
WS> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Thanks,

Acked-by: Peter Korsgaard <peter.korsgaard@barco.com>

--
Bye, Peter Korsgaard
This message is subject to the following terms and conditions: MAIL DISCLAIMER<http://www.barco.com/en/maildisclaimer>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
