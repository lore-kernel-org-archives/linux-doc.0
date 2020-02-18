Return-Path: <SRS0=SFNS=4G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C07C34026
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 10:32:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B482206E2
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582021944;
	bh=HL6FuYpUCd5fooRPcAxppl2YQWgXiX08Aex1H5dA6i8=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=CxO961lhOnT0IRlrJ7h3MKi+38/CExFZoiSAUkUDeGAnwS6sPXVNYVmDP3BAzSa25
	 e1GtprY1iVSMQBthtP2mjGbJxY2nEq0vzBWTg5HH18PoJg9JYh6J3eIdhdg939GpkG
	 eDRdmX1gCPfpxNNLcbwYXpHxk0vVHfAbcPq11FTE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgBRKcX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Feb 2020 05:32:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:45754 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgBRKcX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Feb 2020 05:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=DyM7bPm9c7SWdeOl1ONP7XdySOkAcNLEYgls42uNJOI=; b=Ba3GFu8gJntdWYv0NV/1/qRikG
        3EW+OPPGIUrNTL7EuGU2Y+P9tktNYiR8dL1SkiMyB1dS4TJiKSTpiMfEIp3W2zQi9uYTi9xzeKoVR
        4mx5PkQgAglYtrjo+JNz8GDBd9ZC6uayJ5sLVGWXD6CTrgHsbCzo/3BkGrpHekHANvvI9+wuLryk2
        IrlUZB6HzJxNOebljkcXfpJTjU3SKQ/UI1odJmBC2Q557e+OeSKSv/zZnAZxSMN8Q5mefU2fC2FvV
        7Arr1F29rKWJmqw0Sdoo/njOV1JeWgCh5gexD74cL7I3OSxDdxMW+4M8ATeDgadEj57LA7Jt+iZ7I
        qbe6U9WQ==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j40Aw-0007dW-V4; Tue, 18 Feb 2020 10:32:23 +0000
