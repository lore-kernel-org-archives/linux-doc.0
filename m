Return-Path: <SRS0=QTCz=7W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02D0C433DF
	for <linux-doc@archiver.kernel.org>; Tue,  9 Jun 2020 01:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 924D420775
	for <linux-doc@archiver.kernel.org>; Tue,  9 Jun 2020 01:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgFIBp4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Jun 2020 21:45:56 -0400
Received: from mga14.intel.com ([192.55.52.115]:17503 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbgFIBpz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 8 Jun 2020 21:45:55 -0400
IronPort-SDR: mXe1OjZDjqhtK7CAVNpBkmzYwdLym7wXJ3mk8Tec+YTiA5H7sHp0Evejc990yG4dF1tMd9+kuB
 tTDRSYOgbj0A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2020 18:45:55 -0700
IronPort-SDR: jmJ9jh+uT03iIvLaD2I5xqbipPHwU1APUl1lUSh7ZiNJr0EDR+YzvPZZgcLtuzcpXyYTgOo8kO
 6sxB/lur4uhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,490,1583222400"; 
   d="scan'208";a="306119714"
Received: from lkp-server01.sh.intel.com (HELO 12d5c0ac8e64) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Jun 2020 18:45:52 -0700
Received: from kbuild by 12d5c0ac8e64 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jiTKq-00006V-2k; Tue, 09 Jun 2020 01:45:52 +0000
Date:   Tue, 9 Jun 2020 09:45:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Cc:     kbuild-all@lists.01.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC PATCH] drm/print: trace_arr can be static
Message-ID: <20200609014505.GA50763@37d9db08ab2a>
References: <20200608210505.48519-14-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608210505.48519-14-sean@poorly.run>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 drm_print.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index c4bef38921db1..a50d0b24c911f 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,7 +69,7 @@ MODULE_PARM_DESC(trace, DEBUG_PARM_DESC("tracefs"));
 module_param_named(trace, __drm_debug_trace, int, 0600);
 
 #ifdef CONFIG_TRACING
-struct trace_array *trace_arr;
+static struct trace_array *trace_arr;
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
