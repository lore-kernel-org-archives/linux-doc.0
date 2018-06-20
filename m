Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F01D7D09E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 01:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753879AbeFTBNF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 21:13:05 -0400
Received: from mail-qk0-f202.google.com ([209.85.220.202]:40064 "EHLO
        mail-qk0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753765AbeFTBMc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 21:12:32 -0400
Received: by mail-qk0-f202.google.com with SMTP id a16-v6so1397651qkb.7
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 18:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:in-reply-to:message-id:references:subject:from:to
         :cc;
        bh=IU0qiFbshDMkhEWSuAz7QUUDqEE8BqN5PAyO7a+4oWE=;
        b=POfd/5b7m5Fqo5J7Wc6eotqbAdEq7kjghp4Dvuut3zp4zzPza8A4s/WN9B3K3Li1/0
         YLURlvARQmMzz0TD5RysEvp3UACPs9X+hTonZ0eqqRdoc++V5yLdkPiciQqlQ3wTRzr8
         Sgd+F0/ruSqfZX+i1H/QbrCmrXsnEFOh5kTOKYWIaqIK+qipS9Laf7UVUOK0S7pDYMQX
         mEgH4fH6+DJjeZkwLoYVcKMRPGujCHXNoli73XD9FZOcVRyVT29NJpyjlNVoXRGHV7+E
         P+ebXdXrRZfm+XjUNdG9cE3WCibBEz3MEhH1LmijHJvYXDJi2MCkirHRSngZd6lGUdDs
         BsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id
         :references:subject:from:to:cc;
        bh=IU0qiFbshDMkhEWSuAz7QUUDqEE8BqN5PAyO7a+4oWE=;
        b=In096zHPPt2SUvTEkGN43a+INOkugr69L1uBcatFjJmsA7wwII+acDawTaDm8nbS5e
         8mb6ykyIsq2Iwu4qm5+fQou9LcEKKl93mujgEytgek77bMm6Ou+xYmH+jWWLy7l2v/lc
         dbUr6Jd5C/AE6V/As99i54sRR6tJM2zX8RO2ItacliJEKv8Hcigwc3TzgvG9CwXEW1fP
         YqHyOMCjp0Qde1cT9VRH7Kj6J+pB09sST2kJCkOkbVPzb6cALHh1TxeAknt1BGn7UzJw
         KR34luxCi7j1UVq5uyyo8J+vfNBMz2M6sZfUbY8hCmACTVU4hXP0loLXX61wK6DgciUE
         iPyg==
X-Gm-Message-State: APt69E39GkSle3GXScmqIJdc8EbJO/xgF5ZabyMzLyOvAX5QQdFZwq80
        jkDKZ5yC4ou90ob9oDObTTKMPz0UPx91
X-Google-Smtp-Source: ADUXVKLp6TDBco2Ge5W3CPvC7Jj3PkfzmybyfeGg1MRQIjghQEyKGmwGZw6OLxk9fegFeJnUCBBH3i2u2w2E
MIME-Version: 1.0
X-Received: by 2002:a0c:8b4a:: with SMTP id d10-v6mr10458257qvc.14.1529457151447;
 Tue, 19 Jun 2018 18:12:31 -0700 (PDT)
Date:   Tue, 19 Jun 2018 18:12:10 -0700
In-Reply-To: <20180620011210.254601-1-rajatja@google.com>
Message-Id: <20180620011210.254601-5-rajatja@google.com>
References: <20180619221651.GH33049@bhelgaas-glaptop.roam.corp.google.com> <20180620011210.254601-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc1.244.gcf134e6275-goog
Subject: [PATCH v3 5/5] Documentation/ABI: Add details of PCI AER statistics
From:   Rajat Jain <rajatja@google.com>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jes Sorensen <jsorensen@fb.com>,
        Kyle McMartin <jkkm@fb.com>, rajatxjain@gmail.com,
        helgaas@kernel.org
Cc:     Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the PCI AER statistics details to
Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
and provide a pointer to it in
Documentation/PCI/pcieaer-howto.txt

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: Add some more details, use decimal instead of hex

 .../testing/sysfs-bus-pci-devices-aer_stats   | 111 ++++++++++++++++++
 Documentation/PCI/pcieaer-howto.txt           |   5 +
 2 files changed, 116 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
new file mode 100644
index 000000000000..3ed5a682be87
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
@@ -0,0 +1,111 @@
+==========================
+PCIe Device AER statistics
+==========================
+These attributes show up under all the devices that are AER capable. These
+statistical counters indicate the errors "as seen/reported by the device".
+Note that this may mean that if an end point is causing problems, the AER
+counters may increment at its link partner (e.g. root port) because the
+errors will be "seen" / reported by the link partner and not the the
+problematic end point itself (which may report all counters as 0 as it never
+saw any problems).
+
+Where:		/sys/bus/pci/devices/<dev>/aer_stats/dev_total_cor_errs
+Date:		May 2018
+Kernel Version: 4.17.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of correctable errors seen and reported by this
+		PCI device using ERR_COR.
+
+Where:		/sys/bus/pci/devices/<dev>/aer_stats/dev_total_fatal_errs
+Date:		May 2018
+Kernel Version: 4.17.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of uncorrectable fatal errors seen and reported
+		by this PCI device using ERR_FATAL.
+
+Where:		/sys/bus/pci/devices/<dev>/aer_stats/dev_total_nonfatal_errs
+Date:		May 2018
+Kernel Version: 4.17.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of uncorrectable non-fatal errors seen and reported
+		by this PCI device using ERR_NONFATAL.
+
+Where:		/sys/bus/pci/devices/<dev>/aer_stats/dev_breakdown_correctable
+Date:		May 2018
+Kernel Version: 4.17.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Breakdown of correctable errors seen and reported by this
+		PCI device using ERR_COR. Note that the sum total of all errors
+		in dev_breakdown_correctable may exceed dev_total_cor_errs
+		because a device is allowed to merge multiple correctable and
+		send a single ERR_COR for them (which is what dev_total_cor_errs
+		counts). A sample output for this attribute looks like this:
+-----------------------------------------
+Receiver Error = 174
+Bad TLP = 19
+Bad DLLP = 3
+RELAY_NUM Rollover = 0
+Replay Timer Timeout = 1
+Advisory Non-Fatal = 0
+Corrected Internal Error = 0
+Header Log Overflow = 0
+-----------------------------------------
+
+Where:		/sys/bus/pci/devices/<dev>/aer_stats/dev_breakdown_uncorrectable
+Date:		May 2018
+Kernel Version: 4.17.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Breakdown of of correctable errors seen and reported by this
+		PCI device using ERR_FATAL or ERR_NONFATAL. Note that the sum
+		total of all errors in dev_breakdown_uncorrectable may exceed
+		(dev_total_fatal_errs + dev_total_nonfatal_errs) because a
+		device is allowed to merge multiple errors at the same severity
+		and send a single ERR_FATAL/ERR_NON_FATAL for them.
+		A sample output for this attribute looks like this:
+-----------------------------------------
+Undefined = 0
+Data Link Protocol = 0
+Surprise Down Error = 0
+Poisoned TLP = 0
+Flow Control Protocol = 0
+Completion Timeout = 0
+Completer Abort = 0
+Unexpected Completion = 0
+Receiver Overflow = 0
+Malformed TLP = 0
+ECRC = 0
+Unsupported Request = 0
+ACS Violation = 0
+Uncorrectable Internal Error = 0
+MC Blocked TLP = 0
+AtomicOp Egress Blocked = 0
+TLP Prefix Blocked Error = 0
+-----------------------------------------
+
+============================
+PCIe Rootport AER statistics
+============================
+These attributes showup under only the rootports that are AER capable. These
+indicate the number of error messages as "reported to" the rootport. Please note
+that the rootports also transmit (internally) the ERR_* messages for errors seen
+by the internal rootport PCI device, so these counters includes them and are
+thus cumulative of all the error messages on the PCI hierarchy originating
+at that root port.
+
+Where:		/sys/bus/pci/devices/<dev>/aer_stats/rootport_total_cor_errs
+Date:		May 2018
+Kernel Version: 4.17.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of ERR_COR messages reported to rootport.
+
+Where:		/sys/bus/pci/devices/<dev>/aer_stats/rootport_total_fatal_errs
+Date:		May 2018
+Kernel Version: 4.17.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of ERR_FATAL messages reported to rootport.
+
+Where:	    /sys/bus/pci/devices/<dev>/aer_stats/rootport_total_nonfatal_errs
+Date:		May 2018
+Kernel Version: 4.17.0
+Contact:	linux-pci@vger.kernel.org, rajatja@google.com
+Description:	Total number of ERR_NONFATAL messages reported to rootport.
diff --git a/Documentation/PCI/pcieaer-howto.txt b/Documentation/PCI/pcieaer-howto.txt
index acd0dddd6bb8..91b6e677cb8c 100644
--- a/Documentation/PCI/pcieaer-howto.txt
+++ b/Documentation/PCI/pcieaer-howto.txt
@@ -73,6 +73,11 @@ In the example, 'Requester ID' means the ID of the device who sends
 the error message to root port. Pls. refer to pci express specs for
 other fields.
 
+2.4 AER Statistics / Counters
+
+When PCIe AER errors are captured, the counters / statistics are also exposed
+in form of sysfs attributes which are documented at
+Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
 
 3. Developer Guide
 
-- 
2.18.0.rc1.244.gcf134e6275-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
