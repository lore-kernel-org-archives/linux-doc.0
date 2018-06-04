Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C91F7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 17:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751041AbeFDRYB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 13:24:01 -0400
Received: from mga17.intel.com ([192.55.52.151]:56988 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750995AbeFDRYA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Jun 2018 13:24:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2018 10:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,476,1520924400"; 
   d="scan'208";a="234547205"
Received: from jgopalak-mobl1.amr.corp.intel.com (HELO ellie) ([10.254.55.164])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2018 10:23:56 -0700
From:   Vinicius Costa Gomes <vinicius.gomes@intel.com>
To:     Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, henrik@austad.us,
        jesus.sanchez-palencia@intel.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: Re: [RFC PATCH 0/6] net: ethernet: ti: cpsw: add MQPRIO and CBS Qdisc offload
In-Reply-To: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
References: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
Date:   Mon, 04 Jun 2018 14:23:56 -0300
Message-ID: <87602y1n4j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ivan,

Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> writes:

> This series adds MQPRIO and CBS Qdisc offload for TI cpsw driver.
> It potentially can be used in audio video bridging (AVB) and time
> sensitive networking (TSN).
>
> Patchset was tested on AM572x EVM and BBB boards. Last patch from this
> series adds detailed description of configuration with examples. For
> consistency reasons, in role of talker and listener, tools from
> patchset "TSN: Add qdisc based config interface for CBS" were used and
> can be seen here: https://www.spinics.net/lists/netdev/msg460869.html
>
> Based on net-next/master
>

I didn't test this, but it looks fine from my side.

I agree with Grygorii, that if no comments, this should be re-sent as a
patch series next.


> Ivan Khoronzhuk (6):
>   net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
>   net: ethernet: ti: cpdma: fit rated channels in backward order
>   net: ethernet: ti: cpsw: add MQPRIO Qdisc offload
>   net: ethernet: ti: cpsw: add CBS Qdisc offload
>   net: ethernet: ti: cpsw: restore shaper configuration while down/up
>   Documentation: networking: cpsw: add MQPRIO & CBS offload examples
>
>  Documentation/networking/cpsw.txt       | 540 ++++++++++++++++++++++++
>  drivers/net/ethernet/ti/cpsw.c          | 364 +++++++++++++++-
>  drivers/net/ethernet/ti/davinci_cpdma.c |  31 +-
>  3 files changed, 913 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/networking/cpsw.txt
>
> -- 
> 2.17.0


Cheers,
--
Vinicius
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
