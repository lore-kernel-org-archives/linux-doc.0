Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD69CC0015E
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 12:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjGCMrx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 08:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjGCMrx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 08:47:53 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA77106
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 05:47:52 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3142a9ff6d8so2596080f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388470; x=1690980470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVY/yta8MPWmg9iGDhd2QZ8qAlvFNnDO2cXvkrgJQ+E=;
        b=QlE2Iqus6AP6Te3dv3Y5Sx4aMQ+r5SKgwVSpZ0lVhlvFOkGw0WYXtGXIyYV13AdXyg
         BF50w/diT8Np6DqNMws/6d/47CDoirkmcKusK6cN3dPFI2VGnUd9hAmyNYSlA4poktO+
         eBlIbLnt08K37EodkyVat6+liUHZWpeoQatiE5O/3ceBUMebG7p6wzso8g68vqx48QeP
         Q50WOmsmdac9sn01EhF2WYiEkGFTwOTVO9QCJi6lJY9lnNqqXeQk/4wQoS1+c5EPLsLm
         ycCf9vXUK/7Q3fhEEM4/FDM3oJBppGTNdLj8CelDbYB3NzmZu/AEwfXT3hZ6/haUCtRa
         EgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388470; x=1690980470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVY/yta8MPWmg9iGDhd2QZ8qAlvFNnDO2cXvkrgJQ+E=;
        b=UGs5kEZa3xZjl4aQTKL9CWuIbsmnZReLPodK/4Ej3+63P9QLhYrL8/IfGhYD3qOBYw
         8btuQ7fuqVYT7qKhOVHCVLgu8TsJlayrg6RfylH/74HrR0n1bOJzFscOsgA96IIm7+Nt
         9XLKQIJx13lxyAVy2kSzFBFXbDhYEvPQYJS8XBpEHBb4z5oU6i/3j2x3I0HYY3E9pX1T
         8E+5lNLnNFcdAS2hPfH9QEaS9/3wq+Zttf5x5yw1j7/181duD2rMCWU9GSup9ZGd3uP9
         Q/7AV5wkJWtnYcGlGK5LWk4FHcHiJ74nszDrbWZd52lkrX3coJ+v4JJDfsgxYeqSM5yr
         GHdw==
X-Gm-Message-State: ABy/qLbX0gKkR5ujFfzfHm7E9gbR6JQH2A36VC7IHfl9RNjGvLLnegX+
        bDiUei6QoHAtmz8NdFeMb0Rpyg==
X-Google-Smtp-Source: APBJJlGkvS0VBTA5uxFkpZhC1EeXtotxBOQUfL8gsoFO3JwjxcRP9zPFqdv6CO7IZsrTAyG8/+JKUQ==
X-Received: by 2002:a05:6000:124f:b0:314:3746:d44b with SMTP id j15-20020a056000124f00b003143746d44bmr2701847wrx.41.1688388470517;
        Mon, 03 Jul 2023 05:47:50 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6782000000b00313f5babb18sm19568022wru.9.2023.07.03.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:47:50 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atishp@atishpatra.org>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 01/10] perf: Fix wrong comment about default event_idx
Date:   Mon,  3 Jul 2023 14:46:38 +0200
Message-Id: <20230703124647.215952-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit c719f56092ad ("perf: Fix and clean up initialization of
pmu::event_idx"), event_idx default implementation has returned 0, not
idx + 1, so fix the comment that can be misleading.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index d5628a7b5eaa..56fe43b20966 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -442,7 +442,8 @@ struct pmu {
 
 	/*
 	 * Will return the value for perf_event_mmap_page::index for this event,
-	 * if no implementation is provided it will default to: event->hw.idx + 1.
+	 * if no implementation is provided it will default to 0 (see
+	 * perf_event_idx_default).
 	 */
 	int (*event_idx)		(struct perf_event *event); /*optional */
 
-- 
2.39.2

