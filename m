Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A6B967D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 17:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390646AbfJ1Rhk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 13:37:40 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:40816 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfJ1Rhk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 13:37:40 -0400
Received: by mail-wr1-f52.google.com with SMTP id o28so10810885wro.7
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 10:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2SiZMVwNGdBFDFalmK5dlVXcrMq3o6OlXO+gfsRiGZU=;
        b=uIs9Rxa4/NK425PHq++OSgPzLfT/QcIyGYssEvBJe9h0Zx4+fQdjEwIR31a1IakMMu
         5LWgzYALUT9C1QjNhb2PlmHY5/Lh4PEXRYoM0qR6rzAASYHdVEeqAbok497UrSUoO9J1
         TaPTtxE+rynxm9j60WEPCoRMkh2H12Y6CgNYBTqXvHNUmKWHTMx6IvMS75XhW6ITMJWM
         c3ZifAsexnsjn+rfuVoIYxr3f+WZiAM1RJ8ORmtAOKjgMQeLAEnYctUl9G6l4wwPtDQO
         FFNQhgJnpGjK/FSbjFzJN27+4kbAEt6bKeOBbnM5lXPSPAG/Z3Q0JxZTj28a/npSKGUa
         aGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2SiZMVwNGdBFDFalmK5dlVXcrMq3o6OlXO+gfsRiGZU=;
        b=QuJxEKMa3pBlm6auFbFRJRmz5SpFrwjNvFAwAZBaWkoNWK5iIGz/EN+biPntQLTp0c
         CPPS9mMwRqe5JDvIp6686XIfLurtlxfbyZmyluBk3OeY+jlnOMrsxHGfW9ZXKfQbm58N
         n1zvbq6CgKe1KZmdTCpVtTsmwOv/4wzFADs+ZhqQv0ebl37+swgwWqVpV5ggmvtbiaPM
         GUvnZP3a6GOEWbOOLHcIER6sB+x0KE6DB9Z+lqaY8uC9wp5E/G1JTP5dYt1qfiJVrWR2
         rHM2eMEdwfNnD7EXEbPtrCEKxushaBQ3IUFN9jGdbW4fntdKhX9cKUOps8r5RcCl0Z2O
         CQkw==
X-Gm-Message-State: APjAAAVEnLufqEXfPJ15vYD+aXSka9ZAmkoidQK8aXbq/kiZ8kDzuEAF
        R+CqRcKUoi+BvEnPefrI+h9nJ4HeQd4=
X-Google-Smtp-Source: APXvYqwTIAoRe4mOhWOtS2v7+B/Wsrfzc4FoEWReyU0fu2G97BN9jIJ4BBBFcmtjBhLMB4DfjZCCjA==
X-Received: by 2002:adf:8123:: with SMTP id 32mr14918903wrm.300.1572283772713;
        Mon, 28 Oct 2019 10:29:32 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:a072:1d10:8dba:cbb])
        by smtp.gmail.com with ESMTPSA id r19sm14273295wrr.47.2019.10.28.10.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 10:29:32 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     mathieu.poirier@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 1/4] coresight: etm4x: docs: Update ABI doc for new sysfs name scheme.
Date:   Mon, 28 Oct 2019 17:29:16 +0000
Message-Id: <20191028172919.19662-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028172919.19662-1-mike.leach@linaro.org>
References: <20191028172919.19662-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Recent updates to CoreSight drivers have changed the component naming
schema used in sysfs.

This updates the ABI document to reflect the new naming schema.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../testing/sysfs-bus-coresight-devices-etm4x | 136 +++++++++---------
 1 file changed, 68 insertions(+), 68 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
index 36258bc1b473..9290010e973e 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
@@ -1,4 +1,4 @@
-What:		/sys/bus/coresight/devices/<memory_map>.etm/enable_source
+What:		/sys/bus/coresight/devices/etm<N>/enable_source
 Date:		April 2015
 KernelVersion:  4.01
 Contact:        Mathieu Poirier <mathieu.poirier@linaro.org>
@@ -8,82 +8,82 @@ Description:	(RW) Enable/disable tracing on this specific trace entiry.
 		of coresight components linking the source to the sink is
 		configured and managed automatically by the coresight framework.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/cpu
+What:		/sys/bus/coresight/devices/etm<N>/cpu
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) The CPU this tracing entity is associated with.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_pe_cmp
+What:		/sys/bus/coresight/devices/etm<N>/nr_pe_cmp
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates the number of PE comparator inputs that are
 		available for tracing.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_addr_cmp