Date:   Tue, 18 Feb 2020 11:32:19 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: "staging" area for unsorted random files under Documentation/*.rst
Message-ID: <20200218113219.7b7cc460@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

We already discussed this matter previously, but we end not doing any changes
yet.

I'm about to finish the conversion of the remaining text files to ReST.
Skipping translations and a few exceptions, after my patch series
(pending merge), there are now only ~50 remaining files[1].

Yet, we still have ~80 files already converted but not renamed, as
Documentation/*.txt files.

Shifting those around is not easy (I tried a few times), as some discussions
are required in order to get them at their rightful places.

So, my current proposal is to just rename them to *.rst, keeping them
where they are, and adding them into an "staging" area at the main
index.rst. See the enclosed patch.

Then, once we finish the conversion, we may come up with some patches
moving them to better places.

What do you think?

[1] considering my tree (based on next-20200217) at:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=all_docs_merged

	HTML output: https://www.infradead.org/~mchehab/kernel_docs/

And running this small script that should get rid of (most) false positives:

$ dirname $(find Documentation/ -type f|grep -vE '\.(rst|svg|dot|py|awk|sh|pl|gitignore|S|yaml|c|inf|vim|modes)'|grep -vE '(Makefile|Kconfig|LICENSE|COPYING-logo|ChangeLog|CREDITS)'|grep -v devicetree/bindings|grep -vE 'Documentation/(ABI|features|output|SubmittingPatches|CodingStyle|logo.gif|dontdiff|sphinx/requirements.txt|admin-guide/kdump/gdbmacros.txt|admin-guide/aoe/udev.txt|EDID/hex|netlabel/draft-ietf-cipso-ipsecurity-01.txt|firmware_class/hotplug-script|target/target-export-device|networking/mac80211-auth-assoc-deauth.txt|sparc/oradax/dax-hv-api.txt)'|grep -v translations)|sort|uniq -c|sort -n
$ echo -n "Total: "
$ dirname $(find Documentation/ -type f|grep -vE '\.(rst|svg|dot|py|awk|sh|pl|gitignore|S|yaml|c|inf|vim|modes)'|grep -vE '(Makefile|Kconfig|LICENSE|COPYING-logo|ChangeLog|CREDITS)'|grep -v devicetree/bindings|grep -vE 'Documentation/(ABI|features|output|SubmittingPatches|CodingStyle|logo.gif|dontdiff|sphinx/requirements.txt|admin-guide/kdump/gdbmacros.txt|admin-guide/aoe/udev.txt|EDID/hex|netlabel/draft-ietf-cipso-ipsecurity-01.txt|firmware_class/hotplug-script|target/target-export-device|networking/mac80211-auth-assoc-deauth.txt|sparc/oradax/dax-hv-api.txt)'|grep -v translations)|wc -l

      1 Documentation/filesystems/cifs
      1 Documentation/filesystems/configfs
      1 Documentation/scsi
      1 Documentation/virt/kvm/devices
      2 Documentation/admin-guide
      3 Documentation
      6 Documentation/devicetree
      6 Documentation/filesystems/caching
      8 Documentation/RCU
     21 Documentation/filesystems
Total: 50

Once we get this series merged, I'm planning to prepare and submit a second
series doing the conversion for the other ~20 filesystem files.

Btw, if you want to look how things will become after my patch series,
I'm keeping a html build after all my patch series at:

	https://www.infradead.org/~mchehab/kernel_docs/

Cheers,
Mauro

docs: place random ReST files at the index.rst
    
There are several ReST documents that are currently at the main
Documentation/ directory, with .txt extension.
    
That's bad, because:
    
- It is a bad example: people keep adding new .txt files
  inside Documentation/;
- Any efforts of detecting files that still require conversion
  would need to explicitly exclude those.
    
While not ideal, for now let's just place those files on
some place inside index.rst. We can later move them to
other places.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/index.rst b/Documentation/index.rst
index e99d0bd2589d..9a512600c95c 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -186,6 +186,53 @@ Translations
 
    translations/index
 
+Unsorted random documents
+-------------------------
+
+.. toctree::
+   :maxdepth: 2
+
+   DMA-API
+   DMA-API-HOWTO
+   DMA-ISA-LPC
+   DMA-attributes
+   IPMI
+   IRQ
+   IRQ-affinity
+   IRQ-domain
+   bus-virt-phys-mapping
+   crc32
+   debugging-modules
+   debugging-via-ohci1394
+   digsig
+   futex-requeue-pi
+   hwspinlock
+   io-mapping
+   io_ordering
+   irqflags-tracing
+   kobject
+   kprobes
+   kref
+   lzo
+   mailbox
+   nommu-mmap
+   percpu-rw-semaphore
+   pi-futex
+   preempt-locking
+   rbtree
+   remoteproc
+   robust-futex-ABI
+   robust-futexes
+   rpmsg
+   speculation
+   static-keys
+   tee
+   this_cpu_ops
+   unaligned-memory-access
+   watch_queue
+   xz
+
+
 Indices and tables
 ==================
 
diff --git a/Documentation/DMA-API-HOWTO.txt b/Documentation/DMA-API-HOWTO.rst
similarity index 100%
rename from Documentation/DMA-API-HOWTO.txt
rename to Documentation/DMA-API-HOWTO.rst
diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.rst
similarity index 100%
rename from Documentation/DMA-API.txt
rename to Documentation/DMA-API.rst
diff --git a/Documentation/DMA-ISA-LPC.txt b/Documentation/DMA-ISA-LPC.rst
similarity index 100%
rename from Documentation/DMA-ISA-LPC.txt
rename to Documentation/DMA-ISA-LPC.rst
diff --git a/Documentation/DMA-attributes.txt b/Documentation/DMA-attributes.rst
similarity index 100%
rename from Documentation/DMA-attributes.txt
rename to Documentation/DMA-attributes.rst
diff --git a/Documentation/IPMI.txt b/Documentation/IPMI.rst
similarity index 100%
rename from Documentation/IPMI.txt
rename to Documentation/IPMI.rst
diff --git a/Documentation/IRQ-affinity.txt b/Documentation/IRQ-affinity.rst
similarity index 100%
rename from Documentation/IRQ-affinity.txt
rename to Documentation/IRQ-affinity.rst
diff --git a/Documentation/IRQ-domain.txt b/Documentation/IRQ-domain.rst
similarity index 100%
rename from Documentation/IRQ-domain.txt
rename to Documentation/IRQ-domain.rst
diff --git a/Documentation/IRQ.txt b/Documentation/IRQ.rst
similarity index 100%
rename from Documentation/IRQ.txt
rename to Documentation/IRQ.rst
diff --git a/Documentation/bus-virt-phys-mapping.txt b/Documentation/bus-virt-phys-mapping.rst
similarity index 100%
rename from Documentation/bus-virt-phys-mapping.txt
rename to Documentation/bus-virt-phys-mapping.rst
diff --git a/Documentation/crc32.txt b/Documentation/crc32.rst
similarity index 100%
rename from Documentation/crc32.txt
rename to Documentation/crc32.rst
diff --git a/Documentation/debugging-modules.txt b/Documentation/debugging-modules.rst
similarity index 100%
rename from Documentation/debugging-modules.txt
rename to Documentation/debugging-modules.rst
diff --git a/Documentation/debugging-via-ohci1394.txt b/Documentation/debugging-via-ohci1394.rst
similarity index 100%
rename from Documentation/debugging-via-ohci1394.txt
rename to Documentation/debugging-via-ohci1394.rst
diff --git a/Documentation/digsig.txt b/Documentation/digsig.rst
similarity index 100%
rename from Documentation/digsig.txt
rename to Documentation/digsig.rst
diff --git a/Documentation/futex-requeue-pi.txt b/Documentation/futex-requeue-pi.rst
similarity index 100%
rename from Documentation/futex-requeue-pi.txt
rename to Documentation/futex-requeue-pi.rst
diff --git a/Documentation/hwspinlock.txt b/Documentation/hwspinlock.rst
similarity index 100%
rename from Documentation/hwspinlock.txt
rename to Documentation/hwspinlock.rst
diff --git a/Documentation/io-mapping.txt b/Documentation/io-mapping.rst
similarity index 100%
rename from Documentation/io-mapping.txt
rename to Documentation/io-mapping.rst
diff --git a/Documentation/io_ordering.txt b/Documentation/io_ordering.rst
similarity index 100%
rename from Documentation/io_ordering.txt
rename to Documentation/io_ordering.rst
diff --git a/Documentation/irqflags-tracing.txt b/Documentation/irqflags-tracing.rst
similarity index 100%
rename from Documentation/irqflags-tracing.txt
rename to Documentation/irqflags-tracing.rst
diff --git a/Documentation/kobject.txt b/Documentation/kobject.rst
similarity index 100%
rename from Documentation/kobject.txt
rename to Documentation/kobject.rst
diff --git a/Documentation/kprobes.txt b/Documentation/kprobes.rst
similarity index 100%
rename from Documentation/kprobes.txt
rename to Documentation/kprobes.rst
diff --git a/Documentation/kref.txt b/Documentation/kref.rst
similarity index 100%
rename from Documentation/kref.txt
rename to Documentation/kref.rst
diff --git a/Documentation/lzo.txt b/Documentation/lzo.rst
similarity index 100%
rename from Documentation/lzo.txt
rename to Documentation/lzo.rst
diff --git a/Documentation/mailbox.txt b/Documentation/mailbox.rst
similarity index 100%
rename from Documentation/mailbox.txt
rename to Documentation/mailbox.rst
diff --git a/Documentation/nommu-mmap.txt b/Documentation/nommu-mmap.rst
similarity index 100%
rename from Documentation/nommu-mmap.txt
rename to Documentation/nommu-mmap.rst
diff --git a/Documentation/percpu-rw-semaphore.txt b/Documentation/percpu-rw-semaphore.rst
similarity index 100%
rename from Documentation/percpu-rw-semaphore.txt
rename to Documentation/percpu-rw-semaphore.rst
diff --git a/Documentation/pi-futex.txt b/Documentation/pi-futex.rst
similarity index 100%
rename from Documentation/pi-futex.txt
rename to Documentation/pi-futex.rst
diff --git a/Documentation/preempt-locking.txt b/Documentation/preempt-locking.rst
similarity index 100%
rename from Documentation/preempt-locking.txt
rename to Documentation/preempt-locking.rst
diff --git a/Documentation/rbtree.txt b/Documentation/rbtree.rst
similarity index 100%
rename from Documentation/rbtree.txt
rename to Documentation/rbtree.rst
diff --git a/Documentation/remoteproc.txt b/Documentation/remoteproc.rst
similarity index 100%
rename from Documentation/remoteproc.txt
rename to Documentation/remoteproc.rst
diff --git a/Documentation/robust-futex-ABI.txt b/Documentation/robust-futex-ABI.rst
similarity index 100%
rename from Documentation/robust-futex-ABI.txt
rename to Documentation/robust-futex-ABI.rst
diff --git a/Documentation/robust-futexes.txt b/Documentation/robust-futexes.rst
similarity index 100%
rename from Documentation/robust-futexes.txt
rename to Documentation/robust-futexes.rst
diff --git a/Documentation/rpmsg.txt b/Documentation/rpmsg.rst
similarity index 100%
rename from Documentation/rpmsg.txt
rename to Documentation/rpmsg.rst
diff --git a/Documentation/speculation.txt b/Documentation/speculation.rst
similarity index 100%
rename from Documentation/speculation.txt
rename to Documentation/speculation.rst
diff --git a/Documentation/static-keys.txt b/Documentation/static-keys.rst
similarity index 100%
rename from Documentation/static-keys.txt
rename to Documentation/static-keys.rst
diff --git a/Documentation/tee.txt b/Documentation/tee.rst
similarity index 100%
rename from Documentation/tee.txt
rename to Documentation/tee.rst
diff --git a/Documentation/this_cpu_ops.txt b/Documentation/this_cpu_ops.rst
similarity index 100%
rename from Documentation/this_cpu_ops.txt
rename to Documentation/this_cpu_ops.rst
diff --git a/Documentation/unaligned-memory-access.txt b/Documentation/unaligned-memory-access.rst
similarity index 100%
rename from Documentation/unaligned-memory-access.txt
rename to Documentation/unaligned-memory-access.rst
diff --git a/Documentation/xz.txt b/Documentation/xz.rst
similarity index 100%
rename from Documentation/xz.txt
rename to Documentation/xz.rst
