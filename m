Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CABE87D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 09:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751173AbeEVJxE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 05:53:04 -0400
Received: from mail-pg0-f68.google.com ([74.125.83.68]:41329 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751106AbeEVJxC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 05:53:02 -0400
Received: by mail-pg0-f68.google.com with SMTP id d14-v6so4052793pgv.8
        for <linux-doc@vger.kernel.org>; Tue, 22 May 2018 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U7YBbDsM4awq/v1ZlW+haJQmiy72s9QX+4GQxjEFegw=;
        b=BMIbj4LvxvAA3soz4XKLKWWyyyq1yyDuOLqfoCeg13JYt5d+xB9HfUX+0o/wYH+qiF
         t2Zf3FX43tH80Vi49DbSyXVtTFkyRcxc1xIy0Kuv4WsqEdTgQ1XdZNmjE//ANJ1s7uKY
         A4i3azK9OQRpThgSghdVO7yMYosTIsfaeA8rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U7YBbDsM4awq/v1ZlW+haJQmiy72s9QX+4GQxjEFegw=;
        b=IOaa9SVqzVSmMDm/G+1mM1hkPbH7KICaU9/6SFotSYrteOH42Y+hA6ldp34o6yzmDo
         oHnwBtmHUwkhBTJxJuZgUJzpZmPbcdsrqAX0OtCSGx2kTAyy5n6XtEjbnAdzsXKXup+m
         uCPrWpf9cAEZwmDBIrhcy71UKRXG9yhTA2rdxCVZAq4h1uMEF0YeFOrxI0xKcpEPjku5
         Uk1y7rAO4i1a84m1WFyErBN1YE0CPYkt+jG0EG9QG43MvrG7p7QaLNc+11f7HPOG6/v7
         Xe2sDk5Kc8YJF2tGShhbj+FC/MBbuyuOtwIKn8Mh8/KY1W8uLwlQ+XdP1gC7V92WXiuu
         s3zg==
X-Gm-Message-State: ALKqPwfu+iOGBHvpSh3C028riegbG5YhVj6RVjNd22EFbNeSTcvi/22s
        zOwizwEwiAb9WdfVOeZkFY/HqA==
X-Google-Smtp-Source: AB8JxZqZsemCDh6sF1HAr1BnWpras/puJiy8co1gGVmZ5efZClBAzo8L7YBUwNeE1K7HXsnkvQOw3w==
X-Received: by 2002:a62:8b92:: with SMTP id e18-v6mr23390061pfl.60.1526982782364;
        Tue, 22 May 2018 02:53:02 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li1170-132.members.linode.com. [45.79.71.132])
        by smtp.gmail.com with ESMTPSA id n19-v6sm10487853pgv.89.2018.05.22.02.52.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 02:53:00 -0700 (PDT)
Date:   Tue, 22 May 2018 17:52:49 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Robert Walker <robert.walker@arm.com>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tor Jeremiassen <tor@ti.com>,
        mike.leach@linaro.org, kim.phillips@arm.com,
        coresight@lists.linaro.org, Mike Leach <mike.leach@arm.com>
Subject: Re: [RFT v2 1/4] perf cs-etm: Generate sample for missed packets
Message-ID: <20180522095249.GE31075@leoy-ThinkPad-X240s>
References: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
 <1526892748-326-2-git-send-email-leo.yan@linaro.org>
 <bc320d6d-a21d-b5a4-e30d-511bb69aba32@arm.com>
 <20180522083920.GD31075@leoy-ThinkPad-X240s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180522083920.GD31075@leoy-ThinkPad-X240s>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 22, 2018 at 04:39:20PM +0800, Leo Yan wrote:

[...]

Rather than the patch I posted in my previous email, I think below new
patch is more reasonable for me.

In the below change, 'etmq->prev_packet' is only used to store the
previous CS_ETM_RANGE packet, we don't need to save CS_ETM_TRACE_ON
packet into 'etmq->prev_packet'.

On the other hand, cs_etm__flush() can use 'etmq->period_instructions'
to indicate if need to generate instruction sample or not.  If it's
non-zero, then generate instruction sample and
'etmq->period_instructions' will be cleared; so next time if there
have more tracing CS_ETM_TRACE_ON packet, it can skip to generate
instruction sample due 'etmq->period_instructions' is zero.

How about you think for this?

Thanks,
Leo Yan


diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 822ba91..dd354ad 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -495,6 +495,13 @@ static inline void cs_etm__reset_last_branch_rb(struct cs_etm_queue *etmq)
 static inline u64 cs_etm__last_executed_instr(struct cs_etm_packet *packet)
 {
 	/*
+	 * The packet is the start tracing packet if the end_addr is zero,
+	 * returns 0 for this case.
+	 */
+	if (!packet->end_addr)
+		return 0;
+
+	/*
 	 * The packet records the execution range with an exclusive end address
 	 *
 	 * A64 instructions are constant size, so the last executed
@@ -897,13 +904,27 @@ static int cs_etm__sample(struct cs_etm_queue *etmq)
 		etmq->period_instructions = instrs_over;
 	}
 
-	if (etm->sample_branches &&
-	    etmq->prev_packet &&
-	    etmq->prev_packet->sample_type == CS_ETM_RANGE &&
-	    etmq->prev_packet->last_instr_taken_branch) {
-		ret = cs_etm__synth_branch_sample(etmq);
-		if (ret)
-			return ret;
+	if (etm->sample_branches && etmq->prev_packet) {
+		bool generate_sample = false;
+
+		/* Generate sample for start tracing packet */
+		if (etmq->prev_packet->sample_type == 0)
+			generate_sample = true;
+
+		/* Generate sample for exception packet */
+		if (etmq->prev_packet->exc == true)
+			generate_sample = true;
+
+		/* Generate sample for normal branch packet */
+		if (etmq->prev_packet->sample_type == CS_ETM_RANGE &&
+		    etmq->prev_packet->last_instr_taken_branch)
+			generate_sample = true;
+
+		if (generate_sample) {
+			ret = cs_etm__synth_branch_sample(etmq);
+			if (ret)
+				return ret;
+		}
 	}
 
 	if (etm->sample_branches || etm->synth_opts.last_branch) {
@@ -922,11 +943,12 @@ static int cs_etm__sample(struct cs_etm_queue *etmq)
 static int cs_etm__flush(struct cs_etm_queue *etmq)
 {
 	int err = 0;
-	struct cs_etm_packet *tmp;
 
 	if (etmq->etm->synth_opts.last_branch &&
 	    etmq->prev_packet &&
-	    etmq->prev_packet->sample_type == CS_ETM_RANGE) {
+	    etmq->prev_packet->sample_type == CS_ETM_RANGE &&
+	    etmq->period_instructions) {
+
 		/*
 		 * Generate a last branch event for the branches left in the
 		 * circular buffer at the end of the trace.
@@ -940,14 +962,6 @@ static int cs_etm__flush(struct cs_etm_queue *etmq)
 			etmq, addr,
 			etmq->period_instructions);
 		etmq->period_instructions = 0;
-
-		/*
-		 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for
-		 * the next incoming packet.
-		 */
-		tmp = etmq->packet;
-		etmq->packet = etmq->prev_packet;
-		etmq->prev_packet = tmp;
 	}
 
 	return err;
-- 
2.7.4
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
