Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D33437E6AB
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 20:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751857AbeCNUWp convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 16:22:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:40873 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751769AbeCNUWn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Mar 2018 16:22:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Mar 2018 13:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,307,1517904000"; 
   d="scan'208";a="211349241"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
  by fmsmga006.fm.intel.com with ESMTP; 14 Mar 2018 13:22:42 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 14 Mar 2018 13:22:42 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.72]) by
 ORSMSX156.amr.corp.intel.com ([169.254.8.98]) with mapi id 14.03.0319.002;
 Wed, 14 Mar 2018 13:22:42 -0700
From:   "Brown, Aaron F" <aaron.f.brown@intel.com>
To:     "corbet@lwn.net" <corbet@lwn.net>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: Documentation: networking: ixgb: Remove reference to IXGB_NAPI
Thread-Topic: RE: Documentation: networking: ixgb: Remove reference to
 IXGB_NAPI
Thread-Index: AdO70avhN/gcWYATTBCBERvqhZKvfg==
Date:   Wed, 14 Mar 2018 20:22:41 +0000
Message-ID: <309B89C4C689E141A5FF6A0C5FB2118B8C8039BC@ORSMSX101.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> From patchwork Mon Jan 29 12:17:54 2018
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Subject: Documentation: networking: ixgb: Remove reference to IXGB_NAPI
> X-Patchwork-Submitter: Corentin Labbe <clabbe@baylibre.com>
> X-Patchwork-Id: 867294
> X-Patchwork-Delegate: jeffrey.t.kirsher@intel.com
> Message-Id: <1517228274-1305-1-git-send-email-clabbe@baylibre.com>
> To: corbet@lwn.net,	jeffrey.t.kirsher@intel.com
> Cc: Corentin Labbe <clabbe@baylibre.com>, intel-wired-lan@lists.osuosl.org, 
>  linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
> Date: Mon, 29 Jan 2018 12:17:54 +0000
> From: Corentin Labbe <clabbe@baylibre.com>
> List-Id: Intel Wired Ethernet Linux Kernel Driver Development  <intel-wired-lan.osuosl.org>
>
> NAPI is enabled by default and IXGB_NAPI was removed since
> commit 6d37ab282e24 ("ixgb: make NAPI the only option and the default")
> Update the doc accordingly.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/networking/ixgb.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Tested-by: Aaron Brown <aaron.f.brown@intel.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
