Return-Path: <SRS0=tUtt=7I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10F7C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 26 May 2020 14:58:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B401A20723
	for <linux-doc@archiver.kernel.org>; Tue, 26 May 2020 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590505120;
	bh=2UCJ2+0HMUg+V9H51K3IUfS7z9rwxVY2sHw2wIkMC/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=jJ98x6i8zzGb7E8ZZI6AkJ40DJ/XxYEdxbqCSn/slRJ/8ngFnRlwsy631UVm7H/nR
	 G2fd5zjrIc1yH6dsT+1jQycs42svYMb2V2XXBk8ECcXC473hHpXMCe7rEBVSGat5kR
	 vkujM2fuqZcqk4HAMa+20xk+JCkLhjE4zEcIDx+U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731439AbgEZO6j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 May 2020 10:58:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35372 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731388AbgEZO6b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 May 2020 10:58:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id t11so10195939pgg.2
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2020 07:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLNCK+WRq9ug4fTBP9sca/wv2hUwl+4zOX5ypfLbsKY=;
        b=hG+DPYgD0/23yk7n3ASjxV8MTPDeZJbgOMtwxehQxH1cXxXHSv7o3OPrT5KnJcTJrx
         XHlYVkxqGQoHHZyLUPH2/wvS8e7Op9TeCfL6awDmSJmJanHo8xU+KjYsV+Mp35duetU1
         V+GpGTdWf+13HO3a1Bnbzuin+JoDksidB3nEjL4Wh0J9ApITYrhoQuzoeFmFLmzinqqv
         EJZwCdmNSrtthKXBnnjUEVgoPtr0cDWPyXkDtJL8AxEfef4EYzTq7JKT0TnV137TGDhh
         /nrq6mRRXJWP3g3daVBuzfUq6qS+Lvb2Ri45yKEkm4YTMMzl2m4KChDKMr3bNrRkz+q8
         xFxg==
X-Gm-Message-State: AOAM533EVu1eKc43FpXXbdd3dqG9Tm7l7tNXqZyicQYc+P0hTAlawnD1
        ARp/1rDGV1pa7Ac4uudMzZM=
X-Google-Smtp-Source: ABdhPJzDWLtwvas342oLLBbWzp9O/jLS9BbQYWB+rlrNehY+akP4TgR/psy1HIfLZmxcb9Z85FPPBg==
X-Received: by 2002:a63:1312:: with SMTP id i18mr1480455pgl.142.1590505110899;
        Tue, 26 May 2020 07:58:30 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id j6sm10039089pfi.183.2020.05.26.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 07:58:25 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id D804142309; Tue, 26 May 2020 14:58:18 +0000 (UTC)
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     jeyu@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     michael.chan@broadcom.com, dchickles@marvell.com,
        sburla@marvell.com, fmanlunas@marvell.com, aelior@marvell.com,
        GR-everest-linux-l2@marvell.com, kvalo@codeaurora.org,
        johannes@sipsolutions.net, akpm@linux-foundation.org,
        arnd@arndb.de, rostedt@goodmis.org, mingo@redhat.com,
        aquini@redhat.com, cai@lca.pw, dyoung@redhat.com, bhe@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, gpiccoli@canonical.com,
        pmladek@suse.com, tiwai@suse.de, schlad@suse.de,
        andriy.shevchenko@linux.intel.com, derosier@gmail.com,
        keescook@chromium.org, daniel.vetter@ffwll.ch, will@kernel.org,
        mchehab+samsung@kernel.org, vkoul@kernel.org,
        mchehab+huawei@kernel.org, robh@kernel.org, mhiramat@kernel.org,
        sfr@canb.auug.org.au, linux@dominikbrodowski.net,
        glider@google.com, paulmck@kernel.org, elver@google.com,
        bauerman@linux.ibm.com, yamada.masahiro@socionext.com,
        samitolvanen@google.com, yzaikin@google.com, dvyukov@google.com,
        rdunlap@infradead.org, corbet@lwn.net, dianders@chromium.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v3 7/8] liquidio: use new taint_firmware_crashed()
Date:   Tue, 26 May 2020 14:58:14 +0000
Message-Id: <20200526145815.6415-8-mcgrof@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200526145815.6415-1-mcgrof@kernel.org>
References: <20200526145815.6415-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This makes use of the new taint_firmware_crashed() to help
annotate when firmware for device drivers crash. When firmware
crashes devices can sometimes become unresponsive, and recovery
sometimes requires a driver unload / reload and in the worst cases
a reboot.

Using a taint flag allows us to annotate when this happens clearly.

Cc: Derek Chickles <dchickles@marvell.com>
Cc: Satanand Burla <sburla@marvell.com>
Cc: Felix Manlunas <fmanlunas@marvell.com>
Acked-by: Rafael Aquini <aquini@redhat.com>
Reviewed-by: Derek Chickles <dchickles@marvell.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/net/ethernet/cavium/liquidio/lio_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index 66d31c018c7e..ee1796ea4818 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -801,6 +801,7 @@ static int liquidio_watchdog(void *param)
 			continue;
 
 		WRITE_ONCE(oct->cores_crashed, true);
+		taint_firmware_crashed();
 		other_oct = get_other_octeon_device(oct);
 		if (other_oct)
 			WRITE_ONCE(other_oct->cores_crashed, true);
-- 
2.26.2

