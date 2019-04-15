Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 747A47D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Apr 2019 08:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfDOIfF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Apr 2019 04:35:05 -0400
Received: from chill.innovation.ch ([216.218.245.220]:38822 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbfDOIfE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Apr 2019 04:35:04 -0400
X-Greylist: delayed 592 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Apr 2019 04:35:04 EDT
Received: from localhost (localhost [127.0.0.1])
        by chill.innovation.ch (Postfix) with ESMTP id 83E4B640134;
        Mon, 15 Apr 2019 01:25:12 -0700 (PDT)
X-Virus-Scanned: amavisd-new at 
Authentication-Results: chill.innovation.ch (amavisd-new);
        dkim=pass (2048-bit key) header.d=innovation.ch
Received: from chill.innovation.ch ([127.0.0.1])
        by localhost (chill.innovation.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id H1LbtuUvMG6O; Mon, 15 Apr 2019 01:25:11 -0700 (PDT)
From:   =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch AF517640107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1555316710;
        bh=eNO0gOF1LZuJARxP4k12fOPQiYPfgCfYCjS8vUDbO60=;
        h=From:To:Cc:Subject:Date:From;
        b=HjrufkHippBr2y3B01/OL8ZSYBg7Dj4TFPsVGYL+7jAN8b07KIhDt/WeW648FK7al
         +UDDwpC/pxFOJRCoxvXqnhOcb7di+drKriU18sXZSIy6KHCcZQQ39tCJ8UMtFxOY90
         ki5k7W86GDSQo4PEBCTZpH8rTJ5UDaA7HU1+WMKhaVBG5U6+XkG40FNO6cH1BDAIvj
         9Zf4Okckgfh2jgd7W4nIAFMT6frbJnRO9/byLmr3f+JN6+qChNB2wiGHoRBtv4Q80A
         FiUSMqouuyYLCoN06SUXmRo5IgxpOyMI9AaPFRdDFtHrmEBwMiXDGMYxuD51OJIFZq
         laF6RNqskWp/Q==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] debugfs helpers cleanups
Date:   Mon, 15 Apr 2019 01:25:04 -0700
Message-Id: <20190415082506.25610-1-ronald@innovation.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

commit ff9fb72bc077 ("debugfs: return error values, not NULL") changed
the return values of various debugfs functions in fs/debugfs/inode.c but
did not update the documentation or behaviour of affected functions in
fs/debugfs/file.c . These patches attempt to remedy this.

Ronald Tschalär (2):
  debugfs: update documented return values of debugfs helpers
  debugfs: make return value of all debugfs helpers consistent

 Documentation/filesystems/debugfs.txt | 16 +++---
 fs/debugfs/file.c                     | 79 ++++++++++++---------------
 2 files changed, 45 insertions(+), 50 deletions(-)

-- 
2.20.1