+What:		/sys/bus/coresight/devices/etm<N>/nr_addr_cmp
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates the number of address comparator pairs that are
 		available for tracing.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_cntr
+What:		/sys/bus/coresight/devices/etm<N>/nr_cntr
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates the number of counters that are available for
 		tracing.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_ext_inp
+What:		/sys/bus/coresight/devices/etm<N>/nr_ext_inp
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates how many external inputs are implemented.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/numcidc
+What:		/sys/bus/coresight/devices/etm<N>/numcidc
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates the number of Context ID comparators that are
 		available for tracing.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/numvmidc
+What:		/sys/bus/coresight/devices/etm<N>/numvmidc
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates the number of VMID comparators that are available
 		for tracing.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/nrseqstate
+What:		/sys/bus/coresight/devices/etm<N>/nrseqstate
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates the number of sequencer states that are
 		implemented.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_resource
+What:		/sys/bus/coresight/devices/etm<N>/nr_resource
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates the number of resource selection pairs that are
 		available for tracing.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/nr_ss_cmp
+What:		/sys/bus/coresight/devices/etm<N>/nr_ss_cmp
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Indicates the number of single-shot comparator controls that
 		are available for tracing.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/reset
+What:		/sys/bus/coresight/devices/etm<N>/reset
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(W) Cancels all configuration on a trace unit and set it back
 		to its boot configuration.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mode
+What:		/sys/bus/coresight/devices/etm<N>/mode
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
@@ -91,302 +91,302 @@ Description: 	(RW) Controls various modes supported by this ETM, for example
 		P0 instruction tracing, branch broadcast, cycle counting and
 		context ID tracing.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/pe
+What:		/sys/bus/coresight/devices/etm<N>/pe
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls which PE to trace.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/event
+What:		/sys/bus/coresight/devices/etm<N>/event
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls the tracing of arbitrary events from bank 0 to 3.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/event_instren
+What:		/sys/bus/coresight/devices/etm<N>/event_instren
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls the behavior of the events in bank 0 to 3.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/event_ts
+What:		/sys/bus/coresight/devices/etm<N>/event_ts
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls the insertion of global timestamps in the trace
 		streams.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/syncfreq
+What:		/sys/bus/coresight/devices/etm<N>/syncfreq
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls how often trace synchronization requests occur.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/cyc_threshold
+What:		/sys/bus/coresight/devices/etm<N>/cyc_threshold
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Sets the threshold value for cycle counting.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/bb_ctrl
+What:		/sys/bus/coresight/devices/etm<N>/bb_ctrl
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls which regions in the memory map are enabled to
 		use branch broadcasting.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/event_vinst
+What:		/sys/bus/coresight/devices/etm<N>/event_vinst
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls instruction trace filtering.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/s_exlevel_vinst
+What:		/sys/bus/coresight/devices/etm<N>/s_exlevel_vinst
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) In Secure state, each bit controls whether instruction
 		tracing is enabled for the corresponding exception level.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/ns_exlevel_vinst
+What:		/sys/bus/coresight/devices/etm<N>/ns_exlevel_vinst
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) In non-secure state, each bit controls whether instruction
 		tracing is enabled for the corresponding exception level.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/addr_idx
+What:		/sys/bus/coresight/devices/etm<N>/addr_idx
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Select which address comparator or pair (of comparators) to
 		work with.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/addr_instdatatype
+What:		/sys/bus/coresight/devices/etm<N>/addr_instdatatype
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls what type of comparison the trace unit performs.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/addr_single
+What:		/sys/bus/coresight/devices/etm<N>/addr_single
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Used to setup single address comparator values.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/addr_range
+What:		/sys/bus/coresight/devices/etm<N>/addr_range
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Used to setup address range comparator values.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/seq_idx
+What:		/sys/bus/coresight/devices/etm<N>/seq_idx
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Select which sequensor.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/seq_state
+What:		/sys/bus/coresight/devices/etm<N>/seq_state
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Use this to set, or read, the sequencer state.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/seq_event
+What:		/sys/bus/coresight/devices/etm<N>/seq_event
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Moves the sequencer state to a specific state.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/seq_reset_event
+What:		/sys/bus/coresight/devices/etm<N>/seq_reset_event
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Moves the sequencer to state 0 when a programmed event
 		occurs.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/cntr_idx
+What:		/sys/bus/coresight/devices/etm<N>/cntr_idx
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Select which counter unit to work with.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/cntrldvr
+What:		/sys/bus/coresight/devices/etm<N>/cntrldvr
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) This sets or returns the reload count value of the
 		specific counter.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/cntr_val
+What:		/sys/bus/coresight/devices/etm<N>/cntr_val
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) This sets or returns the current count value of the
                 specific counter.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/cntr_ctrl
+What:		/sys/bus/coresight/devices/etm<N>/cntr_ctrl
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls the operation of the selected counter.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/res_idx
+What:		/sys/bus/coresight/devices/etm<N>/res_idx
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Select which resource selection unit to work with.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/res_ctrl
+What:		/sys/bus/coresight/devices/etm<N>/res_ctrl
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description: 	(RW) Controls the selection of the resources in the trace unit.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/ctxid_idx
+What:		/sys/bus/coresight/devices/etm<N>/ctxid_idx
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Select which context ID comparator to work with.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/ctxid_pid
+What:		/sys/bus/coresight/devices/etm<N>/ctxid_pid
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Get/Set the context ID comparator value to trigger on.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/ctxid_masks
+What:		/sys/bus/coresight/devices/etm<N>/ctxid_masks
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Mask for all 8 context ID comparator value
 		registers (if implemented).
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/vmid_idx
+What:		/sys/bus/coresight/devices/etm<N>/vmid_idx
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Select which virtual machine ID comparator to work with.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/vmid_val
+What:		/sys/bus/coresight/devices/etm<N>/vmid_val
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Get/Set the virtual machine ID comparator value to
 		trigger on.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/vmid_masks
+What:		/sys/bus/coresight/devices/etm<N>/vmid_masks
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(RW) Mask for all 8 virtual machine ID comparator value
 		registers (if implemented).
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcoslsr
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcoslsr
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the OS Lock Status Register (0x304).
 		The value it taken directly  from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpdcr
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpdcr
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Power Down Control Register
 		(0x310).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpdsr
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpdsr
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Power Down Status Register
 		(0x314).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trclsr
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trclsr
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the SW Lock Status Register
 		(0xFB4).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcauthstatus
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcauthstatus
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Authentication Status Register
 		(0xFB8).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcdevid
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcdevid
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Device ID Register
 		(0xFC8).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcdevtype
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcdevtype
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Device Type Register
 		(0xFCC).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpidr0
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpidr0
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Peripheral ID0 Register
 		(0xFE0).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpidr1
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpidr1
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Peripheral ID1 Register
 		(0xFE4).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpidr2
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpidr2
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Peripheral ID2 Register
 		(0xFE8).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcpidr3
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcpidr3
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the Peripheral ID3 Register
 		(0xFEC).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trcconfig
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trcconfig
 Date:		February 2016
 KernelVersion:	4.07
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the trace configuration register
 		(0x010) as currently set by SW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/mgmt/trctraceid
+What:		/sys/bus/coresight/devices/etm<N>/mgmt/trctraceid
 Date:		February 2016
 KernelVersion:	4.07
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Print the content of the trace ID register (0x040).
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr0
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr0
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Returns the tracing capabilities of the trace unit (0x1E0).
 		The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr1
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr1
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Returns the tracing capabilities of the trace unit (0x1E4).
 		The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr2
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr2
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
@@ -394,7 +394,7 @@ Description:	(R) Returns the maximum size of the data value, data address,
 		VMID, context ID and instuction address in the trace unit
 		(0x1E8).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr3
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr3
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
@@ -403,42 +403,42 @@ Description:	(R) Returns the value associated with various resources
 		architecture specification for more details (0x1E8).
 		The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr4
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr4
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Returns how many resources the trace unit supports (0x1F0).
 		The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr5
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr5
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Returns how many resources the trace unit supports (0x1F4).
 		The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr8
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr8
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Returns the maximum speculation depth of the instruction
 		trace stream. (0x180).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr9
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr9
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Returns the number of P0 right-hand keys that the trace unit
 		can use (0x184).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr10
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr10
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
 Description:	(R) Returns the number of P1 right-hand keys that the trace unit
 		can use (0x188).  The value is taken directly from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr11
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr11
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
@@ -446,7 +446,7 @@ Description:	(R) Returns the number of special P1 right-hand keys that the
 		trace unit can use (0x18C).  The value is taken directly from
 		the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr12
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr12
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
@@ -454,7 +454,7 @@ Description:	(R) Returns the number of conditional P1 right-hand keys that
 		the trace unit can use (0x190).  The value is taken directly
 		from the HW.
 
-What:		/sys/bus/coresight/devices/<memory_map>.etm/trcidr/trcidr13
+What:		/sys/bus/coresight/devices/etm<N>/trcidr/trcidr13
 Date:		April 2015
 KernelVersion:	4.01
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
-- 
2.17.1

